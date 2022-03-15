using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ImageHasher
{
    public class Hasher : IHasher
    {
        public int HashSize { get; }
        public int HashDepth { get; }

        private int depthdivider = 0;
        private Bitmap bmp;
        public Hasher(int hashResolution = 32, int depth = 8)
        {
            HashSize = hashResolution;
            HashDepth = depth;
            depthdivider = 256 / HashDepth;
        }

        public Hash GetHash(Bitmap source)
        {
            Hash hash = new Hash();
            Bitmap bmpMin = new Bitmap(source, new Size(HashSize, HashSize));
            bmp = bmpMin;
            for (int j = 0; j < bmpMin.Height; j++)
            {
                for (int i = 0; i < bmpMin.Width; i++)
                {
                    hash.Add(processPixelToHashlet(bmpMin.GetPixel(i, j)));
                }
            }
            //Console.WriteLine(bmpMin.Width);
            //Console.WriteLine("Processed hash");

            return hash;
        }
        public Bitmap GetBMP ()
        {
            return bmp;
        }
        private Hashlet processPixelToHashlet (Color c)
        {
            Hashlet px = new Hashlet();
            px.R = normalize(c.R);
            px.G = normalize(c.G);
            px.B = normalize(c.B);

            px.A = normalize(c.A);
            //Console.WriteLine(px);
            return px;
        }

        private int normalize(int val)
        {
            return val / depthdivider;
        }

        //public double CompareHashes(Hash hasha, Hash hashb)
        //{
        //    if (hasha.Count != hashb.Count)
        //    {
        //        throw new HashIncompatibilityException("Hash length missmatch");
        //    }
        //    //double equalElements = hasha.Zip(hashb, (i, j) => i == j).Count(eq => eq);
        //    double eq = 0;
        //    for (int i = 0; i < hasha.Count; i++)
        //    {
        //        if (hasha[i] == hashb[i])
        //        {
        //            eq++;
        //        }
        //    }
        //    //Console.WriteLine($"{eq} z {hasha.Count} pikseli hashu jest takich samych");
        //    return eq / (hasha.Count);
        //}
    }
}
