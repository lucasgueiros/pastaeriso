</head>

	<body class="vsc-initialized">
		<nav class="navbar navbar-dark sticky-top bg-dark flex-md-nowrap p-0 shadow">
			<a class="navbar-brand col-md-3 col-lg-2 mr-0 px-3" href="#">Pasta e Riso</a>
			<button class="navbar-toggler position-absolute d-md-none collapsed" type="button" data-toggle="collapse" data-target="#sidebarMenu" aria-controls="sidebarMenu" aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<input class="form-control form-control-dark w-100" type="text" placeholder="Search" aria-label="Search">
				<ul class="navbar-nav px-3">
					<li class="nav-item text-nowrap">
					<a class="nav-link" href="#">Sair</a>
				</li>
			</ul>
		</nav>

		<div class="container-fluid">
		  <div class="row">
		  <!--Menu-->
			<nav id="sidebarMenu" class="col-md-3 col-lg-2 d-md-block bg-light sidebar collapse">
			  <div class="sidebar-sticky pt-3">
				<ul class="nav flex-column">
				  <li class="nav-item">
					<a class="nav-link <%= request.getParameter("active").equals("index")? "active" : ""%>" href="index.jsp">
					  <span data-feather="home"></span>
					  Home <span class="sr-only">(current)</span>
					</a>
				  </li>
				  <li class="nav-item">
  					<a class="nav-link <%= request.getParameter("active").equals("pedidos")? "active" : ""%>" href="prepare">
  					  <span data-feather="edit-3"></span>
  					  Pedidos
  					</a>
				  </li>
					<li class="nav-item">
  					<a class="nav-link <%= request.getParameter("active").equals("receitas")? "active" : ""%>" href="prepareReceitas">
  					  <span data-feather="book"></span>
  					  Receitas
  					</a>
				  </li>
					<li class="nav-item">
						<a class="nav-link <%= request.getParameter("active").equals("Produto")? "active" : ""%>" href="prepareProdutos">
						  <span data-feather="box"></span>
						  Produtos
						</a>
				  </li>
				  <li class="nav-item">
						<a class="nav-link <%= request.getParameter("active").equals("Dashboard")? "active" : ""%>" href="dashboard.jsp">
						  <span data-feather="shopping-cart"></span>
						  Compras
						</a>
				  </li>
				  <li class="nav-item">
					<a class="nav-link" href="#">
					  <span data-feather="users"></span>
					  Clientes
					</a>
				  </li>
				  <li class="nav-item">
					<a class="nav-link" href="#">
					  <span data-feather="pie-chart"></span>
					  Relatorios
					</a>
				  </li>
				  <li class="nav-item">
					<a class="nav-link" href="https://github.com/lucasgueiros/pastaeriso/issues">
					  <span data-feather="plus"></span>
					  Nova funcionalidade
					</a>
				  </li>
				</ul>

				<h6 class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted">
				  <span>Saved reports</span>
				  <a class="d-flex align-items-center text-muted" href="#" aria-label="Add a new report">
					<span data-feather="plus-circle"></span>
				  </a>
				</h6>
				<ul class="nav flex-column mb-2">
				  <li class="nav-item">
					<a class="nav-link" href="#">
					  <span data-feather="file-text"></span>
					  Current month
					</a>
				  </li>
				  <li class="nav-item">
					<a class="nav-link" href="#">
					  <span data-feather="file-text"></span>
					  Last quarter
					</a>
				  </li>
				  <li class="nav-item">
					<a class="nav-link" href="#">
					  <span data-feather="file-text"></span>
					  Social engagement
					</a>
				  </li>
				  <li class="nav-item">
					<a class="nav-link" href="#">
					  <span data-feather="file-text"></span>
					  Year-end sale
					</a>
				  </li>
				</ul>
			  </div>
			</nav>

			<main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-md-4"><div class="chartjs-size-monitor" style="position: absolute; left: 0px; top: 0px; right: 0px; bottom: 0px; overflow: hidden; pointer-events: none; visibility: hidden; z-index: -1;"><div class="chartjs-size-monitor-expand" style="position:absolute;left:0;top:0;right:0;bottom:0;overflow:hidden;pointer-events:none;visibility:hidden;z-index:-1;"><div style="position:absolute;width:1000000px;height:1000000px;left:0;top:0"></div></div><div class="chartjs-size-monitor-shrink" style="position:absolute;left:0;top:0;right:0;bottom:0;overflow:hidden;pointer-events:none;visibility:hidden;z-index:-1;"><div style="position:absolute;width:200%;height:200%;left:0; top:0"></div></div></div>
			<div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
	<h1 class="h2"><%=request.getParameter("title")%></h1>
	<div class="btn-toolbar mb-2 mb-md-0">
