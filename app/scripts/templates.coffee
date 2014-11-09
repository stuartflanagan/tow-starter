angular.module('tow.view.Templates', ['views/_/entity-container.html', 'views/_/entity-item-container.html', 'views/content-index.html', 'views/directives/tow-entity.html', 'views/directives/tow-utility-menu.html', 'views/entities/entity-item.html', 'views/entities/entity.html', 'views/main.html', 'views/test.html'])

angular.module("views/_/entity-container.html", []).run(["$templateCache", ($templateCache) ->
  $templateCache.put("views/_/entity-container.html",
    "<div ng-include=\"path\"></div>")
])

angular.module("views/_/entity-item-container.html", []).run(["$templateCache", ($templateCache) ->
  $templateCache.put("views/_/entity-item-container.html",
    "<div ng-include=\"path\"></div>")
])

angular.module("views/content-index.html", []).run(["$templateCache", ($templateCache) ->
  $templateCache.put("views/content-index.html",
    "<div ng-controller=\"TowEntityIndexCtrl\" ng-init=\"init(9)\" class=\"grid\">\n" +
    "  <h2 class=\"page-title\">Content</h2>\n" +
    "  <md-list>\n" +
    "    <md-item tow-entity-item=\"tow-entity-item\" ng-repeat=\"item in items\" item=\"item\">Loading...</md-item>\n" +
    "  </md-list>\n" +
    "  <div class=\"container\">\n" +
    "    <div class=\"row\">\n" +
    "      <div class=\"col-sm-9\">\n" +
    "        <div tow-loading-spinner=\"tow-loading-spinner\" data-watch=\"isLoading\" class=\"dj-loading-spinner\"></div>\n" +
    "        <button ng-show=\"moreToLoad\" ng-click=\"loadMore($event)\">Load more...</button>\n" +
    "      </div>\n" +
    "    </div>\n" +
    "  </div>\n" +
    "</div>")
])

angular.module("views/directives/tow-entity.html", []).run(["$templateCache", ($templateCache) ->
  $templateCache.put("views/directives/tow-entity.html",
    "<div tow-entity=\"tow-entity\" ng-if=\"item\" item=\"item\"></div>\n" +
    "<div tow-loading-spinner=\"tow-loading-spinner\" data-watch=\"isLoading\" class=\"dj-loading-spinner\"></div>")
])

angular.module("views/directives/tow-utility-menu.html", []).run(["$templateCache", ($templateCache) ->
  $templateCache.put("views/directives/tow-utility-menu.html",
    "<md-bottom-sheet class=\"grid\">\n" +
    "  <md-list>\n" +
    "    <md-item ng-repeat=\"item in items\" ng-click=\"listItemClick($index)\">\n" +
    "      <div class=\"md-item-content\">\n" +
    "        <div class=\"md-icon-container\">\n" +
    "          <md-inline-grid-icon icon=\"{{item.icon}}\"></md-inline-grid-icon>\n" +
    "        </div>\n" +
    "        <p class=\"md-grid-text\"> {{ item.name }} </p>\n" +
    "      </div>\n" +
    "    </md-item>\n" +
    "  </md-list>\n" +
    "</md-bottom-sheet>")
])

angular.module("views/entities/entity-item.html", []).run(["$templateCache", ($templateCache) ->
  $templateCache.put("views/entities/entity-item.html",
    "<md-card>\n" +
    "  <div class=\"type\"><a ng-href=\"/content?type={{item.type}}\">{{item.type}}</a></div><a ng-href=\"entity/{{item._id}}\"><img ng-src=\"{{item.image.url}}\" alt=\"{{item.title}}\" width=\"100%\"/></a>\n" +
    "  <h2><a ng-href=\"entity/{{item._id}}\">{{item.title}}</a></h2>\n" +
    "  <p>{{item.summary}}</p>\n" +
    "  <div class=\"tags\">\n" +
    "    <div ng-repeat=\"tag in item.tags track by $index\" class=\"tag\"><a ng-href=\"/content?tags={{tag}}\">{{tag}}</a><span ng-if=\"!$last\">,&nbsp;</span></div>\n" +
    "  </div>\n" +
    "</md-card>")
])

angular.module("views/entities/entity.html", []).run(["$templateCache", ($templateCache) ->
  $templateCache.put("views/entities/entity.html",
    "<div ng-if=\"item\">\n" +
    "  <h1>{{item.title}}</h1>\n" +
    "  <figure><img ng-src=\"{{item.image.url}}\" alt=\"{{item.image.title}}\" width=\"100%\"/>\n" +
    "    <figcaption>{{item.image.caption}}</figcaption>\n" +
    "  </figure>\n" +
    "  <p>{{item.body}}</p>\n" +
    "</div>")
])

angular.module("views/main.html", []).run(["$templateCache", ($templateCache) ->
  $templateCache.put("views/main.html",
    "<div class=\"jumbotron\">\n" +
    "  <h1>'Allo, 'Allo!\n" +
    "    <p class=\"lead\"><img src=\"images/yeoman.png\" alt=\"I'm Yeoman\"/><br/>Always a pleasure scaffolding your apps.</p>\n" +
    "    <p><a ng-href=\"#\" class=\"btn btn-lg btn-success\">Splendid!<span class=\"glyphicon glyphicon-ok\"></span></a></p>\n" +
    "  </h1>\n" +
    "  <div class=\"row marketing\">\n" +
    "    <h4>HTML5 Boilerplate</h4>\n" +
    "    <p>HTML5 Boilerplate is a professional front-end template for building fast, robust, and adaptable web apps or sites.</p>\n" +
    "    <h4>Angular</h4>\n" +
    "    <p>AngularJS is a toolset for building the framework most suited to your application development.</p>\n" +
    "    <h4>Karma</h4>\n" +
    "    <p>Spectacular Test Runner for JavaScript.</p>\n" +
    "  </div>\n" +
    "</div>")
])

angular.module("views/test.html", []).run(["$templateCache", ($templateCache) ->
  $templateCache.put("views/test.html",
    "<div class=\"test\">hello</div>")
])
