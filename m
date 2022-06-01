Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nwWGI-000364-3X
	for mharc-qemu-riscv@gnu.org; Wed, 01 Jun 2022 17:52:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <christophm30@gmail.com>)
 id 1nwWGG-00035l-By; Wed, 01 Jun 2022 17:52:16 -0400
Received: from mail-ej1-f51.google.com ([209.85.218.51]:42694)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <christophm30@gmail.com>)
 id 1nwWGD-0006bv-BG; Wed, 01 Jun 2022 17:52:15 -0400
Received: by mail-ej1-f51.google.com with SMTP id q1so6370768ejz.9;
 Wed, 01 Jun 2022 14:52:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QVXZ7+0gxaO8zbxOhTyIgE1+yDt0Hkw/teavgv/nUDU=;
 b=x8BqbXrfFDhq+IZw88dNtnK6Pui3ceRkmOeqNdecpU9hH+65z5EckQCXtojrSWhfft
 sSlgn240vYoabWYOYJtDvOvwukqn1h7KB+DrV7o9Q1Ujlc9f5d1LHJ9nr2F0uIBvsFEa
 NrU+eMMsGkGN0xlDclZgGwDkkCAJ+LKD0Mj1xzwkfBodCdFzHLGIf4gdhoKhwnChRLb+
 nz+UFwLeUilOS09kZeBa3KHOAeYcTdTETGnW2gvCa5vGJwFiQG4hyhdoEOkLq50ge66O
 YGR6Ai5EE6d85Ps1YQU3Oxk7gMZL7+PRjPK/P9eVcBGBt2+HMkZ30c2CxJ8jAKI5qNWs
 VYZg==
X-Gm-Message-State: AOAM533x7fI8Sy08gdkkCmq3QbRQ9MPNViY+s0n1M9BGAVlDgQKN47+J
 OKI5XzHxmUbdIGaSrYQ2lxE=
X-Google-Smtp-Source: ABdhPJyRyxqolyBJtoRl4wcuP1Aqr0mJYDXhSPwW/xkxF4NVrLZwBrMqAgHefj+FAnimEyC/DY751g==
X-Received: by 2002:a17:907:7b8a:b0:707:59d4:14a3 with SMTP id
 ne10-20020a1709077b8a00b0070759d414a3mr1471830ejc.51.1654120331594; 
 Wed, 01 Jun 2022 14:52:11 -0700 (PDT)
Received: from beast.fritz.box (62-178-148-172.cable.dynamic.surfer.at.
 [62.178.148.172]) by smtp.gmail.com with ESMTPSA id
 z18-20020a1709063ad200b00703671ebe65sm1099887ejd.198.2022.06.01.14.52.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jun 2022 14:52:11 -0700 (PDT)
From: Christoph Muellner <cmuellner@gcc.gnu.org>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Philipp Tomsich <philipp.tomsich@vrull.eu>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko.stuebner@vrull.eu>,
 Aaron Durbin <adurbin@rivosinc.com>
Cc: Christoph Muellner <christoph.muellner@vrull.eu>
Subject: [RFC PATCH] RISC-V: Add Zawrs ISA extension support
Date: Wed,  1 Jun 2022 23:51:28 +0200
Message-Id: <20220601215128.3983712-1-cmuellner@gcc.gnu.org>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=209.85.218.51;
 envelope-from=christophm30@gmail.com; helo=mail-ej1-f51.google.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-List-Received-Date: Wed, 01 Jun 2022 21:52:16 -0000

From: Christoph Muellner <christoph.muellner@vrull.eu>

This patch adds support for the Zawrs ISA extension.
Given the current (incomplete) implementation of reservation sets
there seems to be no way to provide a full emulation of the WRS
instruction (wake on reservation set invalidation or timeout or
interrupt). Therefore, we just pretend that an interrupt occured,
exit the execution loop and finally continue execution.

The specification can be found here:
https://github.com/riscv/riscv-zawrs/blob/main/zawrs.adoc

Note, that the Zawrs extension is not frozen or ratified yet.
Therefore this patch is an RFC and not intended to get merged.

