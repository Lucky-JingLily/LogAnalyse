<%--
  Created by IntelliJ IDEA.
  User: 62362
  Date: 2019/4/6
  Time: 9:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="zh">
<head>

  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>JYJ Analyze Dashboard</title>

  <!--Favicon -->
  <link rel="icon" href="assets/img/favicon.ico" type="image/x-icon"/>

  <!--Bootstrap.min css-->
  <link rel="stylesheet" href="assets/plugins/bootstrap/css/bootstrap.min.css">

  <!--Icons css-->
  <link rel="stylesheet" href="assets/css/icons.css">

  <!--Style css-->
  <link rel="stylesheet" href="assets/css/style.css">

  <!--mCustomScrollbar css-->
  <link rel="stylesheet" href="assets/plugins/scroll-bar/jquery.mCustomScrollbar.css">

  <!--Sidemenu css-->
  <link rel="stylesheet" href="assets/plugins/toggle-menu/sidemenu.css">

  <!--Chartist css-->
  <link rel="stylesheet" href="assets/plugins/chartist/chartist.css">
  <link rel="stylesheet" href="assets/plugins/chartist/chartist-plugin-tooltip.css">

  <!--Full calendar css-->
  <link rel="stylesheet" href="assets/plugins/fullcalendar/stylesheet1.css">

  <!--morris css-->
  <link rel="stylesheet" href="assets/plugins/morris/morris.css">

  <%
    long nowTime = System.currentTimeMillis();
    System.out.println("---------------------------------------nowTime = " + nowTime + "---------------------------------------");
    long lastTime = nowTime - 3600000;
    System.out.println("---------------------------------------lastTime = " + lastTime + "---------------------------------------");
  %>
</head>

<body class="app ">

<div id="spinner"></div>

