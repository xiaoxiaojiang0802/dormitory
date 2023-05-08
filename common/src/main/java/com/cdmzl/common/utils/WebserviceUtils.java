package com.cdmzl.common.utils;

import org.apache.axiom.om.OMAbstractFactory;
import org.apache.axiom.om.OMElement;
import org.apache.axiom.om.OMFactory;
import org.apache.axiom.om.OMNamespace;
import org.apache.axis2.AxisFault;
import org.apache.axis2.addressing.EndpointReference;
import org.apache.axis2.client.Options;
import org.apache.axis2.client.ServiceClient;

import java.util.Iterator;
import java.util.Map;
import java.util.Set;

/**
 * @author 小江
 * @description TODO
 * @date 2023/4/7 11:16
 **/
public class WebserviceUtils {


    public static String callWebService(String address, String methodName, Map<Object, Object> map) {
        String result = "S_UNKNOWNERROR";
        try {
            EndpointReference endpointReference = new EndpointReference(address);
            OMFactory factory = OMAbstractFactory.getOMFactory();
            // 创建命名空间
            OMNamespace namespace = factory.createOMNamespace("urn:scleadInterface", "");
            OMElement method = factory.createOMElement(methodName, namespace);

            if (map != null) {
                Set<Map.Entry<Object, Object>> set = map.entrySet();
                Iterator<Map.Entry<Object, Object>> it = set.iterator();
                while (it.hasNext()) {
                    Map.Entry<Object, Object> en = it.next();
                    OMElement nameElement = factory.createOMElement(en.getKey().toString(), null);
                    nameElement.addChild(factory.createOMText(nameElement, en.getValue().toString()));
                    method.addChild(nameElement);
                }
            }
            Options options = new Options();
            options.setTo(endpointReference);
            options.setSoapVersionURI(org.apache.axiom.soap.SOAP11Constants.SOAP_ENVELOPE_NAMESPACE_URI);
            ServiceClient sender = new ServiceClient();
            sender.setOptions(options);
            OMElement resultele = sender.sendReceive(method);
            result = resultele.getFirstElement().getText();
        } catch (AxisFault ex) {
            ex.printStackTrace();
            return ex.getMessage();
        }
        return result;
    }
}
