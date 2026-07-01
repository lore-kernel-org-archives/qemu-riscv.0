Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2259C43602
	for <qemu-riscv@archiver.kernel.org>; Wed,  1 Jul 2026 03:05:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1welG9-0005xS-FW; Tue, 30 Jun 2026 23:05:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1welFw-0005iY-PK
 for qemu-riscv@nongnu.org; Tue, 30 Jun 2026 23:04:58 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1welFs-0002pf-VZ
 for qemu-riscv@nongnu.org; Tue, 30 Jun 2026 23:04:56 -0400
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-2c821a50615so953685ad.0
 for <qemu-riscv@nongnu.org>; Tue, 30 Jun 2026 20:04:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1782875092; x=1783479892; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=m2tedjt9ue/IHEM2C2VR1yTQ8onosX/0AIW1UgXuO/Y=;
 b=DCfaK1Xa20knHf2JbdvNrKe0CynwbDll02Cf6ldBnZSAMWzvxptHTnDTP30OLJIVek
 nGmDeLFCtq0xPaDTJFr+n08kSqjP0trlY98dNTD2EK3wiMikJW6oI2EIFuDzuYFq/mB4
 uS3PT+7S1LtYkZWENfp7Yw7vZWpnmO3xPZu04Ml/FRRaV5P7AvfALguuEpZVh/oG7klS
 AgpYRO2s1uX59kqDwWip0hcjWsS797f+GwLDncRrVBI5ISxXu8lrTQpPTNCe1ZtiD2Xk
 vzZTxkmraofWFTE4NmlOO6en47FFVX3F49P1S0tStW1QuQTzOrb/HY1gjSd6wOWaa1iE
 M1EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782875092; x=1783479892;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=m2tedjt9ue/IHEM2C2VR1yTQ8onosX/0AIW1UgXuO/Y=;
 b=ixhtu/10PJpPtyiYtpktssCHMpBmTsuyZvLHXQ+qggOgN6CbBl0oNR3JvUmvLUUpjh
 aIjJ4xmkCBVxfgVgkXrUdxnkuw+S4mHZeppeRbsdUSzn97acmHOFYySFSv9nT0wgT8aH
 UkTPrRMtJq/ET0WaBBg7YtmZXUx+UEBr69tHdWFhReJ0P/fNcb5oNMnxCI4wiYtVqcmE
 MtqERnLvNZsi/cslAVlL503K2ZDT2CQsF14Ubuz8gzdbjVTdsHfAb1LEwvHsrZ1E1PPC
 a999+Y+zRGDNoya/eToUccCzausFyH/c6rPuNt/oz7vt29wPAJrSBNMLoiz05rOJN4gg
 NRjg==
X-Forwarded-Encrypted: i=1;
 AHgh+RpIHTcllx6eaQV91hiJ2Oj7RvplEHrQV6FAfkJl6gxO+uyn8neXv5mMR1PIJubeVr7bZypVheZzdRD7@nongnu.org
X-Gm-Message-State: AOJu0YwwOPVB/lf35oIK7diljk3S4OwdKI7Ose0P1bxLTo0oVXLOXqzE
 L5cLGL+VphaLf35Qb7aKL2U/FSEMrheexxnB6AeSxWkABIfOBX6+TvKtEf2S4lWEgj0=
X-Gm-Gg: AfdE7cn7n8HTu3+Eyfppei/fhWv/HqCWJm95/zOJict3s7QbX+KeLR9lC62KfyNs6vQ
 bsCG1PIvDrUcZ8DeqVTg6vu0OwZrbK0Gg7BU93hKuzN4VdHfTQMhf2WVW+sx3mqI/fJX8T1cVt7
 AzQHPOOjF88o3bCdkCFB6b24N4VssFzPcMj4hw5CnniOhA06129zVkoHtNvKcqf8278GH4FH5kz
 /Imr3g0iWryAphhLSz3OY7l9tP7r0lJcc1ctmivJB7z/HPUVstI0SCjcgF8vCptVHFMy26BHLPV
 +y5FGU2v2lP0ghMej7npNhI0jOwTB3ZVQNGPpOI+40uqBBcfLykm9HkDZtHYpkLd13gpA9JXbY4
 zuWAJEpWe6uy7/L0rWhqjZL85a4/4d7aPdg79zMVL9sUi1IUCOQXv+Lc9nF6VWz+vB9uCxv99np
 byX+67PkaF5m+Y6LXorjltIU5z9Z9FGW+oufDqWScnf8ik2qJFEQ==
