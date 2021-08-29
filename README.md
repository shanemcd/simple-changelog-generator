# A Simple Changelog Generator

This action auto-generates changelogs using hidden metadata in GitHub PR descriptions.

Update your pull request template to include something like this:

```html
<!--- changelog-entry
# Fill in 'msg' below to have an entry automatically added to the next release changelog.
# Leaving 'msg' blank will not generate a changelog entry for this PR.
# Please ensure this is a simple (and readable) one-line string.
---
msg: ""
-->
```

The most minimal option would be:

```html
<!--- changelog-entry
---
msg: ""
-->
```

## Inputs

## `repo`

**Required** Repo to scan. Must be formatted as owner/repo.

## Outputs

## `changelog`

A newline separated list of markdown-formatted changelog entries that look like:

- Automated changelog generation and GitHub Release publication. ([#100](https://github.com/user/repo/pull/100), [@user](https://github.com/<someuser>))

**Note:** Due to limitations in the way GitHub allows return values to be formatted, literal newlines are returned. Please take care when accessing this data because it will contain arbitrary user input.
See below for an example of how to handle this. Hopefully GitHub improves this experience in the future.

## Example usage

```
- name: Generate changelog
  uses: shanemcd/simple-changelog-generator@v1
  id: changelog
  with:
    repo: "${{ github.repository }}"

# The quotes around 'EOF' prevent any kind interpolation.
- name: Write changelog to file
  run: |
    cat << 'EOF' > /tmp/changelog
    ${{ steps.changelog.outputs.changelog }}
    EOF
```
