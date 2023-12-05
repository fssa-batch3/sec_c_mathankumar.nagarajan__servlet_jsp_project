<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta charset="ISO-8859-1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- Home Page Title -->
    <title>SpartansMT Admin</title>

    <!-- Style CSS -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/admin.css">

    <!-- Title Icon -->
    <link rel="icon" type="image/png" sizes="32x32" href="../../assets/image/home/logo icon.png" alt="logo icon">

    <!-- Google Font link -->
    <link href="https://fonts.googleapis.com/css2?family=Barlow&family=Barlow+Condensed:wght@400;700&display=swap"
        rel="stylesheet">

    <!-- Font Awesome link -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

    <!-- Chart script -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>

</head>

<body>

	<%!public static final String GET_ALL_STORE_DETAILS = "/GetAllStoreDetailsUserSide";%>


    <nav>

		<div id="logo">
			<img src="<%=request.getContextPath() %>/assets/image/home/logo.png" alt="SpartansMT">
		</div>

		<div class="nav">

			<div>
				<i class="fa-solid fa-magnifying-glass search_icon"></i> <input
					id="search" type="search" placeholder="Search...">
			</div>

			<div>
				<span id="profile">Profile</span> <a href="<%=request.getContextPath() %>/LogoutServlet">
					<i class="fa-solid fa-right-from-bracket logout"></i>
				</a>
			</div>

		</div>

	</nav>

    <header>

       <ul>

			<span class="menu">MENU</span>

			<a href="<%=request.getContextPath()%>/pages/adminhome.jsp">
				<menu>Dashboard
				</menu>
			</a>

			<a href="">
				<menu>Forms
				</menu>
			</a>

			<a href=<%=request.getContextPath() + GET_ALL_STORE_DETAILS%>>
				<menu>Tables</menu>
			</a>

		</ul>

        <div class="right_side">

            <div id="dashboard">

                <div class="dash_align">

                    <h4>DASHBOARD</h4>
                    <div>
                        <span>SpartansMT</span>
                        <i class="fa-solid fa-angle-right"></i>
                        <span class="menu">Dashboard</span>
                    </div>

                </div>

                <div class="container">

                    <div class="container_main">

                        <div class="container_left">

                            <div class="first_row">

                                <div class="three_divs">

                                    <div class="dash_align">
                                        <div class="block">
                                            <span class="menu">Number of Sales</span>
                                            <span class="h1" id="total_sales"></span>
                                        </div>
                                        <i class="fa-solid fa-layer-group dash_icon"></i>
                                    </div>
                                    <hr>
                                    <div class="dash_align">
                                        <span class="percentage">2.5%</span>
                                        <span class="menu">From previous period</span>
                                    </div>

                                </div>

                                <div class="three_divs">

                                    <div class="dash_align">
                                        <div class="block">
                                            <span class="menu">Sales Revenue</span>
                                            <span class="h1" id="total_price"></span>
                                        </div>
                                        <i class="fa-solid fa-store dash_icon"></i>
                                    </div>
                                    <hr>
                                    <div class="dash_align">
                                        <span class="percentage">2.5%</span>
                                        <span class="menu">From previous period</span>
                                    </div>

                                </div>

                                <div class="three_divs">

                                    <div class="dash_align">
                                        <div class="block">
                                            <span class="menu">Average Price</span>
                                            <span class="h1" id="average"></span>
                                        </div>
                                        <i class="fa-solid fa-briefcase dash_icon"></i>
                                    </div>
                                    <hr>
                                    <div class="dash_align">
                                        <span class="percentage">2.5%</span>
                                        <span class="menu">From previous period</span>
                                    </div>

                                </div>

                            </div>

                            <div id="bar_chart">

                                <div>
                                    <span class="chart_headings">Revenue Analytics</span>
                                </div>

                                <canvas id="myChart" style="width:100%;max-width:100%;"></canvas>

                            </div>

                        </div>

                        <div class="container_right">

                            <div id="pie_chart">
                                <span class="chart_headings">Sales Analytics</span>
                                <canvas id="myChart1" style="width:100%;max-width:600px;max-height: 320px;"></canvas>
                            </div>

                            <div id="two_pie_charts">
                                <span class="chart_headings">Earning Reports</span>
                                <div>
                                    <canvas id="myChart2" style="width:50%;max-width:150px"></canvas>
                                    <canvas id="myChart3" style="width:50%;max-width:150px"></canvas>
                                </div>
                                <div>
                                    <span class="menu">Weekly Earning</span>
                                    <span class="menu">Monthly Earning</span>
                                </div>

                            </div>

                        </div>

                    </div>

                    

                </div>

            </div>

        </div>
    
	</header>
	
	<script type="text/javascript">
	
	// Bar Chart Codes
    var xValues = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"];
    var yValues = [55, 49, 44, 24, 25, 22, 43];
    var barColors = ["red", "green", "blue", "orange", "brown", "red", "green"];

    new Chart("myChart", {
        type: "bar",
        data: {
            labels: xValues,
            datasets: [{
                backgroundColor: barColors,
                data: yValues
            }]
        },
        options: {
            legend: { display: false },
            title: {
                display: true,
                text: ""
            }
        }
    });

    // Chart.js Codes
    var xValues = ["Nike", "Lenskart", "Chales & Keith", "Vero Moda", "Poorvika"];
    var yValues = [55, 49, 44, 33, 63];
    var barColors = ["red", "green", "blue", "orange", "brown"];

    new Chart("myChart1", {
        type: "doughnut",
        data: {
            labels: xValues,
            datasets: [{
                backgroundColor: barColors,
                data: yValues,
            }]
        },
        options: {
            title: {
                display: true,
                // text: "World Wide Wine Production 2018"
            }
        }
    });

    // End Chart.js Codes

    var xValues = ["Weekly Earnings", ""];
    var yValues = [75, 25];
    var barColors = ["blue",];

    new Chart("myChart2", {
        type: "doughnut",
        data: {
            labels: xValues,
            datasets: [{
                backgroundColor: barColors,
                data: yValues,
            }]
        },
        options: {
            title: {
                display: true,
                // text: "World Wide Wine Production 2018"
            }
        }
    });

    var xValues = ["Monthly Earnings", ""];
    var yValues = [75, 25];
    var barColors = ["green",];

    new Chart("myChart3", {
        type: "doughnut",
        data: {
            labels: xValues,
            datasets: [{
                backgroundColor: barColors,
                data: yValues,
            }]
        },
        options: {
            title: {
                display: true,
                // text: "World Wide Wine Production 2018"
            }
        }
    });
		
	</script>
	
	
	</body>
	</html>