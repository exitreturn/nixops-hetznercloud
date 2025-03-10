# Configuration specific to Hetzner Cloud Volume Resource.
{ config, lib, name, uuid, resources, ... }:

with import ./lib.nix lib;
with lib;
let cfg = config;
in {

  imports = [ ./common-volume-options.nix ];

  options = {

    location = mkOption {
      example = "nbg1";
      type = types.enum [ "nbg1" "fsn1" "hel1" "ash" ];
      description = ''
        The ID of the location to create the volume in.
        Choices are ``nbg1``, ``fsn1``, ``hel1`` or ``ash``.
      '';
    };

  } // import ./common-hetznercloud-options.nix { inherit lib; };

  config._type = "hetznercloud-volume";

}
