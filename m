Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mbHxO-0000IK-Kl
	for mharc-qemu-riscv@gnu.org; Fri, 15 Oct 2021 03:48:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mbHxM-00009W-6k
 for qemu-riscv@nongnu.org; Fri, 15 Oct 2021 03:48:44 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:38857)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mbHxK-0003Sc-Dy
 for qemu-riscv@nongnu.org; Fri, 15 Oct 2021 03:48:43 -0400
Received: by mail-pf1-x42a.google.com with SMTP id k26so7692523pfi.5
 for <qemu-riscv@nongnu.org>; Fri, 15 Oct 2021 00:48:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QQLlpIheizsCcCm+QGI8HBP1tKGzD/PehzOF+sWi+r4=;
 b=BcVXrGWjT60LYWwZy+7tqkQFwE09bL1ReK+qb88YXUZCv/5MmrWye+SSZzFODI/UTG
 PcDDIYrtc8QIpaonb79NSAacyLMPcUDR0NTRvVhxwZXyhHySQWq8AaXyPlOjy0tvYx/e
 Y85t+U7ag8Gdhh+v1qw/4GsZ1NCz2HRddjUvfDPj6E2kih0t6ImNHyLHDecb1fjes3N8
 /8ORiZKpeAoPq2Q0hlhi2XlwJpg09F4dxJ+M1PaX5eMm642kleUqboh8pG/FNcfyCo3d
 P6yrWQAM/+OAddrvCkFVpMNnlznY27PmB3MVdAKwlKYN+S+Hi55XxMjaXY6f7g5iTquf
 fAgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QQLlpIheizsCcCm+QGI8HBP1tKGzD/PehzOF+sWi+r4=;
 b=vrXT3rWfzXSc3FNsgiGZUt/urXrQhqlvJr/QAQOeEYENCgb8xkJjnl9hzCrLpgKof2
 bbmVnQ94zFTcH+sTq0yRfFjIR4aMC4ynEBZ7Y/OwJcXq0SMIbgy6k8J/CmgIREqdf4Qw
 5a9qCvUq/7a/cn2wYPO4yao8gE0ebBFBwnpEq5iGYsUk/XoOEBPXy21ipHl8DSTwSe/C
 8dzbpHGrQtTJCh31GVmklj9UjuMHa6kBcJnc8G9EjwH8RJWYwqBBw072eeoO1FAnPAMJ
 H3Q1rNTaxj+HYgs4k7eXmf9fjFEFjsPU1exlW42Z+dWhoAJCu1OxVDkUghthlxRne4lQ
 srNg==
X-Gm-Message-State: AOAM533tIkFmSCQcNCciCuRAGMwmOYnuYc28MBQLhjWf5OM+I3ETk/V+
 juNS2PVyWCCdilFV3vtuvlZQkg==
X-Google-Smtp-Source: ABdhPJwjoQAFTEFOTjpoRzQfAglOXDCF5h3pKg7O+Xq8pe19usmWRqAafjRrZIAuTCbq5FxmmTAE3g==
X-Received: by 2002:aa7:978b:0:b0:44c:abf1:a8b8 with SMTP id
 o11-20020aa7978b000000b0044cabf1a8b8mr10342901pfp.35.1634284120923; 
 Fri, 15 Oct 2021 00:48:40 -0700 (PDT)
Received: from localhost.localdomain (123-193-74-252.dynamic.kbronet.com.tw.
 [123.193.74.252])
 by smtp.gmail.com with ESMTPSA id z13sm4271680pfq.130.2021.10.15.00.48.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Oct 2021 00:48:40 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>
