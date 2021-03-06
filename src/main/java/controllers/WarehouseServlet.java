package controllers;

import Dao.*;
import entitys.*;
import org.apache.commons.beanutils.BeanUtils;
import utils.DateUtil;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@WebServlet({"/Warehouse/index", "/Warehouse/remove", "/Warehouse/sup", "/Warehouse/show", "/Warehouse/create", "/Warehouse/store", "/Warehouse/edit", "/Warehouse/update",})
public class WarehouseServlet extends HttpServlet {
    private drugDao drugDao;
    private warehouseDao warehouseDao;
    private detailedWarehouseDao detailedWarehouseDao;
    private ShopDao shopDao;
    List<DetailedWarehouse> listDetailWarehouseTam;

    public WarehouseServlet() {
        this.detailedWarehouseDao = new detailedWarehouseDao();
        this.drugDao = new drugDao();
        this.shopDao = new ShopDao();
        this.warehouseDao = new warehouseDao();
        this.listDetailWarehouseTam = new ArrayList<>();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String uri = request.getRequestURI();
        request.setAttribute("uri", 5);
        if (uri.contains("index")) {
            index(request, response);
        } else if (uri.contains("edit")) {
            edit(request, response);
        } else if (uri.contains("sup")) {
            this.sup(request, response);
        } else if (uri.contains("remove")) {
            this.deleteHD(request, response);
            //404
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html; charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        request.setAttribute("uri", 5);
        String uri = request.getRequestURI();
        if (uri.contains("store")) {
            store(request, response);
        } else if (uri.contains("show")) {
            this.show(request, response);
        }
    }

    private void index(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        listAll(request, response);
        request.setAttribute("view", "/views/warehouse/index.jsp");
        request.getRequestDispatcher("/views/layout.jsp").forward(request, response);
    }

    private void listAll(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Drug> drugList = this.drugDao.findAll();
        request.setAttribute("drugList", drugList);
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("sessionUser");
        if (user.getIsAdmin() == 1) {
            Shop shop = this.shopDao.findByIDchuCH(user.getId());
            List<Warehouse> listWarehouse = this.warehouseDao.findByWarehouseCH(shop.getId());
            request.setAttribute("dsWarehouse", listWarehouse);
        } else if (user.getIsAdmin() == 2) {
            Shop shop = this.shopDao.findByIDchuCH(user.getUserAdd());
            List<Warehouse> listWarehouse = this.warehouseDao.findByWarehouseCH(shop.getId());
            request.setAttribute("dsWarehouse", listWarehouse);
        }
        request.setAttribute("listDetailWarehouseTam", this.listDetailWarehouseTam);
    }

    private void edit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String strid = request.getParameter("id");
        int id = Integer.parseInt(strid);
        int check = 0;
        if (listDetailWarehouseTam.size() > 0) {
            for (DetailedWarehouse ct : this.listDetailWarehouseTam) {
                if (ct.getIdDrug().getId() == id) {
                    check++;
                    ct.setQuantity(ct.getQuantity() + 1);
                }
            }
        }
        if (check == 0) {
            DetailedWarehouse detailWarehouse = new DetailedWarehouse();
            Drug drug = this.drugDao.findById(id);
            detailWarehouse.setQuantity(1);
            detailWarehouse.setIdDrug(drug);
            this.listDetailWarehouseTam.add(detailWarehouse);
        }
        response.sendRedirect("/Warehouse/index");
    }

    private void deleteHD(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String s = request.getParameter("id");
        int id = Integer.parseInt(s);
        if (listDetailWarehouseTam.size() > 0) {
            for (DetailedWarehouse ct : this.listDetailWarehouseTam) {
                if (ct.getIdDrug().getId() == id) {
                    listDetailWarehouseTam.remove(ct);
                    break;
                }
            }
        }
        if (listDetailWarehouseTam.isEmpty()) {
            ;
            listDetailWarehouseTam.clear();
        }
        response.sendRedirect("/Warehouse/index");
    }


