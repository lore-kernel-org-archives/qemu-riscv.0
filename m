Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mYAe3-0008Bk-F0
	for mharc-qemu-riscv@gnu.org; Wed, 06 Oct 2021 13:23:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mYAdb-0007Df-LZ
 for qemu-riscv@nongnu.org; Wed, 06 Oct 2021 13:23:28 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:39908)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mYAdX-00084S-9t
 for qemu-riscv@nongnu.org; Wed, 06 Oct 2021 13:23:27 -0400
Received: by mail-pf1-x433.google.com with SMTP id g2so2969725pfc.6
 for <qemu-riscv@nongnu.org>; Wed, 06 Oct 2021 10:23:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eoDpulWY47TPEEjM67+An5+VyrNAYMtmHaWkrPQS2EM=;
 b=n1NaSzUlmfzt3ghpMGqZ02qRpUOKq4UZGmYd+HPZ4so8f6j+JhmBAz+9SWiABU3Ggq
 WZgQehvqovWH6m8+Booms+2X4sm1IIDoQAma6FF3Ej3ew9oOlzHTZ6XBvQWN9naIVKL7
 F0/C4VY3bhO0YyV+94x/z/oNccqc4mnhMTx+u7XU9t3z4kWXQsIKHujPeK3BNI8gfmBT
 mBzNp9Es589+1H0elmBxDNxquOPwrqKYqKZYAuGBy33bJR/u9TgtSq/HnbbXC2ir84ET
 VGcxGL5OVI01IZmTa/3UuEISNM3ZZbFEXZ2HOQX/sX5LvdboMKa85CLmTrPh0LeKgvO6
 ZhEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eoDpulWY47TPEEjM67+An5+VyrNAYMtmHaWkrPQS2EM=;
 b=X74cA0Cm90HtHsBje5rV9I7mmZubUsh5I9sHagMIRtaZNHE4nFnoNIhQmXq/yp0W4Q
 PE9Gz76zBoZMOB1YtYKEvQSe4NThYghZk82Xr7nq589GVaH4c20iQe7jan2nK0Fceb5F
 19IN+B/E3pWv/380aDYdQHCWip9Ep91wrJd+EnyZp5udbcuQHdyoBrE17G56y8QsK4Jv
 j4ZFcQPkUGA70VFswU6gld8AnUqSWFKGGVymRtig13weFIIszi2w4MhUOgsiRwAziRXG
 mktabQZtJ958SBI9bcWlhU6AB1UApWy5sVy2eE3EqycaqeAi4OggviAlsfKsxZUmB28W
 s/mQ==
X-Gm-Message-State: AOAM532GEGrGaWZY3IJSzQ3gUgI+udiWk6GF62e0LBsaHn+bfSt4P999
 WcrSHlusgWyBPsG0z/9f212mKg==
X-Google-Smtp-Source: ABdhPJyvWqoyakNmHSSbtCgz5PEbCs3Ks2Mw0hOvAvODIUt1EUOUGXHABFYwVV9tSuljQtxb4LK9Eg==
X-Received: by 2002:aa7:9d02:0:b0:43d:ea96:5882 with SMTP id
 k2-20020aa79d02000000b0043dea965882mr37619682pfp.23.1633541000907; 
 Wed, 06 Oct 2021 10:23:20 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id w7sm21606929pfj.189.2021.10.06.10.23.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 10:23:20 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: laurent@vivier.eu,
	alex.bennee@linaro.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v4 15/41] linux-user/host/riscv: Populate host_signal.h
Date: Wed,  6 Oct 2021 10:22:41 -0700
Message-Id: <20211006172307.780893-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211006172307.780893-1-richard.henderson@linaro.org>
References: <20211006172307.780893-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 06 Oct 2021 17:23:28 -0000

Split host_signal_pc and host_signal_write out of user-exec.c.

