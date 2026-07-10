Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB454C43458
	for <qemu-riscv@archiver.kernel.org>; Fri, 10 Jul 2026 21:04:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wiIFE-0001mE-9D; Fri, 10 Jul 2026 16:54:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wiIFA-0001hu-WE
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2026 16:54:45 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wiIEv-0000pE-4E
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2026 16:54:44 -0400
Received: by mail-pf1-x42f.google.com with SMTP id
 d2e1a72fcca58-842338c18e0so1091598b3a.1
 for <qemu-riscv@nongnu.org>; Fri, 10 Jul 2026 13:54:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1783716868; x=1784321668; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=YQ0VkN+fXYkTd5pIzgNSNc34KFa66jXvc0dQc3T9c/U=;
 b=KgqfIWcbqIF700zUYkkmZ/bLYp3zfRy7TLSMgfSHIWNF07E8sN9CANMyoEIcL45MPh
 dFLbqiFj0wXk1jrfRw7ixN6rFz60YVY2TkOFOVa2o8oanbfdEvMTPUV+2ZmWDG3+YoHL
 0b/iNXCkRcDUMB1rzIZqphJBw8ZUFX1+i5BjGVj3Gau3hqXY5uF53bip/L0bv4+ttWlS
 PhCi5Az9j3XbeV014lbfljeoQdyhIwx+DmjeieR1gdECsKtLRyFPr4lNVqX1d+rZVnyI
 D6EOHlG6XJvJ5uoVqm5lzDuzgkFCK0IJH5cylDpa+I9P1zYFFfH4lOghUBKpUiOPqdFp
 wePQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783716868; x=1784321668;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=YQ0VkN+fXYkTd5pIzgNSNc34KFa66jXvc0dQc3T9c/U=;
 b=k0gLkAV6WwDCrDrRKRpK95ovRjDlt+dwBAb69ZBHlV7S+zUDI6l3cq08cFUuF5gdFJ
 KASA6eaumxNzEO6Ic630g5/RtBhirxSkKKldyoalwUOCQqy0QlpNvlurg9y7qJwGQKZ5
 AM8Al584Ua4qs5DSw4Cj6UYVjZBQGRyPcb+vWRI6LjF9LyWbqPGQalGc2SOaomJ7OxpO
 0qEdNqhJRxHqtzi16kdm+Fx9qwgq3MdxcA48IcsjORkQvApbZPGd/w4nuJYOEkUhdH7A
 PsgOAbYCPNlZ6bbWTr3ggMmyPzfYhn2GVYGZu+elA/We8vLu7jopZQPKzRVMweEGtRVj
 dLYQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RrWMcID/PN6y192e0Yg3Vi9GXqT/yTNfJn2A1b6FfZaqrWX4uhMxNiaz5cDDiaFZAsWb4ObGyX+vg11@nongnu.org
X-Gm-Message-State: AOJu0YyTxbp4Ou9fkvgRpw5LGJyV0qB5dpRpOFUiyNoBr1oJHMLEmJAE
 oY0oz/zc0rfrYLdJ+9UME3g6zZXtFo9UUDbhP8NS+KMJwhoNuZbkRUeLAJyaUr5s3l0=
X-Gm-Gg: AfdE7clVdVbCmBzFD3fpbUv5z/x9VCO0UvYKve9VswLqMWWhee2Rz7U1TDAfs4XTtv0
 Vr3IzJ9XLfxU4zgBQqNuedcbOrKJvYLasqdvl42YM/ZkENqnGfRsFnhxb8Tvj6Ve6OKaWkJ/c5e
 hWAgnhg3qGGC0rYF2AtVWz7FXaYddZofI0rnXtZm009AqXbf5tcYLyEJqmWEnaETxmuKbF+lfgX
 06ewESPlpnhlTAA2mmKthb1mLpGeS/92NHxXkT19yO2dtSCqIpwvMfHqWqB/tEHfpOCFUD+mW2K
 d0k2z7nCUvn1P+OHoFWgbt8HNCpmdXYCApodDnjbpPjrXVPC6r8V+aMGdgIplJ4+QOwxQmLO8Cv
 xYYQHw2Bn2MaDS6j0pzh3EFe3Sj/PRsbmRPhgSqO0rAmWnKAqN8M89eS43my3mm8d8k3kB2FiXR
 HDddQqnubB1pPVKimDKQ==
X-Received: by 2002:a05:6a00:6c9a:b0:848:2f84:f42d with SMTP id
 d2e1a72fcca58-84889792beemr481182b3a.70.1783716867603; 
 Fri, 10 Jul 2026 13:54:27 -0700 (PDT)
Received: from stoup.. ([71.212.146.49]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-847f6d76106sm10780574b3a.40.2026.07.10.13.54.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2026 13:54:27 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com
Subject: [PATCH v3 23/51] cpu-common: Validate flags in cpu_breakpoint_insert
Date: Fri, 10 Jul 2026 13:53:33 -0700
Message-ID: <20260710205401.836304-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260710205401.836304-1-richard.henderson@linaro.org>
References: <20260710205401.836304-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
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


