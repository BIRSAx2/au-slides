root := justfile_directory()
export TYPST_ROOT := root

[private]
default:
    @just --list --unsorted

# compile the template to PDF
doc:
    typst compile template/main.typ template/main.pdf

# watch for changes and rebuild
watch:
    typst watch template/main.typ template/main.pdf

# package the library into the specified destination folder
package target:
    ./scripts/package "{{ target }}"

# install the library with the "@local" prefix
install: (package "@local")
    @echo ""
    @echo "AU Slides installed locally!"
    @echo "Use in your presentations:"
    @echo "  #import \"@local/au-slides:0.1.0\": *"

# install the library with the "@preview" prefix (for pre-release testing)
install-preview: (package "@preview")
    @echo ""
    @echo "AU Slides installed to @preview!"

[private]
remove target:
    ./scripts/uninstall "{{ target }}"

# uninstall the library from the "@local" prefix
uninstall: (remove "@local")
    @echo "AU Slides uninstalled from @local"

# uninstall the library from the "@preview" prefix
uninstall-preview: (remove "@preview")
    @echo "AU Slides uninstalled from @preview"

# generate thumbnails for all slides (requires pdftoppm)
thumbnails: doc
    mkdir -p thumbnails
    pdftoppm -png template/main.pdf thumbnails/slide

# clean build artifacts
clean:
    rm -f template/main.pdf
    rm -rf .cache/

# run ci suite
ci: doc
