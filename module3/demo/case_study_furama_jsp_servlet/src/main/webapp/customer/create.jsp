<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 10/2/2020
  Time: 11:24 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Create New Customer</title>

    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

    <style>
        body {
            color: #566787;
            background: #f5f5f5;
            font-family: 'Varela Round', sans-serif;
            font-size: 13px;
        }

        .table-responsive {
            margin: 30px 0;
        }

        .table-wrapper {
            background: #fff;
            padding: 20px 25px;
            border-radius: 3px;
            min-width: 1000px;
            box-shadow: 0 1px 1px rgba(0, 0, 0, .05);
        }

        .table-title {
            padding-bottom: 15px;
            background: #435d7d;
            color: #fff;
            padding: 16px 30px;
            min-width: 100%;
            margin: -20px -25px 10px;
            border-radius: 3px 3px 0 0;
        }

        .table-title h2 {
            margin: 5px 0 0;
            font-size: 24px;
        }

        .table-title .btn-group {
            float: right;
        }

        .table-title .btn {
            color: #fff;
            float: right;
            font-size: 13px;
            border: none;
            min-width: 50px;
            border-radius: 2px;
            border: none;
            outline: none !important;
            margin-left: 10px;
        }

        .table-title .btn i {
            float: left;
            font-size: 21px;
            margin-right: 5px;
        }

        .table-title .btn span {
            float: left;
            margin-top: 2px;
        }

        table.table tr th, table.table tr td {
            border-color: #e9e9e9;
            padding: 12px 15px;
            vertical-align: middle;
        }

        table.table tr th:first-child {
            width: 60px;
        }

        table.table tr th:last-child {
            width: 100px;
        }

        table.table-striped tbody tr:nth-of-type(odd) {
            background-color: #fcfcfc;
        }

        table.table-striped.table-hover tbody tr:hover {
            background: #f5f5f5;
        }

        table.table th i {
            font-size: 13px;
            margin: 0 5px;
            cursor: pointer;
        }

        table.table td:last-child i {
            opacity: 0.9;
            font-size: 22px;
            margin: 0 5px;
        }

        table.table td a {
            font-weight: bold;
            color: #566787;
            display: inline-block;
            text-decoration: none;
            outline: none !important;
        }

        table.table td a:hover {
            color: #2196F3;
        }

        table.table td a.edit {
            color: #FFC107;
        }

        table.table td a.delete {
            color: #F44336;
        }

        table.table td i {
            font-size: 19px;
        }

        table.table .avatar {
            border-radius: 50%;
            vertical-align: middle;
            margin-right: 10px;
        }

        .pagination {
            float: right;
            margin: 0 0 5px;
        }

        .pagination li a {
            border: none;
            font-size: 13px;
            min-width: 30px;
            min-height: 30px;
            color: #999;
            margin: 0 2px;
            line-height: 30px;
            border-radius: 2px !important;
            text-align: center;
            padding: 0 6px;
        }

        .pagination li a:hover {
            color: #666;
        }

        .pagination li.active a, .pagination li.active a.page-link {
            background: #03A9F4;
        }

        .pagination li.active a:hover {
            background: #0397d6;
        }

        .pagination li.disabled i {
            color: #ccc;
        }

        .pagination li i {
            font-size: 16px;
            padding-top: 6px
        }

        .hint-text {
            float: left;
            margin-top: 10px;
            font-size: 13px;
        }

        /* Custom checkbox */
        .custom-checkbox {
            position: relative;
        }

        .custom-checkbox input[type="checkbox"] {
            opacity: 0;
            position: absolute;
            margin: 5px 0 0 3px;
            z-index: 9;
        }

        .custom-checkbox label:before {
            width: 18px;
            height: 18px;
        }

        .custom-checkbox label:before {
            content: '';
            margin-right: 10px;
            display: inline-block;
            vertical-align: text-top;
            background: white;
            border: 1px solid #bbb;
            border-radius: 2px;
            box-sizing: border-box;
            z-index: 2;
        }

        .custom-checkbox input[type="checkbox"]:checked + label:after {
            content: '';
            position: absolute;
            left: 6px;
            top: 3px;
            width: 6px;
            height: 11px;
            border: solid #000;
            border-width: 0 3px 3px 0;
            transform: inherit;
            z-index: 3;
            transform: rotateZ(45deg);
        }

        .custom-checkbox input[type="checkbox"]:checked + label:before {
            border-color: #03A9F4;
            background: #03A9F4;
        }

        .custom-checkbox input[type="checkbox"]:checked + label:after {
            border-color: #fff;
        }

        .custom-checkbox input[type="checkbox"]:disabled + label:before {
            color: #b8b8b8;
            cursor: auto;
            box-shadow: none;
            background: #ddd;
        }

        /* Modal styles */
        .modal .modal-dialog {
            max-width: 400px;
        }

        .modal .modal-header, .modal .modal-body, .modal .modal-footer {
            padding: 20px 30px;
        }

        .modal .modal-content {
            border-radius: 3px;
            font-size: 14px;
        }

        .modal .modal-footer {
            background: #ecf0f1;
            border-radius: 0 0 3px 3px;
        }

        .modal .modal-title {
            display: inline-block;
        }

        .modal .form-control {
            border-radius: 2px;
            box-shadow: none;
            border-color: #dddddd;
        }

        .modal textarea.form-control {
            resize: vertical;
        }

        .modal .btn {
            border-radius: 2px;
            min-width: 100px;
        }

        .modal form label {
            font-weight: normal;
        }
    </style>
    <%--    <script>--%>
    <%--        $(document).ready(function () {--%>
    <%--            // Activate tooltip--%>
    <%--            $('[data-toggle="tooltip"]').tooltip();--%>

    <%--            // Select/Deselect checkboxes--%>
    <%--            var checkbox = $('table tbody input[type="checkbox"]');--%>
    <%--            $("#selectAll").click(function () {--%>
    <%--                if (this.checked) {--%>
    <%--                    checkbox.each(function () {--%>
    <%--                        this.checked = true;--%>
    <%--                    });--%>
    <%--                } else {--%>
    <%--                    checkbox.each(function () {--%>
    <%--                        this.checked = false;--%>
    <%--                    });--%>
    <%--                }--%>
    <%--            });--%>
    <%--            checkbox.click(function () {--%>
    <%--                if (!this.checked) {--%>
    <%--                    $("#selectAll").prop("checked", false);--%>
    <%--                }--%>
    <%--            });--%>
    <%--        });--%>
    <%--    </script>--%>

