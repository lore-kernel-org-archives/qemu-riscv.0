Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF377C001B0
	for <qemu-riscv@archiver.kernel.org>; Tue,  8 Aug 2023 03:17:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qTD98-0002FJ-NY; Mon, 07 Aug 2023 23:12:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qTD8m-0001RU-NV
 for qemu-riscv@nongnu.org; Mon, 07 Aug 2023 23:12:12 -0400
Received: from mail-qk1-x735.google.com ([2607:f8b0:4864:20::735])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qTD8Y-0000GZ-Ep
 for qemu-riscv@nongnu.org; Mon, 07 Aug 2023 23:12:12 -0400
Received: by mail-qk1-x735.google.com with SMTP id
 af79cd13be357-7658430eb5dso504649985a.2
 for <qemu-riscv@nongnu.org>; Mon, 07 Aug 2023 20:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691464317; x=1692069117;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2j5vEpa4xN9aVYYq+cztOssEG+ehvNVdIB8DhEEWJso=;
 b=a6y8J+x45T/GJSP+QVTjToVBBt/vIB6dLqiU1eFRwcSLJLh4+okoLgca3S2+XeO+tk
 HxGXEZxKj3VcQ6l5Roc0J+bPa9ilOZI7HyUmRtsz+RvN2OBHPJGnGHRJLZSggtDyAZkf
 D0o7EFwLwb8zi1WEN7Mvph7sqAFVSSRv+Fn3v2WrtycW9eUFf61PrsMrC29uX+M4Ydsg
 nGzxgvYdngdcrcByLlyr8YJmGdB3EE+tL9/J/LFAmYWmPV+A5Ql02KGZGY59fB00CLMh
 K6DxnfkOI9mUcQBlVpcGN+nijMG34d0ZEf61UgnVCstyiQNUR9ToN0SfEZYDGxuc9Syx
 25zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691464317; x=1692069117;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2j5vEpa4xN9aVYYq+cztOssEG+ehvNVdIB8DhEEWJso=;
 b=YUyjlmliOnGqw82qMBq3v3lvhuxdVPNN5Mxu/tQEalD86rLo5b2Rqst1ufmAnsjCNf
 N6/zcLpoCDw9jQiUXOjnXIQJgoeJ93tMyKxrE++HFFOP6GthewjX/8abxhfIpIqzukzG
 HxpEW2wobdHYHgloLygkINzps3h43ICAUEHmNnPk8pIESs5dBvLFKLGEMdeQiwZlIbtq
 Yv4UuYlu7QQama3JOyn/oJZu2dNRVcV4CAA1ymg/HBgfzaoarHT0BGbOlczZk8Byzz/S
 UIlJ6wQdwMgVLFiK0Uz6OFX7JBczeKvZ+93s8lHmG7Ng4pLM4IJSOiUf74ZLuNaiAjrx
 UB4Q==
X-Gm-Message-State: AOJu0YypJdA3lM9bNDFXZhKWv8b6pGwIL88hAnQFHIfCAQO/AjkC0cvV
 7b2beFpEFKhcH40DD0c5Wxzq6Q==
X-Google-Smtp-Source: AGHT+IG8jVhgvIsnVSoRjXi39egK2JtAx8Untfba3eOLVUAyGlcfneldl9FXtdcD39tgyOox+sYZOA==
X-Received: by 2002:a05:620a:2493:b0:76c:9610:95cc with SMTP id
 i19-20020a05620a249300b0076c961095ccmr17384156qkn.33.1691464317232; 
 Mon, 07 Aug 2023 20:11:57 -0700 (PDT)
Received: from stoup.. ([2602:47:d490:6901:e306:567a:e0a1:341])
 by smtp.gmail.com with ESMTPSA id
 g64-20020a636b43000000b0055bf96b11d9sm5639087pgc.89.2023.08.07.20.11.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Aug 2023 20:11:56 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org
Subject: [PATCH 14/24] tcg/riscv: Implement negsetcond_*
Date: Mon,  7 Aug 2023 20:11:33 -0700
Message-Id: <20230808031143.50925-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230808031143.50925-1-richard.henderson@linaro.org>
References: <20230808031143.50925-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::735;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x735.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/riscv/tcg-target.h     |  4 ++--
 tcg/riscv/tcg-target.c.inc | 45 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 47 insertions(+), 2 deletions(-)

