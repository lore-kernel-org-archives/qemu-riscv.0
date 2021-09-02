Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mLoTs-0004Gm-3k
	for mharc-qemu-riscv@gnu.org; Thu, 02 Sep 2021 11:18:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mLoTn-00045o-Kl; Thu, 02 Sep 2021 11:18:16 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:38698)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mLoTm-0002PQ-2u; Thu, 02 Sep 2021 11:18:15 -0400
Received: by mail-wr1-x42c.google.com with SMTP id u16so3532988wrn.5;
 Thu, 02 Sep 2021 08:18:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dnN+i5SQHDPtQiKzhJew7CvpvP6BIGZ5S+AtYPNrOLE=;
 b=kEJNGq5+y52RmEfLyPaM+2EQaUecD+RjYIrHyechfU3C7P/zoat/9C5KMK7hqyYhlE
 Qf0gb0A3fGNsIRA67U6lTpDEnkmFOP0G0V9hz7keKGq/seG4Wa5ZEtP4FuljfNG3VVeV
 po+eZtnaY4t3DCqe8fnKdGkFuuVcaVVin0rec0ZTKFJDfp38Je7jBzx8cEWJFkBEc79u
 JP1uyH5yZ2kerjkXeyX8e6jsE2906mTlm8n7J1ulmM0acE/saR7w0xaKA0CvsHN6Sej1
 DzLDOb9wCHXwCkKrkYaw3ZRf0e3LbKWKUxpqfo+Z98JumEk1RSOfYIShMXGz3X0nHIlt
 Oc3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=dnN+i5SQHDPtQiKzhJew7CvpvP6BIGZ5S+AtYPNrOLE=;
 b=ZzRJACBh5oEN9qtzQiiHCbemmS2KhacPKD9rw8SWnOLYEE27oTm0NUtMa0JiG4HRbB
 xvMcXvKMIyfRUaTmWdfIiJIAZeRax6r8ISDl8jws6eLLEdEfO+iWIEGPJHM/F+j5hUnG
 1S5SgsIBv1lY77Nl6EST1BCNBj7wum/xjUWdfRLewFt7Aj1OIM9vMJvpEjrmCplH6DdS
 s3DRqAxcNcr3PGWWJZ1NfR8CgCzyAfjESeFWNeIfeWzMCaonm0/WKMCH9Hg7IxUpfIbr
 TlfIZYSsEDMasZcYwJNrBXwe7BEAAn+P8yK39Oo62tKj9kGb4LmWhq6U8OZ00PPdYRWW
 R0UA==
X-Gm-Message-State: AOAM530xWmwjDrwJ0rS2xRm6Tpp5swSULT5GWxWGtn1UZut4EI1ypYra
 IB3BwxJfhN0IdmfR3qw7F3f2Q63vdIg=
X-Google-Smtp-Source: ABdhPJxYIPxCclNCrRQ4GMcW40Oabc2JxsPW4A35Y6zIiI6b61jRK9z2oFaq399iRiy0poafmDE7XQ==
X-Received: by 2002:adf:f743:: with SMTP id z3mr4416016wrp.211.1630595891506; 
 Thu, 02 Sep 2021 08:18:11 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 d7sm2103665wrs.39.2021.09.02.08.18.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Sep 2021 08:18:11 -0700 (PDT)
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
Subject: [PATCH 10/24] target/hppa: Restrict cpu_exec_interrupt() handler to
 sysemu
Date: Thu,  2 Sep 2021 17:17:01 +0200
Message-Id: <20210902151715.383678-11-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210902151715.383678-1-f4bug@amsat.org>
References: <20210902151715.383678-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
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
X-List-Received-Date: Thu, 02 Sep 2021 15:18:17 -0000

Restrict cpu_exec_interrupt() and its callees to sysemu.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/hppa/cpu.h        | 4 ++--
 target/hppa/cpu.c        | 2 +-
 target/hppa/int_helper.c | 7 ++-----
 3 files changed, 5 insertions(+), 8 deletions(-)

