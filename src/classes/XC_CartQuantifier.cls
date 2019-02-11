
public with sharing class XC_CartQuantifier extends XC_Process {

	public Map<String, Object> inputData;

	public override Map<String, Object> execute () {
		ccrz__E_Cart__c cart = (ccrz__E_Cart__c) inputData.get(ccrz.cc_api_cartExtension.PARAM_CART);
		List<ccrz__E_CartItem__c> cartItemList =
				(List<ccrz__E_CartItem__c>) inputData.get(ccrz.cc_api_cartExtension.PARAM_CARTITEMS);

		cartItemList = XC_ItemQuantifier.roundQuantities(cartItemList);
		update cartItemList;

		inputData.put(ccrz.cc_api_cartExtension.PARAM_CARTITEMS, cartItemList);
		inputData.put(ccrz.cc_api_cartExtension.PARAM_CART, cart);
		return inputData;
	}

	public override void setInputData (Map<String, Object> inputData) {
		this.inputData = inputData;
	}

	public override Map<String, Object> getInputData () {
		return inputData;
	}
}