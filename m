Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD87FCAC5B8
	for <qemu-riscv@archiver.kernel.org>; Thu,  2 Oct 2025 14:59:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1v4KlQ-0007OA-6C; Thu, 02 Oct 2025 10:58:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v4KlB-0007KU-BV
 for qemu-riscv@nongnu.org; Thu, 02 Oct 2025 10:58:22 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v4Kkt-0000E7-HF
 for qemu-riscv@nongnu.org; Thu, 02 Oct 2025 10:58:19 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-46e3ea0445fso6273655e9.1
 for <qemu-riscv@nongnu.org>; Thu, 02 Oct 2025 07:57:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759417074; x=1760021874; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gJJmAmGdqYryK/ZlyEJKoFV0FxH0k6BYJeQSlZ3R4Yc=;
 b=K/2lZKdwCRirFdhDPkC8/OQwsmNl8cnc5MkM+rVD0aGWp02pDOOdW42snjgJtq5c0s
 tBOe8uHed5B8RzOXrB/6owChaFikpsZ5aveLJ011KGHtnfAQ/XgzsigOFD0D10dhTBO0
 nEo7xIM29buXvR0cUppWnvJFgyyI4Zx6kAXTuRrGt3NHenOcpksvvSGYtyD/KwP024oa
 Wj5KuwpNERot+NRwmJT55woGdmDLXFUNgmpsCDINyM2pplFRHoulAKlteL/RFmXnxjCG
 MZ+45l3RVHHG5P/nCr9wZOcWRzTYhEtDklManFHj9rbBRwTrFdVdhVkrGwsNNa7Jg/2T
 RLPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759417074; x=1760021874;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gJJmAmGdqYryK/ZlyEJKoFV0FxH0k6BYJeQSlZ3R4Yc=;
 b=UWLr3NY3aIFPOzhD1hddXelgPfvdGlJlpfUqIEB3cbl6zet/jtM5HUga4r0yC5fyRv
 5OLep/FpFKQrx0w8Wrobkq7iYdoAtZDqI6FBQONH5lcQiiwgxhgI27uEyFzJjhxYFY19
 JYVxrSLXAawG3vrM1xl7TzjMSIa8hDDQTJy2FHHVzi2macORG8Z9TCyVnphT8EBbGPcn
 LJe1c2hBhKQ6jjh08zXxzgLVfURfUnfWNVwCzP8NOFe3M4aQfe8bPD5qH855+OhqS2YU
 jIG0O0N69vrIQDnDtq4TK1urA7t6dGDKankuRUBrdQUgAe6ftbeE0EbRxH19fSgzEcGB
 tWRQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWhYBuJBuH2bqoXWrWfN2oNJ7IyI8yE31nyrkH9Ba7HLMFlFBTqZXNPtEF0byOyp2+BO0HchbBZop/L@nongnu.org
X-Gm-Message-State: AOJu0Yzt8lfDE1juEioVXZcCYKM2So4e2bXXRuTMi8HTTP3PxMfDkHwf
 hN7Me/iTHP9k81hKrqoOz1tdZG9prjMPQHGFxvcLLYBdNODu6tBbvOPC0bOpjdPbiGQ=
X-Gm-Gg: ASbGnctoB78W2NfPdWtFFNbJZAEWzlJge80WyCWIgkdHbPl0h8r8W8q6FyMFOx0lAKq
 ssRSopFZMlskRTCgduWaVOuVkiezwcNXhAJ/ptEBg8k+VTYG078W9caMk62HImoYjvUj6JLffL6
 NUnVZobwOrLZN+WDAqYexpDExcxCUfZXOilyHD5Tek77542buT40sEOYFcyZ/dSxjl1Fel+alZ0
 LJ/rNHXlTNzpTbzPI+pL/TKEB56MdAQhEUEjxu41GzDS6ZQXOj6umQbWsbPmFl5rPZ7goTnRGU/
 Fb+0N57NDUBR43Xmz3Qk3KP+Hc6vurziALWZ37hu27HfR7dG5T4IjbJCJgWVo5qp5wcc5HLZSYL
 ymw88Iyzriu+93FaO72XeBVl3HTpC+sMI9wmLWvk/ZsyA7LmyMvTore0hOXE7oKxh95AFmUVy8j
 JzjNQ6yS8woiyiwgP5egi7CEu+
