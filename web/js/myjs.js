$(document).ready(function () {
    
    
  
    
    
    console.log("this is js page");


})

function doLike(pid,userId,el){
    
    function doLikeEffect() {
    // Simulate an AJAX request (you can replace this with your actual AJAX call)
    setTimeout(function() {
        // Toggle the heart icon's liked state using jQuery
        const heartIcon = $(el).find('.like-thumb');
        const likeCount = $(el).find('.like-counts');

        if (heartIcon.hasClass('liked')) {
            // If the heart is already liked, remove the liked state
            heartIcon.removeClass('liked');
            heartIcon.removeClass('fas').addClass('far'); // Change to outline heart

            // Update the like count
            likeCount.text(parseInt(likeCount.text()) - 1);
        } else {
            // If not liked, add the liked class and perform animation
            heartIcon.addClass('liked');
            heartIcon.removeClass('far').addClass('fas'); // Change to filled heart


            // Bounce animation after click
            //heartIcon.addClass('animate');

            // Update the like count
            likeCount.text(parseInt(likeCount.text()) + 1);
        }
    }, 200); // Simulate a short delay for the effect
}
    
    
   
    
//    let likeCount= $(el).find(".like-counts");
//    let heartIcon= $(el).find(".like-thumb");
    
    const p= {
        pid:pid,
        userId:userId,
        operation:"like"
    }
    
   $.ajax({
       url:"LikeServlet",
       data:p,
       success:function(data,textStatus, jqXHR){
           
         console.log(data);
         // console.log("liked");
         if(data.trim()=="true")
         {
             doLikeEffect();
          
            console.log("done...");
             
         }
         else{
             console.log("remove like...");
             doLikeEffect();
             
          
            
         }
         
         
       },
       error: function(jqXHR, textStatus, errorThrown){
           console.log("somthing went to worng");
       }
   })
    
}



function triggerToModal(id,title,content){
    console.log("i'm modal data sender");
    
    $("#post-id").val(id);
    $("#post-title").val(title);
    $("#post-content").val(content);
    
    console.log(id+ " " + title + " " + content);
     
    
    console.log("yes i'm call for inject value");
}


function postDelete(id){
    $.ajax({
        url: "PostDeleteServlet",
        data:{pid: id},
        success:function(data,textStatus,jqXHR){
            console.log("post delete");
            
        },
        error:function(jqXHR, textStatus, errorThrown){
            console.log("something went wrong to delete post");
            
        }
    })
}








function postUpdate(event) {
    event.preventDefault();
    
   
    // Prepare form data
    var formdata = new FormData($("#update-form").get(0));
    
     var postId =  formdata.get("pid");
    
    // Store post ID in localStorage
    localStorage.setItem('updatedPostId', postId);
    
    
    $.ajax({
        url: "AddPostServlet",
        type: "POST",
        data: formdata,
        processData: false,
        contentType: false,
        
        success: function (data, textStatus, jqXHR) {
            if (data.trim() === "done") {
                swal("Good job!", "Data inserted successfully", "success")
                .then(() => {
                    // Reload the page after form submission
                    location.reload();
                });
            } else if (data.trim() === "file_error") {
                swal("Oops...", "File not uploaded", "error");
            } else {
                swal("Oops...", "Something went wrong", "error");
            }
        },
        error: function (jqXHR, textStatus, errorThrown) {
            swal("Oops...", "Something went wrong", "error");
        }
    });
}

// Scroll to the updated post if found in localStorage
$(document).ready(function() {
    var postId = localStorage.getItem('updatedPostId');
    
    if (postId) {
        // Scroll to the post with the stored ID
        if ($('#' + postId).length) {
            $('html, body').animate({
                scrollTop: $('#' + postId).offset().top
            }, 1000); // Adjust the scrolling speed (in ms)
        }
        
        // Clear the localStorage item after scrolling
        localStorage.removeItem('updatedPostId');
    }
});
