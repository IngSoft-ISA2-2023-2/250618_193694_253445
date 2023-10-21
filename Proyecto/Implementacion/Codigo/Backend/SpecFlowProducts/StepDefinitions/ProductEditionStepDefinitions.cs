using System;
using TechTalk.SpecFlow;

namespace SpecFlowProducts.StepDefinitions
{
    [Binding]
    public class ProductEditionStepDefinitions
    {
        [Given(@"the product ""([^""]*)"" is entered into the system of ""([^""]*)""")]
        public void GivenTheProductIsEnteredIntoTheSystemOf(string p0, string p1)
        {
            throw new PendingStepException();
        }

        [When(@"I select the product")]
        public void WhenISelectTheProduct()
        {
            throw new PendingStepException();
        }

        [When(@"I press the ""([^""]*)"" button")]
        public void WhenIPressTheButton(string modify)
        {
            throw new PendingStepException();
        }

        [Then(@"I should be redirected to a modification page")]
        public void ThenIShouldBeRedirectedToAModificationPage()
        {
            throw new PendingStepException();
        }

        [Then(@"I should be able to modify the name to ""([^""]*)"" and the description to ""([^""]*)""")]
        public void ThenIShouldBeAbleToModifyTheNameToAndTheDescriptionTo(string p0, string p1)
        {
            throw new PendingStepException();
        }

        [When(@"I press the ""([^""]*)"" button")]
        public void WhenIPressTheButton(string save)
        {
            throw new PendingStepException();
        }

        [Then(@"I should see a message that says ""([^""]*)""")]
        public void ThenIShouldSeeAMessageThatSays(string p0)
        {
            throw new PendingStepException();
        }
    }
}
