Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l8tPH-00085y-1r
	for mharc-qemu-riscv@gnu.org; Sun, 07 Feb 2021 18:23:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l8tPD-000817-VE; Sun, 07 Feb 2021 18:23:52 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:51076)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l8tP4-0001EW-5Q; Sun, 07 Feb 2021 18:23:50 -0500
Received: by mail-wm1-x32f.google.com with SMTP id 190so11169379wmz.0;
 Sun, 07 Feb 2021 15:23:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=imFQGKJBgIE298lnVAuxYDCszjx31PWDfQloLbhmsMQ=;
 b=jRfVShxCvoHj4VIdXI31W8+mms47QKtM/dYAbewXt33U3qwjP+25jHorFrShriMLfR
 6yrVo/Ew3pAD+/Z3diDybMuIj5u6epsQxB7C241FvlXXZeV0g0a6Hj04uj01Cj6sLOLp
 pEzCGhE3HMKQ7FOCHIw8EeVJMcwntoFal6fon3OayqoB3OhNVaTkK/hF3QzvrybV8Zt9
 5h/4+2Z/AxVFHi4ewFBBtIKamyNOW2BL1dhamqZslKsBo9R/Xhzlxz4kHNUpNN0PjY9B
 glbOr1ZSs81mLNFLi89Ky1tPf1r6X6xqQveTQmGHf/+s5jBLSRpC9aaIXVp2Y55dr5qD
 /LPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=imFQGKJBgIE298lnVAuxYDCszjx31PWDfQloLbhmsMQ=;
 b=smBls6akZ5L7LyDtTant+19Oc1WAlJF+h8TlgALIU3Dx1nbfHAzy4ddI6cyx7i4Q5o
 gMs9dzZfUKN68BRCiq7cyj55gBCKy3/SYY3f45+ULyi9xPlPgE5O/A0dIiS9vcPlj1xS
 oRBAaayz8BOo1PzBooGPpDhBYqgHFU0+ZWVwqX5GaAwE3+M5s/X+O9z/KWqT+ybb1d0l
 EnneBKxPrSyiXy3g+uj1sWDe0VCbQ68KQFS20ZaD0BQLsUJ1VQg+IAn2DFBg79BskfWr
 90X++RYSzvFuWvhhkunfYGdE4/yCAL1xb6aIFbRXE/iTYmJNVw9cnU9kS80JiKckWeww
 eL1w==
X-Gm-Message-State: AOAM5302YvRsPJxpHzhEKx+VI+gdtnmeOkAMUdjLQMRb3apAC7bhyFfx
 rHLsZjFUSLidclFDT3vPFAakUVqtD2w=
X-Google-Smtp-Source: ABdhPJwDN8+BIrRLVWqNQox4XrA+rwoqz+xuYjuBQqhBTRYwtR5A+IjXfxnAZnvhz091w3y2sDUcvg==
X-Received: by 2002:a05:600c:4105:: with SMTP id
 j5mr12536306wmi.0.1612740220035; 
 Sun, 07 Feb 2021 15:23:40 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id o9sm26708567wrw.81.2021.02.07.15.23.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Feb 2021 15:23:39 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Cc: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Palmer Dabbelt <palmer@dabbelt.com>, Laurent Vivier <laurent@vivier.eu>,
 qemu-arm@nongnu.org, Claudio Fontana <cfontana@suse.de>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, qemu-riscv@nongnu.org
Subject: [RFC PATCH v2 5/6] accel/tcg: Refactor debugging
 tlb_assert_iotlb_entry_for_ptr_present()
Date: Mon,  8 Feb 2021 00:23:09 +0100
Message-Id: <20210207232310.2505283-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210207232310.2505283-1-f4bug@amsat.org>
References: <20210207232310.2505283-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Sun, 07 Feb 2021 23:23:53 -0000

Refactor debug code as tlb_assert_iotlb_entry_for_ptr_present() helper.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
What this code does is out of my league, but refactoring it allow
keeping tlb_addr_write() local to accel/tcg/cputlb.c in the next
patch.
---
 include/exec/exec-all.h |  9 +++++++++
 accel/tcg/cputlb.c      | 14 ++++++++++++++
 target/arm/mte_helper.c | 11 ++---------
 target/arm/sve_helper.c | 10 ++--------
 4 files changed, 27 insertions(+), 17 deletions(-)

diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index f933c74c446..c5e8e355b7f 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -296,6 +296,15 @@ void tlb_set_page_with_attrs(CPUState *cpu, target_ulong vaddr,
 void tlb_set_page(CPUState *cpu, target_ulong vaddr,
                   hwaddr paddr, int prot,
                   int mmu_idx, target_ulong size);
+
+/*
+ * Find the iotlbentry for ptr.  This *must* be present in the TLB
+ * because we just found the mapping.
+ */
+void tlb_assert_iotlb_entry_for_ptr_present(CPUArchState *env, int ptr_mmu_idx,
+                                            uint64_t ptr,
+                                            MMUAccessType ptr_access,
+                                            uintptr_t index);
 #else
 static inline void tlb_init(CPUState *cpu)
 {
diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index 8a7b779270a..a6247da34a0 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -429,6 +429,20 @@ void tlb_flush_all_cpus_synced(CPUState *src_cpu)
     tlb_flush_by_mmuidx_all_cpus_synced(src_cpu, ALL_MMUIDX_BITS);
 }
 
+void tlb_assert_iotlb_entry_for_ptr_present(CPUArchState *env, int ptr_mmu_idx,
+                                            uint64_t ptr,
+                                            MMUAccessType ptr_access,
+                                            uintptr_t index)
+{
+#ifdef CONFIG_DEBUG_TCG
+    CPUTLBEntry *entry = tlb_entry(env, ptr_mmu_idx, ptr);
+    target_ulong comparator = (ptr_access == MMU_DATA_LOAD
+                               ? entry->addr_read
+                               : tlb_addr_write(entry));
+    g_assert(tlb_hit(comparator, ptr));
+#endif
+}
+
 static bool tlb_hit_page_mask_anyprot(CPUTLBEntry *tlb_entry,
                                       target_ulong page, target_ulong mask)
 {
diff --git a/target/arm/mte_helper.c b/target/arm/mte_helper.c
index 6cea9d1b506..f47d3b4570e 100644
--- a/target/arm/mte_helper.c
+++ b/target/arm/mte_helper.c
@@ -111,15 +111,8 @@ static uint8_t *allocation_tag_mem(CPUARMState *env, int ptr_mmu_idx,
      * matching tlb entry + iotlb entry.
      */
     index = tlb_index(env, ptr_mmu_idx, ptr);
-# ifdef CONFIG_DEBUG_TCG
-    {
-        CPUTLBEntry *entry = tlb_entry(env, ptr_mmu_idx, ptr);
-        target_ulong comparator = (ptr_access == MMU_DATA_LOAD
-                                   ? entry->addr_read
-                                   : tlb_addr_write(entry));
-        g_assert(tlb_hit(comparator, ptr));
-    }
-# endif
+    tlb_assert_iotlb_entry_for_ptr_present(env, ptr_mmu_idx, ptr,
+                                           ptr_access, index);
     iotlbentry = &env_tlb(env)->d[ptr_mmu_idx].iotlb[index];
 
     /* If the virtual page MemAttr != Tagged, access unchecked. */
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index c8cdf7618eb..a5708da0f2f 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -4089,14 +4089,8 @@ static bool sve_probe_page(SVEHostPage *info, bool nofault,
     {
         uintptr_t index = tlb_index(env, mmu_idx, addr);
 
-# ifdef CONFIG_DEBUG_TCG
-        CPUTLBEntry *entry = tlb_entry(env, mmu_idx, addr);
-        target_ulong comparator = (access_type == MMU_DATA_LOAD
-                                   ? entry->addr_read
-                                   : tlb_addr_write(entry));
-        g_assert(tlb_hit(comparator, addr));
-# endif
-
+        tlb_assert_iotlb_entry_for_ptr_present(env, mmu_idx, addr,
+                                               access_type, index);
         CPUIOTLBEntry *iotlbentry = &env_tlb(env)->d[mmu_idx].iotlb[index];
         info->attrs = iotlbentry->attrs;
     }
-- 
2.26.2


