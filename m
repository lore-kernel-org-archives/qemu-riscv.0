Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mLoV6-0005nv-DE
	for mharc-qemu-riscv@gnu.org; Thu, 02 Sep 2021 11:19:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mLoUa-0005MW-Fu; Thu, 02 Sep 2021 11:19:05 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:35528)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mLoUT-0002z7-KI; Thu, 02 Sep 2021 11:19:01 -0400
Received: by mail-wr1-x42f.google.com with SMTP id i6so3540906wrv.2;
 Thu, 02 Sep 2021 08:18:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NjpYoE1+3YFnM0F4QDL6LEotiNFdmLxhe/DUiCLHaJM=;
 b=OE2IJqZijkuAu/dtbUlP6NrY1EsKCVCfz038HJYOXGJ8EDulteUPVw6555LSquq8R6
 UyBKsyS8TbxCG0tsSFJvYB9ADJXpRn70/xtWLjcmzdXfF7x/a5hVHd20QXgWS8llqbvf
 RQfWoj9R/B+AWCxkrIr1BZvlzLejShTHQ+YSmEdC+u9eoEHoOc8rShzTgKV2UztPduyH
 vKYYjTOxemAwBu9hCc1RW8h+NqDRzfy3q8VqTvyxqN1YiXtUBK/Y/vT5Cs4ZwKZBSpGD
 jfyBQyX4dtNCXA6loITIiM3OL24aV4kpGFstbBz9jIIxjgf5jpPsl389IKvPiDBZC5i3
 TFpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=NjpYoE1+3YFnM0F4QDL6LEotiNFdmLxhe/DUiCLHaJM=;
 b=fKQ1RrEmI2fwvHpw12pDjJurepR+yY2J0sNkDhi9Swpeld0A81cKofF/6odCK5OZrw
 fZkbziKN0J5yx+BpNW82RFVXbNFmTyYr4wRwCaaE3SdvRv69zCDzuZWSqhYy1jMFBCvn
 U+wbaIeKYz9bpDrSUY7sn3ESeKhdtHVA+iv+YsY4/OcHcLwY4U7u9jnoxA1CAFVbS0rj
 Q1lpTkYJ+AkcvhDlX+XQNkt24ojJzLs/LFeNtrnRNGcaaoJ8HQLTNG6qjE+BS2ZEbdUk
 X0k87NE1BosIio9Gz+XZT1iQyI0IHZfa9IQJUniAu3ip7lDY6GI/2eZnNP+cZQ90SHAN
 rk6g==
X-Gm-Message-State: AOAM531V9d0a+EZTsqAkFuAeQo4T7gxi2D3APtS4Z/8bbt9Poo5K+FJg
 rGR/t3G1wDxlcIGkqDkMhXHfyk8pKNg=
X-Google-Smtp-Source: ABdhPJxHGkPXjKBYhlTr35f7CR7AMmKVY8Al83O7nq6m8XUpAKzCtMrlY8MqhAltIqo0aoW6RI9a5A==
X-Received: by 2002:a5d:638b:: with SMTP id p11mr4313614wru.257.1630595934445; 
 Thu, 02 Sep 2021 08:18:54 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 t5sm2171265wra.95.2021.09.02.08.18.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Sep 2021 08:18:53 -0700 (PDT)
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
Subject: [PATCH 18/24] target/riscv: Restrict cpu_exec_interrupt() handler to
 sysemu
Date: Thu,  2 Sep 2021 17:17:09 +0200
Message-Id: <20210902151715.383678-19-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210902151715.383678-1-f4bug@amsat.org>
References: <20210902151715.383678-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42f.google.com
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
 target/riscv/cpu.h        | 2 +-
 target/riscv/cpu.c        | 2 +-
 target/riscv/cpu_helper.c | 5 -----
 3 files changed, 2 insertions(+), 7 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index bf1c899c00b..e735e53e26c 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -334,7 +334,6 @@ int riscv_cpu_write_elf32_note(WriteCoreDumpFunction f, CPUState *cs,
                                int cpuid, void *opaque);
 int riscv_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
 int riscv_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
-bool riscv_cpu_exec_interrupt(CPUState *cs, int interrupt_request);
 bool riscv_cpu_fp_enabled(CPURISCVState *env);
 bool riscv_cpu_virt_enabled(CPURISCVState *env);
 void riscv_cpu_set_virt_enabled(CPURISCVState *env, bool enable);
@@ -362,6 +361,7 @@ void riscv_cpu_list(void);
 #define cpu_mmu_index riscv_cpu_mmu_index
 
 #ifndef CONFIG_USER_ONLY
+bool riscv_cpu_exec_interrupt(CPUState *cs, int interrupt_request);
 void riscv_cpu_swap_hypervisor_regs(CPURISCVState *env);
 int riscv_cpu_claim_interrupts(RISCVCPU *cpu, uint32_t interrupts);
 uint32_t riscv_cpu_update_mip(RISCVCPU *cpu, uint32_t mask, uint32_t value);
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 1a2b03d579c..13575c14085 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -644,10 +644,10 @@ static const struct SysemuCPUOps riscv_sysemu_ops = {
 static const struct TCGCPUOps riscv_tcg_ops = {
     .initialize = riscv_translate_init,
     .synchronize_from_tb = riscv_cpu_synchronize_from_tb,
-    .cpu_exec_interrupt = riscv_cpu_exec_interrupt,
     .tlb_fill = riscv_cpu_tlb_fill,
 
 #ifndef CONFIG_USER_ONLY
+    .cpu_exec_interrupt = riscv_cpu_exec_interrupt,
     .do_interrupt = riscv_cpu_do_interrupt,
     .do_transaction_failed = riscv_cpu_do_transaction_failed,
     .do_unaligned_access = riscv_cpu_do_unaligned_access,
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 968cb8046f4..701858d670c 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -75,11 +75,9 @@ static int riscv_cpu_local_irq_pending(CPURISCVState *env)
         return RISCV_EXCP_NONE; /* indicates no pending interrupt */
     }
 }
-#endif
 
 bool riscv_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
 {
-#if !defined(CONFIG_USER_ONLY)
     if (interrupt_request & CPU_INTERRUPT_HARD) {
         RISCVCPU *cpu = RISCV_CPU(cs);
         CPURISCVState *env = &cpu->env;
@@ -90,12 +88,9 @@ bool riscv_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
             return true;
         }
     }
-#endif
     return false;
 }
 
-#if !defined(CONFIG_USER_ONLY)
-
 /* Return true is floating point support is currently enabled */
 bool riscv_cpu_fp_enabled(CPURISCVState *env)
 {
-- 
2.31.1


