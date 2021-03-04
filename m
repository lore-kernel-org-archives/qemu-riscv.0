Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lHwO2-0007Wk-WC
	for mharc-qemu-riscv@gnu.org; Thu, 04 Mar 2021 17:24:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lHwNv-0007Ot-VN; Thu, 04 Mar 2021 17:23:56 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:54715)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lHwNu-0002XD-Ax; Thu, 04 Mar 2021 17:23:55 -0500
Received: by mail-wm1-x32c.google.com with SMTP id u187so9370741wmg.4;
 Thu, 04 Mar 2021 14:23:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=D6LLQzNZyfmEhNL83oc33kVYOp47IlGJ59yVOiNpnRg=;
 b=ZEreaPaFQBeiuBRNQ2OdnjMAh9JP6F2sp+ucDXyAI7serdBvnEP0GeJdpO1aAGOIeI
 mIVkrONeWtvTb1SMlHLcC3sGhPN3obe0dPFCNXlQDxIXdWO3p3i0+75JNV1bSQ3SXq+Z
 YHhbanE6DrpECs+Gf7JQFnk1TcIRvJF8JXp6USUYHyeIUAUv1YMCAxZOBy6LY6sh2+vb
 v4Nd21MM9wbNeiCvo7RmagK5R3DNdDj4WFkWsU+1u17WCATCjnuqddqsP8euBUJlYwbE
 4lHfmE2bwxDXaii4j1U2dCT4sO84hu9SR1qdIVEDLB0K9amKQ6g8RbArTEXXP6kLsuc7
 n2GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=D6LLQzNZyfmEhNL83oc33kVYOp47IlGJ59yVOiNpnRg=;
 b=F2ZmQdebd5vNEMytEvMB1FAyZA36eEpW3JXsKtyIhN3NwW/h5oAwQiBun4ZSAjS+5E
 D6xEmxar9W8ZjFej5OZ7XSopbWePHVOfB5Gy31wKaLPji3ogNbr9Z3z9l3QKJcaAgvjg
 eZRa7amZb+uEkC1kv5R2s8dmW35fZRY/yaO6qzlZuNvCCL9AGwAwqFEWwLgrvHeT/u6D
 YcQbsT/O0d3aYu3ZEl2VvFEv4PcqlG9+HHW7w2JArpzUGQK+oYz4ClUhmz+RamION8A4
 ewu4zmWT+TNUCmUe66tSJ6L7GN57wKD/pBIjdu9NG6OYUhhaapir6cnVcetvXrzurEAS
 ONYA==
X-Gm-Message-State: AOAM530gdtcI8/4CRLgNdNiKgspZISNVEglmeDF/jEWkSNLe6MZ+yWIg
 slaYyUpjvGdfKPtgAHdwGYkWJAEVoQw=
X-Google-Smtp-Source: ABdhPJwnMQsUEYN2vxJhPn71ExiDnnAWuGzag6QAtfQlcdTNm3SuZmB5gnJwAeak8v++6xxILl5L3w==
X-Received: by 2002:a1c:6309:: with SMTP id x9mr5873815wmb.62.1614896631437;
 Thu, 04 Mar 2021 14:23:51 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id m9sm1035239wro.52.2021.03.04.14.23.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Mar 2021 14:23:51 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Cornelia Huck <cohuck@redhat.com>,
 Greg Kurz <groug@kaod.org>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-riscv@nongnu.org,
 Claudio Fontana <cfontana@suse.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [RFC PATCH v2 5/8] target/ppc: Duplicate the TCGCPUOps structure for
 POWER CPUs
Date: Thu,  4 Mar 2021 23:23:20 +0100
Message-Id: <20210304222323.1954755-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210304222323.1954755-1-f4bug@amsat.org>
References: <20210304222323.1954755-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
X-List-Received-Date: Thu, 04 Mar 2021 22:23:57 -0000

POWER CPUs have specific CPUClass::has_work() handlers.
In preparation of moving this field to TCGCPUOps, we need
to duplicate the current ppc_tcg_ops structure for the
POWER cpus.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/ppc/translate_init.c.inc | 69 +++++++++++++++++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/target/ppc/translate_init.c.inc b/target/ppc/translate_init.c.inc
index 80239077e0b..fe76d0b3773 100644
--- a/target/ppc/translate_init.c.inc
+++ b/target/ppc/translate_init.c.inc
@@ -48,6 +48,11 @@
 /* #define PPC_DUMP_SPR_ACCESSES */
 /* #define USE_APPLE_GDB */
 
+static const struct TCGCPUOps power7_tcg_ops;
+static const struct TCGCPUOps power8_tcg_ops;
+static const struct TCGCPUOps power9_tcg_ops;
+static const struct TCGCPUOps power10_tcg_ops;
+
 /*
  * Generic callbacks:
  * do nothing but store/retrieve spr value
@@ -8685,6 +8690,9 @@ POWERPC_FAMILY(POWER7)(ObjectClass *oc, void *data)
     pcc->l1_dcache_size = 0x8000;
     pcc->l1_icache_size = 0x8000;
     pcc->interrupts_big_endian = ppc_cpu_interrupts_big_endian_lpcr;
+#ifdef CONFIG_TCG
+    cc->tcg_ops = &power7_tcg_ops;
+#endif /* CONFIG_TCG */
 }
 
 static void init_proc_POWER8(CPUPPCState *env)
