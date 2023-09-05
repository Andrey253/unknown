const s1 = 'findere';
const s2 = 'Friend';
const s3 = 'hello';
const s4 = 'bye';
bool anagram(String s1, String s2) {
  final w1 = s1.toLowerCase().split('')..sort((a, b) => a.compareTo(b));
  final w2 = s2.toLowerCase().split('')..sort((a, b) => a.compareTo(b));
  print('teg $w1');
  print('teg $w2');

  return w1.join().contains(w2.join()) || w2.join().contains(w1.join());
}

anagramRun() {
  final res = anagram(s1, s2);
  print('teg $res');
}
