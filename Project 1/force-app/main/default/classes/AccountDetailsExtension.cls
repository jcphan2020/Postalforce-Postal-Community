public class AccountDetailsExtension {
    public AccountDetailsExtension(ApexPages.StandardController sc){   
    }
    public PageReference editAccount(){
        return Page.EditAccountDetails;
    }
    public Contact holdContact{ get{
        String userId = UserInfo.getUserId();
        User contactIdRetrieve = [Select contactId FROM User WHERE id =:userId];
        String contactId = contactIdRetrieve.ContactId;
        Contact temp = [SELECT firstName, lastName, email, phone, title, mailingstreet, mailingcity, mailingstate, mailingpostalCode, mailingcountry, Nickname__c FROM Contact WHERE id =:contactId];
        return temp;
    }set;}
    private Contact updatedContact = holdContact;
    public User hold{ get{
        String userId = UserInfo.getUserId();
        User temp = [SELECT firstName, lastName, username, email, phone, title, street, city, state, postalCode, country FROM User WHERE id =:userId];
        return temp;
    }}
    public String firstName { get{
        if(firstName == null || firstName == ''){
        	return holdContact.FirstName;
        }
        else{
            return firstName;
        }
    } set;}
    public String nickname { get{
        if(nickname == null || nickname == ''){
        	return holdContact.Nickname__c;
        }
        else{
            return nickname;
        }
    } set;}
    public String lastName { get{
        if(lastName == null || lastName == ''){
        	return holdContact.LastName;
        }
        else{
            return lastName;
        }
    } set;}
    public String username { get{
        return hold.Username;
    } set;}
    public String email { get{
        if(email == null || email == ''){
        	return holdContact.Email;
        }
        else{
            return email;
        }
    } set;}
    public String Phone { get{
        if(Phone == null || Phone == ''){
        	return holdContact.Phone;
        }
        else{
            return Phone;
        }
    } set;}
    public String title { get{
        if(title == null || title == ''){
        	return holdContact.title;
        }
        else{
            return title;
        }
    } set;}
    public String state { get{
        if(state == null || state == ''){
        	return holdContact.MailingState;
        }
        else{
            return state;
        }
    } set;}
    public String city{ get{
        if(city == null || city == ''){
        	return holdContact.MailingCity;
        }
        else{
            return city;
        }
    } set;}
    public String country{ get{
        if(country == null || country == ''){
        	return holdContact.MailingCountry;
        }
        else{
            return country;
        }
    }set;}    
    public String postalCode{ get{
        if(postalCode == null || postalCode == ''){
        	return holdContact.MailingPostalCode;
        }
        else{
            return postalCode;
        }
    }set;}
    public String street{ get{
        if(street == null || street == ''){
        	return holdContact.MailingStreet;
        }
        else{
            return street;
        }
    }set;}
    public PageReference updateContact(){
        if(firstName == null || firstName == ''){
            firstName = holdContact.FirstName;
        }
        if(lastName == null || lastName == ''){
            lastName = holdContact.LastName;
        }
        if(email == null || email == ''){
            email = holdContact.Email;
        }
        updatedContact.FirstName = firstName;
        updatedContact.LastName = lastName;
        updatedContact.Nickname__c = nickname;
        updatedContact.Email = email;
        updatedContact.Phone = phone;
        updatedContact.Title = title;
        updatedContact.MailingStreet = street;
        updatedContact.MailingCity = city;
        updatedContact.MailingState = state;
        updatedContact.MailingPostalCode = postalCode;
        updatedContact.MailingCountry = country;
        update updatedContact;
        return Page.AccountDetails;
    }
    public PageReference returnDetails(){
        return Page.AccountDetails;
    }
}