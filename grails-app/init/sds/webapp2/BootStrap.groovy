package sds.webapp2

import au.org.ala.sds.model.ConservationInstance
import au.org.ala.sds.model.PlantPestInstance
import au.org.ala.sds.model.SensitivityCategory
import au.org.ala.sds.model.SensitivityInstance
import au.org.ala.sds.model.SensitivityZone
import grails.converters.JSON

class BootStrap {

    // JSON model for SDS sensitivity information
    // The SensitivityCategory and SensitivityZone marshallers override the default grails approach to enums
    // The SensitivityInstance provides a consistent output for the various instance types
    def init = { servletContext ->
        JSON.registerObjectMarshaller(SensitivityCategory, { SensitivityCategory category ->
            [value: category?.value, type: category?.type?.name()]
        })
        JSON.registerObjectMarshaller(SensitivityZone, { SensitivityZone zone ->
            [name: zone?.name, type: zone?.type?.name(),]
        })
        JSON.registerObjectMarshaller(SensitivityInstance, { SensitivityInstance instance ->
            def value = [:]
            if (instance in ConservationInstance)
                value.locationGeneralisation = instance.locationGeneralisation
            if (instance in PlantPestInstance) {
                value.fromDate = instance.fromDate
                value.toDate = instance.toDate
                if (instance.transientEventList)
                    value.transitentEventList = instance.transientEventList
            }
            value.zone = instance.zone
            value.authority = instance.authority
            value.dataResourceId = instance.dataResourceId
            value.category = instance.category
            if (instance.reason)
                value.reason = instance.reason
            if (instance.remarks)
                value.remarks = instance.remarks
            value
        })

    }
    def destroy = {
    }
}
