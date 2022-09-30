﻿<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="dashboard.aspx.cs" Inherits="Labtracker.dashboard" %>


<asp:Content runat="server" ContentPlaceHolderID="MainContentDS" Visible="true">



    <!-- Begin Page Content -->
    <div class="container-fluid">

        <!-- Page Heading -->
        <div class="d-sm-flex align-items-center justify-content-between mb-4">
            <h1 class="h3 mb-0 text-gray-800">TBGEN LAB activity tracking </h1>
            <a href="#" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm">
                <i class="fas fa-download fa-sm text-white-50"></i>Generate Report</a>
        </div>

        <!-- Content Row -->
        <div class="row">

            <!-- Total sample collected  -->
            <div class="col-xl-2 col-md-4 mb-4">
                <div class="card border-left-primary shadow h-100 py-2">
                    <div class="card-body">
                        <div class="row no-gutters align-items-center">
                            <div class="col mr-2">
                                <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">Total Sample Collected</div>

                                <div class="h5 mb-0 font-weight-bold text-gray-800">
                                    <asp:Label runat="server" ID="lblTotalSample" Text=""></asp:Label>

                                </div>


                            </div>

                            <div class="col-auto">
                                <i class="fas fa-sample fa-2x text-gray-300"></i>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Culture Postive -->
            <div class="col-xl-2 col-md-4 mb-4">
                <div class="card border-left-success shadow h-100 py-2">
                    <div class="card-body">
                        <div class="row no-gutters align-items-center">
                            <div class="col mr-2">
                                <div class="text-xs font-weight-bold text-success text-uppercase mb-1">Culture Positive</div>
                                <div class="h5 mb-0 font-weight-bold text-gray-800">
                                    <asp:Label runat="server" ID="lblCulturePositive" Text=""></asp:Label>
                                </div>

                            </div>
                            <div class="col-auto">
                                <i class="fas fa-culture fa-2x text-gray-300"></i>
                            </div>
                        </div>
                    </div>
                </div>
            </div>



            <!-- Contaminated Sample -->
            <div class="col-xl-2 col-md-4 mb-4">
                <div class="card border-left-danger shadow h-100 py-2">
                    <div class="card-body">
                        <div class="row no-gutters align-items-center">
                            <div class="col mr-2">
                                <div class="text-xs font-weight-bold text-danger text-uppercase mb-1">Contaminated</div>
                                <div class="h5 mb-0 font-weight-bold text-gray-800">
                                    <asp:Label runat="server" ID="lblContaminated" Text=""></asp:Label>
                                </div>
                            </div>
                            <div class="col-auto">
                                <i class="fas fa-contamination fa-2x text-gray-300"></i>
                            </div>
                        </div>
                    </div>
                </div>
            </div>


            <!-- Isolate Stored -->
            <div class="col-xl-2 col-md-4 mb-4">
                <div class="card border-left-info shadow h-100 py-2">
                    <div class="card-body">
                        <div class="row no-gutters align-items-center">
                            <div class="col mr-2">
                                <div class="text-xs font-weight-bold text-info text-uppercase mb-1">Isolate Stored</div>
                                <div class="h5 mb-0 font-weight-bold text-gray-800">
                                    <asp:Label runat="server" ID="lblIsolateStored" Text=""></asp:Label>
                                </div>
                            </div>
                            <div class="col-auto">
                                <i class="fas fa-isolate fa-2x text-gray-300"></i>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- No growth -->
            <div class="col-xl-2 col-md-4 mb-4">
                <div class="card border-left-info shadow h-100 py-2">
                    <div class="card-body">
                        <div class="row no-gutters align-items-center">
                            <div class="col mr-2">
                                <div class="text-xs font-weight-bold text-info text-uppercase mb-1">No growth</div>
                                <div class="h5 mb-0 font-weight-bold text-gray-800">
                                    <asp:Label runat="server" ID="lblNoGrowth" Text=""></asp:Label>
                                </div>
                            </div>
                            <div class="col-auto">
                                <i class="fas fa-isolate fa-2x text-gray-300"></i>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Sequenced -->
            <div class="col-xl-2 col-md-4 mb-4">
                <div class="card border-left-info shadow h-100 py-2">
                    <div class="card-body">
                        <div class="row no-gutters align-items-center">
                            <div class="col mr-2">
                                <div class="text-xs font-weight-bold text-info text-uppercase mb-1">Sequenced</div>
                                <div class="h5 mb-0 font-weight-bold text-gray-800">0</div>
                            </div>
                            <div class="col-auto">
                                <i class="fas fa-isolate fa-2x text-gray-300"></i>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <!-- Sample Collection progress 
            <div class="col-xl-4 col-md-6 mb-4">
              <div class="card border-left-info shadow h-100 py-2">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                      <div class="text-xs font-weight-bold text-info text-uppercase mb-1">Sample Collection Progress</div>
                      <div class="row no-gutters align-items-center">
                        <div class="col-auto">
                          <div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">5%</div>
                        </div>
                        <div class="col">
                          <div class="progress progress-sm mr-2">
                            <div class="progress-bar bg-info" role="progressbar" style="width: 5%" aria-valuenow="5" aria-valuemin="0" aria-valuemax="100"></div>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="col-auto">
                      <i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
                    </div>
                  </div>
                </div>
              </div>
            </div> -->


    <!-- Custom scripts for all pages-->
    <script src="Content/js/sb-admin-2.min.js"></script>
    <script src="Scripts/jquery-3.3.1.js"></script>
    <script src="Scripts/jquery-3.3.1.min.js"></script>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>

    <script src="Scripts/jquery-3.3.1.min.js" type="text/javascript"></script>
    <!-- Page level plugins -->
    <script src="Content/vendor/chart.js/Chart.min.js"> </script>


    <!-- Content Row -->

    <div class="row">

        <!-- Area Chart -->
        <div class="col-xl-8 col-lg-7">
            <div class="card shadow mb-4">
                <!-- Card Header - Dropdown -->
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                    <h6 class="m-0 font-weight-bold text-primary">Sample per Region</h6>
                    <div class="dropdown no-arrow">
                        <a class="dropdown-toggle" href="#" role="button" id="" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
                        </a>
                        <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in" aria-labelledby="dropdownMenuLink">
                            <div class="dropdown-header">Dropdown Header:</div>
                            <a class="dropdown-item" href="#">Action</a>
                            <a class="dropdown-item" href="#">Another action</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="#">Something else here</a>
                        </div>
                    </div>
                </div>
                <!-- Card Body -->
                <div class="card-body">
                    <div class="chart-area">
                        <canvas id="myBarChart"></canvas>
                    </div>
                </div>
            </div>
        </div>

        <script type="text/javascript">
            // Set new default font family and font color to mimic Bootstrap's default styling
            Chart.defaults.global.defaultFontFamily = 'Nunito', '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
            Chart.defaults.global.defaultFontColor = '#858796';

            function number_format(number, decimals, dec_point, thousands_sep) {
                // *     example: number_format(1234.56, 2, ',', ' ');
                // *     return: '1 234,56'
                number = (number + '').replace(',', '').replace(' ', '');
                var n = !isFinite(+number) ? 0 : +number,
                    prec = !isFinite(+decimals) ? 0 : Math.abs(decimals),
                    sep = (typeof thousands_sep === 'undefined') ? ',' : thousands_sep,
                    dec = (typeof dec_point === 'undefined') ? '.' : dec_point,
                    s = '',
                    toFixedFix = function (n, prec) {
                        var k = Math.pow(10, prec);
                        return '' + Math.round(n * k) / k;
                    };
                // Fix for IE parseFloat(0.55).toFixed(0) = 0;
                s = (prec ? toFixedFix(n, prec) : '' + Math.round(n)).split('.');
                if (s[0].length > 3) {
                    s[0] = s[0].replace(/\B(?=(?:\d{3})+(?!\d))/g, sep);
                }
                if ((s[1] || '').length < prec) {
                    s[1] = s[1] || '';
                    s[1] += new Array(prec - s[1].length + 1).join('0');
                }
                return s.join(dec);
            }

            // Bar Chart Example
            var oro = '<%=Regions[0]%>';
            var snn = '<%=Regions[1]%>';
            var gam = '<%=Regions[2]%>';
            var add = '<%=Regions[3]%>';
            var amh = '<%=Regions[4]%>';
            var som = '<%=Regions[5]%>';
            var ben = '<%=Regions[6]%>';
            var tig = '<%=Regions[7]%>';
            var afr = '<%=Regions[8]%>';
            var har = '<%=Regions[9]%>';

            var ctx = document.getElementById("myBarChart");
            var myBarChart = new Chart(ctx, {
                type: 'bar',
                data: {
                    labels: ["Oromia", "SNNP", "Gambella", "Addis Ababa", "Amhara", "Somali", "Benishangul", "Tigray", "Afar", "Harari"],
                    datasets: [{
                        label: "Sample Collected",
                        backgroundColor: "#4e73df",
                        hoverBackgroundColor: "#2e59d9",
                        borderColor: "#4e73df",
                        data: [oro, snn, gam, add, amh, som, ben, tig, afr, har],
                    }],
                },
                options: {
                    maintainAspectRatio: false,
                    layout: {
                        padding: {
                            left: 10,
                            right: 25,
                            top: 25,
                            bottom: 0
                        }
                    },
                    scales: {
                        xAxes: [{
                            time: {
                                unit: 'month'
                            },
                            gridLines: {
                                display: false,
                                drawBorder: false
                            },
                            ticks: {
                                maxTicksLimit: 10
                            },
                            maxBarThickness: 25,
                        }],
                        yAxes: [{
                            ticks: {
                                min: 0,
                                max: 350,
                                maxTicksLimit: 10,
                                padding: 10,
                                // Include a number sign in the ticks
                                callback: function (value, index, values) {
                                    return '#' + number_format(value);
                                }
                            },
                            gridLines: {
                                color: "rgb(234, 236, 244)",
                                zeroLineColor: "rgb(234, 236, 244)",
                                drawBorder: false,
                                borderDash: [2],
                                zeroLineBorderDash: [2]
                            }
                        }],
                    },
                    legend: {
                        display: false
                    },
                    tooltips: {
                        titleMarginBottom: 10,
                        titleFontColor: '#6e707e',
                        titleFontSize: 14,
                        backgroundColor: "rgb(255,255,255)",
                        bodyFontColor: "#858796",
                        borderColor: '#dddfeb',
                        borderWidth: 1,
                        xPadding: 15,
                        yPadding: 15,
                        displayColors: false,
                        caretPadding: 10,
                        callbacks: {
                            label: function (tooltipItem, chart) {
                                var datasetLabel = chart.datasets[tooltipItem.datasetIndex].label || '';
                                return datasetLabel + ': #' + number_format(tooltipItem.yLabel);
                            }
                        }
                    },
                }
            });

        </script>

        <!-- Pie Chart -->
        <div class="col-xl-4 col-lg-5">
            <div class="card shadow mb-4">
                <!-- Card Header - Dropdown -->
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                    <h6 class="m-0 font-weight-bold text-primary">Sample per country</h6>
                    <div class="dropdown no-arrow">
                        <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
                        </a>
                        <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in" aria-labelledby="dropdownMenuLink">
                            <div class="dropdown-header">Dropdown  :</div>
                            <a class="dropdown-item" href="#">Action</a>
                            <a class="dropdown-item" href="#">Another action</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="#">Something else here</a>
                        </div>
                    </div>
                </div>
                <!-- Card Body -->
                <div class="card-body">



                    <div class="chart-pie pt-4 pb-2">
                        <canvas id="myPieChart"></canvas>

                    </div>


                    <div class="mt-4 text-center small">
                        <span class="mr-2">
                            <i class="fas fa-circle text-primary"></i></i>
                            <asp:Label runat="server" ID="lblethiopiasam" Text=" " />
                            - Ethiopia
                        </span>
                        <span class="mr-2">
                            <i class="fas fa-circle text-success"></i>
                            <asp:Label runat="server" ID="lblEritreasam" Text=" " />
                            - Eritrea
                        </span>
                        <span class="mr-2">
                            <i class="fas fa-circle text-info"></i>
                            <asp:Label runat="server" ID="lblCameroonsam" Text=" " />
                            - Cameron
                        </span>
                        <span class="mr-2">
                            <i class="fas fa-circle text-secondary"></i>
                            <asp:Label runat="server" ID="lblSudansam" Text=" " />
                            - Sudan
                        </span>
                    </div>
                </div>
            </div>
        </div>

        <script type="text/javascript">

              <%--  $(document).ready(function () {
                    var servervalue = '<%=Regions[0]%>';
                    alert(servervalue);
                });--%>

            Chart.defaults.global.defaultFontFamily = 'Nunito', '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
            Chart.defaults.global.defaultFontColor = '#858796';
            var servervalue = '<%=FromServer[0]%>';
            var eth = '<%=Countries[0]%>';
            var eri = '<%=Countries[1]%>';
            var sud = '<%=Countries[2]%>';
            var cam = '<%=Countries[3]%>';
            var ctx = document.getElementById("myPieChart");
            var myPieChart = new Chart(ctx, {
                type: 'doughnut',
                data: {
                    labels: ["Ethiopia", "Eritrea", "Sudan", "Cameroon"],
                    datasets: [{
                        data: [eth, eri, sud, cam],
                        backgroundColor: ['#4e73df', '#1cc88a', '#36b9cc', '#1f1f1f'],
                        hoverBackgroundColor: ['#2e59d9', '#17a673', '#2c9faf', '#1f1f1f'],
                        hoverBorderColor: "rgba(234, 236, 244, 1)",
                    }],
                },
                options: {
                    maintainAspectRatio: false,
                    tooltips: {
                        backgroundColor: "rgb(255,255,255)",
                        bodyFontColor: "#858796",
                        borderColor: '#dddfeb',
                        borderWidth: 1,
                        xPadding: 15,
                        yPadding: 15,
                        displayColors: false,
                        caretPadding: 10,
                    },
                    legend: {
                        display: false
                    },
                    cutoutPercentage: 80,
                },
            });



        </script>
    </div>

    <!-- Map Content Row -->
    <div class="row">
        <div class="col-lg-7 mb-5">
            <!-- Project Card Example -->
            <div class="card shadow mb-4">
                <div class="card-header py-3">
                    <h6 class="m-0 font-weight-bold text-primary">Map Visualization per Site</h6>
                </div>
                <div id="mapid" style="width: 600px; height: 400px;"></div>
                <script type="text/javascript">


                    var adama = '<%=Sites[0]%>';
                    var shashe = '<%=Sites[1]%>';
                    var wolay = '<%=Sites[2]%>';
                    var gambe = '<%=Sites[3]%>';
                    var yirga = '<%=Sites[4]%>';
                    var arba = '<%=Sites[5]%>';
                    var gode = '<%=Sites[6]%>';
                    var sodo = '<%=Sites[7]%>';
                    var hawas = '<%=Sites[8]%>';
                    var halab = '<%=Sites[9]%>';
                    var hosain = '<%=Sites[10]%>';
                    var dilla = '<%=Sites[11]%>';
                    var ambo = '<%=Sites[12]%>';
                    var tulu = '<%=Sites[13]%>';
                    var addisalem = '<%=Sites[14]%>';
                    var yekatit = '<%=Sites[15]%>';
                    var addisketema = '<%=Sites[16]%>';
                    var woreda3 = '<%=Sites[17]%>';
                    var miki = '<%=Sites[18]%>';
                    var keraniy = '<%=Sites[19]%>';



                    var mymap = L.map('mapid').setView([9.058702156392139, 38.759765625
                    ], 5);

                    L.tileLayer('http://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
                        attribution: '&copy; <a href="http://osm.org/copyright" target="_blank">OpenStreetMap</a> | <a href="https://tbgen.ahri.gov.et" target="_blank">TBGEN, AHRI</a> mapdata'
                    }).addTo(mymap);

                    var marker = L.marker([8.98556789946321, 38.71186137199402]).addTo(mymap);
                    marker.bindPopup("<b>Armaeur Hansen Research Institute(AHRI)</b><br>Sequenced 0 samples").openPopup();


                    var marker = L.marker([8.54385, 39.27445]).addTo(mymap);
                    marker.bindPopup("<b>Adama Hospital</b><br>Samples: " + adama).openPopup();

                    var marker = L.marker([7.20721, 38.61220]).addTo(mymap);
                    marker.bindPopup("<b>Shashemene Hospital</b><br>Samples: " + shashe).openPopup();

                    var marker = L.marker([6.85448, 37.76073]).addTo(mymap);
                    marker.bindPopup("<b>Wolaita Sodo Hospital</b><br>Samples: " + wolay).openPopup();


                    var marker = L.marker([8.24229, 34.58165]).addTo(mymap);
                    marker.bindPopup("<b>Gambella General Hospital</b><br>Samples: " + gambe).openPopup();

                    var marker = L.marker([6.02797, 37.55298]).addTo(mymap);
                    marker.bindPopup("<b>ArbaMinch Hospital</b><br>Samples: " + arba).openPopup();

                    var marker = L.marker([6.75001, 38.39411]).addTo(mymap);
                    marker.bindPopup("<b>Yirgalem General Hospital</b><br>Samples: " + yirga).openPopup();



                    var marker = L.marker([5.9595411, 43.5512884]).addTo(mymap);
                    marker.bindPopup("<b>Gode Hospital</b><br>Samples: " + gode).openPopup();

                    var marker = L.marker([6.857281, 37.7733635]).addTo(mymap);
                    marker.bindPopup("<b>Sodo Hospital</b><br>Samples: " + sodo).openPopup();

                    var marker = L.marker([7.0273564, 38.4305888]).addTo(mymap);
                    marker.bindPopup("<b>Hawassa CS Hospital</b><br>Samples: " + hawas).openPopup();

                    var marker = L.marker([7.3178819, 38.0930245]).addTo(mymap);
                    marker.bindPopup("<b>Halaba Primary Hospital</b><br>Samples: " + halab).openPopup();

                    var marker = L.marker([7.5511255, 37.8319107]).addTo(mymap);
                    marker.bindPopup("<b>Hosaina Hospital</b><br>Samples: " + hosain).openPopup();

                    var marker = L.marker([6.4000662, 38.3099362]).addTo(mymap);
                    marker.bindPopup("<b>Dilla Hospital</b><br>Samples: " + dilla).openPopup();

                    var marker = L.marker([8.9840787, 37.8477461]).addTo(mymap);
                    marker.bindPopup("<b>Ambo Hospital</b><br>Samples: " + ambo).openPopup();

                    var marker = L.marker([8.6645898, 38.2180664]).addTo(mymap);
                    marker.bindPopup("<b>Tulubolo Hospital</b><br>Samples: " + tulu).openPopup();

                    var marker = L.marker([11.5959828, 37.4121578]).addTo(mymap);
                    marker.bindPopup("<b>Addis Alem Hospital</b><br>Samples: " + addisalem).openPopup();

                    var marker = L.marker([9.0436391, 38.7589657]).addTo(mymap);
                    marker.bindPopup("<b>Yekatit 12 Hospital</b><br>Samples: " + yekatit).openPopup();

                    var marker = L.marker([9.0332229, 38.7087812]).addTo(mymap);
                    marker.bindPopup("<b>Addis Ketema Health Center</b><br>Samples: " + addisketema).openPopup();

                    var marker = L.marker([9.049408, 38.7366835]).addTo(mymap);
                    marker.bindPopup("<b>Woreda 3 Health Center</b><br>Samples: " + woreda3).openPopup();

                    var marker = L.marker([9.0518675, 38.6948024]).addTo(mymap);
                    marker.bindPopup("<b>Mikiland Health Center</b><br>Samples: " + miki).openPopup();

                    var marker = L.marker([9.0441326, 38.6973718]).addTo(mymap);
                    marker.bindPopup("<b>Keraniyo Health Center</b><br>Samples: " + keraniy).openPopup();


                </script>
            </div>
        </div>
        <div class="col-lg-7 mb-5">
            <!-- Project Card Example -->
            <div class="card shadow mb-4">
                <div class="card-header py-3">
                    <h6 class="m-0 font-weight-bold text-primary">Map Visualization per Region</h6>
                </div>

                <div id="mapid2"></div>
                <script src="Content/js/catiline.js"></script>
                <script src="Content/js/leaflet.shpfile.js"></script>
                <script src="Content/js/shp.js"></script>
                <script type="text/javascript">

                    var adama = "Adama Hospital";
                    var mymap = L.map('mapid2').setView([9.058702156392139, 35.359765625
                    ], 3.5);

                    L.tileLayer('http://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
                        attribution: '&copy; <a href="http://osm.org/copyright" target="_blank">OpenStreetMap</a> | <a href="https://tbgen.ahri.gov.et" target="_blank">TBGEN, AHRI</a> mapdata'
                    }).addTo(mymap);

                    

                    var oromia = '<%=Regions[0]%>';
                    var snnp = '<%=Regions[1]%>';
                    var gambela = '<%=Regions[2]%>';
                    var addis = '<%=Regions[3]%>';
                    var amhara = '<%=Regions[4]%>';
                    var somali = '<%=Regions[5]%>';
                    var benshangul = '<%=Regions[6]%>';
                    var tigray = '<%=Regions[7]%>';
                    var afar = '<%=Regions[8]%>';
                    var harar = '<%=Regions[9]%>';


                    var regional = {
                        'Amhara': amhara,
                        'Oromia': oromia,
                        'SNNPR': snnp,
                        'Gambela': gambela,
                        'Addis Ababa': addis,
                        'Somali': somali,
                        'Benshangul Gumu': benshangul,
                        'Tigray': tigray,
                        'Afar': afar,
                        'Hareri': harar,
                        'Dire Dawa': '0'
                    }

                    var shpfile = new L.Shapefile('Content/spatial/ethiopiaregion.zip',
                        {
                            style: function (feature) {
                                return { color: "black", fillColor: "red", fillOpacity: .25 }
                            },
                            onEachFeature: function (feature, layer) {
                               /* if (feature.properties) {
                                    layer.bindPopup(Object.keys(feature.properties).map(function (k) {
                                        return k + ": " + feature.properties[k];
                                    }).join("<br />"), {
                                            maxHeight: 200
                                        });
                                }*/
                                if (feature.properties) {
                                    layer.bindPopup(feature.properties["REGIONNAME"] + "</br>" + "Samples: " + regional[feature.properties["REGIONNAME"]]);
                                }
                            }
                        });
                    shpfile.addTo(mymap);
                    shpfile.once("data:loaded", function () {
                        console.log("finished loaded shapefile");
                    });

                    //cameroon
                    var shpfile2 = new L.Shapefile('Content/spatial/cameroonlevel1.zip', {
                        onEachFeature: function (feature, layer) {

                            if (feature.properties) {
                                layer.bindPopup("Region: "+feature.properties["ID"] + "</br>" + "Samples: _");
                            }

                        }

                    });
                    shpfile2.addTo(mymap);

                    shpfile2.once("data:loaded", function () {
                        console.log("finished loaded shapefile");
                    });

                    /*//eritrea
                    var shpfile3 = new L.Shapefile('geoboundarieseri.zip', {
                        onEachFeature: function (feature, layer) {
                            if (feature.properties) {
                                layer.bindPopup(Object.keys(feature.properties).map(function (k) {
                                    return k + ": " + feature.properties[k];
                                }).join("<br />"), {
                                        maxHeight: 200
                                    });
                            }

                        }

                    });
                    shpfile3.addTo(mymap);

                    shpfile3.once("data:loaded", function () {
                        console.log("finished loaded shapefile");
                    });*/


                    //sudan
                    var shpfile4 = new L.Shapefile('Content/spatial/sudanlevel1.zip', {
                        onEachFeature: function (feature, layer) {
                            if (feature.properties) {
                                layer.bindPopup("Region: "+feature.properties["State_En"] + "</br>" + "Samples: _");
                            }

                        }

                    });
                    shpfile4.addTo(mymap);

                    shpfile4.once("data:loaded", function () {
                        console.log("finished loaded shapefile");
                    });

                </script>

            </div>
        </div>
    </div>

    <!-- Content Row -->
    <div class="row">

        <!-- Content Column -->
        <div class="col-lg-12 mb-4">

            <!-- Project Card Example -->
            <div class="card shadow mb-4">
                <div class="card-header py-3">
                    <h6 class="m-0 font-weight-bold text-primary">Progress Target: 900</h6>
                </div>
                <div class="card-body">
                    <h4 class="small font-weight-bold">Sample Collection<span class="float-right"><asp:Label runat="server" ID="lblsamplecoltar" Text="" />%</span></h4>
                    <div class="progress mb-4">
                        <div runat="server" id="progressBar1" class="progress-bar bg-danger" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100"></div>
                    </div>
                    <h4 class="small font-weight-bold">Isolate Storage<span class="float-right"><asp:Label runat="server" ID="lblisolatetar" Text="" />%</span></h4>
                    <div class="progress mb-4">
                        <div runat="server" id="progressBar2" class="progress-bar bg-warning" role="progressbar" aria-valuenow="10" aria-valuemin="0" aria-valuemax="100"></div>
                    </div>

                </div>
            </div>







        </div>
    </div>
</asp:Content>
