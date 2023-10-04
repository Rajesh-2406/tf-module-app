resource "aws_iam_policy" "policy" {
  name        = "${var.component}-${var.env}-ssm-pm-policy"
  path        = "/"
  description = "${var.component}-${var.env}-ssm-pm-policy"

  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Sid" : "VisualEditor0",
        "Effect" : "Allow",
        "Action" : [
          "ssm:GetParameterHistory",
          "ssm:GetParametersByPath",
          "ssm:GetParameters",
          "ssm:GetParameter",
          "kms:Decrypt"
        ],
        "Resource" : concat([
          "arn:aws:kms:us-east-1:765371225572:parameter/roboshop.${var.env}.${var.component}.*",
          "arn:aws:kms:us-east-1:765371225572:parameter/roboshop.nexus.*",
          var.kms_arn
          ], var.extra_param_access)
      }
    ]
  })
}

resource  "aws_iam_role"  "role"  {
  name = "${var.component}-${var.env}-ec2-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })
}

resource "aws_iam_instance_profile" "instance_profile"  {
  name  = "${var.component}-${var.env}-ec2-role"
  role  = aws_iam_role.role.name
}

resource  "aws_iam_role_policy_attachment"  "policy-attach"  {
  role  = aws_iam_role.role.name
  policy_arn = aws_iam_policy.policy.arn
}
