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
      mkdir -p ${out}/${dir}
      symfony new --dir=${out}/${dir} --version=${version} ${if webapp == true then "--webapp" else ""} ${if docker == true then "--docker" else ""} ${if cloud == true then "--cloud" else ""} ${if debug == true then "--debug" else ""}
			mkdir -p ${out}/${dir}/.idx
  		cp ${./dev.nix} ${out}/${dir}/.idx/dev.nix
    '';
}