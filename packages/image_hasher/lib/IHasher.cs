using System.Drawing;

namespace ImageHasher
{
    public interface IHasher
    {
        int HashSize { get; }

        //double CompareHashes(Hash hasha, Hash hashb);
        Hash GetHash(Bitmap source);
    }
}