///|
/// テーブル行の桁揃えパディングを無視して内容を照合するための正規化。
/// mizchi/markdown 0.8 系は表セルをカラム幅に揃えて出力するため、
/// `| ポケモン | ガブリアス |` のような行リテラルで照合するテストは
/// この関数を通してからマッチさせる。連続スペースを 1 個に潰すだけで、
/// セルの中身そのものは変えない。
fn squash_spaces(s : String) -> String {
  let buf = StringBuilder()
  let mut prev_space = false
  for c in s.iter() {
    if c == ' ' {
      if prev_space {
        ()
      } else {
        buf.write_char(c)
      }
      prev_space = true
    } else {
      buf.write_char(c)
      prev_space = false
    }
  }
  buf.to_string()
}
