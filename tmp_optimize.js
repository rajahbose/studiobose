const sharp = require('sharp');
const path = require('path');
const fs = require('fs');

const dir = 'images/projects/lodge-window/';
const srcFiles = [
  'IMG_5195.JPG',
  'IMG_5226.JPG',
  'IMG_5243.JPG',
  'IMG_8006.JPG',
  'lodge 01.png',
  'lodge 02.png',
  'lodge 03.png',
  'lodge interior.png',
  '2019-06-26_1648.png',
  '2019-12-19_1729.png'
];

async function optimize() {
  for (let i = 0; i < srcFiles.length; i++) {
    const src = path.join(dir, srcFiles[i]);
    const dest = path.join(dir, `lodge-window-${String(i+1).padStart(2,'0')}.jpg`);
    
    let pipeline = sharp(src);
    
    // Manual orientation fixes for the sideways JPEG photos (1-4)
    if (i < 4) {
      // These were already auto-rotated to Vertical, but content remains sideways.
      // We need to force them to Landscape (90 deg CW).
      pipeline = pipeline.rotate(90);
    } else {
      pipeline = pipeline.rotate(); // Auto-rotate others based on EXIF
    }
    
    await pipeline
      .resize({ width: 2560, withoutEnlargement: true })
      .jpeg({ quality: 88, progressive: true, mozjpeg: true })
      .toFile(dest);
    
    const stats = fs.statSync(dest);
    console.log(`Optimized (Manual Fix/2560px @ 88%): ${dest} (${(stats.size/1024).toFixed(1)} KB)`);
  }
}

optimize().catch(console.error);
