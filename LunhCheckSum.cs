using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LunhCheck
{
    class Program
    {
        static void Main(string[] args)
        {
            string npi = "1932104098";
            if (ValidNPI(npi))
            {
                Console.WriteLine("The NPI: {0} is valid", npi);
            }
            else
            {
                Console.WriteLine("The NPI: {0} is NOT valid", npi);
            }

        }
        //Function 
        private static bool ValidNPI(string npi)
        {
            if (npi.Length != 10) { return false; }

            try
            {
                char[] nums = npi.ToCharArray();
                int LUHNID = 0;
                for (int i = 0; i < 10; i++)
                {
                    int curNum;
                    if (int.TryParse(nums[i].ToString(), out curNum))
                    {
                        curNum = (curNum * (((i % 2) == 0) ? 2 : 1));
                        if (curNum > 9) { curNum -= 9; }
                        LUHNID += curNum;
                    }
                    else { return false; }
                }

                LUHNID += 24;

                return (LUHNID % 10) == 0;
            }
            catch (System.Exception)
            {
                return false;
            }
        }
    }
}
