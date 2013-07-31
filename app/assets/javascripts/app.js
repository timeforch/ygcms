Ext.Loader.setPath({
    'Ext.ux.desktop': '/assets/app/view/desktop',
    'CMS.controller': '/assets/app/controller',
    'CMS.model': '/assets/app/model',
    'CMS.store': '/assets/app/store',
    'CMS.view': '/assets/app/view'
});

var application;
Ext.application({
    requires: ['CMS.view.CmsDesktop'],
    name: 'CMS',
    appFolder: '/assets/app',
    appProperty: 'cmsApp',
    controllers: [],
    launch: function() {
        application = this;
        cmsDesktop = new CMS.view.CmsDesktop();
    }
});

//Ext.define('CMS.application', {
//    extend: 'Ext.app.Application',
//
//    addController: function(name) {
//        var c = this.getController(name);
//        c.init(this);
//        c.onLaunch(this);
//    }
//})

//var cmsDesktop;
//var application = new Ext.app.Application({
//    name: 'CMS',
//    appFolder: 'app',
//    controllers: [],
//    launch: function() {
////        Ext.require('CMS.view.CmsDesktop', function() {
//            cmsDesktop = new CMS.view.CmsDesktop();
////        });
//    }
//});

//Ext.require('CMS.view.CmsDesktop');
//
//var cmsDesktop;
//var application;
//Ext.onReady(function() {
//    application = new Ext.app.Application({
//        name: 'CMS',
////        appFolder: 'app',
//        controllers: [],
//        launch: function() {
//            cmsDesktop = new CMS.view.CmsDesktop();
//        }
//    });
//});


