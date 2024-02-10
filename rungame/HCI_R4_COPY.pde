import javax.swing.*;
import java.awt.*;

int scene;//シーン
int start;//スタート
int scorescore;//スコア
int ok;//キャラ決定
int wait;//クリック時間考慮した待機時間生成
int waitcount;//クリック待機時間
int waitp;//クリック時間考慮した待機時間生成(プレイ)
int waitpcount;//クリック待機時間
int waitn;//クリック時間考慮した待機時間生成(入力)
int waitncount;//クリック待機時間
int waitm;//クリック時間考慮した待機時間生成(戻る)
int waitmcount;//クリック待機時間
int waitc;//クリック時間考慮した待機時間生成(コンティニュー)
int waitccount;//クリック待機時間
int waitgcount;//クリック待機時間(ゲーム終了)
int r1x, r1y, r2x, r2y; //選択中
int r3x, r3y, r4x, r4y; //選択完了
int KR, KG, KB;//決定の色
int keyK;//選択完了後
int count;
int run;//走る動き
int j;//ジャンプ入力
int djy;//ジャンプ時の加速
int jcount;//ジャンプ時間
int w;//押し出し判定のための壁や落とし穴に付ける番号
int wx;//段座標
int dx;//ギミッグが左に移動
int cx;//キャラクターの左右移動
int cy;//キャラクターの上下移動
int jjy;//着地判定
int osare;//壁に押されているか
int gekiha;//敵1消滅
int gekiha2;//敵2消滅
ArrayList <Integer> enemies = new ArrayList <Integer> (150);//敵用の配列
ArrayList <Integer> coins = new ArrayList <Integer> (750);//コイン用(取得)の配列
int s;//飛んでくる系用
ArrayList <Integer> enemies3 = new ArrayList <Integer> (100);//敵3用の配列
int y2;//敵4用の移動座標
int dy2;//↑の加速
int yy;//↑の速度調整カウント
ArrayList <Integer> splinters = new ArrayList <Integer> (100);//刺の配列
int sx2, sx3, sy2, sy3;//刺の座標
int shield;//青のシールド状況
int cool;//青のクールタイム
int coolstart;//青のクールタイム開始
int coolUI;//クールタイムUI
int s1, s2, s3, s4, s5, s6, s7, s8, s9, s10, s11, s12, s13, s14, s15;//ステージの乱数用
int gcount;//緑の復活カウント
int gskill;//緑１回だけ復活
int gability;//緑アビリティ
int gabilityc;//緑アビリティカウント
int F;//フレームレート
int bx, by;//青のビーム座標
int dbx;//ビーム加速
int bability;//青アビリティ
int rability;//赤アビリティ
int rabilityc;//赤アビリティカウント
int yability;//黄アビリティ
int yabilityc;//黄アビリティカウント
ArrayList <Integer> coinsX = new ArrayList <Integer> (750);//黄アビリティ用のコイン配列
int ability;//アビリティを使った回数
float a1, a2, a3, a4, a5, a6;//アビリティUI
float a;//アビリティUI
int getcoin;//コインを取ったことを伝える
int win;//敵を倒したことを伝える
int[] stage = new int[13];//ステージ配列
int r, cr;//ランダム,コインランダム
int r2;//重複発見
int st;//ステージ配列変数
int s5000;//ステージ周期カウント
int speedUI;//SPEED UP の表示時間カウント開始
int speedUIc;//SPEED UP の表示時間カウント
float gUI, gUI2, rUI, yUI;//それぞれ復活、緑アビ、赤アビ、黄アビ用のUI
int gUIy, gUI2y, rUIy, yUIy;//↑のy座標
int kumoX, kumo2X;//雲の座標
int my2;//段の上下移動
int dmy2;//段の上下移動の加速
int mymy;//段の動きを遅くするようのカウント
int[] enemies5=new int[100];//敵5の配列
PImage img, img2, img3;//敵1
int allow;//穴と空中床が被った時
int[] stacoin=new int[16];//スコア2倍コイン
int coinboost;//2倍状態
int boostcount;//2倍カウント
int[] broken=new int[150];//倒された時のエフェクト
int[] got=new int[750];//コイン取った時のエフェクト
int[] which=new int[150];//敵の倒され方
int[] whichc=new int[750];//コインの取られ方
//ダッシュエフェクト
int dashc;//エフェクトカウント
//ジャンプエフェクト
int jumpc;
int jumpp;//最初だけ座標取る
int jumpx;//座標保存
int jumpy;
//空中ジャンプエフェクト
int jump2c;
int jump2p;//最初だけ座標取る
int jump2x;//座標保存
int jump2y;
//着地エフェクト
int landc;
int landp;
int landx;//座標保存
int landy;
//ビームエフェクト
int beamc;
int beamp;
int beamx;
int beamy;
int rank;//ランク


JLayeredPane pane;
JTextField field;
String[] lineData1 = null;//nicknameファイル用
String[] lineData2 = null;//scoreファイル用
String[] lineData3 = null;//キャラファイル用
String[] nickname;//ニックネーム配列
String[] nickname2;//ソート済ニックネーム配列
int[] score;//スコア（数値）配列
String[] scorestring;//スコア（文字列）配列
int[] score2;//ソート済スコア（数値）配列
String[] scorestring2;//ソート済スコア（文字列）配列
int[] okcolor;//キャラ（数値）配列
String[] okcolorstring;//キャラ（文字列）配列
int[] okcolor2;//ソート済キャラ（数値）配列
String[] okcolorstring2;//ソート済キャラ（文字列）配列
String filename1="nickname.txt";
String filename2="score.txt";
String filename3="ranknick.txt";
String filename4="rankscore.txt";
String filename5="color.txt";
String filename6="rankcolor.txt";
int i=0;
int n;
int countcount=0;//プレイ回数

//scene0
int playx=420, playy=220, playw=300, playh=80;//プレイボタン
int rplay=100, gplay=100, bplay=100;//プレイ用色
int createx=420, createy=350, createw=300, createh=80;//説明書ボタン
int rcreate=100, gcreate=100, bcreate=100;//説明用色

//scene1
int textx=-100, texty=-100, textw=430, texth=70;//テキストフィールド
int tugix=200+textw-150, tugiy=250+texth+50, tugiw=150, tugih=60;//次へボタン
int rtugi=100, gtugi=100, btugi=100;//次へ用色
int modorux=200, modoruy=250+texth+50, modoruw=150, modoruh=60;//戻るボタン
int rmodoru=100, gmodoru=100, bmodoru=100;//戻る用色

//scene2
int conx=45, cony=477, conw=710, conh=55;//コンティニューボタン
int rcon=200, gcon=200, bcon=200;//コンティニュー用色


void setup() {
  size(800, 600);
  noSmooth();
  // SmoothCanvasの親の親にあたるJLayeredPaneを取得
  Canvas canvas = (Canvas) surface.getNative();
  pane = (JLayeredPane) canvas.getParent().getParent();

  // 1行のみのテキストボックスを作成
  field = new JTextField();
  field.setFont(new Font("ＭＳ ゴシック", Font.BOLD, 40));
  field.setBounds(textx, texty, textw, texth);
  pane.add(field);
  //テキストファイルを読む
  lineData1 = loadStrings( filename1 );
  if ( lineData1 == null ) {
    countcount=0;
  } else {
    for ( int i = 0; i < lineData1.length; i++ ) {
      countcount++;
    }
  }

  colorMode(RGB, 256);
  frameRate(80);//80
  scene=0;
  ok=0;
  wait=0;
  waitp=0;
  waitn=0;
  waitm=0;
  waitc=0;
  waitcount=0;
  waitpcount=0;
  waitncount=0;
  waitmcount=0;
  waitccount=0;
  waitgcount=0;
  r1x=900;
  r1y=900;
  r2x=900;
  r2y=900;
  r3x=900;
  r3y=900;
  r4x=900;
  r4y=900;
  KR=200;
  KG=200;
  KB=200;
  keyK=0;
  count=0;
  run=0;
  j=0;
  djy=0;
  jcount=0;
  wx=800;
  cx=180;
  dx=-5;
  cy=435;
  jjy=435;
  w=0;
  osare=0;
  y2=0;
  dy2=-1;
  yy=0;
  sx2=0;
  sx3=0;
  sy2=0;
  sy3=0;

  for (int i=0; i<150; i++) {
    enemies.add(i);
  }
  for (int i=0; i<750; i++) {
    coins.add(i);
  }
  s=0;
  for (int i=0; i<100; i++) {
    enemies3.add(1000);
  }
  for (int i=0; i<100; i++) {
    splinters.add(i);
  }
  shield=2;
  cool=0;
  coolstart=0;
  s1=0;
  s2=5000;
  s3=5000;
  s4=5000;
  s5=5000;
  s6=5000;
  s7=5000;
  s8=5000;
  s9=5000;
  s10=5000;
  s11=5000;
  s12=5000;
  s13=5000;
  s14=5000;
  s15=5000;
  gcount=0;
  gskill=0;
  gability=0;
  gabilityc=0;
  F=80;//80
  bx=180;
  by=-100;
  dbx=20;
  bability=0;
  rability=0;
  rabilityc=0;
  yability=0;
  yabilityc=0;
  for (int i=0; i<750; i++) {
    coinsX.add(i);
  }
  ability=0;
  a1=50.0;
  a2=50.0;
  a3=50.0;
  a4=50.0;
  a5=50.0;
  a6=50.0;
  a=0.1;
  scorescore=0;
  getcoin=0;
  win=0;
  stage[0]=1;//初期ステージは固定
  for (int i=1; i<13; i++) {//i<ステージ数
    stage[i]=0;
  }
  r=0;
  cr=0;
  r2=0;
  st=1;
  s5000=0;
  speedUI=0;
  speedUIc=0;
  gUI=40.0;
  gUI2=50.0;
  rUI=50.0;
  yUI=50.0;
  gUIy=-100;
  gUI2y=-100;
  rUIy=-100;
  yUIy=-100;
  kumoX=200;
  kumo2X=700;
  start=0;
  my2=0;
  dmy2=-5;
  mymy=0;
  for (int i=1; i<100; i++) {
    enemies5[i]=550;
  }

  img=loadImage("飛ぶ敵8bit.png");
  img2=loadImage("新しい敵8bit.png");
  img3=loadImage("悪魔8bit.png");

  allow=0;
  for (int i=1; i<16; i++) {//i<ステージ数
    stacoin[i]=0;
  }
  coinboost=0;
  boostcount=0;
  for (int i=0; i<150; i++) {
    broken[i]=0;
  }
  for (int i=0; i<750; i++) {
    got[i]=0;
  }
  for (int i=0; i<150; i++) {
    which[i]=0;
  }
  for (int i=0; i<750; i++) {
    whichc[i]=0;
  }
  dashc=0;
  jumpc=0;
  jump2c=0;
  jumpp=0;
  jump2p=0;
  landc=0;
  landp=0;
  jumpx=0;
  jumpy=0;
  jump2x=0;
  jump2y=0;
  landx=0;
  landy=0;
  rank=0;
  beamc=0;
  beamp=0;
  beamx=0;
  beamy=0;

  //日本語テキスト用
  PFont font = createFont("ＭＳ ゴシック", 50);
  textFont(font);
}

