// I am sure this can be done in 1 line of code using a library but out of box?
List<string> l = File.ReadLines("../input.txt").ToList();

List<int> elves = new List<int>();

var cal=0;
foreach(var line in l)
{
    if( String.IsNullOrEmpty(line) )
    {
        elves.Add(cal);
        cal=0;
    }
    else
    {
        cal+=int.Parse(line);
    }
}
var answer1 = elves.Max();
Console.WriteLine("Answer 1 = {0}",answer1);

var answer2 = elves.OrderByDescending(x => x).Take(3).Sum();
Console.WriteLine("Answer 2 = {0}",answer2);
