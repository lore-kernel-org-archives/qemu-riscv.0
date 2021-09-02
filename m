Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mLoUl-0005UR-N6
	for mharc-qemu-riscv@gnu.org; Thu, 02 Sep 2021 11:19:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mLoUS-0005M5-86; Thu, 02 Sep 2021 11:18:59 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:34772)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mLoU8-0002hT-Ns; Thu, 02 Sep 2021 11:18:51 -0400
Received: by mail-wr1-x429.google.com with SMTP id m9so3552779wrb.1;
 Thu, 02 Sep 2021 08:18:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qOhbKOMLJQTnP4opOKzKRsGwickHkRFQACXPCZkwzZ4=;
 b=MVdpwWPCgzsfVptRrLWGxJCKhgwtHmICPzS+494nVY58reKdXIcLJv+nFCR2fBuT1c
 EjD/e/B480ZHjRxYaeZYH1BzttEuTjVRPsxJF7w9Kccd0dazIjJBO/v824FVwQi4SF/2
 jPMOcbajzTFpJLAsqEhBGLKlZcWOkxIQPgQT1iMo3axxsNyT5tEHTnWQSsgnVAjKccwp
 2Ahm0ebcztLvCmzqqJggnwUKp860fyqXzCaSmQkCSNNyIBLStSA5MyHENKpNYQ2c0soE
 jbhOrcKT278czFzvKqt4yZOM3QGSxResVes+LfOyb4cbpvhNkwOdnkSvXuK7E+talVC8
 6N6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=qOhbKOMLJQTnP4opOKzKRsGwickHkRFQACXPCZkwzZ4=;
 b=mWbZ4tllEOtIan9KTv3QBR9SWwi13bM63/8Pl2gkOED6WuNqUeU/0dvuE3+BTcEbrP
 PJA3PnF/Rsax9oau1yc6B+YoYkrRbqZL5iBvBqUW5RuG2xSqJieGQfxPw5rWv9JCYVWg
 wC9WXIXvWk3W6tWh7hY3iUWy8nWQXlrrG2FCkNSe2SyyYDFmkToOJxe9Tf2TWKvd/5Id
 E53Lv3KEmuwZeGKRj9O+hOidOn97qL87VJBbKe/TbEn+cNPrfkMFJ9kecv1PIPkJWD/W
 0wkXJfyJzJ9QCuJm1U9UdntuwUx838Tcxq6oHuJlGv70JKgHCIJtWQa/KqBX/poZvK1D
 +MWw==
X-Gm-Message-State: AOAM533JVftCyTS2yYqwrPH71IEDXLNxKkynvk+9Ckg1j4kV+K25Jvvh
 NmBwCdjJzdsYEkpTuwhXSG6F4x4y9/4=
X-Google-Smtp-Source: ABdhPJysv/O1nATy+Iu5ULEGo2DtI3bT2Rsk+0/uZ+uSNrF4KOuKlIytm6Z9sf/zOU+f6QI7ieRRvw==
X-Received: by 2002:adf:c3c8:: with SMTP id d8mr4413659wrg.143.1630595912991; 
 Thu, 02 Sep 2021 08:18:32 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 17sm1830515wmj.20.2021.09.02.08.18.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Sep 2021 08:18:32 -0700 (PDT)
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
Subject: [PATCH 14/24] target/mips: Restrict cpu_exec_interrupt() handler to
 sysemu
Date: Thu,  2 Sep 2021 17:17:05 +0200
Message-Id: <20210902151715.383678-15-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210902151715.383678-1-f4bug@amsat.org>
References: <20210902151715.383678-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, SPF_HELO_NONE=0.001,
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
 target/mips/tcg/tcg-internal.h      |  5 +++--
 target/mips/cpu.c                   |  2 +-
 target/mips/tcg/exception.c         | 18 ------------------
 target/mips/tcg/sysemu/tlb_helper.c | 18 ++++++++++++++++++
 target/mips/tcg/user/tlb_helper.c   |  5 -----
 5 files changed, 22 insertions(+), 26 deletions(-)

diff --git a/target/mips/tcg/tcg-internal.h b/target/mips/tcg/tcg-internal.h
index 81b14eb219e..c7a77ddccdd 100644
--- a/target/mips/tcg/tcg-internal.h
+++ b/target/mips/tcg/tcg-internal.h
@@ -18,8 +18,6 @@
 void mips_tcg_init(void);
 
 void mips_cpu_synchronize_from_tb(CPUState *cs, const TranslationBlock *tb);
-void mips_cpu_do_interrupt(CPUState *cpu);
-bool mips_cpu_exec_interrupt(CPUState *cpu, int int_req);
 bool mips_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
                        MMUAccessType access_type, int mmu_idx,
                        bool probe, uintptr_t retaddr);
