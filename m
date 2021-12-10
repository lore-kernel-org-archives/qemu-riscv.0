Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mvaZW-0002FD-BD
	for mharc-qemu-riscv@gnu.org; Fri, 10 Dec 2021 02:44:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mvaZK-0002D6-FL
 for qemu-riscv@nongnu.org; Fri, 10 Dec 2021 02:43:51 -0500
Received: from [2607:f8b0:4864:20::42e] (port=44956
 helo=mail-pf1-x42e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mvaZF-0007qG-Rj
 for qemu-riscv@nongnu.org; Fri, 10 Dec 2021 02:43:50 -0500
Received: by mail-pf1-x42e.google.com with SMTP id k64so7713968pfd.11
 for <qemu-riscv@nongnu.org>; Thu, 09 Dec 2021 23:43:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=f1Xh43u43gxHXsAM6Z+6aL3HL0NKkyWsObrTBIQjcqk=;
 b=MFYQ2SV7OO2puBBwVv3owlKjTlfqtWyHStsfqnWuhTGsXz2IP+jwNFhJ9H5QTxOeK9
 ZgbjxGOOXYy7osc9e3UtiW4Cg1Ok6L3n7/B269/izEJ8oQIFv7Qn9o/ktpEdl5giYbwm
 2Fkoux5Z3iazzlrDxmsa59EiwXLf37IpcbFtWbRWXRApXa/YFU8kQ56RZAdwxdxF9mTy
 5iqV5/gf6kuTm+b/qy2u+wXlM/+Q3xYx5gZI0Mji05nKq6QXLNW844lWmxmO8eCLcwsh
 RcUaQKNfwPGVjPFuk5sveLAe/Tcx5jDUWqgtEXHki5radI9JxTbKT/99zQQLVjXibvND
 uV9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=f1Xh43u43gxHXsAM6Z+6aL3HL0NKkyWsObrTBIQjcqk=;
 b=ls6EKTKw/D40ii0tPh9rfxmFv8jbQoh7FO9NEA4fmi65DIg59ZZ6XmVEWYTgbXCeFb
 oaPlSRDngcZNCkD8wa3FSTwm/BTN4+GT8g+KuBEDpCW0WzlV23rHnffb6Qjc1mU1RvSu
 UU6YwzbNquU9suQU0g46JI4FpTgnND2GeuRUrltKbfTenDE1BwQEs4rgJOj3GWGbt2KJ
 0I4fl9xYXHWisa8q1MFSdp1ao1mlmrmhCa55XsxpsHJbAEdepZ2Z2eImcYWsseqx/w+V
 juaBMw5a4gQPEk2Zhoj5v9LJKOFTOEA8pfYmsSPs2yOzQDCW1bttv5pd3A6vB6KQaJzK
 OAAw==
X-Gm-Message-State: AOAM530D0cmWfsRWvQXNmffQzMK7xw7C1XvhgNUviaVJO1eQN6lTQuz3
 XHoY6AWEvvfU+Rc3Y9dBiYL/qQ==
X-Google-Smtp-Source: ABdhPJwvsQKxcXzw2NxsJacrQm+OsciegkJHvdIuByoHLZGFwHeK6ACCr3HsoAvU3Gh8D+OH95LrDg==
X-Received: by 2002:a63:474c:: with SMTP id w12mr28901012pgk.179.1639122224322; 
 Thu, 09 Dec 2021 23:43:44 -0800 (PST)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id g17sm1737704pgh.46.2021.12.09.23.43.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Dec 2021 23:43:44 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Kito Cheng <kito.cheng@sifive.com>,
 Chih-Min Chao <chihmin.chao@sifive.com>,
 Frank Chang <frank.chang@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>
Subject: [PATCH v6 1/8] target/riscv: zfh: half-precision load and store
Date: Fri, 10 Dec 2021 15:43:20 +0800
Message-Id: <20211210074329.5775-2-frank.chang@sifive.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211210074329.5775-1-frank.chang@sifive.com>
References: <20211210074329.5775-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x42e.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Fri, 10 Dec 2021 07:43:51 -0000

From: Kito Cheng <kito.cheng@sifive.com>

Signed-off-by: Kito Cheng <kito.cheng@sifive.com>
Signed-off-by: Chih-Min Chao <chihmin.chao@sifive.com>
Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/cpu.h                        |  1 +
 target/riscv/insn32.decode                |  4 ++
 target/riscv/insn_trans/trans_rvzfh.c.inc | 65 +++++++++++++++++++++++
 target/riscv/translate.c                  |  8 +++
 4 files changed, 78 insertions(+)
 create mode 100644 target/riscv/insn_trans/trans_rvzfh.c.inc

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 0760c0af93..570c49f365 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -312,6 +312,7 @@ struct RISCVCPU {
         bool ext_counters;
         bool ext_ifencei;
         bool ext_icsr;
+        bool ext_zfh;
 
         char *priv_spec;
         char *user_spec;
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 2f251dac1b..b36a3d8dbf 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -726,3 +726,7 @@ binv       0110100 .......... 001 ..... 0110011 @r
 binvi      01101. ........... 001 ..... 0010011 @sh
 bset       0010100 .......... 001 ..... 0110011 @r
 bseti      00101. ........... 001 ..... 0010011 @sh
+
+# *** RV32 Zfh Extension ***
+flh        ............   ..... 001 ..... 0000111 @i
+fsh        .......  ..... ..... 001 ..... 0100111 @s
diff --git a/target/riscv/insn_trans/trans_rvzfh.c.inc b/target/riscv/insn_trans/trans_rvzfh.c.inc
new file mode 100644
index 0000000000..dad1d703d7
--- /dev/null
+++ b/target/riscv/insn_trans/trans_rvzfh.c.inc
@@ -0,0 +1,65 @@
+/*
+ * RISC-V translation routines for the RV64Zfh Standard Extension.
+ *
+ * Copyright (c) 2020 Chih-Min Chao, chihmin.chao@sifive.com
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
+#define REQUIRE_ZFH(ctx) do { \
+    if (!ctx->ext_zfh) {      \
+        return false;         \
+    }                         \
+} while (0)
+
+static bool trans_flh(DisasContext *ctx, arg_flh *a)
+{
+    TCGv_i64 dest;
+    TCGv t0;
+
+    REQUIRE_FPU;
+    REQUIRE_ZFH(ctx);
+
+    t0 = get_gpr(ctx, a->rs1, EXT_NONE);
+    if (a->imm) {
+        TCGv temp = temp_new(ctx);
+        tcg_gen_addi_tl(temp, t0, a->imm);
+        t0 = temp;
+    }
+
+    dest = cpu_fpr[a->rd];
+    tcg_gen_qemu_ld_i64(dest, t0, ctx->mem_idx, MO_TEUW);
+    gen_nanbox_h(dest, dest);
+
+    mark_fs_dirty(ctx);
+    return true;
+}
+
+static bool trans_fsh(DisasContext *ctx, arg_fsh *a)
+{
+    TCGv t0;
+
+    REQUIRE_FPU;
+    REQUIRE_ZFH(ctx);
+
+    t0 = get_gpr(ctx, a->rs1, EXT_NONE);
+    if (a->imm) {
+        TCGv temp = tcg_temp_new();
+        tcg_gen_addi_tl(temp, t0, a->imm);
+        t0 = temp;
+    }
+
+    tcg_gen_qemu_st_i64(cpu_fpr[a->rs2], t0, ctx->mem_idx, MO_TEUW);
+
+    return true;
+}
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 1d57bc97b5..bea87b31b5 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -73,6 +73,7 @@ typedef struct DisasContext {
     RISCVMXL ol;
     bool virt_enabled;
     bool ext_ifencei;
+    bool ext_zfh;
     bool hlsx;
     /* vector extension */
     bool vill;
@@ -134,6 +135,11 @@ static void gen_nanbox_s(TCGv_i64 out, TCGv_i64 in)
     tcg_gen_ori_i64(out, in, MAKE_64BIT_MASK(32, 32));
 }
 
+static void gen_nanbox_h(TCGv_i64 out, TCGv_i64 in)
+{
+    tcg_gen_ori_i64(out, in, MAKE_64BIT_MASK(16, 48));
+}
+
 /*
  * A narrow n-bit operation, where n < FLEN, checks that input operands
  * are correctly Nan-boxed, i.e., all upper FLEN - n bits are 1.
@@ -574,6 +580,7 @@ static uint32_t opcode_at(DisasContextBase *dcbase, target_ulong pc)
 #include "insn_trans/trans_rvh.c.inc"
 #include "insn_trans/trans_rvv.c.inc"
 #include "insn_trans/trans_rvb.c.inc"
+#include "insn_trans/trans_rvzfh.c.inc"
 #include "insn_trans/trans_privileged.c.inc"
 
 /* Include the auto-generated decoder for 16 bit insn */
@@ -626,6 +633,7 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
     ctx->misa_ext = env->misa_ext;
     ctx->frm = -1;  /* unknown rounding mode */
     ctx->ext_ifencei = cpu->cfg.ext_ifencei;
+    ctx->ext_zfh = cpu->cfg.ext_zfh;
     ctx->vlen = cpu->cfg.vlen;
     ctx->mstatus_hs_fs = FIELD_EX32(tb_flags, TB_FLAGS, MSTATUS_HS_FS);
     ctx->hlsx = FIELD_EX32(tb_flags, TB_FLAGS, HLSX);
-- 
2.31.1