    private void store(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        try {
            Warehouse warehouse = new Warehouse();
            User user = (User) session.getAttribute("sessionUser");
            Shop shop = new Shop();
            if (user.getIsAdmin() == 1) {
                shop = this.shopDao.findByIDchuCH(user.getId());
            } else if (user.getIsAdmin() == 2) {
                shop = this.shopDao.findByIDchuCH(user.getUserAdd());
            }
            Warehouse warehouse1 = this.warehouseDao.findWarehouseUpdate(shop.getId());
            if (warehouse1 == null) {
                warehouse.setIdShop(shop);
                warehouse.setStatus(1);
                Warehouse soHD = this.warehouseDao.create(warehouse);
                for (DetailedWarehouse detailedWarehouse : this.listDetailWarehouseTam) {
                    detailedWarehouse.setIdWarehouse(soHD);
                    detailedWarehouse.setDateAdded(new Date(new java.util.Date().getTime()));
                    detailedWarehouse.setDateEnd(DateUtil.addDays(new java.util.Date(), detailedWarehouse.getIdDrug().getTerm()));
                    this.detailedWarehouseDao.create(detailedWarehouse);
                }
            } else {
                int check = 0;
                List<DetailedWarehouse> list = new ArrayList<>();
                List<DetailedWarehouse> detailedWarehouse = this.detailedWarehouseDao.findByIDWarehouse(warehouse1.getId());
                Warehouse ware= new Warehouse();
                for (DetailedWarehouse ct : this.listDetailWarehouseTam) {
                    for (DetailedWarehouse detail : detailedWarehouse) {
                        ware=detail.getIdWarehouse();
                        if (ct.getIdDrug().getId() == detail.getIdDrug().getId()) {
                            detail.setQuantity(detail.getQuantity() + ct.getQuantity());
                            detail.setDateAdded(new Date(new java.util.Date().getTime()));
                            detail.setDateEnd(DateUtil.addDays(new java.util.Date(), detail.getIdDrug().getTerm()));
                            list.add(detail);
                            check++;
                            this.detailedWarehouseDao.update(detail);
                        }
                    }
                }
                if (check!=this.listDetailWarehouseTam.size()){
                    List<DetailedWarehouse> ds = this.listDetailWarehouseTam;
                    for (DetailedWarehouse o: this.listDetailWarehouseTam) {
                        for (DetailedWarehouse op: list) {
                            if (o.getIdDrug().getId()==op.getIdDrug().getId()){
                                o.setId(op.getId());
                                ds.remove(o);
                            }
                        }
                    }
                    for (DetailedWarehouse o : ds) {
                        o.setIdWarehouse(ware);
                        o.setDateAdded(new Date(new java.util.Date().getTime()));
                        o.setDateEnd(DateUtil.addDays(new java.util.Date(), o.getIdDrug().getTerm()));
                        System.out.println(o.getIdWarehouse().getId());
                        this.detailedWarehouseDao.create(o);
                    }
                }
            }
            session.setAttribute("message", "Th??m M???i Th??nh C??ng");
            this.listDetailWarehouseTam.clear();
            response.sendRedirect("/Warehouse/index");
        } catch (Exception e) {
            session.setAttribute("error", "Th??m M???i Th???t B???i");
            response.sendRedirect("/Warehouse/index");
            e.printStackTrace();
        }
    }

    private void sup(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String s = request.getParameter("id");
        int id = Integer.parseInt(s);
        int check = 0;
        DetailedWarehouse entity = new DetailedWarehouse();
        if (listDetailWarehouseTam.size() > 0) {
            for (DetailedWarehouse ct : this.listDetailWarehouseTam) {
                if (ct.getIdDrug().getId() == id) {
                    ct.setQuantity(ct.getQuantity() - 1);
                    if (ct.getQuantity() <= 0) {
                        check++;
                        entity = ct;
                    }
                }
            }
        }
        if (check != 0) {
            this.listDetailWarehouseTam.remove(entity);
        }
        response.sendRedirect("/Warehouse/index");
    }


    private void show(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        List<DetailedWarehouse> detailedWarehouseList = this.detailedWarehouseDao.findByIDWarehouse(id);
        request.setAttribute("list", detailedWarehouseList);
        request.setAttribute("view", "/views/warehouse/detail.jsp");
        request.getRequestDispatcher("/views/layout.jsp").forward(request, response);

    }
}
