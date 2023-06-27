Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A19FEB64D9
	for <qemu-riscv@archiver.kernel.org>; Tue, 27 Jun 2023 17:21:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qECMz-0002p9-Jf; Tue, 27 Jun 2023 13:20:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1qECMw-0002JL-Ty
 for qemu-riscv@nongnu.org; Tue, 27 Jun 2023 13:20:46 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1qECMu-0007DC-Vv
 for qemu-riscv@nongnu.org; Tue, 27 Jun 2023 13:20:46 -0400
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-1b80b343178so14965755ad.0
 for <qemu-riscv@nongnu.org>; Tue, 27 Jun 2023 10:20:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1687886444; x=1690478444;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wQ8vK9Wpe3fGLT8kIELnJ5eJhUvDM0umq3P84O6dY/s=;
 b=GS+OvD9nGY9GAxGYELqJt/FdvvUXDhhUVgVfMwN+TVixpsH7wywPeVm6Sj80jMoBFF
 6/a9gVQvNNWZTAaAnNjQsX5/B6p3EvfiWNC5h6BwsfGebdwXOPPPU41N52k6zIdmYRiD
 4Od7z/g2uRaJGeQZ4Mm019d5tA4DLm74RwSeQg0gH7pP5qWziF+JoutTh2jC6vl1VCEY
 0EUEcYoTUfVsmvMsgWZlsANnbBmSwChflRSHN//sMyXIzgWnwt+9x6e2tGfFx5beCjfn
 1hakgwVvtL5KNTcr6wHtljYUML8whvHCzL/uCyzcQZXOkhZXd7luHU3i6mvWuQ0a4fzV
 q+aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687886444; x=1690478444;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wQ8vK9Wpe3fGLT8kIELnJ5eJhUvDM0umq3P84O6dY/s=;
 b=LYptxkrN5O/5NEdw+R9VVJgFR/5KeO780nexmjJhH8txg6ozzLDYHcGzVIEbFocNcD
 Sobu0qe50EMTQ//fM5VGlq7uJAachGJ4sjPj6HogSydTTouNzo1dIKuwsp4Dli9Z3+ay
 JZPLFyu9zqaJoLfsiFQuspN3rXcWXLII2Qg05ye9tsd8kR+QlrodP70fQOMBip6A4Wmy
 IiknrmKfAaIwaAKRWuQ6nnK7f0pQRaTF4Xtx0JZ5GrUZtzyJO9Bcgls27yEJ3R833nLi
 anqxhaEXtenOxOSAyc+ghWf3nZDsnakkRuvMD5nX3fiIDdMiM2/hKLCs54KzjB9SpyIx
 3MnA==
X-Gm-Message-State: AC+VfDz9yHqzea1IDZfcJlV0TqmnehgSfoxKF4jmTEbs2miApWSVFhjM
 q1xgSKGU69mr+EyC3Dj3DrKeqw==
X-Google-Smtp-Source: ACHHUZ4uYHuqq/hSQLOEbLOiehd1VfSgrvSbUshDSGxfESDNsX9nkXghrxyKAFBZLNBSJOys+SyOMw==
X-Received: by 2002:a17:902:e88d:b0:1b8:1d4b:f60e with SMTP id
 w13-20020a170902e88d00b001b81d4bf60emr2096436plg.52.1687886443732; 
 Tue, 27 Jun 2023 10:20:43 -0700 (PDT)
Received: from MaxdeMBP.localdomain (125-228-20-175.hinet-ip.hinet.net.
 [125.228.20.175]) by smtp.gmail.com with ESMTPSA id
 jb13-20020a170903258d00b001b8052d58a0sm3796145plb.305.2023.06.27.10.20.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jun 2023 10:20:43 -0700 (PDT)
From: Max Chou <max.chou@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: dbarboza@ventanamicro.com, Dickon Hood <dickon.hood@codethink.co.uk>,
 Richard Henderson <richard.henderson@linaro.org>,
 Weiwei Li <liweiwei@iscas.ac.cn>, Max Chou <max.chou@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Junqiang Wang <wangjunqiang@iscas.ac.cn>
Subject: [PATCH v5 06/15] target/riscv: Refactor translation of
 vector-widening instruction
Date: Wed, 28 Jun 2023 01:17:37 +0800
Message-Id: <20230627171759.64653-7-max.chou@sifive.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20230627171759.64653-1-max.chou@sifive.com>
References: <20230627171759.64653-1-max.chou@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=max.chou@sifive.com; helo=mail-pl1-x62a.google.com
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

From: Dickon Hood <dickon.hood@codethink.co.uk>

Zvbb (implemented in later commit) has a widening instruction, which
requires an extra check on the enabled extensions.  Refactor
GEN_OPIVX_WIDEN_TRANS() to take a check function to avoid reimplementing
it.

Signed-off-by: Dickon Hood <dickon.hood@codethink.co.uk>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Max Chou <max.chou@sifive.com>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 52 +++++++++++--------------
 1 file changed, 23 insertions(+), 29 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 5dfd524c7d..a556250553 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -1526,30 +1526,24 @@ static bool opivx_widen_check(DisasContext *s, arg_rmrr *a)
            vext_check_ds(s, a->rd, a->rs2, a->vm);
 }
 
