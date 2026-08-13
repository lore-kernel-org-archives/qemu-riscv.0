Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9D63C5B572
	for <qemu-riscv@archiver.kernel.org>; Thu, 13 Aug 2026 04:14:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wuMpX-0000Q2-JN; Thu, 13 Aug 2026 00:14:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fritchleybohrer@gmail.com>)
 id 1wuMpT-0000Pa-FT
 for qemu-riscv@nongnu.org; Thu, 13 Aug 2026 00:14:08 -0400
Received: from mail-pz2-x00.google.com ([2607:f8b0:4864:3b::])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <fritchleybohrer@gmail.com>)
 id 1wuMpQ-0000Rf-Ur
 for qemu-riscv@nongnu.org; Thu, 13 Aug 2026 00:14:06 -0400
Received: by mail-pz2-x00.google.com with SMTP id
 41be03b00d2f7-ca92f36c4acso523261a12.1
 for <qemu-riscv@nongnu.org>; Wed, 12 Aug 2026 21:14:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1786594441; x=1787199241; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=3XrzIrA1JuucWpBjA8Dkb9lEhb/qMMWIJ3x1kaDWT+c=;
 b=j25KtU4AAY/a1HhNtG+CVXbFZtxZzIQEhilhbfoKA/N5BdDRmolIcwy/JTedHb6rN0
 fMvKQFf7zaepkbPpRYrqmqQjNutdI9o5fxzVeqPQzejs1XoDzIJaDrrVQ4P+VWTo3UUD
 isJZjpfQ2qa/Z3qaN9aplm/yDzJFD6t7MrXAV3l9fTSyAKNap2bPKXOahaedqSwdME86
 w6gXN6pjJICCAXZotyuj9otANAhHLZ7ifJdjzIMsxTDcUrVfOBBOxYtbvX1gh1nxwjky
 t4Lhrn0VKp/aAXsi1YadyZCSDQEbCRj0/RFDNv3rr0hL3hH/OKqW8C7DCbBKJQ4Fim7q
 9hXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786594441; x=1787199241;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=3XrzIrA1JuucWpBjA8Dkb9lEhb/qMMWIJ3x1kaDWT+c=;
 b=LTAG7yOw6HE6OHOaMg87R6UCa6LABfxga3MTaECA2X3J08zzaeZkC+NiyVHtdcEQFN
 gktTNyJ8/7YhIri/rwSpsiRbdD0gFrBjGX21rz6FJC0RlHJgeweDwF4M/LsaE4ApVjyk
 pEls5mzwbscD7s4Le6YxUBgTfkSTzJoHNJIuLu5Dkd+SomweUL0xMOoddKLiJC0gup5J
 6zeyAUbkje/TvIsCqPaynXkMMjDgnt3CqLBEhL7Z3zhSDGFzK3NkGJsmPs0Ktr/QNTNs
 2qrCnWOqvFU7BYBEGlqp6vEb7fNoPMqsgzgOsN6CMx8CtoBnaIc6PdKafE6Lmmt77eLg
 md2Q==
X-Gm-Message-State: AOJu0YyPirZtW/jAWepsnmfjWZpAwOnmPrHhAFYEu8ABmijQb4hz63Mw
 Ss+Ij47G1klr8SNM778FeP++dntCkzuTH3anq65O3FvRctN/n5+OVJRQ
X-Gm-Gg: AR+sD10/+0b/+ItF2FRl1Hk9GHur+83KGxMQwxc7YK2QFroyabjUlGMlbCVpS6yIC/C
 qIHZ81IvOoD7OghXXUQ+5dB4g2nMFBigletybT24AsVXWIXt23v7RjznttalZnAlnv9/fe3x87Z
 +BCw+on5weyvNf1VoYcySv7nSVfKXbd9RYdUMEYAR/dxeTJ4YxPoQ6JxRNmZczi3Vwy/tcu+TFp
 dxgPRY1+cjG5qgRV2JF5NTg0rCDTIx/aFTZHYUHEjKzk5dyDbOORhHynOY8yGMPDx2GdA3LAktm
 k3UrEoavKXm38v9aqCK/R1QgWVzu4ElwMFwBWf/kduFd0sBpv9Do4F7q+h0lA7kMgcOVwRT8NEs
 AH3vlcJqNDbB3rPl97xkC6peU7Z3U1yNa2nseFGTacJlhe339M3ugqRlikBA9L9KS11662ZCm97
 3+Q5RC8bmUnW8zqxEG+tVjiZ9uxYe7wpLh+5Lbt7nGFZSGnMM/hyuCp10YtIF72p2GcQnq6ykut
 OcATv6GSHDTt7KW
X-Received: by 2002:a05:6a00:331b:b0:84c:1cd2:142e with SMTP id
 d2e1a72fcca58-84fc6e04488mr3122453b3a.23.1786594440970; 
 Wed, 12 Aug 2026 21:14:00 -0700 (PDT)
Received: from Dell-WorkStation.localdomain ([149.118.62.92])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-cbef5cc4c9dsm423483a12.0.2026.08.12.21.13.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Aug 2026 21:14:00 -0700 (PDT)
From: Zephyr Li <fritchleybohrer@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, palmer@dabbelt.com, alistair.francis@wdc.com,
 liwei1518@gmail.com, daniel.barboza@oss.qualcomm.com,
 zhiwei_liu@linux.alibaba.com, chao.liu@processmission.com,
 Zephyr Li <fritchleybohrer@gmail.com>
Subject: [PATCH] target/riscv: reject FMV.X.W and FMV.W.X with Zfinx
Date: Thu, 13 Aug 2026 12:13:03 +0800
Message-ID: <20260813041304.7618-1-fritchleybohrer@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:3b::;
 envelope-from=fritchleybohrer@gmail.com; helo=mail-pz2-x00.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

