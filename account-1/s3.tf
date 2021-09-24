resource "aws_s3_bucket" "pipeline" {
  bucket_prefix = "${var.project_name}-pipeline"
  acl           = "private"
  force_destroy = true # This should NEVER be used in a production environment
}

data "aws_iam_policy_document" "s3_pipeline" {
  statement {
    effect = "Allow"
    principals {
      type = "AWS"
      identifiers = [
        "arn:aws:iam::${data.aws_caller_identity.current.account_id}:root",
      ]
    }
    actions = [
      "s3:Get*",
      "s3:ListBucket",
      "s3:Put*"
    ]
    resources = [
      aws_s3_bucket.pipeline.arn,
      "${aws_s3_bucket.pipeline.arn}/*"
    ]
  }
}

resource "aws_s3_bucket_policy" "pipeline" {
  bucket = aws_s3_bucket.pipeline.id

  policy = data.aws_iam_policy_document.s3_pipeline.json
}

resource "aws_s3_bucket" "website" {
  bucket_prefix = "${var.project_name}-website"
  acl           = "public-read"
  force_destroy = true # This should NEVER be used in a production environment

  website {
    index_document = "index.html"
    error_document = "error.html"
  }
}

data "aws_iam_policy_document" "s3_website" {
  statement {
    effect = "Allow"
    principals {
      type = "AWS"
      identifiers = [
        "*",
      ]
    }
    actions = [
      "s3:GetObject",
    ]
    resources = [
      "${aws_s3_bucket.website.arn}/*"
    ]
  }
}

resource "aws_s3_bucket_policy" "website" {
  bucket = aws_s3_bucket.website.id

  policy = data.aws_iam_policy_document.s3_website.json
}

output "website_url" {
  value = "http://${aws_s3_bucket.website.website_endpoint}"
}
