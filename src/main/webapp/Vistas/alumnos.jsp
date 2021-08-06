
<%@page import="config.Conexion1"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="modelo.AlumnosDAO"%>
<%@page import="java.util.List"%>
<%@page import="modelo.Alumnos"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Alumnos</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" 
              integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

    </head>
    <body>
        <div class="principal container mt-1 mb-0 px-auto py-1 shadow-lg">
            <h2 class="display-3 d-block mx-auto text-white">Votación</h2>
            <div class="row featurette d-flex">
                <div class="container-fluid d-block col-md-7 my-3 p-0">
                    <h2 class="featurette-heading d-block mx-auto text-white">Anotate<br></br><span class="text-white d-block" id="movie-title">Manuelita</span></h2>
                    <form class="lead">
                        <div class="container">
                            <div class="row">
                                <table class="table table-dark table-bordered table-md table-hover rounded-pill mb-0">
                                    <thead class="table-light">
                                        <tr>
                                            <th>Nombre</th>
                                            <th>Apellido</th>
                                            <th>Email</th>
                                            <th>Accion</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%
                                            List<Alumnos> resultado = null;
                                            AlumnosDAO alumno = new AlumnosDAO();
                                            resultado = alumno.listarAlumnos();

                                            for (int i = 0; i < resultado.size(); i++) {
                                                String ruta = "AlumnosController?accion=modificar&id=" + resultado.get(i).getId();
                                                String rutaE = "AlumnosController?accion=eliminar&id=" + resultado.get(i).getId();
                                        %>
                                        <tr>
                                            <td class="align-middle"><%=resultado.get(i).getNombre()%></td>
                                            <td class="align-middle"><%=resultado.get(i).getApellido()%></td>
                                            <td class="align-middle"><%=resultado.get(i).getEmail()%></td>
                                            <td>
                                                <div class="btn-group btn-grupo-toggle" data-toggle="buttons">
                                                    <a class="btn btn-light px-4" href=<%=ruta%>>Modificar</a>
                                                    <a class="btn btn-light px-4" href=<%=rutaE%>>Eliminar</a>
                                                </div>
                                            </td>
                                        </tr>
                                    </tbody>
                                    <%
                                        }
                                    %>
                                </table>
                                <div class="btn-group btn-group-toggle my-0" data-toggle="buttons">
                                    <button type="submit" class="btn btn-dark align-middle">Somos todos!</button>
                                    <a class="btn btn-dark align-middle" href="AlumnosController?accion=nuevo">Agregar al grupo</a>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="d-block col-md-4 mx-auto my-auto p-4">
                    <!-- insertamos url -->
                    <img src="https://i.imgur.com/nUdu1KI.jpg" alt="Manuelita" class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid table-bordered shadow rounded mx-auto" id="image-title" width="300" height="300" focusable="false">
                </div>
            </div>
        </div>
    </body>
</html>