Zfinx excludes FMV.X.W and FMV.W.X, but QEMU currently accepts both
instructions when Zfinx is enabled without the F extension.

Require the F extension for these instructions so they raise an illegal
instruction exception on Zfinx-only CPUs.

Add TCG regression tests for both instructions.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/4108
Signed-off-by: Zephyr Li <fritchleybohrer@gmail.com>
---
 target/riscv/tcg/insn_trans/trans_rvf.c.inc |  4 +--
 tests/tcg/riscv64/Makefile.target           | 10 +++++++
 tests/tcg/riscv64/test-zfinx-fmv-w-x.S      | 33 +++++++++++++++++++++
 tests/tcg/riscv64/test-zfinx-fmv-x-w.S      | 33 +++++++++++++++++++++
 4 files changed, 78 insertions(+), 2 deletions(-)
 create mode 100644 tests/tcg/riscv64/test-zfinx-fmv-w-x.S
 create mode 100644 tests/tcg/riscv64/test-zfinx-fmv-x-w.S

diff --git a/target/riscv/tcg/insn_trans/trans_rvf.c.inc b/target/riscv/tcg/insn_trans/trans_rvf.c.inc
index e935523c93..70c66e9e25 100644
--- a/target/riscv/tcg/insn_trans/trans_rvf.c.inc
+++ b/target/riscv/tcg/insn_trans/trans_rvf.c.inc
@@ -428,7 +428,7 @@ static bool trans_fmv_x_w(DisasContext *ctx, arg_fmv_x_w *a)
 {
     /* NOTE: This was FMV.X.S in an earlier version of the ISA spec! */
     REQUIRE_FPU;
-    REQUIRE_ZFINX_OR_F(ctx);
+    REQUIRE_EXT(ctx, RVF);
 
     TCGv dest = dest_gpr(ctx, a->rd);
     TCGv_i64 src1 = get_fpr_hs(ctx, a->rs1);
@@ -531,7 +531,7 @@ static bool trans_fmv_w_x(DisasContext *ctx, arg_fmv_w_x *a)
 {
     /* NOTE: This was FMV.S.X in an earlier version of the ISA spec! */
     REQUIRE_FPU;
-    REQUIRE_ZFINX_OR_F(ctx);
+    REQUIRE_EXT(ctx, RVF);
 
     TCGv_i64 dest = dest_fpr(ctx, a->rd);
     TCGv src = get_gpr(ctx, a->rs1, EXT_ZERO);
diff --git a/tests/tcg/riscv64/Makefile.target b/tests/tcg/riscv64/Makefile.target
index 4da5b9a3b3..23e1152a10 100644
--- a/tests/tcg/riscv64/Makefile.target
+++ b/tests/tcg/riscv64/Makefile.target
@@ -18,3 +18,13 @@ TESTS += test-fcvtmod
 test-fcvtmod: CFLAGS += -march=rv64imafdc
 test-fcvtmod: LDFLAGS += -static
 run-test-fcvtmod: QEMU_OPTS += -cpu rv64,d=true,zfa=true
+
+TESTS += test-zfinx-fmv-x-w
+test-zfinx-fmv-x-w: LDFLAGS = -nostdlib -static
+run-test-zfinx-fmv-x-w: QEMU_OPTS += \
+	-cpu rv64,f=false,d=false,zfa=false,zfh=false,zfhmin=false,zfinx=true
+
+TESTS += test-zfinx-fmv-w-x
+test-zfinx-fmv-w-x: LDFLAGS = -nostdlib -static
+run-test-zfinx-fmv-w-x: QEMU_OPTS += \
+	-cpu rv64,f=false,d=false,zfa=false,zfh=false,zfhmin=false,zfinx=true
diff --git a/tests/tcg/riscv64/test-zfinx-fmv-w-x.S b/tests/tcg/riscv64/test-zfinx-fmv-w-x.S
new file mode 100644
index 0000000000..73c5c2b2bf
--- /dev/null
+++ b/tests/tcg/riscv64/test-zfinx-fmv-w-x.S
@@ -0,0 +1,33 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+#include <asm/unistd.h>
+
+        .text
+        .globl  _start
+_start:
+        .option norvc
+
+        li      a0, 4
+        la      a1, sa
+        li      a2, 0
+        li      a3, 8
+        li      a7, __NR_rt_sigaction
+        scall
+
+        .word   0xf0030453
+
+        li      a0, 1
+        j       exit
+
+pass:
+        li      a0, 0
+
+exit:
+        li      a7, __NR_exit
+        scall
+
+        .data
+        .type   sa, @object
+        .size   sa, 32
+sa:
+        .dword  pass
+        .zero   24
diff --git a/tests/tcg/riscv64/test-zfinx-fmv-x-w.S b/tests/tcg/riscv64/test-zfinx-fmv-x-w.S
new file mode 100644
index 0000000000..c4e853036f
--- /dev/null
+++ b/tests/tcg/riscv64/test-zfinx-fmv-x-w.S
@@ -0,0 +1,33 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+#include <asm/unistd.h>
+
+        .text
+        .globl  _start
+_start:
+        .option norvc
+
+        li      a0, 4
+        la      a1, sa
+        li      a2, 0
+        li      a3, 8
+        li      a7, __NR_rt_sigaction
+        scall
+
+        .word   0xe0030453
+
+        li      a0, 1
+        j       exit
+
+pass:
+        li      a0, 0
+
+exit:
+        li      a7, __NR_exit
+        scall
+
+        .data
+        .type   sa, @object
+        .size   sa, 32
+sa:
+        .dword  pass
+        .zero   24
-- 
2.43.0


