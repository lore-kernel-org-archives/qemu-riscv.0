Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFC80C61DB9
	for <qemu-riscv@archiver.kernel.org>; Thu, 27 Aug 2026 05:12:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wzSNv-0002eQ-Vd; Thu, 27 Aug 2026 01:10:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1wzSNu-0002dU-8m
 for qemu-riscv@nongnu.org; Thu, 27 Aug 2026 01:10:42 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1wzSNs-00044s-H6
 for qemu-riscv@nongnu.org; Thu, 27 Aug 2026 01:10:41 -0400
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-2d5cad1a6baso3602395ad.3
 for <qemu-riscv@nongnu.org>; Wed, 26 Aug 2026 22:10:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1787807439; x=1788412239; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=NK/DHlEW6EIk2cf6PmuhEA3oo9/juwtu7TT1AMLm/g0=;
 b=MN+PJrckJmToPiqCxsohwOw3lBpS5sIcJky5xGhi/Mpb9R3X/U3TBHdRVJjbB6+wLf
 zkQTLfdW38KjMbv86kEsaC8YvWoCDxBiKvfT4BFSRXUDzGhQP8L/NpjZmEoJOi11YCJl
 fV9kq4VK0Rq5c52LELAsTnFac8MXjXWHgn/e7rROyecQBySLecYiTIZm0Oqd6f81iFkC
 BaPOc6LHr5ejW2hZl5pbTKtM5xKFAW0f7Q0SA71guWyJIZqGrASchGhGyt1xRERphaE8
 btwB/EGm6uaL7L654ZTr1MA/vJt5Z3oRZvEVg2UCF2G29KdLSqkT9+pIuwPg4ALvYcUh
 XHjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787807439; x=1788412239;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=NK/DHlEW6EIk2cf6PmuhEA3oo9/juwtu7TT1AMLm/g0=;
 b=c47IKHfZgJLXzSFWqBuIRaGFs++0ur1hCAsYoWOcZZs6PvKx2Bjkx+U4l72QN2Nyh2
 Z0N8C+wiacIifr0y+nQwFecfbAs4jKtIvXkXEEi8hz0Kt9s6/F7p/mM8YtDI38V9ctUA
 f/8ZjzhkjBc34Vxkmpei3PqOoGMe6vUllX5H+HR8OnEXbaCLj5q2FqJVm3Xh5/w2Ppmp
 V2CH7gWrX1JLa3Ak5yOFZYvcXxXSb9U02QYWbyuX93+PkJlIL4ncuZi773Wpr001L0qG
 63xZckpEste+l+O+fFRKy/RNzj1e384Op0jtjHtRvmhdCQryqifIDyZ1ZgqNUZ1xEaDX
 gMnw==
X-Forwarded-Encrypted: i=1;
 AHgh+RprBaUo/15qFjB+6hBHBuim6Nqars7hZE00z8XJozd+eML2gByqaJ0IjkpkNSQ8CytIbnsm+Tvur5pp@nongnu.org
X-Gm-Message-State: AFuF++lSpCYg6yFVYQHRKVi8e4oUsxLzg7P4MG4OtfCCJA/q8hicriLt
 l33szYZGZMJwTzYvUzBHzrRP2RXeHvGrTf09JIPXHR1Nc5iPNwoutzzx
X-Gm-Gg: AR+sD12Ricd/oz7W5gOZvn01RxGw/iRNArvXquQUw+wD4vpsnXNOJZZF5RrkxEibG8g
 pySj6HtmTWAIyjMrnaX1ScxKb3NuZLdf0QgwYf1ujRpZ4LdV2qw6DFYZic4c0veEZclJQGxB7Ay
 /ALyG+GWdHL+bwywsKVPjb5uTvopwea7unKAzRQrHi3uPme1/OvdA4EZHApKtJTYbatb98Wtq/D
 juU7s6s6P+LlzCZres4iJjyRb1r86eYr6Et9VyW5G29qmrQf+LEtbF4xKruqsEHE0DFh19Y0OW7
 gVqHWXDdpbVOHAurSAozbYiFaSceghMK0O9vUGeSFanrYeCPAqd3Z01KId4GDrrVxglhneuK2Zt
 nqW3gf35QK3yisVG8QMvHrhcHaVR+Bi4s31uogpBQgC0cDJqpPNJGQVPcigRX9iuBrNLaE0Lv7M
 A2FF3qzjXL4UKyH5+9wqdqLXvqSsg9DKKjQjzaYe5nVCkIpGXs4W619M02BnYCAf/c/q/UdDec0
 HZGwLMTKI/0BM2jNP/Jyc03/uUc67QurZIjXS2+RyoV2URsT9N/UGYrZg3VKPaU9QL1cXgI2BUX
 ZMSs6MiXV8CC7Fefshqc
