Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mLoTq-0004AZ-2B
	for mharc-qemu-riscv@gnu.org; Thu, 02 Sep 2021 11:18:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mLoTb-000406-Sy; Thu, 02 Sep 2021 11:18:06 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:42696)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mLoTW-00029c-4w; Thu, 02 Sep 2021 11:18:03 -0400
Received: by mail-wr1-x42b.google.com with SMTP id q11so3516413wrr.9;
 Thu, 02 Sep 2021 08:17:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=L069GLOwVevZIfbe69rrRhjD3OO/UZ2SAngHRNvFFbM=;
 b=oGFhlU3W7icFTCQqe2vLdOfJ4i1IwyonfuGQJmHpWIxYYn6AxbA0Bq6McN7Ukka9x8
 N4MdZBnDzDDsW3s7FyObSO5mqkiVznwF/lAiNeVZW0INDUZ43RMen1ZT0b1XKbV797pb
 gOKVBhjH4qKYlpXxoVtIenA+O4U5VVJmmB8G1u3B2nOwPmgE/mUswm9DFbCu2teNyHLV
 o0MYBUqDdiBBdW+B9ynEkrxcm4u1sjtLhBql8CeOj3S6KUR682jn+eMQH7I+r6WOA6ic
 J3egKeRS1aMqvL/3W29NICX9M3aTIUUZmJyiirUNSKf3lILUsqwjSp6QLIv6jzy2kCUY
 v+xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=L069GLOwVevZIfbe69rrRhjD3OO/UZ2SAngHRNvFFbM=;
 b=pAWRS7ML8k7YvICd5lV6a2fN6F2mu2+dnzoESGJZFZFp1r3Tu+MbVbzpXkUzsCgg97
 Tqw+o98iqbKN8bFVC+cw2KWbO+ZGrs+aHuwgyZeCUi3qgXmlxXjzu8KVIHTG+pT+7fnO
 PJOIWjBCfRGzd8muOSL3XSt2TLCRk9BjSrxxBY4wBCXOhdnO/sjFxD1BStDYJvGCktmE
 5z0NadZ+h0Rry7ONTUbW2c8bmQjZvHdlq0vUaHak8qjcChNGLirKdN91RCadpHGqV3GJ
 lau+4rmc4RDj8hLSljfbUlXxOjmedO4MqhN5tsEIBbh7iW4vXizTnwG0kQr+9NiKxPfp
 isyg==
X-Gm-Message-State: AOAM5321SPze9gO2UsC1aagznb78FKX8z4yWh0gT6/C8+rVt2nxM8SNB
 RQ3EXowjLFneNvjapwI6BWq5p4UR3Us=
X-Google-Smtp-Source: ABdhPJzGIrEP4bzDJ3hKz79TOWMgnxQnc9fJNmfYF0UysHnxKdEdFVRNKA5CCjHsB7svPHLZe0xYTg==
X-Received: by 2002:adf:d1a8:: with SMTP id w8mr4440778wrc.306.1630595875567; 
 Thu, 02 Sep 2021 08:17:55 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 z6sm1922386wmp.1.2021.09.02.08.17.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Sep 2021 08:17:55 -0700 (PDT)
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
Subject: [PATCH 07/24] target/arm: Restrict cpu_exec_interrupt() handler to
 sysemu
Date: Thu,  2 Sep 2021 17:16:58 +0200
Message-Id: <20210902151715.383678-8-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210902151715.383678-1-f4bug@amsat.org>
References: <20210902151715.383678-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=no autolearn_force=no
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
X-List-Received-Date: Thu, 02 Sep 2021 15:18:12 -0000

Restrict cpu_exec_interrupt() and its callees to sysemu.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/arm/cpu.h     | 3 +--
 target/arm/cpu.c     | 7 +++++--
 target/arm/cpu_tcg.c | 6 +++---
 3 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 6a987f65e41..cfd755cff99 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1040,11 +1040,10 @@ uint64_t arm_cpu_mp_affinity(int idx, uint8_t clustersz);
 
 #ifndef CONFIG_USER_ONLY
 extern const VMStateDescription vmstate_arm_cpu;
