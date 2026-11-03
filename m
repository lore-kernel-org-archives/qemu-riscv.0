Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14F44606D804
	for <qemu-riscv@archiver.kernel.org>; Tue,  3 Nov 2026 07:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=theorem-dev.20260707.gappssmtp.com header.i=@theorem-dev.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=OtwnZFqd
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xO9AJ-00084M-0e; Tue, 03 Nov 2026 02:42:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tewaro@theorem.dev>)
 id 1xO9AH-00083T-4P
 for qemu-riscv@nongnu.org; Tue, 03 Nov 2026 02:42:41 -0500
Received: from mail-dy1-x1334.google.com ([2607:f8b0:4864:20::1334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tewaro@theorem.dev>)
 id 1xO9AF-0007Cs-BI
 for qemu-riscv@nongnu.org; Tue, 03 Nov 2026 02:42:40 -0500
Received: by mail-dy1-x1334.google.com with SMTP id
 5a478bee46e88-3514b90bb89so8011336eec.1
 for <qemu-riscv@nongnu.org>; Mon, 02 Nov 2026 23:42:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=theorem-dev.20260707.gappssmtp.com; s=20260707; t=1793691757; x=1794296557;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=DGbocG2kunxbYH9KyCsY8Tf5Tker7hhep++Euorkfbw=;
 b=OtwnZFqdqVnFIz6fhStFx78oDnH9HxZCud+gmu3dqR+dG/HEdgOj8bpZNzZggYpU+9
 0phSc8NE0KGPKAZaBA26PE816vcPmkXo8iS22Olm2upeW9WnZAgUiGuvlXnf8HYW0nnf
 aT8hBcM0jHBy5z6N8VHgg6Eh8gMculSIsFCrWgCZxb/6kqqYgb/qvb1+sW0YyrqEx94y
 Jk72yVIt3QmNaw7xKtP/gr0fhbmeoBespCeGmRpezDa1XpYsElhHQZyfu5f7P1yW+KPW
 WQASaj7ioE7uRS4Noq7BFrmtyHM1MtEvAgyK9qGaoNXj6m1UD58M+2cjAnsR/6Hg8z23
 9ttA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793691757; x=1794296557;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=DGbocG2kunxbYH9KyCsY8Tf5Tker7hhep++Euorkfbw=;
 b=pArKOQ0KTXcRQOpEz7s6xcNWrAvHosQpJlJoayYop0aubgovhutyFIYf8QURqbLJE9
 inKbJOvIydHjUB5wgOCugJ/TMuCBGwdK07Y00eZcmnwN3y1IDKltHtjm3A5mhS1GoGP7
 f+FSNiC+XkdBG44+Q385H7qnMDaN2193vfyn5z5WeEH8kO0mvMrLjMfKxxk8qVazLsV6
 OiCmEHdCwQ0U9Ja0lgAjM376wabEVe0+2LQ8dFm4i4QlEYpAKfvMFJBrYXDqXiS1aLL/
 8Pkie8S2YZF8Ub5QX+qbN8sHEfy1cH2AF6n+oFhYAa2MCBA810C7dlChxiR0bsfmIs7r
 d3Fw==
X-Forwarded-Encrypted: i=1;
 AKwUvByn5GEo9hYzn75LYlL/JCgGfWFklYhB9RO0pZfW2l0nxnnIGUfcgItJl+i70i1KNt0nCnfe+8zaDE0G@nongnu.org
X-Gm-Message-State: APuU4Z+cCwo7d4eDSLfmBoOkaf+xSqleSZqj4iKyNkEL+NyR/77vf8iV
 cYe7yIdSFatQoOic1dMR8QgqhybvYKF20PZJVa/H2soNqHZJTmgh2+yjacIy3l4pGHs=
X-Gm-Gg: AYBFou0p0moHHtpbTtQ94IYW0eWE30LVu3N1FYbMY1z6t1Utf8SzHawl7nqA1YHdJsW
 M7Myo624cVw2Fvdz040Xz9jNlFO0sdoW+V1uYA7Cb3Vjc5OK1AwlXBmE+3UrRbmkW3QCQ5Vd5mo
 5iCKgsS6e4F2mFrd+UECswGG7JVoY29jBYXB8mP9XaRltCkabhBurt/WslrU0J35Cxi315HiZSG
 y8Ywf4G6KOy0R/qa0NDxO3SAU9G6+yo+Qs7g6Gp5Iahy9biNRH8NXLqKaWgrKSPJ9BmriLkCU6E
 UlX9dzSW2lGMhBKZSN+oCjSHJejcm+kR/g34JzoAeHpPHyUXSMxE7cFBDCxPcrunQ/wxVUi8AB6
 efrLOHf4Oie+DB6CP8slmS5LZULC4K0O0n/jM1byMLYsn1jI5sgrYe1gEuiAde8AoyI4T4kPSao
 74EQ6lyP6KiTdx375BykBMP04HHzzx89xIWSuG93jHJuW0y6EAM+OVHYGVQzbNJ0c/tY2JGtqgc
 Xip0PY1vDg1wslCu6lq+JFx6TLIwtXIZ0hgQnq4LuSci1H356FGTQgugWYiSzn7ZKeDSZF5ha80
 jk70bxNYGEL3Czsd4nh0iWqAfff7pU80R28qBET4a5QOgF+CFGj5QC39FshZNNsPiUgd+VTp
X-Received: by 2002:a05:7301:714:b0:35d:7565:8577 with SMTP id
 5a478bee46e88-36a6524b024mr8543370eec.15.1793691756453; 
 Mon, 02 Nov 2026 23:42:36 -0800 (PST)
Received: from tewaros-MacBook-Pro.local
 ([2601:647:6300:1230:9da3:3d82:7292:c937])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-36a428af1easm38953001eec.5.2026.11.02.23.42.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Nov 2026 23:42:35 -0800 (PST)
From: tewaro <tewaro@theorem.dev>
To: qemu-devel@nongnu.org
Cc: disclosures@theorem.dev, tewaro <tewaro@tewaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>,
 qemu-riscv@nongnu.org (open list:RISC-V TCG CPUs)
Subject: [PATCH 2/2] tests/tcg/riscv64: test mstatus.GVA on traps into M-mode
Date: Mon,  2 Nov 2026 23:42:14 -0800
Message-ID: <ca62cad0fd9d3f57f20624e11da8e10cf84028b2.1793677944.git.tewaro@theorem.dev>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1793677945.git.tewaro@theorem.dev>
References: <cover.1793677945.git.tewaro@theorem.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1334;
 envelope-from=tewaro@theorem.dev; helo=mail-dy1-x1334.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Every trap into M-mode writes mstatus.GVA. If mtval holds a guest virtual
address then mstatus.GVA should be 1 otherwise it should be 0.

test-mstatus-gva checks 4 cases:

  case     access  from
  -------  ------  ----
  load     ld      VS
  load-vu  ld      VU
  hlv      hlv.d   HS
  hsv      hsv.d   HS

Each case makes a guest-page fault and checks that GVA is 1. It then
runs an ecall in M-mode, whose trap has no guest address, and checks
that GVA is 0. Without the previous patch QEMU fails all 4:

- load and load-vu: GVA stays 1 after the ecall
- hlv and hsv: GVA is 0 after the fault

Each case is its own test, built with the -D flags listed in
meson.build, and exits with 0 or the number of the first check that
failed. It uses hyp-guest.h and hyp-guest.S from the previous series.

Signed-off-by: tewaro <tewaro@theorem.dev>
---
 tests/tcg/riscv64/system/meson.build | 21 ++++++++
 tests/tcg/riscv64/test-mstatus-gva.S | 75 ++++++++++++++++++++++++++++
 2 files changed, 96 insertions(+)
 create mode 100644 tests/tcg/riscv64/test-mstatus-gva.S

diff --git a/tests/tcg/riscv64/system/meson.build b/tests/tcg/riscv64/system/meson.build
index 05ed8b4c8f..e1c478196b 100644
--- a/tests/tcg/riscv64/system/meson.build
+++ b/tests/tcg/riscv64/system/meson.build
@@ -130,6 +130,27 @@ foreach name, flags : gstage_tinst
   }
 endforeach
 
