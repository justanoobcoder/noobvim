{
  lib,
  stdenv,
  fetchurl,
  fetchFromGitHub,
  autoPatchelfHook,
}:
stdenv.mkDerivation (finalAttrs: {
  pname = "clice";
  version = "1.0.0";

  src =
    let
      hashes = {
        x86_64-linux = "sha256-ndGBqsnIHK52slXpU9ohyeYD/FtAZEfrJsler2ftlpo=";
        aarch64-linux = "sha256-t+ts5lr7nNxSKdrfGxpWFIXc2ykqBtaIV81gl3FvCLo=";
      };
      inherit (stdenv.hostPlatform) system;
    in
    fetchurl {
      url = "https://github.com/clice-io/clice/releases/download/v${finalAttrs.version}/clice-${finalAttrs.version}.${stdenv.hostPlatform.uname.processor}-unknown-linux-gnu.tar.gz";
      hash = hashes.${system} or (throw "clice: no release for ${system}");
    };

  nativeBuildInputs = [ autoPatchelfHook ];

  # clice finds its clang resource headers at ../lib/clang beside its binary.
  installPhase = ''
    runHook preInstall
    mkdir -p $out
    cp -r bin lib $out/
    runHook postInstall
  '';

  # The Neovim client of the same release: lsp/clice.lua and plugin/clice.lua.
  passthru.nvim =
    (fetchFromGitHub {
      owner = "clice-io";
      repo = "clice";
      tag = "v${finalAttrs.version}";
      hash = "sha256-z7BvAJp6C+8JyqoFcNZRPvFxatPMqDz9ajdpIBZZ8I0=";
    })
    + "/editors/nvim";

  meta = {
    description = "Language server for modern C++";
    homepage = "https://github.com/clice-io/clice";
    license = lib.licenses.asl20;
    platforms = [
      "x86_64-linux"
      "aarch64-linux"
    ];
    mainProgram = "clice";
    sourceProvenance = [ lib.sourceTypes.binaryNativeCode ];
  };
})
