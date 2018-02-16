import haxegon.*;

class Main
{
	//boy
	var x1 = 100;
	var y1 = 200;

	//girl
	var x2 = Gfx.screenheight;
	var y2 = 200;

	//flower
	var x3 = Gfx.screenwidthmid;
	var y3 = Gfx.screenheightmid;

	//beam1
	var x4 = Gfx.screenwidthmid;
	var y4 = Gfx.screenheightmid;

	//beam2
	var x5 = Gfx.screenwidthmid;
	var y5 = Gfx.screenheightmid;

	var speed  = 10;
	var flowerspeed  = 5;
	var beamspeed  = 10;

	var count = 0;
	var score = 0;
	var up = false;
	var lives = 3;
	var win = 15;

	function init()
	{

	}

	function update()
	{
		Gfx.fillbox(0, 0, Gfx.screenwidth, Gfx.screenheight, Col.WHITE);

		if (lives == 3) Gfx.drawimage(0, 0, "hearts");
		if (lives == 2) Gfx.drawimage(0, 0, "hearts2");
		if (lives == 1) Gfx.drawimage(0, 0, "hearts1");
		
		//gameover
		if (lives == 0)
		{
			Sound.play("boo");
			Gfx.fillbox(0, 0, Gfx.screenwidth, Gfx.screenheight, Col.WHITE);
			Gfx.drawimage(100,  100, "gameover");
		}

		//shows win screen when player wins
		if (score == win)
		{
			Sound.play("win");
			Gfx.fillbox(0, 0, Gfx.screenwidth, Gfx.screenheight, Col.WHITE);
			Gfx.drawimage(0,  0, "win");
		}

		//increases speed when player reach 5 scores
		if (score == 5)
		{
			flowerspeed  = 10;
			beamspeed  = 15;
		}

		//increases speed when player reach 10 scores
		if (score == 10)
		{
			beamspeed  = 25;
		}

		if (lives > 0 && score < win)
		{
			if (count % 5 == 0)
			{
				Gfx.drawimage(x1, y1, "boy");
			}
			else
			{
				Gfx.drawimage(x1, y1, "boy2");
			}

			Gfx.drawimage(x2, y2, "girl");
			Gfx.drawimage(x3, y3, "flower");

			Gfx.drawimage(x4, y4, "beam");
			Gfx.drawimage(x5, y5, "beam");

			if (count % 3 == 0)
			{
				Gfx.drawimage(Gfx.screenwidth - 200, 0, "sun");
			}
			else if (count % 3 == 1)
			{
				Gfx.drawimage(Gfx.screenwidth - 200, 0, "sun1");
			}
			else
			{
				Gfx.drawimage(Gfx.screenwidth - 200, 0, "sun2");
			}

			if (Input.pressed(Key.LEFT))
			{
				x1 -= speed;
			}

			if (Input.pressed(Key.RIGHT))
			{
				x1 += speed;
			}

			if (Input.pressed(Key.UP))
			{
				y1 -= speed;
			}

			if (Input.pressed(Key.DOWN))
			{
				y1 += speed;
			}

			//checks if boy goes out of screen boundary
			if (x1 < -20) x1 = -20;
			if (y1 < -50) y1 = -50;

			if (x1 > Gfx.screenwidth - 200) x1 = Gfx.screenwidth - 200;
			if (y1 > Gfx.screenheight - 300) y1 = Gfx.screenheight - 300;

			//checks if girl goes out of screen boundary
			if (x2 < -20) x2 = -20;
			if (y2 < -50) y2 = -50;

			if (x2 > Gfx.screenwidth - 200) x2 = Gfx.screenwidth - 200;
			if (y2 > Gfx.screenheight - 300) y2 = Gfx.screenheight - 500;

			//scores if boy reaches girl and moves girl to a new random spot
			if (Math.abs(x1 - x2) < 100 && Math.abs(y1 - y2) < 200)
			{
				Sound.play("yay");
				score++;

				x2 = Random.int(0, Gfx.screenwidth - 20);
				y2 = Random.int(0, Gfx.screenheight - 50);

				while (x2 >= Gfx.screenwidth - 200 && y2 <= 270)
				{
					x2 = Random.int(0, Gfx.screenwidth - 20);
					y2 = Random.int(0, Gfx.screenheight - 50);
				}
			}

			//changes direction of flower when it hits upper boundary
			if (!up)
			{
				y3 -= flowerspeed;

				if (y3 < 0)
				{
					y3 = 0;
					up = true;
				}
			}

			//changes direction of flower when it hits lower boundary
			if (up)
			{
				y3 += flowerspeed;

				if (y3 == Gfx.screenheight - 100)
				{
					y3 = Gfx.screenheight - 100;
					up = false;
				}

			}

			//causes damage when boy hits beam, flower or sun
			if (x1 != 0 || y1 != 0) //checks if boy has moved or not
			{
				if (x3 > x1 && x3 + 106 < x1 + 165 && y3 < y1 && y3 - 138 > y1 - 257)
				{
					Sound.play("ouch");
					lives--;
					x1 = 0;
					y1 = 0;
				}

				if (x4 > x1 && x4 <= x1 + 115 && y4 > y1 && y4 < y1 + 220)
				{
					Sound.play("ouch");
					lives--;
					x1 = 0;
					y1 = 0;
				}

				if (x5 < x1 + 120 && x5 + 37 >= x1 && y5 > y1 && y5 < y1 + 220)
				{
					Sound.play("ouch");
					lives--;
					x1 = 0;
					y1 = 0;
				}

				if (x1 >= Gfx.screenwidth - 200 && y1 <= 270)
				{
					Sound.play("ouch");
					lives--;
					x1 = 0;
					y1 = 0;
				}
			}
			
			//shoots beams
			x4 -= beamspeed;
			x5 += beamspeed;

			y4 = y3;
			y5 = y3;

			if (x4 < 0) x4 = Gfx.screenwidthmid;
			if (x5 > Gfx.screenwidth - 50) x5 = Gfx.screenwidthmid;

			//displays highscore
			Text.size = 4;
			Text.display(Text.RIGHT, Text.BOTTOM, "SCORE: " + score, Col.BLACK, 1);

			count++;
		}
	}
}