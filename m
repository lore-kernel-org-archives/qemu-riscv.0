Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mLoTw-0004Ut-J8
	for mharc-qemu-riscv@gnu.org; Thu, 02 Sep 2021 11:18:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mLoTu-0004ON-Jq; Thu, 02 Sep 2021 11:18:22 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:33542)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mLoTs-0002UP-Ry; Thu, 02 Sep 2021 11:18:22 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 192-20020a1c04c9000000b002f7a4ab0a49so1347978wme.0; 
 Thu, 02 Sep 2021 08:18:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fcD3NEKxqm51zeSb+lOjnaiMKTAZvQ5t+y/MQ7dqNn4=;
 b=SoWG2/wQj0ymZnxrkfnJDZKSuaHnBEMFz8bj97s4TV8NBQ32xc7+kcPUd2yLDhsC5w
 CegLWLfFZOULB2qsUNRjw+d2r+k3oF5emn6c+qVl/cYK5dAaqAfGfOr63WsjWUXmblZe
 8lAXQg76gUsp7/QeheJxgFIDlfA3lzhHP8vaadbZZy65HaXI0jSTTilO+xsyM0ObpCaI
 1WZYFfdRQSUI+DQiDYLuB3JRb6b+9HRuSpiCvCksshLQ9/SAHDt+4b2ts7wdAmx7LI/b
 aXd8JGK6rh9NXMW4PAkUxBdyjcCdcZFrQRWxuxxsnQZyyVx1N6Bq3sj1VDFaA8/6sewn
 fSIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=fcD3NEKxqm51zeSb+lOjnaiMKTAZvQ5t+y/MQ7dqNn4=;
 b=PR/kcATL37xceFaYpeWdMX0bV06UjWoivuby1eNCoyA+OzT184o0JUwfkol3dmChRO
 mESxFykGuywU6GgJa9lCOrYCI1XpHOaTmOvkgunpUcBCVkxtQUi6ZDA1avBNdLGs/Dk5
 Jyg4B12WO+0F5cg3r0XxgWAZN0Z/h8EIkArdHUtDSQrUv5jUwFewbG++B+2n+7ENX4lr
 K1UebJmW9+WvMbeBKRSVRXNhpE+fCvABHKkbaxfmqkgSTEV6EDHRGFSJ0APi/bEBJh6r
 3tURrafYHqlG2xoqcPido8HoMxH+yfpcpqlsR0rRoKBK6iSC507lQ9fNSI6pxeLOGkCr
 VUDw==
X-Gm-Message-State: AOAM533JGkor3kRJeIfIsnyyl7fb9KPkwk1w0Hid0QyRYz44Qwt30ri1
 icmsgsN1sy/KgMR5Nj7tBHlliOHiIcc=
X-Google-Smtp-Source: ABdhPJyMdX6G1vQy+2o7TKZglcvYLmKGkf97DRaIkpPbJyZVsKwfU5KX+Ng4s35R1vCWNozyEXOtYA==
X-Received: by 2002:a7b:c94c:: with SMTP id i12mr3769142wml.111.1630595897048; 
 Thu, 02 Sep 2021 08:18:17 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 i68sm2187724wri.26.2021.09.02.08.18.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Sep 2021 08:18:16 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-arm@nongnu.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Warner Losh <imp@bsdimp.com>, Michael Rolnik <mrolnik@gmail.com>,
 Stafford Horne <shorne@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Bin Meng <bin.meng@windriver.com>, Chris Wulff <crwulff@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 David Gibson <david@gibson.dropbear.id.au>,
 Kyle Evans <kevans@freebsd.org>, Peter Maydell <peter.maydell@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Eduardo Habkost <ehabkost@redhat.com>, Marek Vasut <marex@denx.de>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Greg Kurz <groug@kaod.org>, qemu-riscv@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-ppc@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH 11/24] target/i386: Restrict cpu_exec_interrupt() handler to
 sysemu
Date: Thu,  2 Sep 2021 17:17:02 +0200
Message-Id: <20210902151715.383678-12-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210902151715.383678-1-f4bug@amsat.org>
References: <20210902151715.383678-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Thu, 02 Sep 2021 15:18:23 -0000

Restrict cpu_exec_interrupt() and its callees to sysemu.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/i386/tcg/helper-tcg.h |  2 ++
 target/i386/tcg/seg_helper.c | 10 ++--------
 target/i386/tcg/tcg-cpu.c    |  2 +-
 3 files changed, 5 insertions(+), 9 deletions(-)

