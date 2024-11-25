

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="css/mycss.css" rel="stylesheet" type="text/css"/>
        <!--bootstrap-->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <!--icon-->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            .mybanner{
             clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 79%, 81% 89%, 30% 91%, 0 100%, 0 0);
            }
        </style>
        
    </head>
    <body >
        <!--this is navbar-->
        <%@include file="mynavbar.jsp" %> 

        <!--banner-->
        <div class="container-fluid  p-0 m-0 mybanner ">
            <div class=" jumbotron myprimary )">
                <div class="container">

                    <h1 class="display-2">Welcome to InnoTech Community</h1>
                    <p>Computer programming or coding is the composition of sequences of instructions, called programs, that computers can follow to perform tasks.[1][2] It involves designing and implementing algorithms, step-by-step specifications of procedures,</p>
                    <p>Programmable devices have existed for centuries. As early as the 9th century, a programmable music sequencer was invented by the Persian Banu Musa brothers, who described an automated mechanical flute player in the Book of Ingenious Devices.</p>
                    <a  href="" class="btn btn-outline-light btn-lg" > <span class="fa fa-user-plus">&nbsp;</span>start it free!</a>
                    <a href="login_page.jsp" class="btn btn-outline-light btn-lg"> <span class="fa fa-user-circle-o fa-spin"></span>&nbsp;login</a>
                </div>
            </div> 
        </div>

   <!--card-->
   <div class="container">
       <div class="row">
           <!--card 1-->
           <div class="col-md-4">
               <div class="card" >

                   <div class="card-body">
                       <h5 class="card-title">Java Programming</h5>
                       <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                       <a href="#" class="btn myprimary">Read more</a>
                   </div>
               </div>
           </div>
            <div class="col-md-4">
               <div class="card" >

                   <div class="card-body">
                       <h5 class="card-title">Java Programming</h5>
                       <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                       <a href="#" class="btn myprimary">Read more</a>
                   </div>
               </div>
           </div>
            <div class="col-md-4">
               <div class="card" >

                   <div class="card-body">
                       <h5 class="card-title">Java Programming</h5>
                       <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                       <a href="#" class="btn myprimary">Read more</a>
                   </div>
               </div>
           </div>
           
       </div>
       <br>

       
       <!--row 2-->
       <div class="row">
           <!--card 1-->
           <div class="col-md-4">
               <div class="card" >

                   <div class="card-body">
                       <h5 class="card-title">Java Programming</h5>
                       <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                       <a href="#" class="btn myprimary">Read more</a>
                   </div>
               </div>
           </div>
            <div class="col-md-4">
               <div class="card" >

                   <div class="card-body">
                       <h5 class="card-title">Java Programming</h5>
                       <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                       <a href="#" class="btn myprimary">Read more</a>
                   </div>
               </div>
           </div>
            <div class="col-md-4">
               <div class="card" >

                   <div class="card-body">
                       <h5 class="card-title">Java Programming</h5>
                       <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                       <a href="#" class="btn myprimary">Read more</a>
                   </div>
               </div>
           </div>
           
       </div>
       </div>








        <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="js/myjs.js" type="text/javascript"></script>
        <script>
            $(document).ready(function () {
                console.log("page is ready for you");
            });
        </script>



    </body>
</html>
