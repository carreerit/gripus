name 'DEV'
description 'The development environment'
cookbook_versions  'roledemo' => '= 0.1.1'
override_attributes 'roledemo' => { 'SAMPLE' => 'ORANGES' }
