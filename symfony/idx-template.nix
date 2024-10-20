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
			mkdir "$out"
  
      symfony new "$out" --no-git --version=${version} ${if webapp == true then "--webapp" else ""} ${if docker == true then "--docker" else ""} ${if cloud == true then "--cloud" else ""} ${if debug == true then "--debug" else ""}
			mkdir -p "$out"/.idx
  		cp ${./dev.nix} "$out"/.idx/dev.nix
    '';
}