const observer = 'IntersectionObserver' in window ? new IntersectionObserver((entries)=>{entries.forEach((entry)=>{if(entry.isIntersecting){entry.target.classList.add('is-visible');observer.unobserve(entry.target)}})},{threshold:.12}) : null;
document.querySelectorAll('.reveal').forEach(el=>{if(observer) observer.observe(el);else el.classList.add('is-visible')});