X-Received: by 2002:a17:90b:3b4b:b0:381:11eb:d78e with SMTP id
 98e67ed59e1d1-3966d8b6295mr25121340a91.14.1787807439137; 
 Wed, 26 Aug 2026 22:10:39 -0700 (PDT)
Received: from donnager-debian.. ([180.150.112.50])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-39670599275sm2210473a91.0.2026.08.26.22.10.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Aug 2026 22:10:38 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: Alistair Francis <alistair.francis@wdc.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, Weiwei Li <liwei1518@gmail.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
 Michael Ellerman <mpe@kernel.org>,
 Portia Stephens <portias@oss.tenstorrent.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org
Subject: [PATCH 04/12] tests/tcg/riscv64: Update semihosting linker script
Date: Thu, 27 Aug 2026 14:39:43 +0930
Message-ID: <20260827050953.67184-5-joel@jms.id.au>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260827050953.67184-1-joel@jms.id.au>
References: <20260827050953.67184-1-joel@jms.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=joel.stan@gmail.com; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.001,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

Keep the tests at the start of RAM but bound them with a MEMORY region,
and use this to define __stack_top, which the multiarch system test boot
code will use.

Add more sections generated by the test binaries so they are placed
explicitly.

Split text and data into separate rx/rw regions, instead of one rwx
region to avoid binutils warnings.

A -kernel boot jumps to the lowest loaded address rather than the ELF
entry point, so _start must be first in .text. Use a .text._start input
section to make that explicit.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 tests/tcg/riscv64/semihost.ld | 47 +++++++++++++++++++++++++++--------
 1 file changed, 36 insertions(+), 11 deletions(-)

diff --git a/tests/tcg/riscv64/semihost.ld b/tests/tcg/riscv64/semihost.ld
index a59cc56b289a..eff3701e4a19 100644
--- a/tests/tcg/riscv64/semihost.ld
+++ b/tests/tcg/riscv64/semihost.ld
@@ -1,21 +1,46 @@
+/*
+ * Linker script for the RISC-V system tests
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
 ENTRY(_start)
 
+MEMORY
+{
+    /*
+     * Virt machine, RAM starts at 2GB
+     *
+     * Separate sections for executable and writable data to avoid linker
+     * warnings.
+     */
+    TXT (rx) : ORIGIN = 0x80000000, LENGTH = 2M
+    DAT (rw) : ORIGIN = 0x80000000 + 2M, LENGTH = 2M
+}
+
 SECTIONS
 {
-    /* virt machine, RAM starts at 2gb */
-    . = 0x80000000;
     .text : {
+        *(.text._start)
         *(.text)
-    }
+    } > TXT
+
     .rodata : {
-        *(.rodata)
-    }
-    /* align r/w section to next 2mb */
-    . = ALIGN(1 << 21);
+        *(.rodata .rodata.*)
+        *(.eh_frame)
+    } > TXT
+
+    .got : {
+        *(.got .got.plt)
+    } > DAT
+
     .data : {
-        *(.data)
-    }
+        *(.data .data.* .sdata .sdata.*)
+    } > DAT
+
     .bss : {
-        *(.bss)
-    }
+        *(.bss .bss.* .sbss .sbss.*)
+    } > DAT
+
+    /* Stack grows down from the end of the data region */
+    __stack_top = ORIGIN(DAT) + LENGTH(DAT);
 }
-- 
2.47.3


