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
    <script src="https://cdn.jsdelivr.net/npm/chart.js@3.7.0/dist/chart.min.js"></script>
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
                        <a class="nav-link" href="#graphs">Graphs</a>
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
    <section id="graphs" class="container-fluid text-center">
        <h2 class="display-4 text-center mt-5 mb-3">Graph Based Data</h2>
        <canvas id="myChart" class="mt-1 mb-1" width="800" height="300"></canvas>
        <canvas id="myChart1" class="mt-1 mb-1" width="800" height="300"></canvas>
          <canvas id="myChart2" class="mt-1 mb-1" width="800" height="300"></canvas>
     
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
   
   function labelCleaner(a) {
       return a.substr(1,a.length-2).split(",");
   }
   function valuesCleaner(a) {
     r = a.substr(1,a.length-2).split(",")
     f = []
     for(i =0;i<r.length;i++){
         f.push(parseInt(r[i]))
     }
     return f
   }
var label_l = labelCleaner("<%=request.getAttribute("labels")%>");
var C_l = valuesCleaner("<%=request.getAttribute("cases")%>");
var V_l = valuesCleaner("<%=request.getAttribute("deaths")%>");
var D_l = valuesCleaner("<%=request.getAttribute("vacc")%>");

   const ctx = document.getElementById('myChart').getContext('2d');
    const ctx1 = document.getElementById('myChart1').getContext('2d');
    const ctx2 = document.getElementById('myChart2').getContext('2d');
const myChart = new Chart(ctx, {
    type: 'line',
    data: {
        labels: label_l,
        datasets: [{
            label: '# of  Cases',
            data: C_l,
            backgroundColor: [
                'rgba(255, 99, 132, 0.2)',
                'rgba(54, 162, 235, 0.2)',
                'rgba(255, 206, 86, 0.2)',
                'rgba(75, 192, 192, 0.2)',
                'rgba(153, 102, 255, 0.2)',
                'rgba(255, 159, 64, 0.2)'
            ],
            borderColor: [
                'rgba(255, 99, 132, 1)',
                'rgba(54, 162, 235, 1)',
                'rgba(255, 206, 86, 1)',
                'rgba(75, 192, 192, 1)',
                'rgba(153, 102, 255, 1)',
                'rgba(255, 159, 64, 1)'
            ],
            borderWidth: 1
        }]
    },
    options: {
        scales: {
            y: {
                beginAtZero: true
            }
        }
    }
});


const myChart1 = new Chart(ctx1, {
    type: 'bar',
    data: {
        labels: label_l,
        datasets: [{
            label: '# of  Deaths',
            data: D_l,
            backgroundColor: [
                'rgba(255, 99, 132, 0.2)',
                'rgba(54, 162, 235, 0.2)',
                'rgba(255, 206, 86, 0.2)',
                'rgba(75, 192, 192, 0.2)',
                'rgba(153, 102, 255, 0.2)',
                'rgba(255, 159, 64, 0.2)'
            ],
            borderColor: [
                'rgba(255, 99, 132, 1)',
                'rgba(54, 162, 235, 1)',
                'rgba(255, 206, 86, 1)',
                'rgba(75, 192, 192, 1)',
                'rgba(153, 102, 255, 1)',
                'rgba(255, 159, 64, 1)'
            ],
            borderWidth: 1
        }]
    },
    options: {
        scales: {
            y: {
                beginAtZero: true
            }
        }
    }
});



const myChart2 = new Chart(ctx2, {
    type: 'line',
    data: {
        labels: label_l,
        datasets: [{
            label: '# of  Vaccinated',
            data: V_l,
            backgroundColor: [
  "#b91d47",
  "#00aba9",
  "#2b5797",
  "#e8c3b9",
  "#1e7145"
],
            borderColor: [
                'rgba(255, 99, 132, 1)',
                'rgba(54, 162, 235, 1)',
                'rgba(255, 206, 86, 1)',
                'rgba(75, 192, 192, 1)',
                'rgba(153, 102, 255, 1)',
                'rgba(255, 159, 64, 1)'
            ],
            borderWidth: 1
        }]
    },
    options: {
        scales: {
            y: {
                beginAtZero: true
            }
        }
    }
});
   </script>
   <script src="./js/validator.js"></script>
</html>