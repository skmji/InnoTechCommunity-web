<%-- 
    Document   : profile-model
    Created on : Sep 18, 2024, 8:09:39 PM
    Author     : skm
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
 <div class="modal fade" id="profile-modal" tabindex="-1"  aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg" >
                <div class="modal-content">
                    <div class="modal-header myprimary text-light">
                        <h5 class="modal-title fs-5 " id="exampleModalLabel">Profile</h5>
                        <button type="button" class="btn-close text-light" data-bs-dismiss="modal" aria-label="Close">
                           
                        </button>
                    </div>
                    <div class="modal-body">

                        <div  class=" container text-center">
                            <img src="pics/<%= myuser.getProfile()%>   " style='max-width:150px ;  border-radius:50%'    />

                            <h5 class="mt-2 mb-2 "><%= myuser.getName()%></h5>

                        </div>

                        <!--table data //-->
                        <div id="profile-detail" class="">
                            <table class="table">

                                <tbody>
                                    <tr>
                                        <th scope="row">Id: </th>
                                        <td><%= myuser.getId()%></td>

                                    </tr>
                                    <tr>
                                        <th scope="row">Gender: </th>
                                        <td><%= myuser.getGender()%></td>

                                    </tr>
                                    <tr>
                                        <th scope="row">Email: </th>
                                        <td><%= myuser.getEmail()%></td>

                                    </tr>
                                    <tr>
                                        <th scope="row">Status: </th>
                                        <td><%= myuser.getAbout()%></td>

                                    </tr>
                                    <tr>
                                        <th scope="row">Registered on: </th>
                                        <td><%= myuser.getDatetime().toString()%></td>

                                    </tr>
                                </tbody>
                            </table>
                        </div>

                        <!-- profile-edit-- ><!-- comment -->

                        <div id="profile-edit" style="display:none">
                            <h6 class="text-center text-danger  ">Carefully Edit profile</h6>
                            <form action="EditServlet" method="post" enctype="multipart/form-data">

                                <table class="table">
                                    <tr >

                                        <th>Id:</th>
                                        <td><%=myuser.getId()%></td>

                                    </tr>
                                    <tr>

                                        <th >Name:</th>
                                        <td><input type="text" class="form-control" name="user_name" value= "<%= myuser.getName()%>"  > </td>
                                    </tr>
                                    <tr>

                                        <th>Gender:</th>
                                        <td><%= myuser.getGender().toUpperCase()%>  </td>
                                    </tr>
                                    <tr>

                                        <th>Email:</th>
                                        <td><input type="email" class="form-control" name="user_email" value= "<%= myuser.getEmail()%>"  > </td>
                                    </tr>

                                    <tr>

                                        <th>About:</th>
                                        <td><textarea class="form-control" name="user_about"><%= myuser.getAbout()%></textarea> </td>
                                    </tr>
                                    <tr>

                                        <th>Profile:</th>
                                        <td><input type="file" name="user_pic" class="form-control"> </td>
                                    </tr>

                                </table>

                                <div class="container text-center">
                                    <button class="btn btn-outline-primary">Save</button>

                                </div>
                            </form>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="button" id="profile-btn" class="btn myprimary text-light">Edit</button>
                    </div>
                </div>
            </div>
        </div>