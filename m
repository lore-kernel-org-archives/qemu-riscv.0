Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mLoUo-0005Wc-18
	for mharc-qemu-riscv@gnu.org; Thu, 02 Sep 2021 11:19:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mLoUT-0005MD-PG; Thu, 02 Sep 2021 11:19:01 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:33692)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mLoUN-0002uY-Jl; Thu, 02 Sep 2021 11:18:55 -0400
Received: by mail-wr1-x436.google.com with SMTP id b10so3587892wru.0;
 Thu, 02 Sep 2021 08:18:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=13cqWBFlNB/vr07VKws8Wf/EaynvIPSt3qDKZcCeXuc=;
 b=DR/9kbV/tVfJIqCP1z6hn9Su24lAAqqSfbLsxeichAuBJCWbb6zzEJRbxSkaCjgrjU
 lBe63GKOzbizURuEDjOTHZeTn9O0PphS8T666A6nkD8zLBcnnjs1mrzZhJduLakmh9zy
 85ST1wRQyL4CICK29MeT0h2cvS+EPtiKFQb1FsJL7FPsBP4fhVIqHGP8Xd/2dyguYxtZ
 pzbZJkdJEx4lnZyK1o2I/oWFyDxBRK7UjBqYrKU03um7wW1CmEFzb7dWRWaWtp/VQUCS
 o7CAlhMgXA9t4OohgKnMObhmI8FRTyI3DI1ved8VJ8SYPFCemYEw/li1Cja6LEOYSNni
 tl0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=13cqWBFlNB/vr07VKws8Wf/EaynvIPSt3qDKZcCeXuc=;
 b=gsPEehwO5Dpqjeh26gOT+gokQ94rXdnLugeXHvbdpKcXivbU7kxWLx6betrwZllYPd
 8rcDOwsWwymNcQyglzLKiDW0p9gDNevrLonvd9tnJlGv6ZZLSsuQbgBmW5eV5taDL388
 WbZIZuPcYy3rfyfaosNcfmT4zTQrS0yKrHAp8sLJClSFjxgfnXyqAhQ31x+B9Ry/Uq+C
 Ge/m6kVU5Iv+bwsQLj4bLA5Ng6A3jUvxHD5adpvbbzeepVSGaGfkAggXcgzHfFATey0A
 vuDAgy4PUFF69Rs/I1XRYF3HBzUjZCAHlzO6glLg7iCzttX4ykW4EY5D59sILb1HEc6F
 ZvQQ==
X-Gm-Message-State: AOAM5310Vkpkamy6UyHB3IGmgxjKsXziDn1xJrH2+OQ01yRUhYtC/EOf
 erVhPhL3Stky5Z+BROcI1gRXaNrRepM=
X-Google-Smtp-Source: ABdhPJxhc8HhOPDEGEsFKW9abzQtV4rKAI+TEEQLs1Rc/U1Pasux0Q+YgJ0sayfIRcFYW/yyr4LuaQ==
X-Received: by 2002:adf:90c1:: with SMTP id i59mr4412316wri.88.1630595929164; 
 Thu, 02 Sep 2021 08:18:49 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 129sm1893960wmz.26.2021.09.02.08.18.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Sep 2021 08:18:48 -0700 (PDT)
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
Subject: [PATCH 17/24] target/ppc: Restrict cpu_exec_interrupt() handler to
 sysemu
Date: Thu,  2 Sep 2021 17:17:08 +0200
Message-Id: <20210902151715.383678-18-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210902151715.383678-1-f4bug@amsat.org>
References: <20210902151715.383678-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x436.google.com
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
X-List-Received-Date: Thu, 02 Sep 2021 15:19:07 -0000

