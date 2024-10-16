{ 
    pkgs, 
    dir ? "app",
    version ? "lts",
    webapp ? false,
    docker ? false,
    cloud ? false,
    debug ? false,

     ... }: {
	
    packages = [
        pkgs.php83
        pkgs.symfony-cli
        pkgs.php83Packages.composer
    ];

    bootstrap = ''
      mkdir composer-home
      export COMPOSER_HOME=./composer-home
			mkdir "$out"
      composer create-project laravel/laravel "$out"
      symfony new --dir="$out"/${dir} --version=${version} ${webapp ? "--webapp" : ""} ${docker ? "--docker" : ""} ${cloud ? "--cloud" : ""} ${debug ? "--debug" : ""}
			mkdir -p "$out"/${dir}/.idx
  		cp ${./dev.nix} "$out"/${dir}/.idx/dev.nix
    '';
}