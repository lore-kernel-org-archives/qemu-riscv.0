Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mLoV5-0005jV-3R
	for mharc-qemu-riscv@gnu.org; Thu, 02 Sep 2021 11:19:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mLoUx-0005bi-0Z; Thu, 02 Sep 2021 11:19:27 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:52978)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mLoUu-0003PZ-Jp; Thu, 02 Sep 2021 11:19:26 -0400
Received: by mail-wm1-x333.google.com with SMTP id e26so1544345wmk.2;
 Thu, 02 Sep 2021 08:19:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=J1dcdIQ9CGWzlsg5Dn15xdm5h+WWHlgv9y5poU7SILU=;
 b=nmHWhKQc4cQ8poiZOsBSVna/+IcTO76/Xgy6htZ11++IGvST+0vsj0Yb7T3Y89mA+Z
 Ffse1o14BVN8xQOzx9UrVrpulHJEIbxJo+VhEDYcG4roPcXCNeWBCGzS0+ZqG2PKRoJp
 re1il8Yv50undaZa04WF33qAcSwcJDW1gW4zjfHLEwJlPNsBllGQR10uHMurMAme+Wu7
 dFOwtQ/73yXO+wgQoWR8acLVbUZadySXnfEB1iUNfHJu/NwOxSSvj+DpSi0d+fLM4F+T
 zGhDfAOOBkk+j/NeBeQhgE/JQ9yMtol8kcN+rCUNSZhAl6Xn0nDC1r6GKNff9D3WAikU
 NnHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=J1dcdIQ9CGWzlsg5Dn15xdm5h+WWHlgv9y5poU7SILU=;
 b=j0Ng61R0R/xJH4II0McuiyKmdzXTXr3wCogmTfXGeYep2J1Cj74z3gQFnsrojJVvmJ
 BzxWRZ2ILD7h56tV0jGfwXh/lYxDL3Y+MA8u7YdAV8n4lyYVIjorKGMudubgoVeFiTvi
 4Odq6+2NpkHNb2Y6W3rMRf112Wu7InYAOSy0mCYZC41QooMCJlUv92NMiP0L2pewrizG
 RLSLZAdzml52t8kgT3qeOHpLRWi91NirjUNC9id8gHqM9eFSxZpRd5LsA5xGhpy98X4x
 AliADis91Figga7xy/nWqmgOJ0v1W4fb4VN5JgUBJK8Zgnzw/G1IEomhaCHf+BAS9Bhu
 Qi4Q==
X-Gm-Message-State: AOAM531yz+JNDJb+6Ttb11ynqFZQbCoWC/vgYMLNb1N+NPRIPzbrMEgv
 LkHVI65duh8pN2uQJoUetcAIXd/zvqI=
X-Google-Smtp-Source: ABdhPJz7sxKzV5VkLGVMCrMgJ5rFnNDYqoRSnoIdz+9dydA+a9qoHCb3bjm9MTLJEtE5jEYVwPeO+g==
X-Received: by 2002:a7b:c5d2:: with SMTP id n18mr3773265wmk.97.1630595962055; 
 Thu, 02 Sep 2021 08:19:22 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 d24sm1844328wmb.35.2021.09.02.08.19.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Sep 2021 08:19:21 -0700 (PDT)
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
Subject: [PATCH 23/24] accel/tcg: Restrict TCGCPUOps::cpu_exec_interrupt() to
 sysemu
Date: Thu,  2 Sep 2021 17:17:14 +0200
Message-Id: <20210902151715.383678-24-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210902151715.383678-1-f4bug@amsat.org>
References: <20210902151715.383678-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x333.google.com
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
X-List-Received-Date: Thu, 02 Sep 2021 15:19:28 -0000

All targets call TCGCPUOps::cpu_exec_interrupt() from sysemu code.
Move its declaration to restrict it to system emulation.
Extend the code guarded and remove the user-mode assertion.
Also restrict the static inlined need_replay_interrupt() method to
avoid a "defined but not used" warning.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/core/tcg-cpu-ops.h |  4 ++--
 accel/tcg/cpu-exec.c          | 13 +++++++------
 2 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/include/hw/core/tcg-cpu-ops.h b/include/hw/core/tcg-cpu-ops.h
