//Generated by wsdl2apex

public class AsyncApiSpartaCom {
    public class createPRResponse_elementFuture extends System.WebServiceCalloutFuture {
        public String getValue() {
            apiSpartaCom.createPRResponse_element response = (apiSpartaCom.createPRResponse_element)System.WebServiceCallout.endInvoke(this);
            return response.return_x;
        }
    }
}