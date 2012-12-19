class UrlMappings {

	static mappings = {
		"/$controller/$action?/$id?"{
			constraints {
				// apply constraints here
			}
		}

		"/"(view:"/index")
		//"500"(view:'/error')
        "401"(view: '/errorpages/error401.html')
        "404"(view: '/errorpages/error404.html')
        "500"(view: '/errorpages/error500.html')
	}
}
