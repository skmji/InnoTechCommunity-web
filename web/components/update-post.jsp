<!-- Button trigger modal -->


<!-- Modal -->
<div class="modal fade hide-modal" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header text-center">
        <h1 class="modal-title fs-5 w-100" id="exampleModalLabel">Edit Post</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
          <form id="update-form">
              <input type="text" name="pid" id="post-id" hidden/>
              <div class="form-group">
                  <input name="pTitle" id="post-title" type="text" placeholder="Enter post Title"  class=" mt-2 form-control">
              </div>
              <div class="form-group">
                  <textarea name="pContent" id="post-content" placeholder="enter post content" class="mt-2 form-control" style="height: 150px"></textarea>

              </div>
              <div class="form-group">
                  <textarea name="pCode" id="post-code" class="mt-2 form-control" placeholder="enter code" style="height: 150px"></textarea>

              </div>
              <div class="mt-2">
                  <label>
                      select you pic
                  </label>
                  <br>
                  <input name="pPic" type="file" >
              </div>

              <div class=" text-center mt-3">
                  <button type="submit " onclick="postUpdate(event)" class=" form-control btn btn-primary" >Save</button>
              </div>



          </form>
          
      </div>
     
    </div>
  </div>
</div>