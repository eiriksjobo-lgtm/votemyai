<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>VoteMyAI – Sign In</title>
  <link rel="preconnect" href="https://fonts.googleapis.com" />
  <link href="https://fonts.googleapis.com/css2?family=Bebas+Neue&family=DM+Sans:wght@300;500;700&display=swap" rel="stylesheet" />
  <style>
    :root {
      --bg:      #0a0a0f;
      --surface: #111118;
      --border:  #1e1e2e;
      --accent:  #e8ff47;
      --red:     #ff4d6d;
      --text:    #f0f0f0;
      --muted:   #666680;
      --radius:  6px;
    }
    *, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }
    body {
      background: var(--bg);
      color: var(--text);
      font-family: 'DM Sans', sans-serif;
      min-height: 100vh;
      display: flex;
      align-items: center;
      justify-content: center;
      padding: 20px;
    }
    body::before {
      content: '';
      position: fixed;
      inset: 0;
      background: radial-gradient(ellipse 60% 50% at 50% 100%, rgba(232,255,71,0.06) 0%, transparent 70%);
      pointer-events: none;
    }
    .box {
      background: var(--surface);
      border: 1px solid var(--border);
      border-radius: 14px;
      padding: 48px 40px;
      width: 100%;
      max-width: 420px;
      position: relative;
    }
    .logo {
      font-family: 'Bebas Neue', sans-serif;
      font-size: 2rem;
      letter-spacing: 2px;
      color: var(--accent);
      text-align: center;
      margin-bottom: 4px;
    }
    .logo span { color: var(--text); }
    .subtitle {
      text-align: center;
      color: var(--muted);
      font-size: 0.84rem;
      margin-bottom: 36px;
    }

    /* Tabs */
    .tabs {
      display: flex;
      border: 1px solid var(--border);
      border-radius: var(--radius);
      overflow: hidden;
      margin-bottom: 28px;
    }
    .tab {
      flex: 1;
      padding: 10px;
      text-align: center;
      font-size: 0.82rem;
      font-weight: 700;
      letter-spacing: 1px;
      text-transform: uppercase;
      cursor: pointer;
      background: transparent;
      border: none;
      color: var(--muted);
      transition: background 0.2s, color 0.2s;
    }
    .tab.active {
      background: var(--accent);
      color: #0a0a0f;
    }

    .form-group { margin-bottom: 16px; }
    .form-group label {
      display: block;
      font-size: 0.75rem;
      font-weight: 500;
      letter-spacing: 1.5px;
      text-transform: uppercase;
      color: var(--muted);
      margin-bottom: 7px;
    }
    .form-group input {
      width: 100%;
      background: rgba(255,255,255,0.04);
      border: 1px solid var(--border);
      color: var(--text);
      padding: 12px 14px;
      border-radius: var(--radius);
      font-family: 'DM Sans', sans-serif;
      font-size: 0.92rem;
      outline: none;
      transition: border-color 0.2s;
    }
    .form-group input:focus { border-color: rgba(232,255,71,0.4); }

    .submit-btn {
      width: 100%;
      background: var(--accent);
      color: #0a0a0f;
      border: none;
      padding: 13px;
      border-radius: var(--radius);
      font-family: 'DM Sans', sans-serif;
      font-weight: 700;
      font-size: 0.85rem;
      letter-spacing: 1.5px;
      text-transform: uppercase;
      cursor: pointer;
      margin-top: 8px;
      transition: opacity 0.2s, transform 0.15s;
    }
    .submit-btn:hover { opacity: 0.88; transform: translateY(-1px); }
    .submit-btn:disabled { opacity: 0.4; cursor: not-allowed; transform: none; }

    .msg {
      margin-top: 14px;
      padding: 12px 14px;
      border-radius: var(--radius);
      font-size: 0.84rem;
      display: none;
    }
    .msg.error { background: rgba(255,77,109,0.1); border: 1px solid rgba(255,77,109,0.25); color: var(--red); display: block; }
    .msg.success { background: rgba(232,255,71,0.08); border: 1px solid rgba(232,255,71,0.2); color: var(--accent); display: block; }

    .back-link {
      display: block;
      text-align: center;
      margin-top: 20px;
      font-size: 0.82rem;
      color: var(--muted);
      text-decoration: none;
      transition: color 0.2s;
    }
    .back-link:hover { color: var(--text); }

    .register-form { display: none; }
  </style>
