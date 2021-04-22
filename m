Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lZfBs-0003oZ-6F
	for mharc-qemu-riscv@gnu.org; Thu, 22 Apr 2021 15:40:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lZfBq-0003j2-4E; Thu, 22 Apr 2021 15:40:42 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:35736)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lZfBo-0005wL-2T; Thu, 22 Apr 2021 15:40:41 -0400
Received: by mail-wr1-x432.google.com with SMTP id a4so45960065wrr.2;
 Thu, 22 Apr 2021 12:40:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=S/tuuNIpZQoRu1GShuaPUInFgchy3nLKXlFhmpoZHyQ=;
 b=fnaw9do6bkoRnfJXMFMkFJTAJub+LjBh1v5V0x0mV7pfneSOF1NIZzVU6UhyRM2rDV
 jKy2ZDXuuyYyRlTye5JvH7FzsmaI+XqzG90Orr6Kl0kTU5Ipp4JuO3f85mJzDE4PI77F
 D96+8/m2tvd6ddgEXLic0xAe6wBnq1oLyZCaSkeDJRZM4YD8NUfNn2OEVTpTFmOOQEcP
 AF9XAKtgmNZha3dm8PTXTnAi/1sDvWknN9BvhkO1kOoE7qgcSwJ84ZbTeuGTG8s7xVFb
 zwSqJfaljzjSTC8mXJ2ZDO1E4FissANcvlOfzNyd+x54RfIf8blLW6EtMX826xB9J3LB
 E3hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=S/tuuNIpZQoRu1GShuaPUInFgchy3nLKXlFhmpoZHyQ=;
 b=h+ZshTrLKIivNkADtEc1/t2xSMDBOeXcRx1kJqd7NSGHVdpZ6qOJbR1OzUwtUpZE/p
 Ivvl314RUIpJlpGzz8KK7evUpcjd+E4KB8NL8wEFi2KL21Xe/HY4NSuAq9UNvI56rxCh
 DCo5S2bFSvr5ThS+aaHB5G54W1MMPasZKESCszlFRY44H3qagbZ+r8W+22I9zOr5evZi
 xddVUgjVQJ/3UYIgzVH0PemKqffrigkL3ZmesaQxC6L1SOhS2P62Q6JDEZK62Nd1h7CP
 IOco2qTE3WHb/RZRfmvJGaCH8Y+pDjaoIJETSd/LnrFiIigYhcCitoDXRCdE15EG9BxT
 VFDw==
X-Gm-Message-State: AOAM531xv9UNqEUV3ZZuPS08YinilmHlV0lB7e/L/eYtyoWa+ZGWgV+9
 9c8m7tLTlPyCycWY0ou8nFvBJGUFtSseQg==
X-Google-Smtp-Source: ABdhPJyWeFzy7j1iw7Gf55A8wmXiGXJDIqx54FI3qIdeXeic4Ftc/YwG6FF3c0ywgEwGP8r8azJAmA==
X-Received: by 2002:a5d:50c5:: with SMTP id f5mr38488wrt.136.1619120436886;
 Thu, 22 Apr 2021 12:40:36 -0700 (PDT)
Received: from x1w.redhat.com (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id d10sm5172425wri.41.2021.04.22.12.40.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Apr 2021 12:40:36 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-riscv@nongnu.org,
 Juan Quintela <quintela@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Claudio Fontana <cfontana@suse.de>, qemu-arm@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-ppc@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, qemu-s390x@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v6 17/18] cpu: Move CPUClass::get_paging_enabled to
 SysemuCPUOps
Date: Thu, 22 Apr 2021 21:39:01 +0200
Message-Id: <20210422193902.2644064-18-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210422193902.2644064-1-f4bug@amsat.org>
References: <20210422193902.2644064-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x432.google.com
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
X-List-Received-Date: Thu, 22 Apr 2021 19:40:42 -0000

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/core/cpu.h            | 2 --
 include/hw/core/sysemu-cpu-ops.h | 4 ++++
 hw/core/cpu.c                    | 4 ++--
 target/i386/cpu.c                | 4 +++-
 4 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 6dd60c3ada4..d0187798eea 100644
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
index 344561b7827..f0707f012b4 100644
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
diff --git a/hw/core/cpu.c b/hw/core/cpu.c
index 339bdfadd7a..7a8487d468f 100644
--- a/hw/core/cpu.c
+++ b/hw/core/cpu.c
@@ -71,8 +71,8 @@ bool cpu_paging_enabled(const CPUState *cpu)
 {
     CPUClass *cc = CPU_GET_CLASS(cpu);
 
-    if (cc->get_paging_enabled) {
-        return cc->get_paging_enabled(cpu);
+    if (cc->sysemu_ops->get_paging_enabled) {
+        return cc->sysemu_ops->get_paging_enabled(cpu);
     }
 
     return false;
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 5d35d8e329f..abdebdfe9b8 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -7162,12 +7162,14 @@ static int64_t x86_cpu_get_arch_id(CPUState *cs)
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
@@ -7394,6 +7396,7 @@ static Property x86_cpu_properties[] = {
 #ifndef CONFIG_USER_ONLY
 static const struct SysemuCPUOps i386_sysemu_ops = {
     .get_memory_mapping = x86_cpu_get_memory_mapping,
+    .get_paging_enabled = x86_cpu_get_paging_enabled,
     .get_phys_page_attrs_debug = x86_cpu_get_phys_page_attrs_debug,
     .asidx_from_attrs = x86_asidx_from_attrs,
     .get_crash_info = x86_cpu_get_crash_info,
@@ -7434,7 +7437,6 @@ static void x86_cpu_common_class_init(ObjectClass *oc, void *data)
     cc->gdb_read_register = x86_cpu_gdb_read_register;
     cc->gdb_write_register = x86_cpu_gdb_write_register;
     cc->get_arch_id = x86_cpu_get_arch_id;
-    cc->get_paging_enabled = x86_cpu_get_paging_enabled;
 
 #ifndef CONFIG_USER_ONLY
     cc->sysemu_ops = &i386_sysemu_ops;
-- 
2.26.3