Restrict cpu_exec_interrupt() and its callees to sysemu.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/ppc/cpu.h         |  4 ++--
 target/ppc/cpu_init.c    |  2 +-
 target/ppc/excp_helper.c | 21 +++------------------
 3 files changed, 6 insertions(+), 21 deletions(-)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index 500205229c0..362e7c4c5c7 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -1254,8 +1254,6 @@ DECLARE_OBJ_CHECKERS(PPCVirtualHypervisor, PPCVirtualHypervisorClass,
                      PPC_VIRTUAL_HYPERVISOR, TYPE_PPC_VIRTUAL_HYPERVISOR)
 #endif /* CONFIG_USER_ONLY */
 
-void ppc_cpu_do_interrupt(CPUState *cpu);
-bool ppc_cpu_exec_interrupt(CPUState *cpu, int int_req);
 void ppc_cpu_dump_state(CPUState *cpu, FILE *f, int flags);
 hwaddr ppc_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
 int ppc_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
@@ -1271,6 +1269,8 @@ int ppc64_cpu_write_elf64_note(WriteCoreDumpFunction f, CPUState *cs,
 int ppc32_cpu_write_elf32_note(WriteCoreDumpFunction f, CPUState *cs,
                                int cpuid, void *opaque);
 #ifndef CONFIG_USER_ONLY
+void ppc_cpu_do_interrupt(CPUState *cpu);
+bool ppc_cpu_exec_interrupt(CPUState *cpu, int int_req);
 void ppc_cpu_do_system_reset(CPUState *cs);
 void ppc_cpu_do_fwnmi_machine_check(CPUState *cs, target_ulong vector);
 extern const VMStateDescription vmstate_ppc_cpu;
diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index ad7abc6041a..6aad01d1d3a 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -9014,10 +9014,10 @@ static const struct SysemuCPUOps ppc_sysemu_ops = {
 
 static const struct TCGCPUOps ppc_tcg_ops = {
   .initialize = ppc_translate_init,
-  .cpu_exec_interrupt = ppc_cpu_exec_interrupt,
   .tlb_fill = ppc_cpu_tlb_fill,
 
 #ifndef CONFIG_USER_ONLY
+  .cpu_exec_interrupt = ppc_cpu_exec_interrupt,
   .do_interrupt = ppc_cpu_do_interrupt,
   .cpu_exec_enter = ppc_cpu_exec_enter,
   .cpu_exec_exit = ppc_cpu_exec_exit,
diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index 7b6ac16eef7..d7e32ee107e 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -40,24 +40,8 @@
 
 /*****************************************************************************/
 /* Exception processing */
-#if defined(CONFIG_USER_ONLY)
-void ppc_cpu_do_interrupt(CPUState *cs)
-{
-    PowerPCCPU *cpu = POWERPC_CPU(cs);
-    CPUPPCState *env = &cpu->env;
+#if !defined(CONFIG_USER_ONLY)
 
-    cs->exception_index = POWERPC_EXCP_NONE;
-    env->error_code = 0;
-}
-
-static void ppc_hw_interrupt(CPUPPCState *env)
-{
-    CPUState *cs = env_cpu(env);
-
-    cs->exception_index = POWERPC_EXCP_NONE;
-    env->error_code = 0;
-}
-#else /* defined(CONFIG_USER_ONLY) */
 static inline void dump_syscall(CPUPPCState *env)
 {
     qemu_log_mask(CPU_LOG_INT, "syscall r0=%016" PRIx64
@@ -1113,7 +1097,6 @@ void ppc_cpu_do_fwnmi_machine_check(CPUState *cs, target_ulong vector)
 
     powerpc_set_excp_state(cpu, vector, msr);
 }
-#endif /* !CONFIG_USER_ONLY */
 
 bool ppc_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
 {
@@ -1130,6 +1113,8 @@ bool ppc_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
     return false;
 }
 
+#endif /* !CONFIG_USER_ONLY */
+
 #if defined(DEBUG_OP)
 static void cpu_dump_rfi(target_ulong RA, target_ulong msr)
 {
-- 
2.31.1


