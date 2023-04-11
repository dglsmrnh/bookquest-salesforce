@RestResource(urlMapping='/products/*')
global with sharing class IntegrationProducts {

    @HttpGet
    global static List<Product2> getProductByType() {
        RestRequest req = RestContext.request;
        Map<String,String> parameters = req.params;

        String type = parameters.get('type');

        String fields = String.join(IntegrationUtils.getFields('Product2'), ', ');

        String filter = String.isNotEmpty(type) ? ' WHERE Family = :type' : ''; 

        String query = 'SELECT ' + fields + ' FROM Product2' + filter + ' ORDER BY Name';

        List<Product2> prodList = Database.query(query);
        return prodList;
    }

    @HttpPost
    global static List<Product2> getProductByExternalId(IntegrationProductsData.ProductByIdRequest request) {

        List<String> lstIds = request.externalIds;

        // for(IntegrationProductsData.ProductByIdRequest req : request) {
        //     lstIds.add(req.externalId);
        // }

        if(lstIds.size() <= 0) {
            return new List<Product2>();
        }

        String fields = String.join(IntegrationUtils.getFields('Product2'), ', ');

        String filter = ' WHERE ExternalId__c IN: lstIds'; 

        String query = 'SELECT ' + fields + ' FROM Product2' + filter + ' ORDER BY Name';

        List<Product2> prodList = Database.query(query);
        return prodList;
    }
}