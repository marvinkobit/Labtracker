
<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="dashboard.aspx.cs"  Inherits="Labtracker.dashboard" %>


<asp:Content runat="server" ContentPlaceHolderID="MainContentDS" Visible="true">

        
      
        <!-- Begin Page Content -->
        <div class="container-fluid">

          <!-- Page Heading -->
          <div class="d-sm-flex align-items-center justify-content-between mb-4">
            <h1 class="h3 mb-0 text-gray-800">TBGEN LAB activity tracking </h1>
            <a href="#" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm">
                <i class="fas fa-download fa-sm text-white-50"></i> Generate Report</a>
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
                          <asp:Label  runat="server" ID="lblTotalSample"  Text=""></asp:Label>
                          
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
                      <div class="h5 mb-0 font-weight-bold text-gray-800"><asp:Label  runat="server" ID="lblCulturePositive"  Text=""></asp:Label></div>

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
                      <div class="h5 mb-0 font-weight-bold text-gray-800"><asp:Label  runat="server" ID="lblContaminated"  Text=""></asp:Label></div>
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
                      <div class="h5 mb-0 font-weight-bold text-gray-800">0</div>
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
                      <div class="h5 mb-0 font-weight-bold text-gray-800"><asp:Label  runat="server" ID="lblNoGrowth"  Text=""></asp:Label></div>
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

          <!-- Content Row -->

          <div class="row">

            <!-- Area Chart -->
            <div class="col-xl-8 col-lg-7">
              <div class="card shadow mb-4">
                <!-- Card Header - Dropdown -->
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                  <h6 class="m-0 font-weight-bold text-primary">Sample per site</h6>
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
                       <i class="fas fa-circle text-primary"></i></i> <asp:Label  runat="server" ID="lblethiopiasam"  Text=" "/> - Ethiopia
                    </span>
                    <span class="mr-2">
                      <i class="fas fa-circle text-success"></i> <asp:Label  runat="server" ID="lblEritreasam"  Text=" "/> - Eritrea
                    </span>
                    <span class="mr-2">
                      <i class="fas fa-circle text-info"></i> <asp:Label  runat="server" ID="lblCameroonsam"  Text=" "/> - Cameron
                    </span>
                        <span class="mr-2">
                      <i class="fas fa-circle text-secondary"></i> <asp:Label  runat="server" ID="lblSudansam"  Text=" "/> - Sudan
                    </span>
                  </div>
                </div>
              </div>
            </div>
          </div>

           <!-- Map Content Row -->
           <div class="row">
               <div class="col-lg-12 mb-4">
                    <div id="mapid" style="width:600px; height:400px;"></div>
                    <script type="text/javascript">

                        var mymap = L.map('mapid').setView([9.058702156392139,38.759765625
                      ], 5);

                        L.tileLayer('http://{s}.tile.osm.org/{z}/{x}/{y}.png', {
                            attribution: '&copy; <a href="http://osm.org/copyright" target="_blank">OpenStreetMap</a> | <a href="https://tbgen.ahri.gov.et" target="_blank">TBGEN, AHRI</a> mapdata'
                        }).addTo(mymap);
                       
                        var marker = L.marker([8.98556789946321,38.71186137199402]).addTo(mymap);
                        marker.bindPopup("<b>Armaeur Hansen Research Institute(AHRI)!</b><br>Sequenced 0 samples").openPopup();

                        var marker = L.marker([8.54385 ,39.27445]).addTo(mymap);
                        marker.bindPopup("<b>Adama Hospital!</b><br>Samples: 0").openPopup();

                        var marker = L.marker([7.20721 , 38.61220]).addTo(mymap);
                        marker.bindPopup("<b>Shashemene Hospital!</b><br>Samples: 0").openPopup();

                        var marker = L.marker([6.85448 , 37.76073]).addTo(mymap);
                        marker.bindPopup("<b>Wolaita Sodo Hospital!</b><br>Samples: 0").openPopup();

                       
                        var marker = L.marker([8.24229 , 34.58165]).addTo(mymap);
                        marker.bindPopup("<b>Gambella General Hospital!</b><br>Samples: 0").openPopup();

                        var marker = L.marker([6.02797 , 37.55298]).addTo(mymap);
                        marker.bindPopup("<b>ArbaMinch Hospital!</b><br>Samples: 0").openPopup();

                        var marker = L.marker([6.75001 , 38.39411]).addTo(mymap);
                        marker.bindPopup("<b>Yirgalem General Hospital!</b><br>Samples: 0").openPopup();


                    </script>
           


          <!-- Content Row -->
          <div class="row">

            <!-- Content Column -->
            <div class="col-lg-12 mb-4">

              <!-- Project Card Example -->
              <div class="card shadow mb-4">
                <div class="card-header py-3">
                  <h6 class="m-0 font-weight-bold text-primary">Progress</h6>
                </div>
                <div class="card-body">
                  <h4 class="small font-weight-bold">Sample Collection Target: 500  <span class="float-right"><asp:Label  runat="server" ID="lblsamplecoltar"  Text=""/>%</span></h4>
                  <div class="progress mb-4">
                    <div class="progress-bar bg-danger" role="progressbar" style="width: 1%" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100"></div>
                  </div>
                  <h4 class="small font-weight-bold"> Isolate Storage<span class="float-right"><asp:Label  runat="server" ID="lblisolatetar"  Text=""/>%</span></h4>
                  <div class="progress mb-4">
                    <div class="progress-bar bg-warning" role="progressbar" style="width: 1%" aria-valuenow="10" aria-valuemin="0" aria-valuemax="100"></div>
                  </div>
                 
                </div>
              </div>
                


       
        
  

</div>
        </div>
</asp:Content>