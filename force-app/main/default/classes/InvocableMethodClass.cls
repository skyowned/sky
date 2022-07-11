public class InvocableMethodClass 
{
@InvocableMethod(label='PBCall' description='Inserts the accounts specified and returns the IDs of the new accounts.')
public static List<string> methodcalledSignal()
{
    system.debug('PB called');
    //string a='PB Called';
    return null;
}
}