void draw() {

  //スタート画面
  if (scene==0) {
    background(173, 216, 230);
    fill(244, 164, 96);//床
    rect(0, 500, 800, 100);
    fill(0, 128, 0);//草
    rect(0, 500, 800, 20);
    fill(255, 255, 255);//雲
    ellipse(kumoX, 100, 200, 50);
    ellipse(kumo2X, 100, 200, 50);
    kumoX+=dx;
    kumo2X+=dx;
    if (kumoX<=-100) {
      kumoX=900;
    }
    if (kumo2X<=-100) {
      kumo2X=900;
    }

    fill(0);
    textSize(70);
    text("コイン集めゲーム", 120, 180);

    pushMatrix();//現在の座標位置を保存
    translate(80-(240/2), 150-(120/2));
    rotate(radians(-10));
    image(img3, 0, 0, 240, 120);
    popMatrix();//現在の座標位置を保存
    pushMatrix();//現在の座標位置を保存
    translate(700-(120/2), 120-(80/2));
    rotate(radians(10));
    image(img, 0, 0, 140, 80);
    popMatrix();//現在の座標位置を保存

    fill(0, 255, 0);
    pushMatrix();//現在の座標位置を保存
    count++;
    if (count==5) {//走るモーションの変化
      run++;
      if (run==3) {
        run=0;
      }
      count=0;
    }

    if (j==1) {//ジャンプ命令時
      jcount++;
      if (jcount<=20) {//一定時間ジャンプ
        djy=-10;
      } else if (jcount>20 && cy<=jjy-10) {
        djy=5;
      }
      if (djy>0 && cy==jjy-5) {
        djy=5; 
        j=0;
        jcount=0;
      }//リセット
      cy=cy+djy;
      ellipse(cx, cy, 20, 20);
      translate(cx, cy);//胴体
      rotate(radians(10));
      rect(0, 10, 5, 40);
      rotate(radians(300));//前腕
      rect(-10, 10, 5, 20);
      rotate(radians(270));//前手
      rect(-30, -10, 5, 15);
      rotate(radians(220));//後腕
      rect(7, 5, 5, 20);
      rotate(radians(300));//後手
      rect(-17, 17, 5, 15);
      rotate(radians(60));//後足
      rect(43, 13, 5, 20);
      rotate(radians(350));//前膝
      rect(32, -3, 5, 17);
      rotate(radians(270));//前足
      rect(0, 33, 5, 25);
    } else if (j==2) {//２回目ジャンプ
      jcount++;
      if (jcount<=12) {//一定時間ジャンプ
        djy=-10;
      } else if (jcount>10 && cy<=jjy-10) {
        djy=5;
      }
      if (djy>0 && cy==jjy-5) {
        djy=5; 
        j=0;
        jcount=0;
      }//リセット
      cy=cy+djy;
      ellipse(cx, cy, 20, 20);
      translate(cx, cy);//胴体
      rotate(radians(10));
      rect(0, 10, 5, 40);
      rotate(radians(300));//前腕
      rect(-10, 10, 5, 20);
      rotate(radians(270));//前手
      rect(-30, -10, 5, 15);
      rotate(radians(220));//後腕
      rect(7, 5, 5, 20);
      rotate(radians(300));//後手
      rect(-17, 17, 5, 15);
      rotate(radians(60));//後足
      rect(43, 13, 5, 20);
      rotate(radians(350));//前膝
      rect(32, -3, 5, 17);
      rotate(radians(270));//前足
      rect(0, 33, 5, 25);
    } else if (run==0 && j==0) {
      ellipse(cx, cy, 20, 20);
      translate(cx, cy);//胴体
      rotate(radians(10));
      rect(0, 10, 5, 40);
      rotate(radians(300));//前腕
      rect(-10, 10, 5, 20);
      rotate(radians(270));//前手
      rect(-30, -10, 5, 15);
      rotate(radians(220));//後腕
      rect(7, 5, 5, 20);
      rotate(radians(300));//後手
      rect(-17, 17, 5, 15);
      rotate(radians(60));//後足
      rect(43, 13, 5, 20);
      rotate(radians(350));//前膝
      rect(32, -3, 5, 17);
      rotate(radians(270));//前足
      rect(0, 33, 5, 25);
    } else if (run==1 && j==0) {
      ellipse(cx, cy, 20, 20);
      translate(cx, cy);//胴体
      rotate(radians(10));
      rect(0, 10, 5, 40);
      rotate(radians(310));//前腕
      rect(-10, 10, 5, 20);
      rotate(radians(250));//前手
      rect(-27, -20, 5, 15);
      rotate(radians(200));//後腕
      rect(7, 5, 5, 20);
      rotate(radians(300));//後手
      rect(-17, 17, 5, 15);
      rotate(radians(70));//後足
      rect(35, 25, 5, 20);
      rotate(radians(250));//前膝
      rect(-28, 20, 5, 17);
      rotate(radians(210));//前足
      rect(2, -65, 5, 25);
    } else if (run==2 && j==0) {
      ellipse(cx, cy, 20, 20);
      translate(cx, cy);//胴体
      rotate(radians(10));
      rect(0, 10, 5, 25);
      rotate(radians(340));//前腕
      rect(-3, 12, 5, 20);
      rotate(radians(230));//前手
      rect(-26, -20, 5, 15);
      rotate(radians(110));//前膝
      rect(-22, 25, 5, 17);
      rotate(radians(200));//前足
      rect(2, -65, 5, 20);
      rotate(radians(290));//後膝
      rect(32, -20, 5, 17);
      rotate(radians(310));//後足
      rect(35, 15, 5, 25);
    }
    popMatrix();//座標を戻す

    if (j==0) {
      jumpc=0;
      jumpp=0;
      jump2c=0;
      jump2p=0;

      if (landp==1) {//着地煙
        landx=cx;
        landy=cy;
        landp=2;
      }
      landc++;
      if (landc<50) {
        noStroke();
        fill(255, 255, 255, 245-landc*5);
        ellipse(landx, ((landy+65)-20/2)-(landc/4), 20, 20);
        ellipse(landx, ((landy+45)+20/2)+(landc/4), 20, 20);
        ellipse(landx, ((landy+65)-20/2)-(landc/8), 20, 20);
        ellipse(landx, ((landy+45)+20/2)+(landc/8), 20, 20);
        ellipse(((landx-3)-20/2)-(landc/8), landy+55, 20, 20);
        ellipse(((landx+3)+20/2)+(landc/8), landy+55, 20, 20);
        ellipse(((landx-3)-20/2)-(landc/4), landy+55, 20, 20);
        ellipse(((landx+3)+20/2)+(landc/4), landy+55, 20, 20);
        ellipse(((landx-3)-20/2)-(landc/2), landy+55, 20, 20);
        ellipse(((landx+3)+20/2)+(landc/2), landy+55, 20, 20);
        stroke(5);
      }
      landx+=dx;

      dashc++;//ダッシュ煙
      noStroke();
      fill(255, 255, 255, 240-dashc*16);
      ellipse(cx-15, ((cy+65)-20/2)-(dashc), 20, 20);
      ellipse(cx-15, ((cy+45)+20/2)+(dashc), 20, 20);
      ellipse(((cx-18)-20/2)-(dashc), cy+55, 20, 20);
      ellipse(((cx-12)+20/2)+(dashc), cy+55, 20, 20);
      stroke(5);
      if (dashc>=15) {
        dashc=0;
      }
    }
    if (j==1) {
      landp=1;
      landc=0;

      if (jumpp==0) {
        jumpx=cx;
        jumpy=cy+10;
        jumpp=1;
      }
      jumpc++;
      if (jumpc<50) {
        noStroke();
        fill(255, 255, 255, 245-jumpc*5);
        ellipse(jumpx, ((jumpy+65)-20/2)-(jumpc/4), 20, 20);
        ellipse(jumpx, ((jumpy+45)+20/2)+(jumpc/4), 20, 20);
        ellipse(jumpx, ((jumpy+65)-20/2)-(jumpc/8), 20, 20);
        ellipse(jumpx, ((jumpy+45)+20/2)+(jumpc/8), 20, 20);
        ellipse(((jumpx-3)-20/2)-(jumpc/8), jumpy+55, 20, 20);
        ellipse(((jumpx+3)+20/2)+(jumpc/8), jumpy+55, 20, 20);
        ellipse(((jumpx-3)-20/2)-(jumpc/4), jumpy+55, 20, 20);
        ellipse(((jumpx+3)+20/2)+(jumpc/4), jumpy+55, 20, 20);
        ellipse(((jumpx-3)-20/2)-(jumpc/2), jumpy+55, 20, 20);
        ellipse(((jumpx+3)+20/2)+(jumpc/2), jumpy+55, 20, 20);
        stroke(5);
      }
      jumpx+=dx;
    }

    if (j==2) {
      if (jump2p==0) {
        jump2x=cx;
        jump2y=cy;
        jump2c=0;
        jump2p=1;
      }
      jump2c++;
      if (jump2c<40) {
        stroke(0, 0, 0, 245-jump2c*5);
        fill(255, 255, 255, 0);
        ellipse(jump2x, jump2y+55, 20+(jump2c*2), 10+(jump2c/4));
      }
      jump2x+=dx;
    }

    button0();
  }

  //名前入力画面
  if (scene==1) {
    background(240, 248, 255);

    count=0;
    run=0;
    j=0;
    djy=0;
    jcount=0;
    wx=800;
    cx=180;
    dx=-5;
    cy=435;
    jjy=435;
    dashc=0;
    jumpc=0;
    jump2c=0;
    jumpp=0;
    jump2p=0;
    landc=0;
    landp=0;
    jumpx=0;
    jumpy=0;
    jump2x=0;
    jump2y=0;
    landx=0;
    landy=0;
    rank=0;

    fill(0);
    textSize(70);
    text("ニックネームを入力", 100, 150);
    button1();
    nickname();
  }

  //セレクト画面
  if (scene==2) {
    noStroke();
    fill(245, 245, 245);//背景
    rect(0, 0, 800, 600);

    fill(0, 0, 0); 
    rect(0, 0, 800, 2);//大横線
    rect(0, 598, 800, 2);
    rect(0, 100, 800, 2);
    rect(0, 300, 800, 2);
    rect(0, 500, 800, 2);

    rect(0, 130, 800, 1);
    rect(0, 330, 800, 1);

    rect(399, 102, 2, 398);//大縦線
    rect(200, 102, 1, 398);
    rect(600, 102, 1, 398);

    rect(202, 190, 199, 2);//中横線
    rect(202, 390, 199, 2);
    rect(602, 190, 199, 2);
    rect(602, 390, 199, 2);

    rect(202, 250, 199, 1);
    rect(602, 250, 199, 1);
    rect(202, 450, 199, 1);
    rect(602, 450, 199, 1);

    //インフォメーション
    fill(255, 0, 255);
    textSize(70);
    text("キャラクター選択", 120, 75);

    fill(0, 128, 0);//緑
    textSize(20);
    text("左クリックでジャンプ", 0, 125);
    text("スキル", 270, 125);
    text("アビリティ", 250, 215);
    text("(右クリック)", 240, 240);
    fill(0, 0, 0);
    text("１度だけミスしても", 210, 155);
    text("上空から復活できる", 210, 180);
    textSize(17);
    text("ゲームスピードダウンx3", 205, 280);
    textSize(20);

    fill(0, 0, 255);//青
    textSize(20);
    text("左クリックでジャンプ", 400, 125);
    text("スキル", 670, 125);
    text("アビリティ", 650, 215);
    text("(右クリック)", 640, 240);
    fill(0, 0, 0);
    textSize(18);
    text("障害物無効バリアx2", 620, 155);
    textSize(13);
    text("ビームで敵倒すとポイントアップ", 603, 180);
    textSize(20);
    text("ビーム攻撃x15", 635, 285);

    fill(255, 0, 0);//赤
    textSize(20);
    text("左クリックでジャンプ", 0, 325);
    text("スキル", 270, 325);
    text("アビリティ", 250, 415);
    text("(右クリック)", 240, 440);
    fill(0, 0, 0);
    text("空中ジャンプ+1回", 220, 370);
    textSize(18);
    text("一定時間", 260, 470);
    text("無限空中ジャンプx3", 220, 490);

    fill(255, 165, 0);//黄
    textSize(20);
    text("左クリックでジャンプ", 400, 325);
    text("スキル", 670, 325);
    text("アビリティ", 650, 415);
    text("(右クリック)", 640, 440);
    fill(0, 0, 0);
    text("コイン獲得", 650, 355);
    text("ポイントアップ", 630, 380);
    textSize(18);
    text("コイン自動回収x3", 630, 470);
    textSize(14);
    text("コイン獲得ポイント更にアップ", 603, 490);

    if (keyK==1 && mouseY>=500) {//決定ボタン
      fill(0, 255, 255);
      rect(0, 503, 800, 95);
    }
    fill(KR, KG, KB);//決定ボタン
    textSize(70);
    text("決定", 330, 575);

    //選択中
    fill(255, 0, 255);
    rect(r1x, r1y, 400, 3);
    rect(r1x, r1y, 3, 200);
    rect(r1x, r2y, 400, 3);
    rect(r2x, r1y, 3, 200);
    if (mouseX<=400 && mouseY>=100 && mouseY<=300) {
      r1x=0;
      r1y=100;
      r2x=397;
      r2y=299;
    } else if (mouseX>400 && mouseY>=100 && mouseY<=300) {
      r1x=400;
      r1y=100;
      r2x=797;
      r2y=299;
    } else if (mouseX<=400 && mouseY>300 && mouseY<500) {
      r1x=0;
      r1y=300;
      r2x=397;
      r2y=500;
    } else if (mouseX>400 && mouseY>300 && mouseY<500) {
      r1x=400;
      r1y=300;
      r2x=797;
      r2y=500;
    }

    //選択完了
    fill(255, 0, 0);
    rect(r3x, r3y, 400, 3);
    rect(r3x, r3y, 3, 200);
    rect(r3x, r4y, 400, 3);
    rect(r4x, r3y, 3, 200);

    //キャラクター

    stroke(5);
    fill(0, 255, 0);//緑
    pushMatrix();//現在の座標位置を保存
    if (mouseX<=400 && mouseY>=100 && mouseY<=300) {
      count++;
      if (count==5) {//走るモーションの変化
        run++;
        if (run==3) {
          run=0;
        }
        count=0;
      }

      if (run==0) {
        ellipse(95, 230, 20, 20);
        translate(95, 230);//胴体
        rotate(radians(10));
        rect(0, 10, 5, 40);
        rotate(radians(300));//前腕
        rect(-10, 10, 5, 20);
        rotate(radians(270));//前手
        rect(-30, -10, 5, 15);
        rotate(radians(220));//後腕
        rect(7, 5, 5, 20);
        rotate(radians(300));//後手
        rect(-17, 17, 5, 15);
        rotate(radians(60));//後足
        rect(43, 13, 5, 20);
        rotate(radians(350));//前膝
        rect(32, -3, 5, 17);
        rotate(radians(270));//前足
        rect(0, 33, 5, 25);
      } else if (run==1) {
        ellipse(95, 230, 20, 20);
        translate(95, 230);//胴体
        rotate(radians(10));
        rect(0, 10, 5, 40);
        rotate(radians(310));//前腕
        rect(-10, 10, 5, 20);
        rotate(radians(250));//前手
        rect(-27, -20, 5, 15);
        rotate(radians(200));//後腕
        rect(7, 5, 5, 20);
        rotate(radians(300));//後手
        rect(-17, 17, 5, 15);
        rotate(radians(70));//後足
        rect(35, 25, 5, 20);
        rotate(radians(250));//前膝
        rect(-28, 20, 5, 17);
        rotate(radians(210));//前足
        rect(2, -65, 5, 25);
      } else if (run==2) {
        ellipse(95, 230, 20, 20);
        translate(95, 230);//胴体
        rotate(radians(10));
        rect(0, 10, 5, 25);
        rotate(radians(340));//前腕
        rect(-3, 12, 5, 20);
        rotate(radians(230));//前手
        rect(-26, -20, 5, 15);
        rotate(radians(110));//前膝
        rect(-22, 25, 5, 17);
        rotate(radians(200));//前足
        rect(2, -65, 5, 20);
        rotate(radians(290));//後膝
        rect(32, -20, 5, 17);
        rotate(radians(310));//後足
        rect(35, 15, 5, 25);
      }
    } else {
      ellipse(95, 230, 20, 20);
      translate(95, 230);//胴体
      rotate(radians(10));
      rect(0, 10, 5, 40);
      rotate(radians(310));//前腕
      rect(-10, 10, 5, 20);
      rotate(radians(250));//前手
      rect(-27, -20, 5, 15);
      rotate(radians(200));//後腕
      rect(7, 5, 5, 20);
      rotate(radians(300));//後手
      rect(-17, 17, 5, 15);
      rotate(radians(70));//後足
      rect(35, 25, 5, 20);
      rotate(radians(250));//前膝
      rect(-28, 20, 5, 17);
      rotate(radians(210));//前足
      rect(2, -65, 5, 25);
    }
    popMatrix();//座標を戻す

    fill(0, 0, 255);//青
    pushMatrix();//現在の座標位置を保存
    if (mouseX>400 && mouseY>=100 && mouseY<=300) {
      count++;
      if (count==5) {//走るモーションの変化
        run++;
        if (run==3) {
          run=0;
        }
        count=0;
      }

      if (run==0) {
        ellipse(495, 230, 20, 20);
        translate(495, 230);//胴体
        rotate(radians(10));
        rect(0, 10, 5, 40);
        rotate(radians(300));//前腕
        rect(-10, 10, 5, 20);
        rotate(radians(270));//前手
        rect(-30, -10, 5, 15);
        rotate(radians(220));//後腕
        rect(7, 5, 5, 20);
        rotate(radians(300));//後手
        rect(-17, 17, 5, 15);
        rotate(radians(60));//後足
        rect(43, 13, 5, 20);
        rotate(radians(350));//前膝
        rect(32, -3, 5, 17);
        rotate(radians(270));//前足
        rect(0, 33, 5, 25);
      } else if (run==1) {
        ellipse(495, 230, 20, 20);
        translate(495, 230);//胴体
        rotate(radians(10));
        rect(0, 10, 5, 40);
        rotate(radians(310));//前腕
        rect(-10, 10, 5, 20);
        rotate(radians(250));//前手
        rect(-27, -20, 5, 15);
        rotate(radians(200));//後腕
        rect(7, 5, 5, 20);
        rotate(radians(300));//後手
        rect(-17, 17, 5, 15);
        rotate(radians(70));//後足
        rect(35, 25, 5, 20);
        rotate(radians(250));//前膝
        rect(-28, 20, 5, 17);
        rotate(radians(210));//前足
        rect(2, -65, 5, 25);
      } else if (run==2) {
        ellipse(495, 230, 20, 20);
        translate(495, 230);//胴体
        rotate(radians(10));
        rect(0, 10, 5, 25);
        rotate(radians(340));//前腕
        rect(-3, 12, 5, 20);
        rotate(radians(230));//前手
        rect(-26, -20, 5, 15);
        rotate(radians(110));//前膝
        rect(-22, 25, 5, 17);
        rotate(radians(200));//前足
        rect(2, -65, 5, 20);
        rotate(radians(290));//後膝
        rect(32, -20, 5, 17);
        rotate(radians(310));//後足
        rect(35, 15, 5, 25);
      }
    } else {
      ellipse(495, 230, 20, 20);
      translate(495, 230);//胴体
      rotate(radians(10));
      rect(0, 10, 5, 40);
      rotate(radians(310));//前腕
      rect(-10, 10, 5, 20);
      rotate(radians(250));//前手
      rect(-27, -20, 5, 15);
      rotate(radians(200));//後腕
      rect(7, 5, 5, 20);
      rotate(radians(300));//後手
      rect(-17, 17, 5, 15);
      rotate(radians(70));//後足
      rect(35, 25, 5, 20);
      rotate(radians(250));//前膝
      rect(-28, 20, 5, 17);
      rotate(radians(210));//前足
      rect(2, -65, 5, 25);
    }
    popMatrix();//座標を戻す

    fill(255, 0, 0);//赤
    pushMatrix();//現在の座標位置を保存
    if (mouseX<=400 && mouseY>300 && mouseY<500) {
      count++;
      if (count==5) {//走るモーションの変化
        run++;
        if (run==3) {
          run=0;
        }
        count=0;
      }

      if (run==0) {
        ellipse(95, 430, 20, 20);
        translate(95, 430);//胴体
        rotate(radians(10));
        rect(0, 10, 5, 40);
        rotate(radians(300));//前腕
        rect(-10, 10, 5, 20);
        rotate(radians(270));//前手
        rect(-30, -10, 5, 15);
        rotate(radians(220));//後腕
        rect(7, 5, 5, 20);
        rotate(radians(300));//後手
        rect(-17, 17, 5, 15);
        rotate(radians(60));//後足
        rect(43, 13, 5, 20);
        rotate(radians(350));//前膝
        rect(32, -3, 5, 17);
        rotate(radians(270));//前足
        rect(0, 33, 5, 25);
      } else if (run==1) {
        ellipse(95, 430, 20, 20);
        translate(95, 430);//胴体
        rotate(radians(10));
        rect(0, 10, 5, 40);
        rotate(radians(310));//前腕
        rect(-10, 10, 5, 20);
        rotate(radians(250));//前手
        rect(-27, -20, 5, 15);
        rotate(radians(200));//後腕
        rect(7, 5, 5, 20);
        rotate(radians(300));//後手
        rect(-17, 17, 5, 15);
        rotate(radians(70));//後足
        rect(35, 25, 5, 20);
        rotate(radians(250));//前膝
        rect(-28, 20, 5, 17);
        rotate(radians(210));//前足
        rect(2, -65, 5, 25);
      } else if (run==2) {
        ellipse(95, 430, 20, 20);
        translate(95, 430);//胴体
        rotate(radians(10));
        rect(0, 10, 5, 25);
        rotate(radians(340));//前腕
        rect(-3, 12, 5, 20);
        rotate(radians(230));//前手
        rect(-26, -20, 5, 15);
        rotate(radians(110));//前膝
        rect(-22, 25, 5, 17);
        rotate(radians(200));//前足
        rect(2, -65, 5, 20);
        rotate(radians(290));//後膝
        rect(32, -20, 5, 17);
        rotate(radians(310));//後足
        rect(35, 15, 5, 25);
      }
    } else {
      ellipse(95, 430, 20, 20);
      translate(95, 430);//胴体
      rotate(radians(10));
      rect(0, 10, 5, 40);
      rotate(radians(310));//前腕
      rect(-10, 10, 5, 20);
      rotate(radians(250));//前手
      rect(-27, -20, 5, 15);
      rotate(radians(200));//後腕
      rect(7, 5, 5, 20);
      rotate(radians(300));//後手
      rect(-17, 17, 5, 15);
      rotate(radians(70));//後足
      rect(35, 25, 5, 20);
      rotate(radians(250));//前膝
      rect(-28, 20, 5, 17);
      rotate(radians(210));//前足
      rect(2, -65, 5, 25);
    }
    popMatrix();//座標を戻す

    fill(255, 255, 0);//黄
    pushMatrix();//現在の座標位置を保存
    if (mouseX>400 && mouseY>300 && mouseY<500) {
      count++;
      if (count==5) {//走るモーションの変化
        run++;
        if (run==3) {
          run=0;
        }
        count=0;
      }

      if (run==0) {
        ellipse(495, 430, 20, 20);
        translate(495, 430);//胴体
        rotate(radians(10));
        rect(0, 10, 5, 40);
        rotate(radians(300));//前腕
        rect(-10, 10, 5, 20);
        rotate(radians(270));//前手
        rect(-30, -10, 5, 15);
        rotate(radians(220));//後腕
        rect(7, 5, 5, 20);
        rotate(radians(300));//後手
        rect(-17, 17, 5, 15);
        rotate(radians(60));//後足
        rect(43, 13, 5, 20);
        rotate(radians(350));//前膝
        rect(32, -3, 5, 17);
        rotate(radians(270));//前足
        rect(0, 33, 5, 25);
      } else if (run==1) {
        ellipse(495, 430, 20, 20);
        translate(495, 430);//胴体
        rotate(radians(10));
        rect(0, 10, 5, 40);
        rotate(radians(310));//前腕
        rect(-10, 10, 5, 20);
        rotate(radians(250));//前手
        rect(-27, -20, 5, 15);
        rotate(radians(200));//後腕
        rect(7, 5, 5, 20);
        rotate(radians(300));//後手
        rect(-17, 17, 5, 15);
        rotate(radians(70));//後足
        rect(35, 25, 5, 20);
        rotate(radians(250));//前膝
        rect(-28, 20, 5, 17);
        rotate(radians(210));//前足
        rect(2, -65, 5, 25);
      } else if (run==2) {
        ellipse(495, 430, 20, 20);
        translate(495, 430);//胴体
        rotate(radians(10));
        rect(0, 10, 5, 25);
        rotate(radians(340));//前腕
        rect(-3, 12, 5, 20);
        rotate(radians(230));//前手
        rect(-26, -20, 5, 15);
        rotate(radians(110));//前膝
        rect(-22, 25, 5, 17);
        rotate(radians(200));//前足
        rect(2, -65, 5, 20);
        rotate(radians(290));//後膝
        rect(32, -20, 5, 17);
        rotate(radians(310));//後足
        rect(35, 15, 5, 25);
      }
    } else {
      ellipse(495, 430, 20, 20);
      translate(495, 430);//胴体
      rotate(radians(10));
      rect(0, 10, 5, 40);
      rotate(radians(310));//前腕
      rect(-10, 10, 5, 20);
      rotate(radians(250));//前手
      rect(-27, -20, 5, 15);
      rotate(radians(200));//後腕
      rect(7, 5, 5, 20);
      rotate(radians(300));//後手
      rect(-17, 17, 5, 15);
      rotate(radians(70));//後足
      rect(35, 25, 5, 20);
      rotate(radians(250));//前膝
      rect(-28, 20, 5, 17);
      rotate(radians(210));//前足
      rect(2, -65, 5, 25);
    }
    popMatrix();//座標を戻す
    if (wait==1) {
      waitcount++;
      if (waitcount>=50) {
        scene=3;
        waitcount=0;
        wait=0;
      }
    }

    //okcolor();
  }

  if (waitp==1) {
    waitpcount++;
    if (waitpcount>=50) {
      scene=1;
      textx=200;
      texty=250;
      field.setBounds(textx, texty, textw, texth);
      waitpcount=0;
      waitp=0;
    }
  }

  if (waitn==1) {
    waitncount++;
    if (waitncount>=50) {
      scene=2;//セレクト画面へ
      textx=-100;
      texty=-100;
      field.setBounds(textx, texty, textw, texth);
      waitncount=0;
      waitn=0;
    }
  }

  if (waitm==1) {
    waitmcount++;
    if (waitmcount>=50) {
      scene=0;//スタート画面へ
      textx=-100;
      texty=-100;
      field.setBounds(textx, texty, textw, texth);
      waitmcount=0;
      waitm=0;
    }
  }

  //プレイ画面
  if (scene==3) {
    frameRate(F);
    //5で27000,6で32000
    //コイン置くときここからコメント
    if ((wx-800==0 || (wx-800)%52000==0 ) && start==1) {//ステージランダム生成(2000多いのは休憩時間確保のため)
      if (s5000!=0) {//２週目以降スピードアップ
        F+=20;
        speedUI=1;
      }
      s5000++;
      while (stage[12]==0) {//ステージ数-1
        r=int(random(2, 14));//(2,ステージ数+1)
        for (int i=1; i<13; i++) {//(i<ステージ数)
          if (r==stage[i]) {
            r2=1;
          }
        }
        if (r2==0) {
          stage[st]=r;
          st++;
        }
        r2=0;
      }
      st=1;//次の周ステージ2以降の抽選

      for (int i=1; i<13; i++) {//(i<ステージ数)
        if (stage[i]>10) {
          stage[i]=20;//抽選に外れたステージを除外
        }
      }
      s1=(52000*s5000-52000)+(5000*stage[0]-5000);//6で32000
      s2=(52000*s5000-52000)+(5000*stage[1]-5000);
      s3=(52000*s5000-52000)+(5000*stage[2]-5000);
      s4=(52000*s5000-52000)+(5000*stage[3]-5000);
      s5=(52000*s5000-52000)+(5000*stage[4]-5000);
      s6=(52000*s5000-52000)+(5000*stage[5]-5000);
      s7=(52000*s5000-52000)+(5000*stage[6]-5000);
      s8=(52000*s5000-52000)+(5000*stage[7]-5000);
      s9=(52000*s5000-52000)+(5000*stage[8]-5000);
      s10=(52000*s5000-52000)+(5000*stage[9]-5000);
      s11=(52000*s5000-52000)+(5000*stage[10]-5000);
      s12=(52000*s5000-52000)+(5000*stage[11]-5000);
      s13=(52000*s5000-52000)+(5000*stage[12]-5000);//増やす

      for (int i=1; i<16; i++) {//初期化
        stacoin[i]=0;
      }

      for (;; ) {//2倍コインランダム決定
        cr=int(random(2, 14));//(2,ステージ数+1)
        if (stage[cr-1]<=10) {
          stacoin[cr]=1;
          break;
        }
      }

      //初期化と再配置
      for (int i=1; i<13; i++) {//ステージ増やす毎に変える
        stage[i]=0;
      }  
      for (int i=0; i<150; i++) {
        enemies.set(i, i);
      }
      for (int i=0; i<150; i++) {
        broken[i]=0;
      }
      for (int i=0; i<750; i++) {
        got[i]=0;
      }
      for (int i=0; i<750; i++) {
        coins.set(i, i);
      }
      for (int i=0; i<100; i++) {
        enemies3.set(i, 1000);
      }
      for (int i=0; i<100; i++) {
        splinters.set(i, i);
      }
      for (int i=0; i<750; i++) {
        coinsX.set(i, i);
      }
      for (int i=0; i<150; i++) {
        which[i]=0;
      }
      for (int i=0; i<750; i++) {
        whichc[i]=0;
      }
    }
    //ここまでコイン


    if (start==1) {
      scorescore++;
    }
    if (start==1 && coinboost==1) {
      scorescore++;
    }

    jjy=435;
    osare=0;
    getcoin=0;
    win=0;

    noStroke();
    //背景
    fill(173, 216, 230);
    rect(0, 0, 800, 600);



    if (start==1) {
      wx=wx+dx;
    }
    //刺はここに書く(隠れさせるため)
    splinter(395+s2, 420, 1, 80);
    splinter(500+s2, 420, 2, 80);
    splinter(3150+s2, 500, 3, 80);
    splinter(3250+s2, 500, 4, 80);
    splinter(3350+s2, 500, 5, 80);
    splinter(3700+s2, 500, 6, 80);
    splinter(3800+s2, 500, 7, 80);
    splinter(3900+s2, 500, 8, 80);
    splinter(400+s5, 500, 9, 80);
    splinter(500+s5, 500, 10, 80);
    splinter(600+s5, 500, 11, 80);
    splinter(900+s5, 500, 12, 80);
    splinter(1200+s5, 500, 13, 80);
    splinter(1600+s5, 500, 14, 80);
    splinter(2000+s6, 500, 15, 160);
    splinter(4320+s6, 500, 16, 80);
    splinter(700+s7, 500, 17, 80);
    splinter(900+s7, 500, 18, 80);
    splinter2(3500+s8, 250, 19, 80);
    splinter2(3800+s8, 250, 20, 80);
    splinter2(4100+s8, 250, 21, 80);
    splinter(3350+s8, 500, 22, 80);
    splinter(3650+s8, 500, 23, 80);
    splinter(3950+s8, 500, 24, 80);
    splinter(1320+s9, 450, 25, 80);
    splinter(1500+s9, 450, 26, 80);
    splinter(3140+s9, 400, 27, 80);
    splinter(3195+s9, 400, 28, 80);
    splinter(3250+s9, 400, 29, 80);
    splinter(3840+s9, 400, 30, 80);
    splinter(3895+s9, 400, 31, 80);
    splinter(3950+s9, 400, 32, 80);
    splinter2(2500+s10, 70, 33, 80);
    splinter(2650+s10, 320, 34, 80);
    splinter2(2800+s10, 70, 35, 80);
    splinter(2950+s10, 320, 36, 80);
    splinter2(3100+s10, 70, 37, 80);
    splinter(3250+s10, 320, 38, 80);
    splinter2(270+s11, 220, 39, 80);
    splinter(420+s11, 500, 40, 80);
    splinter2(570+s11, 220, 41, 80);
    splinter(720+s11, 500, 42, 80);
    splinter2(870+s11, 220, 43, 80);
    splinter(1020+s11, 500, 44, 80);
    splinter(1100+s11, 500, 45, 80);
    splinter2(1250+s11, 220, 46, 80);
    splinter(1400+s11, 500, 47, 80);
    splinter2(1550+s11, 220, 48, 80);
    splinter(1700+s11, 500, 49, 80);
    splinter2(220+s12, 200, 50, 80);
    splinter(370+s12, 480, 51, 80);
    splinter2(520+s12, 200, 52, 80);
    splinter(670+s12, 480, 53, 80);
    splinter2(820+s12, 200, 54, 80);
    splinter(970+s12, 480, 55, 80);
    splinter2(1120+s12, 200, 56, 80);
    splinter(4000+s13, 500, 57, 80);
    splinter(4050+s13, 500, 58, 80);



    //ここまで
    fill(244, 164, 96);//床
    rect(0, 500, 800, 100);
    fill(0, 128, 0);//草
    rect(0, 500, 800, 20);
    fill(255, 255, 255);//雲
    ellipse(kumoX, 100, 200, 50);
    ellipse(kumo2X, 100, 200, 50);
    if (start==1) {
      kumoX+=dx;
      kumo2X+=dx;
    }
    if (kumoX<=-100) {
      kumoX=900;
    }
    if (kumo2X<=-100) {
      kumo2X=900;
    }

    if (speedUI==1) {//スピードアップUI
      textSize(40);
      fill(255, 0, 0);
      text("!SPEED UP!", 280, 100);
      speedUIc++;
      if (speedUIc>=300) {
        speedUI=0;
        speedUIc=0;
      }
    }

    stroke(5);
    //ステージ1 //次の敵番号150から

    enemy1(100+s1, 460, 40, 1);
    enemy1(700+s1, 460, 40, 2);
    enemy1(780+s1, 460, 40, 3);
    enemy1(860+s1, 460, 40, 4);
    enemy2(1520+s1, 460, 40, 5);
    dan(2280+s1, 420, 600);
    enemy1(2440+s1, 380, 40, 6);
    enemy1(2520+s1, 380, 40, 7);
    enemy1(2600+s1, 380, 40, 8);
    enemy1(2680+s1, 380, 40, 9);
    enemy1(2760+s1, 380, 40, 10);
    ana(3840+s1, 500, 150);
    enemy2(4590+s1, 460, 40, 11);
    coin(65+s1, 400, 15, 1);
    coin(100+s1, 400, 15, 2);
    coin(135+s1, 400, 15, 3);   
    coin(180+s1, 320, 15, 4);
    coin(215+s1, 320, 15, 5);
    coin(250+s1, 320, 15, 6);  
    coin(680+s1, 400, 15, 7);
    coin(720+s1, 400, 15, 8);
    coin(760+s1, 400, 15, 9);
    coin(800+s1, 400, 15, 10);
    coin(840+s1, 400, 15, 11);
    coin(880+s1, 400, 15, 12);    
    coin(680+s1, 300, 15, 13);
    coin(720+s1, 300, 15, 14);
    coin(760+s1, 300, 15, 15);
    coin(800+s1, 300, 15, 16);
    coin(840+s1, 300, 15, 17);
    coin(880+s1, 300, 15, 18);
    coin(1450+s1, 335, 15, 19);    
    coin(1485+s1, 300, 15, 20);
    coin(1520+s1, 300, 15, 21);
    coin(1555+s1, 300, 15, 22);
    coin(1590+s1, 335, 15, 23);
    coin(2200+s1, 320, 15, 24);
    coin(2235+s1, 320, 15, 25);
    coin(2300+s1, 250, 15, 26);
    coin(2335+s1, 250, 15, 27);   
    coin(2420+s1, 300, 15, 28);
    coin(2460+s1, 300, 15, 29);
    coin(2500+s1, 300, 15, 30);
    coin(2540+s1, 300, 15, 31);
    coin(2580+s1, 300, 15, 32);
    coin(2620+s1, 300, 15, 33);
    coin(2660+s1, 300, 15, 34);
    coin(2700+s1, 300, 15, 35);
    coin(2740+s1, 300, 15, 36);
    coin(2780+s1, 300, 15, 37); 
    coin(3795+s1, 390, 15, 38);
    coin(3855+s1, 360, 15, 39);
    coin(3915+s1, 360, 15, 40);
    coin(3975+s1, 360, 15, 41);
    coin(4035+s1, 390, 15, 42);  
    coin(4520+s1, 335, 15, 43);
    coin(4555+s1, 300, 15, 44);
    coin(4590+s1, 300, 15, 45);
    coin(4625+s1, 300, 15, 46);
    coin(4660+s1, 335, 15, 47);

    //ステージ2
    dandan(0+s2, 420, 600);
    dan(600+s2, 340, 600);
    ana(1200+s2, 500, 550);
    enemy1(4300+s2, 460, 40, 12);
    enemy1(4380+s2, 460, 40, 13);
    enemy1(4460+s2, 460, 40, 14);
    enemy1(4540+s2, 460, 40, 15);
    enemy1(4620+s2, 460, 40, 16);
    coin(-70+s2, 355, 15, 48);
    coin(-35+s2, 320, 15, 49);
    coin(0+s2, 320, 15, 50);
    coin(350+s2, 235, 15, 51);
    coin(385+s2, 200, 15, 52);
    coin(420+s2, 200, 15, 53);
    coin(455+s2, 200, 15, 54);
    coin(810+s2, 200, 15, 55);
    coin(845+s2, 200, 15, 56);
    coin(880+s2, 165, 15, 57);
    coin(915+s2, 165, 15, 58);
    coin(950+s2, 165, 15, 59);
    coin(1200+s2, 200, 15, 60);
    coin(1235+s2, 165, 15, 61);
    coin(1270+s2, 165, 15, 62);
    coin(1600+s2, 400, 15, 63);
    coin(1635+s2, 365, 15, 64);
    coin(1670+s2, 365, 15, 65);
    coin(1900+s2, 450, 15, 66);
    coin(2000+s2, 450, 15, 67);
    coin(2100+s2, 350, 15, 68);
    coin(2200+s2, 350, 15, 69);
    coin(2300+s2, 450, 15, 70);
    coin(2400+s2, 450, 15, 71);
    coin(2500+s2, 350, 15, 72);
    coin(2600+s2, 350, 15, 73);
    coin(3100+s2, 335, 15, 74);
    coin(3150+s2, 300, 15, 75);
    coin(3200+s2, 300, 15, 76);
    coin(3250+s2, 300, 15, 77);
    coin(3300+s2, 300, 15, 78);
    coin(3350+s2, 300, 15, 79);
    coin(3400+s2, 335, 15, 80);
    coin(3650+s2, 335, 15, 81);
    coin(3700+s2, 300, 15, 82);
    coin(3750+s2, 300, 15, 83);
    coin(3800+s2, 300, 15, 84);
    coin(3850+s2, 300, 15, 85);
    coin(3900+s2, 300, 15, 86);
    coin(3950+s2, 335, 15, 87);
    coin(4100+s2, 380, 15, 88);
    coin(4135+s2, 345, 15, 89);
    coin(4170+s2, 345, 15, 90);
    coin(4100+s2, 345, 15, 91);
    coin(4135+s2, 310, 15, 92);
    coin(4170+s2, 310, 15, 93);
    coin(4300+s2, 350, 15, 94);
    coin(4400+s2, 350, 15, 95);
    coin(4500+s2, 350, 15, 96);
    coin(4600+s2, 350, 15, 97);
    stagecoin(1670+s2, 530, 30, 648, 2);
    enemy3(1000+s2, 300, 20, 1);
    enemy3(1650+s2, 200, 20, 2);
    enemy3(2250+s2, 460, 20, 3);
    enemy3(2450+s2, 350, 20, 4);
    enemy3(2650+s2, 460, 20, 5);
    enemy3(2850+s2, 350, 20, 6);
    enemy3(4300+s2, 460, 20, 7);

    //ステージ3
    ana(0+s3, 500, 800);
    enemy1(400+s3, 460, 40, 17);
    ana(900+s3, 500, 900);
    enemy1(1100+s3, 460, 40, 18);
    enemy2(1300+s3, 520, 40, 19);
    enemy2(1300+s3, 230, 40, 20);
    enemy1(1500+s3, 460, 40, 21);
    enemy3(2200+s3, 460, 20, 8);
    ana(2500+s3, 500, 2050);
    enemy2(2750+s3, 480, 40, 22);
    enemy2(2750+s3, 180, 40, 23);
    enemy1(2890+s3, 460, 40, 24);
    enemy1(2970+s3, 460, 40, 25);
    enemy1(3050+s3, 460, 40, 26);
    enemy2(3250+s3, 540, 40, 27);
    enemy2(3250+s3, 210, 40, 28);
    enemy1(3450+s3, 460, 40, 29);
    enemy1(3530+s3, 460, 40, 30);
    enemy1(3610+s3, 460, 40, 31);
    enemy2(3690+s3, 460, 40, 32);
    enemy1(3770+s3, 460, 40, 33);
    enemy1(3850+s3, 460, 40, 34);
    enemy1(3930+s3, 460, 40, 35);
    enemy2(4010+s3, 460, 40, 36);
    enemy1(4090+s3, 460, 40, 37);
    enemy1(4170+s3, 460, 40, 38);
    enemy1(4250+s3, 460, 40, 39);  
    coin(50+s3, 350, 15, 98);
    coin(90+s3, 315, 15, 99);
    coin(130+s3, 315, 15, 100);
    coin(250+s3, 350, 15, 101);
    coin(290+s3, 315, 15, 102);
    coin(330+s3, 315, 15, 103);
    coin(950+s3, 350, 15, 104);
    coin(990+s3, 315, 15, 105);
    coin(1030+s3, 315, 15, 106);
    coin(1250+s3, 350, 15, 107);
    coin(1300+s3, 385, 15, 108);
    coin(1350+s3, 350, 15, 109);
    coin(2050+s3, 350, 15, 110);
    coin(2100+s3, 315, 15, 111);
    coin(2150+s3, 315, 15, 112);
    coin(2550+s3, 350, 15, 113);
    coin(2590+s3, 315, 15, 114);
    coin(2630+s3, 315, 15, 115);
    coin(2750+s3, 360, 15, 116);
    coin(2790+s3, 325, 15, 117);
    coin(2830+s3, 325, 15, 118);
    coin(2950+s3, 350, 15, 119);
    coin(2990+s3, 350, 15, 120);
    coin(3200+s3, 385, 15, 121);
    coin(3240+s3, 385, 15, 122);
    coin(3240+s3, 350, 15, 123);
    coin(3280+s3, 350, 15, 124);
    coin(3320+s3, 350, 15, 125);
    coin(3430+s3, 350, 15, 126);
    coin(3470+s3, 350, 15, 127);
    coin(3510+s3, 350, 15, 128);
    coin(3550+s3, 350, 15, 129);
    coin(3590+s3, 350, 15, 130);
    coin(3630+s3, 350, 15, 131);
    coin(3670+s3, 315, 15, 132);
    coin(3710+s3, 315, 15, 133);
    coin(3750+s3, 350, 15, 134);
    coin(3790+s3, 350, 15, 135);
    coin(3830+s3, 350, 15, 136);
    coin(3870+s3, 350, 15, 137);
    coin(3910+s3, 350, 15, 138);
    coin(3950+s3, 350, 15, 139);
    coin(3990+s3, 315, 15, 140);
    coin(4030+s3, 315, 15, 141);
    coin(4070+s3, 350, 15, 142);
    coin(4110+s3, 350, 15, 143);
    coin(4150+s3, 350, 15, 144);
    coin(4190+s3, 350, 15, 145);
    coin(4230+s3, 350, 15, 146);
    coin(4270+s3, 350, 15, 147);
    stagecoin(1750+s3, 530, 30, 649, 3);

    //ステージ4
    enemy1(300+s4, 380, 40, 40);
    enemy4(500+s4, 350, 40, 41);
    skyfloor(550+s4, 250, 750);
    enemy4(1600+s4, 350, 40, 42);
    enemy3(1100+s4, 210, 20, 9);
    ana(2250+s4, 420, 300);
    dan(2550+s4, 420, 750);
    enemy1(3000+s4, 380, 40, 43);
    coin(160+s4, 350, 15, 148);
    coin(200+s4, 315, 15, 149);
    coin(240+s4, 315, 15, 150);
    coin(170+s4, 460, 15, 151);
    coin(210+s4, 460, 15, 152);
    coin(250+s4, 460, 15, 153);
    coin(600+s4, 160, 15, 154);
    coin(650+s4, 120, 15, 155);
    coin(700+s4, 160, 15, 156);
    coin(750+s4, 120, 15, 157);
    coin(800+s4, 160, 15, 158);
    coin(850+s4, 120, 15, 159);
    coin(900+s4, 160, 15, 160);
    coin(950+s4, 120, 15, 161);
    coin(1000+s4, 160, 15, 162);
    coin(1050+s4, 120, 15, 163);
    coin(1100+s4, 160, 15, 164);
    coin(1150+s4, 120, 15, 165);
    coin(1200+s4, 160, 15, 166);
    coin(1250+s4, 120, 15, 167);
    coin(600+s4, 410, 15, 168);
    coin(650+s4, 370, 15, 169);
    coin(700+s4, 410, 15, 170);
    coin(750+s4, 370, 15, 171);
    coin(800+s4, 410, 15, 172);
    coin(850+s4, 370, 15, 173);
    coin(900+s4, 410, 15, 174);
    coin(950+s4, 370, 15, 175);
    coin(1000+s4, 410, 15, 176);
    coin(1050+s4, 370, 15, 177);
    coin(1100+s4, 410, 15, 178);
    coin(1150+s4, 370, 15, 179);
    coin(1200+s4, 410, 15, 180);
    coin(1250+s4, 370, 15, 181);
    coin(2250+s4, 350, 15, 182);
    coin(2290+s4, 315, 15, 183);
    coin(2330+s4, 315, 15, 184);
    coin(2980+s4, 300, 15, 185);
    coin(3020+s4, 300, 15, 186);
    coin(3300+s4, 350, 15, 187);
    coin(3340+s4, 350, 15, 188);
    coin(3380+s4, 385, 15, 189);
    coin(3510+s4, 450, 15, 190);
    coin(3580+s4, 350, 15, 191);
    coin(3630+s4, 350, 15, 192);
    coin(3880+s4, 450, 15, 193);
    coin(3950+s4, 350, 15, 194);
    coin(4000+s4, 350, 15, 195);
    coin(4280+s4, 450, 15, 196);
    coin(4350+s4, 350, 15, 197);
    coin(4400+s4, 350, 15, 198);
    enemy3(3650+s4, 360, 20, 10);
    enemy3(3800+s4, 460, 20, 11);
    enemy3(4000+s4, 350, 20, 12);
    enemy3(4200+s4, 460, 20, 13);
    enemy3(4400+s4, 350, 20, 14);
    enemy3(4600+s4, 460, 20, 15);
    stagecoin(2500+s4, 450, 30, 650, 4);

    //ステージ5
    coin(350+s5, 335, 15, 199);
    coin(400+s5, 300, 15, 200);
    coin(450+s5, 300, 15, 201);
    coin(500+s5, 300, 15, 202);
    coin(550+s5, 300, 15, 203);
    coin(600+s5, 300, 15, 204);
    coin(650+s5, 335, 15, 205);
    coin(840+s5, 335, 15, 206);
    coin(880+s5, 300, 15, 207);
    coin(920+s5, 300, 15, 208);
    coin(960+s5, 335, 15, 209);
    coin(1140+s5, 335, 15, 210);
    coin(1180+s5, 300, 15, 211);
    coin(1220+s5, 300, 15, 212);
    coin(1260+s5, 335, 15, 213);
    coin(1540+s5, 335, 15, 214);
    coin(1580+s5, 300, 15, 215);
    coin(1620+s5, 300, 15, 216);
    coin(1660+s5, 335, 15, 217);
    coin(1910+s5, 335, 15, 218);
    coin(1950+s5, 300, 15, 219);
    coin(1990+s5, 300, 15, 220);    
    coin(2210+s5, 450, 15, 221);
    coin(2250+s5, 450, 15, 222);
    coin(2290+s5, 450, 15, 223);  
    coin(2510+s5, 335, 15, 224);
    coin(2550+s5, 300, 15, 225);
    coin(2590+s5, 300, 15, 226);
    coin(2810+s5, 450, 15, 227);
    coin(2850+s5, 450, 15, 228);
    coin(2890+s5, 450, 15, 229); 
    coin(3110+s5, 335, 15, 230);
    coin(3150+s5, 300, 15, 231);
    coin(3190+s5, 300, 15, 232);
    coin(3410+s5, 450, 15, 233);
    coin(3450+s5, 450, 15, 234);
    coin(3490+s5, 450, 15, 235);  
    coin(3880+s5, 350, 15, 236);
    coin(3920+s5, 350, 15, 237);
    coin(3920+s5, 300, 15, 238);
    coin(3960+s5, 300, 15, 239);
    coin(3960+s5, 250, 15, 240);
    coin(4000+s5, 250, 15, 241);  
    coin(4330+s5, 350, 15, 242);
    coin(4370+s5, 350, 15, 243);
    coin(4370+s5, 300, 15, 244);
    coin(4410+s5, 300, 15, 245);
    coin(4410+s5, 250, 15, 246);
    coin(4450+s5, 250, 15, 247);    
    enemy3(1500+s5, 320, 20, 16);
    enemy3(2100+s5, 460, 20, 17);
    enemy3(2300+s5, 380, 20, 18);
    enemy3(2500+s5, 300, 20, 19);
    enemy3(2700+s5, 460, 20, 20);
    enemy3(2900+s5, 380, 20, 21);
    enemy3(3100+s5, 300, 20, 22);
    enemy3(3300+s5, 460, 20, 23);
    enemy3(3500+s5, 380, 20, 24);
    enemy3(3700+s5, 300, 20, 25);
    enemy3(4200+s5, 460, 20, 26);
    enemy3(4200+s5, 410, 20, 27);
    enemy3(4200+s5, 360, 20, 28);
    enemy3(4600+s5, 460, 20, 29);
    enemy3(4600+s5, 410, 20, 30);
    enemy3(4600+s5, 360, 20, 31);
    stagecoin(1050+s5, 460, 30, 651, 5);

    //ステージ6
    ana(0+s6, 500, 200);
    movedan(200+s6, 400, 500);
    ana(700+s6, 500, 900);
    enemy1(1000+s6, 460, 40, 44);
    enemy1(1080+s6, 460, 40, 45);
    enemy4(1300+s6, 460, 40, 46);
    enemy4(1380+s6, 460, 40, 47);
    bane(2600+s6, 460, 40);
    ana(2700+s6, 500, 180);
    dan(2880+s6, 200, 520);
    ana(3400+s6, 500, 900);
    enemy1(3550+s6, 350, 40, 48);
    enemy2(3630+s6, 350, 40, 49);
    enemy1(3710+s6, 350, 40, 50);
    enemy4(4000+s6, 480, 40, 51);
    enemy4(4080+s6, 480, 40, 52);
    enemy4(4160+s6, 480, 40, 149);
    coin(0+s6, 350, 15, 248);
    coin(40+s6, 350, 15, 249);
    coin(40+s6, 315, 15, 250);
    coin(80+s6, 315, 15, 251);
    coin(80+s6, 280, 15, 252);
    coin(120+s6, 280, 15, 253);
    coin(300+s6, 280, 15, 254);
    coin(400+s6, 280, 15, 255);
    coin(500+s6, 280, 15, 256);
    coin(600+s6, 280, 15, 257);
    coin(980+s6, 315, 15, 258);
    coin(1020+s6, 315, 15, 259);
    coin(1060+s6, 315, 15, 260);
    coin(1100+s6, 315, 15, 261);
    coin(1280+s6, 315, 15, 262);
    coin(1320+s6, 315, 15, 263);
    coin(1360+s6, 315, 15, 264);
    coin(1400+s6, 315, 15, 265);    
    coin(1920+s6, 315, 15, 266);
    coin(1960+s6, 280, 15, 267);
    coin(2000+s6, 280, 15, 268);
    coin(2040+s6, 280, 15, 269);
    coin(2080+s6, 315, 15, 270); 
    coin(2450+s6, 350, 15, 271);
    coin(2490+s6, 315, 15, 272);
    coin(2530+s6, 315, 15, 273);
    coin(2620+s6, 280, 15, 274);
    coin(2620+s6, 245, 15, 275);
    coin(2660+s6, 280, 15, 276);
    coin(2660+s6, 245, 15, 277);
    coin(2660+s6, 210, 15, 278);
    coin(2660+s6, 175, 15, 279);
    coin(2700+s6, 210, 15, 280);
    coin(2700+s6, 175, 15, 281);
    coin(2700+s6, 140, 15, 282);
    coin(2700+s6, 105, 15, 283);
    coin(2740+s6, 140, 15, 284);
    coin(2740+s6, 105, 15, 285); 
    coin(3400+s6, 150, 15, 286);
    coin(3450+s6, 185, 15, 287);
    coin(3500+s6, 220, 15, 288);
    coin(3530+s6, 200, 15, 289);
    coin(3570+s6, 200, 15, 290);
    coin(3610+s6, 200, 15, 291);
    coin(3650+s6, 200, 15, 292);
    coin(3690+s6, 200, 15, 293);
    coin(3730+s6, 200, 15, 294);
    coin(4300+s6, 350, 15, 295);
    coin(4340+s6, 315, 15, 296);
    coin(4380+s6, 315, 15, 297);
    stagecoin(450+s6, 280, 30, 652, 6);

    //ステージ7
    ana2(0+s7, 500, 380);
    enemy2(800+s7, 460, 40, 53);
    ana2(1200+s7, 500, 1200);
    enemy1(1490+s7, 360, 40, 54);
    enemy1(1670+s7, 360, 40, 55);
    enemy2(1850+s7, 360, 40, 56);
    enemy1(2030+s7, 360, 40, 57);
    enemy1(2210+s7, 360, 40, 58);
    enemy2(2800+s7, 460, 40, 59);
    bane(3350+s7, 460, 40);
    movedan(3450+s7, 350, 250);
    ana2(4200+s7, 500, 200);
    enemy1(4000+s7, 460, 40, 60);
    coin(-50+s7, 350, 15, 298);
    coin(0+s7, 315, 15, 299);
    coin(50+s7, 315, 15, 300);
    coin(100+s7, 315, 15, 301);
    coin(150+s7, 315, 15, 302);
    coin(200+s7, 315, 15, 303);
    coin(250+s7, 315, 15, 304);
    coin(300+s7, 350, 15, 305);
    coin(350+s7, 350, 15, 306);
    coin(400+s7, 400, 15, 307);
    coin(450+s7, 400, 15, 308);
    coin(650+s7, 350, 15, 309);
    coin(700+s7, 315, 15, 310);
    coin(750+s7, 315, 15, 311);
    coin(800+s7, 315, 15, 312);
    coin(850+s7, 315, 15, 313);
    coin(900+s7, 315, 15, 314);
    coin(950+s7, 350, 15, 315);
    coin(1455+s7, 300, 15, 316);
    coin(1490+s7, 300, 15, 317);
    coin(1525+s7, 300, 15, 318);
    coin(1635+s7, 300, 15, 319);
    coin(1670+s7, 300, 15, 320);
    coin(1705+s7, 300, 15, 321);
    coin(1830+s7, 220, 15, 322);
    coin(1870+s7, 220, 15, 323);
    coin(1995+s7, 300, 15, 324);
    coin(2030+s7, 300, 15, 325);
    coin(2065+s7, 300, 15, 326);
    coin(2175+s7, 300, 15, 327);
    coin(2210+s7, 300, 15, 328);
    coin(2245+s7, 300, 15, 329);
    coin(2765+s7, 270, 15, 330);
    coin(2800+s7, 270, 15, 331);
    coin(2835+s7, 270, 15, 332);
    coin(3220+s7, 350, 15, 333);
    coin(3260+s7, 315, 15, 334);
    coin(3300+s7, 315, 15, 335);
    coin(3330+s7, 250, 15, 336);
    coin(3330+s7, 200, 15, 337);
    coin(3370+s7, 250, 15, 338);
    coin(3370+s7, 200, 15, 339);
    coin(3370+s7, 150, 15, 340);
    coin(3370+s7, 100, 15, 341);
    coin(3410+s7, 150, 15, 342);
    coin(3410+s7, 100, 15, 343);
    coin(3410+s7, 50, 15, 344);
    coin(4265+s7, 400, 15, 345);
    coin(4300+s7, 400, 15, 346);
    coin(4335+s7, 400, 15, 347);
    stagecoin(800+s7, 370, 30, 653, 7);
    enemy3(170+s7, 450, 20, 32);

    //ステージ8
    ana(0+s8, 500, 400);
    enemy5(80+s8, 450, 1);
    enemy5(140+s8, 425, 2);
    enemy5(200+s8, 400, 3);
    enemy5(260+s8, 425, 4);
    enemy5(320+s8, 450, 5);
    enemy3(800+s8, 400, 20, 33);
    enemy3(950+s8, 450, 20, 34);
    bane(1400+s8, 460, 40);
    ana(1600+s8, 500, 800);
    enemy2(1650+s8, 180, 40, 61);
    enemy2(1650+s8, 560, 40, 62);
    enemy1(1730+s8, 180, 40, 63);
    enemy2(1730+s8, 560, 40, 64);
    enemy1(1810+s8, 180, 40, 65);
    enemy1(1810+s8, 560, 40, 66);
    enemy1(1890+s8, 180, 40, 67);
    enemy1(1890+s8, 560, 40, 68);
    enemy2(1970+s8, 180, 40, 69);
    enemy1(1970+s8, 560, 40, 70);
    enemy1(2050+s8, 180, 40, 71);
    enemy1(2050+s8, 560, 40, 72);
    enemy1(2130+s8, 560, 40, 73);
    enemy3(2900+s8, 450, 20, 35);
    enemy3(3100+s8, 400, 20, 36);
    skyfloor(3300+s8, 250, 850);
    ana(3200+s8, 500, 100);
    coin(0+s8, 350, 15, 348);
    coin(50+s8, 315, 15, 349);
    coin(100+s8, 315, 15, 350);
    coin(150+s8, 315, 15, 351);
    coin(200+s8, 300, 15, 352);
    coin(250+s8, 300, 15, 353);
    coin(300+s8, 315, 15, 354);
    coin(350+s8, 315, 15, 355);
    coin(400+s8, 350, 15, 356);
    coin(680+s8, 450, 15, 357);
    coin(730+s8, 450, 15, 358);
    coin(780+s8, 350, 15, 359);
    coin(1150+s8, 460, 15, 360);
    coin(1200+s8, 460, 15, 361);
    coin(1430+s8, 300, 15, 362);
    coin(1430+s8, 265, 15, 363);
    coin(1500+s8, 460, 15, 364);
    coin(1550+s8, 460, 15, 365);
    coin(1630+s8, 70, 15, 366);
    coin(1670+s8, 70, 15, 367);
    coin(1710+s8, 70, 15, 368);
    coin(1750+s8, 70, 15, 369);
    coin(1790+s8, 70, 15, 370);
    coin(1830+s8, 70, 15, 371);
    coin(1870+s8, 70, 15, 372);
    coin(1910+s8, 70, 15, 373);
    coin(1950+s8, 70, 15, 374);
    coin(1990+s8, 70, 15, 375);
    coin(2030+s8, 70, 15, 376);
    coin(2070+s8, 70, 15, 377);
    coin(1810+s8, 480, 15, 378);
    coin(1890+s8, 480, 15, 379);
    coin(1970+s8, 480, 15, 380);
    coin(2050+s8, 480, 15, 381);
    coin(2130+s8, 480, 15, 382);
    coin(2700+s8, 350, 15, 383);
    coin(2740+s8, 350, 15, 384);
    coin(2920+s8, 450, 15, 385);
    coin(2960+s8, 450, 15, 386);
    coin(3350+s8, 320, 15, 387);
    coin(3480+s8, 450, 15, 388);
    coin(3520+s8, 450, 15, 389);
    coin(3630+s8, 320, 15, 390);
    coin(3670+s8, 320, 15, 391);
    coin(3780+s8, 450, 15, 392);
    coin(3820+s8, 450, 15, 393);
    coin(3930+s8, 320, 15, 394);
    coin(3970+s8, 320, 15, 395);
    coin(4080+s8, 450, 15, 396);
    coin(4120+s8, 450, 15, 397);
    stagecoin(1430+s8, 200, 30, 654, 8);

    //ステージ9
    ana(-50+s9, 500, 60);
    dan(10+s9, 300, 150);
    ana(160+s9, 300, 200);
    enemy5(260+s9, 200, 6);
    dan(360+s9, 300, 150);
    ana(510+s9, 300, 200);
    enemy5(610+s9, 200, 7);
    dan(710+s9, 300, 150);
    ana(860+s9, 300, 200);
    enemy5(960+s9, 200, 8);
    dan(1060+s9, 300, 150);
    dandan(1210+s9, 450, 400);
    dan(1610+s9, 300, 150);
    ana(1760+s9, 500, 60);
    movedan(1820+s9, 400, 200);
    ana(2020+s9, 500, 200);
    dan(2220+s9, 400, 350);
    ana(2570+s9, 400, 550);
    enemy1(2970+s9, 400, 40, 74);
    dan(3120+s9, 400, 150);
    ana(3270+s9, 400, 200);
    enemy1(3370+s9, 400, 40, 75);
    dan(3470+s9, 400, 150);
    ana(3620+s9, 400, 200);
    enemy2(3720+s9, 400, 40, 76);
    dan(3820+s9, 400, 150);
    ana(3970+s9, 400, 200);
    enemy1(4070+s9, 400, 40, 77);
    coin(-170+s9, 350, 15, 398);
    coin(-130+s9, 300, 15, 399);
    coin(-90+s9, 250, 15, 400);
    coin(85+s9, 250, 15, 401);
    coin(160+s9, 150, 15, 402);
    coin(230+s9, 115, 15, 403);
    coin(290+s9, 115, 15, 404);
    coin(360+s9, 150, 15, 405);
    coin(435+s9, 250, 15, 406);
    coin(510+s9, 150, 15, 407);
    coin(580+s9, 115, 15, 408);
    coin(640+s9, 115, 15, 409);
    coin(710+s9, 150, 15, 410);
    coin(785+s9, 250, 15, 411);
    coin(860+s9, 150, 15, 412);
    coin(930+s9, 115, 15, 413);
    coin(990+s9, 115, 15, 414);
    coin(1060+s9, 150, 15, 415);
    coin(1135+s9, 250, 15, 416);
    coin(1210+s9, 150, 15, 417);
    coin(1310+s9, 115, 15, 418);
    coin(1410+s9, 115, 15, 419);
    coin(1510+s9, 115, 15, 420);
    coin(1610+s9, 150, 15, 421);
    coin(1410+s9, 400, 15, 422);
    coin(1410+s9, 350, 15, 423);
    coin(1880+s9, 250, 15, 424);
    coin(1920+s9, 250, 15, 425);
    coin(1960+s9, 250, 15, 426);
    coin(2650+s9, 200, 15, 427);
    coin(2690+s9, 165, 15, 428);
    coin(2730+s9, 165, 15, 429);
    coin(3200+s9, 215, 15, 430);
    coin(3300+s9, 215, 15, 431);
    coin(3400+s9, 215, 15, 432);
    coin(3500+s9, 215, 15, 433);
    coin(3600+s9, 215, 15, 434);
    coin(3700+s9, 215, 15, 435);
    coin(3800+s9, 215, 15, 436);
    coin(3900+s9, 215, 15, 437);
    coin(4000+s9, 215, 15, 438);
    coin(3250+s9, 165, 15, 439);
    coin(3350+s9, 165, 15, 440);
    coin(3450+s9, 165, 15, 441);
    coin(3550+s9, 165, 15, 442);
    coin(3650+s9, 165, 15, 443);
    coin(3750+s9, 165, 15, 444);
    coin(3850+s9, 165, 15, 445);
    coin(3950+s9, 165, 15, 446);
    coin(4050+s9, 165, 15, 447);
    stagecoin(1410+s9, 305, 30, 655, 9);

    //ステージ10
    bane(0+s10, 460, 40);
    enemy3(300+s10, 300, 20, 37);
    enemy3(300+s10, 150, 20, 38);
    bane(500+s10, 460, 40);
    ana(580+s10, 500, 240);
    enemy1(700+s10, 460, 40, 78);
    enemy2(750+s10, 180, 40, 79);
    bane(1700+s10, 460, 40);
    skyfloor(2250+s10, 70, 1020);//下の空中床と逆にするとバグる
    skyfloor(2250+s10, 320, 1020);
    ana(1850+s10, 500, 1500);
    enemy3(2200+s10, 120, 20, 39);
    enemy1(2180+s10, 560, 40, 82);
    enemy1(2360+s10, 560, 40, 83);
    enemy1(2540+s10, 560, 40, 84);
    enemy1(2720+s10, 560, 40, 85);
    enemy1(2900+s10, 560, 40, 86);
    enemy1(3260+s10, 560, 40, 87);
    ana(3850+s10, 500, 350);
    enemy2(4000+s10, 490, 40, 88);
    enemy2(4000+s10, 180, 40, 89);
    enemy2(4150+s10, 490, 40, 90);
    enemy2(4150+s10, 200, 40, 91);
    coin(-80+s10, 460, 15, 448);
    coin(-20+s10, 250, 15, 449);
    coin(20+s10, 250, 15, 450);
    coin(-10+s10, 200, 15, 451);
    coin(30+s10, 200, 15, 452);
    coin(80+s10, 460, 15, 453);
    coin(420+s10, 460, 15, 454);
    coin(480+s10, 250, 15, 455);
    coin(520+s10, 250, 15, 456);
    coin(490+s10, 200, 15, 457);
    coin(530+s10, 200, 15, 458);
    coin(580+s10, 460, 15, 459);
    coin(680+s10, 300, 15, 460);
    coin(720+s10, 300, 15, 461);
    coin(730+s10, 80, 15, 462);
    coin(770+s10, 80, 15, 463);
    coin(1620+s10, 460, 15, 464);
    coin(1680+s10, 250, 15, 465);
    coin(1720+s10, 250, 15, 466);
    coin(1690+s10, 200, 15, 467);
    coin(1730+s10, 200, 15, 468);
    coin(1780+s10, 460, 15, 469);
    coin(1890+s10, 320, 15, 470);
    coin(1930+s10, 320, 15, 471);
    coin(2030+s10, 200, 15, 472);
    coin(2070+s10, 200, 15, 473);
    coin(2180+s10, 480, 15, 474);
    coin(2360+s10, 480, 15, 475);
    coin(2540+s10, 480, 15, 476);
    coin(2720+s10, 480, 15, 477);
    coin(2900+s10, 480, 15, 478);
    coin(3260+s10, 480, 15, 479);
    coin(2480+s10, 280, 15, 480);
    coin(2520+s10, 280, 15, 481);
    coin(2630+s10, 150, 15, 482);
    coin(2670+s10, 150, 15, 483);
    coin(2780+s10, 280, 15, 484);
    coin(2820+s10, 280, 15, 485);
    coin(2930+s10, 150, 15, 486);
    coin(2970+s10, 150, 15, 487);
    coin(3080+s10, 280, 15, 488);
    coin(3120+s10, 280, 15, 489);
    coin(3230+s10, 150, 15, 490);
    coin(3270+s10, 150, 15, 491);
    coin(3850+s10, 350, 15, 492);
    coin(3890+s10, 315, 15, 493);
    coin(3930+s10, 315, 15, 494);
    coin(4075+s10, 350, 15, 495);
    coin(4115+s10, 315, 15, 496);
    coin(4155+s10, 315, 15, 497);
    stagecoin(520+s10, 155, 30, 656, 10);

    //ステージ11
    skyfloor(0+s11, 370, 150);
    skyfloor(250+s11, 220, 1400);
    enemy2(500+s11, 190, 30, 92);
    enemy2(740+s11, 110, 30, 93);
    enemy2(980+s11, 190, 30, 94);
    enemy2(1220+s11, 110, 30, 95);
    enemy2(1460+s11, 190, 30, 96);
    skyfloor(1850+s11, 220, 1500);
    ana(1900+s11, 500, 1500);
    enemy2(2150+s11, 190, 30, 97);
    enemy2(2500+s11, 190, 30, 98);
    enemy2(2850+s11, 190, 30, 99);
    enemy2(3200+s11, 190, 30, 100);
    enemy1(2100+s11, 480, 40, 101);
    enemy1(2280+s11, 480, 40, 102);
    enemy1(2460+s11, 480, 40, 103);
    enemy5(2640+s11, 430, 9);
    enemy1(2820+s11, 480, 40, 104);
    enemy5(3000+s11, 430, 10);
    enemy1(3180+s11, 480, 40, 105);
    movedan(3400+s11, 400, 500);
    ana(3900+s11, 500, 200);
    coin(50+s11, 320, 15, 498);
    coin(100+s11, 320, 15, 499);
    coin(50+s11, 450, 15, 500);
    coin(100+s11, 450, 15, 501);
    coin(270+s11, 450, 15, 502);
    coin(400+s11, 300, 15, 503);
    coin(440+s11, 300, 15, 504);
    coin(570+s11, 450, 15, 505);
    coin(700+s11, 300, 15, 506);
    coin(740+s11, 300, 15, 507);
    coin(870+s11, 450, 15, 508);
    coin(1040+s11, 300, 15, 509);
    coin(1080+s11, 300, 15, 510);
    coin(1250+s11, 450, 15, 511);
    coin(1380+s11, 300, 15, 512);
    coin(1420+s11, 300, 15, 513);
    coin(1550+s11, 450, 15, 514);
    coin(480+s11, 80, 15, 515);
    coin(520+s11, 80, 15, 516);
    coin(720+s11, 170, 15, 517);
    coin(760+s11, 170, 15, 518);
    coin(960+s11, 80, 15, 519);
    coin(1000+s11, 80, 15, 520);
    coin(1200+s11, 170, 15, 521);
    coin(1240+s11, 170, 15, 522);
    coin(1440+s11, 80, 15, 523);
    coin(1480+s11, 80, 15, 524);
    coin(2115+s11, 80, 15, 525);
    coin(2150+s11, 80, 15, 526);
    coin(2185+s11, 80, 15, 527);
    coin(2465+s11, 80, 15, 528);
    coin(2500+s11, 80, 15, 529);
    coin(2535+s11, 80, 15, 530);
    coin(2815+s11, 80, 15, 531);
    coin(2850+s11, 80, 15, 532);
    coin(2885+s11, 80, 15, 533);
    coin(3165+s11, 80, 15, 534);
    coin(3200+s11, 80, 15, 535);
    coin(3235+s11, 80, 15, 536);
    coin(2080+s11, 400, 15, 537);
    coin(2120+s11, 400, 15, 538);
    coin(2260+s11, 400, 15, 539);
    coin(2300+s11, 400, 15, 540);
    coin(2440+s11, 400, 15, 541);
    coin(2480+s11, 400, 15, 542);
    coin(2640+s11, 350, 15, 543);
    coin(2820+s11, 400, 15, 544);
    coin(3000+s11, 350, 15, 545);
    coin(3180+s11, 400, 15, 546);
    coin(3650+s11, 280, 15, 547);
    stagecoin(270+s11, 180, 30, 657, 11);

    //ステージ12
    ana(0+s12, 500, 200);
    skyfloor(200+s12, 200, 1200);//同座標のdanやanaより先に書かないとバグる
    dan(200+s12, 480, 1100);
    enemy1(400+s12, 170, 30, 106);
    enemy1(460+s12, 170, 30, 107);
    enemy1(520+s12, 170, 30, 108);
    enemy1(580+s12, 170, 30, 109);
    enemy1(640+s12, 170, 30, 110);
    enemy1(700+s12, 170, 30, 111);
    enemy1(760+s12, 170, 30, 112);
    enemy1(820+s12, 170, 30, 113);
    enemy1(880+s12, 170, 30, 114);
    enemy1(940+s12, 170, 30, 115);
    enemy1(1000+s12, 170, 30, 116);
    enemy1(1060+s12, 170, 30, 117);
    ana(1300+s12, 500, 1010);
    enemy2(1350+s12, 520, 40, 118);
    enemy2(1450+s12, 200, 40, 119);
    enemy1(1500+s12, 520, 40, 120);
    enemy1(1840+s12, 480, 40, 121);
    enemy1(2180+s12, 440, 40, 122);
    dan(2310+s12, 400, 200);
    ana(2510+s12, 500, 200);
    skyfloor(2750+s12, 120, 1300);
    enemy5(2610+s12, 300, 11);
    dan(2710+s12, 400, 150);
    ana(2860+s12, 500, 200);
    enemy5(2960+s12, 300, 12);
    dan(3060+s12, 400, 150);
    ana(3210+s12, 500, 200);
    enemy5(3310+s12, 300, 13);
    dan(3410+s12, 400, 150);
    ana(3560+s12, 500, 200);
    enemy5(3660+s12, 300, 14);
    dan(3760+s12, 400, 150);
    ana(3910+s12, 500, 200);
    enemy5(4010+s12, 300, 15);
    dan(4110+s12, 400, 150);
    ana(4260+s12, 500, 200);
    enemy1(3100+s12, 90, 30, 123);
    enemy1(3160+s12, 90, 30, 124);
    enemy1(3220+s12, 90, 30, 125);
    enemy1(3280+s12, 90, 30, 126);
    enemy1(3340+s12, 90, 30, 127);
    enemy1(3400+s12, 90, 30, 128);
    enemy1(3460+s12, 90, 30, 129);
    enemy1(3520+s12, 90, 30, 130);
    enemy1(3580+s12, 90, 30, 131);
    enemy1(3640+s12, 90, 30, 132);
    enemy1(3700+s12, 90, 30, 133);
    enemy1(3760+s12, 90, 30, 134);
    enemy1(3820+s12, 90, 30, 135);
    enemy1(3880+s12, 90, 30, 136);
    enemy1(3940+s12, 90, 30, 137);
    coin(215+s12, 170, 15, 548);
    coin(255+s12, 170, 15, 549);
    coin(400+s12, 80, 15, 550);
    coin(460+s12, 80, 15, 551);
    coin(520+s12, 80, 15, 552);
    coin(580+s12, 80, 15, 553);
    coin(640+s12, 80, 15, 554);
    coin(700+s12, 80, 15, 555);
    coin(760+s12, 80, 15, 556);
    coin(820+s12, 80, 15, 557);
    coin(880+s12, 80, 15, 558);
    coin(940+s12, 80, 15, 559);
    coin(1000+s12, 80, 15, 560);
    coin(1060+s12, 80, 15, 561);
    coin(220+s12, 430, 15, 562);
    coin(370+s12, 300, 15, 563);
    coin(520+s12, 430, 15, 564);
    coin(670+s12, 300, 15, 565);
    coin(820+s12, 430, 15, 566);
    coin(970+s12, 300, 15, 567);
    coin(1300+s12, 350, 15, 568);
    coin(1340+s12, 315, 15, 569);
    coin(1380+s12, 315, 15, 570);
    coin(1400+s12, 100, 15, 571);
    coin(1440+s12, 50, 15, 572);
    coin(1700+s12, 200, 15, 573);
    coin(1740+s12, 150, 15, 574);
    coin(2000+s12, 250, 15, 575);
    coin(2040+s12, 200, 15, 576);
    coin(2590+s12, 230, 15, 577);
    coin(2630+s12, 230, 15, 578);
    coin(2940+s12, 230, 15, 579);
    coin(2980+s12, 230, 15, 580);
    coin(3290+s12, 230, 15, 581);
    coin(3330+s12, 230, 15, 582);
    coin(3640+s12, 230, 15, 583);
    coin(3680+s12, 230, 15, 584);
    coin(3990+s12, 230, 15, 585);
    coin(4030+s12, 230, 15, 586);
    coin(2700+s12, 110, 15, 587);
    coin(2730+s12, 110, 15, 588);
    coin(2760+s12, 95, 15, 589);
    coin(2820+s12, 100, 15, 590);
    coin(2850+s12, 100, 15, 591);
    coin(2880+s12, 100, 15, 592);
    coin(2910+s12, 100, 15, 593);
    coin(2940+s12, 100, 15, 594);
    coin(2970+s12, 100, 15, 595);
    coin(3000+s12, 100, 15, 596);
    coin(3030+s12, 100, 15, 597);
    stagecoin(2180+s12, 370, 30, 658, 12);

    //ステージ13
    ana(0+s13, 500, 1800);
    enemy3(410+s13, 330, 20, 40);
    enemy1(450+s13, 540, 40, 138);
    enemy1(530+s13, 540, 40, 139);
    enemy1(700+s13, 590, 40, 140);
    enemy3(820+s13, 420, 20, 41);
    enemy1(810+s13, 540, 40, 141);
    enemy1(890+s13, 540, 40, 142);
    enemy3(1180+s13, 420, 20, 42);
    enemy1(1170+s13, 540, 40, 143);
    enemy1(1250+s13, 540, 40, 144);
    enemy3(1490+s13, 330, 20, 43);
    enemy1(1510+s13, 540, 40, 145);
    enemy1(1590+s13, 540, 40, 146);
    enemy1(1750+s13, 590, 40, 147);
    ana2(2350+s13, 500, 200);
    enemy3(2750+s13, 330, 20, 44);
    ana2(2700+s13, 500, 200);
    enemy3(3100+s13, 330, 20, 45);
    ana2(3050+s13, 500, 200);
    enemy3(3520+s13, 480, 20, 46);
    ana2(3400+s13, 500, 200);
    enemy3(3750+s13, 330, 20, 47);
    ana2(3750+s13, 500, 200);
    ana2(4100+s13, 500, 200);
    enemy1(4200+s13, 560, 40, 148);
    coin(-35+s13, 460, 15, 598);
    coin(0+s13, 460, 15, 599);
    coin(30+s13, 350, 15, 600);
    coin(60+s13, 315, 15, 601);
    coin(90+s13, 315, 15, 602);
    coin(250+s13, 460, 15, 603);
    coin(290+s13, 460, 15, 604);
    coin(330+s13, 425, 15, 605);
    coin(650+s13, 315, 15, 606);
    coin(690+s13, 280, 15, 607);
    coin(730+s13, 280, 15, 608);
    coin(430+s13, 470, 15, 609);
    coin(470+s13, 470, 15, 610);
    coin(510+s13, 470, 15, 611);
    coin(550+s13, 470, 15, 612);
    coin(790+s13, 470, 15, 613);
    coin(830+s13, 470, 15, 614);
    coin(870+s13, 470, 15, 615);
    coin(910+s13, 470, 15, 616);
    coin(1150+s13, 470, 15, 617);
    coin(1190+s13, 470, 15, 618);
    coin(1230+s13, 470, 15, 619);
    coin(1270+s13, 470, 15, 620);
    coin(1490+s13, 470, 15, 621);
    coin(1530+s13, 470, 15, 622);
    coin(1570+s13, 470, 15, 623);
    coin(1610+s13, 470, 15, 624);
    coin(1950+s13, 460, 15, 625);
    coin(2050+s13, 460, 15, 626);
    coin(2150+s13, 460, 15, 627);
    coin(2350+s13, 350, 15, 628);
    coin(2390+s13, 315, 15, 629);
    coin(2430+s13, 315, 15, 630);
    coin(2600+s13, 460, 15, 631);
    coin(2650+s13, 460, 15, 632);
    coin(2950+s13, 460, 15, 633);
    coin(3000+s13, 460, 15, 634);
    coin(3300+s13, 460, 15, 635);
    coin(3350+s13, 460, 15, 636);
    coin(3650+s13, 460, 15, 637);
    coin(3700+s13, 460, 15, 638);
    coin(4000+s13, 315, 15, 639);
    coin(4050+s13, 315, 15, 640);
    coin(4160+s13, 460, 15, 641);
    coin(4200+s13, 460, 15, 642);
    coin(4240+s13, 460, 15, 643);
    coin(4350+s13, 460, 15, 644);
    coin(4380+s13, 460, 15, 645);
    coin(4410+s13, 460, 15, 646);
    coin(4440+s13, 460, 15, 647);
    stagecoin(1030+s13, 350, 30, 659, 13);

    //ステージ14


    //ステージ15


    if (cx<180 && osare==0 && j==0) {//押された分帰る
      cx=cx+5;
    }

    //キャラクター
    if (rability==1 || gability==2 || bability==1 || bability==2 || yability==1) {//アビリティ使用時オレンジに光る
      stroke(255, 120, 0);
    } else {
      stroke(5);
    }
    if (ok==1) {
      fill(0, 255, 0);
    }
    if (ok==2) {
      fill(0, 0, 255);
      if (shield==2) {//バリア
        fill(0, 0, 255);
        rect(cx+30, cy, 3, 60);
      }
      if (shield==1) {
        fill(0, 255, 255);
        rect(cx+30, cy, 3, 60);
        fill(0, 0, 255);
      }

      if (coolstart==1) {//バリアのクールタイム
        cool++;
        if (cool%2==0) {
          coolUI++;
        }
        if (cool>=150) {
          cool=0;
          coolUI=0;
          coolstart=0;
        }
      }
    }
    if (ok==3) {
      fill(255, 0, 0);
    }
    if (ok==4) {
      fill(255, 255, 0);
    }

    pushMatrix();//現在の座標位置を保存
    count++;
    if (count==5) {//走るモーションの変化
      run++;
      if (run==3) {
        run=0;
      }
      count=0;
    }

    if (j==1) {//ジャンプ命令時
      jcount++;
      if (jcount<=20) {//一定時間ジャンプ
        djy=-10;
      } else if (jcount>20 && cy<=jjy-10) {
        djy=5;
      }
      if (djy>0 && cy==jjy-5) {
        djy=5; 
        j=0;
        jcount=0;
      }//リセット
      cy=cy+djy;
      if (coolUI%2==0) {//クールタイムUI
        ellipse(cx, cy, 20, 20);
        translate(cx, cy);//胴体
        rotate(radians(10));
        rect(0, 10, 5, 40);
        rotate(radians(300));//前腕
        rect(-10, 10, 5, 20);
        rotate(radians(270));//前手
        rect(-30, -10, 5, 15);
        rotate(radians(220));//後腕
        rect(7, 5, 5, 20);
        rotate(radians(300));//後手
        rect(-17, 17, 5, 15);
        rotate(radians(60));//後足
        rect(43, 13, 5, 20);
        rotate(radians(350));//前膝
        rect(32, -3, 5, 17);
        rotate(radians(270));//前足
        rect(0, 33, 5, 25);
      }
    } else if (j==2) {//２回目ジャンプ
      jcount++;
      if (jcount<=12) {//一定時間ジャンプ
        djy=-10;
      } else if (jcount>10 && cy<=jjy-10) {
        djy=5;
      }
      if (djy>0 && cy==jjy-5) {
        djy=5; 
        j=0;
        jcount=0;
      }//リセット
      cy=cy+djy;
      if (coolUI%2==0) {
        ellipse(cx, cy, 20, 20);
        translate(cx, cy);//胴体
        rotate(radians(10));
        rect(0, 10, 5, 40);
        rotate(radians(300));//前腕
        rect(-10, 10, 5, 20);
        rotate(radians(270));//前手
        rect(-30, -10, 5, 15);
        rotate(radians(220));//後腕
        rect(7, 5, 5, 20);
        rotate(radians(300));//後手
        rect(-17, 17, 5, 15);
        rotate(radians(60));//後足
        rect(43, 13, 5, 20);
        rotate(radians(350));//前膝
        rect(32, -3, 5, 17);
        rotate(radians(270));//前足
        rect(0, 33, 5, 25);
      }
    } else if (j==3) {//敵踏み付けジャンプ
      jcount++;
      if (jcount<=12) {//一定時間ジャンプ
        djy=-10;
      } else if (jcount>10 && cy<=jjy-10) {
        djy=5;
      }
      if (djy>0 && cy==jjy-5) {
        djy=5; 
        j=0;
        jcount=0;
      }//リセット
      cy=cy+djy;
      if (coolUI%2==0) {
        ellipse(cx, cy, 20, 20);
        translate(cx, cy);//胴体
        rotate(radians(10));
        rect(0, 10, 5, 40);
        rotate(radians(300));//前腕
        rect(-10, 10, 5, 20);
        rotate(radians(270));//前手
        rect(-30, -10, 5, 15);
        rotate(radians(220));//後腕
        rect(7, 5, 5, 20);
        rotate(radians(300));//後手
        rect(-17, 17, 5, 15);
        rotate(radians(60));//後足
        rect(43, 13, 5, 20);
        rotate(radians(350));//前膝
        rect(32, -3, 5, 17);
        rotate(radians(270));//前足
        rect(0, 33, 5, 25);
      }
    } else if (j==4) {//降りるとき
      if (cy<=jjy-10) {
        djy=5;
      }
      if (cy==jjy-5) {
        djy=5; 
        j=0;
        jcount=0;
      }//リセット
      cy=cy+djy;
      if (coolUI%2==0) {
        ellipse(cx, cy, 20, 20);
        translate(cx, cy);//胴体
        rotate(radians(10));
        rect(0, 10, 5, 40);
        rotate(radians(300));//前腕
        rect(-10, 10, 5, 20);
        rotate(radians(270));//前手
        rect(-30, -10, 5, 15);
        rotate(radians(220));//後腕
        rect(7, 5, 5, 20);
        rotate(radians(300));//後手
        rect(-17, 17, 5, 15);
        rotate(radians(60));//後足
        rect(43, 13, 5, 20);
        rotate(radians(350));//前膝
        rect(32, -3, 5, 17);
        rotate(radians(270));//前足
        rect(0, 33, 5, 25);
      }
    } else if (j==5) {//3回目ジャンプ
      jcount++;
      if (jcount<=12) {//一定時間ジャンプ
        djy=-10;
      } else if (jcount>10 && cy<=jjy-10) {
        djy=5;
      }
      if (djy>0 && cy==jjy-5) {
        djy=5; 
        j=0;
        jcount=0;
      }//リセット
      cy=cy+djy;
      if (coolUI%2==0) {
        ellipse(cx, cy, 20, 20);
        translate(cx, cy);//胴体
        rotate(radians(10));
        rect(0, 10, 5, 40);
        rotate(radians(300));//前腕
        rect(-10, 10, 5, 20);
        rotate(radians(270));//前手
        rect(-30, -10, 5, 15);
        rotate(radians(220));//後腕
        rect(7, 5, 5, 20);
        rotate(radians(300));//後手
        rect(-17, 17, 5, 15);
        rotate(radians(60));//後足
        rect(43, 13, 5, 20);
        rotate(radians(350));//前膝
        rect(32, -3, 5, 17);
        rotate(radians(270));//前足
        rect(0, 33, 5, 25);
      }
    } else if (j==6) {//赤の4回目ジャンプ
      jcount++;
      if (jcount<=12) {//一定時間ジャンプ
        djy=-10;
      } else if (jcount>10 && cy<=jjy-10) {
        djy=5;
      }
      if (djy>0 && cy==jjy-5) {
        djy=5; 
        j=0;
        jcount=0;
      }//リセット
      cy=cy+djy;
      if (coolUI%2==0) {
        ellipse(cx, cy, 20, 20);
        translate(cx, cy);//胴体
        rotate(radians(10));
        rect(0, 10, 5, 40);
        rotate(radians(300));//前腕
        rect(-10, 10, 5, 20);
        rotate(radians(270));//前手
        rect(-30, -10, 5, 15);
        rotate(radians(220));//後腕
        rect(7, 5, 5, 20);
        rotate(radians(300));//後手
        rect(-17, 17, 5, 15);
        rotate(radians(60));//後足
        rect(43, 13, 5, 20);
        rotate(radians(350));//前膝
        rect(32, -3, 5, 17);
        rotate(radians(270));//前足
        rect(0, 33, 5, 25);
      }
    } else if (j==7) {//バネ踏み付けジャンプ
      jcount++;
      if (jcount<=20) {//一定時間ジャンプ
        djy=-20;
      } else if (jcount>10 && cy<=jjy-10) {
        djy=5;
      }
      if (djy>0 && cy==jjy-5) {
        djy=5; 
        j=0;
        jcount=0;
      }//リセット
      cy=cy+djy;
      if (coolUI%2==0) {
        ellipse(cx, cy, 20, 20);
        translate(cx, cy);//胴体
        rotate(radians(10));
        rect(0, 10, 5, 40);
        rotate(radians(300));//前腕
        rect(-10, 10, 5, 20);
        rotate(radians(270));//前手
        rect(-30, -10, 5, 15);
        rotate(radians(220));//後腕
        rect(7, 5, 5, 20);
        rotate(radians(300));//後手
        rect(-17, 17, 5, 15);
        rotate(radians(60));//後足
        rect(43, 13, 5, 20);
        rotate(radians(350));//前膝
        rect(32, -3, 5, 17);
        rotate(radians(270));//前足
        rect(0, 33, 5, 25);
      }
    } else if (run==0 && j==0) {
      if (coolUI%2==0) {
        ellipse(cx, cy, 20, 20);
        translate(cx, cy);//胴体
        rotate(radians(10));
        rect(0, 10, 5, 40);
        rotate(radians(300));//前腕
        rect(-10, 10, 5, 20);
        rotate(radians(270));//前手
        rect(-30, -10, 5, 15);
        rotate(radians(220));//後腕
        rect(7, 5, 5, 20);
        rotate(radians(300));//後手
        rect(-17, 17, 5, 15);
        rotate(radians(60));//後足
        rect(43, 13, 5, 20);
        rotate(radians(350));//前膝
        rect(32, -3, 5, 17);
        rotate(radians(270));//前足
        rect(0, 33, 5, 25);
      }
    } else if (run==1 && j==0) {
      if (coolUI%2==0) {
        ellipse(cx, cy, 20, 20);
        translate(cx, cy);//胴体
        rotate(radians(10));
        rect(0, 10, 5, 40);
        rotate(radians(310));//前腕
        rect(-10, 10, 5, 20);
        rotate(radians(250));//前手
        rect(-27, -20, 5, 15);
        rotate(radians(200));//後腕
        rect(7, 5, 5, 20);
        rotate(radians(300));//後手
        rect(-17, 17, 5, 15);
        rotate(radians(70));//後足
        rect(35, 25, 5, 20);
        rotate(radians(250));//前膝
        rect(-28, 20, 5, 17);
        rotate(radians(210));//前足
        rect(2, -65, 5, 25);
      }
    } else if (run==2 && j==0) {
      if (coolUI%2==0) {
        ellipse(cx, cy, 20, 20);
        translate(cx, cy);//胴体
        rotate(radians(10));
        rect(0, 10, 5, 25);
        rotate(radians(340));//前腕
        rect(-3, 12, 5, 20);
        rotate(radians(230));//前手
        rect(-26, -20, 5, 15);
        rotate(radians(110));//前膝
        rect(-22, 25, 5, 17);
        rotate(radians(200));//前足
        rect(2, -65, 5, 20);
        rotate(radians(290));//後膝
        rect(32, -20, 5, 17);
        rotate(radians(310));//後足
        rect(35, 15, 5, 25);
      }
    }
    popMatrix();//座標を戻す

    if (j==0) {
      jumpc=0;
      jumpp=0;
      jump2c=0;
      jump2p=0;

      if (landp==1) {//着地煙
        landx=cx;
        landy=cy;
        landp=2;
      }
      landc++;
      if (landc<50) {
        noStroke();
        fill(255, 255, 255, 245-landc*5);
        ellipse(landx, ((landy+65)-20/2)-(landc/4), 20, 20);
        ellipse(landx, ((landy+45)+20/2)+(landc/4), 20, 20);
        ellipse(landx, ((landy+65)-20/2)-(landc/8), 20, 20);
        ellipse(landx, ((landy+45)+20/2)+(landc/8), 20, 20);
        ellipse(((landx-3)-20/2)-(landc/8), landy+55, 20, 20);
        ellipse(((landx+3)+20/2)+(landc/8), landy+55, 20, 20);
        ellipse(((landx-3)-20/2)-(landc/4), landy+55, 20, 20);
        ellipse(((landx+3)+20/2)+(landc/4), landy+55, 20, 20);
        ellipse(((landx-3)-20/2)-(landc/2), landy+55, 20, 20);
        ellipse(((landx+3)+20/2)+(landc/2), landy+55, 20, 20);
        stroke(5);
      }
      if (start==1) {
        landx+=dx;
      }

      dashc++;//ダッシュ煙
      noStroke();
      fill(255, 255, 255, 240-dashc*16);
      ellipse(cx-15, ((cy+65)-20/2)-(dashc), 20, 20);
      ellipse(cx-15, ((cy+45)+20/2)+(dashc), 20, 20);
      ellipse(((cx-18)-20/2)-(dashc), cy+55, 20, 20);
      ellipse(((cx-12)+20/2)+(dashc), cy+55, 20, 20);
      stroke(5);
      if (dashc>=15) {
        dashc=0;
      }
    }
    if (j==1) {//ジャンプ煙
      landp=1;
      landc=0;

      if (jumpp==0) {
        jumpx=cx;
        jumpy=cy+10;
        jumpp=1;
      }
      jumpc++;
      if (jumpc<50) {
        noStroke();
        fill(255, 255, 255, 245-jumpc*5);
        ellipse(jumpx, ((jumpy+65)-20/2)-(jumpc/4), 20, 20);
        ellipse(jumpx, ((jumpy+45)+20/2)+(jumpc/4), 20, 20);
        ellipse(jumpx, ((jumpy+65)-20/2)-(jumpc/8), 20, 20);
        ellipse(jumpx, ((jumpy+45)+20/2)+(jumpc/8), 20, 20);
        ellipse(((jumpx-3)-20/2)-(jumpc/8), jumpy+55, 20, 20);
        ellipse(((jumpx+3)+20/2)+(jumpc/8), jumpy+55, 20, 20);
        ellipse(((jumpx-3)-20/2)-(jumpc/4), jumpy+55, 20, 20);
        ellipse(((jumpx+3)+20/2)+(jumpc/4), jumpy+55, 20, 20);
        ellipse(((jumpx-3)-20/2)-(jumpc/2), jumpy+55, 20, 20);
        ellipse(((jumpx+3)+20/2)+(jumpc/2), jumpy+55, 20, 20);
        stroke(5);
      }
      if (start==1) {
        jumpx+=dx;
      }
    }

    if (j==2 || j==5 || j==6) {//空中ジャンプエフェクト
      if (jump2p==0) {
        jump2x=cx;
        jump2y=cy;
        jump2c=0;
        jump2p=1;
      }
      jump2c++;
      if (jump2c<40) {
        stroke(0, 0, 0, 245-jump2c*5);
        fill(255, 255, 255, 0);
        ellipse(jump2x, jump2y+55, 20+(jump2c*2), 10+(jump2c/4));
      }
      if (start==1) {
        jump2x+=dx;
      }
    }

    stroke(5);
    if (cy>=635 || cx<=-25) {//場外判定
      if (ok==1 && gskill==0) {
        gskill=1;
      } else {
        scene=4;
      }
    }
    if (gskill==1) {//緑一回だけ復活
      gcount++;
      j=0;
      cy=60;//緑だけ復活)
      jjy=60;
      cx=180;
      fill(0, 255, 0);//UI
      if (gUI>0) {
        gUI-=2*a;
      }
      gUIy=130;
      rect(160, gUIy, gUI, 5);
      if (gcount>=200) {
        j=4;
        gskill=2;
        gUIy=-100;
      }
    }

    if (gability==1) {//緑アビリティ
      F-=30;
      gability=2;
    }
    if (gability==2) {
      gabilityc++;
      fill(0, 255, 0);//UI
      if (gUI2>0) {
        gUI2-=a;
      }
      gUI2y=cy-20;
      rect(cx-25, gUI2y, gUI2, 5);
      if (gabilityc>=500) {
        F+=30;
        gabilityc=0;
        gability=0;
        gUI2y=-100;
        gUI2=50.0;
      }
    }

    stroke(255, 120, 0);
    fill(0, 255, 255);
    rect(bx, by, 80, 40);
    if (bability==1) {//青アビリティ
      by=cy+10;
      bx=cx;
      bability=2;
    }
    if (bability==2) {

      bx=bx+dbx;//ビーム発射
      if (bx>=800) {
        bability=3;
      }
    }
    if (bability==3) {//ビーム消滅
      by=-100;
      bx=180;
      bability=0;
    }

    if (bability==2) {//ビームエフェクト
      if (beamp==0) {
        beamx=bx+20;
        beamy=by+20;
        beamp=1;
        beamc=0;
      }
    }
    beamc++;
    if (beamc<40) {
      stroke(255, 120, 0, 245-beamc*5);
      fill(255, 255, 255, 0);
      ellipse(beamx, beamy, (beamc/2), (beamc*4));
    }

    stroke(5);
    if (rability==1) {//赤アビリティ
      rabilityc++;
      fill(255, 0, 0);//UI
      if (rUI>0) {
        rUI-=2*a;
      }
      rUIy=cy-20;
      rect(cx-25, rUIy, rUI, 5);
      if (rabilityc>=250) {
        rabilityc=0;
        rability=2;
        rUIy=-100;
        rUI=50.0;
      }
    }
    if (rability==2) {//赤クールタイム
      rabilityc++;
      if (rabilityc%2==0) {
        coolUI++;
      }
      if (rabilityc>=700) {
        rabilityc=0;
        rability=0;
        coolUI=0;
      }
    }

    if (yability==1) {//黄アビリティ
      yabilityc++;
      fill(255, 255, 0);//UI
      if (yUI>0) {
        yUI-=a;
      }
      yUIy=cy-20;
      rect(cx-25, yUIy, yUI, 5);
      if (yabilityc>=500) {
        yabilityc=0;
        yability=0;
        yUIy=-100;
        yUI=50.0;
      }
    }

    if (coinboost==1) {//スコア2倍
      boostcount++;
      if (boostcount>=750) {
        coinboost=0;
        boostcount=0;
      }
    }

    //UI
    fill(245, 245, 245);
    rect(0, 0, 800, 50);
    fill(0, 0, 0);
    textSize(30);
    text("アビリティ", 5, 37);
    if (coinboost==1) {
      fill(199, 21, 133);
    }//スコア2倍だと光る
    if (getcoin==1) {
      fill(255, 255, 0);
    }//コイン取ると光る
    if (win==1) {
      fill(0, 0, 255);
    }//敵倒すと光る
    textSize(30);
    text(scorescore+"point", 310, 37);
    fill(0, 0, 0);
    text("LEVEL"+(s5000), 650, 37);
    if (start==0) {
      text("TABキーでスタート", 50, 400);
    }
    if (ok==1) {
      fill(0, 255, 0);
      rect(160, 5, a1, 10);
      rect(160, 20, a2, 10);
      rect(160, 35, a3, 10);
      if (ability==1 && a1>0) {
        a1-=a;
      }//ゲージが少しずつ減る
      if (ability==2 && a2>0) {
        a2-=a;
      }
      if (ability==3 && a3>0) {
        a3-=a;
      }
    }
    if (ok==2) {
      fill(0, 0, 255);
      if (ability<=14) {
        rect(160, 43, 15, 5);
      }
      if (ability<=13) {
        rect(160, 33, 15, 5);
      }
      if (ability<=12) {
        rect(160, 23, 15, 5);
      }
      if (ability<=11) {
        rect(160, 13, 15, 5);
      }
      if (ability<=10) {
        rect(160, 3, 15, 5);
      }
      if (ability<=9) {
        rect(180, 43, 15, 5);
      }
      if (ability<=8) {
        rect(180, 33, 15, 5);
      }
      if (ability<=7) {
        rect(180, 23, 15, 5);
      }
      if (ability<=6) {
        rect(180, 13, 15, 5);
      }
      if (ability<=5) {
        rect(180, 3, 15, 5);
      }
      if (ability<=4) {
        rect(200, 43, 15, 5);
      }
      if (ability<=3) {
        rect(200, 33, 15, 5);
      }
      if (ability<=2) {
        rect(200, 23, 15, 5);
      }
      if (ability<=1) {
        rect(200, 13, 15, 5);
      }
      if (ability==0) {
        rect(200, 3, 15, 5);
      }
    }
    if (ok==3) {
      fill(255, 0, 0);
      rect(160, 5, a4, 10);
      rect(160, 20, a5, 10);
      rect(160, 35, a6, 10);
      if (ability==1 && a4>0) {
        a4-=2*a;
      }//ゲージが少しずつ減る
      if (ability==2 && a5>0) {
        a5-=2*a;
      }
      if (ability==3 && a6>0) {
        a6-=2*a;
      }
    }
    if (ok==4) {
      fill(255, 255, 0);
      rect(160, 5, a1, 10);
      rect(160, 20, a2, 10);
      rect(160, 35, a3, 10);
      if (ability==1 && a1>0) {
        a1-=a;
      }//ゲージが少しずつ減る
      if (ability==2 && a2>0) {
        a2-=a;
      }
      if (ability==3 && a3>0) {
        a3-=a;
      }
    }
  }


  //待機時間
  if (scene==4) {
    F=80;
    if (scorescore<=9999) {//ランク付け
      rank=0;
    } else if (scorescore<=19999) {
      rank=1;
    } else if (scorescore<=29999) {
      rank=2;
    } else if (scorescore<=49999) {
      rank=3;
    } else if (scorescore<=69999) {
      rank=4;
    } else if (scorescore<=99999) {
      rank=5;
    } else if (scorescore<=199999) {
      rank=6;
    } else {
      rank=7;
    }

    waitgcount++;
    if (waitgcount>=150) {
      scene=5;
      waitgcount=0;
    }
  }

  //結果画面
  if (scene==5) {
    background(255);
    okcolor();
    score();
    ranking();
    result();
    button2();

    if (waitc==1) {
      waitccount++;
      if (waitccount>=25) {
        scene=0;//スタート画面へ
        textx=-100;
        texty=-100;
        field.setBounds(textx, texty, textw, texth);

        lineData1 = loadStrings( filename1 );
        countcount=0;
        for ( int i = 0; i < lineData1.length; i++ ) {
          countcount++;
        }



        frameRate(80);//80
        ok=0;
        wait=0;
        waitp=0;
        waitn=0;
        waitm=0;
        waitc=0;
        waitcount=0;
        waitpcount=0;
        waitncount=0;
        waitmcount=0;
        waitccount=0;
        waitgcount=0;
        r1x=900;
        r1y=900;
        r2x=900;
        r2y=900;
        r3x=900;
        r3y=900;
        r4x=900;
        r4y=900;
        KR=200;
        KG=200;
        KB=200;
        keyK=0;
        count=0;
        run=0;
        j=0;
        djy=0;
        jcount=0;
        wx=800;
        cx=180;
        dx=-5;
        cy=435;
        jjy=435;
        w=0;
        osare=0;
        y2=0;
        dy2=-1;
        yy=0;
        sx2=0;
        sx3=0;
        sy2=0;
        sy3=0;

        for (int i=0; i<150; i++) {
          enemies.set(i, i);
        }
        for (int i=0; i<750; i++) {
          coins.set(i, i);
        }
        s=0;
        for (int i=0; i<100; i++) {
          enemies3.set(i, 1000);
        }
        for (int i=0; i<100; i++) {
          splinters.set(i, i);
        }
        shield=2;
        cool=0;
        coolstart=0;
        s1=0;
        s2=5000;
        s3=5000;
        s4=5000;
        s5=5000;
        s6=5000;
        s7=5000;
        s8=5000;
        s9=5000;
        s10=5000;
        s11=5000;
        s12=5000;
        s13=5000;
        gcount=0;
        gskill=0;
        gability=0;
        gabilityc=0;
        F=80;//80
        bx=180;
        by=-100;
        dbx=20;
        bability=0;
        rability=0;
        rabilityc=0;
        yability=0;
        yabilityc=0;
        for (int i=0; i<750; i++) {
          coinsX.set(i, i);
        }
        ability=0;
        a1=50.0;
        a2=50.0;
        a3=50.0;
        a4=50.0;
        a5=50.0;
        a6=50.0;
        a=0.1;
        scorescore=0;
        getcoin=0;
        win=0;
        stage[0]=1;//初期ステージは固定
        for (int i=1; i<13; i++) {//i<ステージ数
          stage[i]=0;
        }
        r=0;
        cr=0;
        r2=0;
        st=1;
        s5000=0;
        speedUI=0;
        speedUIc=0;
        gUI=40.0;
        gUI2=50.0;
        rUI=50.0;
        yUI=50.0;
        gUIy=-100;
        gUI2y=-100;
        rUIy=-100;
        yUIy=-100;
        kumoX=200;
        kumo2X=700;
        start=0;
        my2=0;
        dmy2=-5;
        mymy=0;
        for (int i=1; i<100; i++) {
          enemies5[i]=550;
        }
        allow=0;
        for (int i=1; i<16; i++) {//i<ステージ数
          stacoin[i]=0;
        }
        coinboost=0;
        boostcount=0;
        for (int i=0; i<150; i++) {
          broken[i]=0;
        }
        for (int i=0; i<750; i++) {
          got[i]=0;
        }
        for (int i=0; i<150; i++) {
          which[i]=0;
        }
        for (int i=0; i<750; i++) {
          whichc[i]=0;
        }
        dashc=0;
        jumpc=0;
        jump2c=0;
        jumpp=0;
        jump2p=0;
        landc=0;
        landp=0;
        jumpx=0;
        jumpy=0;
        jump2x=0;
        jump2y=0;
        landx=0;
        landy=0;
        rank=0;
        beamc=0;
        beamp=0;
        beamx=0;
        beamy=0;
      }
    }
  }
}

