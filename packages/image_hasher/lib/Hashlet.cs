using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ImageHasher
{
    public struct Hashlet
    {
        public int R { get; set; }
        public int G { get; set; }
        public int B { get; set; }
        public int A { get; set; }

        public override bool Equals(object obj)
        {
            if (!(obj is Hashlet))
            {
                return false;
            }

            var hashlet = (Hashlet)obj;
            return R == hashlet.R &&
                   G == hashlet.G &&
                   B == hashlet.B &&
                   A == hashlet.A;
        }

        public override int GetHashCode()
        {
            var hashCode = -490236692;
            hashCode = hashCode * -1521134295 + base.GetHashCode();
            hashCode = hashCode * -1521134295 + R.GetHashCode();
            hashCode = hashCode * -1521134295 + G.GetHashCode();
            hashCode = hashCode * -1521134295 + B.GetHashCode();
            hashCode = hashCode * -1521134295 + A.GetHashCode();
            return hashCode;
        }

        public static bool operator == (Hashlet a, Hashlet b)
        {
            if (a.A == b.A & a.R == b.R & a.G == b.G & a.B == b.B)
                return true;
            return false;
        }
        public static bool operator !=(Hashlet a, Hashlet b)
        {
            return !(a == b);
        }

        public override string ToString()
        {
            return $"Hashlet RGB: {R}, {G}, {B}, {A}";
        }
    }
}
