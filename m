Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mdaxn-0001Zz-Eo
	for mharc-qemu-riscv@gnu.org; Thu, 21 Oct 2021 12:30:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mdaxf-0001St-79
 for qemu-riscv@nongnu.org; Thu, 21 Oct 2021 12:30:36 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:34452)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mdaxa-0007fH-4c
 for qemu-riscv@nongnu.org; Thu, 21 Oct 2021 12:30:34 -0400
Received: by mail-pl1-x631.google.com with SMTP id g5so812306plg.1
 for <qemu-riscv@nongnu.org>; Thu, 21 Oct 2021 09:30:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VBVFiuUvn9mpn1QKWwhmvgDNBQjy3QanofXUwkFvfgU=;
 b=kEn9uf/A/wfso9U9WQW1DBehIh9/JR8FrDjM/G7Jtnbhzaq2sfPalJ0MNYB5UaHrCf
 MUbC4XFDxPdHQsuN4lt2pRmJ35ODGb00rJFJUHYtDFrHYPTU6ZC6pKiuAdgTxHxCyYGe
 1H71dnP68IqgRk4k3yIE5jL8pfU2TJJrkvwY7gUeV1VxT7Q+3WIrE8BWsPDZgE6bn5Y2
 PO2Cqq64A/k9/WPJ+p7XiHqCKfBJARznlJ4L1AsQD7E16fYaNRyjHpdost0h+lQMfr1Q
 hmOFsgffnMA+2n54BPv1nr6jfRxY/4YmRJcDHLRkQM1B0CYPP9elqV53C5siRXx2et/l
 zuaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VBVFiuUvn9mpn1QKWwhmvgDNBQjy3QanofXUwkFvfgU=;
 b=XRtBlJp2OXNgjK7GDpQA4SKWNlHw8QDV4ejyewImciKijFSzQrxi2zFWqjwY6dYELC
 GwXTlfkUfN/zNuf/xP/TKkpYjF8sLOQI2p1ex4hfvLj88wA1+hlwDdHxRmjqkqD40IZ6
 a9ezWW+5R+w8ecw2qnL0giCqRH4Kk/iavLkLob5DHliC+kIedpTCvb6m5bvsQf2qhtfh
 555U9OmEyvK3/b71Vl65LKANhOpbxBiPpOJOq7K/noYQJMoICo1tkXHWHDVAk84ySp3c
 Kn32w1gwGA882dd8/+dJhVJNJEtamO13mLOIHFqMPRaNdWSShJyrodwcnb6B9n9Kf7Df
 6G5A==
X-Gm-Message-State: AOAM532tkBVkliAdrK5A7f9nQUdaZSixLWtxWTjDTOKiw1FvZC2itg3p
 4XotNYS0ISY/fcWsii2RauWg+cOAakXhIg==
X-Google-Smtp-Source: ABdhPJwtczEXvBhtOTkqaqPF/wAakVxF0zVaQeEh3ZqIN1yvaYptym4iiHZvUd/YwFCIHJr8dUSdHA==
X-Received: by 2002:a17:902:c643:b0:13f:68b4:4abf with SMTP id
 s3-20020a170902c64300b0013f68b44abfmr5969944pls.82.1634833827419; 
 Thu, 21 Oct 2021 09:30:27 -0700 (PDT)
Received: from localhost.localdomain (123-193-74-252.dynamic.kbronet.com.tw.
 [123.193.74.252])
 by smtp.gmail.com with ESMTPSA id j9sm5963155pgn.24.2021.10.21.09.30.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 09:30:27 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>,
 Chih-Min Chao <chihmin.chao@sifive.com>,
 Kito Cheng <kito.cheng@sifive.com>, qemu-devel@nongnu.org
Subject: [PATCH v5 7/8] target/riscv: zfh: implement zfhmin extension
Date: Fri, 22 Oct 2021 00:29:53 +0800
Message-Id: <20211021162956.2772656-8-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211021162956.2772656-1-frank.chang@sifive.com>
References: <20211021162956.2772656-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x631.google.com
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
X-List-Received-Date: Thu, 21 Oct 2021 16:30:37 -0000

From: Frank Chang <frank.chang@sifive.com>

Zfhmin extension is a subset of Zfh extension, consisting only of data
transfer and conversion instructions.

If enabled, only the following instructions from Zfh extension are
included:
  * flh, fsh, fmv.x.h, fmv.h.x, fcvt.s.h, fcvt.h.s
  * If D extension is present: fcvt.d.h, fcvt.h.d

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h                        |  1 +
 target/riscv/insn_trans/trans_rvzfh.c.inc | 22 ++++++++++++++--------
 target/riscv/translate.c                  |  2 ++
 3 files changed, 17 insertions(+), 8 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index da3c436987c..8b93e25a270 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -300,6 +300,7 @@ struct RISCVCPU {
         bool ext_ifencei;
         bool ext_icsr;
         bool ext_zfh;
+        bool ext_zfhmin;
 
         char *priv_spec;
         char *user_spec;
diff --git a/target/riscv/insn_trans/trans_rvzfh.c.inc b/target/riscv/insn_trans/trans_rvzfh.c.inc
index 0549e25fb45..5a7cac89585 100644
--- a/target/riscv/insn_trans/trans_rvzfh.c.inc
+++ b/target/riscv/insn_trans/trans_rvzfh.c.inc
@@ -22,13 +22,19 @@
     }                         \
 } while (0)
 
