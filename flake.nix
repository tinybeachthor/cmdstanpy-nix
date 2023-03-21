{
  inputs = {
    dream2nix.url = "github:nix-community/dream2nix";
    src.url = "https://files.pythonhosted.org/packages/d5/2c/bc3216b7a3b0291bf74eac2387f5989477422bd4ad96663371639cb1c9f6/cmdstanpy-1.1.0.tar.gz";
    src.flake = false;
  };

  outputs = {
    self,
    dream2nix,
    src,
  } @ inp:
    (dream2nix.lib.makeFlakeOutputs {
      systems = ["x86_64-linux"];
      config.projectRoot = ./.;
      source = src;
      projects.cmdstanpy = {
        name = "cmdstanpy";
        subsystem = "python";
        translator = "pip";
      };
    });
}