void dan(int x, int y, int w) {//段の関数
  fill(244, 164, 96);//床
  rect(wx+x, y, w, 600-y);
  fill(0, 128, 0);//草
  rect(wx+x, y, w, 20);
  if (allow!=1) {
    if (gskill!=1) {//復活中の緑を判定が邪魔しないように
      if (cx+20==wx+x && cy>=435-(500-y)) {//段にぶつかると押される
        cx=wx+x-25;
        osare=1;
      }
      if (cx+25>wx+x && cx-40<=wx+x+w && cy<=435-(500-y)) {//段に乗る
        jjy=435-(500-y);
      }
      if (cx-40>=wx+x+w && cx-45<=wx+x+w && j==0) {//40→崖ギリギリジャンプを考慮する
        j=4;//降りる
      }
    }
  }
}

void dandan(int x, int y, int w) {//次の方が高い連続段の関数
  fill(244, 164, 96);//床
  rect(wx+x, y, w, 600-y);
  fill(0, 128, 0);//草
  rect(wx+x, y, w, 20);
  if (gskill!=1) {//復活中の緑を判定が邪魔しないように
    if (cx+20==wx+x && cy>=435-(500-y)) {//段にぶつかると押される
      cx=wx+x-25;
      osare=1;
    }
    if (cx+25>wx+x && cx-25<=wx+x+w && cy<=435-(500-y)) {//段に乗る
      jjy=435-(500-y);
    }
  }
}

