using NUnit.Framework;
using OpenQA.Selenium;
using OpenQA.Selenium.Chrome;
using OpenQA.Selenium.Support.Extensions;

namespace seleinum_tests;
public class seleinumTests

{
    // [Test]
    
    // public void FirstTest()
    // {
        // IWebDriver driver = new ChromeDriver();
        // driver.Navigate().GoToUrl("https://www.google.com");
        // // Assert.That(driver.Title.Equals("Google"));
        // driver.Quit();
         private IWebDriver driver;

        [SetUp]
        public void Setup()
        {
            // Initialize the ChromeDriver
            driver = new ChromeDriver();
        }

        [Test]
        public void GoogleSearchTest()
        {
            // Navigate to Google
            driver.Navigate().GoToUrl("https://www.google.com");
            Console.WriteLine("Hi");
            // Find the search box
            // var searchBox = driver.FindElement(By.Name("q"));

            // // Type "Selenium" and submit
            // searchBox.SendKeys("Selenium");
            // searchBox.Submit();

            // Wait for the results page to load and display the results
            // var wait = new WebDriverWait(driver, TimeSpan.FromSeconds(10));
            // wait.Until(d => d.Title.StartsWith("Selenium", StringComparison.OrdinalIgnoreCase));

            // Assert that the title is correct
            // Assert(driver.Title.Contains("Google"));
        }

        [TearDown]
        public void TearDown()
        {
            // Close the browser
            driver.Quit();
        }
    
    // }
}
