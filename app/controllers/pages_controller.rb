class PagesController < ApplicationController

  def home
    @title = "Home"
  end

  def contact
    @title = "Contact"
  end
  
  def about
    @title = "About"
  end
  
  def help
    @title = "Help"
  end

 def team
    @title = "The Team"
  end

 def privacy
    @title = "Privacy Policy"
  end

 def terms
    @title = "Terms of Agreement"
  end

 def testimonials
    @title = "Testimonials"
  end

def developers
    @title = "Developers"
  end

def tour
    @tour = "Tour"
  end

def welcome
    @welcome = "Welcome"
  end  

def etiquette
    @etiquette = "Report Etiquette"
  end

def security
    @security = "Security"
  end

def translation
    @translation = "Translation"
  end

def press
    @press = "Press"
  end 


def jobs
    @jobs = "Jobs"
  end  

  def faq
    @faq = "FAQ"
  end   

  def awards
    @awards = "Awards"
  end      
end

