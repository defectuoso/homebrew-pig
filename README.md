# defectuoso/pig

Tap de Homebrew con la fórmula de [PiG](https://pi-in-go.dev/) (Pi Coding Agent in Go),
que empaqueta los releases de https://github.com/MichaelKinsy/PiG

## Instalación

```bash
brew install defectuoso/pig/pig
```

> Usar siempre el nombre completo `defectuoso/pig/pig`: este `pig` hace *shadowing*
> del `pig` de homebrew-core (software distinto).

## Actualizar a una nueva versión

```bash
brew pig-upgrade
```

Ese comando (el script `cmd/brew-pig-upgrade` de este tap) hace todo el proceso:

1. Lee la última release publicada de `MichaelKinsy/PiG`
2. Toma los `sha256` oficiales del asset `EVIDENCE-SHA256SUMS` del release
3. Parchea `Formula/pig.rb` (`version` + los dos `sha256`)
4. Verifica: `brew upgrade` + `brew test`
5. Solo si todo pasa: commit + push a este repo

Si algo falla (checksum, layout del tarball, test), la fórmula se restaura a su
último commit y no se publica nada. En los demás Macs: `brew update && brew upgrade
defectuoso/pig/pig`.

### Procedimiento manual (por si el script falla)

Editar `Formula/pig.rb`: `version` + los dos `sha256` (de `EVIDENCE-SHA256SUMS`),
verificar con `HOMEBREW_NO_AUTO_UPDATE=1 brew upgrade defectuoso/pig/pig` y
`brew test defectuoso/pig/pig`, y commitear con `git commit -am "pig <versión>" && git push`.
No tocar `def install`: el tarball lleva el binario en un subdirectorio
(`pig-<versión>-darwin-<arch>/`), pero Homebrew entra automáticamente en el único
directorio de primer nivel, así que `bin.install "pig"` es correcto.

## Notas del tap

- **Identidad git**: configurada solo a nivel local del repo
  (`defectuoso <daniel06campos@gmail.com>`), no en la config global.
- **Remote**: `https://github.com/defectuoso/homebrew-pig.git` (HTTPS). El PAT
  guardado en el keychain de macOS autentica el push vía el helper
  `osxkeychain`, pero **no tiene scope `workflow`**: no añadir ficheros bajo
  `.github/workflows/` por push (GitHub los rechaza). Si se quieren workflows,
  crearlos desde la web de GitHub o ampliar el scope del token.
