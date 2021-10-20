Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1md1wl-0000un-1f
	for mharc-qemu-riscv@gnu.org; Tue, 19 Oct 2021 23:07:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1md1wf-0000rh-CH
 for qemu-riscv@nongnu.org; Tue, 19 Oct 2021 23:07:17 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531]:36366)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1md1wb-0002aA-Qr
 for qemu-riscv@nongnu.org; Tue, 19 Oct 2021 23:07:13 -0400
Received: by mail-pg1-x531.google.com with SMTP id 75so21246140pga.3
 for <qemu-riscv@nongnu.org>; Tue, 19 Oct 2021 20:07:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/Vfh/tYrHHux4LkT5dFjQv8HByUFFEK1bKo1HTkY3t8=;
 b=iUE2gfrC2fv4EIp00nxrU8AUl8sHG6xNuYTpnbV9CCb0LdIjc1hFq/8U5/iwAPx/tz
 6ZzfWnfPBSNoKh4VWrB2enNUePQJybP35AGlEclfmqdL37OAp4qQ6Fl3UpO2NV1qbVKS
 H/WwRCLgjXXMteqondUVsCdoxycLZjdNx4tMQClzqQPQwYJ2vxfJyimIHhuydLvYMadf
 xWh2h5dIqxiJJ4ss9tSaoK9IL2rKS50RTPlf32F7ACk000k7cf6Coaclq0mY3fgELeXF
 CAZ9VbhJ0WHa1ERBQ9WUEB5nPicmvdTmvNTNIdJ7UTiz1S6RVrtZhlestxZJ0Zstk1or
 Ia6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/Vfh/tYrHHux4LkT5dFjQv8HByUFFEK1bKo1HTkY3t8=;
 b=DtUgOYax8gNFHIPLteL30k9Y8RJP4ehHSpY5ujWNhnVuE3DcGGV7q5hSxnqJFtXOOG
 vV67NzixPbplfmDabZyY7AaLWKj/5ch0DsddR8xVlFgZ0HiDe/L0mFWAu1XOxErQ1Og1
 gf5CFlngp4zMKVpcYjZQPqDuc4426MxicP30+cOWSu1yHCQzgdfS1d+LQ3FO1jD3MSI9
 V+i3VmA5Bc0eDY9fz8wduGr7RnL0d1baO5eelmH/vdFMJ+KW4uStHXEQIp7Z6C6kXaMu
 PS3Grb2RinV/6B7nQBfbdGSdD6/X1C2GXUEnoIMThshyIrixY4kWXo1uqLmkKCEgL/Y0
 ONhg==
X-Gm-Message-State: AOAM5331qa8Kf7dEQZ6YmnQHJyBPKFV10DUo8QNV4Zun/ik4eCfBeR10
 NZptPHxPjvB7F0r8rp8vcNWC8Csr0RT7EA==
X-Google-Smtp-Source: ABdhPJwrLS6T8WONs2P9QqecptVPT4TJG+02wVL4AbXjkp/eejOa6S65kTOiTtso6fLbxoIWm+/swQ==
X-Received: by 2002:a05:6a00:24c8:b0:44c:654b:403b with SMTP id
 d8-20020a056a0024c800b0044c654b403bmr3468955pfv.55.1634699228290; 
 Tue, 19 Oct 2021 20:07:08 -0700 (PDT)
Received: from localhost.localdomain (123-193-74-252.dynamic.kbronet.com.tw.
 [123.193.74.252])
 by smtp.gmail.com with ESMTPSA id y18sm574443pfb.106.2021.10.19.20.07.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Oct 2021 20:07:08 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-riscv@nongnu.org
Cc: Kito Cheng <kito.cheng@sifive.com>,
 Chih-Min Chao <chihmin.chao@sifive.com>,
 Frank Chang <frank.chang@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, qemu-devel@nongnu.org
Subject: [PATCH v4 1/8] target/riscv: zfh: half-precision load and store
Date: Wed, 20 Oct 2021 11:06:44 +0800
Message-Id: <20211020030653.213565-2-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211020030653.213565-1-frank.chang@sifive.com>
References: <20211020030653.213565-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 20 Oct 2021 03:07:17 -0000

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
index 9e55b2f5b17..88684e72be1 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -297,6 +297,7 @@ struct RISCVCPU {
         bool ext_counters;
         bool ext_ifencei;
         bool ext_icsr;
+        bool ext_zfh;
 
         char *priv_spec;
         char *user_spec;
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 2f251dac1bb..b36a3d8dbf8 100644
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
index 00000000000..dad1d703d72
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
index d2442f0cf5d..75048149f5a 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -69,6 +69,7 @@ typedef struct DisasContext {
     bool w;
     bool virt_enabled;
     bool ext_ifencei;
+    bool ext_zfh;
     bool hlsx;
     /* vector extension */
     bool vill;
@@ -118,6 +119,11 @@ static void gen_nanbox_s(TCGv_i64 out, TCGv_i64 in)
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
@@ -489,6 +495,7 @@ static uint32_t opcode_at(DisasContextBase *dcbase, target_ulong pc)
 #include "insn_trans/trans_rvh.c.inc"
 #include "insn_trans/trans_rvv.c.inc"
 #include "insn_trans/trans_rvb.c.inc"
+#include "insn_trans/trans_rvzfh.c.inc"
 #include "insn_trans/trans_privileged.c.inc"
 
 /* Include the auto-generated decoder for 16 bit insn */
@@ -541,6 +548,7 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
     ctx->misa = env->misa;
     ctx->frm = -1;  /* unknown rounding mode */
     ctx->ext_ifencei = cpu->cfg.ext_ifencei;
+    ctx->ext_zfh = cpu->cfg.ext_zfh;
     ctx->vlen = cpu->cfg.vlen;
     ctx->mstatus_hs_fs = FIELD_EX32(tb_flags, TB_FLAGS, MSTATUS_HS_FS);
     ctx->hlsx = FIELD_EX32(tb_flags, TB_FLAGS, HLSX);
-- 
2.25.1


