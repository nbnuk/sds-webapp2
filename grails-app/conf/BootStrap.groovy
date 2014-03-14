import au.org.ala.sds.model.SensitivityCategory
import au.org.ala.sds.model.SensitivityInstance
import au.org.ala.sds.model.SensitivityZone

import grails.converters.JSON
import org.apache.commons.beanutils.BeanUtils
import org.apache.commons.beanutils.PropertyUtils



class BootStrap {

    def init = { servletContext ->

        //Add the custom JSON Marshallers
        //only include properties that have values
        JSON.registerObjectMarshaller(SensitivityInstance) {

            def props = BeanUtils.describe(it).keySet()
            return props.findAll {p -> PropertyUtils.getProperty(it, p) && p!= "class"}.collectEntries{v -> [v, PropertyUtils.getProperty(it, v)]}
        }

        JSON.registerObjectMarshaller(SensitivityCategory) {
            def map=[:]
            map.value = it.value
            map.type = it.type.toString()
            return map
        }

        JSON.registerObjectMarshaller(SensitivityZone) {
            def map=[:]
            map.name = it.name
            map.type = it.type.toString()
            return map
        }
    }
    def destroy = {
    }
}
