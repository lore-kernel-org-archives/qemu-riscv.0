Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mYAds-0007ul-QL
	for mharc-qemu-riscv@gnu.org; Wed, 06 Oct 2021 13:23:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mYAdp-0007gF-0T
 for qemu-riscv@nongnu.org; Wed, 06 Oct 2021 13:23:41 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:33778)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mYAdn-0008Jm-A3
 for qemu-riscv@nongnu.org; Wed, 06 Oct 2021 13:23:40 -0400
Received: by mail-pf1-x436.google.com with SMTP id s16so3018437pfk.0
 for <qemu-riscv@nongnu.org>; Wed, 06 Oct 2021 10:23:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FGojKB1MhBg8jwsgkZLRwblMIZjIzT+Djmo8uocQA0s=;
 b=Nmc1a2nlu4MH+kSNTXuXZ+xGpUrf6RGu+SI+ocSPM6IqBHyCSagbRB1/m76W5HaxpG
 U6aqzMPlOS6lB7qAI1a1A0UR8c82rYcmZORVmBYHxXvNyulrT64LjOrflExrAU70zUeY
 PSD+jk4kQz8oagiDDQqR/DfS6VGKE+gUkjHU3t00DQWa7+xUiY2erXgl1CmwWHkvNCET
 wkKTCutQDz4aYKSmnbJfeFvFDk70pkjEjEC+08m1u8m0yPACKdfXfxYEwAgysVoJS/ti
 M+aX53to+xFS6cd5hRwXemEjQVqfBTFWTyfoKWReM2weV2/YRW+bWhjK8AEgP0XHv32F
 kyCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FGojKB1MhBg8jwsgkZLRwblMIZjIzT+Djmo8uocQA0s=;
 b=pEJQb4I5V3oFhWnOzN/7LcBgrPLokC84J8h+OJDdAYRBA32LfEw6eUdSezgYc75C3T
 VbJGK/4yRzCHW/QE1BZ5aRhZq3vKtrgObmuLgL608ptktFR78fURdJbM25rD2innPiUP
 jAKH/iWY0jgD3wzBrJreMkkW+0MHTXjC7B4vquHDJcWCu71nAgRNUMsy8yKHFQ2Yfb9/
 o9EKS8QYv6zP7FXtc9VNp0vVVspjKgbQB8unqgJQA0otTc2N0v2VI36whq7YR2wD1JXQ
 GnfTkCV/b7HJqF3PW0Rspd9efE9GKs/q9Ql7fS+3zXnkYB2X+rnJlLkI/8K+9Vm5EDUU
 oc/A==
X-Gm-Message-State: AOAM533Czwmq+YeQ5/FWGaIxpcRTzP4Mbrn3CIVS2pCRAJmTPtueLp8x
 rr80gjLBmt0e1soYe91xrqVjcA==
X-Google-Smtp-Source: ABdhPJzA9d6UmJGva4HEhEDBMpYDUjSCgqWDBUjgLzsgHl21ka6z+5wGyexN4DDTKmSsrlw++KxFIA==
X-Received: by 2002:a05:6a00:1801:b0:44c:aab8:a5ba with SMTP id
 y1-20020a056a00180100b0044caab8a5bamr2999357pfa.32.1633541017930; 
 Wed, 06 Oct 2021 10:23:37 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id w7sm21606929pfj.189.2021.10.06.10.23.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 10:23:37 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: laurent@vivier.eu, alex.bennee@linaro.org, qemu-riscv@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v4 35/41] target/riscv: Make riscv_cpu_tlb_fill sysemu only
Date: Wed,  6 Oct 2021 10:23:01 -0700
Message-Id: <20211006172307.780893-36-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211006172307.780893-1-richard.henderson@linaro.org>
References: <20211006172307.780893-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
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
X-List-Received-Date: Wed, 06 Oct 2021 17:23:41 -0000

The fallback code in cpu_loop_exit_sigsegv is sufficient
for riscv linux-user.

Remove the code from cpu_loop that raised SIGSEGV.

Cc: qemu-riscv@nongnu.org
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
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


