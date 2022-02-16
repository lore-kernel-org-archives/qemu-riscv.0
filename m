Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nKMY3-0003rH-Th
	for mharc-qemu-riscv@gnu.org; Wed, 16 Feb 2022 10:48:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <christophm30@gmail.com>)
 id 1nKMXw-0003py-1a; Wed, 16 Feb 2022 10:48:49 -0500
Received: from mail-ed1-f51.google.com ([209.85.208.51]:46976)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <christophm30@gmail.com>)
 id 1nKMXu-0002Cr-9M; Wed, 16 Feb 2022 10:48:47 -0500
Received: by mail-ed1-f51.google.com with SMTP id m17so4553486edc.13;
 Wed, 16 Feb 2022 07:48:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BoKgCe4G+NDDPBY2ub1AJjaBVvuya03VwFnwHV4G4HM=;
 b=DNope7exz3s2jxVax7iSHUoe7PYuQarlywrzAmz6KEyEtQenSd/TDYjBIUID+rN8k7
 9GLtWT17mwZwwPg25/elVHsTbX1OnVft1iLenPI2AOmK9bgbSLn1SWZRx0Qz96boavMz
 LXO2gDwGv26J/Wr5DqYpi3/9G4I+LzTurUUHzruic5zL+qXNJgA7DRu1iBvhgw/1lQ5V
 UDB3zUa68kF134dPbH40a93U4iHGTRcdM5Vet0rgxPcIf4IDm7DhHt07GTYFFW2SamLs
 9Hwh2AzFHaGnDu2tqOlFAOzs6TTvnuHkN9UCbPI5S4x8ug0ofknm5XZmB3BteBWB25Ol
 pavw==
X-Gm-Message-State: AOAM530KLWEKidthJStwNcP+YEZ0G5iDOmKIcBesY3Yq0pdsVysTLbJ0
 AQCOumWiCBXYlobStQNJcTY=
X-Google-Smtp-Source: ABdhPJyK0Fgtz/rjiE+tgvxpcLPnYS36CCvQhY4fVJjpe5O9MCB9Eelrnw7woersDIBBcSQYsvDP7g==
X-Received: by 2002:a05:6402:1e8b:b0:3da:58e6:9a09 with SMTP id
 f11-20020a0564021e8b00b003da58e69a09mr3706315edf.155.1645026524562; 
 Wed, 16 Feb 2022 07:48:44 -0800 (PST)
Received: from beast.fritz.box (62-178-148-172.cable.dynamic.surfer.at.
 [62.178.148.172])
 by smtp.gmail.com with ESMTPSA id b15sm1895570edd.60.2022.02.16.07.48.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Feb 2022 07:48:44 -0800 (PST)
From: Christoph Muellner <cmuellner@linux.com>
To: Atish Patra <atishp@rivosinc.com>, Anup Patel <anup@brainfault.org>,
 =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20P=C3=A9trot?=
 <frederic.petrot@univ-grenoble-alpes.fr>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Philipp Tomsich <philipp.tomsich@vrull.eu>,
 Richard Henderson <richard.henderson@linaro.org>,
 Weiwei Li <liweiwei@iscas.ac.cn>
Cc: Christoph Muellner <cmuellner@linux.com>
Subject: [PATCH v4 1/2] accel/tcg: Add probe_access_range_flags interface
Date: Wed, 16 Feb 2022 16:48:38 +0100
Message-Id: <20220216154839.1024927-2-cmuellner@linux.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220216154839.1024927-1-cmuellner@linux.com>
References: <20220216154839.1024927-1-cmuellner@linux.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=209.85.208.51;
 envelope-from=christophm30@gmail.com; helo=mail-ed1-f51.google.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FORGED_FROMDOMAIN=0.25, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-List-Received-Date: Wed, 16 Feb 2022 15:48:49 -0000

The existing probe_access* functions do not allow to specify the
access size and a non-faulting behavior at the same time.

This is resolved by adding a generalization of probe_access_flags()
that takes an additional size parameter.

The semantics is basically the same as probe_access_flags(),
but instead of assuming an access to any byte of the addressed
page, we can restrict to access to a specific area, like
probe_access() allows.

Signed-off-by: Christoph Muellner <cmuellner@linux.com>
---
 accel/tcg/cputlb.c      | 17 +++++++++++++----
 accel/tcg/user-exec.c   | 15 ++++++++++++---
 include/exec/exec-all.h | 24 ++++++++++++++++++++++++
 3 files changed, 49 insertions(+), 7 deletions(-)

diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index 5e0d0eebc3..b4f0eb20b0 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -1624,13 +1624,14 @@ static int probe_access_internal(CPUArchState *env, target_ulong addr,
     return flags;
 }
 
-int probe_access_flags(CPUArchState *env, target_ulong addr,
-                       MMUAccessType access_type, int mmu_idx,
-                       bool nonfault, void **phost, uintptr_t retaddr)
+int probe_access_range_flags(CPUArchState *env, target_ulong addr,
+                             int size, MMUAccessType access_type,
+                             int mmu_idx, bool nonfault, void **phost,
+                             uintptr_t retaddr)
 {
     int flags;
 
-    flags = probe_access_internal(env, addr, 0, access_type, mmu_idx,
+    flags = probe_access_internal(env, addr, size, access_type, mmu_idx,
                                   nonfault, phost, retaddr);
 
     /* Handle clean RAM pages.  */
@@ -1645,6 +1646,14 @@ int probe_access_flags(CPUArchState *env, target_ulong addr,
     return flags;
 }
 
+int probe_access_flags(CPUArchState *env, target_ulong addr,
+                       MMUAccessType access_type, int mmu_idx,
+                       bool nonfault, void **phost, uintptr_t retaddr)
+{
+    return probe_access_range_flags(env, addr, 0, access_type, mmu_idx,
+                                    nonfault, phost, retaddr);
+}
+
 void *probe_access(CPUArchState *env, target_ulong addr, int size,
                    MMUAccessType access_type, int mmu_idx, uintptr_t retaddr)
 {
diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
index 6f5d4933f0..0dbc345e63 100644
--- a/accel/tcg/user-exec.c
+++ b/accel/tcg/user-exec.c
@@ -176,9 +176,10 @@ static int probe_access_internal(CPUArchState *env, target_ulong addr,
     cpu_loop_exit_sigsegv(env_cpu(env), addr, access_type, maperr, ra);
 }
 
-int probe_access_flags(CPUArchState *env, target_ulong addr,
-                       MMUAccessType access_type, int mmu_idx,
-                       bool nonfault, void **phost, uintptr_t ra)
+int probe_access_range_flags(CPUArchState *env, target_ulong addr,
+                             int size, MMUAccessType access_type,
+                             int mmu_idx, bool nonfault, void **phost,
+                             uintptr_t ra)
 {
     int flags;
 
@@ -187,6 +188,14 @@ int probe_access_flags(CPUArchState *env, target_ulong addr,
     return flags;
 }
 
+int probe_access_flags(CPUArchState *env, target_ulong addr,
+                       MMUAccessType access_type, int mmu_idx,
+                       bool nonfault, void **phost, uintptr_t ra)
+{
+    return probe_access_range_flags(env, addr, 0, access_type, mmu_idx,
+                                    nonfault, phost, ra);
+}
+
 void *probe_access(CPUArchState *env, target_ulong addr, int size,
                    MMUAccessType access_type, int mmu_idx, uintptr_t ra)
 {
diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index 35d8e93976..0d06b45c62 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -441,6 +441,30 @@ static inline void *probe_read(CPUArchState *env, target_ulong addr, int size,
     return probe_access(env, addr, size, MMU_DATA_LOAD, mmu_idx, retaddr);
 }
 
+/**
+ * probe_access_range_flags:
+ * @env: CPUArchState
+ * @addr: guest virtual address to look up
+ * @size: size of the access
+ * @access_type: read, write or execute permission
+ * @mmu_idx: MMU index to use for lookup
+ * @nonfault: suppress the fault
+ * @phost: return value for host address
+ * @retaddr: return address for unwinding
+ *
+ * Similar to probe_access, loosely returning the TLB_FLAGS_MASK for
+ * the access range, and storing the host address for RAM in @phost.
+ *
+ * If @nonfault is set, do not raise an exception but return TLB_INVALID_MASK.
+ * Do not handle watchpoints, but include TLB_WATCHPOINT in the returned flags.
+ * Do handle clean pages, so exclude TLB_NOTDIRY from the returned flags.
+ * For simplicity, all "mmio-like" flags are folded to TLB_MMIO.
+ */
+int probe_access_range_flags(CPUArchState *env, target_ulong addr,
+                             int size, MMUAccessType access_type,
+                             int mmu_idx, bool nonfault, void **phost,
+                             uintptr_t retaddr);
+
 /**
  * probe_access_flags:
  * @env: CPUArchState
-- 
2.35.1


