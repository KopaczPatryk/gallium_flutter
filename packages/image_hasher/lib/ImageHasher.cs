using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ImageHasher
{
    public class LegacyHasher
    {
        public int HashSize { get; protected set; }
        public LegacyHasher()
        {
            HashSize = 16;
        }
        /// <summary>
        ///Default resolution is 16, for more uniqeu hash use higher values
        /// </summary>
        /// <param name="hashResolution">hash resolution</param>
        public LegacyHasher (int hashResolution)
        {
            HashSize = hashResolution;
        }
        public List<bool> GetHash(Image source)
        {
            List<bool> lResult = new List<bool>();
            //create new image with 16x16 pixel
            Bitmap bmpMin = new Bitmap(source, new Size(HashSize, HashSize));
            for (int j = 0; j < bmpMin.Height; j++)
            {
                for (int i = 0; i < bmpMin.Width; i++)
                {
                    //reduce colors to true / false
                    lResult.Add(bmpMin.GetPixel(i, j).GetBrightness() < 0.5f);
                }
            }
            return lResult;
        }

        public double CompareHashes (List<bool> hash1, List<bool> hash2)
        {
            float equalElements = hash1.Zip(hash2, (i, j) => i == j).Count(eq => eq);
            //Console.WriteLine(equalElements);
            return equalElements / (HashSize * HashSize);
        }
    }
}
