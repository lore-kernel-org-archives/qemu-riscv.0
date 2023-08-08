Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 898C9C001B0
	for <qemu-riscv@archiver.kernel.org>; Tue,  8 Aug 2023 03:17:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qTD8m-0001Pu-7q; Mon, 07 Aug 2023 23:12:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qTD8i-00011s-El
 for qemu-riscv@nongnu.org; Mon, 07 Aug 2023 23:12:08 -0400
Received: from mail-oo1-xc2e.google.com ([2607:f8b0:4864:20::c2e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qTD8V-0000EI-S6
 for qemu-riscv@nongnu.org; Mon, 07 Aug 2023 23:12:08 -0400
Received: by mail-oo1-xc2e.google.com with SMTP id
 006d021491bc7-56c85b723cfso3106928eaf.3
 for <qemu-riscv@nongnu.org>; Mon, 07 Aug 2023 20:11:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691464314; x=1692069114;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nSqKhjdDiCtip+BntZ0GsTzaBi/Ae7dOmQKXIzVgS5E=;
 b=hMUILeGMl+8U5fyDztjvIHibyiPrSe14KuhkaR+0ovQimWBUPyqTHzfNiqglC8kHgK
 b0lzYwBbleV4yGtUmvF9/3pFhEsv/0RgSoy6yUAcX0erRzNdYUHSxtFbDYTItaUFV2fe
 Xf0oXtUuuYmFJas0LxeVufF1RZpMpjR2ksl9xG8Nt48W5GfSHVhTxkBUX14ZGY1fQb09
 IvOMJvekXF43YNg86Y2k+pxMrk6Bi0PNnk4LxfWUDactJsl0/o9mBOfTnbNNjBu6fV/A
 6Hgoi13AdPEb8rzP8o1ITYpEUzRjQ8nzgCOKRSkmyUhKmbrcqiW4I6xzDT2KeB90GUrj
 Z2Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691464314; x=1692069114;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nSqKhjdDiCtip+BntZ0GsTzaBi/Ae7dOmQKXIzVgS5E=;
 b=IutTjyj+QboCVU/zefhSSf7ua5l+T//VH130gN6e1R5gUvGvD/mVPAN67iWyQdfSzx
 x5dHjSWsfD9ExzYqwonDMuoxFjsAN95qQ4Inlcue/uBxAc31EgUFGXcN73OFTgamDwCR
 tITydOWfhSSIAU38eY+7cpjNezroUDWW5dpWLs9NMaIMnEMIy0e4KGjbZ3v7O3UkYW71
 g6qOhM1u1vK/VlEbcz9WUdYjvJsoQYt5z1HXhpcnOnpfSRUV87znrXN7svYRYhlYSgD3
 DqamFOU7xEf68x72JjZW5TLPgiHq6TzsU6rplFz2TErIpGe50QwsNoCu7N+4qwRn+7UT
 RdvQ==
X-Gm-Message-State: AOJu0YxWp0awAw4PE93U3sdAOL7Dk4oOPZZuFTUD/iv0rfwj3UX/bJds
 VC+3A8pexERuJl32juOGtZYzxA==
X-Google-Smtp-Source: AGHT+IELVogEc70ksEItVFPJoyr66H01y2FHWEHyYdgYiaqOMkcF5eS8yqpza5g71a9yT5rHrlrgqQ==
X-Received: by 2002:a54:458f:0:b0:3a7:9666:2a60 with SMTP id
 z15-20020a54458f000000b003a796662a60mr5709506oib.51.1691464314498; 
 Mon, 07 Aug 2023 20:11:54 -0700 (PDT)
Received: from stoup.. ([2602:47:d490:6901:e306:567a:e0a1:341])
 by smtp.gmail.com with ESMTPSA id
 g64-20020a636b43000000b0055bf96b11d9sm5639087pgc.89.2023.08.07.20.11.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Aug 2023 20:11:54 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org
Subject: [PATCH 11/24] tcg/ppc: Use the Set Boolean Extension
Date: Mon,  7 Aug 2023 20:11:30 -0700
Message-Id: <20230808031143.50925-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230808031143.50925-1-richard.henderson@linaro.org>
References: <20230808031143.50925-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2e;
 envelope-from=richard.henderson@linaro.org; helo=mail-oo1-xc2e.google.com
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

The SETBC family of instructions requires exactly two insns for
all comparisions, saving 0-3 insns per (neg)setcond.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/ppc/tcg-target.c.inc | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc
index 10448aa0e6..090f11e71c 100644
--- a/tcg/ppc/tcg-target.c.inc
+++ b/tcg/ppc/tcg-target.c.inc
@@ -447,6 +447,11 @@ static bool tcg_target_const_match(int64_t val, TCGType type, int ct)
 #define TW     XO31( 4)
 #define TRAP   (TW | TO(31))
 
+#define SETBC    XO31(384)  /* v3.10 */
+#define SETBCR   XO31(416)  /* v3.10 */
+#define SETNBC   XO31(448)  /* v3.10 */
+#define SETNBCR  XO31(480)  /* v3.10 */
+
 #define NOP    ORI  /* ori 0,0,0 */
 
 #define LVX        XO31(103)
@@ -1624,6 +1629,23 @@ static void tcg_out_setcond(TCGContext *s, TCGType type, TCGCond cond,
         arg2 = (uint32_t)arg2;
     }
 
+    /* With SETBC/SETBCR, we can always implement with 2 insns. */
+    if (have_isa_3_10) {
+        tcg_insn_unit bi, opc;
+
+        tcg_out_cmp(s, cond, arg1, arg2, const_arg2, 7, type);
+
+        /* Re-use tcg_to_bc for BI and BO_COND_{TRUE,FALSE}. */
+        bi = tcg_to_bc[cond] & (0x1f << 16);
+        if (tcg_to_bc[cond] & BO(8)) {
+            opc = neg ? SETNBC : SETBC;
+        } else {
+            opc = neg ? SETNBCR : SETBCR;
+        }
+        tcg_out32(s, opc | RT(arg0) | bi);
+        return;
+    }
+
     /* Handle common and trivial cases before handling anything else.  */
     if (arg2 == 0) {
         switch (cond) {
-- 
2.34.1


