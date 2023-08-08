Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E100EB64DD
	for <qemu-riscv@archiver.kernel.org>; Tue,  8 Aug 2023 03:16:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qTD9c-0004Ig-NO; Mon, 07 Aug 2023 23:13:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qTD8y-0001ik-8u
 for qemu-riscv@nongnu.org; Mon, 07 Aug 2023 23:12:25 -0400
Received: from mail-ot1-x336.google.com ([2607:f8b0:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qTD8g-0000Mw-F6
 for qemu-riscv@nongnu.org; Mon, 07 Aug 2023 23:12:24 -0400
Received: by mail-ot1-x336.google.com with SMTP id
 46e09a7af769-6bcd4b5ebbaso3104043a34.1
 for <qemu-riscv@nongnu.org>; Mon, 07 Aug 2023 20:12:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691464325; x=1692069125;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6EOxe5rq5CkC99jUD9BB2Rzj7nk3YmOBqVYbqZbgC9Y=;
 b=YtCr5WT4JZ7PqlIYfbJ/+eQoGlFj4dkbROp4d1fFu7DctOEAQoHHrNE7WBe/SNi93I
 5cwoVe3LPN5NxeeA1dbiZYYVVZDeL14Vz+BjYyqvMYK+RCZTOtJDhv1NvakTE9vqqj8N
 PFYbY2sJfg+zJDAbLghbYT8095C0CwUTvY5DRxDIcBOwlBSedhEgqQzRhywT9cCpqGw5
 n1ou6ExupjHpGBt7r1yA0RmPfqvawJzmDfDECX3K9dvXD7/WsezkL5wAaMXnlsEnBKmy
 9E6hPy/H4OGB6ANUQSovGvp/kny3oN/lXCcL9rrFmNFhFpEa0JL1pVVXe+F5VY1Iks0c
 1VxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691464325; x=1692069125;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6EOxe5rq5CkC99jUD9BB2Rzj7nk3YmOBqVYbqZbgC9Y=;
 b=F084nbAvBH7ZCmsi27sw+SGu789uleWBAQp1h5w4TtRDO0xoSmL61a+RNZTlketqQl
 nVFvESlTkeXigTyuG3dwiBO/abUvEQKBBWNlyP7H/TEoxtg0SbfDhfrsvcKEp+LRa79/
 r5lasNvJAIw+QjZzboetdyfxspI374XkI6ygHOpEiWsRHk0gtbK+IhySn1AtEEg6to7z
 nOvpWHBeYD/g5KQXBL0PNu7HZ/DxeFNgODm7vFfBh/4mEdgk30dV6HGpWNj6FfzbHRdX
 96nJk4Y9W8ldc6od6AfMsV0vdsg9VHm4tna+D8b31xJPOX1vRbE27tA/yts9kLJA2V4d
 2kbg==
X-Gm-Message-State: AOJu0YzJPfTeJFikzEto63xOfJFKfzZWzcwdQXX9xzhPfoF7PSFVZWW7
 gls7naWQpsPsXefEy/82oGga5g==
X-Google-Smtp-Source: AGHT+IHCr4PhfMZNCUvy8TvETJhBBpSERO9GzvUcf0hprQ6HEDV5JSR9qKvwcufG1lIguTDPodmmHg==
X-Received: by 2002:a05:6830:16c6:b0:6bc:f854:4850 with SMTP id
 l6-20020a05683016c600b006bcf8544850mr4303146otr.4.1691464325089; 
 Mon, 07 Aug 2023 20:12:05 -0700 (PDT)
Received: from stoup.. ([2602:47:d490:6901:e306:567a:e0a1:341])
 by smtp.gmail.com with ESMTPSA id
 g64-20020a636b43000000b0055bf96b11d9sm5639087pgc.89.2023.08.07.20.12.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Aug 2023 20:12:04 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org
Subject: [PATCH 23/24] tcg/i386: Use shift in tcg_out_setcond
Date: Mon,  7 Aug 2023 20:11:42 -0700
Message-Id: <20230808031143.50925-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230808031143.50925-1-richard.henderson@linaro.org>
References: <20230808031143.50925-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::336;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x336.google.com
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

For LT/GE vs zero, shift down the sign bit.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/i386/tcg-target.c.inc | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index cca49fe63a..f68722b8a5 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -1575,6 +1575,21 @@ static void tcg_out_setcond(TCGContext *s, int rexw, TCGCond cond,
         }
         return;
 
+    case TCG_COND_GE:
+        inv = true;
+        /* fall through */
+    case TCG_COND_LT:
+        /* If arg2 is 0, extract the sign bit. */
+        if (const_arg2 && arg2 == 0) {
+            tcg_out_mov(s, rexw ? TCG_TYPE_I64 : TCG_TYPE_I32, dest, arg1);
+            if (inv) {
+                tcg_out_modrm(s, OPC_GRP3_Ev + rexw, EXT3_NOT, dest);
+            }
+            tcg_out_shifti(s, SHIFT_SHR + rexw, dest, rexw ? 63 : 31);
+            return;
+        }
+        break;
+
     default:
         break;
     }
-- 
2.34.1


