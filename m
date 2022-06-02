Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nwl3v-0000it-PK
	for mharc-qemu-riscv@gnu.org; Thu, 02 Jun 2022 09:40:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <christophm30@gmail.com>)
 id 1nwl3r-0000dC-0R; Thu, 02 Jun 2022 09:40:28 -0400
Received: from mail-ed1-f49.google.com ([209.85.208.49]:33518)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <christophm30@gmail.com>)
 id 1nwl3p-000329-1k; Thu, 02 Jun 2022 09:40:26 -0400
Received: by mail-ed1-f49.google.com with SMTP id h19so6358665edj.0;
 Thu, 02 Jun 2022 06:40:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dUtX2s1hponGE8H1/inVIifaAayO7ThUjcnQ90lUoUs=;
 b=wSd3Fu7l69La3lhhvq6zfBRxA6MLD1srExf0/cm+SQKqZ2E9un94j4KPIhABL8FuEh
 lHLXSEQeogHcn2HMzLX35iRHCc1D2h/VXsqjDCE1xRPpCzH3ppmrehbl48OEoXFPSs01
 /z9kt2bCqhtMmdEVMqqtrvJRTuUhvJ7ma8ZG/24c32lbcoPfeyiLPsP3DfPVIv/l0jwg
 910syBOmYUlEu2vn8VbdhZliyDw7wsQrOG8Y8jlQ639Wvvl3VuULTio/c5wYB5RFQSEU
 8gh5LWSn11u6JzdSt4S0cqgGeXMkJ2YGMODkAGTeJkjvcPTIYvkycQvSwUyQY9uIXL6r
 h9SA==
X-Gm-Message-State: AOAM530xnTKbnS92DmvQPnpD/tNuwcLlCJDDSP2hR9BCqJQWBUPKOGEk
 QwgfcEb4r0xIsUN737HsL1E=
X-Google-Smtp-Source: ABdhPJx+vPjOA3YLFmgZ7z+6XXmuFLb5lbH1H0qgu047Ev6GdHW+hF4+5l1uY0l/hB3MKczqpyePfw==
X-Received: by 2002:a05:6402:1692:b0:42d:e291:67f3 with SMTP id
 a18-20020a056402169200b0042de29167f3mr5389637edv.392.1654177222836; 
 Thu, 02 Jun 2022 06:40:22 -0700 (PDT)
Received: from beast.fritz.box (62-178-148-172.cable.dynamic.surfer.at.
 [62.178.148.172]) by smtp.gmail.com with ESMTPSA id
 j1-20020a508a81000000b0042aca5edba7sm2580630edj.57.2022.06.02.06.40.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jun 2022 06:40:20 -0700 (PDT)
From: Christoph Muellner <cmuellner@gcc.gnu.org>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Philipp Tomsich <philipp.tomsich@vrull.eu>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko.stuebner@vrull.eu>,
 Aaron Durbin <adurbin@rivosinc.com>
Cc: Christoph Muellner <christoph.muellner@vrull.eu>
Subject: [RFC PATCH v2] RISC-V: Add Zawrs ISA extension support
Date: Thu,  2 Jun 2022 15:40:17 +0200
Message-Id: <20220602134017.155357-1-cmuellner@gcc.gnu.org>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=209.85.208.49;
 envelope-from=christophm30@gmail.com; helo=mail-ed1-f49.google.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-List-Received-Date: Thu, 02 Jun 2022 13:40:28 -0000

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

Changes since v1:
* Adding zawrs to the ISA string that is passed to the kernel

Signed-off-by: Christoph Muellner <christoph.muellner@vrull.eu>
---
 target/riscv/cpu.c                          |  2 +
 target/riscv/cpu.h                          |  1 +
 target/riscv/insn32.decode                  |  3 ++
 target/riscv/insn_trans/trans_rvzawrs.c.inc | 48 +++++++++++++++++++++
 target/riscv/translate.c                    |  1 +
 5 files changed, 55 insertions(+)
 create mode 100644 target/riscv/insn_trans/trans_rvzawrs.c.inc

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index a91253d4bd..95858f04bd 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -877,6 +877,7 @@ static Property riscv_cpu_properties[] = {
     DEFINE_PROP_BOOL("svnapot", RISCVCPU, cfg.ext_svnapot, false),
     DEFINE_PROP_BOOL("svpbmt", RISCVCPU, cfg.ext_svpbmt, false),
 
+    DEFINE_PROP_BOOL("zawrs", RISCVCPU, cfg.ext_zawrs, true),
     DEFINE_PROP_BOOL("zba", RISCVCPU, cfg.ext_zba, true),
     DEFINE_PROP_BOOL("zbb", RISCVCPU, cfg.ext_zbb, true),
     DEFINE_PROP_BOOL("zbc", RISCVCPU, cfg.ext_zbc, true),
@@ -1031,6 +1032,7 @@ static void riscv_isa_string_ext(RISCVCPU *cpu, char **isa_str, int max_str_len)
     struct isa_ext_data isa_edata_arr[] = {
         ISA_EDATA_ENTRY(zicsr, ext_icsr),
         ISA_EDATA_ENTRY(zifencei, ext_ifencei),
+        ISA_EDATA_ENTRY(zawrs, ext_zawrs),
         ISA_EDATA_ENTRY(zfh, ext_zfh),
         ISA_EDATA_ENTRY(zfhmin, ext_zfhmin),
         ISA_EDATA_ENTRY(zfinx, ext_zfinx),
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


