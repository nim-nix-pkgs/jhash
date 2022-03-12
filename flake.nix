{
  description = ''Jenkins Hasher producing 32 bit digests'';

  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.ref   = "master";
  inputs.flakeNimbleLib.repo  = "nim-flakes-lib";
  inputs.flakeNimbleLib.type  = "github";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  
  inputs."jhash-master".url = "path:./master";
  inputs."jhash-master".inputs.nixpkgs.follows = "nixpkgs";
  inputs."jhash-master".inputs.flakeNimbleLib.follows = "flakeNimbleLib";
  
  inputs."jhash-v0_1_0".url = "path:./v0_1_0";
  inputs."jhash-v0_1_0".inputs.nixpkgs.follows = "nixpkgs";
  inputs."jhash-v0_1_0".inputs.flakeNimbleLib.follows = "flakeNimbleLib";
  
  inputs."jhash-v0_1_1".url = "path:./v0_1_1";
  inputs."jhash-v0_1_1".inputs.nixpkgs.follows = "nixpkgs";
  inputs."jhash-v0_1_1".inputs.flakeNimbleLib.follows = "flakeNimbleLib";
  
  inputs."jhash-v0_1_2".url = "path:./v0_1_2";
  inputs."jhash-v0_1_2".inputs.nixpkgs.follows = "nixpkgs";
  inputs."jhash-v0_1_2".inputs.flakeNimbleLib.follows = "flakeNimbleLib";
  
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