+# test-mstatus-gva.S: one build per case; the flags are documented there
+mstatus_gva = {
+  'load':      ['-DMODE=VS', '-DACCESS=ld t0, 0(a0)', '-DREG=3',
+                '-DFLAGS=PTE_R', '-DCAUSE=LOAD_GPF'],
+  'load-vu':   ['-DMODE=VU', '-DACCESS=ld t0, 0(a0)', '-DREG=4',
+                '-DFLAGS=(PTE_R|PTE_U)', '-DCAUSE=LOAD_GPF'],
+  'hlv':       ['-DMODE=HS', '-DACCESS=hlv.d t0, (a0)', '-DREG=5',
+                '-DFLAGS=PTE_R', '-DCAUSE=LOAD_GPF'],
+  'hsv':       ['-DMODE=HS', '-DACCESS=hsv.d zero, (a0)', '-DREG=6',
+                '-DFLAGS=(PTE_R|PTE_W|PTE_A)', '-DCAUSE=STORE_GPF'],
+}
+foreach name, flags : mstatus_gva
+  tests += {
+    'test-mstatus-gva.S': {
+      'exe_name': 'test-mstatus-gva-' + name,
+      'cflags': cflags + ['-march=rv64gch', hyp_guest] + flags,
+      'qemu_args': ['-cpu', 'rv64,h=true,svadu=true', qemu_args],
+    }
+  }
+endforeach
+
 tests += {
   'test-vle32ff.S': {
     'cflags': cflags + ['-march=rv64gcv'],
diff --git a/tests/tcg/riscv64/test-mstatus-gva.S b/tests/tcg/riscv64/test-mstatus-gva.S
new file mode 100644
index 0000000000..ec8b6df25a
--- /dev/null
+++ b/tests/tcg/riscv64/test-mstatus-gva.S
@@ -0,0 +1,75 @@
+/*
+ * Test that every trap into M-mode writes mstatus.GVA: 1 if mtval holds
+ * a guest virtual address, 0 otherwise.
+ *
+ * Each build is one case, set by -D flags in meson.build:
+ * - MODE: VS, VU or HS (HS runs hlv/hsv on the guest's behalf)
+ * - ACCESS: the instruction run on the start of region REG
+ * - REG: the region accessed
+ * - FLAGS: the guest's page-table entry for REG, with A or D clear, so
+ *   that the walk's A/D write faults on the read-only G-stage
+ * - CAUSE: the fault expected
+ *
+ * The trap handler checks, and the exit status is the first that fails:
+ *   1  mcause is CAUSE
+ *   2  GVA is 1, since mtval holds the guest address
+ *   3  after an ecall from M-mode, whose trap has no guest address, GVA
+ *      is 0
+ *
+ * `trap` makes checks 1 and 2, then runs the ecall, whose trap goes to
+ * `ecall_trap` for check 3.
+ *
+ * Privileged ISA v1.12: 8.2.1.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+#include "hyp-guest.h"
+
+/* exit with status n unless reg == want */
+#define CHECK(n, reg, want) li t6, want; li a0, n; bne reg, t6, exit
+
+/* read mstatus.GVA into t5 */
+#define MSTATUS_GVA_SHIFT 38
+#define GVA csrr t5, mstatus; srli t5, t5, MSTATUS_GVA_SHIFT; andi t5, t5, 1
+
+        .option norvc
+        .text
+        .global test, trap, hs_trap
+test:
+        li      t0, VS_L1 + (REG) * 8   /* the guest's entry for REG */
+        li      t1, leaf(REGION(REG), FLAGS)
+        sd      t1, 0(t0)
+        li      a0, G_RO
+        call    set_tables_perm
+
+        li      a0, REGION(REG)
+        lla     a1, probe
+        li      a2, MODE
+        call    run_guest
+
+probe:
+        ACCESS
+        ecall
+
+        .balign 4
+trap:
+        csrr    t5, mcause
+        CHECK(1, t5, CAUSE)
+        GVA
+        CHECK(2, t5, 1)
+        lla     t0, ecall_trap          /* the ecall below traps there */
+        csrw    mtvec, t0
+        ecall
+
+        .balign 4
+ecall_trap:
+        GVA
+        CHECK(3, t5, 0)
+        li      a0, 0
+        j       exit
+
+/* nothing is delegated to HS-mode, so no trap should come here */
+        .balign 4
+hs_trap:
+        li      a0, 1
+        j       exit
-- 
2.54.0 (Apple Git-157)