+#define REQUIRE_ZFH_OR_ZFHMIN(ctx) do {       \
+    if (!(ctx->ext_zfh || ctx->ext_zfhmin)) { \
+        return false;                         \
+    }                                         \
+} while (0)
+
 static bool trans_flh(DisasContext *ctx, arg_flh *a)
 {
     TCGv_i64 dest;
     TCGv t0;
 
     REQUIRE_FPU;
-    REQUIRE_ZFH(ctx);
+    REQUIRE_ZFH_OR_ZFHMIN(ctx);
 
     t0 = get_gpr(ctx, a->rs1, EXT_NONE);
     if (a->imm) {
@@ -50,7 +56,7 @@ static bool trans_fsh(DisasContext *ctx, arg_fsh *a)
     TCGv t0;
 
     REQUIRE_FPU;
-    REQUIRE_ZFH(ctx);
+    REQUIRE_ZFH_OR_ZFHMIN(ctx);
 
     t0 = get_gpr(ctx, a->rs1, EXT_NONE);
     if (a->imm) {
@@ -283,7 +289,7 @@ static bool trans_fmax_h(DisasContext *ctx, arg_fmax_h *a)
 static bool trans_fcvt_s_h(DisasContext *ctx, arg_fcvt_s_h *a)
 {
     REQUIRE_FPU;
-    REQUIRE_ZFH(ctx);
+    REQUIRE_ZFH_OR_ZFHMIN(ctx);
 
     gen_set_rm(ctx, a->rm);
     gen_helper_fcvt_s_h(cpu_fpr[a->rd], cpu_env, cpu_fpr[a->rs1]);
@@ -296,7 +302,7 @@ static bool trans_fcvt_s_h(DisasContext *ctx, arg_fcvt_s_h *a)
 static bool trans_fcvt_d_h(DisasContext *ctx, arg_fcvt_d_h *a)
 {
     REQUIRE_FPU;
-    REQUIRE_ZFH(ctx);
+    REQUIRE_ZFH_OR_ZFHMIN(ctx);
     REQUIRE_EXT(ctx, RVD);
 
     gen_set_rm(ctx, a->rm);
@@ -311,7 +317,7 @@ static bool trans_fcvt_d_h(DisasContext *ctx, arg_fcvt_d_h *a)
 static bool trans_fcvt_h_s(DisasContext *ctx, arg_fcvt_h_s *a)
 {
     REQUIRE_FPU;
-    REQUIRE_ZFH(ctx);
+    REQUIRE_ZFH_OR_ZFHMIN(ctx);
 
     gen_set_rm(ctx, a->rm);
     gen_helper_fcvt_h_s(cpu_fpr[a->rd], cpu_env, cpu_fpr[a->rs1]);
@@ -324,7 +330,7 @@ static bool trans_fcvt_h_s(DisasContext *ctx, arg_fcvt_h_s *a)
 static bool trans_fcvt_h_d(DisasContext *ctx, arg_fcvt_h_d *a)
 {
     REQUIRE_FPU;
-    REQUIRE_ZFH(ctx);
+    REQUIRE_ZFH_OR_ZFHMIN(ctx);
     REQUIRE_EXT(ctx, RVD);
 
     gen_set_rm(ctx, a->rm);
@@ -441,7 +447,7 @@ static bool trans_fcvt_h_wu(DisasContext *ctx, arg_fcvt_h_wu *a)
 static bool trans_fmv_x_h(DisasContext *ctx, arg_fmv_x_h *a)
 {
     REQUIRE_FPU;
-    REQUIRE_ZFH(ctx);
+    REQUIRE_ZFH_OR_ZFHMIN(ctx);
 
     TCGv dest = dest_gpr(ctx, a->rd);
 
@@ -461,7 +467,7 @@ static bool trans_fmv_x_h(DisasContext *ctx, arg_fmv_x_h *a)
 static bool trans_fmv_h_x(DisasContext *ctx, arg_fmv_h_x *a)
 {
     REQUIRE_FPU;
-    REQUIRE_ZFH(ctx);
+    REQUIRE_ZFH_OR_ZFHMIN(ctx);
 
     TCGv t0 = get_gpr(ctx, a->rs1, EXT_ZERO);
 
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index e6643a7d777..66709091ca1 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -71,6 +71,7 @@ typedef struct DisasContext {
     bool virt_enabled;
     bool ext_ifencei;
     bool ext_zfh;
+    bool ext_zfhmin;
     bool hlsx;
     /* vector extension */
     bool vill;
@@ -620,6 +621,7 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
     ctx->frm = -1;  /* unknown rounding mode */
     ctx->ext_ifencei = cpu->cfg.ext_ifencei;
     ctx->ext_zfh = cpu->cfg.ext_zfh;
+    ctx->ext_zfhmin = cpu->cfg.ext_zfhmin;
     ctx->vlen = cpu->cfg.vlen;
     ctx->mstatus_hs_fs = FIELD_EX32(tb_flags, TB_FLAGS, MSTATUS_HS_FS);
     ctx->hlsx = FIELD_EX32(tb_flags, TB_FLAGS, HLSX);
-- 
2.25.1


