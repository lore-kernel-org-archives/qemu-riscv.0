Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pY0z4-0007od-Bz
	for mharc-qemu-riscv@gnu.org; Fri, 03 Mar 2023 03:41:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pY0yz-0007Rj-28
 for qemu-riscv@nongnu.org; Fri, 03 Mar 2023 03:41:41 -0500
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pY0yx-0007rc-Dd
 for qemu-riscv@nongnu.org; Fri, 03 Mar 2023 03:41:40 -0500
Received: by mail-pg1-x530.google.com with SMTP id q23so1016665pgt.7
 for <qemu-riscv@nongnu.org>; Fri, 03 Mar 2023 00:41:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1677832897;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lqVjjOTZ9eMdzabLZOWmFSlP1B+iw01WmCSIdt7lwp0=;
 b=M/CgJXP9rICo1SFnWYHofEHswm58IRdJ/AXEmzWgkhzd8IaP9EXrt1zcQN9kuQ1q4/
 R6oGgrB/LZN29aB4+oeRXUfDvscnShXcjDeZyxApxOhOR6UHL7pyCjSqklLwu7Sa2M7x
 Xh9chqPfRRg4vGQrAzm4S4UOkhYQ84s4odJsQ0MmVIWqMmLILfbdKNQSdVD8YVPhebqd
 ksco7viY5dyf5goJFC6eHZcH44AIgjswelmlbF7QmCI66nVDAjoakCC4jxb/J6L4WQ5B
 9gsbfkj/I37AHEsxN5KTxV7y4TGs1qaqKXAxdf1uWHkhKv3j5DXbB5WzFyPdTNFAYQFu
 YPfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677832897;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lqVjjOTZ9eMdzabLZOWmFSlP1B+iw01WmCSIdt7lwp0=;
 b=63KY763J1u7yp6mQH0p8ljDMvjQ2Dtm5SsW77G4+OSPDF/kWeenQt9wanKgN89bEh5
 AYaj//urjdVAkcvVwR5JcZtTnklrxrNhKN2UcPcsRbrOOzWOgveCbU5W3HaYwS6rGZ7R
 g5aJg3RoukrS9lkudKTRkpkmYauGotUaqT5kzV/i1xcpfElxDtnJEgR5WdmnOTEzofJY
 16aZs4VbtEKEmfVQeIPV5/YEO0hoknQm9+hNHNkCKv/ylDzgpCUlX2R17SNvwJK5npUE
 rlgMKk7g61FZYCn281djUUV9hKw6K8cUBbZGdxxHE8yLC3FvD/hb1zTv9XjMP92SbXwN
 Ej7w==
X-Gm-Message-State: AO0yUKURWWpWIJ+jheiS15qMg9mf2Kxx31BRraoz9Y/OYB0uyQ9LwL3y
 l2ygOxMvlu2odZfvaQ6xclwEAkZ4mYd1nIOh
X-Google-Smtp-Source: AK7set/Fva0h7CxUkJquuQuyfRebkusQdeH50L/8rYor5kmF+HPBFIgJJmoYco/4bAOnb3b3gnmPPA==
X-Received: by 2002:a62:7b45:0:b0:5a9:b4eb:d262 with SMTP id
 w66-20020a627b45000000b005a9b4ebd262mr1598578pfc.1.1677832897354; 
 Fri, 03 Mar 2023 00:41:37 -0800 (PST)
Received: from localhost ([135.180.224.71]) by smtp.gmail.com with ESMTPSA id
 t8-20020aa79388000000b0058bb79beefcsm1025500pfe.123.2023.03.03.00.41.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Mar 2023 00:41:36 -0800 (PST)
Subject: [PULL 13/59] target/riscv: Simplify the check for Zfhmin and Zhinxmin
Date: Fri,  3 Mar 2023 00:36:54 -0800
Message-Id: <20230303083740.12817-14-palmer@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230303083740.12817-1-palmer@rivosinc.com>
References: <20230303083740.12817-1-palmer@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,          qemu-devel@nongnu.org,
 Weiwei Li <liweiwei@iscas.ac.cn>, Junqiang Wang <wangjunqiang@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Peter Maydell <peter.maydell@linaro.org>
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=palmer@rivosinc.com; helo=mail-pg1-x530.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Fri, 03 Mar 2023 08:41:41 -0000

From: Weiwei Li <liweiwei@iscas.ac.cn>

We needn't check Zfh and Zhinx in these instructions.

Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Message-ID: <20230215020539.4788-4-liweiwei@iscas.ac.cn>
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 target/riscv/insn_trans/trans_rvzfh.c.inc | 25 +++++++++++------------
 1 file changed, 12 insertions(+), 13 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvzfh.c.inc b/target/riscv/insn_trans/trans_rvzfh.c.inc
index 2ad5716312..85fc1aa822 100644
--- a/target/riscv/insn_trans/trans_rvzfh.c.inc
+++ b/target/riscv/insn_trans/trans_rvzfh.c.inc
@@ -28,15 +28,14 @@
     }                                  \
 } while (0)
 
-#define REQUIRE_ZFH_OR_ZFHMIN(ctx) do {       \
-    if (!(ctx->cfg_ptr->ext_zfh || ctx->cfg_ptr->ext_zfhmin)) { \
+#define REQUIRE_ZFHMIN(ctx) do {              \
+    if (!ctx->cfg_ptr->ext_zfhmin) {          \
         return false;                         \
     }                                         \
 } while (0)
 
