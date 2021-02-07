Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l8tPI-0008Ab-LN
	for mharc-qemu-riscv@gnu.org; Sun, 07 Feb 2021 18:23:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l8tPG-00084A-Fy; Sun, 07 Feb 2021 18:23:54 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:37998)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l8tPA-0001GP-EO; Sun, 07 Feb 2021 18:23:54 -0500
Received: by mail-wr1-x42e.google.com with SMTP id b3so15124266wrj.5;
 Sun, 07 Feb 2021 15:23:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1gVWXaMf3oEyIVlaRSD52U7PW5E6+zv5BhWBd9cIe8U=;
 b=dieu8kT6DPBl7biaAhh2IbRiZhFKJaDFtk8m6kE+KmZajs5PsD1IaEptYuYVKkUY7s
 Zfp9qKFNP+WDAMPdffILTbNrvQq1heYfVgX1TPSaPi5ByDfYNKVVhcSfHp6gAk1Qe7Ai
 Bx5YjO9bpLdGH6RRCxeG6CA/hxdfRypv8ID45uC7g5gJuZaVTq7ygkRyAzoutHrUlj7Q
 m8656dYNQyRWAcJnb/0xf0cOvtVAvmBEbfu4Fd63Dh/+JmfX2vXd0yVHwMEdRqYfmYBc
 niDhY+KUHqvcoLVASRNe2zpwRw+0EEzg21aOGkiWWs/L843DuKj6mhFsAf0zdrgd55Lq
 xNjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=1gVWXaMf3oEyIVlaRSD52U7PW5E6+zv5BhWBd9cIe8U=;
 b=aOITllgeNNpmn+no+YcbLNed3GPROKl3xXjPDCHC1FHzsnnx8rxcr/Ub2Yq77Hq6wZ
 J+cfYZuqHLZgBHnOyfkvKTSZTE//iRawOXcNISO0eQ1uVDF0nBZWNvErZaVunxG/hcXE
 jWrxril/HwsD6xSMNy6QrF9nILn+Uu0oqBzpcUcLUsIlrKVEQbCCsvYFXsUD8vOSrb+S
 sbipyJIM69j6ZRqnIX3U6nyNSjYdFoTo5WbT5a/pugb45lkFOwHZE0i6pQEXtcl19djq
 W8pUjq79rEuJASJ9GPjGpgKimUI+QHwoT9H7euWFl/XgokV/QL5LUNfoC0RaVMKdMaA2
 pjjg==
X-Gm-Message-State: AOAM530IUMCKR/C+J9WAd5+Lyco6WZVYnyEDphERLTSDXnllPFaztmm/
 Un/w+owe9oa0zy3csPgRH7NDpBrSCBM=
X-Google-Smtp-Source: ABdhPJyVklY2iZR1qB2FvBdZpCQETYGMgFD+Uou4udI+xcdPBlAgXW06g+snhQC2056ftJigqmzpHw==
X-Received: by 2002:a5d:5910:: with SMTP id v16mr17553674wrd.29.1612740225386; 
 Sun, 07 Feb 2021 15:23:45 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id i20sm16845931wmq.7.2021.02.07.15.23.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Feb 2021 15:23:44 -0800 (PST)
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
Subject: [PATCH v2 6/6] exec/cpu_ldst: Move tlb* declarations to
 "exec/exec-all.h"
Date: Mon,  8 Feb 2021 00:23:10 +0100
Message-Id: <20210207232310.2505283-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210207232310.2505283-1-f4bug@amsat.org>
References: <20210207232310.2505283-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=no autolearn_force=no
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
X-List-Received-Date: Sun, 07 Feb 2021 23:23:55 -0000

Keep MMU functions in "exec/cpu_ldst.h", and move TLB functions
to "exec/exec-all.h". As tlb_addr_write() is only called in
accel/tcg/cputlb.c, make move it there as a static function.

