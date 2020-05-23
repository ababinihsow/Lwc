import { LightningElement, track } from 'lwc';

export default class TestVariable extends LightningElement {
    @track gretting = 'World';
    @track showDetail = false;
    @track historyList = new Array();

    handlechange(event){
        this.greetting = event.target.value;
        if(this.greetting.toLocaleLowerCase() === 'xx'){
            this.showDetail = true;
        } else {
            this.showDetail = false;
        }
    }

    logHistory(event) {
        const previousHistoryValue = this.historyList.length > 0 ? this.historyList[this.historyList.length - 1].Name : '';
        const previousHistoryId = this.historyList.length > 0 ? this.historyList[this.historyList.length - 1].Id : 0;
        if((previousHistoryValue !== '' && event.target.value !== '' && 
            previousHistoryValue !== event.target.value) || 
            (previousHistoryValue === '' && event.target.value !== '')) {
                const tmpId = previousHistoryId + 1;
                const tmpName = event.target.value;
                const history = {Id:tmpId,Name:tmpName};
                this.historyList.push(history);
        }
    }

    get wiredGreeting() {
        return this.gretting.toUpperCase();
    }

    get showHistory() {
        return this.historyList.length > 0 ? true : false;
    }
}