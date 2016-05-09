<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

        <nav class="navbar ">
            <div class="container-fluid">
                <div class="navbar-header">
                    
                    <a class="navbar-brand" href="index.jsp">IDIC</a>
                </div>
                <div class="collapse navbar-collapse" id="myNavbar">
                    <ul class="nav navbar-nav navbar-left">
                        
                        <li class="dropdown">
                            <a href="Generales.jsp"> <i class="fa fa-plug"></i> Sector Electricidad</a>
                            
                        </li>
                        <li class="dropdown">
                            <a class="dropdown-toggle" data-toggle="dropdown" href="#">Page 1
                            <span class="caret"></span></a>
                            <ul class="dropdown-menu">
                              <li><a href="#">Page 1-1</a></li>
                              <li><a href="#">Page 1-2</a></li>
                              <li><a href="#">Page 1-3</a></li> 
                            </ul>
                        </li>
                        
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        
                        <li><a href="#" data-toggle="modal" data-target="#mymodal"><i class="fa fa-sign-in fa-lg"></i> Login</a></li>

                    </ul>

                </div>
            </div>
        </nav>