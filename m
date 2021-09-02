Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mLoTe-00041p-Q3
	for mharc-qemu-riscv@gnu.org; Thu, 02 Sep 2021 11:18:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mLoTU-0003wd-UO; Thu, 02 Sep 2021 11:17:58 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:42699)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mLoTS-00023r-AQ; Thu, 02 Sep 2021 11:17:56 -0400
Received: by mail-wr1-x42f.google.com with SMTP id q11so3515786wrr.9;
 Thu, 02 Sep 2021 08:17:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MA+BCTYyqK+9sz78Mv1qFMH8ilkc86l5KGXO2NGreho=;
 b=oUqcDGPVDflUwrHDbwUIXXAcNnAsyHW5IGmxT8VBf8GeYwqDwEZJmwmt/LiwcY9uUV
 dMpJSytBhhiumPbM1RkZ/zq4GHNkVhmfMrzfqmaihIZMv3YVipxRoIYqxZba4BugUueh
 uOs9e1IizyzQ4AXJmXrYcyHMAwFHsOficfyw6L+qsb3mZ1sAAEjEcPiuBD6BqADBOZYK
 vvqtLY/DxhDn0rlD6LhdUrsoeJtHiWw91XTU9o4go5UVd+HL7RhsI40C9PrXos8uzTWq
 G6HYkxiwrsopB4UGOcWIEQxOdiRYabP0w7jMH4w7ITZ7wWXP5ZP3HBUbHcOhByu3AMvP
 iDEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=MA+BCTYyqK+9sz78Mv1qFMH8ilkc86l5KGXO2NGreho=;
 b=WuIdZmCdcwM0UR5BnO/iM6GT75uSYta7xzyNWg0O3HYDNgCX/OV8XUXO5Sgmc0S+rR
 5/mPxEvmR3aECaLJazOGvcWCpsVJkmKM8/lIN6nAYiXm4r+ssa1PZhoVlVaQFNDQe8sM
 KLBLngbIJyJdXtxj+8OA8QTIZKN9Q/i7Pewlo1GGPjP/dZhOsT1jSjgdWhquUEAQVfvi
 As5PJUbFRotWsNKDuxcfxdR3n48+MtX5iLMdv6mKQUtO9+hK8JWbHFGFWTTwPrC5IrYp
 CURIim1JKU8lfsC1gu6IAtBqUq2evRK2ao53YGq7bPqlKM6wXyvfbkpZLQBjYjL5OWEu
 jwrg==
X-Gm-Message-State: AOAM531ofhHtuTjTMDwE/jdJWInxmjOfruh4E3tZ2jtF6Mc8HyujhEcg
 6o/pvNoJYZMo6iPjrPY5S5Yt23y5zfY=
X-Google-Smtp-Source: ABdhPJxN6skH69/vZF7eQ4VXxF2lHz9zrv6BXlS8rKLOQK0bDW0Alo0k0ZE0Nq3ljolYkUXS0sthjA==
X-Received: by 2002:adf:9e43:: with SMTP id v3mr4345919wre.274.1630595870054; 
 Thu, 02 Sep 2021 08:17:50 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 n4sm1200851wra.37.2021.09.02.08.17.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Sep 2021 08:17:49 -0700 (PDT)
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
Subject: [PATCH 06/24] target/alpha: Restrict cpu_exec_interrupt() handler to
 sysemu
Date: Thu,  2 Sep 2021 17:16:57 +0200
Message-Id: <20210902151715.383678-7-f4bug@amsat.org>
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
X-List-Received-Date: Thu, 02 Sep 2021 15:18:00 -0000

Restrict cpu_exec_interrupt() and its callees to sysemu.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/alpha/cpu.h    | 2 +-
 target/alpha/cpu.c    | 2 +-
 target/alpha/helper.c | 5 ++---
 3 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/target/alpha/cpu.h b/target/alpha/cpu.h
index 82df108967b..4e993bd15bd 100644
--- a/target/alpha/cpu.h
+++ b/target/alpha/cpu.h
@@ -274,10 +274,10 @@ struct AlphaCPU {
 
 #ifndef CONFIG_USER_ONLY
 extern const VMStateDescription vmstate_alpha_cpu;
-#endif
 
 void alpha_cpu_do_interrupt(CPUState *cpu);
 bool alpha_cpu_exec_interrupt(CPUState *cpu, int int_req);
+#endif /* !CONFIG_USER_ONLY */
 void alpha_cpu_dump_state(CPUState *cs, FILE *f, int flags);
 hwaddr alpha_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
 int alpha_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
diff --git a/target/alpha/cpu.c b/target/alpha/cpu.c
index 4871ad0c0a6..93e16a2ffb4 100644
--- a/target/alpha/cpu.c
+++ b/target/alpha/cpu.c
@@ -218,10 +218,10 @@ static const struct SysemuCPUOps alpha_sysemu_ops = {
 
 static const struct TCGCPUOps alpha_tcg_ops = {
     .initialize = alpha_translate_init,
-    .cpu_exec_interrupt = alpha_cpu_exec_interrupt,
     .tlb_fill = alpha_cpu_tlb_fill,
 
 #ifndef CONFIG_USER_ONLY
+    .cpu_exec_interrupt = alpha_cpu_exec_interrupt,
     .do_interrupt = alpha_cpu_do_interrupt,
     .do_transaction_failed = alpha_cpu_do_transaction_failed,
     .do_unaligned_access = alpha_cpu_do_unaligned_access,
diff --git a/target/alpha/helper.c b/target/alpha/helper.c
index 4f56fe4d231..81550d9e2ff 100644
--- a/target/alpha/helper.c
+++ b/target/alpha/helper.c
@@ -293,7 +293,6 @@ bool alpha_cpu_tlb_fill(CPUState *cs, vaddr addr, int size,
                  prot, mmu_idx, TARGET_PAGE_SIZE);
     return true;
 }
-#endif /* USER_ONLY */
 
 void alpha_cpu_do_interrupt(CPUState *cs)
 {
@@ -348,7 +347,6 @@ void alpha_cpu_do_interrupt(CPUState *cs)
 
     cs->exception_index = -1;
 
-#if !defined(CONFIG_USER_ONLY)
     switch (i) {
     case EXCP_RESET:
         i = 0x0000;
@@ -404,7 +402,6 @@ void alpha_cpu_do_interrupt(CPUState *cs)
 
     /* Switch to PALmode.  */
     env->flags |= ENV_FLAG_PAL_MODE;
-#endif /* !USER_ONLY */
 }
 
 bool alpha_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
@@ -451,6 +448,8 @@ bool alpha_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
     return false;
 }
 
+#endif /* !CONFIG_USER_ONLY */
+
 void alpha_cpu_dump_state(CPUState *cs, FILE *f, int flags)
 {
     static const char linux_reg_names[31][4] = {
-- 
2.31.1


