{
  description = ''KDL document language Nim implementation'';

  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.ref   = "master";
  inputs.flakeNimbleLib.repo  = "nim-flakes-lib";
  inputs.flakeNimbleLib.type  = "github";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  
  inputs."kdl-devel".dir   = "devel";
  inputs."kdl-devel".owner = "nim-nix-pkgs";
  inputs."kdl-devel".ref   = "master";
  inputs."kdl-devel".repo  = "kdl";
  inputs."kdl-devel".type  = "github";
  inputs."kdl-devel".inputs.nixpkgs.follows = "nixpkgs";
  inputs."kdl-devel".inputs.flakeNimbleLib.follows = "flakeNimbleLib";
  
  inputs."kdl-main".dir   = "main";
  inputs."kdl-main".owner = "nim-nix-pkgs";
  inputs."kdl-main".ref   = "master";
  inputs."kdl-main".repo  = "kdl";
  inputs."kdl-main".type  = "github";
  inputs."kdl-main".inputs.nixpkgs.follows = "nixpkgs";
  inputs."kdl-main".inputs.flakeNimbleLib.follows = "flakeNimbleLib";
  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@inputs:
  let 
    lib  = flakeNimbleLib.lib;
    args = ["self" "nixpkgs" "flakeNimbleLib"];
  in lib.mkProjectOutput {
    inherit self nixpkgs;
    meta = builtins.fromJSON (builtins.readFile ./meta.json);
    refs = builtins.removeAttrs inputs args;
  };
}