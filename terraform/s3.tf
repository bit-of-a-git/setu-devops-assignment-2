resource "aws_s3_bucket" "scripts" {
  bucket_prefix = var.append_string
}

resource "aws_s3_bucket_public_access_block" "allow_public_access" {
  bucket                  = aws_s3_bucket.scripts.id
  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_policy" "allow_public_access" {
  bucket = aws_s3_bucket.scripts.id
  policy = data.aws_iam_policy_document.allow_public_get.json
}

data "aws_iam_policy_document" "allow_public_get" {
  statement {
    principals {
      type        = "*"
      identifiers = ["*"]
    }

    actions = [
      "s3:GetObject",
    ]

    resources = [
      aws_s3_bucket.scripts.arn,
      "${aws_s3_bucket.scripts.arn}/*",
    ]
  }
}

resource "aws_s3_object" "script" {
  bucket = aws_s3_bucket.scripts.id
  key    = "custom-metrics.sh"
  source = "user-data/custom-metrics.sh"
  etag   = filemd5("user-data/custom-metrics.sh")
}