@RestResource(urlMapping='/readings/*')
global with sharing class IntegrationReadings {

    @HttpGet
    global static List<Reading__c> getReadings() {
        RestRequest req = RestContext.request;
        Map<String,String> parameters = req.params;

        List<Reading__c> readList = new List<Reading__c>();

        RestResponse res = RestContext.response;
        res.statusCode = 200;        

        String username = parameters.get('username');

        if(String.isEmpty(username)) {
            res.statusCode = 414;
            return readList;
        }

        String fields = String.join(IntegrationUtils.getFields('Reading__c'), ', ');

        String fieldsBook = String.join(
        IntegrationUtils.addRelationshipObjectToFields(IntegrationUtils.getFields('Book__c'), 'Book__r'), 
            ','
        );

        String fieldsQuiz = String.join(
        IntegrationUtils.addRelationshipObjectToFields(IntegrationUtils.getFields('Quiz__c'), 'Quiz__r'), 
            ','
        );

        String query = 'SELECT ' + fields + ', ' + fieldsBook + ', ' + fieldsQuiz +
                        ' FROM Reading__c WHERE Account__r.Username__c =: username ORDER BY LastModifiedDate DESC';

        readList = Database.query(query);
        return readList;
    }
}