public with sharing class MetaDataHandler
 {
	public MetaDataHandler()
    {

	}

	public static MetadataService.MetadataPort createService()
    { 
        MetadataService.MetadataPort service = new MetadataService.MetadataPort();
        service.SessionHeader = new MetadataService.SessionHeader_element();
        service.SessionHeader.sessionId = UserInfo.getSessionId();
        return service;     
    }

    public static void createObject()
    {
        MetadataService.MetadataPort service = createService();     
        MetadataService.CustomObject customObject = new MetadataService.CustomObject();
        customObject.fullName = 'Test__c';
        customObject.label = 'Test';
        customObject.pluralLabel = 'Tests';
        customObject.nameField = new MetadataService.CustomField();
        customObject.nameField.type_x = 'Text';
        customObject.nameField.label = 'Test Record';
        customObject.deploymentStatus = 'Deployed';
        customObject.sharingModel = 'ReadWrite';
        try
        {
        	List<MetadataService.SaveResult> results = service.createMetadata(new MetadataService.Metadata[] { customObject }); 
        	system.debug('Object creation successful using meta data api');
        }
        catch(Exception e)
        {
        	system.debug('Error Occured while creating object:--' + e.getMessage());
        }      

    }

    public static void createField()
    {
        MetadataService.MetadataPort service = createService();     
        MetadataService.CustomField customField = new MetadataService.CustomField();
        customField.fullName = 'Test__c.TestField__c';
        customField.label = 'Test Field';
        customField.type_x = 'Text';
        customField.length = 42;
        try
        {
        	List<MetadataService.SaveResult> results = service.createMetadata(new MetadataService.Metadata[] { customField });                
        }
        catch(Exception e)
        {
        	system.debug('Error Occured while creating object');
        }   
    }
}