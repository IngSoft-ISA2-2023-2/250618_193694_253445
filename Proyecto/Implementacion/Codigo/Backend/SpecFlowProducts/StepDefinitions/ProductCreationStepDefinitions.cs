using System;
using TechTalk.SpecFlow;

namespace SpecFlowProducts.StepDefinitions
{
    [Binding]
    public class ProductCreationStepDefinitions
    {
        [Given(@"the code (.*)")]
        public void GivenTheCode(int p0)
        {
            throw new PendingStepException();
        }

        [Given(@"the name ""([^""]*)""")]
        public void GivenTheName(string p0)
        {
            throw new PendingStepException();
        }

        [Given(@"the description  ""([^""]*)""")]
        public void GivenTheDescription(string p0)
        {
            throw new PendingStepException();
        }

        [Given(@"the price (.*)")]
        public void GivenThePrice(Decimal p0)
        {
            throw new PendingStepException();
        }

        [When(@"the data is introduced")]
        public void WhenTheDataIsIntroduced()
        {
            throw new PendingStepException();
        }

        [When(@"press the create button")]
        public void WhenPressTheCreateButton()
        {
            throw new PendingStepException();
        }

        [Then(@"the product should be registered correctly")]
        public void ThenTheProductShouldBeRegisteredCorrectly()
        {
            throw new PendingStepException();
        }
    }
}
