#!/bin/bash
# ダウンロードフォルダのMP3ファイルを「アップロード前」フォルダへ移動するスクリプト

DOWNLOADS=~/Downloads
DEST=~/Downloads/MP3/アップロード前

echo "移動先: $DEST"
echo ""

moved=0
skipped=0

# ~/Downloads 直下の .mp3 ファイルを移動
for f in "$DOWNLOADS"/*.mp3; do
    [ -e "$f" ] || continue
    filename=$(basename "$f")
    if [ -e "$DEST/$filename" ]; then
        echo "スキップ（既に存在）: $filename"
        ((skipped++))
    else
        mv "$f" "$DEST/"
        echo "移動: $filename"
        ((moved++))
    fi
done

# ~/Downloads/Suno_Music 内の .mp3 ファイルを移動
if [ -d "$DOWNLOADS/Suno_Music" ]; then
    for f in "$DOWNLOADS/Suno_Music"/*.mp3; do
        [ -e "$f" ] || continue
        filename=$(basename "$f")
        if [ -e "$DEST/$filename" ]; then
            echo "スキップ（既に存在）: $filename"
            ((skipped++))
        else
            mv "$f" "$DEST/"
            echo "移動: $filename"
            ((moved++))
        fi
    done
fi

echo ""
echo "完了: ${moved}曲 移動、${skipped}曲 スキップ"
