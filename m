Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CE3AC5AD7B
	for <qemu-riscv@archiver.kernel.org>; Sun,  9 Aug 2026 22:44:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wtCBG-0005uQ-0T; Sun, 09 Aug 2026 18:39:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wtCBE-0005sf-JB
 for qemu-riscv@nongnu.org; Sun, 09 Aug 2026 18:39:44 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wtCBB-00082n-AT
 for qemu-riscv@nongnu.org; Sun, 09 Aug 2026 18:39:44 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 98e67ed59e1d1-38125cebfdaso1642204a91.1
 for <qemu-riscv@nongnu.org>; Sun, 09 Aug 2026 15:39:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1786315180; x=1786919980; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=2Cjtp0kSC2EC9ntVOyIYKDIN43KY5qOuxwt7Sk7NLWA=;
 b=ZKQxw7zzsg+IwVH/0o/7oc2vdIIWDlMVWtw1TpfjcMZipfiqn2MFvvehWcGdOknK1F
 eGj/1KLj1rK3PDGbQ5H+ut/SXNL2/eZ/wNrrtKeQ+Jlu6EqdYEuDmUT0O/HaqvC1jZZg
 SDLHJBGcks4Gqldj5PEjac04yoO3AhePJgifF+9wOO/XjqTT0ZeAU7qXbbeDzgeuxclv
 bto/4zlyPIDH0aQXGhSJOFrbrfIezllZDolLxrRKh4OohjoXtv2NIboPLyXOcxxD0t6B
 jCKblmmp+rSlyf0SRPD7rtRb3OS0Hg9Zuq1v1jLf1RWgWm03iHQuc8nbM7cLmIJiKUER
 DZGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786315180; x=1786919980;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=2Cjtp0kSC2EC9ntVOyIYKDIN43KY5qOuxwt7Sk7NLWA=;
 b=fmw9BZM2YfGWS9+tOD3uO9S4ilBa8KNKR1+QhWH9LH3Nwgol3RZmkS+/+NASXfXlz8
 jxQJYrY0sPyPoo0a+kP9y6eAJhinFkFXmynHW15CxaHnuD7hAw7PgXqDSgxKHFDnJyUb
 HPrHr3UxH9Nci5hRJxjWWIvhPbD1N52yVHrZtDdyP+uOcbesQSgR98/KgeffWXtxixHT
 wYJ02Jr6J0/v/QuW9iOvMFLls5lvtH2Tu85qiy1r6Udm4eLIp1mijGHaKl8rU/hpedob
 R/xQFpAe10L2Uz6RMmsyN/OMQ3Iv0jmqq7a2Tn/YS+OD+WLi8D+o3DJaOoKUERudCKXQ
 JGFQ==
X-Gm-Message-State: AOJu0YxE7vvVAgirSvTsjKsfrNcQPs3EzPqgeDAcmABMEsCoN8qGAj0a
 oowznh7SeZQF345tkmUl7BDYHfphNgYORbuOjivYL3FA5nEpWHaPCvC87Xo4TYs8XWc=
X-Gm-Gg: AR+sD11mCPRvfvkcdiWE4Z5KTnW2v2jLvR+hgegXvT95sfFVWCPfsMDjjkM7o2xxYqr
 tW6hSRAStbuy/cn7L9Fe+lLGGz9BLYxr2alNYoZJcYE6v6LK6HoOWXoe1L/NIsAAQPti8eCZ88A
 fDcJjTGXaqJL1wuwAhm++bLU2w1JFL+BH535XqKJe/G6Pi3BFok9gju3OOwYC8Px1roCdxxWumy
 yYgnCWFy87xL0PIwCU8xHk1UfkMIoAQ2zUWOQZl2gtl4HYnsaP7GuQNzbfJJom8BIdNl2c82v4I
 ZBrZ533aXRUy2L44o2Yp+8MTjsq3T64XAeAXL64beEUIdECUXJqiGLlUl+PDAXs95PaJukoo/9d
 tbR6zPjyhUadUxzQ+4A992ZA99I3rPrk749Bkaf0J6/yHdAevFKCiocCCEAdvYcPod5AvdMFQk4
 efkgQlMZp124qnktZ0Hu9yGmBRuUea/z3JP5sJuUEFxcg+/lFsJQGNSIFMT+Q4F8q+86YHNsB2o
 zfdhKnyC8EjXHBu/kZC
X-Received: by 2002:a17:90b:590d:b0:38f:5801:cd76 with SMTP id
 98e67ed59e1d1-39261f71c4cmr21641790a91.3.1786315179908; 
 Sun, 09 Aug 2026 15:39:39 -0700 (PDT)
Received: from stoup.. (174-21-93-59.tukw.qwest.net. [174.21.93.59])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-390b1573defsm4264430a91.1.2026.08.09.15.39.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Aug 2026 15:39:39 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org,
	qemu-stable@nongnu.org
Subject: [PATCH 44/56] disas/riscv: Fix typo in th.lbib format
Date: Sun,  9 Aug 2026 15:35:33 -0700
Message-ID: <20260809223545.730664-45-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260809223545.730664-1-richard.henderson@linaro.org>
References: <20260809223545.730664-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

th.lbib should format the same as th.lbia, and the other
increment insns, with the address register in parenthesis.

Cc: qemu-stable@nongnu.org
Fixes: 318df7238b9 ("disas/riscv: Add support for XThead* instructions")
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 disas/riscv-xthead.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/disas/riscv-xthead.c b/disas/riscv-xthead.c
index 428a6380e9..fbc96631fd 100644
--- a/disas/riscv-xthead.c
+++ b/disas/riscv-xthead.c
@@ -189,7 +189,7 @@ static const rv_opcode_data xthead_opcode_data[] = {
     { "th.mulsh", rv_codec_r, rv_fmt_rd_rs1_rs2 },
     /* XTheadMemIdx */
     { "th.lbia", rv_codec_r2_imm2_imm5, rv_fmt_rd_rs1_immh_imml_addr },
-    { "th.lbib", rv_codec_r2_imm2_imm5, rv_fmt_rd_rs1_immh_imml },
+    { "th.lbib", rv_codec_r2_imm2_imm5, rv_fmt_rd_rs1_immh_imml_addr },
     { "th.lbuia", rv_codec_r2_imm2_imm5, rv_fmt_rd_rs1_immh_imml_addr },
     { "th.lbuib", rv_codec_r2_imm2_imm5, rv_fmt_rd_rs1_immh_imml_addr },
     { "th.lhia", rv_codec_r2_imm2_imm5, rv_fmt_rd_rs1_immh_imml_addr },
-- 
2.43.0


