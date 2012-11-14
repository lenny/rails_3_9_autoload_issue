rails_3_9_autoload_issue
========================

Sample app to reproduce https://github.com/rails/rails/issues/8213

MyModule is referenced by ApplicationController#index and contains a top level autoload.

   autoload :MyModuleFoo, 'my_module/something_optional'

Accessing the root path of this application results in my_module/something_optional.rb
being loaded even though the the MyModuleFoo constant was never referenced. In order
to reproduce immediately, I added config.reload_classes_only_on_change=false to config/application.rb.

    $ script/rails s
    $ curl http://localhost:3000
	<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0//EN">
	<HTML>
	  <HEAD><TITLE>Internal Server Error</TITLE></HEAD>
	  <BODY>
	    <H1>Internal Server Error</H1>
	    /Users/Shared/lenny/tmp/rails_3_9_autoload_issue/app/models/my_module/something_optional.rb is being loaded, but why??
	    <HR>
	    <ADDRESS>
	     WEBrick/1.3.1 (Ruby/1.9.3/2012-04-20) at
	     localhost:3000
	    </ADDRESS>
	  </BODY>
	</HTML>
	