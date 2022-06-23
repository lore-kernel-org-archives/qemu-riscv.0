Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1o4Oli-0004oR-HU
	for mharc-qemu-riscv@gnu.org; Thu, 23 Jun 2022 11:29:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1o4Olg-0004hp-9C
 for qemu-riscv@nongnu.org; Thu, 23 Jun 2022 11:29:16 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:38820)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1o4Old-0000nH-VE
 for qemu-riscv@nongnu.org; Thu, 23 Jun 2022 11:29:15 -0400
Received: by mail-ej1-x62d.google.com with SMTP id g26so20443842ejb.5
 for <qemu-riscv@nongnu.org>; Thu, 23 Jun 2022 08:29:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vrull.eu; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nEzd1OkHXALFs2+t+auxmaBYlb2T72zt8vvCbuAM+jU=;
 b=n8RK/48PSv8ZcpFtQ79T52l50lyDTbsWZYPH+PTBYjYuVlHM/gnXZiZW6z9bju8yNZ
 8pbLmUrHD0pkB2PNeK0sobAVIQe8VT511gmPH0Crx8aUyiIArZLXq82H2sThrKp8mSAR
 ci/YeNWQWpsLn6u/k/BJhnMSFu3qnWjyp4iN1DqZSctlDaExFS2IxvaqpcBGZWuw0yvz
 SfzOaIKY2FszzHyNjZ25Og+i3iZZnUDyEyo3esXp1GG16TQyRlumh2kOgfs0hNZeCz0G
 mLRRVdZx+DVqb0eed9MG5/9VZxPJVi+xqwvRkqfzIY4mcg8CFEmOHK0a/DyxmXROxt4m
 MuBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nEzd1OkHXALFs2+t+auxmaBYlb2T72zt8vvCbuAM+jU=;
 b=jq72ZCNsVF2K7hHAvf1GNzxtKxFr0vTKito2SzcK6gxULRA9OXwI34gbdzIRvpMo+S
 rI9vL70aSfY11a/8Q2oIXJG1TSVG7wugRPfx4JmBZybEIFpSmIWWx4e/rzn4zB/WNcFO
 X5rpYvK4x0qCpGJXdTpBhuYblfXCVtAfe1xIfN7nqhIzzIwkyI+DAqBnyFY2qkD6FGkM
 jlLRjM8hHKQler6U0xWss0gMLakgTaYEz9z5+JpJc3aB/0nqaN0vkPC9weXgdNzAAHLy
 mLUleH2BpkCYb/mwpPysHf3unM0Gejn1BGgGk1o2fye+3HAWx2dlA6c5Bkzxz1JXlWiJ
 bVcw==
X-Gm-Message-State: AJIora/wyGPK/lGfSf5S0LDjK/66zzCUQkAspi5eoP/pYd0vhhfddbHJ
 eP0yfxQ+1Ugc9KzK/KXo9bPtbeZoJoNNlgaj
X-Google-Smtp-Source: AGRyM1vHE8y4szuJJizZGi0e1eOIM01DYQ+l+xm/urmOsvB2u6dJePA4ptIgTvvEsfRMCaUY7fc3hg==
X-Received: by 2002:a17:906:d552:b0:722:f60d:7b6f with SMTP id
 cr18-20020a170906d55200b00722f60d7b6fmr7746315ejc.717.1655998151474; 
 Thu, 23 Jun 2022 08:29:11 -0700 (PDT)
Received: from beast.fritz.box (62-178-148-172.cable.dynamic.surfer.at.
 [62.178.148.172]) by smtp.gmail.com with ESMTPSA id
 fy11-20020a1709069f0b00b007104b37aab7sm10505554ejc.106.2022.06.23.08.29.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jun 2022 08:29:11 -0700 (PDT)
From: Christoph Muellner <christoph.muellner@vrull.eu>
To: qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko.stuebner@vrull.eu>,
 Aaron Durbin <adurbin@rivosinc.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Richard Henderson <richard.henderson@linaro.org>
Cc: Christoph Muellner <christoph.muellner@vrull.eu>
Subject: [RFC PATCH v3] RISC-V: Add Zawrs ISA extension support
Date: Thu, 23 Jun 2022 17:29:07 +0200
Message-Id: <20220623152907.1606964-1-christoph.muellner@vrull.eu>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=christoph.muellner@vrull.eu; helo=mail-ej1-x62d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 23 Jun 2022 15:29:16 -0000

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

Changes since v2:
* Adjustments according to a specification change
* Inline REQUIRE_ZAWRS() since it has only one user

Changes since v1:
* Adding zawrs to the ISA string that is passed to the kernel

