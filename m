Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7545BD2A545
	for <qemu-riscv@archiver.kernel.org>; Wed, 16 Oct 2024 19:34:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1t19kX-0002qO-Kl; Wed, 16 Oct 2024 15:32:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1t19kQ-0002jD-BA
 for qemu-riscv@nongnu.org; Wed, 16 Oct 2024 15:31:54 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1t19kN-0003qw-Pq
 for qemu-riscv@nongnu.org; Wed, 16 Oct 2024 15:31:54 -0400
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-20c77459558so1574635ad.0
 for <qemu-riscv@nongnu.org>; Wed, 16 Oct 2024 12:31:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729107110; x=1729711910; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6H4o7TRLnsRJPcQeLHBRIU6aVhm6+5BjLCNGhX0wWuw=;
 b=L/o/rlEyhNAgVGjyorwnpU9hcJ1k5Bt6wx4/7ml0DJR0EOVQ8HEejeYCEriUGYTT96
 TyTWkeqp6T2VVx9uuDY/W89WGgFFZqZbiNpB9iSMcAY4AUQhvNAkxrL3GJXpwx5Lqn57
 XhkX88AdHrzcKD0lb7+Vyq41jP7eMVra04bR9CksqzP7DE8+KNbBsG/WxH+DCh7Kr2cZ
 qlu92xaA7FG9TcJ0y8P2lDXnjGC8ABvx/1OX5wkVyT+0Im7TpB8QU6fey3XLvNR0g0br
 vZz05+CZsV3sLgrUsuc8g7udE8yMLi0vHgCl+8zZHTCEZIeU1Cdag/656096jI10w9lr
 E9wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729107110; x=1729711910;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6H4o7TRLnsRJPcQeLHBRIU6aVhm6+5BjLCNGhX0wWuw=;
 b=ZRNZdV5T3ofRs5O1tl2V6XH2LYK9cLRbrKfyi83RR8U+SUjaEXF/euzrFyMpwlb1qA
 wOBuVEJjSd7WoQSrB44nbFvR2fiANEakbQYZeH9IIj7qJMutrvs3z2LhyPaAuIAfHlmD
 HEbjgF/AmAEzFrxpSXwemTZssgt7ozZTFBg9sFZVKpHw3n0VCuqpw3uuO7OkKJnLdoMa
 5oJNLkzjOWcsMxs0fCUW318WUXs/mWuUxKR4t4/EpYcsAQ87K2d833pGnTGpANlip3fb
 Pg9cmA4lRy5d0cORtRlm6xG0knSz47yCe9qFXSdqc/6/r520i6nTrKsrIqTWMqjmeunb
 21iA==
X-Gm-Message-State: AOJu0Yzq3ctV+d0/N4ZGQrPkT1wsPQozQef1Df9p2OlRGIW33+VDdsoE
 pzt7RD7hN/Kn3lU4Lkh0TQPjgAdkO7Cn0xLPucfpE773xtaY7eY8S9FOxWDhxfE=
X-Google-Smtp-Source: AGHT+IHyef5gU8YF/LrckS5jVNe2zwe/pXEjPQ570wUQj+Pxz1g5LQeVFafF6agG7k9ZB/PCljkXEA==
X-Received: by 2002:a17:902:ce09:b0:20d:2e83:6995 with SMTP id
 d9443c01a7336-20d2e836aa1mr57558115ad.47.1729107110253; 
 Wed, 16 Oct 2024 12:31:50 -0700 (PDT)
Received: from stoup.. (174-21-81-121.tukw.qwest.net. [174.21.81.121])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-20d1804b6b1sm32323945ad.189.2024.10.16.12.31.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Oct 2024 12:31:49 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 zhiwei_liu@linux.alibaba.com,
 TANG Tiancheng <tangtiancheng.ttc@alibaba-inc.com>
Subject: [PATCH v6 13/14] tcg/riscv: Implement vector roti/v/x ops
Date: Wed, 16 Oct 2024 12:31:39 -0700
Message-ID: <20241016193140.2206352-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241016193140.2206352-1-richard.henderson@linaro.org>
References: <20241016193140.2206352-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: TANG Tiancheng <tangtiancheng.ttc@alibaba-inc.com>

Signed-off-by: TANG Tiancheng <tangtiancheng.ttc@alibaba-inc.com>
Reviewed-by: Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Message-ID: <20241007025700.47259-12-zhiwei_liu@linux.alibaba.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/riscv/tcg-target.h     |  6 +++---
 tcg/riscv/tcg-target.c.inc | 36 ++++++++++++++++++++++++++++++++++++
 2 files changed, 39 insertions(+), 3 deletions(-)

