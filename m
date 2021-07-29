Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1m8uCY-0004Hn-Rn
	for mharc-qemu-riscv@gnu.org; Wed, 28 Jul 2021 20:47:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m8uCW-00049V-7C
 for qemu-riscv@nongnu.org; Wed, 28 Jul 2021 20:47:04 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:44991)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m8uCU-0002TF-C1
 for qemu-riscv@nongnu.org; Wed, 28 Jul 2021 20:47:03 -0400
Received: by mail-pl1-x62d.google.com with SMTP id q2so4834552plr.11
 for <qemu-riscv@nongnu.org>; Wed, 28 Jul 2021 17:47:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=79/BDVQB6iIHA8qtbmo8Z058Jh2Dn0Ccb3iPyejC9bY=;
 b=tEWbgDWR8eofMFVmZhKK3SuV9PmAn+At4HUIlJK5fP3xg4nQfkPr4riek11e1Hjao5
 s45wbaPpnUjcXmspC3fqOr6tZ5GWUFo0wqIGjH7vCUwgqL1QXCfo+Rhed51Nk2cZmUmn
 0w+gEgq3+Dssn2lDedmB6anQ4JZBoSvryn4wL432NOOfAOFVG40RuKjwJeULji3SYFhF
 0HRvYQJOT/Mss0Puscyk61SHxtz9lCzwMMIPaZVUtajVajCxop+G+BRqfFSkVyBrlj2W
 ufBBhXok/frSEpTzgJMjGoSx4dUebhka/Ey30tzgTtiTk/XPhIugaGiAeedcCYFagAqx
 36Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=79/BDVQB6iIHA8qtbmo8Z058Jh2Dn0Ccb3iPyejC9bY=;
 b=Aqfi1HdMpBoUchpluBoFaQtOhINaY0ewebup0gAK7WNWNjjPvgMnia1iCbcLteX48i
 PVQhARtAGr2lbkzqMOYzUkPtfjtha3YcSdMTpDsDgfR4WvKIk9iJ/eG6BTMlyPHrCQpb
 XAMVHjyuc4nguZGQPIH7cPOWFbEd3Pgxm+xmOvVmza8rP9EuQ3uGeTNjHrn250MlJZiZ
 vI08L1bOGDRkrsit8OLThW8WraS9bsI41QgzIRrE21QO7LLyW5U4dM9KQXQATIykt3SK
 vkx8G+nL4fIqNT8nppbRAuJ3mC4FJhTol8t5Wt5pjPUKnXCgY7eFZXkXGn1OzRa6u0IB
 NvTg==
X-Gm-Message-State: AOAM5323JtN/n+oFsq2XxUBSeZ6xt3HxWk07lfLkp5ic4KuYjSW7p33i
 SNXPvKuxHL5+ITygSdiuSkz4h8hQovxHsg==
X-Google-Smtp-Source: ABdhPJxbGs+Mu7JashMQqHSIvRzonhn7Ck24o1FmEAWrBd16W621rj/dDLtKmzf0oNxSnlvjCZY/6A==
X-Received: by 2002:a17:902:a9c7:b029:12b:349:b318 with SMTP id
 b7-20020a170902a9c7b029012b0349b318mr2132641plr.13.1627519620840; 
 Wed, 28 Jul 2021 17:47:00 -0700 (PDT)
Received: from cloudburst.home
 (2603-800c-3202-ffa7-dcaa-9e71-a2b2-2604.res6.spectrum.com.
 [2603:800c:3202:ffa7:dcaa:9e71:a2b2:2604])
 by smtp.gmail.com with ESMTPSA id t205sm1305005pfc.32.2021.07.28.17.46.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jul 2021 17:47:00 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org
Subject: [PATCH for-6.2 09/43] target/riscv: Implement do_unaligned_access for
 user-only
Date: Wed, 28 Jul 2021 14:46:13 -1000
Message-Id: <20210729004647.282017-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210729004647.282017-1-richard.henderson@linaro.org>
References: <20210729004647.282017-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
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
X-List-Received-Date: Thu, 29 Jul 2021 00:47:04 -0000

Cc: qemu-riscv@nongnu.org
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/riscv/cpu_loop.c | 7 +++++++
 target/riscv/cpu.c          | 2 +-
 target/riscv/cpu_helper.c   | 8 +++++++-
 3 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/linux-user/riscv/cpu_loop.c b/linux-user/riscv/cpu_loop.c
index 74a9628dc9..0428140d86 100644
--- a/linux-user/riscv/cpu_loop.c
+++ b/linux-user/riscv/cpu_loop.c
@@ -92,6 +92,13 @@ void cpu_loop(CPURISCVState *env)
             sigcode = TARGET_SEGV_MAPERR;
             sigaddr = env->badaddr;
             break;
+        case RISCV_EXCP_INST_ADDR_MIS:
+        case RISCV_EXCP_LOAD_ADDR_MIS:
+        case RISCV_EXCP_STORE_AMO_ADDR_MIS:
+            signum = TARGET_SIGBUS;
+            sigcode = TARGET_BUS_ADRALN;
+            sigaddr = env->badaddr;
+            break;
         case RISCV_EXCP_SEMIHOST:
             env->gpr[xA0] = do_common_semihosting(cs);
             env->pc += 4;
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 991a6bb760..591d17e62d 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -644,11 +644,11 @@ static const struct TCGCPUOps riscv_tcg_ops = {
     .synchronize_from_tb = riscv_cpu_synchronize_from_tb,
     .cpu_exec_interrupt = riscv_cpu_exec_interrupt,
     .tlb_fill = riscv_cpu_tlb_fill,
+    .do_unaligned_access = riscv_cpu_do_unaligned_access,
 
 #ifndef CONFIG_USER_ONLY
     .do_interrupt = riscv_cpu_do_interrupt,
     .do_transaction_failed = riscv_cpu_do_transaction_failed,
-    .do_unaligned_access = riscv_cpu_do_unaligned_access,
 #endif /* !CONFIG_USER_ONLY */
 };
 
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 968cb8046f..a440b2834f 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -727,6 +727,7 @@ void riscv_cpu_do_transaction_failed(CPUState *cs, hwaddr physaddr,
                             riscv_cpu_two_stage_lookup(mmu_idx);
     riscv_raise_exception(&cpu->env, cs->exception_index, retaddr);
 }
+#endif /* !CONFIG_USER_ONLY */
 
 void riscv_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
                                    MMUAccessType access_type, int mmu_idx,
@@ -734,6 +735,7 @@ void riscv_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
 {
     RISCVCPU *cpu = RISCV_CPU(cs);
     CPURISCVState *env = &cpu->env;
+
     switch (access_type) {
     case MMU_INST_FETCH:
         cs->exception_index = RISCV_EXCP_INST_ADDR_MIS;
@@ -748,11 +750,15 @@ void riscv_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
         g_assert_not_reached();
     }
     env->badaddr = addr;
+
+#ifdef CONFIG_USER_ONLY
+    cpu_loop_exit_restore(cs, retaddr);
+#else
     env->two_stage_lookup = riscv_cpu_virt_enabled(env) ||
                             riscv_cpu_two_stage_lookup(mmu_idx);
     riscv_raise_exception(env, cs->exception_index, retaddr);
+#endif
 }
-#endif /* !CONFIG_USER_ONLY */
 
 bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
                         MMUAccessType access_type, int mmu_idx,
-- 
2.25.1


