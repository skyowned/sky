public class CallCurrencyConverterAPI implements schedulable{
    private String sessionId;
    public CallCurrencyConverterAPI( String sessionId ) {
        this.sessionId = sessionId;
    }
    public void execute(schedulablecontext sc) {
        CurrencyCallout.retrieveLatestRate(sessionId);
    }
}