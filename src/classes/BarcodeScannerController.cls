
global with sharing class BarcodeScannerController {

    static Integer APIVERSION = 5;
    public final static String str { get; set; }

    @RemoteAction
    global static Map<String, Object> addtoCart(String sku, String encId) {
        Map<String, Object> retMap = new Map<String, Object>();

        ccrz.ccApiCart.LineData lineData = new ccrz.ccApiCart.LineData();
        lineData.sku = sku;
        lineData.quantity = 1;

        Map<String, Object> reqMap = new Map<String, Object>{
                ccrz.ccApi.API_VERSION => APIVERSION,
                ccrz.ccApiCart.LINE_DATA => new List<ccrz.ccApiCart.LineData>{lineData}
        };

        if(String.isNotBlank(encId)) {
            reqMap.put(ccrz.ccApiCart.CART_ENCID, encId);
        }

        try {
            Map<String, Object> resMap = ccrz.ccApiCart.addTo(reqMap);
            System.debug('ccrz.ccApiCart.CART_ENCID = ' + ccrz.ccApiCart.CART_ENCID);
            System.debug('resMap = ' + JSON.serializePretty(resMap));

            retMap.put('success', resMap.get(ccrz.ccApi.SUCCESS));
            retMap.put('encId', resMap.get(ccrz.ccApiCart.CART_ENCID));
            retMap.put('messages', resMap.get(ccrz.ccApi.MESSAGES));
        } catch(Exception e) {
            retMap.put('success', false);
            retMap.put('messages', e.getMessage());
        }

        return retMap;
    }
}