Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1md1x1-0001UZ-Lf
	for mharc-qemu-riscv@gnu.org; Tue, 19 Oct 2021 23:07:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1md1wz-0001QU-QL
 for qemu-riscv@nongnu.org; Tue, 19 Oct 2021 23:07:33 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:33482)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1md1wx-0002xW-Ro
 for qemu-riscv@nongnu.org; Tue, 19 Oct 2021 23:07:33 -0400
Received: by mail-pl1-x633.google.com with SMTP id y4so15155946plb.0
 for <qemu-riscv@nongnu.org>; Tue, 19 Oct 2021 20:07:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AFADrMamP65/xeh3e7XaZjQ0zaUcrZmOFAnEgQ5HH+Y=;
 b=Ok5VrjXPSavBS+9iYjSKpbf/cgfQtHlJpRDJVWsh5wbTiz4wNFcIlEI0eTE3GUeOC2
 a1A/l/3FWLyrClsHtLnAYXL5T59IxlFs+RlfwVwR5cd3Ds+10Y1YDAPOyvmnJbaUn0u9
 l8aQmZwlcq9XSB8Dgc+bNhPpjizaWeGUluNm5NCCAsgPGXPrlrXuCwQ2kSXfK4VxNypi
 DBh6npQmnwKhWrRxtBTdd8mo0pPlwKZU4VtuqPyoyWIzsWKWHumhCg3nHvpqmnpOIKma
 XpvDkOHhM7K95Qt8LYPbP02Ef9zYao4WOF/Fujf/99K6cj/w4SijMslF3m3aQARPMMuO
 xRbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AFADrMamP65/xeh3e7XaZjQ0zaUcrZmOFAnEgQ5HH+Y=;
 b=ZluXx0HrAu81a94hJqnKhHWyglIo7kGmjd+To5aMwLJxtR9gH3FFVVCYqo5iqdMGnC
 SW7k8VI7ey7RubeLXNzu36y2xdkvaZaCeuS42K+W+1NtBvaQjsHisN+/oEFCu+YrPGyb
 d2CZuCsCvdUXn8VSS5i7+EyjE5wH+AMRclnH9td2r1WMp2iLvr6ssYPQJcWK+cn1OOUK
 PJe2NZtY3G9yxD3nZgyNylLe8BzF/nvX0h8CNnAFnPcNQ3CFVOg42mDaozCB9mF5OSl5
 LCIxO7WxtYNuoclUu83aJpLNT/B/X5EVJPUsxyUFQO23pAtfDwTUaPzHwwVHRUhfk2bg
 OYiQ==
X-Gm-Message-State: AOAM533dhuSC1EE4h8TpnU9y3DW2eVdlLYXXS5n7gxGoT9LcrGAoAd4q
 4V7enWTimNWjcHIPTjP9JgK3aISWIsAO2w==
X-Google-Smtp-Source: ABdhPJwWFYKJcWk1J29sFWlOFWLpjgDS/Gq5X28G6ENtRkMTDKGjWn/MUcKj0pk+tW7K99tua3VWIg==
X-Received: by 2002:a17:90a:2943:: with SMTP id
 x3mr4182362pjf.71.1634699250233; 
 Tue, 19 Oct 2021 20:07:30 -0700 (PDT)
Received: from localhost.localdomain (123-193-74-252.dynamic.kbronet.com.tw.
 [123.193.74.252])
 by smtp.gmail.com with ESMTPSA id y18sm574443pfb.106.2021.10.19.20.07.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Oct 2021 20:07:29 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>,
 Kito Cheng <kito.cheng@sifive.com>,
 Chih-Min Chao <chihmin.chao@sifive.com>, qemu-devel@nongnu.org
Subject: [PATCH v4 7/8] target/riscv: zfh: implement zfhmin extension
Date: Wed, 20 Oct 2021 11:06:50 +0800
Message-Id: <20211020030653.213565-8-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211020030653.213565-1-frank.chang@sifive.com>
References: <20211020030653.213565-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x633.google.com
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
X-List-Received-Date: Wed, 20 Oct 2021 03:07:34 -0000

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


