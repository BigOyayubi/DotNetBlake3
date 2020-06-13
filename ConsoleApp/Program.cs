using System;
using DotNetBlake3;

namespace ConsoleApp
{
    class Program
    {
        static void Main(string[] args)
        {
            var input = new byte[]{1,2,3,4,5};
            var out1 = new byte[Hasher.OUTPUT_SIZE];
            var out2 = new byte[Hasher.OUTPUT_SIZE];
            Hasher.Calc(input, out1);

            using(var hasher = Hasher.Create())
            {
                hasher.Update(input);
                hasher.Finalize(out2);
            }

            Console.WriteLine($"in : {BytesToString(input)}, out1 : {BytesToString(out1)}");
            Console.WriteLine($"in : {BytesToString(input)}, out2 : {BytesToString(out2)}");
        }

        static string BytesToString(byte[] input)
        {
            var builder = new System.Text.StringBuilder();
            foreach (var v in input)
            {
                builder.Append(v.ToString("X"));
            }

            return builder.ToString();
        }
    }
}