void ana(int x, int y, int w) {//落とし穴の関数
  noStroke();
  fill(173, 216, 230);
  rect(wx+x, y, w, 600-y);
  stroke(5);
  if (allow!=1) {
    if (gskill!=1) {//復活中の緑を判定が邪魔しないように
      if (cx+20==wx+x+w && cy>=535-(600-y)) {//落とし穴にぶつかると押される
        cx=wx+x+w-25;
        osare=1;
      }
      if (cx-25>wx+x && cx+25<=wx+x+w) {//落とし穴に落ちる
        jjy=900;
        if (j==0) {
          j=4;
        }
      }
    }
  }
}

void enemy1(int x, int y, int w, int n) {//敵1(普通)の関数
  if (cy<=y-60-w && cy>=y-65-w && cx+25>=wx+x-w && cx-25<wx+x+w && enemies.get(n)==n) {//踏むと自動ジャンプ
    jcount=0;
    j=3;//踏むと自動ジャンプ
    enemies.set(n, 0);//敵番号と同じ配列番号に0をセットする
    broken[n]=wx+x;//倒した位置を保存
    which[n]=0;
    win=1;
    scorescore+=50;
    if (coinboost==1) {
      scorescore+=50;
      which[n]=1;
    }
  }
  if (bx<=wx+x+w && bx+80>=wx+x-w && by<=y+w && by+40>=y-w && enemies.get(n)==n) {//ビームに当たると消える
    enemies.set(n, 0);//敵番号と同じ配列番号に0をセットする
    broken[n]=wx+x;//倒した位置を保存
    which[n]=1;
    bability=3;
    win=1;
    scorescore+=100;
    if (coinboost==1) {
      scorescore+=100;
      which[n]=2;
    }
  }
  if (enemies.get(n)==n) {//踏まれるまで描画
    /*
    fill(255, 128, 128);
     ellipse(wx+x, y, w*2, w*2);*/
    image(img2, wx+x-(w*8/2), y-(w*4/2), w*8, w*4);//8,4
  }
  if (broken[n]!=0) {//倒されたエフェクト
    noStroke();
    fill(154, 205, 50, 240-(broken[n]-(wx+x))*3);
    ellipse(wx+x, (y-w/2)-((broken[n]-(wx+x))/4), w, w);
    ellipse(wx+x, (y+w/2)+((broken[n]-(wx+x))/4), w, w);
    ellipse(((wx+x)-w/2)-((broken[n]-(wx+x))/4), y, w, w);
    ellipse(((wx+x)+w/2)+((broken[n]-(wx+x))/4), y, w, w);
    stroke(5);
    if (which[n]==0) {
      textSize(25);
      fill(178, 34, 34, 240-(broken[n]-(wx+x)));
      text("+50", wx+x-23, y+5);
    }
    if (which[n]==1) {
      textSize(25);
      fill(178, 34, 34, 240-(broken[n]-(wx+x)));
      text("+100", wx+x-27, y+5);
    }
    if (which[n]==2) {
      textSize(25);
      fill(178, 34, 34, 240-(broken[n]-(wx+x)));
      text("+200", wx+x-27, y+5);
    }
  }
  if (cy>y-60-w && cy<y+10+w && cx>=wx+x-w && cx<wx+x+w && enemies.get(n)==n) {//横から当たると終了
    if (ok==1 && gskill==0) {
      gskill=1;
    } else if (ok==2 && shield>=1 && cool==0) {
      shield-=1;//シールド退化
      coolstart=1;//クールタイムカウント開始
    } else if (cool!=0) {
    } else {
      scene=4;
    }
  }
}

