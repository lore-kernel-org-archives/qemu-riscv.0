Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6204C001B0
	for <qemu-riscv@archiver.kernel.org>; Tue,  8 Aug 2023 03:18:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qTD9a-00042G-MG; Mon, 07 Aug 2023 23:13:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qTD8v-0001fw-QI
 for qemu-riscv@nongnu.org; Mon, 07 Aug 2023 23:12:23 -0400
Received: from mail-qk1-x732.google.com ([2607:f8b0:4864:20::732])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qTD8e-0000Lq-GJ
 for qemu-riscv@nongnu.org; Mon, 07 Aug 2023 23:12:21 -0400
Received: by mail-qk1-x732.google.com with SMTP id
 af79cd13be357-7659cb9c42aso381232285a.3
 for <qemu-riscv@nongnu.org>; Mon, 07 Aug 2023 20:12:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691464323; x=1692069123;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/f7JkVfHL643EJ3O1Eknq2OobIgOuuERSYG+cUCRBXY=;
 b=zT39XaoSIsCwy7Br/dzbVOcpNCldA727Se8aj5hLn2cHupnsC+0aP4Kh+zTxl+PSh3
 CzRls10GtbavVA3//+qAceVIaFrb5rceXtACZhcNYuaNINbnO9F9wHHv1xThYnU+h0W/
 YTFxUnfVXjP48aBWuyj1H02Wyi6KdOe1Lmji2wWPjRWl699GdYUXLBQpFEiXHjjQZ+AH
 VJojxaa+VpVCRV+V6XCNQYPiO0jZZGNSJtctqMW5PodLIqCSZ4zGetc2SlUsRYm0ebc+
 s18QbCZ6vJIBxiZ47R8o74ZMzRiNUfSH7qp1c9oOcc/2gA7KpCnmPwEopVY8LqZDVHvC
 t+vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691464323; x=1692069123;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/f7JkVfHL643EJ3O1Eknq2OobIgOuuERSYG+cUCRBXY=;
 b=OykpGXF/KrXJBNx2q/lG6V2Hzk8aRvWotTrV5I1r6n+DUsQdN0mvknWh/zYx3DOEkd
 KqB+RrMip8PkOhk8oJULgs/9+euDLYzLAuJuec5kEbM+dNJq5JNYsSPO7T3DRc3kKeUp
 TZSPaaMJ58K6NGvZJmNHWbRxoBALL5evrRiEtv6U/9czK0AUq4CZV8hWQvKkClix6GCL
 9pdyfuPnfdwsrRHTJYY+N4/wiaZuCUAvfTHv1hWrnkz7TVccaRhjCIyzqbnn3y4sxV6Q
 BS8c9UA6RnHJOQaXW5amQ3Ulv9cC3tj5GWr7Mhwz7h1Kz9ctb/JI0QB9XUub/T2UgZVo
 DNPg==
X-Gm-Message-State: AOJu0YwQaKp1FlN2U81Vm3Phdj9UCjYy9m7+uTzRMszvBM65Bq0GCRrf
 2XN2NU4L/L5bZKIqCj70CPgGgw==
X-Google-Smtp-Source: AGHT+IEd8gkruVqwS1OPyOB9qlMAru4MLT/lkjZl3aBrDV6Yb8/gYKx7Mxe+EeBTGsdrYYNwmUHjpw==
X-Received: by 2002:a05:620a:3953:b0:76c:ce1c:930c with SMTP id
 qs19-20020a05620a395300b0076cce1c930cmr12474381qkn.53.1691464323349; 
 Mon, 07 Aug 2023 20:12:03 -0700 (PDT)
Received: from stoup.. ([2602:47:d490:6901:e306:567a:e0a1:341])
 by smtp.gmail.com with ESMTPSA id
 g64-20020a636b43000000b0055bf96b11d9sm5639087pgc.89.2023.08.07.20.12.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Aug 2023 20:12:02 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org
Subject: [PATCH 21/24] tcg/i386: Use CMP+SBB in tcg_out_setcond
Date: Mon,  7 Aug 2023 20:11:40 -0700
Message-Id: <20230808031143.50925-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230808031143.50925-1-richard.henderson@linaro.org>
References: <20230808031143.50925-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::732;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x732.google.com
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

Use the carry bit to optimize some forms of setcond.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/i386/tcg-target.c.inc | 50 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index 56549ff2a0..e06ac638b0 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -1528,6 +1528,56 @@ static void tcg_out_setcond(TCGContext *s, int rexw, TCGCond cond,
                             TCGArg dest, TCGArg arg1, TCGArg arg2,
                             int const_arg2)
 {
+    bool inv = false;
+
+    switch (cond) {
+    case TCG_COND_NE:
+        inv = true;
+        /* fall through */
+    case TCG_COND_EQ:
+        /* If arg2 is 0, convert to LTU/GEU vs 1. */
+        if (const_arg2 && arg2 == 0) {
+            arg2 = 1;
+            goto do_ltu;
+        }
+        break;
+
+    case TCG_COND_LEU:
+        inv = true;
+        /* fall through */
+    case TCG_COND_GTU:
+        /* If arg2 is a register, swap for LTU/GEU. */
+        if (!const_arg2) {
+            TCGReg t = arg1;
+            arg1 = arg2;
+            arg2 = t;
+            goto do_ltu;
+        }
+        break;
+
+    case TCG_COND_GEU:
+        inv = true;
+        /* fall through */
+    case TCG_COND_LTU:
+    do_ltu:
+        /*
+         * Relying on the carry bit, use SBB to produce -1 if LTU, 0 if GEU.
+         * We can then use NEG or INC to produce the desired result.
+         * This is always smaller than the SETCC expansion.
+         */
+        tcg_out_cmp(s, rexw, arg1, arg2, const_arg2, true);
+        tgen_arithr(s, ARITH_SBB, dest, dest);              /* T:-1 F:0 */
+        if (inv) {
+            tgen_arithi(s, ARITH_ADD, dest, 1, 0);          /* T:0  F:1 */
+        } else {
+            tcg_out_modrm(s, OPC_GRP3_Ev, EXT3_NEG, dest);  /* T:1  F:0 */
+        }
+        return;
+
+    default:
+        break;
+    }
+
     tcg_out_cmp(s, rexw, arg1, arg2, const_arg2, false);
     tcg_out_modrm(s, OPC_SETCC | tcg_cond_to_jcc[cond], 0, dest);
     tcg_out_ext8u(s, dest, dest);
-- 
2.34.1


