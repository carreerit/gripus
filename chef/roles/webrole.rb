name "webrole"
description "Web Service Role"
run_list "recipe[newapache::install]", "recipe[newapache::modjk]"
override_attributes({
	"newapache" => {
		"IPADDR" => "192.168.1.1"
	}
})