void coin(int x, int y, int w, int n) {//コインの関数
  if (yability==1 && wx+x+w>=0 && wx+x-w<=800) {//黄アビリティ
    coinsX.set(n, 0);
  }
  if (coinsX.get(n)==0) {
    y=cy+20;
  }
  if (cy>=y-80 && cy<=y+30 && cx+25>=wx+x-w && cx-25<=wx+x+w && coins.get(n)==n) {//コインを取る
    getcoin=1;
    got[n]=wx+x;//取った位置を保存
    if (ok==4 && yability==1) {
      scorescore+=75;
      whichc[n]=2;
    } else if (ok==4) {
      scorescore+=60;
      whichc[n]=1;
    } else {
      scorescore+=50;
      whichc[n]=0;
    }
    if (coinboost==1) { 
      if (ok==4 && yability==1) {
        scorescore+=75;
        whichc[n]=5;
      } else if (ok==4) {
        scorescore+=60;
        whichc[n]=4;
      } else {
        scorescore+=50;
        whichc[n]=3;
      }
    }
    coins.set(n, 0);//コイン番号を配列に追加
  }
  if (coins.get(n)==n) {//取られるまで描画
    fill(255, 255, 0);
    ellipse(wx+x, y, w*2, w*2);
    fill(173, 216, 230);
    ellipse(wx+x, y, w+5, w+5);
  }
  if (got[n]!=0) {//取られたエフェクト
    noStroke();
    fill(255, 255, 0, 240-(got[n]-(wx+x))*3);
    ellipse(wx+x, (y-w/2)-((got[n]-(wx+x))/4), w, w);
    ellipse(wx+x, (y+w/2)+((got[n]-(wx+x))/4), w, w);
    ellipse(((wx+x)-w/2)-((got[n]-(wx+x))/4), y, w, w);
    ellipse(((wx+x)+w/2)+((got[n]-(wx+x))/4), y, w, w);
    stroke(5);
    if (whichc[n]==0) {
      textSize(25);
      fill(255, 69, 0, 240-(got[n]-(wx+x)));
      text("+50", wx+x-23, y+5);
    }
    if (whichc[n]==1) {
      textSize(25);
      fill(255, 69, 0, 240-(got[n]-(wx+x)));
      text("+60", wx+x-23, y+5);
    }
    if (whichc[n]==2) {
      textSize(25);
      fill(255, 69, 0, 240-(got[n]-(wx+x)));
      text("+75", wx+x-23, y+5);
    }
    if (whichc[n]==3) {
      textSize(25);
      fill(255, 69, 0, 240-(got[n]-(wx+x)));
      text("+100", wx+x-27, y+5);
    }
    if (whichc[n]==4) {
      textSize(25);
      fill(255, 69, 0, 240-(got[n]-(wx+x)));
      text("+120", wx+x-27, y+5);
    }
    if (whichc[n]==5) {
      textSize(25);
      fill(255, 69, 0, 240-(got[n]-(wx+x)));
      text("+150", wx+x-27, y+5);
    }
  }
}