diff --git a/tcg/riscv/tcg-target.h b/tcg/riscv/tcg-target.h
index 76d30e789b..e6d66cd1b9 100644
--- a/tcg/riscv/tcg-target.h
+++ b/tcg/riscv/tcg-target.h
@@ -154,9 +154,9 @@ typedef enum {
 #define TCG_TARGET_HAS_not_vec          1
 #define TCG_TARGET_HAS_neg_vec          1
 #define TCG_TARGET_HAS_abs_vec          0
-#define TCG_TARGET_HAS_roti_vec         0
-#define TCG_TARGET_HAS_rots_vec         0
-#define TCG_TARGET_HAS_rotv_vec         0
+#define TCG_TARGET_HAS_roti_vec         1
+#define TCG_TARGET_HAS_rots_vec         1
+#define TCG_TARGET_HAS_rotv_vec         1
 #define TCG_TARGET_HAS_shi_vec          1
 #define TCG_TARGET_HAS_shs_vec          1
 #define TCG_TARGET_HAS_shv_vec          1
diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
index 2c78ea6507..f8331e4688 100644
--- a/tcg/riscv/tcg-target.c.inc
+++ b/tcg/riscv/tcg-target.c.inc
@@ -2488,6 +2488,34 @@ static void tcg_out_vec_op(TCGContext *s, TCGOpcode opc,
         set_vtype_len_sew(s, type, vece);
         tcg_out_vshifti(s, OPC_VSRA_VI, OPC_VSRA_VX, a0, a1, a2);
         break;
+    case INDEX_op_rotli_vec:
+        set_vtype_len_sew(s, type, vece);
+        tcg_out_vshifti(s, OPC_VSLL_VI, OPC_VSLL_VX, TCG_REG_V0, a1, a2);
+        tcg_out_vshifti(s, OPC_VSRL_VI, OPC_VSRL_VX, a0, a1,
+                        -a2 & ((8 << vece) - 1));
+        tcg_out_opc_vv(s, OPC_VOR_VV, a0, a0, TCG_REG_V0);
+        break;
+    case INDEX_op_rotls_vec:
+        set_vtype_len_sew(s, type, vece);
+        tcg_out_opc_vx(s, OPC_VSLL_VX, TCG_REG_V0, a1, a2);
+        tcg_out_opc_reg(s, OPC_SUBW, TCG_REG_TMP0, TCG_REG_ZERO, a2);
+        tcg_out_opc_vx(s, OPC_VSRL_VX, a0, a1, TCG_REG_TMP0);
+        tcg_out_opc_vv(s, OPC_VOR_VV, a0, a0, TCG_REG_V0);
+        break;
+    case INDEX_op_rotlv_vec:
+        set_vtype_len_sew(s, type, vece);
+        tcg_out_opc_vi(s, OPC_VRSUB_VI, TCG_REG_V0, a2, 0);
+        tcg_out_opc_vv(s, OPC_VSRL_VV, TCG_REG_V0, a1, TCG_REG_V0);
+        tcg_out_opc_vv(s, OPC_VSLL_VV, a0, a1, a2);
+        tcg_out_opc_vv(s, OPC_VOR_VV, a0, a0, TCG_REG_V0);
+        break;
+    case INDEX_op_rotrv_vec:
+        set_vtype_len_sew(s, type, vece);
+        tcg_out_opc_vi(s, OPC_VRSUB_VI, TCG_REG_V0, a2, 0);
+        tcg_out_opc_vv(s, OPC_VSLL_VV, TCG_REG_V0, a1, TCG_REG_V0);
+        tcg_out_opc_vv(s, OPC_VSRL_VV, a0, a1, a2);
+        tcg_out_opc_vv(s, OPC_VOR_VV, a0, a0, TCG_REG_V0);
+        break;
     case INDEX_op_cmp_vec:
         tcg_out_cmpsel(s, type, vece, args[3], a0, a1, a2, c2,
                        -1, true, 0, true);
@@ -2537,6 +2565,10 @@ int tcg_can_emit_vec_op(TCGOpcode opc, TCGType type, unsigned vece)
     case INDEX_op_shri_vec:
     case INDEX_op_shli_vec:
     case INDEX_op_sari_vec:
+    case INDEX_op_rotls_vec:
+    case INDEX_op_rotlv_vec:
+    case INDEX_op_rotrv_vec:
+    case INDEX_op_rotli_vec:
     case INDEX_op_cmp_vec:
     case INDEX_op_cmpsel_vec:
         return 1;
@@ -2695,6 +2727,7 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
     case INDEX_op_shli_vec:
     case INDEX_op_shri_vec:
     case INDEX_op_sari_vec:
+    case INDEX_op_rotli_vec:
         return C_O1_I1(v, v);
     case INDEX_op_add_vec:
     case INDEX_op_and_vec:
@@ -2715,10 +2748,13 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
     case INDEX_op_shlv_vec:
     case INDEX_op_shrv_vec:
     case INDEX_op_sarv_vec:
+    case INDEX_op_rotlv_vec:
+    case INDEX_op_rotrv_vec:
         return C_O1_I2(v, v, v);
     case INDEX_op_shls_vec:
     case INDEX_op_shrs_vec:
     case INDEX_op_sars_vec:
+    case INDEX_op_rotls_vec:
         return C_O1_I2(v, v, r);
     case INDEX_op_cmp_vec:
         return C_O1_I2(v, v, vL);
-- 
2.43.0