Signed-off-by: Christoph Muellner <christoph.muellner@vrull.eu>
---
 target/riscv/cpu.c                          |  1 +
 target/riscv/cpu.h                          |  1 +
 target/riscv/insn32.decode                  |  3 ++
 target/riscv/insn_trans/trans_rvzawrs.c.inc | 48 +++++++++++++++++++++
 target/riscv/translate.c                    |  1 +
 5 files changed, 54 insertions(+)
 create mode 100644 target/riscv/insn_trans/trans_rvzawrs.c.inc

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index a91253d4bd..3b43e5a03d 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -877,6 +877,7 @@ static Property riscv_cpu_properties[] = {
     DEFINE_PROP_BOOL("svnapot", RISCVCPU, cfg.ext_svnapot, false),
     DEFINE_PROP_BOOL("svpbmt", RISCVCPU, cfg.ext_svpbmt, false),
 
+    DEFINE_PROP_BOOL("zawrs", RISCVCPU, cfg.ext_zawrs, true),
     DEFINE_PROP_BOOL("zba", RISCVCPU, cfg.ext_zba, true),
     DEFINE_PROP_BOOL("zbb", RISCVCPU, cfg.ext_zbb, true),
     DEFINE_PROP_BOOL("zbc", RISCVCPU, cfg.ext_zbc, true),
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index f08c3e8813..2ef2efe22e 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -380,6 +380,7 @@ struct RISCVCPUConfig {
     bool ext_h;
     bool ext_j;
     bool ext_v;
+    bool ext_zawrs;
     bool ext_zba;
     bool ext_zbb;
     bool ext_zbc;
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 4033565393..ce20eab738 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -111,6 +111,9 @@ wfi         0001000    00101 00000 000 00000 1110011
 sfence_vma  0001001    ..... ..... 000 00000 1110011 @sfence_vma
 sfence_vm   0001000    00100 ..... 000 00000 1110011 @sfence_vm
 
+# *** Zawrs Instruction Extension ***
+wrs         000000010000     ..... 000 00000 1110011 @sfence_vm
+
 # *** RV32I Base Instruction Set ***
 lui      ....................       ..... 0110111 @u
 auipc    ....................       ..... 0010111 @u
diff --git a/target/riscv/insn_trans/trans_rvzawrs.c.inc b/target/riscv/insn_trans/trans_rvzawrs.c.inc
new file mode 100644
index 0000000000..38b71d0085
--- /dev/null
+++ b/target/riscv/insn_trans/trans_rvzawrs.c.inc
@@ -0,0 +1,48 @@
+/*
+ * RISC-V translation routines for the RISC-V Zawrs Extension.
+ *
+ * Copyright (c) 2022 Christoph Muellner, christoph.muellner@vrull.io
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2 or later, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+ * more details.
+ *
+ * You should have received a copy of the GNU General Public License along with
+ * this program.  If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#define REQUIRE_ZAWRS(ctx) do {         \
+    if (!ctx->cfg_ptr->ext_zawrs) {     \
+        return false;                   \
+    }                                   \
+} while (0)
+
+static bool trans_wrs(DisasContext *ctx, arg_sfence_vm *a)
+{
+    REQUIRE_ZAWRS(ctx);
+
+    /*
+     * We may continue if one or more of the following conditions are met:
+     * a) reservation set is invalid
+     * b) rs1 != 0 and X(rs1) < time CSR
+     * c) interrupt observed
+     *
+     * A reservation set can be invalidated by any store to a reserved
+     * memory location. However, that's currently not implemented in QEMU.
+     * So let's just exit the CPU loop and pretend that an interrupt occured.
+     */
+
+    /* Clear the load reservation  (if any).  */
+    tcg_gen_movi_tl(load_res, -1);
+
+    gen_set_pc_imm(ctx, ctx->pc_succ_insn);
+    tcg_gen_exit_tb(NULL, 0);
+    ctx->base.is_jmp = DISAS_NORETURN;
+
+    return true;
+}
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 55a4713af2..3f0140d124 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -1005,6 +1005,7 @@ static uint32_t opcode_at(DisasContextBase *dcbase, target_ulong pc)
 #include "insn_trans/trans_rvh.c.inc"
 #include "insn_trans/trans_rvv.c.inc"
 #include "insn_trans/trans_rvb.c.inc"
+#include "insn_trans/trans_rvzawrs.c.inc"
 #include "insn_trans/trans_rvzfh.c.inc"
 #include "insn_trans/trans_rvk.c.inc"
 #include "insn_trans/trans_privileged.c.inc"
-- 
2.35.3


