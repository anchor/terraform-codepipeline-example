resource "aws_iam_role" "codepipeline" {
  name = "${var.project_name}-codepipeline"

  assume_role_policy = data.aws_iam_policy_document.codepipeline_assume.json
}

data "aws_iam_policy_document" "codepipeline_assume" {
  statement {
    effect = "Allow"
    principals {
      type = "Service"
      identifiers = [
        "codepipeline.amazonaws.com",
      ]
    }
    actions = [
      "sts:AssumeRole"
    ]
  }
}

resource "aws_iam_role_policy" "codepipeline" {
  name = "${var.project_name}-codepipeline"
  role = aws_iam_role.codepipeline.id

  policy = data.aws_iam_policy_document.codepipeline.json
}

data "aws_iam_policy_document" "codepipeline" {
  statement {
    effect = "Allow"
    actions = [
      "s3:*",
      "codecommit:ListBranches",
      "codecommit:ListRepositories"
    ]
    resources = [
      aws_s3_bucket.pipeline.arn,
      "${aws_s3_bucket.pipeline.arn}/*",
      aws_s3_bucket.website.arn,
      "${aws_s3_bucket.website.arn}/*",
    ]
  }
  statement {
    effect = "Allow"
    actions = [
      "codecommit:*"
    ]
    resources = [
      aws_codecommit_repository.pipeline.arn,
      "${aws_codecommit_repository.pipeline.arn}/*",
    ]
  }
  statement {
    effect = "Allow"
    actions = [
      "logs:Create*",
      "logs:FilterLogEvents",
      "logs:Put*"
    ]
    resources = ["*"]
  }
}
