Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pSOs9-0001xo-Vw
	for mharc-qemu-riscv@gnu.org; Wed, 15 Feb 2023 15:59:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pSOs9-0001xS-3p
 for qemu-riscv@nongnu.org; Wed, 15 Feb 2023 15:59:25 -0500
Received: from mail-oi1-x230.google.com ([2607:f8b0:4864:20::230])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pSOs7-0000PK-0N
 for qemu-riscv@nongnu.org; Wed, 15 Feb 2023 15:59:24 -0500
Received: by mail-oi1-x230.google.com with SMTP id r28so17009158oiw.3
 for <qemu-riscv@nongnu.org>; Wed, 15 Feb 2023 12:59:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DVYpH3wcEZLqo7AM+Cm5OYqwfrbfJuXZLEm4g4I2jPM=;
 b=fRxLiYXIS5LCG0Z8cElUuLzhXWgp1pQ/iEQoF+ZLe+YIBCD+T0sC5PPyqtUDbmGyrI
 S4JVqxlQJRcaLfUDjuX3+bW8iDkkZLJk3vQlsg/2LwLatUp3TfA7JrMM7VyMwY/Bq9op
 NxlRl1TSG64nSukiXrIBIYix8gc4wiTap75MXpZea8pD0WKvIIqIY0b+Row9kcjmTLUX
 61e9LdzYDKxeKDnbrmlCjNTdDD2QujSv4oTT4A7W9ifUh1CwTxLvwmTp2OHPsjlVKV5N
 t+u2NTfICDeYdXTteJHe6ZkhMHLLS0B7Y57tk/qm1tJoDsqIBVNmIfqEIOILTiqXNR3B
 vtTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DVYpH3wcEZLqo7AM+Cm5OYqwfrbfJuXZLEm4g4I2jPM=;
 b=4DcKTnYPQQS+nI/+QtjMU0uDepsGBM3OGQq53VnDIRFWIAFt/VAuz11/1gdv0MbU+p
 3jHvZwnDdDnrc3r8VVnh/QdCsKLKslUQblGoepbttPgP0k3P6FXPbf/1brlM0c99Aohw
 zsgmoSdA6sx5VrfJRQ8R4rrZsrehY7nBbuiupmgbNbwzdiOUyuGITQENF8YWgJYuWkFk
 6weNXlUbQQX42lYrSC9ebU0iinm+8q866sy2nPw/SOW7CAoUMgCpqxcLBZycUZ3mRv3A
 wZFYQs4cDbkZYjwW4XwV+dboSdz/vEGAYWm29fVU28blxfkuLs3Rzv7uOltUnfsvotMR
 bT+w==
X-Gm-Message-State: AO0yUKU0m+vf45dWa9gaNKgTeQONShOXBHMpAP3kixYXP3pTPyaV6Nep
 +8Nq0K9pzm5v0uAOSeUcqKvKVQ==
X-Google-Smtp-Source: AK7set+DgtZ3YEahgjKlwyphNKjIWD8rHfFZWawgw3/Bq4Xdok6NWvUqbE65CPW9lCfmqjVKkenlJg==
X-Received: by 2002:a05:6808:2392:b0:37a:2bf0:502d with SMTP id
 bp18-20020a056808239200b0037a2bf0502dmr467077oib.27.1676494760136; 
 Wed, 15 Feb 2023 12:59:20 -0800 (PST)
Received: from grind.dc1.ventanamicro.com ([191.19.40.109])
 by smtp.gmail.com with ESMTPSA id
 p125-20020acad883000000b003436fa2c23bsm7761563oig.7.2023.02.15.12.59.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Feb 2023 12:59:19 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com,
 Christoph Muellner <cmuellner@linux.com>
Subject: [PATCH v5 1/4] accel/tcg: Add probe_access_range_flags interface
Date: Wed, 15 Feb 2023 17:59:08 -0300
Message-Id: <20230215205911.695745-2-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230215205911.695745-1-dbarboza@ventanamicro.com>
References: <20230215205911.695745-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::230;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x230.google.com
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
X-List-Received-Date: Wed, 15 Feb 2023 20:59:25 -0000

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
2.39.1


