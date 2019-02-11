global with sharing class XC_CartAPIService extends ccrz.cc_api_CartExtension {

    global override Map<String, Object> preprocess(Map<String, Object> inputData) {
        inputData = super.preprocess(inputData);

        XC_CartPreprocess instance = new XC_CartPreprocess();
        instance.setInputData(inputData);
        inputData = instance.execute();

        return inputData;

    }
}