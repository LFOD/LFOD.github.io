// Dynamic margin note width adjustment
(function() {
  function updateMarginNoteWidth() {
    // Skip on mobile devices (< 760px)
    if (window.innerWidth < 760) {
      document.documentElement.style.setProperty('--margin-note-width', 'auto');
      return;
    }
    
    const MAX_MARGIN_NOTE_WIDTH_PX = 350;
    
    // Find the main content container - specifically the Quarto document content
    const mainContent = document.querySelector('main.content#quarto-document-content');
    
    if (!mainContent) return;
    
    // Get the body's bounding box as the outer limit
    const bodyRect = document.body.getBoundingClientRect();
    const bodyRight = bodyRect.right;
    
    // Get the main content's position and dimensions
    const contentRect = mainContent.getBoundingClientRect();
    const contentRight = contentRect.right;
    
    // Calculate available space (body right edge - content right edge - buffer)
    const marginBuffer = 16; // 1rem buffer
    const availableSpace = bodyRight - contentRight - marginBuffer;
    
    // Set the CSS variable with a maximum of MAX_MARGIN_NOTE_WIDTH_PX
    const marginNoteWidth = Math.min(Math.max(0, availableSpace), MAX_MARGIN_NOTE_WIDTH_PX);
    
    // Apply the CSS variable to the root element
    document.documentElement.style.setProperty('--margin-note-width', `${marginNoteWidth}px`);
      
    // Only manipulate display for Quarto-specific margin notes
    const marginNotes = document.querySelectorAll('.quarto-container-page .marginnote');
    marginNotes.forEach(note => {
      // Remove any inline display style to let CSS handle it
      note.style.display = '';
    });
  }
  
  // Update on load
  updateMarginNoteWidth();
  
  // Update on resize with debouncing
  let resizeTimeout;
  window.addEventListener('resize', function() {
    clearTimeout(resizeTimeout);
    resizeTimeout = setTimeout(updateMarginNoteWidth, 150);
  });
  
  // Also update when DOM content is fully loaded
  document.addEventListener('DOMContentLoaded', updateMarginNoteWidth);
})();