Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mLoU1-0004j2-FG
	for mharc-qemu-riscv@gnu.org; Thu, 02 Sep 2021 11:18:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mLoTz-0004bF-6R; Thu, 02 Sep 2021 11:18:27 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:34778)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mLoTx-0002Yu-Jt; Thu, 02 Sep 2021 11:18:26 -0400
Received: by mail-wr1-x432.google.com with SMTP id m9so3551893wrb.1;
 Thu, 02 Sep 2021 08:18:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4y+tkZcCyCTYKE/BQL6gLFY/AtMrXXFDFTBuQLK5lBI=;
 b=daEpV700sPQx6D7ryRZBP74aFbuEp5Js2zD0dQ6602tSFDOJ9VJmaX+77RTmHv6k/J
 HiEH/VnaeEvu8um+0NqP4S4h5G/LWlhmiI5Xu89MwFWSlEjGiDEfJg4RTVSUcl5YnO34
 cAL+34Kraos5RHmxZjhCfqRiEzoQrYOPikwiwRGOAhnTeuoxNXxd8LR/sq/ciWCs912S
 orFQiZakKfSAwpHWKxxAKmDY99BEV+wU3KARM00Nw91239kaUr1Gbx+5xfGT08R+P8qA
 sC0jDjQ/vgqnwJklRFtU9gVQFWaF3B+8XRWB3reIJPMznW+0iDiOdXyHXVRNT6zAUSxz
 bd3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=4y+tkZcCyCTYKE/BQL6gLFY/AtMrXXFDFTBuQLK5lBI=;
 b=noeAMhID4l+p5x+DMl9xRNAhFXMLLTicFY/70Atofhf3A6Trctpgh+I7dTcxfx7EGN
 jgMh4DC+tITtNRl8/08ldsRBwmsOwYk9uUQjf2Ys10MH5sTm5BK7vr8aJ8Ee6byVTc2y
 7gPDBk8GtrkhWri1M8J9lBOXhfFUchiZj8bOVyKh1FSMKIsg8JZfvhLrpnUPQuV/L3tH
 PlfLXa8feTCJ5BZAJrCZZrY8QxzCfY4UjDHfoB69nJ1dXIfCjJi5rqzG+M/+lZ4JIpJP
 5AgYZXzkUORTbadMnoN+RADGE4meAj9ACi6b+4ad5mqI4DMjmexcy+wBtYed+ZPZpOkr
 GP9A==
X-Gm-Message-State: AOAM533W9V6A+S2JZxMajctdAHTurjsd+0vRqBrbxy1QvW31PYcJRaW5
 t56wpDtMsIyuUqo2bn/NN15FkdUaY30=
X-Google-Smtp-Source: ABdhPJzuKSbbDi1oS+m6Wcn8WtiPfO0pSz9kRPIqlSgYw2A+GA7Idk0l89rGksaS3zRtHoQhwYvKXA==
X-Received: by 2002:a5d:464c:: with SMTP id j12mr4291179wrs.27.1630595902416; 
 Thu, 02 Sep 2021 08:18:22 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 c15sm1848337wmr.8.2021.09.02.08.18.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Sep 2021 08:18:21 -0700 (PDT)
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
Subject: [PATCH 12/24] target/m68k: Restrict cpu_exec_interrupt() handler to
 sysemu
Date: Thu,  2 Sep 2021 17:17:03 +0200
Message-Id: <20210902151715.383678-13-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210902151715.383678-1-f4bug@amsat.org>
References: <20210902151715.383678-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x432.google.com
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
X-List-Received-Date: Thu, 02 Sep 2021 15:18:28 -0000

Restrict cpu_exec_interrupt() and its callees to sysemu.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/m68k/cpu.h       |  2 ++
 target/m68k/cpu.c       |  2 +-
 target/m68k/op_helper.c | 16 +++-------------
 3 files changed, 6 insertions(+), 14 deletions(-)

diff --git a/target/m68k/cpu.h b/target/m68k/cpu.h
index 997d588911c..550eb028b6e 100644
--- a/target/m68k/cpu.h
+++ b/target/m68k/cpu.h
@@ -166,8 +166,10 @@ struct M68kCPU {
 };
 
 
+#ifndef CONFIG_USER_ONLY
 void m68k_cpu_do_interrupt(CPUState *cpu);
 bool m68k_cpu_exec_interrupt(CPUState *cpu, int int_req);
+#endif /* !CONFIG_USER_ONLY */
 void m68k_cpu_dump_state(CPUState *cpu, FILE *f, int flags);
 hwaddr m68k_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
 int m68k_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
diff --git a/target/m68k/cpu.c b/target/m68k/cpu.c
index 72de6e97262..66d22d11895 100644
--- a/target/m68k/cpu.c
+++ b/target/m68k/cpu.c
@@ -515,10 +515,10 @@ static const struct SysemuCPUOps m68k_sysemu_ops = {
 
 static const struct TCGCPUOps m68k_tcg_ops = {
     .initialize = m68k_tcg_init,
-    .cpu_exec_interrupt = m68k_cpu_exec_interrupt,
     .tlb_fill = m68k_cpu_tlb_fill,
 
 #ifndef CONFIG_USER_ONLY
+    .cpu_exec_interrupt = m68k_cpu_exec_interrupt,
     .do_interrupt = m68k_cpu_do_interrupt,
     .do_transaction_failed = m68k_cpu_transaction_failed,
 #endif /* !CONFIG_USER_ONLY */
diff --git a/target/m68k/op_helper.c b/target/m68k/op_helper.c
index d006d1cb3ea..5d624838ae6 100644
--- a/target/m68k/op_helper.c
+++ b/target/m68k/op_helper.c
@@ -24,18 +24,7 @@
 #include "semihosting/semihost.h"
 #include "tcg/tcg.h"
 
-#if defined(CONFIG_USER_ONLY)
-
-void m68k_cpu_do_interrupt(CPUState *cs)
-{
-    cs->exception_index = -1;
-}
-
-static inline void do_interrupt_m68k_hardirq(CPUM68KState *env)
-{
-}
-
-#else
+#if !defined(CONFIG_USER_ONLY)
 
 static void cf_rte(CPUM68KState *env)
 {
@@ -516,7 +505,6 @@ void m68k_cpu_transaction_failed(CPUState *cs, hwaddr physaddr, vaddr addr,
         cpu_loop_exit(cs);
     }
 }
-#endif
 
 bool m68k_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
 {
@@ -538,6 +526,8 @@ bool m68k_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
     return false;
 }
 
+#endif /* !CONFIG_USER_ONLY */
+
 static void raise_exception_ra(CPUM68KState *env, int tt, uintptr_t raddr)
 {
     CPUState *cs = env_cpu(env);
-- 
2.31.1


