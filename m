Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mbffp-00035M-6i
	for mharc-qemu-riscv@gnu.org; Sat, 16 Oct 2021 05:08:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mbffo-00032b-16
 for qemu-riscv@nongnu.org; Sat, 16 Oct 2021 05:08:12 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:42837)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mbffm-00037M-3r
 for qemu-riscv@nongnu.org; Sat, 16 Oct 2021 05:08:11 -0400
Received: by mail-pg1-x533.google.com with SMTP id 66so10836767pgc.9
 for <qemu-riscv@nongnu.org>; Sat, 16 Oct 2021 02:08:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=76Ee21ltw6zA4Bl5mlK8ASTEom2K2w/9WO04d59/T/4=;
 b=B8v0ZbV4YhUmbBoLAm7A5qygzFZgROfRN77dL4wb9mzpah9yIT2+QQVmNNtN5BTmx/
 c9fBZIIF4wJ683QKNz27rh+48ZjbC5K/YYGb1Crc/k6Tl+qK3TDhNKgigjm9mAU+1SE9
 NoNHbyBz3Jeu1AYxuItaFUZXR7UiJBixtPK9RyXY0S933O4VUYYxFeWaU5S13HBePjxP
 4ncX7ESrLDspnBIfodWoJrGER46GC6bY3pM7F1ZDgWTNr6ja7Di74gZGqLLxNuEmRM78
 VFzyIndb9ipeJHmFMgCR6CxEYSydaiYNRzZmef/ty+EwGeHoNJANORwAr+PQOyrjDdOi
 4iWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=76Ee21ltw6zA4Bl5mlK8ASTEom2K2w/9WO04d59/T/4=;
 b=7PhnCXCuTrKcIcS2kdCSaQLpVg/Hx2ZIVOv/NG2JOR8uTLfO+yxAYzEF7/9czLvXAw
 3jFIx65VEzrwrkF5ZM40cCuppw79u2u50MdwFw3Wp0yX/IgcxIBcTKqPX2aBTamBI9Ic
 Adadu+Ibgl5iyHpgMOscIY6/IbPtQHnBD4InDwgmDQinB8NdSQIeOMw7ms34fUUcZHhH
 mw3P3my1Np2elLQ1d5L9jGLZMrmoFbM7HEKVhtxs7fWo4Zjx2EMoxTb8C4wnptzNtNYA
 hylFSjaY9zaq5LTKsV8Eg0NoHv97XUqZzAmXZW9mDF0no3q+fbXszEU5lBCArENsCU43
 8Eeg==
X-Gm-Message-State: AOAM530XIAWnIiDptM2l4JMUmrYuUAOm3wK0WhXzBwpKcb/6wQVZSNBf
 WmyVhOCql+l5wUpG8ispj3qXhA==
X-Google-Smtp-Source: ABdhPJxvCsyHW3QH+1b/KWILMdxjB0vg3+y0CxxZMGxGVJbo2S0njfyo9LYfo7b/efk3IFwv9LLQCA==
X-Received: by 2002:a63:8bca:: with SMTP id
 j193mr10321044pge.213.1634375288780; 
 Sat, 16 Oct 2021 02:08:08 -0700 (PDT)
Received: from localhost.localdomain ([2402:7500:487:fa85:301f:cc98:b428:6b86])
 by smtp.gmail.com with ESMTPSA id d138sm7208936pfd.74.2021.10.16.02.08.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Oct 2021 02:08:08 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Chih-Min Chao <chihmin.chao@sifive.com>,
 Kito Cheng <kito.cheng@sifive.com>
Subject: [PATCH v3 6/6] target/riscv: zfh: implement zfhmin extension
Date: Sat, 16 Oct 2021 17:07:41 +0800
Message-Id: <20211016090742.3034669-7-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211016090742.3034669-1-frank.chang@sifive.com>
References: <20211016090742.3034669-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x533.google.com
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
X-List-Received-Date: Sat, 16 Oct 2021 09:08:12 -0000

From: Frank Chang <frank.chang@sifive.com>

Zfhmin extension is a subset of Zfh extension, consisting only of data
transfer and conversion instructions.

If enabled, only the following instructions from Zfh extension are
included:
  * flh, fsh, fmv.x.h, fmv.h.x, fcvt.s.h, fcvt.h.s
  * If D extension is present: fcvt.d.h, fcvt.h.d

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/cpu.c                        |  1 +
 target/riscv/cpu.h                        |  1 +
 target/riscv/insn_trans/trans_rvzfh.c.inc | 22 ++++++++++++++--------
 target/riscv/translate.c                  |  2 ++
 4 files changed, 18 insertions(+), 8 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 8c579dc297b..4c0e6532164 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -602,6 +602,7 @@ static Property riscv_cpu_properties[] = {
     DEFINE_PROP_BOOL("Zifencei", RISCVCPU, cfg.ext_ifencei, true),
     DEFINE_PROP_BOOL("Zicsr", RISCVCPU, cfg.ext_icsr, true),
     DEFINE_PROP_BOOL("Zfh", RISCVCPU, cfg.ext_zfh, false),
+    DEFINE_PROP_BOOL("Zfhmin", RISCVCPU, cfg.ext_zfhmin, false),
     DEFINE_PROP_STRING("priv_spec", RISCVCPU, cfg.priv_spec),
     DEFINE_PROP_STRING("vext_spec", RISCVCPU, cfg.vext_spec),
     DEFINE_PROP_UINT16("vlen", RISCVCPU, cfg.vlen, 128),
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 88684e72be1..d70f63ddfe6 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -298,6 +298,7 @@ struct RISCVCPU {
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
index 442ef42f441..f23bc919c08 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -70,6 +70,7 @@ typedef struct DisasContext {
     bool virt_enabled;
     bool ext_ifencei;
     bool ext_zfh;
+    bool ext_zfhmin;
     bool hlsx;
     /* vector extension */
     bool vill;
@@ -559,6 +560,7 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
     ctx->frm = -1;  /* unknown rounding mode */
     ctx->ext_ifencei = cpu->cfg.ext_ifencei;
     ctx->ext_zfh = cpu->cfg.ext_zfh;
+    ctx->ext_zfhmin = cpu->cfg.ext_zfhmin;
     ctx->vlen = cpu->cfg.vlen;
     ctx->mstatus_hs_fs = FIELD_EX32(tb_flags, TB_FLAGS, MSTATUS_HS_FS);
     ctx->hlsx = FIELD_EX32(tb_flags, TB_FLAGS, HLSX);
-- 
2.25.1