index 600f0349659..bbec7760f48 100644
--- a/include/hw/core/tcg-cpu-ops.h
+++ b/include/hw/core/tcg-cpu-ops.h
@@ -35,8 +35,6 @@ struct TCGCPUOps {
     void (*cpu_exec_enter)(CPUState *cpu);
     /** @cpu_exec_exit: Callback for cpu_exec cleanup */
     void (*cpu_exec_exit)(CPUState *cpu);
-    /** @cpu_exec_interrupt: Callback for processing interrupts in cpu_exec */
-    bool (*cpu_exec_interrupt)(CPUState *cpu, int interrupt_request);
     /**
      * @tlb_fill: Handle a softmmu tlb miss or user-only address fault
      *
@@ -68,6 +66,8 @@ struct TCGCPUOps {
     void (*do_interrupt)(CPUState *cpu);
 #endif /* !CONFIG_USER_ONLY || !TARGET_I386 */
 #ifdef CONFIG_SOFTMMU
+    /** @cpu_exec_interrupt: Callback for processing interrupts in cpu_exec */
+    bool (*cpu_exec_interrupt)(CPUState *cpu, int interrupt_request);
     /**
      * @do_transaction_failed: Callback for handling failed memory transactions
      * (ie bus faults or external aborts; not MMU faults)
diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index 5f4836946c1..7a6dd9049f0 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -685,6 +685,7 @@ static inline bool cpu_handle_exception(CPUState *cpu, int *ret)
     return false;
 }
 
+#ifndef CONFIG_USER_ONLY
 /*
  * CPU_INTERRUPT_POLL is a virtual event which gets converted into a
  * "real" interrupt event later. It does not need to be recorded for
@@ -698,12 +699,11 @@ static inline bool need_replay_interrupt(int interrupt_request)
     return true;
 #endif
 }
+#endif /* !CONFIG_USER_ONLY */
 
 static inline bool cpu_handle_interrupt(CPUState *cpu,
                                         TranslationBlock **last_tb)
 {
-    CPUClass *cc = CPU_GET_CLASS(cpu);
-
     /* Clear the interrupt flag now since we're processing
      * cpu->interrupt_request and cpu->exit_request.
      * Ensure zeroing happens before reading cpu->exit_request or
@@ -725,9 +725,7 @@ static inline bool cpu_handle_interrupt(CPUState *cpu,
             qemu_mutex_unlock_iothread();
             return true;
         }
-#if defined(CONFIG_USER_ONLY)
-        g_assert_not_reached();
-#endif
+#if !defined(CONFIG_USER_ONLY)
         if (replay_mode == REPLAY_MODE_PLAY && !replay_has_interrupt()) {
             /* Do nothing */
         } else if (interrupt_request & CPU_INTERRUPT_HALT) {
@@ -756,12 +754,14 @@ static inline bool cpu_handle_interrupt(CPUState *cpu,
             qemu_mutex_unlock_iothread();
             return true;
         }
-#endif
+#endif /* !TARGET_I386 */
         /* The target hook has 3 exit conditions:
            False when the interrupt isn't processed,
            True when it is, and we should restart on a new TB,
            and via longjmp via cpu_loop_exit.  */
         else {
+            CPUClass *cc = CPU_GET_CLASS(cpu);
+
             if (cc->tcg_ops->cpu_exec_interrupt &&
                 cc->tcg_ops->cpu_exec_interrupt(cpu, interrupt_request)) {
                 if (need_replay_interrupt(interrupt_request)) {
@@ -780,6 +780,7 @@ static inline bool cpu_handle_interrupt(CPUState *cpu,
              * reload the 'interrupt_request' value */
             interrupt_request = cpu->interrupt_request;
         }
+#endif /* !CONFIG_USER_ONLY */
         if (interrupt_request & CPU_INTERRUPT_EXITTB) {
             cpu->interrupt_request &= ~CPU_INTERRUPT_EXITTB;
             /* ensure that no TB jump will be modified as
-- 
2.31.1


