
class UrlMappings {

	static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        "/"(controller: 'SDS', action:'index')
        "/test"(controller: 'SDS', action:'index2')
        "/ws/$scientificName/location?/$latitude?/$longitude?/date?/$date?" (controller: 'SDS', action:'lookup')
        "/refresh"(controller:'SDS', action:'forceReload')
        "/$file" {
            controller= 'SDS'
            action='getFile'
            constraints {
                file(inList:['sensitivity-zones.xml','sensitivity-categories.xml', 'sensitive-species-data.xml'])
            }
        }

        "500"(view:'/error')
	}
}
