<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Covid Application</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="./css/style.css">
    <link rel = "icon" href = "./assets/coronavirus.png"  type = "image/x-icon">
    <link rel="stylesheet"  href="./css/alertify.css">
        <link rel="stylesheet" href="./css/semantic.css">


        <!-- include alertify script -->
        <script src="./js/alertify.js"></script>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-light bg-light fixed-top">
        <div class="container">
            <a class="navbar-brand " href="./">
               <img src="./assets/coronavirus.png" style="width:40px" id="logo">
               Covid Data Consultancy</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" 
            data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" 
            aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
                
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="#home">Home 
                            
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#news">News</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#contact">Contact</a>
                    </li>
                         <% 
                       HttpSession s = request.getSession(false);
                        if (s == null) {
                           %>
                             <li class="nav-item">
                            <a class="nav-link" href="#login">Authenticate</a>
                        </li>
                           
                       <%
                        } else if (s.getAttribute("currentUser") == null) {
                            %>
                             <li class="nav-item">
                            <a class="nav-link" href="#login">Authenticate</a>
                        </li>
                           
                           <%
                        }else{
                            %>
                             <li class="nav-item">
                            <a class="nav-link" href="./dashboard">Dashboard</a>
                        </li>
                            <%
                        
                        }
                            
                        %>
                      
                        
                </ul>
            </div>
        </div>
    </nav>

    <header id="home" class="jumbotron jumbotron-fluid">
        <div class="container-fluid text-center"> 
           <h1 class="display-3">Best Solution For Covid World Data Analysis</h1>
           <p class="lead pb-4">We help you maximize performance and build a healthy organization.</p>
           <p><a href="#" class="btn btn-primary btn-lg" role="button">Learn More</a></p>
        </div>
    </header>
    <section id="news" class="container">
        <h2 class="display-4  text-center mt-5 mb-3">Whats Happening?</h2>
        <div class="container-fluid text-center">
           <iframe  width="100%" height="450" src="https://www.youtube-nocookie.com/embed/NMre6IAAAiU?controls=0&autoplay=1&mute=1&title=0" title="COVID 19 UPDATE" frameborder="0" ></iframe>
        </div>
     </section>
     
      <% 
    
if (s == null) {

    
    %>
        <section id="login" class="container-fluid text-center py-4 mt-4">
            <h2 class="display-4 pb-4 my-4">Login</h2>
            <div class="col-md-12 col-lg-4 text-center container-fluid">
                <div class="row ">
                    <div class="col-md-6 col-lg-12 col-sm-6 form-group">
                        <label for="email" class="font-weight-bold">Email</label>
                        <input type="email" data-login id="email" placeholder="e.g. example@xyz.com" class="form-control">
                    </div>
                    <div class="col-md-6 col-lg-12 col-sm-6 form-group">
                        <label for="pass" class="font-weight-bold">Password</label>
                        <input type="password" data-login id="pass" placeholder="your account password" class="form-control">
                    </div>
                </div>
                <button class="text-center btn btn-primary btn-lg mb-4" role="button" onclick="Login(this)">Login</button>

            </div>
            <a  data-toggle="modal" data-target="#myModal" class="btn btn-secondary">Register</a>
        </section>
<%
    }
else if (s.getAttribute("currentUser") == null) {
                            %>
               <section id="login" class="container-fluid text-center py-4 mt-4">
            <h2 class="display-4 pb-4 my-4">Login</h2>
            <div class="col-md-12 col-lg-4 text-center container-fluid">
                <div class="row ">
                    <div class="col-md-6 col-lg-12 col-sm-6 form-group">
                        <label for="email" class="font-weight-bold">Email</label>
                        <input type="email" data-login id="email" placeholder="e.g. example@xyz.com" class="form-control">
                    </div>
                    <div class="col-md-6 col-lg-12 col-sm-6 form-group">
                        <label for="pass" class="font-weight-bold">Password</label>
                        <input type="password" data-login id="pass" placeholder="your account password" class="form-control">
                    </div>
                </div>
                <button class="text-center btn btn-primary btn-lg mb-4" role="button" onclick="Login(this)">Login</button>

            </div>
            <a  data-toggle="modal" data-target="#myModal" class="btn btn-secondary">Register</a>
        </section>
                            
                            <%
            }
%>




        <div class="modal fade" id="myModal" role="dialog">
            <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-body">
                        <section id="register" class="container-fluid text-center py-4 mt-4">
                            <h2 class="display-4 pb-4 my-4">Register</h2>
                            <div class="text-center container-fluid">
                                <div class="row ">
                                    <div class="col-md-12 col-lg-6 col-sm-12 form-group">
                                        <label for="fname" class="font-weight-bold">First Name</label>
                                        <input type="text" data-register id="fname" placeholder="your first name" class="form-control">
                                    </div>
                                    <div class="col-md-12 col-lg-6 col-sm-12 form-group">
                                        <label for="lname" class="font-weight-bold">Sur Name</label>
                                        <input type="text" data-register id="lname" placeholder="your last name" class="form-control">
                                    </div>
                                </div>
                                <div class="row ">
                                    <div class="col-md-12 col-lg-6 col-sm-12 form-group">
                                        <label for="email" class="font-weight-bold">Email</label>
                                        <input type="email" data-register id="email" placeholder="e.g. example@xyz.com" class="form-control">
                                    </div>
                                    <div class="col-md-12 col-lg-6 col-sm-12  form-group">
                                        <label for="pass" class="font-weight-bold">Password</label>
                                        <input type="pass" data-register id="password" placeholder="Password" class="form-control">
                                    </div>
                                </div>
                                <button class="text-center btn btn-primary btn-lg mb-4" role="button" onclick="Register(this)">Register</button>
                            </div>
                        </section>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    </div>
                </div>

            </div>
        </div>



     
     <section class="container-fluid text-center py-4 mt-4" id="contact">
        <h2 class="display-4 pb-4 my-4">Get in touch with us today!</h2>
        <p class="lead pb-3">Send us a message and we will get back to 
        you as soon as possible.</p>
        <a href="mailto:xyz@abc.com" class="btn btn-primary btn-lg mb-4" role="button">Contact us</a>
     </section>



     <footer class="py-3 bg-light">
        <div class="container">
           <p class="text-center">Copyright &copy; Covid Analysis 2022</p>
        </div>
     </footer>
</body>
<script>
   $(document).ready(function(){
      $(".nav-item").on("click",function(){
         $(".nav-item").removeClass("active");
         $(this).addClass("active")
      })
   });
   </script>
   <script src="./js/validator.js"></script>
       
</html>