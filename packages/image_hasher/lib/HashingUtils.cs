using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ImageHasher
{
    public static class HashingUtils
    {
        //public static double CompareHash(this Hash hasha, Hash hashb)
        //{
        //    if (hasha.Count != hashb.Count)
        //    {
        //        throw new HashIncompatibilityException("Hash length missmatch");
        //    }
        //    float equalElements = hasha.Zip(hashb, (i, j) => i == j).Count(eq => eq);
        //    return equalElements / hasha.Count;
        //}

        public static double CompareHashes(this Hash hasha, Hash hashb)
        {
            if (hasha.Count != hashb.Count)
            {
                throw new HashIncompatibilityException("Hash length missmatch");
            }
            //double equalElements = hasha.Zip(hashb, (i, j) => i == j).Count(eq => eq);
            double eq = 0;
            for (int i = 0; i < hasha.Count; i++)
            {
                if (hasha[i] == hashb[i])
                {
                    eq++;
                }
            }
            //Console.WriteLine($"{eq} z {hasha.Count} pikseli hashu jest takich samych");
            return eq / (hasha.Count);
        }
        public static double CompareHashesFast(this Hash hasha, Hash hashb, double breakThreshold)
        {
            if (hasha.Count != hashb.Count)
            {
                throw new HashIncompatibilityException("Hash length missmatch");
            }
            //double equalElements = hasha.Zip(hashb, (i, j) => i == j).Count(eq => eq);
            double eq = 0;
            for (int i = 0; i < hasha.Count; i++)
            {
                if (hasha[i] == hashb[i])
                {
                    eq++;
                }
                

                if (i > 0 && (eq / i < (1 - breakThreshold) + 1) && i > hasha.Count * (1 - breakThreshold) + 1)
                {
                    return 0;
                }
            }
            //Console.WriteLine($"{eq} z {hasha.Count} pikseli hashu jest takich samych");
            return eq / (hasha.Count);
        }
    }
}