void skyfloor(int x, int y, int w) {//空中床の関数
  allow=0;
  fill(200, 200, 200);
  rect(wx+x, y, w, 40);//30から40に変えた
  if (gskill!=1) {//復活中の緑を判定が邪魔しないように
    if (cx+25>wx+x && cx-30<=wx+x+w && cy<=435-(500-y)) {//空中床に乗る
      jjy=435-(500-y);
      allow=1;//穴と同じx座標にあっても落ちないようにする
    }
    if (cx-30>=wx+x+w && cx-35<=wx+x+w && cy<=435-(500-y) && j==0) {//30→崖ギリギリジャンプを考慮する
      j=4;//降りる
    }
  }
}

void enemy2(int x, int y, int w, int n) {//敵2(棘)の関数
  if (cy<=y-60-w && cy>=y-65-w && cx+25>=wx+x-w && cx-25<wx+x+w && enemies.get(n)==n) {//踏むと自動ジャンプ
    broken[n]=wx+x;//倒した位置を保存
    which[n]=0;
    win=1;
    scorescore+=50;
    if (coinboost==1) {
      scorescore+=50;
      which[n]=1;
    }
    if (ok==2 && shield>=1 && cool==0) {
      jcount=0;
      j=3;//踏むと自動ジャンプ
      enemies.set(n, 0);//敵番号と同じ配列番号に0をセットする

      shield-=1;//シールド退化
      coolstart=1;//クールタイムカウント開始
    } else if (cool!=0) {
      jcount=0;
      j=3;//踏むと自動ジャンプ
      enemies.set(n, 0);//敵番号と同じ配列番号に0をセットする
    }
  }
  if (bx<=wx+x+w && bx+80>=wx+x-w && by<=y+w && by+40>=y-w && enemies.get(n)==n) {//ビームに当たると消える
    enemies.set(n, 0);//敵番号と同じ配列番号に0をセットする
    broken[n]=wx+x;//倒した位置を保存
    which[n]=1;
    win=1;
    scorescore+=100;
    if (coinboost==1) {
      scorescore+=100;
      which[n]=2;
    }
    bability=3;
  }
  if (enemies.get(n)==n) {//踏まれるまで描画
    /*
    fill(255, 0, 0);
     ellipse(wx+x, y, w*2, w*2);*/
    image(img3, wx+x-(w*8/2), y-(w*4/2), w*8, w*4);//8,4
  }
  if (broken[n]!=0) {//倒されたエフェクト
    noStroke();
    fill(148, 0, 211, 240-(broken[n]-(wx+x))*3);
    ellipse(wx+x, (y-w/2)-((broken[n]-(wx+x))/4), w, w);
    ellipse(wx+x, (y+w/2)+((broken[n]-(wx+x))/4), w, w);
    ellipse(((wx+x)-w/2)-((broken[n]-(wx+x))/4), y, w, w);
    ellipse(((wx+x)+w/2)+((broken[n]-(wx+x))/4), y, w, w);
    stroke(5);
    if (which[n]==0) {
      textSize(25);
      fill(178, 34, 34, 240-(broken[n]-(wx+x)));
      text("+50", wx+x-23, y+5);
    }
    if (which[n]==1) {
      textSize(25);
      fill(178, 34, 34, 240-(broken[n]-(wx+x)));
      text("+100", wx+x-27, y+5);
    }
    if (which[n]==2) {
      textSize(25);
      fill(178, 34, 34, 240-(broken[n]-(wx+x)));
      text("+200", wx+x-27, y+5);
    }
  }

  if (cy>y-60-w && cy<y+10+w && cx>=wx+x-w && cx<wx+x+w && enemies.get(n)==n) {//横から当たると終了
    if (ok==1 && gskill==0) {
      gskill=1;
    } else if (ok==2 && shield>=1 && cool==0) {
      shield-=1;//シールド退化
      coolstart=1;//クールタイムカウント開始
    } else if (cool!=0) {
    } else {
      scene=4;
    }
  }
}

