# defectuoso/pig

Tap de Homebrew con la fórmula de [PiG](https://pi-in-go.dev/) (Pi Coding Agent in Go),
que empaqueta los releases de https://github.com/MichaelKinsy/PiG

## Instalación

```bash
brew install defectuoso/pig/pig
```

> Usar siempre el nombre completo `defectuoso/pig/pig`: este `pig` hace *shadowing*
> del `pig` de homebrew-core (software distinto).

## Actualizar la fórmula (ej. a 0.6.0)

1. **Comprobar la última versión** publicada:
   ```bash
   brew livecheck pig        # muestra "actual ==> última"
   ```

2. **Editar** `Formula/pig.rb`:
   - `version "0.6.0"`
   - Los dos `sha256` (darwin-arm64 y darwin-amd64), tomados del asset
     `EVIDENCE-SHA256SUMS` del release (o `shasum -a 256` sobre cada tarball).
   - No tocar `def install`: el tarball lleva el binario en un subdirectorio
     (`pig-<versión>-darwin-<arch>/`), pero Homebrew entra automáticamente en el
     único directorio de primer nivel, así que `bin.install "pig"` es correcto.
   - El `test` usa `version.to_s`, no hay que tocarlo.

3. **Verificar en local:**
   ```bash
   HOMEBREW_NO_AUTO_UPDATE=1 brew upgrade defectuoso/pig/pig
   HOMEBREW_NO_AUTO_UPDATE=1 brew test defectuoso/pig/pig
   ```

4. **Publicar** (los demás Macs se actualizan con `brew update` + `brew upgrade`):
   ```bash
   cd /opt/homebrew/Library/Taps/defectuoso/homebrew-pig
   git commit -am "pig 0.6.0" && git push
   ```

## Notas del tap

- **Identidad git**: configurada solo a nivel local del repo
  (`defectuoso <daniel06campos@gmail.com>`), no en la config global.
- **Remote**: `https://github.com/defectuoso/homebrew-pig.git` (HTTPS). El PAT
  guardado en el keychain de macOS autentica el push vía el helper
  `osxkeychain`, pero **no tiene scope `workflow`**: no añadir ficheros bajo
  `.github/workflows/` por push (GitHub los rechaza). Si se quieren workflows,
  crearlos desde la web de GitHub o ampliar el scope del token.
- `brew update` ahora sí actualiza este tap (antes el repo no tenía remote y
  el histórico nunca se había publicado).