Cc: qemu-riscv@nongnu.org
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/host/riscv/host-signal.h |  85 +++++++++++++++++-
 accel/tcg/user-exec.c               | 134 ----------------------------
 2 files changed, 84 insertions(+), 135 deletions(-)

diff --git a/linux-user/host/riscv/host-signal.h b/linux-user/host/riscv/host-signal.h
index f4b4d65031..5860dce7d7 100644
--- a/linux-user/host/riscv/host-signal.h
+++ b/linux-user/host/riscv/host-signal.h
@@ -1 +1,84 @@
-#define HOST_SIGNAL_PLACEHOLDER
+/*
+ * host-signal.h: signal info dependent on the host architecture
+ *
+ * Copyright (C) 2021 Linaro Limited
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#ifndef RISCV_HOST_SIGNAL_H
+#define RISCV_HOST_SIGNAL_H
+
+static inline uintptr_t host_signal_pc(ucontext_t *uc)
+{
+    return uc->uc_mcontext.__gregs[REG_PC];
+}
+
+static inline bool host_signal_write(siginfo_t *info, ucontext_t *uc)
+{
+    uint32_t insn = *(uint32_t *)host_signal_pc(uc);
+
+    /*
+     * Detect store by reading the instruction at the program
+     * counter. Note: we currently only generate 32-bit
+     * instructions so we thus only detect 32-bit stores
+     */
+    switch (((insn >> 0) & 0b11)) {
+    case 3:
+        switch (((insn >> 2) & 0b11111)) {
+        case 8:
+            switch (((insn >> 12) & 0b111)) {
+            case 0: /* sb */
+            case 1: /* sh */
+            case 2: /* sw */
+            case 3: /* sd */
+            case 4: /* sq */
+                return true;
+            default:
+                break;
+            }
+            break;
+        case 9:
+            switch (((insn >> 12) & 0b111)) {
+            case 2: /* fsw */
+            case 3: /* fsd */
+            case 4: /* fsq */
+                return true;
+            default:
+                break;
+            }
+            break;
+        default:
+            break;
+        }
+    }
+
+    /* Check for compressed instructions */
+    switch (((insn >> 13) & 0b111)) {
+    case 7:
+        switch (insn & 0b11) {
+        case 0: /*c.sd */
+        case 2: /* c.sdsp */
+            return true;
+        default:
+            break;
+        }
+        break;
+    case 6:
+        switch (insn & 0b11) {
+        case 0: /* c.sw */
+        case 3: /* c.swsp */
+            return true;
+        default:
+            break;
+        }
+        break;
+    default:
+        break;
+    }
+
+    return false;
+}
+
+#endif
diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
index fe3a3ce6e2..de8e106b68 100644
--- a/accel/tcg/user-exec.c
+++ b/accel/tcg/user-exec.c
@@ -139,64 +139,6 @@ bool handle_sigsegv_accerr_write(CPUState *cpu, sigset_t *old_set,
     }
 }
 
