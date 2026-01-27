#!/bin/bash
# ============================================================================
# Create a new blog post.
#
# If you don't specify a post name on the command line, you will be prompted
# for one.
#
# USAGE
#
#     ./post.sh                          You will be prompted for a post name
#                                        and a new post will be created and put
#                                        in your post directory
#
#     ./post.sh My Post Name             A new post named [date]-My-Post-Name
#                                        will be created and put in your post
#                                        directory
# ============================================================================

# ==========================================
# Get the post name portion of the file name
# ==========================================

if [ -z "$*" ]; then
    echo "Name your post:"
    read POST_NAME
else
    echo "Creating post named $*"
    POST_NAME="$*"
fi

# ==========================================
# Get the date portion of the file name
# ==========================================
DATE_STAMP=$(date +%Y-%m-%d)
DATE_YYYY=$(date +%Y)

# Create the year folder if it doesn't exist
mkdir -p "_posts/${DATE_YYYY}"

# ==========================================
# Concat and normalize the file name
# ==========================================

# Replace spaces with hyphens
FILE_NAME="${DATE_YYYY}/${DATE_STAMP}-${POST_NAME// /-}"

# ==========================================
# Create the post file if it doesn't exist
# then open it.
# ==========================================
if [ ! -f "_posts/${FILE_NAME}.md" ]; then
    echo "creating post ${FILE_NAME}..."
    cp _posts/template.md "_posts/${FILE_NAME}.md"
fi
echo "opening post ${FILE_NAME}"
open "_posts/${FILE_NAME}.md"

# ==========================================
# Create the image folder if it doesn't exist
# ==========================================
if [ ! -d "images/posts/${FILE_NAME}" ]; then
    echo "creating image folders ${FILE_NAME}..."
    mkdir -p "images/posts/${FILE_NAME}/thumbnails"
fi
