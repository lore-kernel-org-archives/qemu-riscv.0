Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1ABBC87FCB
	for <qemu-riscv@archiver.kernel.org>; Tue, 12 Aug 2025 17:03:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1ulsOO-0004dQ-NW; Tue, 12 Aug 2025 13:02:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ulsOK-0004bv-CY
 for qemu-riscv@nongnu.org; Tue, 12 Aug 2025 13:02:29 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ulsOF-00089L-BC
 for qemu-riscv@nongnu.org; Tue, 12 Aug 2025 13:02:28 -0400
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3b9141866dcso466074f8f.2
 for <qemu-riscv@nongnu.org>; Tue, 12 Aug 2025 10:02:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1755018139; x=1755622939; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dJY01AiwGpenoup2DC6cwZzWsgWRqxLsf1J5dtZCptc=;
 b=VIrL8hNm+lgWhclOEPpnklB6QP2lmDlb1Mw1irwl3MS1mkmmnCYwRch57hfKtaLXlc
 WqwNsGXw1qrKaYm/RF5SdoctwvndLNtAERg5nSCAdeUN9N+Xg2p1fBbiz1FzHnGzXrMl
 r6lhqxgL8Igud0kuKJRn0MbvQJJkvW2vYsuCKwTzNj3lsw5uJCcnMk+pXFxzlitWeorC
 30OGtH1Lz8EE+6lEpfvLCGkTXk03kG4Z5N+JXyN9mQuQA7SWiNtI8FpH8T1rzsgpWYY5
 Nv3/WkapmVsPBUUn/7c2xjzx3BmWMLaOM2j7qmJEsTNt7pcZSgsil5D93GpP4UouEnTj
 en3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755018139; x=1755622939;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dJY01AiwGpenoup2DC6cwZzWsgWRqxLsf1J5dtZCptc=;
 b=joAzpw0sINKfJ2YDwIPyMBXEYGGXnWdvrSO4YS19DR6iraiADTWgQVxQhWOYAsuxcs
 gStYUls3aNbjGcdEtN4cPGjv77fMOLd5OKoEDdAqVjn+iCtCFCw37eB+Ahl+Frpkm7oU
 jtn/iIUUhZwDs21VrFgZafDFlTmC3Y+jyfzIrBggdn48UiywSVQsoeEikNs3iwxYHF5Q
 dmL39pTyZmtBxAg0xYTVDif3MU0lMIsU4M+dQ2CLggrtARJp39nJnMNRBVWVrf1/XHYQ
 asMriW7AZbTAwHBXEdYzEdVtOhPmieH2Udr+wM7S0UZ5bKPHWD/KIbiDjy1+GuqRcD4D
 bdMA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXGV9VeB2n63E18cF2qJl/9r68SsmB+RDu92QZgnV+DrO5zcKPElk7uXOnPFv7ZG9/gyUxpMeWKwkVb@nongnu.org
X-Gm-Message-State: AOJu0YypXRbLNSPX1n5PwDnW/icARD+92F8wwjo5CS49eTeN2QjstN3c
 CEb5Ri5uH5lIkc8k1tBs8BU8GksNNAO+mHzFZKP45wtd0dsRsCXS2Htum+Nh+ENk+as=
X-Gm-Gg: ASbGncvLbuQ8pN4BxFHTcf6+2NGPjVgbANJ8PPC3s/PdsSe0kyaecoEMmdDn4F6zPoG
 wLfGRC7ktQ7QU4ADxb3FLE0GqxnvtpLiCw5okReDaom923hmexTvLYXNdiR7nW7Y5CkURMomys4
 8ell71stQwTGt7YEGPD/KZggkgt/DaeC/4wIWokjWG/5mKTQPUHLjycfNrWqzl5sPIbKsgYc+Jk
 M4SMmLf78ZdzrTHjzx8MxgX0+5jVwboV5g4AE0PQF7iYTPLaT8Q+K0zjhQns7N3S0oSFJZycewi
 GH+IUMY0RCMouB+Q0n5K/1unjMWaiFw/XmG+ifHK5/cTOSK/8oJ1ACxe3RGBc2fQeQ873quQUVX
 xGiZoRXGS9kJpXFrlhvame19Logf5tW8G074NnN8rEWJDK+2F69MElGhJBe69W3e3z/YhZjJ8