diff --git a/target/hppa/cpu.h b/target/hppa/cpu.h
index 748270bfa31..7854675b903 100644
--- a/target/hppa/cpu.h
+++ b/target/hppa/cpu.h
@@ -325,13 +325,13 @@ int cpu_hppa_signal_handler(int host_signum, void *pinfo, void *puc);
 hwaddr hppa_cpu_get_phys_page_debug(CPUState *cs, vaddr addr);
 int hppa_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
 int hppa_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
-void hppa_cpu_do_interrupt(CPUState *cpu);
-bool hppa_cpu_exec_interrupt(CPUState *cpu, int int_req);
 void hppa_cpu_dump_state(CPUState *cs, FILE *f, int);
 bool hppa_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
                        MMUAccessType access_type, int mmu_idx,
                        bool probe, uintptr_t retaddr);
 #ifndef CONFIG_USER_ONLY
+void hppa_cpu_do_interrupt(CPUState *cpu);
+bool hppa_cpu_exec_interrupt(CPUState *cpu, int int_req);
 int hppa_get_physical_address(CPUHPPAState *env, vaddr addr, int mmu_idx,
                               int type, hwaddr *pphys, int *pprot);
 extern const MemoryRegionOps hppa_io_eir_ops;
diff --git a/target/hppa/cpu.c b/target/hppa/cpu.c
index 2eace4ee124..e8edd189bfc 100644
--- a/target/hppa/cpu.c
+++ b/target/hppa/cpu.c
@@ -144,10 +144,10 @@ static const struct SysemuCPUOps hppa_sysemu_ops = {
 static const struct TCGCPUOps hppa_tcg_ops = {
     .initialize = hppa_translate_init,
     .synchronize_from_tb = hppa_cpu_synchronize_from_tb,
-    .cpu_exec_interrupt = hppa_cpu_exec_interrupt,
     .tlb_fill = hppa_cpu_tlb_fill,
 
 #ifndef CONFIG_USER_ONLY
+    .cpu_exec_interrupt = hppa_cpu_exec_interrupt,
     .do_interrupt = hppa_cpu_do_interrupt,
     .do_unaligned_access = hppa_cpu_do_unaligned_access,
 #endif /* !CONFIG_USER_ONLY */
diff --git a/target/hppa/int_helper.c b/target/hppa/int_helper.c
index 349495d3610..13073ae2bda 100644
--- a/target/hppa/int_helper.c
+++ b/target/hppa/int_helper.c
@@ -88,7 +88,6 @@ void HELPER(write_eiem)(CPUHPPAState *env, target_ureg val)
     eval_interrupt(env_archcpu(env));
     qemu_mutex_unlock_iothread();
 }
-#endif /* !CONFIG_USER_ONLY */
 
 void hppa_cpu_do_interrupt(CPUState *cs)
 {
@@ -100,7 +99,6 @@ void hppa_cpu_do_interrupt(CPUState *cs)
     uint64_t iasq_f = env->iasq_f;
     uint64_t iasq_b = env->iasq_b;
 
-#ifndef CONFIG_USER_ONLY
     target_ureg old_psw;
 
     /* As documented in pa2.0 -- interruption handling.  */
@@ -187,7 +185,6 @@ void hppa_cpu_do_interrupt(CPUState *cs)
     env->iaoq_b = env->iaoq_f + 4;
     env->iasq_f = 0;
     env->iasq_b = 0;
-#endif
 
     if (qemu_loglevel_mask(CPU_LOG_INT)) {
         static const char * const names[] = {
@@ -248,7 +245,6 @@ void hppa_cpu_do_interrupt(CPUState *cs)
 
 bool hppa_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
 {
-#ifndef CONFIG_USER_ONLY
     HPPACPU *cpu = HPPA_CPU(cs);
     CPUHPPAState *env = &cpu->env;
 
@@ -258,6 +254,7 @@ bool hppa_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
         hppa_cpu_do_interrupt(cs);
         return true;
     }
-#endif
     return false;
 }
+
+#endif /* !CONFIG_USER_ONLY */
-- 
2.31.1


