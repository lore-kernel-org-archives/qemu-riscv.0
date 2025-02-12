Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 937AEC021A1
	for <qemu-riscv@archiver.kernel.org>; Wed, 12 Feb 2025 11:26:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tiAs4-0006ro-N9; Wed, 12 Feb 2025 06:25:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tiArW-0006Lr-OW
 for qemu-riscv@nongnu.org; Wed, 12 Feb 2025 06:25:03 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tiArP-0004cn-Pp
 for qemu-riscv@nongnu.org; Wed, 12 Feb 2025 06:25:01 -0500
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-38de1a5f039so2479973f8f.2
 for <qemu-riscv@nongnu.org>; Wed, 12 Feb 2025 03:24:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739359494; x=1739964294; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=F/5SvI1nZOETAaAlXL8oDs7D5HNrYsWDKjSPJuAoVFY=;
 b=JpWyRONXR10L1q5TXKiHCGj/zhqn4YTScOazJYL5vZFa1eAUWnTkamZEvtf+T7cEvl
 uZXvagF2F3ZKjNxrBMV206fZM2KD2ug7520QBr6+WTmqXpQdMxjFFuVNOdlSXX7SDZZ3
 FnMkJpO4TsbfkKMff5DnfGNjZQPCi0W6epgPBflXTaKs1ggLSeVxIkERofi6ObEI6a9K
 Y3JraFm1ZYKDN+HwW7C9flqj3hmFVjXWeDkiIrLw91Ioc7ng0e0qCIOyJPDEIOS/K8Az
 BDavkbQmCv0rMRTENjyLMJ+tqvgP5X+eI26Ams3UZEAygzh42UtsaLQFva/QkWT40otJ
 /bGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739359494; x=1739964294;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=F/5SvI1nZOETAaAlXL8oDs7D5HNrYsWDKjSPJuAoVFY=;
 b=JgodYI78OrHFIGQpW5w5dV91a8BSjECCt33ABsasgLQICZUDZY1z7xk4x9WFkxCxAD
 SXd4Nsq/f64AjW6iP0VlPLRZP41i7jjf8RfRnKLOAiwYe+Clt0ckRvgrtBOixA8jOg0L
 wa1lBhQ3ubiDYlfOJm8DzK0gut+YbcsqIw1EyJpFjo4YVSVxrWAYuyU3U2+kNsqyLNQl
 QPk+jeZuCQRCFmg/HQAqHj+XVjJFspisW3hIlmKkjVQj8xLZv1l2wIVo1kg2YoPYcPbK
 fkQPprmBNaz7N1UEcpdqp1nehc7lxDh7kkfNJ7h3BalDEvOksxLNHd1xiWmBtDwYgJ3C
 nSVg==
X-Gm-Message-State: AOJu0YwankH8GBwiuzTlpt6yUryt3/UoLpvOIt5I+k7QU4MJLobosyYC
 DSjuzbZljr5lXUOGRkvCJqq7MrN+eMrCpDvW1GWTSfhPmrC++R4iYOzJvvwiqtU=
X-Gm-Gg: ASbGncv+JNrG8ZUZucPwLS2sXPNASAAZTpcc02Bex1nsNtEho7Ux7ZlxmyXU61/gZih
 05b3aZ93Ciuy289lFDVYflE3UmWC4HBj0md0eCXSKfDtQmDOURN8JLL4ZSPBGqBfUexkyOIO7J4
 H5kIOOpdBirkgW4GqApbmumnBmI/sg720QxnB3N/xchHEgeUx9wSnJuCZb1Yl0gtRVi9KhR6tXL
 MxkEIz+iG42P1dx5of4GukKfdiMP0nlwjk1Z8CkxV0aQwpxe8z65XUEIsdc9pCaDtbz8CIGbunu
 FsLRmmMoaBzqyhevqCCQLc7I8Ar7S32pS1Q4Ov1BrvP5u9BskbyZRI82UoWyjssWEA==