void enemy3(int x, int y, int w, int n) {//敵3(飛んでくる系)の関数
  if (wx+x<=800+w) {
    enemies3.set(n, enemies3.get(n)-8);
  }
  /*
  fill(255, 255, 255);
   ellipse(enemies3.get(n), y, w*2, w*2);*/
  //image(img,enemies3.get(n)-(w*6/2),y-(w*4/2),w*6,w*4);
  image(img, enemies3.get(n)-(w*6/2), y-(w*4/2), w*7, w*4);
  if (cy>y-60-w && cy<y+/*10+*/w && cx>=enemies3.get(n)-w && cx<enemies3.get(n)+w) {//当たると終了
    if (ok==1 && gskill==0) {
      gskill=1;
    } else if (ok==2 && shield>=1 && cool==0) {
      shield-=1;//シールド退化
      coolstart=1;//クールタイムカウント開始
    } else if (cool!=0) {
    } else {
      scene=4;
    }
  }
}

void enemy4(int x, int y, int w, int n) {//敵4(空中移動系)の関数
  yy++;//段が動く
  if (yy%4==0) {
    y2+=dy2;
  }
  if (abs(y2)>=100) {
    dy2=-dy2;
    y2+=dy2;
  }
  if (cy<=y+y2-55-w && cy>=y+y2-65-w && cx+25>=wx+x-w && cx-25<wx+x+w && enemies.get(n)==n) {//踏むと自動ジャンプ
    for (int i=55; i<=65; i++) {
      if ((y+y2-i-w)%5==0) {
        cy=y+y2-i-w;//座標を5の倍数にする
      }
    }
    jcount=0;
    j=3;//踏むと自動ジャンプ
    win=1;
    broken[n]=wx+x;//倒した位置を保存
    which[n]=0;
    scorescore+=50;
    if (coinboost==1) {
      scorescore+=50;
      which[n]=1;
    }
    enemies.set(n, 0);//敵番号と同じ配列番号に0をセットする
  }
  if (bx<=wx+x+w && bx+80>=wx+x-w && by<=y+y2+w && by+40>=y+y2-w && enemies.get(n)==n) {//ビームに当たると消える
    enemies.set(n, 0);//敵番号と同じ配列番号に0をセットする
    broken[n]=wx+x;//倒した位置を保存
    which[n]=1;
    win=1;
    scorescore+=100;
    if (coinboost==1) {
      scorescore+=100;
      which[n]=2;
    }
    bability=3;
  }
  if (enemies.get(n)==n) {//踏まれるまで描画
    fill(0, 255, 0);
    ellipse(wx+x, y+y2, w*2, w*2);
  }
  if (broken[n]!=0) {//倒されたエフェクト
    noStroke();
    fill(220, 20, 60, 240-(broken[n]-(wx+x))*3);
    ellipse(wx+x, (y+y2-w/2)-((broken[n]-(wx+x))/4), w, w);
    ellipse(wx+x, (y+y2+w/2)+((broken[n]-(wx+x))/4), w, w);
    ellipse(((wx+x)-w/2)-((broken[n]-(wx+x))/4), y+y2, w, w);
    ellipse(((wx+x)+w/2)+((broken[n]-(wx+x))/4), y+y2, w, w);
    stroke(5);
    if (which[n]==0) {
      textSize(25);
      fill(178, 34, 34, 240-(broken[n]-(wx+x)));
      text("+50", wx+x-23, y+y2+5);
    }
    if (which[n]==1) {
      textSize(25);
      fill(178, 34, 34, 240-(broken[n]-(wx+x)));
      text("+100", wx+x-27, y+y2+5);
    }
    if (which[n]==2) {
      textSize(25);
      fill(178, 34, 34, 240-(broken[n]-(wx+x)));
      text("+200", wx+x-27, y+y2+5);
    }
  }
  if (cy>y+y2-60-w && cy<y+y2+10+w && cx>=wx+x-w && cx<wx+x+w && enemies.get(n)==n) {//横か下から当たると終了
    if (ok==1 && gskill==0) {
      gskill=1;
    } else if (ok==2 && shield>=1 && cool==0) {
      shield-=1;//シールド退化
      coolstart=1;//クールタイムカウント開始
    } else if (cool!=0) {
    } else {
      scene=4;
    }
  }
}

void splinter(int x, int y, int n, int h) {//生える刺の関数
  if (wx+x<=400) {
    splinters.set(n, 0);
  }
  if (splinters.get(n)==0) {//近づくと生える
    fill(100, 100, 100);
    triangle(wx+x, y-h, wx+x-20, y, wx+x+20, y);
  } else {
    fill(100, 100, 100); 
    triangle(wx+x, y+40-h, wx+x-20, y+40, wx+x+20, y+40);
  }
  if (cy>y-(h+60) && cy<y && cx>=wx+x-10 && cx<wx+x+10) {//当たると終了
    if (ok==1 && gskill==0) {
      gskill=1;
    } else if (ok==2 && shield>=1 && cool==0) {
      shield-=1;//シールド退化
      coolstart=1;//クールタイムカウント開始
    } else if (cool!=0) {
    } else {
      scene=4;
    }
  }
}

void movedan(int x, int y, int w) {//動く段バグあるかもないかも//すぐ地面が続く時は別の関数作る必要あり
  mymy++;//段が動く
  if (mymy%8==0) {//4
    my2+=dmy2;
  }
  if (abs(my2)>=100) {
    dmy2=-dmy2;
    my2+=dmy2;
  }
  fill(173, 216, 230);//地面消す
  rect(wx+x, 500, w, 100);
  fill(244, 164, 96);//床
  rect(wx+x, y+my2, w, 600);
  fill(0, 128, 0);//草
  rect(wx+x, y+my2, w, 20);
  if (gskill!=1) {//復活中の緑を判定が邪魔しないように
    if (cx+20==wx+x && cy>=435-(500-y)+my2) {//段にぶつかると押される
      cx=wx+x-25;
      osare=1;
    }

    if (cx+25>wx+x && cx-40<=wx+x+w && cy>435-(500-(y+my2))) {//動く段に埋まらないようにする
      cy=435-(500-(y+my2));
    }
    if (cx+25>wx+x && cx-40<=wx+x+w && cy<=435-(500-(y+my2)) && j!=0) {//段に乗る
      jjy=435-(500-(y+my2));
    }
    if (cx+25>wx+x && cx-40<=wx+x+w && cy>=jjy && djy>0 && dmy2<0) {//段に埋まらないようにする
      cy=jjy-5;
    }
    if (cx+25>wx+x && cx-40<=wx+x+w && cy<=435-(500-(y+my2)) && j==0) {//段に乗り続ける
      jjy=435-(500-(y+my2));
      cy=435-(500-(y+my2));
    }

    if (cx-40>=wx+x+w && cx-45<=wx+x+w && j==0) {//30→崖ギリギリジャンプを考慮する
      j=4;//降りる
    }
  }
}

void bane(int x, int y, int w) {//バネの関数
  fill(173, 255, 27);
  ellipse(wx+x, y, w*2, w*2);
  if (cy<=y-60-w && cy>=y-65-w && cx+25>=wx+x-w && cx-25<wx+x+w) {//踏むと自動ジャンプ
    jcount=0;
    j=7;//踏むと自動ジャンプ
  }
}

