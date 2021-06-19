using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using OpenQA.Selenium;
using OpenQA.Selenium.Chrome;

namespace selenium
{
    [TestClass]
    public class UnitTest
    {
        private IWebDriver test_driver;
        [TestMethod]
        public void TestSite()
        {
            test_driver = new ChromeDriver();
            test_driver.Navigate().GoToUrl("https://docs.microsoft.com/en-us/learn/certifications/exams/az-400");
            Assert.IsTrue(test_driver.Title.Contains("AZ-400"));
            test_driver.Quit();
        }
    }
}
