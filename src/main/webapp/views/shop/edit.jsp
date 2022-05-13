<%--
  Created by IntelliJ IDEA.
  User: thongpro
  Date: 3/31/22
  Time: 9:58 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt" %>

<div class="card">
    <div class="header">
        <h4 class="title">Quản lý cửa hàng</h4>
    </div>
    <div class="content">
        <form action="/Shop/update?id=${shop.id}" method="post">
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group">
                        <label>Chủ cửa hàng</label>
                        <select class="form-select" name="idchu">
                            <c:forEach items="${ dsChuCH }" var="chu">
                                <option ${shop.idChuCH.id==chu.id ? "selected" : ""} value="${ chu.id }">
                                        ${ chu.name }
                                </option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        <label>Tên Cửa Hàng</label>
                        <input type="text" class="form-control" placeholder="Tên Cửa Hàng" name="name" value="${shop.name}">
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="form-group">
                        <label>Địa chỉ</label>
                        <input type="text" class="form-control" placeholder="address" name="address" value="${shop.address}">
                    </div>
                </div>
            </div>
            <button  class="btn btn-success">Cập Nhật</button>
            <button type="reset" class="btn btn-primary">Làm Mới</button>
            <div class="clearfix"></div>
        </form>
    </div>
</div>




