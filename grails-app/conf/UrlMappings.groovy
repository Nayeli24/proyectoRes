class UrlMappings {

	static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }
        
        "/"(view:"/incidente/index")
        "500"(view:'/error')
	}
}
