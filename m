Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pT7Rd-0002Zs-9Q
	for mharc-qemu-riscv@gnu.org; Fri, 17 Feb 2023 15:35:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pT7Rb-0002Z9-AG
 for qemu-riscv@nongnu.org; Fri, 17 Feb 2023 15:34:59 -0500
Received: from mail-oa1-x2c.google.com ([2001:4860:4864:20::2c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pT7RZ-0006Ss-Dq
 for qemu-riscv@nongnu.org; Fri, 17 Feb 2023 15:34:59 -0500
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-1718822c152so2435031fac.7
 for <qemu-riscv@nongnu.org>; Fri, 17 Feb 2023 12:34:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+BiRuaxKTKsNu1FfdHb4CFBeXYXh81VNNCvDte3mMlY=;
 b=k8RWlrxJZAsrwCNzCdC46yxUd6fa80rWztAcY5+8ZGmwhOsl5VVcsg24OEWGlWohuw
 Hpvmz7gFpBDBk+C2z9v+BpTwwOKKeUbb7dU/kWduWtgW3toxdUVFJ5Bn5P1U/FVGT6NY
 FN37X8K1JlFMVRSS8Fe/FHhWhtfFia4JK0P2gf6cE4zzIiiD/aEeRvodXquyMOWJ2me1
 Z1mYo9RXTRvnCxbnGCvC4WanIFCuSQv1VM7MJVN0GGqZgIBedYk/YgTD274rkcud3Dul
 pFRVigG3x4hxHJ6mtlwyTTKUri/klpM5VbTaul1gjCyNmQxFaVuJNWUBssFgPB14umEu
 97zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+BiRuaxKTKsNu1FfdHb4CFBeXYXh81VNNCvDte3mMlY=;
 b=Hyypgyi+x5sz18pogPOqzF2h9kqZ44zB4h0eyNt9TU3G4d/UVvUd9OrzOZTsgxGJZ1
 N2z+/FDfiNrgS6CQxcwbuivAM4oEcyUcuCsQONRXUbdxjVDFFxg28DFl9ImgIQrhwK7M
 7A39lb7DVm+aTPqaNS1jRqrVqc7GDdQMTUIBSk0idwe6+Da3oEgCnhNUcP74Lmj1j3H7
 3+D8CGBG0KQg0310L6JvyxHfw82dT5YDf1sZ/LZnkpFfmF7+lm5cLyi6xIehOHOQWvZk
 zIHlk/IwtxXN//C+Tid+YeMtON1YA5AcyPgEq44BC0W4C1zFf/HYI0gvTfJlGgPKCUvv
 j79A==
X-Gm-Message-State: AO0yUKXqcJydPZQPhmNYHS9IVUgCc5eR/9iNO909/g4gNuAO7n9cQ+vK
 bLbOcrMJPh0kexBUZXFu5Gz5Zg==
X-Google-Smtp-Source: AK7set8Vm4HZfmrOUe16ill2LLtbHMSx2HG7Tbxl4zFiVV/3yOlEtd6bNqiwf7GBTg0jmwAiX8rUzA==
X-Received: by 2002:a05:6870:b611:b0:16d:f297:cc10 with SMTP id
 cm17-20020a056870b61100b0016df297cc10mr294394oab.1.1676666096181; 
 Fri, 17 Feb 2023 12:34:56 -0800 (PST)
Received: from grind.dc1.ventanamicro.com ([191.19.40.109])
 by smtp.gmail.com with ESMTPSA id
 ef5-20020a0568701a8500b00152c52608dbsm1125616oab.34.2023.02.17.12.34.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Feb 2023 12:34:55 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com,
 dbarboza@ventanamicro.com, richard.henderson@linaro.org,
 Christoph Muellner <cmuellner@linux.com>
Subject: [PATCH v6 1/4] accel/tcg: Add probe_access_range_flags interface
Date: Fri, 17 Feb 2023 17:34:42 -0300
Message-Id: <20230217203445.51077-2-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230217203445.51077-1-dbarboza@ventanamicro.com>
References: <20230217203445.51077-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2c;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x2c.google.com
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
X-List-Received-Date: Fri, 17 Feb 2023 20:34:59 -0000

From: Christoph Muellner <cmuellner@linux.com>

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
 accel/tcg/cputlb.c      | 19 +++++++++++++++++++
 accel/tcg/user-exec.c   | 15 ++++++++++++---
 include/exec/exec-all.h | 24 ++++++++++++++++++++++++
 3 files changed, 55 insertions(+), 3 deletions(-)

diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index 4812d83961..dd3bc7a356 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -1606,6 +1606,25 @@ int probe_access_full(CPUArchState *env, target_ulong addr,
     return flags;
 }
 
+int probe_access_range_flags(CPUArchState *env, target_ulong addr,
+                             int size, MMUAccessType access_type,
+                             int mmu_idx, bool nonfault, void **phost,
+                             uintptr_t retaddr)
+{
+    CPUTLBEntryFull *full;
+    int flags = probe_access_internal(env, addr, size, access_type,
+                                      mmu_idx, nonfault, phost, &full,
+                                      retaddr);
+
+    /* Handle clean RAM pages.  */
+    if (unlikely(flags & TLB_NOTDIRTY)) {
+        notdirty_write(env_cpu(env), addr, 1, full, retaddr);
+        flags &= ~TLB_NOTDIRTY;
+    }
+
+    return flags;
+}
+
 int probe_access_flags(CPUArchState *env, target_ulong addr,
                        MMUAccessType access_type, int mmu_idx,
                        bool nonfault, void **phost, uintptr_t retaddr)
diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
index ae67d84638..a73c840655 100644
--- a/accel/tcg/user-exec.c
+++ b/accel/tcg/user-exec.c
@@ -761,9 +761,10 @@ static int probe_access_internal(CPUArchState *env, target_ulong addr,
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
 
@@ -772,6 +773,14 @@ int probe_access_flags(CPUArchState *env, target_ulong addr,
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
index 54585a9954..b75f15f247 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -442,6 +442,30 @@ static inline void *probe_read(CPUArchState *env, target_ulong addr, int size,
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
+ * Do handle clean pages, so exclude TLB_NOTDIRTY from the returned flags.
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
2.39.2