<div id="app">
  <div class="main-wrapper" >
    <nav class="navbar navbar-expand-lg main-navbar">
      <a class="header-brand" href="index.jsp">
        <img src="assets/img/brand/logo.png" class="header-brand-img" alt="JYJ Analyze  logo">
      </a>
      <form class="form-inline mr-auto">
        <ul class="navbar-nav mr-3">
          <li><a href="#" data-toggle="sidebar" class="nav-link nav-link-lg"><i class="ion ion-navicon-round"></i></a></li>
          <li><a href="#" data-toggle="search" class="nav-link nav-link-lg d-md-none navsearch"><i class="ion ion-search"></i></a></li>
        </ul>
      </form>
      <ul class="navbar-nav navbar-right">
        <li class="dropdown dropdown-list-toggle">
          <a href="#" class="nav-link nav-link-lg full-screen-link">
            <i class="ion-arrow-expand"  id="fullscreen-button"></i>
          </a>
        </li>
        <li class="dropdown"><a href="#" data-toggle="dropdown" class="nav-link dropdown-toggle nav-link-lg">
          <img src="assets/img/avatar/avatar-1.jpeg.jpg" alt="profile-user" class="rounded-circle w-32">
          <div class="d-sm-none d-lg-inline-block">JingYujie</div></a>
          <div class="dropdown-menu dropdown-menu-right">
            <a href="login.jsp" class="dropdown-item has-icon">
              <i class="ion-ios-redo"></i> Logout
            </a>
          </div>
        </li>
      </ul>
    </nav>

    <aside class="app-sidebar">
      <div class="app-sidebar__user">
        <div class="dropdown">
          <a class="nav-link pl-2 pr-2 leading-none d-flex" data-toggle="dropdown" href="#">
            <img alt="image" src="assets/img/avatar/avatar-1.jpeg.jpg" class=" avatar-md rounded-circle">
            <span class="ml-2 d-lg-block">
									<span class="text-white app-sidebar__user-name mt-5">JingYujie</span><br>
									<span class="text-muted app-sidebar__user-name text-sm"> Web-Designer</span>
								</span>
          </a>
        </div>
      </div>
      <ul class="side-menu">
        <li class="slide">
          <a class="side-menu__item"  data-toggle="slide" href="#"><i class="side-menu__icon fa fa-desktop"></i><span class="side-menu__label">Dashboard</span><i class="angle fa fa-angle-right"></i></a>
          <ul class="slide-menu">
            <li><a class="slide-item"  href="FindNginx"><span>Nginx服务器VTS分析</span></a></li>
            <li><a class="slide-item" href="FindMessages"><span>云服务器Message分析</span></a></li>
            <li><a class="slide-item" href="FindElasticsearch"><span>Elasticsearch Log分析</span></a></li>
          </ul>
        </li>
        <li class="slide">
          <a class="side-menu__item" data-toggle="slide" href="#"><i class="side-menu__icon fa fa-table"></i><span class="side-menu__label">Tables</span><i class="angle fa fa-angle-right"></i></a>
          <ul class="slide-menu">
            <li><a href="FindTables" class="slide-item">Nginx日志过滤展示</a></li>
            <li><a href="FindDataTables" class="slide-item"> 云服务器信息展示</a></li>
          </ul>
        </li>
        <li class="slide">
          <a class="side-menu__item" data-toggle="slide" href="#"><i class="side-menu__icon fa fa-map"></i><span class="side-menu__label">Maps</span><i class="angle fa fa-angle-right"></i></a>
          <ul class="slide-menu">
            <li><a href="FindMaps" class="slide-item"> Nginx访问分析</a></li>
            <li><a href="FindVectorMaps" class="slide-item">Nginx访问地图</a></li>
          </ul>
        </li>
      </ul>
    </aside>

    <div class="app-content">
      <section class="section">
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="#">Home</a></li>
          <li class="breadcrumb-item active" aria-current="page">Elasticsearch Log分析</li>
        </ol>

        <div class="row">
          <div class="col-lg-6 col-xl-3 col-md-6 col-12">
            <div class="card">
              <div class="card-body">
                <div class="dash2 text-center">
                  <div class="">
                    <h3 class="float-left text-muted">ES集群状态</h3>
                  </div>
                  <div class="mb-0 ">
                    <iframe src="http://grafana.lpj.com:80/d-solo/jnaX9hemz/elasticsearch_back_two?orgId=1&from=<%=lastTime%>&to=<%=nowTime%>&var-interval=%24__auto_interval_interval&var-cluster=jyj-es&var-node=All&panelId=8" width="224.8" height="124.8" frameborder="0"></iframe>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="col-lg-6 col-xl-3 col-md-6 col-12">
            <div class="card">
              <div class="card-body ">
                <div class="dash2 text-center">
                  <div class="">
                    <h3 class="float-left text-muted">活跃分片数</h3>
                  </div>
                  <div class="mb-0 ">
                    <iframe src="http://grafana.lpj.com:80/d-solo/jnaX9hemz/elasticsearch_back_two?orgId=1&from=<%=lastTime%>&to=<%=nowTime%>&var-interval=%24__auto_interval_interval&var-cluster=jyj-es&var-node=All&panelId=39" width="224.8" height="124.8" frameborder="0"></iframe>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="col-lg-6 col-xl-3 col-md-6 col-12">
            <div class="card">
              <div class="card-body ">
                <div class="dash2 text-center">
                  <div class="">
                    <h3 class="float-left text-muted">未分配分片数</h3>
                  </div>
                  <div class="mb-0 "><iframe src="http://grafana.lpj.com:80/d-solo/jnaX9hemz/elasticsearch_back_two?orgId=1&from=<%=lastTime%>&to=<%=nowTime%>&var-interval=%24__auto_interval_interval&var-cluster=jyj-es&var-node=All&panelId=42" width="224.8" height="124.8" frameborder="0"></iframe></div>
                </div>
              </div>
            </div>
          </div>
          <div class="col-lg-6 col-xl-3 col-md-6 col-12">
            <div class="card">
              <div class="card-body ">
                <div class="dash2 text-center">
                  <div class="">
                    <h3 class="float-left text-muted">Pending任务数</h3>
                  </div>
                  <div class="mb-0 ">
                    <iframe src="http://grafana.lpj.com:80/d-solo/jnaX9hemz/elasticsearch_back_two?orgId=1&from=<%=lastTime%>&to=<%=nowTime%>&var-interval=%24__auto_interval_interval&var-cluster=jyj-es&var-node=All&panelId=16" width="224.8" height="124.8" frameborder="0"></iframe>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>

        <div class="row">
          <div class="col-lg-12 col-xl-6 col-md-12 col-12 col-sm-12">
            <div class="card">
              <div class="card-header">
                <h4>ES查询时间分析</h4>
              </div>
              <div class="card-body">
                <iframe src="http://grafana.lpj.com:80/d-solo/jnaX9hemz/elasticsearch_back_two?orgId=1&from=<%=lastTime%>&to=<%=nowTime%>&var-interval=%24__auto_interval_interval&var-cluster=jyj-es&var-node=All&panelId=33" width="579.6" height="250" frameborder="0"></iframe>
              </div>
            </div>
          </div>
          <div class="col-lg-12 col-xl-6 col-md-12 col-12 col-sm-12">
            <div class="card">
              <div class="card-header">
                <h4>ES插入时间分析</h4>
              </div>
              <div class="card-body">
                <iframe src="http://grafana.lpj.com:80/d-solo/jnaX9hemz/elasticsearch_back_two?orgId=1&from=<%=lastTime%>&to=<%=nowTime%>&var-interval=%24__auto_interval_interval&var-cluster=jyj-es&var-node=All&panelId=5" width="579.6" height="250" frameborder="0"></iframe>
              </div>
            </div>
          </div>
        </div>

        <div class="row">
          <div class="col-lg-8 col-md-12 col-12 col-sm-12">
            <div class="card">
              <div class="card-header">
                <h4>ES集群GC分析</h4>
              </div>
              <div class="card-body">
                <iframe src="http://grafana.lpj.com:80/d-solo/OKjw92eiz/elasticsearch_back?orgId=1&from=<%=lastTime%>&to=<%=nowTime%>&var-interval=%24__auto_interval_interval&var-cluster=jyj-es&var-name=All&var-instance=elasticsearch&panelId=7" width="802.79" height="250" frameborder="0"></iframe>
              </div>
            </div>
          </div>
          <div class="col-lg-4 col-md-12 col-12 col-sm-12">
            <div class="card">
              <div class="card-header">
                <h4>ES集群JVM分析</h4>
              </div>
              <div class="card-body">
                <iframe src="http://grafana.lpj.com:80/d-solo/OKjw92eiz/elasticsearch_back?orgId=1&from=<%=lastTime%>&to=<%=nowTime%>&var-interval=%24__auto_interval_interval&var-cluster=jyj-es&var-name=All&var-instance=elasticsearch&panelId=50" width="356.39" height="250" frameborder="0"></iframe>
              </div>
            </div>
          </div>
        </div>
      </section>

      <footer class="main-footer">
        <div class="text-center">
          Copyright &copy; JYJ Analyze by JYJ Technologies 2019
        </div>
      </footer>

    </div>
  </div>

  <!--Jquery.min js-->
  <script src="assets/js/jquery.min.js"></script>

  <!--popper js-->
  <script src="assets/js/popper.js"></script>

  <!--Tooltip js-->
  <script src="assets/js/tooltip.js"></script>

  <!--Bootstrap.min js-->
  <script src="assets/plugins/bootstrap/js/bootstrap.min.js"></script>

  <!--Jquery.nicescroll.min js-->
  <script src="assets/plugins/nicescroll/jquery.nicescroll.min.js"></script>

  <!--Scroll-up-bar.min js-->
  <script src="assets/plugins/scroll-up-bar/dist/scroll-up-bar.min.js"></script>

  <!--mCustomScrollbar js-->
  <script src="assets/plugins/scroll-bar/jquery.mCustomScrollbar.concat.min.js"></script>

  <!--Sidemenu js-->
  <script src="assets/plugins/toggle-menu/sidemenu.js"></script>

  <!--Jquery.knob js-->
  <script src="assets/plugins/othercharts/jquery.knob.js"></script>

  <!--Jquery.sparkline js-->
  <script src="assets/plugins/othercharts/jquery.sparkline.min.js"></script>

  <!--othercharts js-->
  <script src="assets/js/othercharts.js"></script>

  <!--Morris js-->
  <script src="assets/plugins/morris/morris.min.js"></script>
  <script src="assets/plugins/morris/raphael.min.js"></script>

  <!--Scripts js-->
  <script src="assets/js/scripts.js"></script>
  <script src="assets/js/apexcharts.js"></script>
  <script src="assets/js/dashboard3.js"></script>
</div>
</body>
</html>