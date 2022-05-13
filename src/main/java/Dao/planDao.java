package Dao;

import entitys.Plan;

import java.util.List;

public class planDao extends AbstractDao<Plan> implements DaoInterface<Plan>{
    @Override
    public Plan findById(Integer id) {
        return super.findById(Plan.class,id);
    }

    @Override
    public List<Plan> findAll() {
        return super.findAll(Plan.class,1);
    }

    public List<Plan> findByPlanCH(Integer id) {
        return super.findMany(Plan.class, "SELECT obj from Plan obj where obj.status!=0 AND obj.idCuaHang.id= ?0", id);
    }
}
