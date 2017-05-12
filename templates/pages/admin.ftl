<!DOCTYPE html>
[#compress]
<html xml:lang="${cmsfn.language()}" lang="${cmsfn.language()}">
<head>
    [@cms.page /]
    <meta charset="utf-8" />
  	<link rel="apple-touch-icon" sizes="76x76" href="/ragbag-admin/webresources-paper-dashboard/img/apple-icon.png">
  	<link rel="icon" type="image/png" sizes="96x96" href="/ragbag-admin/webresources-paper-dashboard/img/favicon.png">
  	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

  	<title>Ragbag Administrace</title>

  	<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
    <meta name="viewport" content="width=device-width" />

    ${resfn.css(["/ragbag-admin/webresources-paper-dashboard/css/bootstrap.min.css",
                "/ragbag-admin/webresources-paper-dashboard/css/animate.min.css",
                "/ragbag-admin/webresources-paper-dashboard/css/paper-dashboard.css",
                "/ragbag-admin/webresources-paper-dashboard/css/custom.css"])!}

    <link href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
    <link href='https://fonts.googleapis.com/css?family=Muli:400,300' rel='stylesheet' type='text/css'>

    ${resfn.css(["/ragbag-admin/webresources-paper-dashboard/css/themify-icons.css"])!}


    ${resfn.css(["/ragbag-admin/webresources/css/.*.css"])!}

    ${resfn.js(["/ragbag-admin/webresources/js/jquery.min.js",
                "/ragbag/webresources/js/vue.min.js",
                "/ragbag/webresources/js/vue-resource.min.js",
                "/ragbag/webresources/plugins/isotope/isotope.pkgd.min.js",
                "/ragbag-admin/webresources/js/lodash.js",
                "/ragbag-admin/webresources/js/.*.js"])!}

    <!-- <script src="/magnoliaAuthor/ragbag-admin/ordersAreas/orders.js"></script> -->


</head>
<body class="admin ${cmsfn.language()}" >

  <div class="wrapper">


      <div class="main-panel">
          <nav class="navbar navbar-default">
              <div class="container-fluid">
                  <div class="navbar-header">
                      <a href="http://www.ragbag.cz" class="navbar-brand" target="_blank">
                          RagBag.cz
                          <span>Objednávky</span>
                      </a>
                  </div>
              </div>
          </nav>


          <div class="content">
              <div class="container-fluid">
                  <div class="row">
                      [@cms.area name="ordersAreas"/]
                  </div>


              </div>
          </div>

      </div>
  </div>


     ${resfn.js(["/ragbag-admin/webresources-paper-dashboard/js/jquery-1.10.2.js",
                 "/ragbag-admin/webresources-paper-dashboard/js/bootstrap.min.js",
                 "/ragbag-admin/webresources-paper-dashboard/js/bootstrap-checkbox-radio.js",
                 "/ragbag-admin/webresources-paper-dashboard/js/chartist.min.js",
                 "/ragbag-admin/webresources-paper-dashboard/js/bootstrap-notify.js",
                 "/ragbag-admin/webresources-paper-dashboard/js/paper-dashboard.js",
                 "/ragbag-admin/webresources-paper-dashboard/js/demo.js",
                 "/ragbag/webresources/js/mgnl_rest_friendly_flatten.js"])!}

</body>

</html>
[/#compress]
