using NUnit.Framework;
using System;
using OpenQA.Selenium;
using OpenQA.Selenium.Chrome;
using OpenQA.Selenium.Support.UI;
using SeleniumExtras.WaitHelpers;

namespace testselenium
{
    [TestFixture]
    public class tests
    {
        IWebDriver? driver;
		
        [SetUp]
        public void Setup()
        {
            // Set up the Chrome WebDriver
            driver = new ChromeDriver(@"C:\Driver");
            driver.Manage().Window.Maximize();
        }

        [Test]
        public void validateLaptopPrice()
        {
            // Navigate to Amazon.com
            driver.Navigate().GoToUrl("https://www.amazon.com/");

            //Applying Explicit Wait command to input captcha manually if appear 
            WebDriverWait wait = new WebDriverWait(driver, TimeSpan.FromSeconds(10));
            IWebElement ComposeButton = wait.Until(ExpectedConditions.ElementExists(By.Id("twotabsearchtextbox")));

            // Find the search text box and type "laptop"
            IWebElement searchTextBox = driver.FindElement(By.Id("twotabsearchtextbox"));
            searchTextBox.SendKeys("laptop");

            // Find and click the search button
            IWebElement searchButton = driver.FindElement(By.XPath("//input[@value='Go']"));
            searchButton.Click();

            // Find the first search result and click on it
            IWebElement firstResult = driver.FindElement(By.XPath("//div[@data-index='4']//h2/a"));
            firstResult.Click();

            // Wait for the page to load and find the laptop price element
            IWebElement laptopPriceElement = driver.FindElement(By.CssSelector("input[type='hidden'][id='twister-plus-price-data-price']"));
            string priceText = laptopPriceElement.GetAttribute("value");

            // Get the price text and convert it to a numerical value
            priceText = priceText.Replace("$", "").Replace(" ", "").Trim();
            Console.WriteLine("priceText equals to " + priceText);

            // Assert that the laptop price is more than $100
            if (double.TryParse(priceText, out double laptopPrice))
            {
                try
                {
                    Assert.Greater(laptopPrice, 100.0);
                    Assert.Pass();
                    Console.WriteLine("Assertion Passed!");
                }
                catch (AssertionException ex)
                {
                    Assert.Fail("Laptop price is less than $100.");
                    Console.WriteLine("Assertion failed: " + ex.Message);
                }
            }
            else
            {
                Assert.Fail("Could not convert laptop price to a numeric value.");
            }
        }

        [TearDown]
        public void TearDown()
        {
            // Close the browser
            driver.Quit();
        }
    }
}