// Models are typically used with a Store, which is basically a collection of Model instances.
Ext.define('CMS.store.Users', {
    extend: 'Ext.data.Store',

    model: 'CMS.model.User',
    autoLoad: true,
    autoSync: false,

    proxy: {
        url: '/users',
        type: 'rest',
        format: 'json',

        reader: {
            root: 'users',
            record: 'user',
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
            console.log(arguments);
        },
        update: function() {
            console.log(arguments);
        },
        beforesync: function() {
            console.log(arguments);
        }
    }
});