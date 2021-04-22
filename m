Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lZWt0-0007KC-SL
	for mharc-qemu-riscv@gnu.org; Thu, 22 Apr 2021 06:48:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lZWsr-0007Cl-MW; Thu, 22 Apr 2021 06:48:35 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:42978)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lZWso-0005YW-U0; Thu, 22 Apr 2021 06:48:32 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 y5-20020a05600c3645b0290132b13aaa3bso2869370wmq.1; 
 Thu, 22 Apr 2021 03:48:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qHZkesTQ7iY0aT+GqCLFkQZuPGZupRkmvhvWLL3ejQQ=;
 b=fU/W7JOBizxBXgABfqaHuQ8B892lUWfRY5YOXDn71cd2A1wMrRhrZWFcBwqUve2ZZa
 jf1kKqs/duj7WWF4xB+L1bRxfloYnNS4HM20R2cN0n0ekoOyUNSoczrntuZ44VaRBCiy
 MIwKSeRXDnehpRZDsVSdmkc+3nl/Dc7j7v9/S36AykXm93GFrKUEXzhj92OLOQmfJs0N
 uAAyFbp53fPZ2wkaagB8EJ9NuMHeuuViF8Ocww5eJQIpVh1B4yVePefyYDsVbPejy25h
 VTlN+s98eMg9eIJFNYyx3fwELz83XuZGu4KVupa4Miw+kfwIBrr0FkiOUZoX550+2Khf
 dx+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=qHZkesTQ7iY0aT+GqCLFkQZuPGZupRkmvhvWLL3ejQQ=;
 b=FVAEEdiTqkZpzEOkchgaV3rmJ1MhhJDg6lokPhmR0NBbgiqs+nG78YRJxaP7eIeJOL
 71OdGujAruzDF3TLQaOYjTExg7enxcBAlBRrVrtghwoY21zQh/cVpdKkFlryjJj0h0gk
 x5R7Y81rwyPR4J4+pkEA1mqXXkMh7SKh4NYBEeymOkhF/cWupJr6iOGvh5dm0TlSKckA
 Xu2A1cFO7F+QyRRdHqekNtVKSZ53DQxdassMl+pwawINxVpq8XYAFS+o6fjWr1iE1V6S
 ohVaMJfrD1lDap477/CkR6jAZinn2M+IjiclNSIAwgtgOPrwfPCzVZqEYJGqqnoKoiRH
 olKg==
X-Gm-Message-State: AOAM5304Z7FqvQRn21VJr2xTheduwDe6kNMUUbwdEnAG+jLnaFWqLKVF
 5Yd5502sQ3i16a9ISxiafepLCiJ6l/OABA==
X-Google-Smtp-Source: ABdhPJzNC4BB9erAWVRLhhpwh1Zeqi5ghOGFzpiqQnj+JtfT+pJrHpsivyK3RstfYnX4BMN+3cJefg==
X-Received: by 2002:a1c:6a06:: with SMTP id f6mr3077795wmc.179.1619088506542; 
 Thu, 22 Apr 2021 03:48:26 -0700 (PDT)
Received: from x1w.redhat.com (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id y8sm3398426wru.27.2021.04.22.03.48.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Apr 2021 03:48:26 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Juan Quintela <quintela@redhat.com>, Greg Kurz <groug@kaod.org>,
 Laurent Vivier <laurent@vivier.eu>, qemu-riscv@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PATCH v5 14/15] cpu: Move CPUClass::get_paging_enabled to
 SysemuCPUOps
Date: Thu, 22 Apr 2021 12:47:03 +0200
Message-Id: <20210422104705.2454166-15-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210422104705.2454166-1-f4bug@amsat.org>
References: <20210422104705.2454166-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32d.google.com
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
X-List-Received-Date: Thu, 22 Apr 2021 10:48:39 -0000

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
index 460e7d63b0c..3f9a5199dd1 100644
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
index 1b7317e43b4..feb71981efb 100644
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