X-Google-Smtp-Source: AGHT+IGfN6do/RZU+7MN5AJSRmaQ0spPgWUakyiB7qSGoVI/RQcgLmCUE5BLD6FnUt303XRbYtfukg==
X-Received: by 2002:a05:6000:40cd:b0:3b5:dd38:3523 with SMTP id
 ffacd0b85a97d-3b917246236mr128443f8f.8.1755018138720; 
 Tue, 12 Aug 2025 10:02:18 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-459e587e154sm328347905e9.27.2025.08.12.10.02.17
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 12 Aug 2025 10:02:17 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Guenter Roeck <linux@roeck-us.net>,
 Gustavo Romero <gustavo.romero@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-riscv@nongnu.org
Subject: [PULL 2/2] tests/functional: Test SPI-SD adapter without SD card
 connected
Date: Tue, 12 Aug 2025 19:02:14 +0200
Message-ID: <20250812170214.81484-1-philmd@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250812165642.81157-1-philmd@linaro.org>
References: <20250812165642.81157-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42f.google.com
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

SPI-SD adapter should be usable, even without any SD card
wired. Refactor test_riscv64_sifive_u_mmc_spi() to make it
more generic and add another test, inspired by this report:
https://lore.kernel.org/qemu-devel/5b2dc427-f0db-4332-a997-fe0c82415acd@roeck-us.net/

Inspired-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Gustavo Romero <gustavo.romero@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Tested-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20250812140415.70153-3-philmd@linaro.org>
---
 tests/functional/test_riscv64_sifive_u.py | 22 +++++++++++++++++-----
 1 file changed, 17 insertions(+), 5 deletions(-)

diff --git a/tests/functional/test_riscv64_sifive_u.py b/tests/functional/test_riscv64_sifive_u.py
index dc4cb8a4a96..358ff0d1f60 100755
--- a/tests/functional/test_riscv64_sifive_u.py
+++ b/tests/functional/test_riscv64_sifive_u.py
@@ -27,25 +27,37 @@ class SifiveU(LinuxKernelTest):
          'rootfs.ext2.gz'),
         'b6ed95610310b7956f9bf20c4c9c0c05fea647900df441da9dfe767d24e8b28b')
 
-    def test_riscv64_sifive_u_mmc_spi(self):
+    def do_test_riscv64_sifive_u_mmc_spi(self, connect_card):
         self.set_machine('sifive_u')
         kernel_path = self.ASSET_KERNEL.fetch()
         rootfs_path = self.uncompress(self.ASSET_ROOTFS)
 
         self.vm.set_console()
         kernel_command_line = (self.KERNEL_COMMON_COMMAND_LINE +
-                               'root=/dev/mmcblk0 rootwait '
                                'earlycon=sbi console=ttySIF0 '
-                               'panic=-1 noreboot')
+                               'root=/dev/mmcblk0 ')
         self.vm.add_args('-kernel', kernel_path,
-                         '-drive', f'file={rootfs_path},if=sd,format=raw',
                          '-append', kernel_command_line,
                          '-no-reboot')
+        if connect_card:
+            kernel_command_line += 'panic=-1 noreboot rootwait '
+            self.vm.add_args('-drive', f'file={rootfs_path},if=sd,format=raw')
+            pattern = 'Boot successful.'
+        else:
+            kernel_command_line += 'panic=0 noreboot '
+            pattern = 'Cannot open root device "mmcblk0" or unknown-block(0,0)'
+
         self.vm.launch()
-        self.wait_for_console_pattern('Boot successful.')
+        self.wait_for_console_pattern(pattern)
 
         os.remove(rootfs_path)
 
+    def test_riscv64_sifive_u_nommc_spi(self):
+        self.do_test_riscv64_sifive_u_mmc_spi(False)
+
+    def test_riscv64_sifive_u_mmc_spi(self):
+        self.do_test_riscv64_sifive_u_mmc_spi(True)
+
 
 if __name__ == '__main__':
     LinuxKernelTest.main()
-- 
2.49.0


