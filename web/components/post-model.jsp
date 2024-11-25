<%-- 
    Document   : post-model
    Created on : Sep 18, 2024, 8:13:05 PM
    Author     : skm
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!--new modal-->


<!-- Button trigger modal -->




  <div class="modal fade" id="add-post-modal" tabindex="-1"  aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header text-center ">
                        <h5 class="modal-title fs-5  w-100" id="exampleModalLabel">Create Post</h5>
                        <button type="button" class="btn-close post-model-close" data-bs-dismiss="modal" aria-label="Close">
                            
                        </button>
                    </div>
                    <div class="modal-body">
                        <form id="add-post">
                            <div class="form-group">
                                <select name="cId" class="form-control"> 
                                    <option selected disabled>---select---</option>
                                    <% PostDao postdao = new PostDao(ConnectionProvider.getCon());
                                        ArrayList<Category> list = postdao.getAllCategories();
                                        for (Category c : list) {


                                    %>
                                    <option value="<%= c.getcId()%>"><%=c.getcName()%></option>
                                    <% }%>
                                </select>

                            </div>
                            <div class="form-group">
                                <input name="pTitle" type="text" placeholder="Enter post Title"  class="mt-2 form-control">
                            </div>
                            <div class="form-group">
                                <textarea name="pContent" placeholder="What's on your mind, <%=myuser.getName()%>?" class="mt-2 form-control" style="height: 150px"></textarea>

                            </div>
                            <div class="form-group">
                                <textarea name="pCode" class="mt-2 form-control" placeholder="Enter here code" style="height: 150px"></textarea>

                            </div>
                            <div class="mt-2" >
                                <label>
                                    select your pic:
                                </label>
                                <br>
                                <input name="pPic" type="file" >
                            </div>

                            <div class="container text-center">
                                <button type="submit "  class="mt-3 btn btn-primary form-control" >post</button>
                            </div>



                        </form>


                    </div>

                </div>
            </div>
        </div>