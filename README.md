# Transfer Android Media Script

Use rsync to transfer(backup/restore) Android standard media folder between two regular directory.\
User need to prepare Android directory by `mtpfs` or other method, even use KDE Connect remote filesystem. `:(`

## Usage

```text
Usage: transfer-android-media.sh [--help] <source_prefix> <destination_prefix> [<addition_rsync_flags>]
```

For example, this command will increment backup the `DCIM/`, `Pictures/` and `Movies/` subfolders from `/android/` to the `/backup/`:

```shell
transfer-android-media.sh /android/ /backup/
# slash suffix not matter
```

## License

Published under MIT license.\
Copyright 2025 酸柠檬猹/SourLemonJuice
