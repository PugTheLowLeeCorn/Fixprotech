// Fix ProTech Home Page JavaScript

document.addEventListener('DOMContentLoaded', function() {
    // Initialize all functionality
    initSmoothScroll();
    initFadeInAnimations();
});

// Smooth Scroll Functionality
function initSmoothScroll() {
    const smoothScrollLinks = document.querySelectorAll('.smooth-scroll');
    
    smoothScrollLinks.forEach(link => {
        link.addEventListener('click', function(e) {
            e.preventDefault();
            
            const targetId = this.getAttribute('href');
            const targetElement = document.querySelector(targetId);
            
            if (targetElement) {
                const headerHeight = 80; // Account for fixed header
                const targetPosition = targetElement.offsetTop - headerHeight;
                
                window.scrollTo({
                    top: targetPosition,
                    behavior: 'smooth'
                });
            }
        });
    });
}

// Fade in animations on scroll
function initFadeInAnimations() {
    const observerOptions = {
        threshold: 0.1,
        rootMargin: '0px 0px -50px 0px'
    };
    
    const observer = new IntersectionObserver(function(entries) {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                entry.target.classList.add('visible');
            }
        });
    }, observerOptions);
    
    // Add fade-in class to elements
    const elementsToAnimate = document.querySelectorAll('.about-card, .package-card, .step-card, .trust-item');
    elementsToAnimate.forEach(el => {
        el.classList.add('fade-in');
        observer.observe(el);
    });
}

// Scroll to top functionality
function scrollToTop() {
    window.scrollTo({
        top: 0,
        behavior: 'smooth'
    });
}

// Add scroll to top button
document.addEventListener('DOMContentLoaded', function() {
    const scrollToTopBtn = document.createElement('button');
    scrollToTopBtn.innerHTML = '<i class="fas fa-arrow-up"></i>';
    scrollToTopBtn.className = 'btn btn-primary scroll-to-top';
    scrollToTopBtn.style.cssText = `
        position: fixed;
        bottom: 20px;
        right: 20px;
        width: 50px;
        height: 50px;
        border-radius: 50%;
        display: none;
        z-index: 1000;
        box-shadow: 0 4px 12px rgba(0,0,0,0.15);
    `;
    
    document.body.appendChild(scrollToTopBtn);
    
    // Show/hide button based on scroll position
    window.addEventListener('scroll', function() {
        if (window.pageYOffset > 300) {
            scrollToTopBtn.style.display = 'block';
        } else {
            scrollToTopBtn.style.display = 'none';
        }
    });
    
    // Scroll to top on click
    scrollToTopBtn.addEventListener('click', scrollToTop);
});

// Package card hover effects
document.addEventListener('DOMContentLoaded', function() {
    const packageCards = document.querySelectorAll('.package-card');
    
    packageCards.forEach(card => {
        card.addEventListener('mouseenter', function() {
            this.style.transform = 'translateY(-10px) scale(1.02)';
        });
        
        card.addEventListener('mouseleave', function() {
            if (this.classList.contains('featured')) {
                this.style.transform = 'scale(1.05)';
            } else {
                this.style.transform = 'translateY(0) scale(1)';
            }
        });
    });
});