@@ -8863,6 +8871,9 @@ POWERPC_FAMILY(POWER8)(ObjectClass *oc, void *data)
     pcc->l1_dcache_size = 0x8000;
     pcc->l1_icache_size = 0x8000;
     pcc->interrupts_big_endian = ppc_cpu_interrupts_big_endian_lpcr;
+#ifdef CONFIG_TCG
+    cc->tcg_ops = &power8_tcg_ops;
+#endif /* CONFIG_TCG */
 }
 
 #ifdef CONFIG_SOFTMMU
@@ -9081,6 +9092,9 @@ POWERPC_FAMILY(POWER9)(ObjectClass *oc, void *data)
     pcc->l1_dcache_size = 0x8000;
     pcc->l1_icache_size = 0x8000;
     pcc->interrupts_big_endian = ppc_cpu_interrupts_big_endian_lpcr;
+#ifdef CONFIG_TCG
+    cc->tcg_ops = &power9_tcg_ops;
+#endif /* CONFIG_TCG */
 }
 
 #ifdef CONFIG_SOFTMMU
@@ -9292,6 +9306,9 @@ POWERPC_FAMILY(POWER10)(ObjectClass *oc, void *data)
     pcc->l1_dcache_size = 0x8000;
     pcc->l1_icache_size = 0x8000;
     pcc->interrupts_big_endian = ppc_cpu_interrupts_big_endian_lpcr;
+#ifdef CONFIG_TCG
+    cc->tcg_ops = &power10_tcg_ops;
+#endif /* CONFIG_TCG */
 }
 
 #if !defined(CONFIG_USER_ONLY)
@@ -10851,6 +10868,58 @@ static const struct TCGCPUOps ppc_tcg_ops = {
   .cpu_exec_interrupt = ppc_cpu_exec_interrupt,
   .tlb_fill = ppc_cpu_tlb_fill,
 
+#ifndef CONFIG_USER_ONLY
+  .do_interrupt = ppc_cpu_do_interrupt,
+  .cpu_exec_enter = ppc_cpu_exec_enter,
+  .cpu_exec_exit = ppc_cpu_exec_exit,
+  .do_unaligned_access = ppc_cpu_do_unaligned_access,
+#endif /* !CONFIG_USER_ONLY */
+};
+
+static const struct TCGCPUOps power7_tcg_ops = {
+  .initialize = ppc_translate_init,
+  .cpu_exec_interrupt = ppc_cpu_exec_interrupt,
+  .tlb_fill = ppc_cpu_tlb_fill,
+
+#ifndef CONFIG_USER_ONLY
+  .do_interrupt = ppc_cpu_do_interrupt,
+  .cpu_exec_enter = ppc_cpu_exec_enter,
+  .cpu_exec_exit = ppc_cpu_exec_exit,
+  .do_unaligned_access = ppc_cpu_do_unaligned_access,
+#endif /* !CONFIG_USER_ONLY */
+};
+
+static const struct TCGCPUOps power8_tcg_ops = {
+  .initialize = ppc_translate_init,
+  .cpu_exec_interrupt = ppc_cpu_exec_interrupt,
+  .tlb_fill = ppc_cpu_tlb_fill,
+
+#ifndef CONFIG_USER_ONLY
+  .do_interrupt = ppc_cpu_do_interrupt,
+  .cpu_exec_enter = ppc_cpu_exec_enter,
+  .cpu_exec_exit = ppc_cpu_exec_exit,
+  .do_unaligned_access = ppc_cpu_do_unaligned_access,
+#endif /* !CONFIG_USER_ONLY */
+};
+
+static const struct TCGCPUOps power9_tcg_ops = {
+  .initialize = ppc_translate_init,
+  .cpu_exec_interrupt = ppc_cpu_exec_interrupt,
+  .tlb_fill = ppc_cpu_tlb_fill,
+
+#ifndef CONFIG_USER_ONLY
+  .do_interrupt = ppc_cpu_do_interrupt,
+  .cpu_exec_enter = ppc_cpu_exec_enter,
+  .cpu_exec_exit = ppc_cpu_exec_exit,
+  .do_unaligned_access = ppc_cpu_do_unaligned_access,
+#endif /* !CONFIG_USER_ONLY */
+};
+
+static const struct TCGCPUOps power10_tcg_ops = {
+  .initialize = ppc_translate_init,
+  .cpu_exec_interrupt = ppc_cpu_exec_interrupt,
+  .tlb_fill = ppc_cpu_tlb_fill,
+
 #ifndef CONFIG_USER_ONLY
   .do_interrupt = ppc_cpu_do_interrupt,
   .cpu_exec_enter = ppc_cpu_exec_enter,
-- 
2.26.2


