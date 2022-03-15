using System;
using System.Runtime.Serialization;

namespace ImageHasher
{
    [Serializable]
    internal class HashIncompatibilityException : Exception
    {
        public HashIncompatibilityException()
        {
        }

        public HashIncompatibilityException(string message) : base(message)
        {
        }

        public HashIncompatibilityException(string message, Exception innerException) : base(message, innerException)
        {
        }

        protected HashIncompatibilityException(SerializationInfo info, StreamingContext context) : base(info, context)
        {
        }
    }
}