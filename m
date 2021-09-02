Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mLoUw-0005bA-3c
	for mharc-qemu-riscv@gnu.org; Thu, 02 Sep 2021 11:19:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mLoUf-0005QU-1H; Thu, 02 Sep 2021 11:19:11 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:45740)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mLoUb-00034p-8i; Thu, 02 Sep 2021 11:19:07 -0400
Received: by mail-wr1-x436.google.com with SMTP id n5so3505312wro.12;
 Thu, 02 Sep 2021 08:19:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yWzwMmzgtknOn/zDVw9ZMjlZX8g7FMUFvR1QvfAhY8E=;
 b=XL6aED2lZnZF+iSRz2h+W+d5lk31scEEQIu7ZFZr7a4DAwfbFp9vFKKYKaMRLBTYe0
 ozL+tRJbDl1PolsI21/eEKKM4L5Vm0QHXDY7fh742PqmfupsDm/e+6iYztFcpcuD3CUN
 eAxKQHzjkBw9jLLFM6woIBXxmr+spcq+bc2HhwugzWlkRK+aPrq0Kv2diuGeJUKFJ54y
 PnZi+XP7vbbb+yEeDc27xhClbS8UHJOFBNhR7IhAWiV44Fr57TarL486Z+xDsIx8HJTT
 CnPIuGsYkn3xr3j0fUpYG08ZOqxB75xU844oepVvpNhVtTkkokXtOFZB3T3hIBvwvXwC
 2OQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=yWzwMmzgtknOn/zDVw9ZMjlZX8g7FMUFvR1QvfAhY8E=;
 b=bYWwcu1BxQ8Qu9a7Sli9npwsO1coRiYlxsshgqloWq+BmQV79wPCyN9vfJPtmRFod7
 0SX+/fmPWFqc6/+db8MZsu+HNlxWTH67OdcKQ+qvwr7/3TpuLgDu3tcE3vNNLKFt95a6
 iDP+iYNwLO0V5gqZ+uizVF29lLf33h2D59Hb2p+gl8IAkeUsPaOeTe4Ooj6ArUVvxWK8
 TWLvuAG9Tuk1ZTTARvhOlqbiXEprONmUU1Sm6o2FT6bsjwOolCNsMrCozx328JTOWgNd
 Wzsoog9Jf19qtkntQSGmGiHTSHUH1XVAakvS7mZP99eiMTCQj//d8M1qtK2/ADV1Gohx
 c6LQ==
X-Gm-Message-State: AOAM530480VnR5VU49MMwl6XfUbSmKcIh0U9hplvdnr7b+dlB+TxuEd8
 Tvyl26iKt1IFF5ejRSpQuXhAyGNT+EI=
X-Google-Smtp-Source: ABdhPJzOKEjdbeMSJ9dEW35a0CRR6zbzkeoFfLzGKh6rzfiZeHRAhZKmrMV5Pi9tF4o2FxT4GTUCaA==
X-Received: by 2002:a5d:4e51:: with SMTP id r17mr4596219wrt.308.1630595939779; 
 Thu, 02 Sep 2021 08:18:59 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 s7sm2137638wra.75.2021.09.02.08.18.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Sep 2021 08:18:59 -0700 (PDT)
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
Subject: [PATCH 19/24] target/sh4: Restrict cpu_exec_interrupt() handler to
 sysemu
Date: Thu,  2 Sep 2021 17:17:10 +0200
Message-Id: <20210902151715.383678-20-f4bug@amsat.org>
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
X-List-Received-Date: Thu, 02 Sep 2021 15:19:15 -0000

Restrict cpu_exec_interrupt() and its callees to sysemu.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/sh4/cpu.h    | 4 ++--
 target/sh4/cpu.c    | 2 +-
 target/sh4/helper.c | 9 ++-------
 3 files changed, 5 insertions(+), 10 deletions(-)

diff --git a/target/sh4/cpu.h b/target/sh4/cpu.h
index 01c43440822..017a7702140 100644
--- a/target/sh4/cpu.h
+++ b/target/sh4/cpu.h
@@ -204,8 +204,6 @@ struct SuperHCPU {
 };
 
 
-void superh_cpu_do_interrupt(CPUState *cpu);
-bool superh_cpu_exec_interrupt(CPUState *cpu, int int_req);
 void superh_cpu_dump_state(CPUState *cpu, FILE *f, int flags);
 hwaddr superh_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
 int superh_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
@@ -223,6 +221,8 @@ bool superh_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
 
 void sh4_cpu_list(void);
 #if !defined(CONFIG_USER_ONLY)
+void superh_cpu_do_interrupt(CPUState *cpu);
+bool superh_cpu_exec_interrupt(CPUState *cpu, int int_req);
 void cpu_sh4_invalidate_tlb(CPUSH4State *s);
 uint32_t cpu_sh4_read_mmaped_itlb_addr(CPUSH4State *s,
                                        hwaddr addr);
diff --git a/target/sh4/cpu.c b/target/sh4/cpu.c
index 83269229421..2047742d03c 100644
--- a/target/sh4/cpu.c
+++ b/target/sh4/cpu.c
@@ -236,10 +236,10 @@ static const struct SysemuCPUOps sh4_sysemu_ops = {
 static const struct TCGCPUOps superh_tcg_ops = {
     .initialize = sh4_translate_init,
     .synchronize_from_tb = superh_cpu_synchronize_from_tb,
-    .cpu_exec_interrupt = superh_cpu_exec_interrupt,
     .tlb_fill = superh_cpu_tlb_fill,
 
 #ifndef CONFIG_USER_ONLY
+    .cpu_exec_interrupt = superh_cpu_exec_interrupt,
     .do_interrupt = superh_cpu_do_interrupt,
     .do_unaligned_access = superh_cpu_do_unaligned_access,
     .io_recompile_replay_branch = superh_io_recompile_replay_branch,
diff --git a/target/sh4/helper.c b/target/sh4/helper.c
index 2d622081e85..53cb9c3b631 100644
--- a/target/sh4/helper.c
+++ b/target/sh4/helper.c
@@ -45,11 +45,6 @@
 
 #if defined(CONFIG_USER_ONLY)
 
-void superh_cpu_do_interrupt(CPUState *cs)
-{
-    cs->exception_index = -1;
-}
-
 int cpu_sh4_is_cached(CPUSH4State *env, target_ulong addr)
 {
     /* For user mode, only U0 area is cacheable. */
@@ -784,8 +779,6 @@ int cpu_sh4_is_cached(CPUSH4State * env, target_ulong addr)
     return 0;
 }
 
-#endif
-
 bool superh_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
 {
     if (interrupt_request & CPU_INTERRUPT_HARD) {
@@ -803,6 +796,8 @@ bool superh_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
     return false;
 }
 
+#endif /* !CONFIG_USER_ONLY */
+
 bool superh_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
                          MMUAccessType access_type, int mmu_idx,
                          bool probe, uintptr_t retaddr)
-- 
2.31.1


