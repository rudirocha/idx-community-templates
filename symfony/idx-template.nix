{ 
    pkgs, 
    dir,
    version ? "lts",
    webapp ? false,
    docker ? false,
    cloud ? false,
    debug ? false,

     ... }: {
	
    packages = [
        pkgs.git
        pkgs.php83
        pkgs.symfony-cli
        pkgs.php83Packages.composer
    ];

    bootstrap = ''
      mkdir composer-home
      export COMPOSER_HOME=./composer-home
    
      symfony new --dir=${dir} --version=${version} ${if webapp == true then "--webapp" else ""} ${if docker == true then "--docker" else ""} ${if cloud == true then "--cloud" else ""} ${if debug == true then "--debug" else ""}
			mkdir -p ${dir}/.idx
  		cp ${./dev.nix} ${dir}/.idx/dev.nix
    '';
}