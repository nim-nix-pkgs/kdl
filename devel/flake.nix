{
  description = ''KDL document language Nim implementation'';

  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.ref   = "master";
  inputs.flakeNimbleLib.repo  = "nim-flakes-lib";
  inputs.flakeNimbleLib.type  = "github";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  
  inputs.src-kdl-devel.flake = false;
  inputs.src-kdl-devel.ref   = "refs/heads/devel";
  inputs.src-kdl-devel.owner = "Patitotective";
  inputs.src-kdl-devel.repo  = "kdl-nim";
  inputs.src-kdl-devel.type  = "github";
  
  inputs."github.com/beef331/recyclable".owner = "nim-nix-pkgs";
  inputs."github.com/beef331/recyclable".ref   = "master";
  inputs."github.com/beef331/recyclable".repo  = "github.com/beef331/recyclable";
  inputs."github.com/beef331/recyclable".dir   = "";
  inputs."github.com/beef331/recyclable".type  = "github";
  inputs."github.com/beef331/recyclable".inputs.nixpkgs.follows = "nixpkgs";
  inputs."github.com/beef331/recyclable".inputs.flakeNimbleLib.follows = "flakeNimbleLib";
  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@deps:
  let 
    lib  = flakeNimbleLib.lib;
    args = ["self" "nixpkgs" "flakeNimbleLib" "src-kdl-devel"];
    over = if builtins.pathExists ./override.nix 
           then { override = import ./override.nix; }
           else { };
  in lib.mkRefOutput (over // {
    inherit self nixpkgs ;
    src  = deps."src-kdl-devel";
    deps = builtins.removeAttrs deps args;
    meta = builtins.fromJSON (builtins.readFile ./meta.json);
  } );
}