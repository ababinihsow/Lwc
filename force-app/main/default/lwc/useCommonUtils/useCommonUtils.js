import { LightningElement } from 'lwc';
import {getMaxDayForThisMonth} from 'c/commonUtils';
export default class UseCommonUtils extends LightningElement {
    maxDate = getMaxDayForThisMonth(new Date());
}