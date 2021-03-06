//Generated by wsdl2apex

public class AsyncOwsSpartaCom {
    public class AsyncAllerganAPIHttpSoap11Endpoint {
        public String endpoint_x = 'http://cprdevreports.allergan.com/AllerganAPI/services/AllerganAPI.AllerganAPIHttpSoap11Endpoint/';
        public Map<String,String> inputHttpHeaders_x;
        public String clientCertName_x;
        public Integer timeout_x;
        private String[] ns_map_type_info = new String[]{'http://api.sparta.com', 'apiSpartaCom', 'ows.sparta.com', 'owsSpartaCom'};
        public AsyncApiSpartaCom.createPRResponse_elementFuture beginCreatePR(System.Continuation continuation,String UserName,String Password,String caseNumber,String recordedBy,String sapServiceCallNum,String customerId,String customerFirstName,String customerLastName,String accountName,String email,String contactPhone,String street,String city,String state,String zipCode,String country,DateTime createdDate,DateTime callCreatedOn,Date awareDate,Date eventDate,String region,String origin,String subject,String description,String callType,String groupName,Integer coolqEmpId,String veevaOrgId) {
            apiSpartaCom.createPR_element request_x = new apiSpartaCom.createPR_element();
            request_x.UserName = UserName;
            request_x.Password = Password;
            request_x.caseNumber = caseNumber;
            request_x.recordedBy = recordedBy;
            request_x.sapServiceCallNum = sapServiceCallNum;
            request_x.customerId = customerId;
            request_x.customerFirstName = customerFirstName;
            request_x.customerLastName = customerLastName;
            request_x.accountName = accountName;
            request_x.email = email;
            request_x.contactPhone = contactPhone;
            request_x.street = street;
            request_x.city = city;
            request_x.state = state;
            request_x.zipCode = zipCode;
            request_x.country = country;
            request_x.createdDate = createdDate;
            request_x.callCreatedOn = callCreatedOn;
            request_x.awareDate = awareDate;
            request_x.eventDate = eventDate;
            request_x.region = region;
            request_x.origin = origin;
            request_x.subject = subject;
            request_x.description = description;
            request_x.callType = callType;
            request_x.groupName = groupName;
            request_x.coolqEmpId = coolqEmpId;
            request_x.veevaOrgId = veevaOrgId;
            return (AsyncApiSpartaCom.createPRResponse_elementFuture) System.WebServiceCallout.beginInvoke(
              this,
              request_x,
              AsyncApiSpartaCom.createPRResponse_elementFuture.class,
              continuation,
              new String[]{endpoint_x,
              'urn:createPR',
              'http://api.sparta.com',
              'createPR',
              'http://api.sparta.com',
              'createPRResponse',
              'apiSpartaCom.createPRResponse_element'}
            );
        }
    }
}