diff --git a/target/i386/tcg/helper-tcg.h b/target/i386/tcg/helper-tcg.h
index 2510cc244e9..60ca09e95eb 100644
--- a/target/i386/tcg/helper-tcg.h
+++ b/target/i386/tcg/helper-tcg.h
@@ -38,7 +38,9 @@ QEMU_BUILD_BUG_ON(TCG_PHYS_ADDR_BITS > TARGET_PHYS_ADDR_SPACE_BITS);
  * @cpu: vCPU the interrupt is to be handled by.
  */
 void x86_cpu_do_interrupt(CPUState *cpu);
+#ifndef CONFIG_USER_ONLY
 bool x86_cpu_exec_interrupt(CPUState *cpu, int int_req);
+#endif
 
 /* helper.c */
 bool x86_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
diff --git a/target/i386/tcg/seg_helper.c b/target/i386/tcg/seg_helper.c
index dee7bef68c6..13c6e6ee62e 100644
--- a/target/i386/tcg/seg_helper.c
+++ b/target/i386/tcg/seg_helper.c
@@ -1110,6 +1110,7 @@ void do_interrupt_x86_hardirq(CPUX86State *env, int intno, int is_hw)
     do_interrupt_all(env_archcpu(env), intno, 0, 0, 0, is_hw);
 }
 
+#ifndef CONFIG_USER_ONLY
 bool x86_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
 {
     X86CPU *cpu = X86_CPU(cs);
@@ -1125,23 +1126,17 @@ bool x86_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
      * This is required to make icount-driven execution deterministic.
      */
     switch (interrupt_request) {
-#if !defined(CONFIG_USER_ONLY)
     case CPU_INTERRUPT_POLL:
         cs->interrupt_request &= ~CPU_INTERRUPT_POLL;
         apic_poll_irq(cpu->apic_state);
         break;
-#endif
     case CPU_INTERRUPT_SIPI:
         do_cpu_sipi(cpu);
         break;
     case CPU_INTERRUPT_SMI:
         cpu_svm_check_intercept_param(env, SVM_EXIT_SMI, 0, 0);
         cs->interrupt_request &= ~CPU_INTERRUPT_SMI;
-#ifdef CONFIG_USER_ONLY
-        cpu_abort(CPU(cpu), "SMI interrupt: cannot enter SMM in user-mode");
-#else
         do_smm_enter(cpu);
-#endif /* CONFIG_USER_ONLY */
         break;
     case CPU_INTERRUPT_NMI:
         cpu_svm_check_intercept_param(env, SVM_EXIT_NMI, 0, 0);
@@ -1162,7 +1157,6 @@ bool x86_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
                       "Servicing hardware INT=0x%02x\n", intno);
         do_interrupt_x86_hardirq(env, intno, 1);
         break;
-#if !defined(CONFIG_USER_ONLY)
     case CPU_INTERRUPT_VIRQ:
         /* FIXME: this should respect TPR */
         cpu_svm_check_intercept_param(env, SVM_EXIT_VINTR, 0, 0);
@@ -1173,12 +1167,12 @@ bool x86_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
         do_interrupt_x86_hardirq(env, intno, 1);
         cs->interrupt_request &= ~CPU_INTERRUPT_VIRQ;
         break;
-#endif
     }
 
     /* Ensure that no TB jump will be modified as the program flow was changed.  */
     return true;
 }
+#endif /* CONFIG_USER_ONLY */
 
 void helper_lldt(CPUX86State *env, int selector)
 {
diff --git a/target/i386/tcg/tcg-cpu.c b/target/i386/tcg/tcg-cpu.c
index dce800a8953..fd86daf93d2 100644
--- a/target/i386/tcg/tcg-cpu.c
+++ b/target/i386/tcg/tcg-cpu.c
@@ -72,12 +72,12 @@ static const struct TCGCPUOps x86_tcg_ops = {
     .synchronize_from_tb = x86_cpu_synchronize_from_tb,
     .cpu_exec_enter = x86_cpu_exec_enter,
     .cpu_exec_exit = x86_cpu_exec_exit,
-    .cpu_exec_interrupt = x86_cpu_exec_interrupt,
     .tlb_fill = x86_cpu_tlb_fill,
 #ifdef CONFIG_USER_ONLY
     .fake_user_exception = x86_cpu_do_interrupt,
 #else
     .do_interrupt = x86_cpu_do_interrupt,
+    .cpu_exec_interrupt = x86_cpu_exec_interrupt,
     .debug_excp_handler = breakpoint_handler,
     .debug_check_breakpoint = x86_debug_check_breakpoint,
 #endif /* !CONFIG_USER_ONLY */
-- 
2.31.1


