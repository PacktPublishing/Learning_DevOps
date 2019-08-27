using RimDev.AspNetCore.FeatureFlags;

namespace appFeatureFlags.Models
{
    public class ShowBoxHome : Feature
    {
        public override string Description { get; } = "Show the home center box.";
    }
}