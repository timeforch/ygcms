// Models are typically used with a Store, which is basically a collection of Model instances.
Ext.define('CMS.store.Users', {
    extend: 'Ext.data.Store',

    model: 'CMS.model.User',
    autoLoad: true,
    autoSync: false,
    pageSize: 20,

    proxy: {
        url: '/users',
        type: 'rest',
        format: 'json',

        reader: {
            root: 'data',
            record: 'user',
            totalProperty: 'total',
            successProperty: 'success',
            messageProperty: 'errors'
        },
        writer: {
            // wrap user params for Rails
            getRecordData: function(record) {
                return { user: record.data };
            }
        }
    } ,

    listeners: {
        load: function() {
//            console.log(arguments);
        },
        update: function(store) {
            console.log(arguments);
            store.sync();
        },
        beforesync: function() {
           alert('ok')
        }
    }
});