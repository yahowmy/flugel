package test

import (
	"fmt"
	"testing"

	"github.com/gruntwork-io/terratest/modules/aws"
	"github.com/gruntwork-io/terratest/modules/random"
	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

func TestRecourcesProvisioning(f *testing.T) {
	f.Parallel()
	// Specify A Region And Names For Resourses For Provisioning
	approvedRegions := []string{"us-east-1"}
	awsRegion := aws.GetRandomRegion(f, approvedRegions, nil)
	expectedNameEC2 := fmt.Sprintf("Flugel-%s", random.UniqueId())
	expectedNameS3 := "flugel-bkt"
	terraformOptions := &terraform.Options{
		// The Path To Terrafom Code
		TerraformDir: "../",

		// Variables Will Be Passed To Terraform Code
		Vars: map[string]interface{}{
			"instance_name": expectedNameEC2,
			"s3_name":       expectedNameS3,
			"owner":         "InfraTeam",
		},
	}
	// After Retruning Funcion Destroy Deployment
	defer terraform.Destroy(f, terraformOptions)
	// Initilize And Apply Terraform Code
	terraform.InitAndApply(f, terraformOptions)
	actualInstanceId := []string{terraform.Output(f, terraformOptions, "instance_id")}
	actualBucketId := terraform.Output(f, terraformOptions, "bucket_id")

	// Check Resources By Lookingup Tags And Associated IDs
	tagName := "Name"

	exptectedInstanceId := aws.GetEc2InstanceIdsByTag(f, awsRegion, tagName, expectedNameEC2)
	expectedBucketID := aws.FindS3BucketWithTag(f, awsRegion, tagName, expectedNameS3)

	// Compare And Validate If It Match
	assert.Equal(f, exptectedInstanceId, actualInstanceId)
	assert.Equal(f, expectedBucketID, actualBucketId)

}