Doing so we removed the "tcg/tcg.h" dependency on "exec/cpu_ldst.h".

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/exec/cpu_ldst.h | 28 ----------------------------
 include/exec/exec-all.h | 16 ++++++++++++++++
 accel/tcg/cputlb.c      |  9 +++++++++
 3 files changed, 25 insertions(+), 28 deletions(-)

diff --git a/include/exec/cpu_ldst.h b/include/exec/cpu_ldst.h
index ef54cb7e1f8..c1753a64dfd 100644
--- a/include/exec/cpu_ldst.h
+++ b/include/exec/cpu_ldst.h
@@ -291,34 +291,6 @@ static inline void cpu_stq_le_mmuidx_ra(CPUArchState *env, abi_ptr addr,
 
 #else
 
-/* Needed for TCG_OVERSIZED_GUEST */
-#include "tcg/tcg.h"
-
-static inline target_ulong tlb_addr_write(const CPUTLBEntry *entry)
-{
-#if TCG_OVERSIZED_GUEST
-    return entry->addr_write;
-#else
-    return qatomic_read(&entry->addr_write);
-#endif
-}
-
-/* Find the TLB index corresponding to the mmu_idx + address pair.  */
-static inline uintptr_t tlb_index(CPUArchState *env, uintptr_t mmu_idx,
-                                  target_ulong addr)
-{
-    uintptr_t size_mask = env_tlb(env)->f[mmu_idx].mask >> CPU_TLB_ENTRY_BITS;
-
-    return (addr >> TARGET_PAGE_BITS) & size_mask;
-}
-
-/* Find the TLB entry corresponding to the mmu_idx + address pair.  */
-static inline CPUTLBEntry *tlb_entry(CPUArchState *env, uintptr_t mmu_idx,
-                                     target_ulong addr)
-{
-    return &env_tlb(env)->f[mmu_idx].table[tlb_index(env, mmu_idx, addr)];
-}
-
 uint32_t cpu_ldub_mmuidx_ra(CPUArchState *env, abi_ptr addr,
                             int mmu_idx, uintptr_t ra);
 int cpu_ldsb_mmuidx_ra(CPUArchState *env, abi_ptr addr,
diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index c5e8e355b7f..8e54b537189 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -297,6 +297,22 @@ void tlb_set_page(CPUState *cpu, target_ulong vaddr,
                   hwaddr paddr, int prot,
                   int mmu_idx, target_ulong size);
 
+/* Find the TLB index corresponding to the mmu_idx + address pair.  */
+static inline uintptr_t tlb_index(CPUArchState *env, uintptr_t mmu_idx,
+                                  target_ulong addr)
+{
+    uintptr_t size_mask = env_tlb(env)->f[mmu_idx].mask >> CPU_TLB_ENTRY_BITS;
+
+    return (addr >> TARGET_PAGE_BITS) & size_mask;
+}
+
+/* Find the TLB entry corresponding to the mmu_idx + address pair.  */
+static inline CPUTLBEntry *tlb_entry(CPUArchState *env, uintptr_t mmu_idx,
+                                     target_ulong addr)
+{
+    return &env_tlb(env)->f[mmu_idx].table[tlb_index(env, mmu_idx, addr)];
+}
+
 /*
  * Find the iotlbentry for ptr.  This *must* be present in the TLB
  * because we just found the mapping.
diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index a6247da34a0..084d19b52d7 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -429,6 +429,15 @@ void tlb_flush_all_cpus_synced(CPUState *src_cpu)
     tlb_flush_by_mmuidx_all_cpus_synced(src_cpu, ALL_MMUIDX_BITS);
 }
 
+static inline target_ulong tlb_addr_write(const CPUTLBEntry *entry)
+{
+#if TCG_OVERSIZED_GUEST
+    return entry->addr_write;
+#else
+    return qatomic_read(&entry->addr_write);
+#endif
+}
+
 void tlb_assert_iotlb_entry_for_ptr_present(CPUArchState *env, int ptr_mmu_idx,
                                             uint64_t ptr,
                                             MMUAccessType ptr_access,
-- 
2.26.2


