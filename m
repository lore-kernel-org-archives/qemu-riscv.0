Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBCD9C44500
	for <qemu-riscv@archiver.kernel.org>; Sun,  5 Jul 2026 04:48:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wgEdt-0008Ni-Pi; Sun, 05 Jul 2026 00:39:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wgEcN-00058O-PQ
 for qemu-riscv@nongnu.org; Sun, 05 Jul 2026 00:38:13 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wgEc3-0004JT-E3
 for qemu-riscv@nongnu.org; Sun, 05 Jul 2026 00:38:11 -0400
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-2cc61541f8cso9874055ad.0
 for <qemu-riscv@nongnu.org>; Sat, 04 Jul 2026 21:37:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1783226270; x=1783831070; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YQ0VkN+fXYkTd5pIzgNSNc34KFa66jXvc0dQc3T9c/U=;
 b=A8usrX5cfj1vL9zv69u66rW1Uzg6N9QkoBZFJi3nTbJ3g0umm/ESJQvwScpyv6Ra0G
 oU2GzKPLpmMGFHfKwRmA7IWIxDeosqCvQsfEn3tWBLeam3LCFYovYlHsNJ6TAqP+GijD
 YS+3YNN2Hnlby0YnijB+Wl17ubig6ycmD/JewPCrXuYeNHB7DRjrMh1NJ7ycwt+P32W9
 NemUiC8h6CwTTLLEu7+jxkw3YAG2yx9DEplNNlzBDbF2ifAqd88la9LHNcGb/zcdirbQ
 fOF3ECxnJsyAvyAJ5j9eb26wGmMT8yrg/vyFkbaO09xwpcpDiLaEAlrf+81MSIS/bS2N
 IZRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783226270; x=1783831070;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=YQ0VkN+fXYkTd5pIzgNSNc34KFa66jXvc0dQc3T9c/U=;
 b=nv0WoOD6yRXeNgCGy85C3UuZnIaCskJOhlTpgnqJ7wyIALF1FE4D3A+SiZLaQny70m
 6CrUqaNMTQM7dMw7N1u6iluuRyEtznoDZeKotGYC2CZD9/V4Hp/yiYC7WqprjdymRw3U
 2buDYIqjlLKKveeoh6k96LaLmjSIYe1b8JC3Spy9X5W6c4w7yh76fZ/kiS7kI5w9dG2j
 Siav4llLrHcAT7ECaVOg3jwOJ6Hi0s5vHQoCEkbzDjmgwYfR8mGYejXWocx+nMS/V7Lt
 38OWP5l6yt9WbNufgMmUV1/F6eFhhEHGaNDi7j3E2l8TZEFxUho6Wo0cSd7tVwzA5VgX
 dNIw==
X-Forwarded-Encrypted: i=1;
 AFNElJ+SI+bnUMNq6oYHqYPPVpIrQniymS0TRNeEMi56VqVvK9jpSTYkZ6oegr7EMMgIKqt1sFhoWXsCSXlU@nongnu.org
X-Gm-Message-State: AOJu0Yx1hl5p+J1NuPRS8qtXBPaYkCPUHIApU8K8pOtsgMhV4ZM1xOkW
 P34Z+RHPyBG0jMOdLpHsqYBdOHARgVcJ7F9fzM56aDeymzeiTT62GctmLCeDMumQ+G8=
X-Gm-Gg: AfdE7cnPVUlr4DdB6zUI3UDcCM6nJ43lAq2Dzm/o2HZWjw9sRW5PF7fJ/vmrVKJD8WD
 rHazY9kLc1SEvmKg7n8hQYoyG2gGzg+QgxpRf5ZA4phG5nDZP6l6lHiXMDJvf4C2i1UBX9Fwcho
 Y79HFs4QO5X5NUhK5o7KpUYAgFuHXCrQhPYXW5p66xL+FWxdKEU20C30KAA40ag90rSABtntgvj
 z9dSoqhgn+7ie0GBN5ac/me9nmIFBnwtHiCP+k7bswqqxnt4wUN5NwXX5GlQxo/kU/b1wfAIQ7v
 0Q9qoXt8jLss4wowEjvDxM3K5DF4l3wQFPCNuzM+B6gOlsLVPAvlvGmkSIpzG6n9EuT1iFKw+xf
 CoWXQrjWoqkZibmDmzMFsoEdl0e0kzpVqevZ+1Sgv/QYPYQiEeFqciNw0hUW46ych8f//czVrLv
 QLQ9+Z+4ToCMRW/6XgbxCgoWBxeXfFx/g/UGgVT9nLdN1e5CY=
X-Received: by 2002:a17:902:c40d:b0:2c0:d94f:50c7 with SMTP id
 d9443c01a7336-2cacabc2ae9mr105527885ad.7.1783226270021; 
 Sat, 04 Jul 2026 21:37:50 -0700 (PDT)
Received: from stoup.. (71-212-39-188.tukw.qwest.net. [71.212.39.188])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2cad712ca17sm29863785ad.28.2026.07.04.21.37.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Jul 2026 21:37:49 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, philmd@oss.qualcomm.com
Subject: [PATCH v2 27/46] cpu-common: Validate flags in cpu_breakpoint_insert
Date: Sat,  4 Jul 2026 21:37:06 -0700
Message-ID: <20260705043725.1373137-28-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260705043725.1373137-1-richard.henderson@linaro.org>
References: <20260705043725.1373137-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
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

Flags must specify GDB or CPU but not both.
Flags must not contain extraneous bits.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 cpu-common.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/cpu-common.c b/cpu-common.c
index fcc9bc77a3..80a4a191f4 100644
--- a/cpu-common.c
+++ b/cpu-common.c
@@ -410,6 +410,9 @@ CPUBreakpoint *cpu_breakpoint_insert(CPUState *cpu, vaddr pc,
 {
     CPUBreakpoint *bp;
 
+    assert(!(flags & ~BP_ANY));
+    assert(ctpop32(flags) == 1);
+
     if (cpu->cc->gdb_adjust_breakpoint) {
         pc = cpu->cc->gdb_adjust_breakpoint(cpu, pc);
     }
-- 
2.43.0


