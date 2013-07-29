Ext.Loader.setPath({
    'Ext.ux.desktop': '/assets/app/view/desktop'
});

Ext.application({
    requires: ['CMS.view.CmsDesktop'],
    name: 'CMS',
    appFolder: '/assets/app',
    controllers: ['Users'],
    launch: function() {
        cmsDesktop = new CMS.view.CmsDesktop();
    }
//    autoCreateViewport:true

});
