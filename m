Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 222A0C021A1
	for <qemu-riscv@archiver.kernel.org>; Wed, 12 Feb 2025 12:42:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tiC2b-0007s7-Pc; Wed, 12 Feb 2025 07:40:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tiC03-0003iu-Kz
 for qemu-riscv@nongnu.org; Wed, 12 Feb 2025 07:37:58 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tiBzv-0000bZ-OX
 for qemu-riscv@nongnu.org; Wed, 12 Feb 2025 07:37:52 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4395f66a639so188125e9.0
 for <qemu-riscv@nongnu.org>; Wed, 12 Feb 2025 04:37:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739363856; x=1739968656; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GAgkBkMy3/LPbRfDSn29phwowCLY9R3s4x7aKYfP9pA=;
 b=XZk06a5LksGzrzvk05Zp1fCIsI092A2bH71fDhoRuICcOpTIEL2yC7DT6fat/cz/ss
 sRK/CIBl6cEj1RHqNaFJaOULFMrRXWJEnsdpWzJDnEzIM7enNzTzLZsqzpg3zzV9AI+S
 PUMuxomEkuUHmd6T+Apq1zqP7prGMxDxqX1v/b2biz+LExEW4+kVcKKt9NNDa/WyDgJW
 69/86ImH2V5wIRcBUmdUEO8HliUWmyTfziGHal1i3BG5mNW1+V/8AkKYpb6IVYkaTSCJ
 AE6rAjwoutTayUHmiUteKjPjtL2cwkm/aYwaSu6yv9L/0KrLph2igm4Rgd4hZBEV9gsh
 2UfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739363856; x=1739968656;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GAgkBkMy3/LPbRfDSn29phwowCLY9R3s4x7aKYfP9pA=;
 b=Yc+CdJqCTxgOrA2YFVMKDmWAClK9l3WrnHrOCE4KXxniwdMv8g7eqedvfB+9CwXNxN
 i6Dhqpk3HruEZADCpEkvrlmieKxum5iWjSA0sJWV9Iej9mkfK4gXCA3oEvq24Bsk7eJp
 aJSed1M9MivzMsTGF7XE5OvX2cwjDRMunpsL+dIXSOY/zVxXG73rwTvn9PDwS2TgqNzc
 u1pKYHG/xRWVkBUrQfXvaYkOtDBUo/WpguFJ7RjoMy0clhkhTS8BGv6pyevYUElpGpKm
 cR6Am6mYZbB+gKBbjy9kLseV+0w8q7gn22l4w3BjFPVKCY2FCLSwJ7b/dmtxSgs7LnC+
 KiWQ==
X-Gm-Message-State: AOJu0Yy1pmMWYk1ZIZ5QnkHgPci4wqjhrrlu9fLU/VgVKqWEuas3Nxww
 svsbzwz767I073MnuBT7+zFHkHFjmIcEcn8u0A+BcAiJGwszy+yYX2nR1UVJZk0=
X-Gm-Gg: ASbGncsUITREgFxSQxESq30BqtrR0hyztZRQxWRJf5lMvJu+xGef9Sjx2ShIyRJWBa3
 UC++UjGOG1NChjUoa8O01gSdButUWOkucaQCAhSPMrxMIo0/A2fO9NQwoevZ4ZRgpFjQFFmlcCJ
 Wrc47glKNNTq1ygt2JiPk/TDqcHHQfoD4rjE6+P1Uw64CnVgH3GJ1TQwNFG62oq6+5yOMbqy4QS
 P2soVslPr27DG9aNIKmSXoR6yUgmRI2onBdBSPo6lDLv5HQKvYl2Pso5QvQkvgXqDUpO5+qj1P8
 RMQvLpnqBUuP67RZXRFLyMbF7KfJ8jUTiEhR3amP3/WUJkdVrLx1nPZA48XSPA2dHQ==
X-Google-Smtp-Source: AGHT+IF7At452Rr3feUJrZiSpQS2eki09U9XbM54gBXTy60K55vFxNy33rLXERUYj0JVZXvt2XrZrA==
X-Received: by 2002:a05:600c:1c84:b0:434:fa55:eb56 with SMTP id
 5b1f17b1804b1-43958169fa4mr33286795e9.7.1739363855846; 
 Wed, 12 Feb 2025 04:37:35 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4395a056151sm19008975e9.16.2025.02.12.04.37.34
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 12 Feb 2025 04:37:35 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org,
 Sai Pavan Boddu <sai.pavan.boddu@amd.com>,
 Markus Armbruster <armbru@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v7 07/10] tests/functional: Explicit endianness of microblaze
 assets
Date: Wed, 12 Feb 2025 13:36:56 +0100
Message-ID: <20250212123659.52764-8-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250212123659.52764-1-philmd@linaro.org>
References: <20250212123659.52764-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
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
index c382afe6bfa..5d353dba5d2 100755
--- a/tests/functional/test_microblazeel_s3adsp1800.py
+++ b/tests/functional/test_microblazeel_s3adsp1800.py
@@ -17,14 +17,14 @@ class MicroblazeelMachine(QemuSystemTest):
 
     timeout = 90
 
-    ASSET_IMAGE = Asset(
+    ASSET_IMAGE_LE = Asset(
         ('http://www.qemu-advent-calendar.org/2023/download/day13.tar.gz'),
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


