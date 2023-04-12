public with sharing class BookCategoryHelper {
    
    public static void setExternalId(List<BookCategory__c> newRecordList) {
        Set<Id> bookIdsSet = new Set<Id>();
        Set<Id> categoryIdsSet = new Set<Id>();

        for(BookCategory__c bookCategory : newRecordList) {
            bookIdsSet.add(bookCategory.Book__c);
            categoryIdsSet.add(bookCategory.Category__c);
        }

        Map<Id, Book__c> bookMap = new Map<Id, Book__c>([SELECT Id, ISBN__c, ISBN10__c FROM Book__c WHERE Id IN: bookIdsSet]);
        Map<Id, Product2> categoryMap = new Map<Id, Product2>([SELECT Id, ExternalId__c FROM Product2 WHERE Id IN: categoryIdsSet]);

        for(BookCategory__c bookCategory : newRecordList) {
            String isbn10 = bookMap.get(bookCategory.Book__c).ISBN10__c;
            String isbn13 = bookMap.get(bookCategory.Book__c).ISBN__c;
            String externalId = categoryMap.get(bookCategory.Category__c).ExternalId__c;

            if(!String.isEmpty(isbn10)) {
                bookCategory.ExternalId10__c = isbn10.trim() + externalId.trim();
            }

            if(!String.isEmpty(isbn13)) {
                bookCategory.ExternalId13__c = isbn13.trim() + externalId.trim();
            }
        }
    }
}