Subject: [PATCH 29/76] target/riscv: rvv-1.0: mask population count instruction
Date: Fri, 15 Oct 2021 15:45:37 +0800
Message-Id: <20211015074627.3957162-37-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211015074627.3957162-1-frank.chang@sifive.com>
References: <20211015074627.3957162-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 15 Oct 2021 07:48:44 -0000

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/helper.h                   | 2 +-
 target/riscv/insn32.decode              | 2 +-
 target/riscv/insn_trans/trans_rvv.c.inc | 7 ++++---
 target/riscv/vector_helper.c            | 6 +++---
 4 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 780cd6d995a..3b6b4788818 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -1066,7 +1066,7 @@ DEF_HELPER_6(vmnor_mm, void, ptr, ptr, ptr, ptr, env, i32)
 DEF_HELPER_6(vmornot_mm, void, ptr, ptr, ptr, ptr, env, i32)
 DEF_HELPER_6(vmxnor_mm, void, ptr, ptr, ptr, ptr, env, i32)
 
-DEF_HELPER_4(vmpopc_m, tl, ptr, ptr, env, i32)
+DEF_HELPER_4(vpopc_m, tl, ptr, ptr, env, i32)
 
 DEF_HELPER_4(vmfirst_m, tl, ptr, ptr, env, i32)
 
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 64c2a533b42..f12096d67de 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -669,7 +669,7 @@ vmor_mm         011010 - ..... ..... 010 ..... 1010111 @r
 vmnor_mm        011110 - ..... ..... 010 ..... 1010111 @r
 vmornot_mm      011100 - ..... ..... 010 ..... 1010111 @r
 vmxnor_mm       011111 - ..... ..... 010 ..... 1010111 @r
-vmpopc_m        010100 . ..... ----- 010 ..... 1010111 @r2_vm
+vpopc_m         010000 . ..... 10000 010 ..... 1010111 @r2_vm
 vmfirst_m       010101 . ..... ----- 010 ..... 1010111 @r2_vm
 vmsbf_m         010110 . ..... 00001 010 ..... 1010111 @r2_vm
 vmsif_m         010110 . ..... 00011 010 ..... 1010111 @r2_vm
diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index ec205bfd63c..80d23e3f447 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -2864,8 +2864,8 @@ GEN_MM_TRANS(vmnor_mm)
 GEN_MM_TRANS(vmornot_mm)
 GEN_MM_TRANS(vmxnor_mm)
 
-/* Vector mask population count vmpopc */
-static bool trans_vmpopc_m(DisasContext *s, arg_rmr *a)
+/* Vector mask population count vpopc */
+static bool trans_vpopc_m(DisasContext *s, arg_rmr *a)
 {
     if (require_rvv(s) &&
         vext_check_isa_ill(s)) {
@@ -2884,11 +2884,12 @@ static bool trans_vmpopc_m(DisasContext *s, arg_rmr *a)
         tcg_gen_addi_ptr(src2, cpu_env, vreg_ofs(s, a->rs2));
         tcg_gen_addi_ptr(mask, cpu_env, vreg_ofs(s, 0));
 
-        gen_helper_vmpopc_m(dst, mask, src2, cpu_env, desc);
+        gen_helper_vpopc_m(dst, mask, src2, cpu_env, desc);
         gen_set_gpr(s, a->rd, dst);
 
         tcg_temp_free_ptr(mask);
         tcg_temp_free_ptr(src2);
+
         return true;
     }
     return false;
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 1ef98de6b63..18c26c45731 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -4416,9 +4416,9 @@ GEN_VEXT_MASK_VV(vmnor_mm, DO_NOR)
 GEN_VEXT_MASK_VV(vmornot_mm, DO_ORNOT)
 GEN_VEXT_MASK_VV(vmxnor_mm, DO_XNOR)
 
-/* Vector mask population count vmpopc */
-target_ulong HELPER(vmpopc_m)(void *v0, void *vs2, CPURISCVState *env,
-                              uint32_t desc)
+/* Vector mask population count vpopc */
+target_ulong HELPER(vpopc_m)(void *v0, void *vs2, CPURISCVState *env,
+                             uint32_t desc)
 {
     target_ulong cnt = 0;
     uint32_t vm = vext_vm(desc);
-- 
2.25.1


