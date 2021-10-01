Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mWM5c-0005zo-Fu
	for mharc-qemu-riscv@gnu.org; Fri, 01 Oct 2021 13:12:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mWM5H-0005EE-3r
 for qemu-riscv@nongnu.org; Fri, 01 Oct 2021 13:12:31 -0400
Received: from mail-qv1-xf34.google.com ([2607:f8b0:4864:20::f34]:46641)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mWM5B-0005In-TZ
 for qemu-riscv@nongnu.org; Fri, 01 Oct 2021 13:12:30 -0400
Received: by mail-qv1-xf34.google.com with SMTP id gs10so5960514qvb.13
 for <qemu-riscv@nongnu.org>; Fri, 01 Oct 2021 10:12:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7570NHxgZZiIlSGX0IMLoQr+WiKI3C5JO5f+PGrIgpw=;
 b=wsQNFhzeKyj2bCz5AcZFLwdtCU02LAWPz0h/7AgxFq1cxGPpGwG/hdhPhdSw1d24UU
 qlFZTnC2dI7OclCLRG436teRdwYjCNdp9qfmuLs+oBmTe+MrhJyZmPejJMY5Eh1GobWM
 NWm9RLZc+kLhpWMMXTS3aSeOm4gC1yeYM06WMElsYUcVePXB7bdD/X9umFjGTdLzO4RP
 hiEGhP9I/z7/CbQE0ROBM9e9M8i3urviRUj23uRNPFzGlUm7t/ac3UN0R/yd6HShOOOW
 lmuGfyIEp3tjiFJlbFTMKXVIrXP0zxSkl19s+MP/LZRO0k9KsIMhXtOCXWvxEZOZ4bGA
 L5+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7570NHxgZZiIlSGX0IMLoQr+WiKI3C5JO5f+PGrIgpw=;
 b=prk2P7ngN4dTH5Jo2t2wglhlOH4SevRT0Wsb+Ql8kSWf1yls74Dfa0qyWM4wpPhN8S
 OrsNgrHm7fEVcPgvtJ4cLmYQHCHHGViG2H0sWbiuwNoGEvGssVcYnk/fsgJZGgOCzuiJ
 lC3uDZyu7tyKIq7MaBwtQfrUsOcAFyZYRD8QaPEquZN+0UT6GxV+jPLJI8e2uEMSzRBS
 6h4dmHhORcLgLVY/arCgosTQ0Xsl8i6CpgnMisS0wCmDLWAz5INTeStqJwSPRm5TqzsT
 KoX7qYURHcDBw+hE6ue3s5Bes/JweaHsD51Id9j0M98r2aCTTjWavmxWX+ghnAm4Xg+b
 V1HQ==
X-Gm-Message-State: AOAM530T0F/DyQf1qGvtgcT4r+Ov7DUCC54p7n5FqBsuNwKlb03As+9S
 eIHzMC8rJ3bmMEAr1yGp7Z+6Ee2i+s+bNA==
X-Google-Smtp-Source: ABdhPJy196vMpgGdWwjrcjD+zyZzfrMpsGQCQ4DlQ1BjOYynxlq+sHxvs/5lmaKpVmyYEyYF0U9dnA==
X-Received: by 2002:a05:6214:1465:: with SMTP id
 c5mr9982163qvy.66.1633108343860; 
 Fri, 01 Oct 2021 10:12:23 -0700 (PDT)
Received: from localhost.localdomain (c-67-174-166-185.hsd1.ga.comcast.net.
 [67.174.166.185])
 by smtp.gmail.com with ESMTPSA id y15sm3557250qko.78.2021.10.01.10.12.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Oct 2021 10:12:23 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: laurent@vivier.eu,
	alex.bennee@linaro.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v3 35/41] target/riscv: Make riscv_cpu_tlb_fill sysemu only
Date: Fri,  1 Oct 2021 13:11:45 -0400
Message-Id: <20211001171151.1739472-36-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211001171151.1739472-1-richard.henderson@linaro.org>
References: <20211001171151.1739472-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f34;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf34.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Fri, 01 Oct 2021 17:12:31 -0000

The fallback code in raise_sigsegv is sufficient for riscv.
Remove the code from cpu_loop that raised SIGSEGV.

Cc: qemu-riscv@nongnu.org
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/riscv/cpu_loop.c |  7 -------
 target/riscv/cpu.c          |  2 +-
 target/riscv/cpu_helper.c   | 21 +--------------------
 3 files changed, 2 insertions(+), 28 deletions(-)

diff --git a/linux-user/riscv/cpu_loop.c b/linux-user/riscv/cpu_loop.c
index 9859a366e4..aef019b1c8 100644
--- a/linux-user/riscv/cpu_loop.c
+++ b/linux-user/riscv/cpu_loop.c
@@ -87,13 +87,6 @@ void cpu_loop(CPURISCVState *env)
             sigcode = TARGET_TRAP_BRKPT;
             sigaddr = env->pc;
             break;
-        case RISCV_EXCP_INST_PAGE_FAULT:
-        case RISCV_EXCP_LOAD_PAGE_FAULT:
-        case RISCV_EXCP_STORE_PAGE_FAULT:
-            signum = TARGET_SIGSEGV;
-            sigcode = TARGET_SEGV_MAPERR;
-            sigaddr = env->badaddr;
-            break;
         case RISCV_EXCP_SEMIHOST:
             env->gpr[xA0] = do_common_semihosting(cs);
             env->pc += 4;
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 7c626d89cd..0292a72feb 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -675,9 +675,9 @@ static const struct SysemuCPUOps riscv_sysemu_ops = {
 static const struct TCGCPUOps riscv_tcg_ops = {
     .initialize = riscv_translate_init,
     .synchronize_from_tb = riscv_cpu_synchronize_from_tb,
-    .tlb_fill = riscv_cpu_tlb_fill,
 
 #ifndef CONFIG_USER_ONLY
+    .tlb_fill = riscv_cpu_tlb_fill,
     .cpu_exec_interrupt = riscv_cpu_exec_interrupt,
     .do_interrupt = riscv_cpu_do_interrupt,
     .do_transaction_failed = riscv_cpu_do_transaction_failed,
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index d41d5cd27c..b520d6fc78 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -748,7 +748,6 @@ void riscv_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
                             riscv_cpu_two_stage_lookup(mmu_idx);
     riscv_raise_exception(env, cs->exception_index, retaddr);
 }
-#endif /* !CONFIG_USER_ONLY */
 
 bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
                         MMUAccessType access_type, int mmu_idx,
@@ -756,7 +755,6 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
 {
     RISCVCPU *cpu = RISCV_CPU(cs);
     CPURISCVState *env = &cpu->env;
-#ifndef CONFIG_USER_ONLY
     vaddr im_address;
     hwaddr pa = 0;
     int prot, prot2, prot_pmp;
@@ -888,25 +886,8 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
     }
 
     return true;
-
-#else
-    switch (access_type) {
-    case MMU_INST_FETCH:
-        cs->exception_index = RISCV_EXCP_INST_PAGE_FAULT;
-        break;
-    case MMU_DATA_LOAD:
-        cs->exception_index = RISCV_EXCP_LOAD_PAGE_FAULT;
-        break;
-    case MMU_DATA_STORE:
-        cs->exception_index = RISCV_EXCP_STORE_PAGE_FAULT;
-        break;
-    default:
-        g_assert_not_reached();
-    }
-    env->badaddr = address;
-    cpu_loop_exit_restore(cs, retaddr);
-#endif
 }
+#endif /* !CONFIG_USER_ONLY */
 
 /*
  * Handle Traps
-- 
2.25.1