@@ -41,6 +39,9 @@ static inline void QEMU_NORETURN do_raise_exception(CPUMIPSState *env,
 
 #if !defined(CONFIG_USER_ONLY)
 
+void mips_cpu_do_interrupt(CPUState *cpu);
+bool mips_cpu_exec_interrupt(CPUState *cpu, int int_req);
+
 void mmu_init(CPUMIPSState *env, const mips_def_t *def);
 
 void update_pagemask(CPUMIPSState *env, target_ulong arg1, int32_t *pagemask);
diff --git a/target/mips/cpu.c b/target/mips/cpu.c
index d426918291a..00e0c55d0e4 100644
--- a/target/mips/cpu.c
+++ b/target/mips/cpu.c
@@ -539,10 +539,10 @@ static const struct SysemuCPUOps mips_sysemu_ops = {
 static const struct TCGCPUOps mips_tcg_ops = {
     .initialize = mips_tcg_init,
     .synchronize_from_tb = mips_cpu_synchronize_from_tb,
-    .cpu_exec_interrupt = mips_cpu_exec_interrupt,
     .tlb_fill = mips_cpu_tlb_fill,
 
 #if !defined(CONFIG_USER_ONLY)
+    .cpu_exec_interrupt = mips_cpu_exec_interrupt,
     .do_interrupt = mips_cpu_do_interrupt,
     .do_transaction_failed = mips_cpu_do_transaction_failed,
     .do_unaligned_access = mips_cpu_do_unaligned_access,
diff --git a/target/mips/tcg/exception.c b/target/mips/tcg/exception.c
index 4fb8b00711d..7b3026b105b 100644
--- a/target/mips/tcg/exception.c
+++ b/target/mips/tcg/exception.c
@@ -86,24 +86,6 @@ void mips_cpu_synchronize_from_tb(CPUState *cs, const TranslationBlock *tb)
     env->hflags |= tb->flags & MIPS_HFLAG_BMASK;
 }
 
-bool mips_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
-{
-    if (interrupt_request & CPU_INTERRUPT_HARD) {
-        MIPSCPU *cpu = MIPS_CPU(cs);
-        CPUMIPSState *env = &cpu->env;
-
-        if (cpu_mips_hw_interrupts_enabled(env) &&
-            cpu_mips_hw_interrupts_pending(env)) {
-            /* Raise it */
-            cs->exception_index = EXCP_EXT_INTERRUPT;
-            env->error_code = 0;
-            mips_cpu_do_interrupt(cs);
-            return true;
-        }
-    }
-    return false;
-}
-
 static const char * const excp_names[EXCP_LAST + 1] = {
     [EXCP_RESET] = "reset",
     [EXCP_SRESET] = "soft reset",
diff --git a/target/mips/tcg/sysemu/tlb_helper.c b/target/mips/tcg/sysemu/tlb_helper.c
index a150a014ec1..73254d19298 100644
--- a/target/mips/tcg/sysemu/tlb_helper.c
+++ b/target/mips/tcg/sysemu/tlb_helper.c
@@ -1339,6 +1339,24 @@ void mips_cpu_do_interrupt(CPUState *cs)
     cs->exception_index = EXCP_NONE;
 }
 
+bool mips_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
+{
+    if (interrupt_request & CPU_INTERRUPT_HARD) {
+        MIPSCPU *cpu = MIPS_CPU(cs);
+        CPUMIPSState *env = &cpu->env;
+
+        if (cpu_mips_hw_interrupts_enabled(env) &&
+            cpu_mips_hw_interrupts_pending(env)) {
+            /* Raise it */
+            cs->exception_index = EXCP_EXT_INTERRUPT;
+            env->error_code = 0;
+            mips_cpu_do_interrupt(cs);
+            return true;
+        }
+    }
+    return false;
+}
+
 void r4k_invalidate_tlb(CPUMIPSState *env, int idx, int use_extra)
 {
     CPUState *cs = env_cpu(env);
diff --git a/target/mips/tcg/user/tlb_helper.c b/target/mips/tcg/user/tlb_helper.c
index b835144b820..210c6d529ef 100644
--- a/target/mips/tcg/user/tlb_helper.c
+++ b/target/mips/tcg/user/tlb_helper.c
@@ -57,8 +57,3 @@ bool mips_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
     raise_mmu_exception(env, address, access_type);
     do_raise_exception_err(env, cs->exception_index, env->error_code, retaddr);
 }
-
-void mips_cpu_do_interrupt(CPUState *cs)
-{
-    cs->exception_index = EXCP_NONE;
-}
-- 
2.31.1


