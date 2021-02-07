Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l8t0P-0002gY-NZ
	for mharc-qemu-riscv@gnu.org; Sun, 07 Feb 2021 17:58:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l8t0N-0002by-Qf; Sun, 07 Feb 2021 17:58:11 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:55103)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l8t0M-0001Ai-69; Sun, 07 Feb 2021 17:58:11 -0500
Received: by mail-wm1-x336.google.com with SMTP id w4so11130313wmi.4;
 Sun, 07 Feb 2021 14:58:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=imFQGKJBgIE298lnVAuxYDCszjx31PWDfQloLbhmsMQ=;
 b=ccqfoVFWKhdwHfQk7EbK+L+WxFtzyD2lU54qDn3jgzJBdMirDaUQk7vEegZZYvh5pJ
 RprOm+NyNZeYKPsmdBydtNPkZQfQycmxtC1V+7juepQlohVEx/0KEdKVTYlLplACS3WE
 km9oxVD3WQZNG68qlnfzSJb1QsaEeDNZJT/PGaq8s75GNyq9pM/Er94AKuRLeXjp1tlj
 pVaEdHgsyHt1K1gIVFnXc4Wv0Taq+HupGxWlkDkCpR/q2mhxWcuN4uYpiPUKl8XZ2DKV
 5zcV1t79HCt1Yg3Xcj3IkC3HFx082SYlE59JYxbdXDM0o82JuN1Ks2XWWqMhcM90icRI
 KPtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=imFQGKJBgIE298lnVAuxYDCszjx31PWDfQloLbhmsMQ=;
 b=hKeoD2bdCxj9nxYYvT5gVD/JuTVh42tXZRgCylnO8LbUBlPvRuJP2zScLeRhETlmpI
 iqOt+5jdHWkLFyScKeK6SLvRRZVl51DDS68wDvkYgI3W56r0fr31IeZgOL92QU3zBYC1
 8HoQyPxGTutCoYDjV4HUO54Vsb/oIuKzGykgOwXeJ9IaG3/yf5P3IqZJWUhZGy7Qmh2r
 Uk7ioC5jGwqqhN7AKSiAXkn8xIBQeyU1M34wh6hWiTwyuNa0BntnGTDUv4UHUtBSMHsa
 ZqX23sqRR51DUKk8FilUd9+YtqZSEh1/ZnsRjyfmKIGq3zyC/T4O8Ct7Ci/Jjrl0vT07
 IPjg==
X-Gm-Message-State: AOAM533w/JaW0udmlXNGTna8C/c6pOStb0hzsqJExl4cWIi+9sIg8PaC
 Q8eZwl3r8JV09vVrxsSu09GMXFVo+OA=
X-Google-Smtp-Source: ABdhPJw/1Snq5MMokBjwZDAYrhfP9rZn2CbyxktT5w7GVWiOTMd+hThpFCk39XUsnjoTLmsK7GY4pw==
X-Received: by 2002:a7b:cb4f:: with SMTP id v15mr12379534wmj.162.1612738687873; 
 Sun, 07 Feb 2021 14:58:07 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id z6sm6300217wmi.39.2021.02.07.14.58.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Feb 2021 14:58:07 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Peter Maydell <peter.maydell@linaro.org>,
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, qemu-arm@nongnu.org,
 Aurelien Jarno <aurelien@aurel32.net>, qemu-riscv@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [RFC PATCH 5/6] accel/tcg: Refactor debugging
 tlb_assert_iotlb_entry_for_ptr_present()
Date: Sun,  7 Feb 2021 23:57:37 +0100
Message-Id: <20210207225738.2482987-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210207225738.2482987-1-f4bug@amsat.org>
References: <20210207225738.2482987-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x336.google.com
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
X-List-Received-Date: Sun, 07 Feb 2021 22:58:12 -0000

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


