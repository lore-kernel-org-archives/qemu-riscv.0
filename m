Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1liasV-0000DJ-Rt
	for mharc-qemu-riscv@gnu.org; Mon, 17 May 2021 06:53:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1liasR-00005S-TE; Mon, 17 May 2021 06:53:37 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:40846)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1liasO-0007Iq-JK; Mon, 17 May 2021 06:53:33 -0400
Received: by mail-wr1-x42a.google.com with SMTP id z17so5874356wrq.7;
 Mon, 17 May 2021 03:53:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=R6/9QXNVBtIBcMma+2nqCStG6/fu3uxJQHcr+W0fUdE=;
 b=ZsQiE3adxKjkMl8HQS0AjOQd3J/uyyKqnWzW/XIlOiT1yRvgfrJTtspozLz+cyCQSq
 Hu9Hppfy7YL7zMN/ZjRsR9snKAP29YZfeK2TXo6F9MDGfNDGpTZJq8/DjnusD3/ZZ1Qn
 iOtFgsFC4Jz96M1KXd/I5fVJTztvYVN+c3QcUDb6icqyvPSLXLNYZienKlDTlRGiKLhw
 EXmIc5aJVyt5eSgzhrao8DTyhqVpOc4ZTxUbYthbegZpgO65zMfG0MjCvRyz0s0Fyeqy
 zxjl9cKX3+v9gM/FGdMF67RuC3LWQUYNyYacoFHZBhb6YrhyMtUVM/ud1BwVgLUXweGL
 E9MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=R6/9QXNVBtIBcMma+2nqCStG6/fu3uxJQHcr+W0fUdE=;
 b=H89JsHROhyV/cBdzAHgkx6EaUGnB0nHhiMahtsDlKi0b7KTr0nTBa43is0xEztf6vq
 NNYNKtym+8RZuzTjSJddthSBf2nFWcgjMv7KTen2Ha9tcaYeBlpZ/g281RXBmB8My9TM
 iGxG23I71A3GkkbuVIzVAcK5roKOT5BFtRD2dtyPqYwidxbgE+gSEY8MLldHwdaUyzYz
 NzLAELde1+UA9u3OXLr2moogbsCsc2dFyoqDv5rqYHd6TAapZSoX8tLpMJUvD9zljh+K
 w476aCOl4eae+jLov6PmD7Uz6KJTJrZsbqGoEypSevCBWVV9Ko5ouhj5MWzz9Qk8GU8P
 vzwQ==
X-Gm-Message-State: AOAM531EzInSP8I0BSCGfWA77EYv2ZiCRN/n+cBEeJT7o7C9GE196o3l
 yveSaLyT/aQKMOss9Nx3TZeLZ40emmYR9g==
X-Google-Smtp-Source: ABdhPJwGjqFRy0Hel78NABTweEgXOFV/zZ5Z+Mw8L6eGW+9PKUr1f/mlk0NafvqVK3dPTsEvts0lyw==
X-Received: by 2002:adf:ee44:: with SMTP id w4mr28902496wro.415.1621248809517; 
 Mon, 17 May 2021 03:53:29 -0700 (PDT)
Received: from localhost.localdomain (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id q20sm23081179wmq.2.2021.05.17.03.53.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 May 2021 03:53:29 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-arm@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v7 22/23] cpu: Move CPUClass::get_paging_enabled to
 SysemuCPUOps
Date: Mon, 17 May 2021 12:51:39 +0200
Message-Id: <20210517105140.1062037-23-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210517105140.1062037-1-f4bug@amsat.org>
References: <20210517105140.1062037-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
X-List-Received-Date: Mon, 17 May 2021 10:53:38 -0000

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/core/cpu.h            | 2 --
 include/hw/core/sysemu-cpu-ops.h | 4 ++++
 hw/core/cpu-sysemu.c             | 4 ++--
 target/i386/cpu.c                | 4 +++-
 4 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index c95fc76064d..45fb543c291 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -93,7 +93,6 @@ struct AccelCPUClass;
  * @dump_state: Callback for dumping state.
  * @dump_statistics: Callback for dumping statistics.
  * @get_arch_id: Callback for getting architecture-dependent CPU ID.