-/*
- * 'pc' is the host PC at which the exception was raised.
- * 'address' is the effective address of the memory exception.
- * 'is_write' is 1 if a write caused the exception and otherwise 0.
- * 'old_set' is the signal set which should be restored.
- */
-static inline int handle_cpu_signal(uintptr_t pc, siginfo_t *info,
-                                    int is_write, sigset_t *old_set)
-{
-    CPUState *cpu = current_cpu;
-    CPUClass *cc;
-    unsigned long host_addr = (unsigned long)info->si_addr;
-    MMUAccessType access_type = adjust_signal_pc(&pc, is_write);
-    abi_ptr guest_addr;
-
-    /* For synchronous signals we expect to be coming from the vCPU
-     * thread (so current_cpu should be valid) and either from running
-     * code or during translation which can fault as we cross pages.
-     *
-     * If neither is true then something has gone wrong and we should
-     * abort rather than try and restart the vCPU execution.
-     */
-    if (!cpu || !cpu->running) {
-        printf("qemu:%s received signal outside vCPU context @ pc=0x%"
-               PRIxPTR "\n",  __func__, pc);
-        abort();
-    }
-
-#if defined(DEBUG_SIGNAL)
-    printf("qemu: SIGSEGV pc=0x%08lx address=%08lx w=%d oldset=0x%08lx\n",
-           pc, host_addr, is_write, *(unsigned long *)old_set);
-#endif
-
-    /* Convert forcefully to guest address space, invalid addresses
-       are still valid segv ones */
-    guest_addr = h2g_nocheck(host_addr);
-
-    /* XXX: locking issue */
-    if (is_write &&
-        info->si_signo == SIGSEGV &&
-        info->si_code == SEGV_ACCERR &&
-        h2g_valid(host_addr) &&
-        handle_sigsegv_accerr_write(cpu, old_set, pc, guest_addr)) {
-        return 1;
-    }
-
-    /*
-     * There is no way the target can handle this other than raising
-     * an exception.  Undo signal and retaddr state prior to longjmp.
-     */
-    sigprocmask(SIG_SETMASK, old_set, NULL);
-
-    cc = CPU_GET_CLASS(cpu);
-    cc->tcg_ops->tlb_fill(cpu, guest_addr, 0, access_type,
-                          MMU_USER_IDX, false, pc);
-    g_assert_not_reached();
-}
-
 static int probe_access_internal(CPUArchState *env, target_ulong addr,
                                  int fault_size, MMUAccessType access_type,
                                  bool nonfault, uintptr_t ra)
@@ -255,82 +197,6 @@ void *probe_access(CPUArchState *env, target_ulong addr, int size,
     return size ? g2h(env_cpu(env), addr) : NULL;
 }
 
-#if defined(__riscv)
-
-int cpu_signal_handler(int host_signum, void *pinfo,
-                       void *puc)
-{
-    siginfo_t *info = pinfo;
-    ucontext_t *uc = puc;
-    greg_t pc = uc->uc_mcontext.__gregs[REG_PC];
-    uint32_t insn = *(uint32_t *)pc;
-    int is_write = 0;
-
-    /* Detect store by reading the instruction at the program
-       counter. Note: we currently only generate 32-bit
-       instructions so we thus only detect 32-bit stores */
-    switch (((insn >> 0) & 0b11)) {
-    case 3:
-        switch (((insn >> 2) & 0b11111)) {
-        case 8:
-            switch (((insn >> 12) & 0b111)) {
-            case 0: /* sb */
-            case 1: /* sh */
-            case 2: /* sw */
-            case 3: /* sd */
-            case 4: /* sq */
-                is_write = 1;
-                break;
-            default:
-                break;
-            }
-            break;
-        case 9:
-            switch (((insn >> 12) & 0b111)) {
-            case 2: /* fsw */
-            case 3: /* fsd */
-            case 4: /* fsq */
-                is_write = 1;
-                break;
-            default:
-                break;
-            }
-            break;
-        default:
-            break;
-        }
-    }
-
-    /* Check for compressed instructions */
-    switch (((insn >> 13) & 0b111)) {
-    case 7:
-        switch (insn & 0b11) {
-        case 0: /*c.sd */
-        case 2: /* c.sdsp */
-            is_write = 1;
-            break;
-        default:
-            break;
-        }
-        break;
-    case 6:
-        switch (insn & 0b11) {
-        case 0: /* c.sw */
-        case 3: /* c.swsp */
-            is_write = 1;
-            break;
-        default:
-            break;
-        }
-        break;
-    default:
-        break;
-    }
-
-    return handle_cpu_signal(pc, info, is_write, &uc->uc_sigmask);
-}
-#endif
-
 /* The softmmu versions of these helpers are in cputlb.c.  */
 
 uint32_t cpu_ldub_data(CPUArchState *env, abi_ptr ptr)
-- 
2.25.1