X-Google-Smtp-Source: AGHT+IEHeqNbECF/bGwOcVXkIHKnTY6WV4Iu1MYIRZAHJtYo7S1q3MW1Fam/j5W+rZJYVnILrqOkHQ==
X-Received: by 2002:a5d:4c88:0:b0:38d:d93b:5899 with SMTP id
 ffacd0b85a97d-38dea266daamr1950525f8f.21.1739359494210; 
 Wed, 12 Feb 2025 03:24:54 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38dc9ef8ac6sm14517102f8f.27.2025.02.12.03.24.53
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 12 Feb 2025 03:24:53 -0800 (PST)
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
Subject: [PATCH v6 08/11] tests/functional: Explicit endianness of microblaze
 assets
Date: Wed, 12 Feb 2025 12:24:10 +0100
Message-ID: <20250212112413.37553-9-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250212112413.37553-1-philmd@linaro.org>
References: <20250212112413.37553-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

The archive used in test_microblaze_s3adsp1800.py (testing a
big-endian target) contains a big-endian kernel. Rename using
the _BE suffix.

Similarly, the archive in test_microblazeel_s3adsp1800 (testing
a little-endian target) contains a little-endian kernel. Rename
using _LE suffix.

These changes will help when adding cross-endian kernel tests.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20250206131052.30207-13-philmd@linaro.org>
---
 tests/functional/test_microblaze_s3adsp1800.py   | 6 +++---
 tests/functional/test_microblazeel_s3adsp1800.py | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/tests/functional/test_microblaze_s3adsp1800.py b/tests/functional/test_microblaze_s3adsp1800.py
index 2c4464bd05a..fac364b1ea9 100755
--- a/tests/functional/test_microblaze_s3adsp1800.py
+++ b/tests/functional/test_microblaze_s3adsp1800.py
@@ -15,14 +15,14 @@ class MicroblazeMachine(QemuSystemTest):
 
     timeout = 90
 
-    ASSET_IMAGE = Asset(
+    ASSET_IMAGE_BE = Asset(
         ('https://qemu-advcal.gitlab.io/qac-best-of-multiarch/download/'
          'day17.tar.xz'),
         '3ba7439dfbea7af4876662c97f8e1f0cdad9231fc166e4861d17042489270057')
 
-    def test_microblaze_s3adsp1800(self):
+    def test_microblaze_s3adsp1800_be(self):
         self.set_machine('petalogix-s3adsp1800')
-        self.archive_extract(self.ASSET_IMAGE)
+        self.archive_extract(self.ASSET_IMAGE_BE)
         self.vm.set_console()
         self.vm.add_args('-kernel',
                          self.scratch_file('day17', 'ballerina.bin'))
diff --git a/tests/functional/test_microblazeel_s3adsp1800.py b/tests/functional/test_microblazeel_s3adsp1800.py
index 5bf94d88dd8..ccebf5c2ce1 100755
--- a/tests/functional/test_microblazeel_s3adsp1800.py
+++ b/tests/functional/test_microblazeel_s3adsp1800.py
@@ -17,15 +17,15 @@ class MicroblazeelMachine(QemuSystemTest):
 
     timeout = 90
 
-    ASSET_IMAGE = Asset(
+    ASSET_IMAGE_LE = Asset(
         ('https://qemu-advcal.gitlab.io/qac-best-of-multiarch/download/'
          'day05.tar.xz'),
         'b9b3d43c5dd79db88ada495cc6e0d1f591153fe41355e925d791fbf44de50c22')
 
-    def test_microblazeel_s3adsp1800(self):
+    def test_microblazeel_s3adsp1800_le(self):
         self.require_netdev('user')
         self.set_machine('petalogix-s3adsp1800')
-        self.archive_extract(self.ASSET_IMAGE)
+        self.archive_extract(self.ASSET_IMAGE_LE)
         self.vm.set_console()
         self.vm.add_args('-kernel', self.scratch_file('day13', 'xmaton.bin'))
         tftproot = self.scratch_file('day13')
-- 
2.47.1


