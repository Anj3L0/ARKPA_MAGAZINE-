<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>ARKPA Magazine - Celebrity Legends</title>

<!-- GOOGLE FONTS -->
<link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@700&family=Roboto:wght@400;500&display=swap" rel="stylesheet">

<style>
/* ===================== GLOBAL STYLES ===================== */
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: 'Roboto', sans-serif;
}

body {
    background: #f8f8f8;
    color: #222;
    line-height: 1.6;
    scroll-behavior: smooth;
    transition: 0.3s;
}

a { text-decoration: none; color: inherit; }
img { max-width: 100%; display: block; }
html { scroll-padding-top: 120px; }

/* ===================== DARK MODE ===================== */
body.dark { background: #121212; color: #eee; }
body.dark header { background: #1e1e1e; }
body.dark nav a { color: #eee; }
body.dark nav a:hover { color: #ff4d4d; }
body.dark .card { background: #1e1e1e; box-shadow: 0 5px 20px rgba(255,255,255,0.05); }
body.dark .card-content .info { color: #ccc; }
body.dark .card-content p { color: #ddd; }
body.dark .card-content .quote { color: #ff4d4d; border-left-color: #ff4d4d; }
body.dark footer { background: #1e1e1e; color: #eee; }

/* ===================== HEADER ===================== */
header {
    background: #000;
    color: #fff;
    position: sticky;
    top: 0;
    z-index: 1000;
    box-shadow: 0 3px 10px rgba(0,0,0,0.2);
}

header .container {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 15px 10%;
}

header h1 {
    font-family: 'Playfair Display', serif;
    font-size: 36px;
    color: #ff3333;
    letter-spacing: 2px;
}

nav a {
    margin-left: 25px;
    font-weight: 500;
    color: #fff;
    transition: 0.3s;
}

nav a:hover { color: #ff4d4d; }

/* ===================== SEARCH BAR ===================== */
.search-bar {
    display: flex;
    justify-content: center;
    margin: 20px 0 30px 0;
    position: relative;
    z-index: 5;
}

.search-bar input {
    padding: 12px 20px;
    font-size: 16px;
    border-radius: 25px 0 0 25px;
    border: 1px solid #ccc;
    outline: none;
    width: 280px;
}

.search-bar button {
    padding: 12px 20px;
    border: none;
    background: #ff3333;
    color: white;
    font-weight: bold;
    cursor: pointer;
    border-radius: 0 25px 25px 0;
    transition: 0.3s;
}

.search-bar button:hover { background: #cc0000; }

/* ===================== HERO SLIDER ===================== */
.slider {
    position: relative;
    height: 450px;
    overflow: hidden;
}

.slide {
    position: absolute;
    width: 100%;
    height: 100%;
    opacity: 0;
    transition: opacity 1s ease-in-out;
}

.slide.active { opacity: 1; }
.slide img { width: 100%; height: 100%; object-fit: cover; }

.slide-text {
    position: absolute;
    bottom: 40px;
    left: 10%;
    background: rgba(0,0,0,0.5);
    color: #fff;
    padding: 25px 30px;
    border-radius: 10px;
    max-width: 600px;
}

.slide-text h2 {
    font-family: 'Playfair Display', serif;
    font-size: 32px;
    margin-bottom: 10px;
}

.slide-text p { font-size: 16px; }

/* ===================== SECTION TITLES ===================== */
.section-title {
    font-family: 'Playfair Display', serif;
    font-size: 28px;
    color: #cc0000;
    margin-bottom: 30px;
    border-left: 5px solid #cc0000;
    padding-left: 10px;
}

/* ===================== GRIDS ===================== */
.celebrity-grid,
.trending-grid,
.story-grid,
.founder-grid,
.featured-grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
    gap: 30px;
    margin-bottom: 50px;
}

/* ===================== CARDS ===================== */
.card {
    background: white;
    border-radius: 15px;
    overflow: hidden;
    box-shadow: 0 5px 20px rgba(0,0,0,0.1);
    transition: 0.4s;
}

.card img { width: 100%; height: 320px; object-fit: cover; }

.card-content { padding: 20px; }
.card-content h3 {
    color: #cc0000;
    margin-bottom: 10px;
    font-family: 'Playfair Display', serif;
}

.card-content .info {
    font-size: 14px;
    color: #666;
    margin-bottom: 10px;
}

.card-content p { font-size: 15px; line-height: 1.6; }

.card-content .quote {
    font-size: 16px;
    font-style: italic;
    color: #ff3333;
    margin-top: 15px;
    border-left: 4px solid #ff3333;
    padding-left: 10px;
}

/* ===================== FOOTER ===================== */
footer {
    background: #000;
    color: white;
    text-align: center;
    padding: 30px;
}

/* ===================== SCROLL REVEAL ===================== */
.reveal {
    opacity: 0;
    transform: translateY(50px);
    transition: 1s all ease;
}

.reveal.active { opacity: 1; }

/* ===================== DARK MODE TOGGLE ===================== */
.toggle-btn {
    background: #ff3333;
    color: #fff;
    padding: 8px 15px;
    border: none;
    border-radius: 25px;
    cursor: pointer;
    margin-left: 20px;
    font-weight: bold;
    transition: 0.3s;
}

.toggle-btn:hover { background: #cc0000; }

@media(max-width: 600px) {
    .search-bar input { width: 200px; }
    .slide-text h2 { font-size: 24px; }
    .slide-text p { font-size: 14px; }
}
</style>
</head>

<body>

<!-- ===================== HEADER ===================== -->
<header>
<div class="container">
    <h1>ARKPA</h1>
    <nav>
        <a href="#top">Home</a>
        <a href="#trending">Trending</a>
        <a href="#celebrity">Celebrities</a>
        <a href="#featured-filipino">Featured</a>
        <a href="#founders">Founders</a>
    </nav>
    <button class="toggle-btn" onclick="toggleDarkMode()">🌙 Dark Mode</button>
</div>
</header>

<!-- ===================== SEARCH BAR ===================== -->
<div id="top" class="search-bar reveal">
    <input type="text" placeholder="Search for a celebrity...">
    <button>Search</button>
</div>

<!-- ===================== HERO SLIDER ===================== -->
<div class="slider">
    <div class="slide active">
        <img src="https://images.unsplash.com/photo-1497032628192-86f99bcd76bc">
        <div class="slide-text">
            <h2>Passion Creates Legends</h2>
            <p>Explore the journeys of iconic celebrities who changed the world.</p>
        </div>
    </div>
    <div class="slide">
        <img src="https://tse2.mm.bing.net/th/id/OIP.WIZ5XxUslHtZnwt5RCRvXAHaEJ?pid=Api&P=0&h=180">
        <div class="slide-text">
            <h2>From Struggle to Spotlight</h2>
            <p>Hard work and dedication built the careers of these stars.</p>
        </div>
    </div>
</div>

<!-- ===================== TRENDING ===================== -->
<section id="trending">
<h2 class="section-title reveal">🔥 Trending Now</h2>
<div class="trending-grid reveal">
    <div class="card trend-card">
        <img src="thor2.png">
        <div class="card-content">
            <h3>Chris Hemsworth</h3>
            <p>From Australian TV to Thor: His persistence, charm, and rigorous training helped him dominate Hollywood action roles.</p>
            <p class="quote">"Being disciplined and loving what you do is key to success." – Chris Hemsworth</p>
        </div>
    </div>
    <div class="card trend-card">
        <img src="beyoce.png">
        <div class="card-content">
            <h3>Beyoncé</h3>
            <p>Queen B rose from Destiny's Child to global superstardom. Her disciplined work ethic and constant reinvention inspire millions worldwide.</p>
            <p class="quote">"The most alluring thing a woman can have is confidence." – Beyoncé</p>
        </div>
    </div>
</div>
</section>

<!-- ===================== GLOBAL CELEBRITIES ===================== -->
<section id="celebrity"> 
  <h2 class="section-title reveal">🌟 Celebrity Legends</h2>

  <div class="celebrity-grid reveal">

    <!-- 1. Rowan Atkinson -->
    <div class="card">
      <img src="bean.png" alt="Rowan Atkinson">
      <div class="card-content">
        <h3>Rowan Atkinson</h3>
        <div class="info">British | Actor & Comedian</div>
        <p>
          Overcame childhood stuttering and turned it into a unique comedic style.
          Mr. Bean’s silent comedy and precise expressions made him a global icon.
        </p>
        <p class="quote">
          "I don’t want to be a star, I just want to make people laugh."
        </p>
      </div>
    </div>

    <!-- 2. Jackie Chan -->
    <div class="card">
      <img src="jackie.png" alt="Jackie Chan">
      <div class="card-content">
        <h3>Jackie Chan</h3>
        <div class="info">Hong Kong | Actor & Martial Artist</div>
        <p>
          Trained in martial arts from a young age and performed his own stunts,
          redefining action cinema with humor and discipline.
        </p>
        <p class="quote">
          "Do not let circumstances control you. You create your path."
        </p>
      </div>
    </div>

    <!-- 3. Michael Jackson -->
    <div class="card">
      <img src="michael.png" alt="Michael Jackson">
      <div class="card-content">
        <h3>Michael Jackson</h3>
        <div class="info">American | Singer & Dancer</div>
        <p>
          The King of Pop revolutionized music, dance, and music videos,
          pushing creative boundaries worldwide.
        </p>
        <p class="quote">
          "If you enter this world knowing you are loved and leave knowing the same, everything in between is bonus."
        </p>
      </div>
    </div>

    <!-- 4. Oprah Winfrey -->
    <div class="card">
      <img src="oprah.png" alt="Oprah Winfrey">
      <div class="card-content">
        <h3>Oprah Winfrey</h3>
        <div class="info">American | TV Host & Philanthropist</div>
        <p>
          Overcame poverty and adversity to become a global media icon,
          empowering millions through empathy and storytelling.
        </p>
        <p class="quote">
          "Turn your wounds into wisdom."
        </p>
      </div>
    </div>

    <!-- 5. Marilyn Monroe -->
    <div class="card">
      <img src="monroe.png" alt="Marilyn Monroe">
      <div class="card-content">
        <h3>Marilyn Monroe</h3>
        <div class="info">American | Actress & Model</div>
        <p>
          Became one of Hollywood's most iconic stars despite early struggles,
          inspiring artists and dreamers worldwide.
        </p>
        <p class="quote">
          "Imperfection is beauty, madness is genius."
        </p>
      </div>
    </div>

    <!-- 6. Dwayne Johnson -->
    <div class="card">
      <img src="rock.png" alt="Dwayne Johnson">
      <div class="card-content">
        <h3>Dwayne Johnson</h3>
        <div class="info">American | Actor & Former Wrestler</div>
        <p>
          From wrestling champion to Hollywood superstar through relentless
          work ethic, humility, and discipline.
        </p>
        <p class="quote">
          "Blood, sweat and respect. The first two you give, the last you earn."
        </p>
      </div>
    </div>

    <!-- 7. Leonardo DiCaprio -->
    <div class="card">
      <img src="carp.png" alt="Leonardo DiCaprio">
      <div class="card-content">
        <h3>Leonardo DiCaprio</h3>
        <div class="info">American | Actor & Environmentalist</div>
        <p>
          Rose from teen roles to global superstardom and became a passionate
          environmental activist.
        </p>
        <p class="quote">
          "Every next level of your life will demand a different version of you."
        </p>
      </div>
    </div>

    <!-- 8. Taylor Swift -->
    <div class="card">
      <img src="taylor.png" alt="Taylor Swift">
      <div class="card-content">
        <h3>Taylor Swift</h3>
        <div class="info">American | Singer & Songwriter</div>
        <p>
          From country roots to global pop dominance, turning vulnerability
          and storytelling into global art.
        </p>
        <p class="quote">
          "Just be yourself, there is no one better."
        </p>
      </div>
    </div>

    <!-- 9. Chris Evans -->
    <div class="card">
      <img src="cap.png" alt="Chris Evans">
      <div class="card-content">
        <h3>Chris Evans</h3>
        <div class="info">American | Actor</div>
        <p>
          Best known as Captain America, combining discipline and humility
          to inspire millions.
        </p>
        <p class="quote">
          "I try to live by example and be a good human."
        </p>
      </div>
    </div>

    <!-- 10. Scarlett Johansson -->
    <div class="card">
      <img src="scarley.png" alt="Scarlett Johansson">
      <div class="card-content">
        <h3>Scarlett Johansson</h3>
        <div class="info">American | Actress & Producer</div>
        <p>
          A dynamic performer who advocates for artistic empowerment
          and creative independence.
        </p>
        <p class="quote">
          "I want to inspire people to believe in their dreams."
        </p>
      </div>
    </div>

    <!-- 11. Elon Musk -->
    <div class="card">
      <img src="elon.png" alt="Elon Musk">
      <div class="card-content">
        <h3>Elon Musk</h3>
        <div class="info">South African-born | Entrepreneur & Innovator</div>
        <p>
          Reinvented electric vehicles, space travel, and renewable tech
          through bold vision and ambition.
        </p>
        <p class="quote">
          "When something is important enough, you do it even if the odds are not in your favor."
        </p>
      </div>
    </div>

    <!-- 12. Meryl Streep -->
    <div class="card">
      <img src="me.png" alt="Meryl Streep">
      <div class="card-content">
        <h3>Meryl Streep</h3>
        <div class="info">American | Actress</div>
        <p>
          Celebrated for her unmatched craft and empathy,
          becoming a benchmark of excellence in acting.
        </p>
        <p class="quote">
          "The great gift of human beings is that we have the power of empathy."
        </p>
      </div>
    </div>

    <!-- 13. Serena Williams -->
    <div class="card">
      <img src="serena.png" alt="Serena Williams">
      <div class="card-content">
        <h3>Serena Williams</h3>
        <div class="info">American | Tennis Legend</div>
        <p>
          Dominated tennis for over two decades with power,
          resilience, and competitive spirit.
        </p>
        <p class="quote">
          "Whatever fear I have inside me, my desire to win is always stronger."
        </p>
      </div>
    </div>

    <!-- 14. Brad Pitt -->
    <div class="card">
      <img src="brad.png" alt="Brad Pitt">
      <div class="card-content">
        <h3>Brad Pitt</h3>
        <div class="info">American | Actor & Producer</div>
        <p>
          Evolved from heartthrob to critically acclaimed artist,
          passionate about powerful storytelling.
        </p>
        <p class="quote">
          "You must lose everything to gain the world."
        </p>
      </div>
    </div>

    <!-- 15. Rihanna -->
    <div class="card">
      <img src="riha.png" alt="Rihanna">
      <div class="card-content">
        <h3>Rihanna</h3>
        <div class="info">Barbadian | Singer & Entrepreneur</div>
        <p>
          Built a music empire and global beauty brand,
          redefining what it means to be an artist-entrepreneur.
        </p>
        <p class="quote">
          "You may never be good enough for everybody, but you will always be the best for somebody."
        </p>
      </div>
    </div>

    <!-- 16. Will Smith -->
    <div class="card">
      <img src="will.png" alt="Will Smith">
      <div class="card-content">
        <h3>Will Smith</h3>
        <div class="info">American | Actor & Musician</div>
        <p>
          From rap sensation to blockbuster superstar,
          inspiring millions with optimism and drive.
        </p>
        <p class="quote">
          "You don’t set out to build a wall. You set out to build a dream."
        </p>
      </div>
    </div>

    <!-- 17. Keanu Reeves -->
    <div class="card">
      <img src="kea.png" alt="Keanu Reeves">
      <div class="card-content">
        <h3>Keanu Reeves</h3>
        <div class="info">Canadian | Actor</div>
        <p>
          Known for iconic roles and humble personality,
          admired for resilience and kindness.
        </p>
        <p class="quote">
          "The simple act of paying attention can take you a long way."
        </p>
      </div>
    </div>

    <!-- 18. Angelina Jolie -->
    <div class="card">
      <img src="angelina.png" alt="Angelina Jolie">
      <div class="card-content">
        <h3>Angelina Jolie</h3>
        <div class="info">American | Actress & Humanitarian</div>
        <p>
          A Hollywood star who redefined fame through
          global humanitarian advocacy.
        </p>
        <p class="quote">
          "If you don’t get out of the box you’ve been raised in, you won’t understand how much bigger the world is."
        </p>
      </div>
    </div>

    <!-- 19. Johnny Depp -->
    <div class="card">
      <img src="john.png" alt="Johnny Depp">
      <div class="card-content">
        <h3>Johnny Depp</h3>
        <div class="info">American | Actor & Musician</div>
        <p>
          Celebrated for eclectic roles and fearless creativity,
          becoming a symbol of artistic expression.
        </p>
        <p class="quote">
          "I think everybody’s weird. We should all celebrate our individuality."
        </p>
      </div>
    </div>

    <!-- 20. Lady Gaga -->
    <div class="card">
      <img src="lady.png" alt="Lady Gaga">
      <div class="card-content">
        <h3>Lady Gaga</h3>
        <div class="info">American | Singer & Actress</div>
        <p>
          Broke boundaries in music, fashion, and film,
          promoting bold originality and self-empowerment.
        </p>
        <p class="quote">
          "Don’t you ever let a soul tell you that you can’t be exactly who you are."
        </p>
      </div>
    </div>

  </div>
</section>

<!-- ===================== FEATURED FILIPINO CELEBRITIES ===================== -->
<section id="featured-filipino">
<h2 class="section-title reveal">⭐ Featured Filipino Celebrities</h2>
<div class="featured-grid reveal">
  <div class="card">
      <img src="vi.png">
      <div class="card-content">
          <h3>Vice Ganda</h3>
          <div class="info">Filipino | Comedian & TV Host</div>
          <p>Known for his humor, advocacy, and influence in Philippine entertainment.</p>
      </div>
  </div>
  <div class="card">
      <img src="liza.png">
      <div class="card-content">
          <h3>Liza Soberano</h3>
          <div class="info">Filipino-American | Actress & Model</div>
          <p>Admired for her beauty and advocacy work in the Philippines.</p>
      </div>
  </div>
  <div class="card">
      <img src="Anne.png">
      <div class="card-content">
          <h3>Anne Curtis</h3>
          <div class="info">Filipino-Australian | Actress & TV Host</div>
          <p>Versatile actress and philanthropist with strong influence in Philippine entertainment.</p>
      </div>
  </div>
  <div class="card">
      <img src="heart.png">
      <div class="card-content">
          <h3>Heart Evangelista</h3>
          <div class="info">Filipino | Actress & Philanthropist</div>
          <p>A multi-talented actress, painter, and fashion icon admired for her charitable works.</p>
      </div>
    </div> <!-- Featured Filipino Celebrity Cards -->
    <div class="card">
      <img src="angelo.png.jpg">
      <div class="card-content">
          <h3>Angelo</h3>
          <div class="info">Filipino | Comedian, Talented, Handsome</div>
          <p>Known for his humor, advocacy, and the most perfect creature in the multiverse</p>
      </div>
    </div>
</div>
</section>

<!-- ===================== FOUNDERS ===================== -->
<section id="founders">
<h2 class="section-title reveal">👥 Meet the Founders</h2>
<div class="founder-grid reveal">
    <div class="card"><div class="card-content"><h3>Rosemarie</h3><p>Creative Director</p></div></div> <div class="card"><div class="card-content"><h3>April</h3><p>Content Editor</p></div></div> <div class="card"><div class="card-content"><h3>Kian</h3><p>Marketing Head</p></div></div> <div class="card"><div class="card-content"><h3>Paolo</h3><p>Design Lead</p></div></div> <div class="card"><div class="card-content"><h3>Angelo</h3><p>Pogi lang ambag</p></div></div> <!-- Founder Cards -->
</div>
</section>

<!-- ===================== FOOTER ===================== -->
<footer>
<p>© 2026 ARKPA Magazine | Inspiring the Next Generation</p>
</footer>

<!-- ===================== SCRIPTS ===================== -->
<script>
// HERO SLIDER
let slides = document.querySelectorAll(".slide");
let index = 0;
function showSlide() {
    slides.forEach(slide => slide.classList.remove("active"));
    index++;
    if(index >= slides.length) index = 0;
    slides[index].classList.add("active");
}
setInterval(showSlide, 4000);

// SCROLL REVEAL
function reveal() {
    let reveals = document.querySelectorAll(".reveal");
    for (let i = 0; i < reveals.length; i++) {
        let windowHeight = window.innerHeight;
        let elementTop = reveals[i].getBoundingClientRect().top;
        let elementVisible = 100;
        if (elementTop < windowHeight - elementVisible) {
            reveals[i].classList.add("active");
        }
    }
}
window.addEventListener("scroll", reveal);

// DARK MODE TOGGLE
function toggleDarkMode() {
    document.body.classList.toggle('dark');
}
</script>

</body>
</html>
```

