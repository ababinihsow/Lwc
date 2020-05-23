import { LightningElement, track, wire } from 'lwc';
import getContacts from '@salesforce/apex/ContactController.getContacts';

export default class EventWithData extends LightningElement {
    @track selectedContact;

    @wire(getContacts) contacts;

    handleSelect(event) {
        const contactId = event.detail;
        console.log(JSON.stringify(this.contacts));
        this.selectedContact = this.contacts.data.find(
            contact => contact.Id === contactId
        );
    }
}