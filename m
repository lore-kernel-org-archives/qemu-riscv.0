Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pVLGY-0002oG-Fv
	for mharc-qemu-riscv@gnu.org; Thu, 23 Feb 2023 18:44:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pVLGS-0002k9-3B
 for qemu-riscv@nongnu.org; Thu, 23 Feb 2023 18:44:41 -0500
Received: from mail-oi1-x22f.google.com ([2607:f8b0:4864:20::22f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pVLGQ-00018T-6R
 for qemu-riscv@nongnu.org; Thu, 23 Feb 2023 18:44:39 -0500
Received: by mail-oi1-x22f.google.com with SMTP id bm20so13842708oib.7
 for <qemu-riscv@nongnu.org>; Thu, 23 Feb 2023 15:44:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=niOll0s/PDcnOMdRIUOVBVVgsiBEkn8iEUg3l/2iVTQ=;
 b=hHmeCJSocilNvFU/5MelF/wzn7O7Ubjo4kJhAyw5Xy4o3Li2GmyDsC5igGPONTYcv0
 eEo/NNp6omt8IOQs1L8NRTquwV5aL+TAJnFfYTxZ5xSj4UKmkXirtfHAriGHPR6rQvEG
 B9xzJ2SbqWEA7syI8XJU9BcjIgP1LAOnm7m6h83NzqHjoA5DOx6JFsm4vYp9tNKi1FKk
 qrptQ9CbsODhxq3yEnbo2szlhaaRIJSqKEnnTNA/YXIxKW5iyLPaHy/s15eUc5mGZ40P
 Twmx5sXrOrAeSCbtZ3I1X2oC2zNqzr0JqanBBzmyo24OoWtyjq+C3dBDebAbMnRyatLq
 c2Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=niOll0s/PDcnOMdRIUOVBVVgsiBEkn8iEUg3l/2iVTQ=;
 b=RHScfWQtexiD9J+kt3JqdAAMkz9Esrqqr1thQ16Bp8HmwwnvAeT3EjQ/Ipbn2i7eXg
 PZtMaBfQNxmZiRAoqO84F+9OWaA1eWZYy4N6vFOMBU2oWWxhTsxKQ8CcLk+zUtj44ayK
 Cp9EJypaQWxEEvu9ax11sHHJypPcUGHEJ/U2Whi3gXUKwOWth8m8xx8DrswcnQjysvXo
 nIzZRGJXh+TA4TzMqvp3i09PL6rId70/l/hfHkMuGi2umPDhqHeOv75Lr785O4wiU5C/
 d+HkPWabWnVrEuNnRMBtcbXsPWvhDl9SJsbJ5Th0XAIFi9PchofrBouWkEi7ZIwZ35/7
 e7+Q==
X-Gm-Message-State: AO0yUKX3y75MINPp0INwOrMVwxg8NWpCkb/M7uoAy4Zt25plYWmcPHjU
 VjSkgY2Zc080A/U+6quWPl9Gxhgjqv/7V3AO
X-Google-Smtp-Source: AK7set/WdUygpuMPTB7z2o5ctXaknf6NLEB28UZ7C6eSclTAUD70Tu0FF2+yuf+elkR0Zn0Zk5FT4Q==
X-Received: by 2002:a05:6808:8ea:b0:37e:aa97:4660 with SMTP id
 d10-20020a05680808ea00b0037eaa974660mr5878983oic.16.1677195877080; 
 Thu, 23 Feb 2023 15:44:37 -0800 (PST)
Received: from grind.dc1.ventanamicro.com ([189.110.112.117])
 by smtp.gmail.com with ESMTPSA id
 v6-20020acaac06000000b0037facb2c5fasm2415037oie.1.2023.02.23.15.44.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Feb 2023 15:44:36 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com,
 richard.henderson@linaro.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v7 1/4] tcg: add 'size' param to probe_access_flags()
Date: Thu, 23 Feb 2023 20:44:24 -0300
Message-Id: <20230223234427.521114-2-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230223234427.521114-1-dbarboza@ventanamicro.com>
References: <20230223234427.521114-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22f;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x22f.google.com
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
X-List-Received-Date: Thu, 23 Feb 2023 23:44:41 -0000

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