</head>
<body>
  <div class="box">
    <div class="logo">VOTE<span>MY</span>AI</div>
    <div class="subtitle">Join the community</div>

    <div class="tabs">
      <button class="tab active" onclick="showTab('login')">Logg inn</button>
      <button class="tab" onclick="showTab('register')">Registrer</button>
    </div>

    <!-- LOGIN -->
    <div class="login-form">
      <div class="form-group">
        <label>E-post</label>
        <input type="email" id="loginEmail" placeholder="din@epost.no" />
      </div>
      <div class="form-group">
        <label>Passord</label>
        <input type="password" id="loginPassword" placeholder="••••••••"
          onkeydown="if(event.key==='Enter') login()" />
      </div>
      <button class="submit-btn" id="loginBtn" onclick="login()">Logg inn</button>
      <div class="msg" id="loginMsg"></div>
    </div>

    <!-- REGISTER -->
    <div class="register-form">
      <div class="form-group">
        <label>Brukernavn</label>
        <input type="text" id="regUsername" placeholder="aimaster99" />
      </div>
      <div class="form-group">
        <label>E-post</label>
        <input type="email" id="regEmail" placeholder="din@epost.no" />
      </div>
      <div class="form-group">
        <label>Passord</label>
        <input type="password" id="regPassword" placeholder="Minst 6 tegn"
          onkeydown="if(event.key==='Enter') register()" />
      </div>
      <button class="submit-btn" id="registerBtn" onclick="register()">Opprett konto</button>
      <div class="msg" id="registerMsg"></div>
    </div>

    <a href="/" class="back-link">← Tilbake til forsiden</a>
  </div>

<script type="module">
  import { createClient } from 'https://cdn.jsdelivr.net/npm/@supabase/supabase-js/+esm';

  const SUPABASE_URL = 'https://pkpkgaaowtcmuqzgqvda.supabase.co';
  const SUPABASE_KEY = 'sb_publishable_px-Cw2XvKCGQKff0bb22uQ_ufIJchQw';
  const sb = createClient(SUPABASE_URL, SUPABASE_KEY);

  /* ── Sjekk om allerede innlogget ── */
  const { data: { session } } = await sb.auth.getSession();
  if (session) window.location.href = '/profile.html';

  /* ── Tab-bytte ── */
  window.showTab = function(tab) {
    document.querySelectorAll('.tab').forEach(t => t.classList.remove('active'));
    event.target.classList.add('active');
    document.querySelector('.login-form').style.display    = tab === 'login'    ? 'block' : 'none';
    document.querySelector('.register-form').style.display = tab === 'register' ? 'block' : 'none';
  };

  /* ── Logg inn ── */
  window.login = async function() {
    const email    = document.getElementById('loginEmail').value.trim();
    const password = document.getElementById('loginPassword').value;
    const btn      = document.getElementById('loginBtn');
    const msg      = document.getElementById('loginMsg');

    if (!email || !password) {
      showMsg(msg, 'error', 'Fyll inn e-post og passord.');
      return;
    }

    btn.disabled = true;
    btn.textContent = 'Logger inn...';

    const { error } = await sb.auth.signInWithPassword({ email, password });

    if (error) {
      showMsg(msg, 'error', 'Feil e-post eller passord.');
      btn.disabled = false;
      btn.textContent = 'Logg inn';
    } else {
      window.location.href = '/';
    }
  };

  /* ── Registrer ── */
  window.register = async function() {
    const username = document.getElementById('regUsername').value.trim();
    const email    = document.getElementById('regEmail').value.trim();
    const password = document.getElementById('regPassword').value;
    const btn      = document.getElementById('registerBtn');
    const msg      = document.getElementById('registerMsg');

    if (!username || !email || !password) {
      showMsg(msg, 'error', 'Fyll inn alle feltene.');
      return;
    }
    if (password.length < 6) {
      showMsg(msg, 'error', 'Passordet må være minst 6 tegn.');
      return;
    }
    if (username.length < 3) {
      showMsg(msg, 'error', 'Brukernavnet må være minst 3 tegn.');
      return;
    }

    btn.disabled = true;
    btn.textContent = 'Oppretter konto...';

    const { data, error } = await sb.auth.signUp({ email, password });

    if (error) {
      showMsg(msg, 'error', error.message);
      btn.disabled = false;
      btn.textContent = 'Opprett konto';
      return;
    }

    // Lag profil
    if (data.user) {
      await sb.from('profiles').insert({
        id: data.user.id,
        username: username,
      });
    }

    showMsg(msg, 'success', '✅ Konto opprettet! Sjekk e-posten din for bekreftelse.');
    btn.disabled = false;
    btn.textContent = 'Opprett konto';
  };

  function showMsg(el, type, text) {
    el.className = `msg ${type}`;
    el.textContent = text;
  }
</script>
</body>
</html>