-#endif
 
 void arm_cpu_do_interrupt(CPUState *cpu);
 void arm_v7m_cpu_do_interrupt(CPUState *cpu);
-bool arm_cpu_exec_interrupt(CPUState *cpu, int int_req);
+#endif /* !CONFIG_USER_ONLY */
 
 hwaddr arm_cpu_get_phys_page_attrs_debug(CPUState *cpu, vaddr addr,
                                          MemTxAttrs *attrs);
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index d631c4683c4..ba0741b20e4 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -440,6 +440,8 @@ static void arm_cpu_reset(DeviceState *dev)
     arm_rebuild_hflags(env);
 }
 
+#ifndef CONFIG_USER_ONLY
+
 static inline bool arm_excp_unmasked(CPUState *cs, unsigned int excp_idx,
                                      unsigned int target_el,
                                      unsigned int cur_el, bool secure,
@@ -556,7 +558,7 @@ static inline bool arm_excp_unmasked(CPUState *cs, unsigned int excp_idx,
     return unmasked || pstate_unmasked;
 }
 
-bool arm_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
+static bool arm_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
 {
     CPUClass *cc = CPU_GET_CLASS(cs);
     CPUARMState *env = cs->env_ptr;
@@ -608,6 +610,7 @@ bool arm_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
     cc->tcg_ops->do_interrupt(cs);
     return true;
 }
+#endif /* !CONFIG_USER_ONLY */
 
 void arm_cpu_update_virq(ARMCPU *cpu)
 {
@@ -2010,11 +2013,11 @@ static const struct SysemuCPUOps arm_sysemu_ops = {
 static const struct TCGCPUOps arm_tcg_ops = {
     .initialize = arm_translate_init,
     .synchronize_from_tb = arm_cpu_synchronize_from_tb,
-    .cpu_exec_interrupt = arm_cpu_exec_interrupt,
     .tlb_fill = arm_cpu_tlb_fill,
     .debug_excp_handler = arm_debug_excp_handler,
 
 #if !defined(CONFIG_USER_ONLY)
+    .cpu_exec_interrupt = arm_cpu_exec_interrupt,
     .do_interrupt = arm_cpu_do_interrupt,
     .do_transaction_failed = arm_cpu_do_transaction_failed,
     .do_unaligned_access = arm_cpu_do_unaligned_access,
diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c
index 33cc75af57d..0d5adccf1a7 100644
--- a/target/arm/cpu_tcg.c
+++ b/target/arm/cpu_tcg.c
@@ -22,7 +22,7 @@
 /* CPU models. These are not needed for the AArch64 linux-user build. */
 #if !defined(CONFIG_USER_ONLY) || !defined(TARGET_AARCH64)
 
-#ifdef CONFIG_TCG
+#if !defined(CONFIG_USER_ONLY) && defined(CONFIG_TCG)
 static bool arm_v7m_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
 {
     CPUClass *cc = CPU_GET_CLASS(cs);
@@ -46,7 +46,7 @@ static bool arm_v7m_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
     }
     return ret;
 }
-#endif /* CONFIG_TCG */
+#endif /* !CONFIG_USER_ONLY && CONFIG_TCG */
 
 static void arm926_initfn(Object *obj)
 {
@@ -898,11 +898,11 @@ static void pxa270c5_initfn(Object *obj)
 static const struct TCGCPUOps arm_v7m_tcg_ops = {
     .initialize = arm_translate_init,
     .synchronize_from_tb = arm_cpu_synchronize_from_tb,
-    .cpu_exec_interrupt = arm_v7m_cpu_exec_interrupt,
     .tlb_fill = arm_cpu_tlb_fill,
     .debug_excp_handler = arm_debug_excp_handler,
 
 #if !defined(CONFIG_USER_ONLY)
+    .cpu_exec_interrupt = arm_v7m_cpu_exec_interrupt,
     .do_interrupt = arm_v7m_cpu_do_interrupt,
     .do_transaction_failed = arm_cpu_do_transaction_failed,
     .do_unaligned_access = arm_cpu_do_unaligned_access,
-- 
2.31.1


