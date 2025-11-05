#!/bin/bash

# Script to unzip embody-3d dataset files
# Target: Extract zip files from embody-3d-zip-files to datasets folder

set -e  # Exit on error

SOURCE_DIR="/data/ailab/datasets/embody-3d/embody-3d-zip-files"
TARGET_DIR="/data/ailab/datasets/embody-3d/datasets"

# Color codes for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo "========================================="
echo "Embody-3D Dataset Extraction Script"
echo "========================================="
echo ""
echo "Source: $SOURCE_DIR"
echo "Target: $TARGET_DIR"
echo ""

# Array of zip files to process
zip_files=(
    "CHARADES_audio.zip"
    "CHARADES_smplx.zip"
    "CHARADES_videos.zip"
    "DAYLIFE_audio.zip"
    "DAYLIFE_smplx.zip"
    "DAYLIFE_text.zip"
    "DAYLIFE_videos.zip"
    "DYADIC_audio.zip"
    "DYADIC_smplx.zip"
    "DYADIC_videos.zip"
    "HANDS_smplx.zip"
    "HANDS_videos.zip"
    "LOCOMOTION_smplx.zip"
    "LOCOMOTION_videos.zip"
    "MULTIPERSON_audio.zip"
    "MULTIPERSON_smplx.zip"
    "MULTIPERSON_videos.zip"
    "SCENARIOS_audio.zip"
    "SCENARIOS_smplx.zip"
    "SCENARIOS_text.zip"
    "SCENARIOS_videos.zip"
)

# Process each zip file
total=${#zip_files[@]}
current=0

for zip_file in "${zip_files[@]}"; do
    current=$((current + 1))
    echo -e "${BLUE}[$current/$total] Processing: $zip_file${NC}"
    
    zip_path="$SOURCE_DIR/$zip_file"
    
    if [ ! -f "$zip_path" ]; then
        echo -e "  ${YELLOW}⚠ Warning: File not found, skipping...${NC}"
        continue
    fi
    
    file_size=$(du -h "$zip_path" | cut -f1)
    echo "  Size: $file_size"
    echo "  → Extracting to $TARGET_DIR..."
    unzip -q "$zip_path" -d "$TARGET_DIR"
    
    echo -e "  ${GREEN}✓ Completed${NC}"
    echo ""
done

echo "========================================="
echo -e "${GREEN}All extractions completed!${NC}"
echo "========================================="
