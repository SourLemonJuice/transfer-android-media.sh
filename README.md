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

## Tips

### Dry run

Append `rsync` flag `--dry-run` or `-n`.

### Limit file size when restore

Assuming this scenario, you have hundreds of GB videos but the new phone only have 128GB storage.\
It's not enough, but I still want some new life.

The `rsync` have a flag `--max-size=SIZE` -> [Arch Manual](https://man.archlinux.org/man/rsync.1#max-size=SIZE)\
You can append this as an `addition_rsync_flag` to the restore command, for example:

```shell
transfer-android-media.sh /backup/ /android/ --max-size=600m
```

### Any deletion will happen?

No, until you specific `rsync` flag `--delete`.

## License

Published under MIT license.\
Copyright 2025 酸柠檬猹/SourLemonJuice
