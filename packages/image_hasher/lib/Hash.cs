using Newtonsoft.Json;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ImageHasher
{
    public class Hash : IList<Hashlet>
    {
        public int HashDepth { get; set; }
        public IList<Hashlet> BaseHash { get; set; }

        public Hash(int depth = 8)
        {
            BaseHash = new List<Hashlet>();
            HashDepth = depth;
        }

        public Hash()
        {
            BaseHash = new List<Hashlet>();
            HashDepth = 8;
        }

        public Hashlet this[int index]
        {
            get
            {
                return BaseHash[index];
            }
            set
            {
                BaseHash[index] = value;
            }
        }

        public int Count
        {
            get
            {
                return BaseHash.Count;
            }
        }

        public bool IsReadOnly
        {
            get
            {
                return BaseHash.IsReadOnly;
            }
        }

        public void Add(Hashlet item)
        {
            BaseHash.Add(item);
        }

        public void Clear()
        {
            BaseHash.Clear();
        }

        public bool Contains(Hashlet item)
        {
            return BaseHash.Contains(item);
        }

        public void CopyTo(Hashlet[] array, int arrayIndex)
        {
            BaseHash.CopyTo(array, arrayIndex);
        }

        public IEnumerator<Hashlet> GetEnumerator()
        {
            return BaseHash.GetEnumerator();
        }

        public int IndexOf(Hashlet item)
        {
            throw new NotImplementedException();
        }

        public void Insert(int index, Hashlet item)
        {
            throw new NotImplementedException();
        }

        public bool Remove(Hashlet item)
        {
            throw new NotImplementedException();
        }

        public void RemoveAt(int index)
        {
            throw new NotImplementedException();
        }

        IEnumerator IEnumerable.GetEnumerator()
        {
            return BaseHash.GetEnumerator();
        }

        public long GetSlimHash ()
        {
            int samples = 1000;
            long hash = 0;
            for (int i = 0; i < samples; i++)
            {
                Hashlet hashlet = BaseHash[BaseHash.Count / samples * i];
                hash += hashlet.R + hashlet.G + hashlet.B;
            }
            return hash;
        }

        public static Hash FromString(string hash)
        {
            return JsonConvert.DeserializeObject<Hash>(hash);
        }

        public override string ToString()
        {
            return JsonConvert.SerializeObject(this);
        }
    }
}
