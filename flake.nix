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
  
  inputs."kdl-0_2_0".dir   = "0_2_0";
  inputs."kdl-0_2_0".owner = "nim-nix-pkgs";
  inputs."kdl-0_2_0".ref   = "master";
  inputs."kdl-0_2_0".repo  = "kdl";
  inputs."kdl-0_2_0".type  = "github";
  inputs."kdl-0_2_0".inputs.nixpkgs.follows = "nixpkgs";
  inputs."kdl-0_2_0".inputs.flakeNimbleLib.follows = "flakeNimbleLib";
  
  inputs."kdl-0_2_2".dir   = "0_2_2";
  inputs."kdl-0_2_2".owner = "nim-nix-pkgs";
  inputs."kdl-0_2_2".ref   = "master";
  inputs."kdl-0_2_2".repo  = "kdl";
  inputs."kdl-0_2_2".type  = "github";
  inputs."kdl-0_2_2".inputs.nixpkgs.follows = "nixpkgs";
  inputs."kdl-0_2_2".inputs.flakeNimbleLib.follows = "flakeNimbleLib";
  
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