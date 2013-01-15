import spotlight.content.Portfolio

class UrlMappings {

	static mappings = {
		"/$controller/$action?/$id?"{
			constraints {
				// apply constraints here
			}
		}

		"/"(controller: 'Portfolio', action: 'index')
       // "/"(view:"/index")
		"500"(view:'/error')
        "401"(view: '/errorpages/error401.gsp')
        "404"(view: '/errorpages/error404.gsp')
        //"500"(view: '/errorpages/error500.gsp')
	}
}