X-Google-Smtp-Source: AGHT+IEcZRcyOhwdPwDE95ncgVk2kwKQw774g3pAMAqsNBLj53RH2mjubYvFhvF3SeT0CBCdgUZm+g==
X-Received: by 2002:a05:600c:3d87:b0:46e:53cb:9e7f with SMTP id
 5b1f17b1804b1-46e7060cc76mr625505e9.18.1759417073718; 
 Thu, 02 Oct 2025 07:57:53 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e5c40983asm60261665e9.3.2025.10.02.07.57.52
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 02 Oct 2025 07:57:53 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>, qemu-riscv@nongnu.org,
 Max Filippov <jcmvbkbc@gmail.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Weiwei Li <liwei1518@gmail.com>,
 Zhao Liu <zhao1.liu@intel.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 2/6] target/i386/monitor: Replace legacy
 cpu_physical_memory_read() calls
Date: Thu,  2 Oct 2025 16:57:37 +0200
Message-ID: <20251002145742.75624-3-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251002145742.75624-1-philmd@linaro.org>
References: <20251002145742.75624-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

Commit b7ecba0f6f6 ("docs/devel/loads-stores.rst: Document our
various load and store APIs") mentioned cpu_physical_memory_*()
methods are legacy, the replacement being address_space_*().

Replace:

 - cpu_physical_memory_read(len=4) -> address_space_ldl()
 - cpu_physical_memory_read(len=8) -> address_space_ldq()

inlining the little endianness conversion via the '_le' suffix.
As with the previous implementation, ignore whether the memory
read succeeded or failed.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/i386/monitor.c | 96 ++++++++++++++++++++-----------------------
 1 file changed, 44 insertions(+), 52 deletions(-)

diff --git a/target/i386/monitor.c b/target/i386/monitor.c
index 7e7854e6c1b..d2bb873d494 100644
--- a/target/i386/monitor.c
+++ b/target/i386/monitor.c
@@ -30,6 +30,7 @@
 #include "qobject/qdict.h"
 #include "qapi/error.h"
 #include "qapi/qapi-commands-misc.h"
+#include "system/memory.h"
 
 /* Perform linear address sign extension */
 static hwaddr addr_canonical(CPUArchState *env, hwaddr addr)
@@ -70,21 +71,21 @@ static void print_pte(Monitor *mon, CPUArchState *env, hwaddr addr,
 
 static void tlb_info_32(Monitor *mon, CPUArchState *env, AddressSpace *as)
 {
+    const MemTxAttrs attrs = MEMTXATTRS_UNSPECIFIED;
     unsigned int l1, l2;
     uint32_t pgd, pde, pte;
 
     pgd = env->cr[3] & ~0xfff;
     for(l1 = 0; l1 < 1024; l1++) {
-        cpu_physical_memory_read(pgd + l1 * 4, &pde, 4);
-        pde = le32_to_cpu(pde);
+        pde = address_space_ldl_le(as, pgd + l1 * 4, attrs, NULL);
         if (pde & PG_PRESENT_MASK) {
             if ((pde & PG_PSE_MASK) && (env->cr[4] & CR4_PSE_MASK)) {
                 /* 4M pages */
                 print_pte(mon, env, (l1 << 22), pde, ~((1 << 21) - 1));
             } else {
                 for(l2 = 0; l2 < 1024; l2++) {
-                    cpu_physical_memory_read((pde & ~0xfff) + l2 * 4, &pte, 4);
-                    pte = le32_to_cpu(pte);
+                    pte = address_space_ldl_le(as, (pde & ~0xfff) + l2 * 4,
+                                               attrs, NULL);
                     if (pte & PG_PRESENT_MASK) {
                         print_pte(mon, env, (l1 << 22) + (l2 << 12),
                                   pte & ~PG_PSE_MASK,
@@ -98,19 +99,18 @@ static void tlb_info_32(Monitor *mon, CPUArchState *env, AddressSpace *as)
 
 static void tlb_info_pae32(Monitor *mon, CPUArchState *env, AddressSpace *as)
 {
+    const MemTxAttrs attrs = MEMTXATTRS_UNSPECIFIED;
     unsigned int l1, l2, l3;
     uint64_t pdpe, pde, pte;
     uint64_t pdp_addr, pd_addr, pt_addr;
 
     pdp_addr = env->cr[3] & ~0x1f;
     for (l1 = 0; l1 < 4; l1++) {
-        cpu_physical_memory_read(pdp_addr + l1 * 8, &pdpe, 8);
-        pdpe = le64_to_cpu(pdpe);
+        pdpe = address_space_ldq_le(as, pdp_addr + l1 * 8, attrs, NULL);
         if (pdpe & PG_PRESENT_MASK) {
             pd_addr = pdpe & 0x3fffffffff000ULL;
             for (l2 = 0; l2 < 512; l2++) {
-                cpu_physical_memory_read(pd_addr + l2 * 8, &pde, 8);
-                pde = le64_to_cpu(pde);
+                pde = address_space_ldq_le(as, pd_addr + l2 * 8, attrs, NULL);
                 if (pde & PG_PRESENT_MASK) {
                     if (pde & PG_PSE_MASK) {
                         /* 2M pages with PAE, CR4.PSE is ignored */
@@ -119,8 +119,8 @@ static void tlb_info_pae32(Monitor *mon, CPUArchState *env, AddressSpace *as)
                     } else {
                         pt_addr = pde & 0x3fffffffff000ULL;
                         for (l3 = 0; l3 < 512; l3++) {
-                            cpu_physical_memory_read(pt_addr + l3 * 8, &pte, 8);
-                            pte = le64_to_cpu(pte);
+                            pte = address_space_ldq_le(as, pt_addr + l3 * 8,
+                                                       attrs, NULL);
                             if (pte & PG_PRESENT_MASK) {
                                 print_pte(mon, env, (l1 << 30) + (l2 << 21)
                                           + (l3 << 12),
@@ -139,21 +139,20 @@ static void tlb_info_pae32(Monitor *mon, CPUArchState *env, AddressSpace *as)
 static void tlb_info_la48(Monitor *mon, CPUArchState *env, AddressSpace *as,
         uint64_t l0, uint64_t pml4_addr)
 {
+    const MemTxAttrs attrs = MEMTXATTRS_UNSPECIFIED;
     uint64_t l1, l2, l3, l4;
     uint64_t pml4e, pdpe, pde, pte;
     uint64_t pdp_addr, pd_addr, pt_addr;
 
     for (l1 = 0; l1 < 512; l1++) {
-        cpu_physical_memory_read(pml4_addr + l1 * 8, &pml4e, 8);
-        pml4e = le64_to_cpu(pml4e);
+        pml4e = address_space_ldq_le(as, pml4_addr + l1 * 8, attrs, NULL);
         if (!(pml4e & PG_PRESENT_MASK)) {
             continue;
         }
 
         pdp_addr = pml4e & 0x3fffffffff000ULL;
         for (l2 = 0; l2 < 512; l2++) {
-            cpu_physical_memory_read(pdp_addr + l2 * 8, &pdpe, 8);
-            pdpe = le64_to_cpu(pdpe);
+            pdpe = address_space_ldq_le(as, pdp_addr + l2 * 8, attrs, NULL);
             if (!(pdpe & PG_PRESENT_MASK)) {
                 continue;
             }
@@ -167,8 +166,7 @@ static void tlb_info_la48(Monitor *mon, CPUArchState *env, AddressSpace *as,
 
             pd_addr = pdpe & 0x3fffffffff000ULL;
             for (l3 = 0; l3 < 512; l3++) {
-                cpu_physical_memory_read(pd_addr + l3 * 8, &pde, 8);
-                pde = le64_to_cpu(pde);
+                pde = address_space_ldq_le(as, pd_addr + l3 * 8, attrs, NULL);
                 if (!(pde & PG_PRESENT_MASK)) {
                     continue;
                 }
@@ -182,10 +180,8 @@ static void tlb_info_la48(Monitor *mon, CPUArchState *env, AddressSpace *as,
 
                 pt_addr = pde & 0x3fffffffff000ULL;
                 for (l4 = 0; l4 < 512; l4++) {
-                    cpu_physical_memory_read(pt_addr
-                            + l4 * 8,
-                            &pte, 8);
-                    pte = le64_to_cpu(pte);
+                    pte = address_space_ldq_le(as, pt_addr + l4 * 8,
+                                               attrs, NULL);
                     if (pte & PG_PRESENT_MASK) {
                         print_pte(mon, env, (l0 << 48) + (l1 << 39) +
                                 (l2 << 30) + (l3 << 21) + (l4 << 12),
@@ -199,14 +195,14 @@ static void tlb_info_la48(Monitor *mon, CPUArchState *env, AddressSpace *as,
 
 static void tlb_info_la57(Monitor *mon, CPUArchState *env, AddressSpace *as)
 {
+    const MemTxAttrs attrs = MEMTXATTRS_UNSPECIFIED;
     uint64_t l0;
     uint64_t pml5e;
     uint64_t pml5_addr;
 
     pml5_addr = env->cr[3] & 0x3fffffffff000ULL;
     for (l0 = 0; l0 < 512; l0++) {
-        cpu_physical_memory_read(pml5_addr + l0 * 8, &pml5e, 8);
-        pml5e = le64_to_cpu(pml5e);
+        pml5e = address_space_ldq_le(as, pml5_addr + l0 * 8, attrs, NULL);
         if (pml5e & PG_PRESENT_MASK) {
             tlb_info_la48(mon, env, as, l0, pml5e & 0x3fffffffff000ULL);
         }
@@ -275,6 +271,7 @@ static void mem_print(Monitor *mon, CPUArchState *env,
 
 static void mem_info_32(Monitor *mon, CPUArchState *env, AddressSpace *as)
 {
+    const MemTxAttrs attrs = MEMTXATTRS_UNSPECIFIED;
     unsigned int l1, l2;
     int prot, last_prot;
     uint32_t pgd, pde, pte;
@@ -284,8 +281,7 @@ static void mem_info_32(Monitor *mon, CPUArchState *env, AddressSpace *as)
     last_prot = 0;
     start = -1;
     for(l1 = 0; l1 < 1024; l1++) {
-        cpu_physical_memory_read(pgd + l1 * 4, &pde, 4);
-        pde = le32_to_cpu(pde);
+        pde = address_space_ldl_le(as, pgd + l1 * 4, attrs, NULL);
         end = l1 << 22;
         if (pde & PG_PRESENT_MASK) {
             if ((pde & PG_PSE_MASK) && (env->cr[4] & CR4_PSE_MASK)) {
@@ -293,8 +289,8 @@ static void mem_info_32(Monitor *mon, CPUArchState *env, AddressSpace *as)
                 mem_print(mon, env, &start, &last_prot, end, prot);
             } else {
                 for(l2 = 0; l2 < 1024; l2++) {
-                    cpu_physical_memory_read((pde & ~0xfff) + l2 * 4, &pte, 4);
-                    pte = le32_to_cpu(pte);
+                    pte = address_space_ldl_le(as, (pde & ~0xfff) + l2 * 4,
+                                               attrs, NULL);
                     end = (l1 << 22) + (l2 << 12);
                     if (pte & PG_PRESENT_MASK) {
                         prot = pte & pde &
@@ -316,6 +312,7 @@ static void mem_info_32(Monitor *mon, CPUArchState *env, AddressSpace *as)
 
 static void mem_info_pae32(Monitor *mon, CPUArchState *env, AddressSpace *as)
 {
+    const MemTxAttrs attrs = MEMTXATTRS_UNSPECIFIED;
     unsigned int l1, l2, l3;
     int prot, last_prot;
     uint64_t pdpe, pde, pte;
@@ -326,14 +323,12 @@ static void mem_info_pae32(Monitor *mon, CPUArchState *env, AddressSpace *as)
     last_prot = 0;
     start = -1;
     for (l1 = 0; l1 < 4; l1++) {
-        cpu_physical_memory_read(pdp_addr + l1 * 8, &pdpe, 8);
-        pdpe = le64_to_cpu(pdpe);
+        pdpe = address_space_ldq_le(as, pdp_addr + l1 * 8, attrs, NULL);
         end = l1 << 30;
         if (pdpe & PG_PRESENT_MASK) {
             pd_addr = pdpe & 0x3fffffffff000ULL;
             for (l2 = 0; l2 < 512; l2++) {
-                cpu_physical_memory_read(pd_addr + l2 * 8, &pde, 8);
-                pde = le64_to_cpu(pde);
+                pde = address_space_ldq_le(as, pd_addr + l2 * 8, attrs, NULL);
                 end = (l1 << 30) + (l2 << 21);
                 if (pde & PG_PRESENT_MASK) {
                     if (pde & PG_PSE_MASK) {
@@ -343,8 +338,8 @@ static void mem_info_pae32(Monitor *mon, CPUArchState *env, AddressSpace *as)
                     } else {
                         pt_addr = pde & 0x3fffffffff000ULL;
                         for (l3 = 0; l3 < 512; l3++) {
-                            cpu_physical_memory_read(pt_addr + l3 * 8, &pte, 8);
-                            pte = le64_to_cpu(pte);
+                            pte = address_space_ldq_le(as, pt_addr + l3 * 8,
+                                                       attrs, NULL);
                             end = (l1 << 30) + (l2 << 21) + (l3 << 12);
                             if (pte & PG_PRESENT_MASK) {
                                 prot = pte & pde & (PG_USER_MASK | PG_RW_MASK |
@@ -373,6 +368,7 @@ static void mem_info_pae32(Monitor *mon, CPUArchState *env, AddressSpace *as)
 #ifdef TARGET_X86_64
 static void mem_info_la48(Monitor *mon, CPUArchState *env, AddressSpace *as)
 {
+    const MemTxAttrs attrs = MEMTXATTRS_UNSPECIFIED;
     int prot, last_prot;
     uint64_t l1, l2, l3, l4;
     uint64_t pml4e, pdpe, pde, pte;
@@ -382,14 +378,12 @@ static void mem_info_la48(Monitor *mon, CPUArchState *env, AddressSpace *as)
     last_prot = 0;
     start = -1;
     for (l1 = 0; l1 < 512; l1++) {
-        cpu_physical_memory_read(pml4_addr + l1 * 8, &pml4e, 8);
-        pml4e = le64_to_cpu(pml4e);
+        pml4e = address_space_ldq_le(as, pml4_addr + l1 * 8, attrs, NULL);
         end = l1 << 39;
         if (pml4e & PG_PRESENT_MASK) {
             pdp_addr = pml4e & 0x3fffffffff000ULL;
             for (l2 = 0; l2 < 512; l2++) {
-                cpu_physical_memory_read(pdp_addr + l2 * 8, &pdpe, 8);
-                pdpe = le64_to_cpu(pdpe);
+                pdpe = address_space_ldq_le(as, pdp_addr + l2 * 8, attrs, NULL);
                 end = (l1 << 39) + (l2 << 30);
                 if (pdpe & PG_PRESENT_MASK) {
                     if (pdpe & PG_PSE_MASK) {
@@ -400,8 +394,8 @@ static void mem_info_la48(Monitor *mon, CPUArchState *env, AddressSpace *as)
                     } else {
                         pd_addr = pdpe & 0x3fffffffff000ULL;
                         for (l3 = 0; l3 < 512; l3++) {
-                            cpu_physical_memory_read(pd_addr + l3 * 8, &pde, 8);
-                            pde = le64_to_cpu(pde);
+                            pde = address_space_ldq_le(as, pd_addr + l3 * 8,
+                                                       attrs, NULL);
                             end = (l1 << 39) + (l2 << 30) + (l3 << 21);
                             if (pde & PG_PRESENT_MASK) {
                                 if (pde & PG_PSE_MASK) {
@@ -413,10 +407,10 @@ static void mem_info_la48(Monitor *mon, CPUArchState *env, AddressSpace *as)
                                 } else {
                                     pt_addr = pde & 0x3fffffffff000ULL;
                                     for (l4 = 0; l4 < 512; l4++) {
-                                        cpu_physical_memory_read(pt_addr
-                                                                 + l4 * 8,
-                                                                 &pte, 8);
-                                        pte = le64_to_cpu(pte);
+                                        pte = address_space_ldq_le(as,
+                                                                   pt_addr
+                                                                   + l4 * 8,
+                                                                   attrs, NULL);
                                         end = (l1 << 39) + (l2 << 30) +
                                             (l3 << 21) + (l4 << 12);
                                         if (pte & PG_PRESENT_MASK) {
@@ -453,6 +447,7 @@ static void mem_info_la48(Monitor *mon, CPUArchState *env, AddressSpace *as)
 
 static void mem_info_la57(Monitor *mon, CPUArchState *env, AddressSpace *as)
 {
+    const MemTxAttrs attrs = MEMTXATTRS_UNSPECIFIED;
     int prot, last_prot;
     uint64_t l0, l1, l2, l3, l4;
     uint64_t pml5e, pml4e, pdpe, pde, pte;
@@ -462,8 +457,7 @@ static void mem_info_la57(Monitor *mon, CPUArchState *env, AddressSpace *as)
     last_prot = 0;
     start = -1;
     for (l0 = 0; l0 < 512; l0++) {
-        cpu_physical_memory_read(pml5_addr + l0 * 8, &pml5e, 8);
-        pml5e = le64_to_cpu(pml5e);
+        pml5e = address_space_ldq_le(as, pml5_addr + l0 * 8, attrs, NULL);
         end = l0 << 48;
         if (!(pml5e & PG_PRESENT_MASK)) {
             prot = 0;
@@ -473,8 +467,7 @@ static void mem_info_la57(Monitor *mon, CPUArchState *env, AddressSpace *as)
 
         pml4_addr = pml5e & 0x3fffffffff000ULL;
         for (l1 = 0; l1 < 512; l1++) {
-            cpu_physical_memory_read(pml4_addr + l1 * 8, &pml4e, 8);
-            pml4e = le64_to_cpu(pml4e);
+            pml4e = address_space_ldq_le(as, pml4_addr + l1 * 8, attrs, NULL);
             end = (l0 << 48) + (l1 << 39);
             if (!(pml4e & PG_PRESENT_MASK)) {
                 prot = 0;
@@ -484,8 +477,7 @@ static void mem_info_la57(Monitor *mon, CPUArchState *env, AddressSpace *as)
 
             pdp_addr = pml4e & 0x3fffffffff000ULL;
             for (l2 = 0; l2 < 512; l2++) {
-                cpu_physical_memory_read(pdp_addr + l2 * 8, &pdpe, 8);
-                pdpe = le64_to_cpu(pdpe);
+                pdpe = address_space_ldq_le(as, pdp_addr + l2 * 8, attrs, NULL);
                 end = (l0 << 48) + (l1 << 39) + (l2 << 30);
                 if (pdpe & PG_PRESENT_MASK) {
                     prot = 0;
@@ -503,8 +495,8 @@ static void mem_info_la57(Monitor *mon, CPUArchState *env, AddressSpace *as)
 
                 pd_addr = pdpe & 0x3fffffffff000ULL;
                 for (l3 = 0; l3 < 512; l3++) {
-                    cpu_physical_memory_read(pd_addr + l3 * 8, &pde, 8);
-                    pde = le64_to_cpu(pde);
+                    pde = address_space_ldq_le(as, pd_addr + l3 * 8,
+                                               attrs, NULL);
                     end = (l0 << 48) + (l1 << 39) + (l2 << 30) + (l3 << 21);
                     if (pde & PG_PRESENT_MASK) {
                         prot = 0;
@@ -522,8 +514,8 @@ static void mem_info_la57(Monitor *mon, CPUArchState *env, AddressSpace *as)
 
                     pt_addr = pde & 0x3fffffffff000ULL;
                     for (l4 = 0; l4 < 512; l4++) {
-                        cpu_physical_memory_read(pt_addr + l4 * 8, &pte, 8);
-                        pte = le64_to_cpu(pte);
+                        pte = address_space_ldq_le(as, pt_addr + l4 * 8,
+                                                   attrs, NULL);
                         end = (l0 << 48) + (l1 << 39) + (l2 << 30) +
                             (l3 << 21) + (l4 << 12);
                         if (pte & PG_PRESENT_MASK) {
-- 
2.51.0