diff --git a/tcg/riscv/tcg-target.h b/tcg/riscv/tcg-target.h
index b2961fec8e..7e8ac48a7d 100644
--- a/tcg/riscv/tcg-target.h
+++ b/tcg/riscv/tcg-target.h
@@ -120,7 +120,7 @@ extern bool have_zbb;
 #define TCG_TARGET_HAS_ctpop_i32        have_zbb
 #define TCG_TARGET_HAS_brcond2          1
 #define TCG_TARGET_HAS_setcond2         1
-#define TCG_TARGET_HAS_negsetcond_i32   0
+#define TCG_TARGET_HAS_negsetcond_i32   1
 #define TCG_TARGET_HAS_qemu_st8_i32     0
 
 #define TCG_TARGET_HAS_movcond_i64      1
@@ -159,7 +159,7 @@ extern bool have_zbb;
 #define TCG_TARGET_HAS_muls2_i64        0
 #define TCG_TARGET_HAS_muluh_i64        1
 #define TCG_TARGET_HAS_mulsh_i64        1
-#define TCG_TARGET_HAS_negsetcond_i64   0
+#define TCG_TARGET_HAS_negsetcond_i64   1
 
 #define TCG_TARGET_HAS_qemu_ldst_i128   0
 
diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
index eeaeb6b6e3..232b616af3 100644
--- a/tcg/riscv/tcg-target.c.inc
+++ b/tcg/riscv/tcg-target.c.inc
@@ -936,6 +936,44 @@ static void tcg_out_setcond(TCGContext *s, TCGCond cond, TCGReg ret,
     }
 }
 
+static void tcg_out_negsetcond(TCGContext *s, TCGCond cond, TCGReg ret,
+                               TCGReg arg1, tcg_target_long arg2, bool c2)
+{
+    int tmpflags;
+    TCGReg tmp;
+
+    /* For LT/GE comparison against 0, replicate the sign bit. */
+    if (c2 && arg2 == 0) {
+        switch (cond) {
+        case TCG_COND_GE:
+            tcg_out_opc_imm(s, OPC_XORI, ret, arg1, -1);
+            arg1 = ret;
+            /* fall through */
+        case TCG_COND_LT:
+            tcg_out_opc_imm(s, OPC_SRAI, ret, arg1, TCG_TARGET_REG_BITS - 1);
+            return;
+        default:
+            break;
+        }
+    }
+
+    tmpflags = tcg_out_setcond_int(s, cond, ret, arg1, arg2, c2);
+    tmp = tmpflags & ~SETCOND_FLAGS;
+
+    /* If intermediate result is zero/non-zero: test != 0. */
+    if (tmpflags & SETCOND_NEZ) {
+        tcg_out_opc_reg(s, OPC_SLTU, ret, TCG_REG_ZERO, tmp);
+        tmp = ret;
+    }
+
+    /* Produce the 0/-1 result. */
+    if (tmpflags & SETCOND_INV) {
+        tcg_out_opc_imm(s, OPC_ADDI, ret, tmp, -1);
+    } else {
+        tcg_out_opc_reg(s, OPC_SUB, ret, TCG_REG_ZERO, tmp);
+    }
+}
+
 static void tcg_out_movcond_zicond(TCGContext *s, TCGReg ret, TCGReg test_ne,
                                    int val1, bool c_val1,
                                    int val2, bool c_val2)
@@ -1782,6 +1820,11 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
         tcg_out_setcond(s, args[3], a0, a1, a2, c2);
         break;
 
+    case INDEX_op_negsetcond_i32:
+    case INDEX_op_negsetcond_i64:
+        tcg_out_negsetcond(s, args[3], a0, a1, a2, c2);
+        break;
+
     case INDEX_op_movcond_i32:
     case INDEX_op_movcond_i64:
         tcg_out_movcond(s, args[5], a0, a1, a2, c2,
@@ -1910,6 +1953,8 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
     case INDEX_op_xor_i64:
     case INDEX_op_setcond_i32:
     case INDEX_op_setcond_i64:
+    case INDEX_op_negsetcond_i32:
+    case INDEX_op_negsetcond_i64:
         return C_O1_I2(r, r, rI);
 
     case INDEX_op_andc_i32:
-- 
2.34.1