Signed-off-by: Christoph Müllner <christoph.muellner@vrull.eu>
---
 target/riscv/cpu.c                          |  2 +
 target/riscv/cpu.h                          |  1 +
 target/riscv/insn32.decode                  |  4 ++
 target/riscv/insn_trans/trans_rvzawrs.c.inc | 54 +++++++++++++++++++++
 target/riscv/translate.c                    |  1 +
 5 files changed, 62 insertions(+)
 create mode 100644 target/riscv/insn_trans/trans_rvzawrs.c.inc

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 05e6521351..6cb00fadff 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -882,6 +882,7 @@ static Property riscv_cpu_extensions[] = {
     DEFINE_PROP_BOOL("Counters", RISCVCPU, cfg.ext_counters, true),
     DEFINE_PROP_BOOL("Zifencei", RISCVCPU, cfg.ext_ifencei, true),
     DEFINE_PROP_BOOL("Zicsr", RISCVCPU, cfg.ext_icsr, true),
+    DEFINE_PROP_BOOL("zawrs", RISCVCPU, cfg.ext_zawrs, true),
     DEFINE_PROP_BOOL("Zfh", RISCVCPU, cfg.ext_zfh, false),
     DEFINE_PROP_BOOL("Zfhmin", RISCVCPU, cfg.ext_zfhmin, false),
     DEFINE_PROP_BOOL("Zve32f", RISCVCPU, cfg.ext_zve32f, false),
@@ -1075,6 +1076,7 @@ static void riscv_isa_string_ext(RISCVCPU *cpu, char **isa_str, int max_str_len)
         ISA_EDATA_ENTRY(zicsr, ext_icsr),
         ISA_EDATA_ENTRY(zifencei, ext_ifencei),
         ISA_EDATA_ENTRY(zmmul, ext_zmmul),
+        ISA_EDATA_ENTRY(zawrs, ext_zawrs),
         ISA_EDATA_ENTRY(zfh, ext_zfh),
         ISA_EDATA_ENTRY(zfhmin, ext_zfhmin),
         ISA_EDATA_ENTRY(zfinx, ext_zfinx),
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 7d6397acdf..a22bc0fa09 100644
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
index 4033565393..513ea227fe 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -711,6 +711,10 @@ vsetvli         0 ........... ..... 111 ..... 1010111  @r2_zimm11
 vsetivli        11 .......... ..... 111 ..... 1010111  @r2_zimm10
 vsetvl          1000000 ..... ..... 111 ..... 1010111  @r
 
+# *** Zawrs Standard Extension ***
+wrs_nto    000000001101 00000 000 00000 1110011
+wrs_sto    000000011101 00000 000 00000 1110011
+
 # *** RV32 Zba Standard Extension ***
 sh1add     0010000 .......... 010 ..... 0110011 @r
 sh2add     0010000 .......... 100 ..... 0110011 @r
diff --git a/target/riscv/insn_trans/trans_rvzawrs.c.inc b/target/riscv/insn_trans/trans_rvzawrs.c.inc
new file mode 100644
index 0000000000..d0df56378e
--- /dev/null
+++ b/target/riscv/insn_trans/trans_rvzawrs.c.inc
@@ -0,0 +1,54 @@
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
+static bool trans_wrs(DisasContext *ctx)
+{
+    if (!ctx->cfg_ptr->ext_zawrs) {
+        return false;
+    }
+
+    /*
+     * We may continue if one or more of the following conditions are met:
+     * a) The reservation set is invalid
+     * b) If WRS.STO, a short time since start of stall has elapsed
+     * c) An interrupt is observed
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
+
+#define GEN_TRANS_WRS(insn)						\
+static bool trans_ ## insn(DisasContext *ctx, arg_ ## insn *a)		\
+{									\
+	(void)a;							\
+	return trans_wrs(ctx);						\
+}
+
+GEN_TRANS_WRS(wrs_nto)
+GEN_TRANS_WRS(wrs_sto)
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index b151c20674..a4f07d5166 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -1007,6 +1007,7 @@ static uint32_t opcode_at(DisasContextBase *dcbase, target_ulong pc)
 #include "insn_trans/trans_rvh.c.inc"
 #include "insn_trans/trans_rvv.c.inc"
 #include "insn_trans/trans_rvb.c.inc"
+#include "insn_trans/trans_rvzawrs.c.inc"
 #include "insn_trans/trans_rvzfh.c.inc"
 #include "insn_trans/trans_rvk.c.inc"
 #include "insn_trans/trans_privileged.c.inc"
-- 
2.35.3


