
public class XC_CartPreprocess extends XC_Process {

	public Map<String, Object> inputData;

	public override Map<String, Object> execute () {
		// @todo:  move this config from custom object to custom setting
		for (XC_Reflection__c reflection : [
				SELECT Id, XC_Apex_Class__c
				FROM XC_Reflection__c
				WHERE XC_Virtual_Class__c = 'preprocess'
		]) {
			XC_Process instance = (XC_Process) Type.forName(reflection.XC_Apex_Class__c).newInstance();
			instance.setInputData(inputData);
			inputData = instance.execute();
		}

		return inputData;
	}

	public override void setInputData (Map<String, Object> inputData) {
		this.inputData = inputData;
	}

	public override Map<String, Object> getInputData () {
		return inputData;
	}
}