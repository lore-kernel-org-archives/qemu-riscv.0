Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pVY5L-0003kk-TB
	for mharc-qemu-riscv@gnu.org; Fri, 24 Feb 2023 08:26:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pVY5C-0003iv-Bs
 for qemu-riscv@nongnu.org; Fri, 24 Feb 2023 08:25:55 -0500
Received: from mail-oa1-x2f.google.com ([2001:4860:4864:20::2f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pVY58-0005U9-B1
 for qemu-riscv@nongnu.org; Fri, 24 Feb 2023 08:25:51 -0500
Received: by mail-oa1-x2f.google.com with SMTP id
 586e51a60fabf-1729bdcca99so2823609fac.12
 for <qemu-riscv@nongnu.org>; Fri, 24 Feb 2023 05:25:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jR/gDGrKY2oOFb5rpnLo5gcR+ckh8I3+coh9b7Ltzc4=;
 b=JBEG5LkqzfqA4nqrOW3hXkSlGDsZMGyKasy3vaGQfAD/9O52DV17LpUHHPlQ7dUBze
 qVIEdGNhdmG3riN8vDWEDRPUkDYh+1gqqfZEtiZXFPzbuMNqXjLyxH/QMEFm66t5gEAy
 1TfX6QEGkUQwvjFq1WaSn8VLbMzF0SWyRkCRmbWdY1UrVooOR4VqxeCP1XkhbKCKpRaw
 FMVK58iBjqK5s6lLH/JaIOzctxt4kExTJdyqi2zJDxHQo8Oh885uaT0FAXDfl1ti8rS4
 CX0LAfmjteXNMrwM34xu7DYRumMYExQ5hpY0DW8XSZVtrVs1Y0IerdmVLtkblrCqfUc7
 FyFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jR/gDGrKY2oOFb5rpnLo5gcR+ckh8I3+coh9b7Ltzc4=;
 b=PclD92ucyhwLlnbWbugZL/nOCU+fw9nAeoMGBnG9HUrADU/RevhdNAH09jNoWdMhh+
 Xn2LOI4YOHpnLNe6ItzgL49MtqmnbXmsDf4TZkgBnCe/UOXh1kLd4p8MCPFD67tZKOxa
 VJI2evxZRCO9y4gAjfhSVGuq91MrafT9TS+vsJHHK+4eO2IjMdNoJbQRNX+yFccUCqlA
 SFzAavQolnDE073cqorqh5QLFgHnoW/wesrLRUeDAgG8Xqw1WgSoDAMcslk/K3Zu/cED
 QL+CeetbW7PIdhWbNgmYikjzFGM/eykC0wtnJvUvBGdKg6q9NL1f9CqDHPHxy3mp6lQ6
 NOUQ==
X-Gm-Message-State: AO0yUKWt2nEMaAZ69rBAaOX7XRUZrMZyI3BLsHJVIIfCVy2iLznP61I/
 D8ARmeGaWeWGqaBaxrfHITMysA==
X-Google-Smtp-Source: AK7set+l+2fnF8m12Vdr5xS5lFgFbO9MpK2+TyXs1YsMQ2siiK80nu5XzOxh9phP8H3v54dp1mJtkQ==
X-Received: by 2002:a05:6870:ea97:b0:16d:ccf9:bb4d with SMTP id
 s23-20020a056870ea9700b0016dccf9bb4dmr11420494oap.39.1677245149143; 
 Fri, 24 Feb 2023 05:25:49 -0800 (PST)
Received: from grind.. ([2804:18:18bc:fbbd:3c90:eebc:7544:73fd])
 by smtp.gmail.com with ESMTPSA id
 b5-20020a05687061c500b001435fe636f2sm3383763oah.53.2023.02.24.05.25.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Feb 2023 05:25:48 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com,
 richard.henderson@linaro.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v8 1/4] tcg: add 'size' param to probe_access_flags()
Date: Fri, 24 Feb 2023 10:25:33 -0300
Message-Id: <20230224132536.552293-2-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230224132536.552293-1-dbarboza@ventanamicro.com>
References: <20230224132536.552293-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2f;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x2f.google.com
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
X-List-Received-Date: Fri, 24 Feb 2023 13:25:55 -0000

probe_access_flags() as it is today uses probe_access_full(), which in
turn uses probe_access_internal() with size = 0. probe_access_internal()
then uses the size to call the tlb_fill() callback for the given CPU.
This size param ('fault_size' as probe_access_internal() calls it) is
ignored by most existing .tlb_fill callback implementations, e.g.
arm_cpu_tlb_fill(), ppc_cpu_tlb_fill(), x86_cpu_tlb_fill() and
mips_cpu_tlb_fill() to name a few.

But RISC-V riscv_cpu_tlb_fill() actually uses it. The 'size' parameter
is used to check for PMP (Physical Memory Protection) access. This is
necessary because PMP does not make any guarantees about all the bytes
of the same page having the same permissions, i.e. the same page can
have different PMP properties, so we're forced to make sub-page range
checks. To allow RISC-V emulation to do a probe_acess_flags() that
covers PMP, we need to either add a 'size' param to the existing
probe_acess_flags() or create a new interface (e.g.
probe_access_range_flags).

There are quite a few probe_* APIs already, so let's add a 'size' param
to probe_access_flags() and re-use this API. This is done by open coding
what probe_access_full() does inside probe_acess_flags() and passing the
'size' param to probe_acess_internal(). Existing probe_access_flags()
callers use size = 0 to not change their current API usage. 'size' is
asserted to enforce single page access like probe_access() already does.

No behavioral changes intended.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 accel/stubs/tcg-stub.c        |  2 +-
 accel/tcg/cputlb.c            | 17 ++++++++++++++---
 accel/tcg/user-exec.c         |  5 +++--
 include/exec/exec-all.h       |  3 ++-
 semihosting/uaccess.c         |  2 +-
 target/arm/ptw.c              |  2 +-
 target/arm/sve_helper.c       |  2 +-
 target/s390x/tcg/mem_helper.c |  6 +++---
 8 files changed, 26 insertions(+), 13 deletions(-)

diff --git a/accel/stubs/tcg-stub.c b/accel/stubs/tcg-stub.c
index c1b05767c0..96af23dc5d 100644
--- a/accel/stubs/tcg-stub.c
+++ b/accel/stubs/tcg-stub.c
@@ -25,7 +25,7 @@ void tcg_flush_jmp_cache(CPUState *cpu)
 {
 }
 
-int probe_access_flags(CPUArchState *env, target_ulong addr,
+int probe_access_flags(CPUArchState *env, target_ulong addr, int size,
                        MMUAccessType access_type, int mmu_idx,
                        bool nonfault, void **phost, uintptr_t retaddr)
 {
diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index 4812d83961..fc27e34457 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -1606,14 +1606,25 @@ int probe_access_full(CPUArchState *env, target_ulong addr,
     return flags;
 }
 
-int probe_access_flags(CPUArchState *env, target_ulong addr,
+int probe_access_flags(CPUArchState *env, target_ulong addr, int size,
                        MMUAccessType access_type, int mmu_idx,
                        bool nonfault, void **phost, uintptr_t retaddr)
 {
     CPUTLBEntryFull *full;
+    int flags;
+
+    g_assert(-(addr | TARGET_PAGE_MASK) >= size);
+
+    flags = probe_access_internal(env, addr, size, access_type, mmu_idx,
+                                  nonfault, phost, &full, retaddr);
 
-    return probe_access_full(env, addr, access_type, mmu_idx,
-                             nonfault, phost, &full, retaddr);
+    /* Handle clean RAM pages. */
+    if (unlikely(flags & TLB_NOTDIRTY)) {
+        notdirty_write(env_cpu(env), addr, 1, full, retaddr);
+        flags &= ~TLB_NOTDIRTY;
+    }
+
+    return flags;
 }
 
 void *probe_access(CPUArchState *env, target_ulong addr, int size,
diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
index ae67d84638..7b37fd229e 100644
--- a/accel/tcg/user-exec.c
+++ b/accel/tcg/user-exec.c
@@ -761,13 +761,14 @@ static int probe_access_internal(CPUArchState *env, target_ulong addr,
     cpu_loop_exit_sigsegv(env_cpu(env), addr, access_type, maperr, ra);
 }
 
-int probe_access_flags(CPUArchState *env, target_ulong addr,
+int probe_access_flags(CPUArchState *env, target_ulong addr, int size,
                        MMUAccessType access_type, int mmu_idx,
                        bool nonfault, void **phost, uintptr_t ra)
 {
     int flags;
 
-    flags = probe_access_internal(env, addr, 0, access_type, nonfault, ra);
+    g_assert(-(addr | TARGET_PAGE_MASK) >= size);
+    flags = probe_access_internal(env, addr, size, access_type, nonfault, ra);
     *phost = flags ? NULL : g2h(env_cpu(env), addr);
     return flags;
 }
diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index 54585a9954..b0d4916573 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -446,6 +446,7 @@ static inline void *probe_read(CPUArchState *env, target_ulong addr, int size,
  * probe_access_flags:
  * @env: CPUArchState
  * @addr: guest virtual address to look up
+ * @size: size of the access
  * @access_type: read, write or execute permission
  * @mmu_idx: MMU index to use for lookup
  * @nonfault: suppress the fault
@@ -460,7 +461,7 @@ static inline void *probe_read(CPUArchState *env, target_ulong addr, int size,
  * Do handle clean pages, so exclude TLB_NOTDIRY from the returned flags.
  * For simplicity, all "mmio-like" flags are folded to TLB_MMIO.
  */
-int probe_access_flags(CPUArchState *env, target_ulong addr,
+int probe_access_flags(CPUArchState *env, target_ulong addr, int size,
                        MMUAccessType access_type, int mmu_idx,
                        bool nonfault, void **phost, uintptr_t retaddr);
 
diff --git a/semihosting/uaccess.c b/semihosting/uaccess.c
index 8018828069..7505eb6d1b 100644
--- a/semihosting/uaccess.c
+++ b/semihosting/uaccess.c
@@ -37,7 +37,7 @@ ssize_t softmmu_strlen_user(CPUArchState *env, target_ulong addr)
         /* Find the number of bytes remaining in the page. */
         left_in_page = TARGET_PAGE_SIZE - (addr & ~TARGET_PAGE_MASK);
 
-        flags = probe_access_flags(env, addr, MMU_DATA_LOAD,
+        flags = probe_access_flags(env, addr, 0, MMU_DATA_LOAD,
                                    mmu_idx, true, &h, 0);
         if (flags & TLB_INVALID_MASK) {
             return -1;
diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 2b125fff44..1ecefb2027 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -407,7 +407,7 @@ static uint64_t arm_casq_ptw(CPUARMState *env, uint64_t old_val,
         void *discard;
 
         env->tlb_fi = fi;
-        flags = probe_access_flags(env, ptw->out_virt, MMU_DATA_STORE,
+        flags = probe_access_flags(env, ptw->out_virt, 0, MMU_DATA_STORE,
                                    arm_to_core_mmu_idx(ptw->in_ptw_idx),
                                    true, &discard, 0);
         env->tlb_fi = NULL;
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 521fc9b969..51909c44ac 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -5352,7 +5352,7 @@ bool sve_probe_page(SVEHostPage *info, bool nofault, CPUARMState *env,
     addr = useronly_clean_ptr(addr);
 
 #ifdef CONFIG_USER_ONLY
-    flags = probe_access_flags(env, addr, access_type, mmu_idx, nofault,
+    flags = probe_access_flags(env, addr, 0, access_type, mmu_idx, nofault,
                                &info->host, retaddr);
 #else
     CPUTLBEntryFull *full;
diff --git a/target/s390x/tcg/mem_helper.c b/target/s390x/tcg/mem_helper.c
index d6725fd18c..c9fd4142f1 100644
--- a/target/s390x/tcg/mem_helper.c
+++ b/target/s390x/tcg/mem_helper.c
@@ -143,14 +143,14 @@ static int s390_probe_access(CPUArchState *env, target_ulong addr, int size,
                              bool nonfault, void **phost, uintptr_t ra)
 {
 #if defined(CONFIG_USER_ONLY)
-    return probe_access_flags(env, addr, access_type, mmu_idx,
+    return probe_access_flags(env, addr, 0, access_type, mmu_idx,
                               nonfault, phost, ra);
 #else
     int flags;
 
     env->tlb_fill_exc = 0;
-    flags = probe_access_flags(env, addr, access_type, mmu_idx, nonfault, phost,
-                               ra);
+    flags = probe_access_flags(env, addr, 0, access_type, mmu_idx,
+                               nonfault, phost, ra);
     if (env->tlb_fill_exc) {
         return env->tlb_fill_exc;
     }
-- 
2.39.2