void ana2(int x, int y, int w) {//消える床の関数
  noStroke();
  fill(173, 216, 230);//実は穴
  rect(wx+x, y, w, 600-y);
  if (wx+x>cx+280) {//怪しい地面描く
    fill(222, 184, 135);
    rect(wx+x, y, w, 600-y);
    fill(0, 128, 0);
    rect(wx+x, y, w, (600-y)-80);
  }
  if (wx+x>=cx+25 && wx+x<=cx+280) {//徐々に透明になる
    fill(222, 184, 135, ((wx+x)/5-41)*17);
    //fill(222,184,135,(wx+x)-(cx+200));
    rect(wx+x, y, w, 600-y);
    fill(0, 128, 0, ((wx+x)/5-41)*17);
    //fill(0, 128, 0,(wx+x)-(cx+200));
    rect(wx+x, y, w, (600-y)-80);
  }
  stroke(5);
  if (gskill!=1) {//復活中の緑を判定が邪魔しないように
    if (cx+20==wx+x+w && cy>=535-(600-y)) {//落とし穴にぶつかると押される
      cx=wx+x+w-25;
      osare=1;
    }
    if (cx-25>wx+x && cx+25<=wx+x+w) {//落とし穴に落ちる
      jjy=900;
      if (j==0) {
        j=4;
      }
    }
  }
}

void enemy5(int x, int y, int n) {//敵5(下から飛んで帰る)の関数
  if (wx+x>280+(640-y)) {//セット
    enemies5[n]=640;
  }
  if (wx+x<=280+(640-y) && wx+x>280) {//上昇340
    enemies5[n]-=5;
  }
  if (wx+x<=150 && wx+x>150-(640-y)) {//下降
    enemies5[n]+=5;
  }

  fill(255, 125, 0);
  ellipse(wx+x, enemies5[n], 40, 40);
  if (cy>enemies5[n]-80 && cy<enemies5[n]+/*10+*/20 && cx>=wx+x-20 && cx<wx+x+20) {//当たると終了
    if (ok==1 && gskill==0) {
      gskill=1;
    } else if (ok==2 && shield>=1 && cool==0) {
      shield-=1;//シールド退化
      coolstart=1;//クールタイムカウント開始
    } else if (cool!=0) {
    } else {
      scene=4;
    }
  }
}

void splinter2(int x, int y, int n, int h) {//上から出るトゲの関数
  if (wx+x<=400) {
    splinters.set(n, 0);
  }
  if (splinters.get(n)==0) {//近づくと生える
    fill(100, 100, 100);
    triangle(wx+x, y+40+h, wx+x-20, y+40, wx+x+20, y+40);
  } else {
    fill(100, 100, 100); 
    triangle(wx+x, y+h, wx+x-20, y, wx+x+20, y);
  }
  if (cy>y-20 && cy<y+(h+20) && cx>=wx+x-10 && cx<wx+x+10) {//当たると終了
    if (ok==1 && gskill==0) {
      gskill=1;
    } else if (ok==2 && shield>=1 && cool==0) {
      shield-=1;//シールド退化
      coolstart=1;//クールタイムカウント開始
    } else if (cool!=0) {
    } else {
      scene=4;
    }
  }
}

void stagecoin(int x, int y, int w, int n, int s) {//スコアが一定時間2倍になるコイン
  if (cy>=y-80 && cy<=y+30 && cx+25>=wx+x-w && cx-25<=wx+x+w && coins.get(n)==n && stacoin[s]==1) {//コインを取る
    coinboost=1;
    coins.set(n, 0);//コイン番号を配列に追加
  }
  if (coins.get(n)==n && stacoin[s]==1) {//取られるまで描画
    fill(199, 21, 133);
    ellipse(wx+x, y, w*2, w*2);
    fill(173, 216, 230);
    ellipse(wx+x, y, w+10, w+10);
    textSize(30);
    fill(199, 21, 133);
    text("x2", wx+x+w-45, y+w-15);
  }
}





//ニックネーム
void nickname() {
  nickname=new String[countcount+1];
  if ( lineData1 != null ) {
    //nicknameファイルデータをnicknameに格納
    for ( int i = 0; i < lineData1.length; i++ ) {
      nickname[i]=lineData1[i];
    }
  }
  nickname[countcount]=field.getText();//テキストボックス内の文字列を保存
  if (nickname[countcount].length()>10) {//ニックネームが10文字を超えた場合警告メッセージを表示
    textSize(60);
    fill(255, 0, 0);
    text("10文字以下にしてください", 50, 230);
  }

  saveStrings( filename1, nickname);//nicknameファイルに保存
}

//キャラ
void okcolor() {
  lineData3 = loadStrings( filename5 );//キャラデータを読み込む
  okcolor=new int[countcount+1];
  okcolorstring=new String[countcount+1];
  if ( lineData1 != null ) {
    //キャラファイルデータをcolorに格納
    for ( int i = 0; i < lineData3.length; i++ ) {
      okcolor[i]=int(lineData3[i]);
    }
  }
  okcolor[countcount]=ok;//(int)random(500000);//ランダムにスコアを作成
  okcolorstring = str(okcolor);//スコアデータを文字列化
  saveStrings( filename5, okcolorstring);//scoreファイルに保存
}

//スコア
void score() {
  lineData2 = loadStrings( filename2 );//スコアデータを読み込む
  score=new int[countcount+1];
  scorestring=new String[countcount+1];
  if ( lineData1 != null ) {

    //scoreファイルデータをscoreに格納
    for ( int i = 0; i < lineData2.length; i++ ) {
      score[i]=int(lineData2[i]);
    }
  }
  score[countcount]=scorescore;//(int)random(500000);//ランダムにスコアを作成
  scorestring = str(score);//スコアデータを文字列化
  saveStrings( filename2, scorestring);//scoreファイルに保存
}

//ランキング
void ranking() { 
  lineData1 = loadStrings( filename1);//ニックネームデータを読み込む
  lineData2 = loadStrings( filename2 );//スコアデータを読み込む
  lineData3 = loadStrings( filename5 );//キャラデータを読み込む
  score2=new int[countcount+1];
  scorestring2=new String[countcount+1];
  nickname2=new String[countcount+1];
  okcolor2=new int[countcount+1];
  okcolorstring2=new String[countcount+1];
  if ( lineData2 != null ) {

    //scoreファイルデータをscore2に格納
    for ( int i = 0; i < lineData2.length; i++ ) {
      score2[i]=int(lineData2[i]);
    }
    //nicknameファイルデータをnickname2に格納
    for ( int i = 0; i < lineData1.length; i++ ) {
      nickname2[i]=lineData1[i];
    }
    //colorファイルデータをokcolor2に格納
    for ( int i = 0; i < lineData3.length; i++ ) {
      okcolor2[i]=int(lineData3[i]);
    }

    //ソート
    for (int j=0; j<countcount; j++) {
      for (int i=0; i<countcount; i++) {
        if (score2[i]<score2[i+1]) {
          //数値
          int tmp=score2[i+1];
          score2[i+1]=score2[i];
          score2[i]=tmp;

          //文字
          String tmp2=nickname2[i+1];
          nickname2[i+1]=nickname2[i];
          nickname2[i]=tmp2;

          int tmp3=okcolor2[i+1];
          okcolor2[i+1]=okcolor2[i];
          okcolor2[i]=tmp3;
        }
      }
    }
    for (int j=0; j<countcount; j++) {
      for (int i=j+1; i<countcount+1; i++) {
        if (score2[j]==score2[i]) {
          int tmp4=score2[j];
          score2[j]=score2[i];
          score2[i]=tmp4;

          String tmp5=nickname2[j];
          nickname2[j]=nickname2[i];
          nickname2[i]=tmp5;

          int tmp6=okcolor2[j];
          okcolor2[j]=okcolor2[i];
          okcolor2[i]=tmp6;
        }
      }
    }
  }
  scorestring2 = str(score2);//ソート済スコアデータを文字列化
  okcolorstring2= str(okcolor2);//ソート済キャラデータを文字列化
  saveStrings( filename3, nickname2);//ソート済ニックネームをranknickファイルに保存
  saveStrings( filename4, scorestring2);//ソート済スコアをrankscoreファイルに保存
  saveStrings( filename6, okcolorstring2);//ソート済キャラをrankcolorファイルに保存
}
//ボタン0
void button0() {
  //プレイボタン
  noFill();
  stroke(0);
  if (mouseX>=playx && mouseX<=playx+playw && mouseY>=playy && mouseY<=playy+playh) {
    rplay=0;
    gplay=0;
    bplay=0;
    fill(0, 255, 255);
    rect(playx, playy, playw, playh);
  } else {
    rplay=100;
    gplay=100;
    bplay=100;
  }
  rect(playx, playy, playw, playh);
  fill(rplay, gplay, bplay);
  textSize(50);
  text("プレイ", playx+75, playy+48);
  textSize(25);
  text("高得点を狙おう", playx+65, playy+70);

  //説明ボタン
  noFill();
  stroke(0);
  if (mouseX>=createx && mouseX<=createx+createw && mouseY>=createy && mouseY<=createy+createh) {
    rcreate=0;
    gcreate=0;
    bcreate=0;
    fill(0, 255, 255);
    rect(createx, createy, createw, createh);
  } else {
    rcreate=100;
    gcreate=100;
    bcreate=100;
  }
  rect(createx, createy, createw, createh);
  fill(rcreate, gcreate, bcreate);
  textSize(50);
  text("ルール説明", createx+30, createy+60);
}
//ボタン1
void button1() {
  //次へボタン
  noFill();
  stroke(0);
  if (mouseX>=tugix && mouseX<=tugix+tugiw && mouseY>=tugiy && mouseY<=tugiy+tugih) {
    if (nickname[countcount].length()<11) {//ニックネームが10文字以下の時のみ
      rtugi=0;
      gtugi=0;
      btugi=0;
      fill(0, 255, 255);
      rect(tugix, tugiy, tugiw, tugih);
    }
  } else {
    rtugi=100;
    gtugi=100;
    btugi=100;
  }
  rect(tugix, tugiy, tugiw, tugih);
  fill(rtugi, gtugi, btugi);
  textSize(50);
  text("次へ", tugix+25, tugiy+48);

  //戻るボタン
  noFill();
  stroke(0);
  if (mouseX>=modorux && mouseX<=modorux+modoruw && mouseY>=modoruy && mouseY<=modoruy+modoruh) {
    rmodoru=0;
    gmodoru=0;
    bmodoru=0;
    fill(0, 255, 255);
    rect(modorux, modoruy, modoruw, modoruh);
  } else {
    rmodoru=100;
    gmodoru=100;
    bmodoru=100;
  }
  rect(modorux, modoruy, modoruw, modoruh);
  fill(rmodoru, gmodoru, bmodoru);
  textSize(50);
  text("戻る", modorux+25, modoruy+48);
}
//ボタン2
void button2() {
  //コンティニューボタン
  noFill();
  stroke(0);
  if (mouseX>=conx && mouseX<=conx+conw && mouseY>=cony && mouseY<=cony+conh) {
    rcon=0;
    gcon=0;
    bcon=0;
    fill(0, 255, 255);
    rect(conx+2, cony+2, conw-4, conh-2);
    //field.setText("");
  } else {
    rcon=200;
    gcon=200;
    bcon=200;
  }
  textSize(30);
  fill(rcon, gcon, bcon);
  text("コンティニュー", 300, 515);
}
//リザルト画面
void result() {
  textSize(90);
  fill(0);
  text("Result", 270, 90);
  //プレイヤーの順位を求める
  for (i=0; i<countcount+1; i++) {
    if (nickname[countcount].equals(nickname2[i])&&score[countcount]==score2[i]) {
      n=i+1;
      break;
    }
  }
  //プレイヤーの順位を表示
  textSize(30);

  fill(0);
  text("ランク:", 300, 160);
  if (rank==0) {
    fill(0, 0, 0);
    text("E", 420, 160);
  }
  if (rank==1) {
    fill(65, 105, 225);
    text("D", 415, 161);
  }
  if (rank==2) {
    fill(50, 205, 50);
    text("C", 415, 161);
  }
  if (rank==3) {
    fill(238, 130, 238);
    text("B", 415, 161);
  }
  if (rank==4) {
    fill(178, 34, 34);
    text("A", 415, 161);
  }
  if (rank==5) {
    fill(255, 215, 0);
    text("S", 415, 161);
  }
  if (rank==6) {
    fill(255, 215, 0);
    text("SS", 415, 161);
  }
  if (rank==7) {
    fill(255, 215, 0);
    text("SSS", 415, 161);
  }

  fill(0);
  text(scorestring[countcount]+"point", 100, 160);
  text("第"+n+"位 / "+(countcount+1)+"人中", 500, 160);
  fill(255, 165, 0);
  if (n<11) {
    rect(45, 177+30*(n-1), 356, 30);
  } else if (n<21) {
    rect(399, 177+30*(n-10-1), 356, 30);
  }

  noFill();
  stroke(0);
  //内枠
  for (i=0; i<10; i++) {
    rect(47, 177+30*i, 35, 30);
    rect(82, 177+30*i, 30, 30);
    rect(112, 177+30*i, 220, 30);
    rect(332, 177+30*i, 67, 30);
  }
  for (i=10; i<20; i++) {
    rect(401, 177+30*(i-10), 35, 30);
    rect(436, 177+30*(i-10), 30, 30);
    rect(466, 177+30*(i-10), 220, 30);
    rect(686, 177+30*(i-10), 67, 30);
  }

  fill(0);
  //上外枠
  rect(45, 120, 753-43, 2);
  rect(45, 120, 2, 175-120);
  rect(753, 120, 2, 175-120);
  //コンティニュー枠
  rect(45, 477+55, 753-43, 2);
  rect(45, 477, 2, 175-120);
  rect(753, 477, 2, 175-120);
  //左中枠
  rect(45, 175, 356, 2);
  rect(45, 477, 356, 2);
  rect(399, 177, 2, 300);
  rect(45, 177, 2, 300);
  //右中枠
  rect(399, 175, 356, 2);
  rect(399, 477, 356, 2);
  rect(753, 177, 2, 300);


  fill(0);
  textSize(20);
  //ランキング表示
  //1～10位
  if (countcount+1<11) {
    for (i=0; i<countcount+1; i++) {
      if (okcolor2[i]==1) {
        fill(0, 255, 0);
      }
      if (okcolor2[i]==2) {
        fill(0, 0, 255);
      }
      if (okcolor2[i]==3) {
        fill(255, 0, 0);
      }
      if (okcolor2[i]==4) {
        fill(255, 255, 0);
      }
      rect(82, 177+30*i, 30, 30);
      fill(0);
      text(i+1, 57, 200+30*i);
      text("　"+"  "+nickname2[i], 87, 200+30*i);
      text(scorestring2[i], 337, 200+30*i);
    }
  } else {
    //1～10位
    for (i=0; i<10; i++) {
      if (okcolor2[i]==1) {
        fill(0, 255, 0);
      }
      if (okcolor2[i]==2) {
        fill(0, 0, 255);
      }
      if (okcolor2[i]==3) {
        fill(255, 0, 0);
      }
      if (okcolor2[i]==4) {
        fill(255, 255, 0);
      }
      rect(82, 177+30*i, 30, 30);
      fill(0);
      text(i+1, 57, 200+30*i);
      text("　"+"  "+nickname2[i], 87, 200+30*i);
      text(scorestring2[i], 337, 200+30*i);
    }
    //11～20位
    if (countcount+1<21) {
      for (i=10; i<countcount+1; i++) {
        if (okcolor2[i]==1) {
          fill(0, 255, 0);
        }
        if (okcolor2[i]==2) {
          fill(0, 0, 255);
        }
        if (okcolor2[i]==3) {
          fill(255, 0, 0);
        }
        if (okcolor2[i]==4) {
          fill(255, 255, 0);
        }
        rect(436, 177+30*(i-10), 30, 30);
        fill(0);
        text(i+1, 411, 200+30*(i-10));
        text("　"+"  "+nickname2[i], 441, 200+30*(i-10));
        text(scorestring2[i], 691, 200+30*(i-10));
      }
    } else {
      //11～20位
      for (i=10; i<20; i++) {
        if (okcolor2[i]==1) {
          fill(0, 255, 0);
        }
        if (okcolor2[i]==2) {
          fill(0, 0, 255);
        }
        if (okcolor2[i]==3) {
          fill(255, 0, 0);
        }
        if (okcolor2[i]==4) {
          fill(255, 255, 0);
        }
        rect(436, 177+30*(i-10), 30, 30);
        fill(0);
        text(i+1, 411, 200+30*(i-10));
        text("　"+"  "+nickname2[i], 441, 200+30*(i-10));
        text(scorestring2[i], 691, 200+30*(i-10));
      }
    }
  }
}




void mousePressed(MouseEvent e) {
  //プレイボタン
  if (mouseX>=playx && mouseX<=playx+playw && mouseY>=playy && mouseY<=playy+playh && scene==0) { 
    waitp=1;
  }
  //次へボタン
  if (mouseX>=tugix && mouseX<=tugix+tugiw && mouseY>=tugiy && mouseY<=tugiy+tugih && scene==1) { 
    if (nickname[countcount].length()<11) {//ニックネームが10文字以下の時のみ
      waitn=1;
    }
  }
  //戻るボタン
  if (mouseX>=modorux && mouseX<=modorux+modoruw && mouseY>=modoruy && mouseY<=modoruy+modoruh && scene==1) { 
    waitm=1;
  }
  //コンティニューボタン
  if (mouseX>=conx && mouseX<=conx+conw && mouseY>=cony && mouseY<=cony+conh && scene==5) { 
    waitc=1;
  }


  if (scene==2) {
    if (mouseX<=400 && mouseY>=100 && mouseY<=300) {
      KR=0; 
      KG=0; 
      KB=0; 
      keyK=1;
      r3x=0;
      r3y=100;
      r4x=397;
      r4y=299;
      ok=1;
    } else if (mouseX>400 && mouseY>=100 && mouseY<=300) {
      KR=0; 
      KG=0; 
      KB=0; 
      keyK=1;
      r3x=400;
      r3y=100;
      r4x=797;
      r4y=299;
      ok=2;
    } else if (mouseX<=400 && mouseY>300 && mouseY<500) {
      KR=0; 
      KG=0; 
      KB=0; 
      keyK=1;
      r3x=0;
      r3y=300;
      r4x=397;
      r4y=500;
      ok=3;
    } else if (mouseX>400 && mouseY>300 && mouseY<500) {
      KR=0; 
      KG=0; 
      KB=0; 
      keyK=1;
      r3x=400;
      r3y=300;
      r4x=797;
      r4y=500;
      ok=4;
    }

    if (ok!=0 && mouseY>=500) {
      wait=1;
    }
  }

  if (e.getButton()==LEFT) {
    if (scene==3 && j==2 && ok==3) {//赤の3段ジャンプ
      jcount=0;
      jump2p=0;
      j=5;
    }

    if (scene==3 && (j==1 || j==3 || j==4 || j==6 || j==7)) {//2段目以降のジャンプ
      jcount=0;
      jump2p=0;
      j=2;
    }

    if (scene==3 && j==0) {//１段目のジャンプ
      j=1;
    }

    if (scene==0 && j==1) {//2段目のジャンプ
      jcount=0;
      jump2p=0;
      j=2;
    }

    if (scene==0 && j==0) {//１段目のジャンプ
      j=1;
    }
  }

  if (e.getButton()==RIGHT) {
    if (scene==3 && ok==3 && rability==0 && ability<3 && start==1) {//赤のアビリティ
      rability=1;
      ability++;
    }
    if (scene==3 && ok==3 && rability==1) {
      jcount=0;
      jump2p=0;
      j=6;
    }
    if (scene==3 && ok==1 && gability==0 && ability<3 && start==1) {//緑のアビリティ
      gability=1;
      ability++;
    }
    if (scene==3 && ok==2 && bability==0 && ability<15 && start==1) {//青のアビリティ
      beamp=0;
      bability=1;
      ability++;
    }
    if (scene==3 && ok==4 && yability==0 && ability<3 && start==1) {//黄のアビリティ
      yability=1;
      ability++;
    }
  }
}

void keyPressed() {
  if (scene==3 && keyCode==TAB) {
    start=1;
  }
  if (keyCode==ENTER) {
    field.setText("");
  }
}
