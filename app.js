const nav = document.getElementById('mainNav');
const btn = document.getElementById('menuBtn');
btn?.addEventListener('click', () => nav.classList.toggle('open'));
document.querySelectorAll('#mainNav a').forEach(a => a.addEventListener('click', () => nav.classList.remove('open')));

const yearEl = document.getElementById('year');
if (yearEl) {
  yearEl.textContent = new Date().getFullYear();
}

// Channel Toggle Switcher
const atinkaBtn = document.getElementById('atinkaTabBtn');
const bulletBtn = document.getElementById('bulletTabBtn');
const atinkaCard = document.getElementById('atinkaCard');
const bulletCard = document.getElementById('bulletCard');

const atinkaTile = document.getElementById('atinkaTile');
const bulletTile = document.getElementById('bulletTile');

function showAtinka() {
  if (atinkaBtn && bulletBtn && atinkaCard && bulletCard) {
    atinkaBtn.classList.add('active');
    bulletBtn.classList.remove('active');
    atinkaCard.style.display = 'block';
    bulletCard.style.display = 'none';
  }
}

function showBullet() {
  if (atinkaBtn && bulletBtn && atinkaCard && bulletCard) {
    bulletBtn.classList.add('active');
    atinkaBtn.classList.remove('active');
    bulletCard.style.display = 'block';
    atinkaCard.style.display = 'none';
  }
}

atinkaBtn?.addEventListener('click', showAtinka);
bulletBtn?.addEventListener('click', showBullet);
atinkaTile?.addEventListener('click', showAtinka);
bulletTile?.addEventListener('click', showBullet);
