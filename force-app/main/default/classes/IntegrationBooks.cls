@RestResource(urlMapping='/books/*')
global with sharing class IntegrationBooks {
    
    @HttpGet
    global static List<Book__c> getBooks() {
        RestRequest req = RestContext.request;
        Map<String,String> parameters = req.params;

        String title = parameters.get('book_name');
        String isbn13 = parameters.get('isbn_13');
        String isbn10 = parameters.get('isbn_10');

        String fieldsBook = String.join(IntegrationUtils.getFields('Book__c'), ', ');

        String fieldsCategory = String.join(
            IntegrationUtils.addRelationshipObjectToFields(IntegrationUtils.getFields('Category__c'), 'Category__r'), 
            ','
        );

        String filter = String.isNotEmpty(title) ? ' WHERE Name = :title' : ''; 
        filter = String.isNotEmpty(isbn13) ? (String.isNotEmpty(title) ? ' AND ISBN__c = :isbn13' : ' WHERE ISBN__c = :isbn13') : filter;
        filter = String.isNotEmpty(isbn10) ? (String.isNotEmpty(title) ? ' AND ISBN10__c = :isbn10' : ' WHERE ISBN10__c = :isbn10') : filter;

        String query = 'SELECT ' + fieldsBook + ', (SELECT ' + fieldsCategory + ' from BookCategories__r) ' +
                        ' FROM Book__c' + filter + ' ORDER BY Name';

        List<Book__c> bookList = Database.query(query);
        return bookList;

        // String jsonString = JSON.serialize(bookList);

        // System.debug((List<Object>) JSON.deserializeUntyped(jsonString));
        // List<Object> myObj = (List<Object>) JSON.deserializeUntyped(jsonString);
        // Map<String,Object> o = (Map<String,Object>) myObj[0];
        // system.debug((String) o.get('Name'));



        // return new ResponseModel(myObj);
    }

    global class ResponseModel {
        global List<Object> response;

        global ResponseModel(List<Object> data){
            this.response = data;
        }
    }

    global class Response {
        global List<String> response;

        global Response(){
        }
    }

    
}