- * @get_paging_enabled: Callback for inquiring whether paging is enabled.
  * @set_pc: Callback for setting the Program Counter register. This
  *       should have the semantics used by the target architecture when
  *       setting the PC from a source such as an ELF file entry point;
@@ -136,7 +135,6 @@ struct CPUClass {
     void (*dump_state)(CPUState *cpu, FILE *, int flags);
     void (*dump_statistics)(CPUState *cpu, int flags);
     int64_t (*get_arch_id)(CPUState *cpu);
-    bool (*get_paging_enabled)(const CPUState *cpu);
     void (*set_pc)(CPUState *cpu, vaddr value);
     int (*gdb_read_register)(CPUState *cpu, GByteArray *buf, int reg);
     int (*gdb_write_register)(CPUState *cpu, uint8_t *buf, int reg);
diff --git a/include/hw/core/sysemu-cpu-ops.h b/include/hw/core/sysemu-cpu-ops.h
index 959523315ba..554af5bebe9 100644
--- a/include/hw/core/sysemu-cpu-ops.h
+++ b/include/hw/core/sysemu-cpu-ops.h
@@ -21,6 +21,10 @@ typedef struct SysemuCPUOps {
      */
     void (*get_memory_mapping)(CPUState *cpu, MemoryMappingList *list,
                                Error **errp);
+    /**
+     * @get_paging_enabled: Callback for inquiring whether paging is enabled.
+     */
+    bool (*get_paging_enabled)(const CPUState *cpu);
     /**
      * @get_phys_page_debug: Callback for obtaining a physical address.
      */
diff --git a/hw/core/cpu-sysemu.c b/hw/core/cpu-sysemu.c
index 3850fcb27f0..00253f89293 100644
--- a/hw/core/cpu-sysemu.c
+++ b/hw/core/cpu-sysemu.c
@@ -27,8 +27,8 @@ bool cpu_paging_enabled(const CPUState *cpu)
 {
     CPUClass *cc = CPU_GET_CLASS(cpu);
 
-    if (cc->get_paging_enabled) {
-        return cc->get_paging_enabled(cpu);
+    if (cc->sysemu_ops->get_paging_enabled) {
+        return cc->sysemu_ops->get_paging_enabled(cpu);
     }
 
     return false;
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 26640d9cacf..839b9d9f8b2 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -6485,12 +6485,14 @@ static int64_t x86_cpu_get_arch_id(CPUState *cs)
     return cpu->apic_id;
 }
 
+#if !defined(CONFIG_USER_ONLY)
 static bool x86_cpu_get_paging_enabled(const CPUState *cs)
 {
     X86CPU *cpu = X86_CPU(cs);
 
     return cpu->env.cr[0] & CR0_PG_MASK;
 }
+#endif /* !CONFIG_USER_ONLY */
 
 static void x86_cpu_set_pc(CPUState *cs, vaddr value)
 {
@@ -6717,6 +6719,7 @@ static Property x86_cpu_properties[] = {
 #ifndef CONFIG_USER_ONLY
 static const struct SysemuCPUOps i386_sysemu_ops = {
     .get_memory_mapping = x86_cpu_get_memory_mapping,
+    .get_paging_enabled = x86_cpu_get_paging_enabled,
     .get_phys_page_attrs_debug = x86_cpu_get_phys_page_attrs_debug,
     .asidx_from_attrs = x86_asidx_from_attrs,
     .get_crash_info = x86_cpu_get_crash_info,
@@ -6752,7 +6755,6 @@ static void x86_cpu_common_class_init(ObjectClass *oc, void *data)
     cc->gdb_read_register = x86_cpu_gdb_read_register;
     cc->gdb_write_register = x86_cpu_gdb_write_register;
     cc->get_arch_id = x86_cpu_get_arch_id;
-    cc->get_paging_enabled = x86_cpu_get_paging_enabled;
 
 #ifndef CONFIG_USER_ONLY
     cc->sysemu_ops = &i386_sysemu_ops;
-- 
2.26.3


