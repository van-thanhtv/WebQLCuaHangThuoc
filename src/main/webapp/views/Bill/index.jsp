<%--
  Created by IntelliJ IDEA.
  User: thanhkali
  Date: 5/9/22
  Time: 4:47 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="row">
    <div class="col-md-6">
        <div class="card">
            <div class="header">
                <h4 class="title">Temporary invoice table</h4>
                <p class="category">Danh sánh sản phẩm được thêm vào hóa đơn</p>
            </div>
            <div class="content table-responsive table-full-width mb-4">
                <table class="table table-hover ">
                    <thead>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Salary</th>
                    <th>Country</th>
                    <th>City</th>
                    </thead>
                    <tbody>
                    <tr>
                        <td>1</td>
                        <td>Dakota Rice</td>
                        <td>$36,738</td>
                        <td>Niger</td>
                        <td>Oud-Turnhout</td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
                <button type="submit" class="btn btn-info btn-fill pull-right">Create invoice</button>
    </div>

    <div class="col-md-6">
        <div class="card">
            <div class="header">
                <h4 class="title">Table on Drug</h4>
                <p class="category">Danh sánh thuốc đang có trong cửa hàng</p>
            </div>
            <div class="content table-responsive table-full-width">
                <table class="table table-hover table-striped">
                    <thead>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Salary</th>
                    <th>Country</th>
                    <th>City</th>
                    <th></th>
                    </thead>
                    <tbody>
                    <tr>
                        <td>1</td>
                        <td>Dakota Rice</td>
                        <td>$36,738</td>
                        <td>Niger</td>
                        <td>Oud-Turnhout</td>
                        <td><button class="btn btn-info">Thêm</button></td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <div class="col-md-12">
        <div class="card card-plain">
            <div class="header">
                <h4 class="title">Table on Bill</h4>
                <p class="category">Danh sánh hóa đơn đã được tạo</p>
            </div>
            <div class="content table-responsive table-full-width">
                <table class="table table-hover">
                    <thead>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Salary</th>
                    <th>Country</th>
                    <th>City</th>
                    </thead>
                    <tbody>
                    <tr>
                        <td>1</td>
                        <td>Dakota Rice</td>
                        <td>$36,738</td>
                        <td>Niger</td>
                        <td>Oud-Turnhout</td>
                    </tr>
                    </tbody>
                </table>

            </div>
        </div>
    </div>
</div>