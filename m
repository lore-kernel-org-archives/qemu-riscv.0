Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8363EC5CFDB
	for <qemu-riscv@archiver.kernel.org>; Wed, 12 Aug 2026 22:36:42 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wuHXi-00012G-2h; Wed, 12 Aug 2026 18:35:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wuHXg-000117-L1
 for qemu-riscv@nongnu.org; Wed, 12 Aug 2026 18:35:24 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wuHXe-0001of-VJ
 for qemu-riscv@nongnu.org; Wed, 12 Aug 2026 18:35:24 -0400
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-2ccf2360620so15750875ad.3
 for <qemu-riscv@nongnu.org>; Wed, 12 Aug 2026 15:35:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1786574122; x=1787178922; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Q7rP/XM/owlqnwOCNDD6Fk3HJHISzcNBKQfAsZY+VBU=;
 b=hhGCdUUCdAyv4VTd9UVgJTzH9i1YAK4QAxZK0WrqHu5RdO3bTtDgJB5PsgEmka/9KS
 JQzwkQQuXLxNTFDy2WzsdHJd2e4m5JU6g5uuBb/I/sETF7Lw5KDFclTYY6q/c6tIKGvH
 CS8ogd4iv1OUfWW/j9jOSisOcwfVTOXODnvS3KZCiBXx8/3drFInXbgNItW6+lFCo/ty
 tPUClpvSwleERuWUe4VsWZ11YUDeKt+hMhEjq5TDAyijMv5+QJv9uqtXYcTXKGygSUmf
 PRH2JCsWLb89c1ChL5uLlwFQQvTvqG09cn2pn0A2vyL6veJe3JJGDA+qVkDDAXPKSuUY
 4c8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786574122; x=1787178922;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=Q7rP/XM/owlqnwOCNDD6Fk3HJHISzcNBKQfAsZY+VBU=;
 b=Mso0agj+Cib7cdyCk+5FPPkA/SAfLFpucoBrPUsW7BTmTOTge3sVI+63ddIusRuICz
 7zVOh5xF7zVbHc5owWVtWJxhU1+wOV/DYVKHA0MkdaEdsfRcmJwqmFpALBbV32iPZKbF
 r4Z7FweSpQQCduJrSUXVZkUirUJNyXf2MI5GkMLrTihrmL+CAUe69DdrE5cTqRC1yqiA
 CnfF59rp81WCyGp+E1G1DQRmk5G79ftdnTM9gK0/4jjwGokE7A4NPfIkuotHH+r7l+mo
 S+cWK4ZU2obDWvA2i+AiXyHEBtKMcWxYCDn+lAiBS9slAIQDQaaK1xCbsjX6ujwsIk/3
 qPaw==
X-Gm-Message-State: AOJu0YwwZimH4xBDibj/0jZfVzsHSUi/1DpreD8WaWeuuUCPLkuL3zP5
 kypmOhM/osOo/ni5a4UWGR5lRprUiGDcFRpLAcLKWoXcCQLWT1lZlGB7YdOg9hxyQBE=
X-Gm-Gg: AR+sD12y4J+83qjjw4+uvpkqc39CGnMXj78Xh17QLUrDXfrhfSEqiHb4lK6Grb67JSj
 OiqbKml9lHGFyaQoAl/BHZJo3TAAT2228LYK+7c5YSWklrOSWkjJiEbXgfd0AqTkZmYuzYAEz9w
 Uox7VJdrRItwrBbJPd3k3UuBF4rAfldjbON0bFvc4/HNF/s2pdxdusAzcZedQe8RE7gDxnrDqIC
 6qa3Jbo5/qms+OkD6OyL9HUmr5c2O8bdMeFcaj2lQHB0Eg26H4mV5xd9xTD5PSQNPICnZuuqcZM
 3vYXRFKAkBGVymWrTaUibt8ARqxgCbdDNZTJVLWQSwc7X5LrbmHBRvr131F3QYyBkzr/egVomFP
 WchmU1aXIF+51BPt03W8VYWvMIJRd3dP79C2YELrbXCL+dK01RzxlabaRCpf/4aO4OT85kOOnwz
 zLPLEcwkzDxicf+rUTHeK9OEo4LSUzPQ0tS8ctn4GZsP20n76qO0Hx2e/sPv0E8XtaVHkI+Oi2M
 fmcyAeWMqmjHITLhigB
X-Received: by 2002:a17:90b:514c:b0:38d:ddc2:7ccb with SMTP id
 98e67ed59e1d1-3931dfd0897mr1815582a91.1.1786574121542; 
 Wed, 12 Aug 2026 15:35:21 -0700 (PDT)
Received: from stoup.. (174-21-93-59.tukw.qwest.net. [174.21.93.59])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3931f41cd2fsm464854a91.12.2026.08.12.15.35.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Aug 2026 15:35:21 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Alistair.Francis@wdc.com, qemu-stable@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v2 40/52] disas/riscv: Fix typo in th.lbib format
Date: Wed, 12 Aug 2026 15:31:30 -0700
Message-ID: <20260812223142.349142-41-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260812223142.349142-1-richard.henderson@linaro.org>
References: <20260812223142.349142-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
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

th.lbib should format the same as th.lbia, and the other
increment insns, with the address register in parenthesis.

Cc: qemu-stable@nongnu.org
Fixes: 318df7238b9 ("disas/riscv: Add support for XThead* instructions")
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
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


