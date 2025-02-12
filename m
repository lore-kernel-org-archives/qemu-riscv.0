Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2E06C02198
	for <qemu-riscv@archiver.kernel.org>; Wed, 12 Feb 2025 11:29:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tiArN-0006Ej-Ij; Wed, 12 Feb 2025 06:24:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tiArM-0006EQ-P3
 for qemu-riscv@nongnu.org; Wed, 12 Feb 2025 06:24:52 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tiArK-0004bV-Tt
 for qemu-riscv@nongnu.org; Wed, 12 Feb 2025 06:24:52 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4364a37a1d7so65792875e9.3
 for <qemu-riscv@nongnu.org>; Wed, 12 Feb 2025 03:24:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739359489; x=1739964289; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HDiUYtW4nbeConrg8Jrfqgn2X4rVVAY8PB/0AQkGf9s=;
 b=i9VmA+CofWfKWjkM/4+NQyGkXKDLc2OJkF5bxGNPcAJdokYFSqKE+A4VSfzmEILW6L
 AAcP4T/ZGjlNTi0Z8VLkyS4F7/hSgkmQPEAh7tikMaxQDwUnn/iUK75vQlX8uGk4w3DF
 /6BFDNFspzKtk3ncSaCXahkPWouJWAWZIkATMsTgAOC9FnMzKLP5sXly6tS7zcTxZjlh
 DSnd2PWC4K1TUzTqOGaW9BqQTPBGMn+gXPTjxUA2hRrT45kcREfRwV7sPB95zCDDi5qV
 n12mq5dKE/CLEwzYKoxDZoQCgYuGfAQCprs7hF3y6w68fyCPNJv3OvHZemVdhk+IOoAY
 JUfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739359489; x=1739964289;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HDiUYtW4nbeConrg8Jrfqgn2X4rVVAY8PB/0AQkGf9s=;
 b=h9ohSN2TCRXBl4ngG5lnZCMqcN/BGoZHiR59awa6XNGyazEOUY2KFD942K/WB/qEQQ
 Wblx2xlGmVv+rnW6GDcvmxRf4WZ0dfwdEL7XJlX/uQkKbgnHFoDKUBPP4mSt5oGEFAbb
 gAPfjejP5LvQKVJnexzZjitj4f6ZzUhxL/CKe0W0tyUwImD0+51xlEEHliPStI7Coxt0
 PxQzEdQ5DpdpqzwHhxhxiwLqBx+UUqDti0bwjiJAdecXL8bokMg1KLGah6voCYI22WPo
 WZdLCh7Xn5OnTpoLqj400Mtfc/Yzl0jZvozLksmbN+T+DfpVPQOVH5aA52nDxscBceIN
 Y+Xw==
X-Gm-Message-State: AOJu0YxLECknJgSWzcd+NVNgpW6NkB7LlY331EKbirIRMUO4qXZWnPdf
 uBLmbDcs+6s842zSUFaZPMbheap3tEoSJFub8okLy4/lUSzb0OpJkuyi2T0BJxU=
X-Gm-Gg: ASbGncv0rVNZcVplF/vrKDehcJAm/xd3flX5vY1qKlQAaufXlYU1Okc2PwM7ldhzL7x
 UfdCt3FZV3IQm6x/faasIo813y4Y7fmmhEz/UBHNVT623wGZBX0VYhd4sPj0cDFbOeVX4OLUo19
 o8X5y++ZD50FM7/blaT/fhY4AtTIRYOBqcEO8Or2+kM9gGD+kiOe8r17xryvUVIPM5Fa1pd73jN
 7OevCcim+ZXaEQjSOaawRxPRTZRj4Fr20pC/i97T+1MU265uw3jyBOagdbdcBWYxmg8AjuPccG6
 fvStI2k4w8uQ7mYbs8v9CWXgWmaGp1s2ZhIYu7/MKymzmkLIl+nsaHjQsZJSOZqaQw==
X-Google-Smtp-Source: AGHT+IHC9Rrj6mXZiuOj3Xlz3xYstvoW79pNbZ/H4fScs3Ispv4S9TaW/75lEEBmhLyHOzX57AASuw==
X-Received: by 2002:a5d:5f50:0:b0:38c:5bb2:b932 with SMTP id
 ffacd0b85a97d-38dea25918amr2224245f8f.3.1739359489363; 
 Wed, 12 Feb 2025 03:24:49 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38dbf6e4a4bsm17005739f8f.92.2025.02.12.03.24.48
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 12 Feb 2025 03:24:48 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-ppc@nongnu.org,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v6 07/11] tests/functional: Avoid using
 www.qemu-advent-calendar.org URL
Date: Wed, 12 Feb 2025 12:24:09 +0100
Message-ID: <20250212112413.37553-8-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250212112413.37553-1-philmd@linaro.org>
References: <20250212112413.37553-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

Avoid fetching assets from www.qemu-advent-calendar.org
website, prefer fetching microblaze assets from GitLab servers.

Suggested-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 tests/functional/test_microblazeel_s3adsp1800.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tests/functional/test_microblazeel_s3adsp1800.py b/tests/functional/test_microblazeel_s3adsp1800.py
index c382afe6bfa..5bf94d88dd8 100755
--- a/tests/functional/test_microblazeel_s3adsp1800.py
+++ b/tests/functional/test_microblazeel_s3adsp1800.py
@@ -18,7 +18,8 @@ class MicroblazeelMachine(QemuSystemTest):
     timeout = 90
 
     ASSET_IMAGE = Asset(
-        ('http://www.qemu-advent-calendar.org/2023/download/day13.tar.gz'),
+        ('https://qemu-advcal.gitlab.io/qac-best-of-multiarch/download/'
+         'day05.tar.xz'),
         'b9b3d43c5dd79db88ada495cc6e0d1f591153fe41355e925d791fbf44de50c22')
 
     def test_microblazeel_s3adsp1800(self):
-- 
2.47.1