-#define REQUIRE_ZFH_OR_ZFHMIN_OR_ZHINX_OR_ZHINXMIN(ctx) do { \
-    if (!(ctx->cfg_ptr->ext_zfh || ctx->cfg_ptr->ext_zfhmin ||          \
-          ctx->cfg_ptr->ext_zhinx || ctx->cfg_ptr->ext_zhinxmin)) {     \
+#define REQUIRE_ZFHMIN_OR_ZHINXMIN(ctx) do {                 \
+    if (!(ctx->cfg_ptr->ext_zfhmin || ctx->cfg_ptr->ext_zhinxmin)) { \
         return false;                                        \
     }                                                        \
 } while (0)
@@ -47,7 +46,7 @@ static bool trans_flh(DisasContext *ctx, arg_flh *a)
     TCGv t0;
 
     REQUIRE_FPU;
-    REQUIRE_ZFH_OR_ZFHMIN(ctx);
+    REQUIRE_ZFHMIN(ctx);
 
     decode_save_opc(ctx);
     t0 = get_gpr(ctx, a->rs1, EXT_NONE);
@@ -70,7 +69,7 @@ static bool trans_fsh(DisasContext *ctx, arg_fsh *a)
     TCGv t0;
 
     REQUIRE_FPU;
-    REQUIRE_ZFH_OR_ZFHMIN(ctx);
+    REQUIRE_ZFHMIN(ctx);
 
     decode_save_opc(ctx);
     t0 = get_gpr(ctx, a->rs1, EXT_NONE);
@@ -401,7 +400,7 @@ static bool trans_fmax_h(DisasContext *ctx, arg_fmax_h *a)
 static bool trans_fcvt_s_h(DisasContext *ctx, arg_fcvt_s_h *a)
 {
     REQUIRE_FPU;
-    REQUIRE_ZFH_OR_ZFHMIN_OR_ZHINX_OR_ZHINXMIN(ctx);
+    REQUIRE_ZFHMIN_OR_ZHINXMIN(ctx);
 
     TCGv_i64 dest = dest_fpr(ctx, a->rd);
     TCGv_i64 src1 = get_fpr_hs(ctx, a->rs1);
@@ -418,7 +417,7 @@ static bool trans_fcvt_s_h(DisasContext *ctx, arg_fcvt_s_h *a)
 static bool trans_fcvt_d_h(DisasContext *ctx, arg_fcvt_d_h *a)
 {
     REQUIRE_FPU;
-    REQUIRE_ZFH_OR_ZFHMIN_OR_ZHINX_OR_ZHINXMIN(ctx);
+    REQUIRE_ZFHMIN_OR_ZHINXMIN(ctx);
     REQUIRE_ZDINX_OR_D(ctx);
 
     TCGv_i64 dest = dest_fpr(ctx, a->rd);
@@ -436,7 +435,7 @@ static bool trans_fcvt_d_h(DisasContext *ctx, arg_fcvt_d_h *a)
 static bool trans_fcvt_h_s(DisasContext *ctx, arg_fcvt_h_s *a)
 {
     REQUIRE_FPU;
-    REQUIRE_ZFH_OR_ZFHMIN_OR_ZHINX_OR_ZHINXMIN(ctx);
+    REQUIRE_ZFHMIN_OR_ZHINXMIN(ctx);
 
     TCGv_i64 dest = dest_fpr(ctx, a->rd);
     TCGv_i64 src1 = get_fpr_hs(ctx, a->rs1);
@@ -452,7 +451,7 @@ static bool trans_fcvt_h_s(DisasContext *ctx, arg_fcvt_h_s *a)
 static bool trans_fcvt_h_d(DisasContext *ctx, arg_fcvt_h_d *a)
 {
     REQUIRE_FPU;
-    REQUIRE_ZFH_OR_ZFHMIN_OR_ZHINX_OR_ZHINXMIN(ctx);
+    REQUIRE_ZFHMIN_OR_ZHINXMIN(ctx);
     REQUIRE_ZDINX_OR_D(ctx);
 
     TCGv_i64 dest = dest_fpr(ctx, a->rd);
@@ -585,7 +584,7 @@ static bool trans_fcvt_h_wu(DisasContext *ctx, arg_fcvt_h_wu *a)
 static bool trans_fmv_x_h(DisasContext *ctx, arg_fmv_x_h *a)
 {
     REQUIRE_FPU;
-    REQUIRE_ZFH_OR_ZFHMIN(ctx);
+    REQUIRE_ZFHMIN(ctx);
 
     TCGv dest = dest_gpr(ctx, a->rd);
 
@@ -605,7 +604,7 @@ static bool trans_fmv_x_h(DisasContext *ctx, arg_fmv_x_h *a)
 static bool trans_fmv_h_x(DisasContext *ctx, arg_fmv_h_x *a)
 {
     REQUIRE_FPU;
-    REQUIRE_ZFH_OR_ZFHMIN(ctx);
+    REQUIRE_ZFHMIN(ctx);
 
     TCGv t0 = get_gpr(ctx, a->rs1, EXT_ZERO);
 
-- 
2.39.2


