{ config, pkgs, ... };

{
	programs.git = {
		enable = true;
		init = {
			defaultBranch = "main";
		};
		settings.user = {
			name = "XDuskAshes";
			email = "As if I'd tell you :p";
		};
	};
}