-static bool do_opivx_widen(DisasContext *s, arg_rmrr *a,
-                           gen_helper_opivx *fn)
-{
-    if (opivx_widen_check(s, a)) {
-        return opivx_trans(a->rd, a->rs1, a->rs2, a->vm, fn, s);
-    }
-    return false;
-}
-
-#define GEN_OPIVX_WIDEN_TRANS(NAME) \
-static bool trans_##NAME(DisasContext *s, arg_rmrr *a)       \
-{                                                            \
-    static gen_helper_opivx * const fns[3] = {               \
-        gen_helper_##NAME##_b,                               \
-        gen_helper_##NAME##_h,                               \
-        gen_helper_##NAME##_w                                \
-    };                                                       \
-    return do_opivx_widen(s, a, fns[s->sew]);                \
+#define GEN_OPIVX_WIDEN_TRANS(NAME, CHECK) \
+static bool trans_##NAME(DisasContext *s, arg_rmrr *a)                    \
+{                                                                         \
+    if (CHECK(s, a)) {                                                    \
+        static gen_helper_opivx * const fns[3] = {                        \
+            gen_helper_##NAME##_b,                                        \
+            gen_helper_##NAME##_h,                                        \
+            gen_helper_##NAME##_w                                         \
+        };                                                                \
+        return opivx_trans(a->rd, a->rs1, a->rs2, a->vm, fns[s->sew], s); \
+    }                                                                     \
+    return false;                                                         \
 }
 
-GEN_OPIVX_WIDEN_TRANS(vwaddu_vx)
-GEN_OPIVX_WIDEN_TRANS(vwadd_vx)
-GEN_OPIVX_WIDEN_TRANS(vwsubu_vx)
-GEN_OPIVX_WIDEN_TRANS(vwsub_vx)
+GEN_OPIVX_WIDEN_TRANS(vwaddu_vx, opivx_widen_check)
+GEN_OPIVX_WIDEN_TRANS(vwadd_vx, opivx_widen_check)
+GEN_OPIVX_WIDEN_TRANS(vwsubu_vx, opivx_widen_check)
+GEN_OPIVX_WIDEN_TRANS(vwsub_vx, opivx_widen_check)
 
 /* WIDEN OPIVV with WIDEN */
 static bool opiwv_widen_check(DisasContext *s, arg_rmrr *a)
@@ -1997,9 +1991,9 @@ GEN_OPIVX_TRANS(vrem_vx, opivx_check)
 GEN_OPIVV_WIDEN_TRANS(vwmul_vv, opivv_widen_check)
 GEN_OPIVV_WIDEN_TRANS(vwmulu_vv, opivv_widen_check)
 GEN_OPIVV_WIDEN_TRANS(vwmulsu_vv, opivv_widen_check)
-GEN_OPIVX_WIDEN_TRANS(vwmul_vx)
-GEN_OPIVX_WIDEN_TRANS(vwmulu_vx)
-GEN_OPIVX_WIDEN_TRANS(vwmulsu_vx)
+GEN_OPIVX_WIDEN_TRANS(vwmul_vx, opivx_widen_check)
+GEN_OPIVX_WIDEN_TRANS(vwmulu_vx, opivx_widen_check)
+GEN_OPIVX_WIDEN_TRANS(vwmulsu_vx, opivx_widen_check)
 
 /* Vector Single-Width Integer Multiply-Add Instructions */
 GEN_OPIVV_TRANS(vmacc_vv, opivv_check)
@@ -2015,10 +2009,10 @@ GEN_OPIVX_TRANS(vnmsub_vx, opivx_check)
 GEN_OPIVV_WIDEN_TRANS(vwmaccu_vv, opivv_widen_check)
 GEN_OPIVV_WIDEN_TRANS(vwmacc_vv, opivv_widen_check)
 GEN_OPIVV_WIDEN_TRANS(vwmaccsu_vv, opivv_widen_check)
-GEN_OPIVX_WIDEN_TRANS(vwmaccu_vx)
-GEN_OPIVX_WIDEN_TRANS(vwmacc_vx)
-GEN_OPIVX_WIDEN_TRANS(vwmaccsu_vx)
-GEN_OPIVX_WIDEN_TRANS(vwmaccus_vx)
+GEN_OPIVX_WIDEN_TRANS(vwmaccu_vx, opivx_widen_check)
+GEN_OPIVX_WIDEN_TRANS(vwmacc_vx, opivx_widen_check)
+GEN_OPIVX_WIDEN_TRANS(vwmaccsu_vx, opivx_widen_check)
+GEN_OPIVX_WIDEN_TRANS(vwmaccus_vx, opivx_widen_check)
 
 /* Vector Integer Merge and Move Instructions */
 static bool trans_vmv_v_v(DisasContext *s, arg_vmv_v_v *a)
-- 
2.31.1