X-Received: by 2002:a17:902:fdaf:b0:2c2:50c7:58a4 with SMTP id
 d9443c01a7336-2ca2e718309mr54601625ad.22.1782875091568; 
 Tue, 30 Jun 2026 20:04:51 -0700 (PDT)
Received: from stoup.. (174-21-129-215.tukw.qwest.net. [174.21.129.215])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ca37c74261sm23758085ad.22.2026.06.30.20.04.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Jun 2026 20:04:51 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: shivangu@linux.ibm.com,
	qemu-arm@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH 08/17] exec/breakpoint: Introduce BP_CPU_ID_SHIFT
Date: Tue, 30 Jun 2026 20:04:34 -0700
Message-ID: <20260701030443.1382447-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260701030443.1382447-1-richard.henderson@linaro.org>
References: <20260701030443.1382447-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
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

Allow the target to store an identifier with
breakpoints and watchpoints.  Change "flags" to
use uint32_t instead of "int".

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/breakpoint.h | 10 ++++++----
 cpu-common.c              |  4 ++--
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/include/exec/breakpoint.h b/include/exec/breakpoint.h
index fc91343875..93876f3304 100644
--- a/include/exec/breakpoint.h
+++ b/include/exec/breakpoint.h
@@ -25,10 +25,12 @@
 #define BP_WATCHPOINT_HIT_READ  (BP_MEM_READ << BP_HIT_SHIFT)
 #define BP_WATCHPOINT_HIT_WRITE (BP_MEM_WRITE << BP_HIT_SHIFT)
 #define BP_WATCHPOINT_HIT       (BP_MEM_ACCESS << BP_HIT_SHIFT)
+/* Bits [31:16] are reserved as an identifier for BP_CPU. */
+#define BP_CPU_ID_SHIFT       16
 
 struct CPUBreakpoint {
     vaddr pc;
-    int flags; /* BP_* */
+    uint32_t flags; /* BP_* */
     QTAILQ_ENTRY(CPUBreakpoint) entry;
 };
 
@@ -37,13 +39,13 @@ struct CPUWatchpoint {
     vaddr len;
     vaddr hitaddr;
     MemTxAttrs hitattrs;
-    int flags; /* BP_* */
+    uint32_t flags; /* BP_* */
     QTAILQ_ENTRY(CPUWatchpoint) entry;
 };
 
-int cpu_breakpoint_insert(CPUState *cpu, vaddr pc, int flags,
+int cpu_breakpoint_insert(CPUState *cpu, vaddr pc, uint32_t flags,
                           CPUBreakpoint **breakpoint);
-int cpu_breakpoint_remove(CPUState *cpu, vaddr pc, int flags);
+int cpu_breakpoint_remove(CPUState *cpu, vaddr pc, uint32_t flags);
 void cpu_breakpoint_remove_by_ref(CPUState *cpu, CPUBreakpoint *breakpoint);
 void cpu_breakpoint_remove_all(CPUState *cpu, int mask);
 bool cpu_breakpoint_test(CPUState *cpu, vaddr pc, int mask);
diff --git a/cpu-common.c b/cpu-common.c
index 11ab32d64d..0b54e8a497 100644
--- a/cpu-common.c
+++ b/cpu-common.c
@@ -405,7 +405,7 @@ bool cpu_breakpoint_test(CPUState *cpu, vaddr pc, int mask)
 }
 
 /* Add a breakpoint.  */
-int cpu_breakpoint_insert(CPUState *cpu, vaddr pc, int flags,
+int cpu_breakpoint_insert(CPUState *cpu, vaddr pc, uint32_t flags,
                           CPUBreakpoint **breakpoint)
 {
     CPUBreakpoint *bp;
@@ -435,7 +435,7 @@ int cpu_breakpoint_insert(CPUState *cpu, vaddr pc, int flags,
 }
 
 /* Remove a specific breakpoint.  */
-int cpu_breakpoint_remove(CPUState *cpu, vaddr pc, int flags)
+int cpu_breakpoint_remove(CPUState *cpu, vaddr pc, uint32_t flags)
 {
     CPUBreakpoint *bp;
 
-- 
2.43.0