<body>
<a href="/customers"><h3 style="color: darkblue; margin-left: 30px"><strong><u>Home Page</u></strong></h3></a>
<label>
<%--    <input type="hidden" id="messageID" style="color: red; margin-left: 30px" value="${message}">--%>
</label>
<div class="container">
    <div class="table-wrapper">
        <div class="table-title">
            <div class="row">
                <div class="col-sm-6">
                    <h2>Manage <b>Customers</b></h2>
                </div>
                <div class="col-sm-6">
                    <a href="#addCustomerModal" id="onlickkk" class="btn btn-success" data-toggle="modal">
                        <i class="material-icons">&#xE147;</i>
                        <span>Add New Customer</span></a>
                </div>
            </div>
        </div>
        <table id="tableStudent" class="table table-striped table-hover">
            <thead>
            <tr>
                <th>Id</th>
                <th>Name</th>
                <th>Birthday</th>
                <th>Gender</th>
                <th>Id Card</th>
                <th>Phone</th>
                <th>Email</th>
                <th>Type Id</th>
                <th>Address</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="customer" items="${customerList}">
                <tr>
                    <td><c:out value="${customer.id}"></c:out></td>
                    <td><c:out value="${customer.customerName}"></c:out></td>
                    <td><c:out value="${customer.customerBirthday}"></c:out></td>
                    <td><c:out value="${customer.customerGender}"></c:out></td>
                    <td><c:out value="${customer.customerIdCard}"></c:out></td>
                    <td><c:out value="${customer.customerPhone}"></c:out></td>
                    <td><c:out value="${customer.customerEmail}"></c:out></td>
                    <td><c:out value="${customer.customerTypeId}"></c:out></td>
                    <td><c:out value="${customer.customerAddress}"></c:out></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>

<!-- Add Modal HTML -->
    <div id="addCustomerModal" class="modal fade">
        <div class="modal-dialog">
            <div class="modal-content">
                <form method="post">
                    <div class="modal-header">
                        <h4 class="modal-title">Add Customer</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    </div>

                    <div class="modal-body">
                        <div class="form-group">
                            <label>Id</label>
                            <input type="text" name="id" class="form-control">
                            <p id="idMessage">${message}</p>
                        </div>
                        <div class="form-group">
                            <label>Name</label>
                            <input type="text" name="customerName" class="form-control">
                        </div>
                        <div class="form-group">
                            <label>Birthday</label>
                            <input type="date" name="customerBirthday" class="form-control">
                        </div>
                        <div class="form-group">
                            <label>Gender</label>
                            <input type="text" name="customerGender" class="form-control">
                        </div>
                        <div class="form-group">
                            <label>Id Card</label>
                            <input type="text" name="customerIdCard" class="form-control">
                        </div>
                        <div class="form-group">
                            <label>Phone</label>
                            <input type="text" name="customerPhone" class="form-control">
                        </div>
                        <div class="form-group">
                            <label>Email</label>
                            <input type="email" name="customerEmail" class="form-control">
                        </div>
                        <div class="form-group">
                            <input type="hidden" name="action" value="create">
                            <label>Type Of Customer</label>
                            <select name="typeCustomerId" class="form-control">
                                <c:forEach var="typeCustomer" items="${typeCustomerList}">
                                    <option value="${typeCustomer.customerTypeId}">${typeCustomer.customerTypeName}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="form-group">
                            <label>Address</label>
                            <textarea class="form-control" name="customerAddress"></textarea>
                        </div>
                    </div>

                    <div class="modal-footer">
                        <input type="hidden" name="action" value="create">
                        <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                        <input type="submit" class="btn btn-success" value="Add">
                    </div>
                </form>
            </div>
        </div>
    </div>


<script src="../jquery/jquery-3.5.1.min.js"></script>
<script src="../datatables/js/jquery.dataTables.min.js"></script>
<script src="../datatables/js/dataTables.bootstrap4.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<script>
    $(document).ready(function () {
        $('#tableStudent').dataTable({
            "dom": 'lrtip',
            "lengthChange": false,
            "pageLength": 5
        });
    });
</script>

<script>
    let message = '<%=request.getAttribute("message")%>';
    // let message = document.getElementById("messageID").value;
    if (message !== "") {
        // alert(message);
        document.getElementById("onlickkk").click();
    }
</script>

<script>
    if (window.history.replaceState) {
        window.history.replaceState(null, null, window.location.href);
    }
</script>
</body>
</html>
