Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1liasF-0007xQ-DB
	for mharc-qemu-riscv@gnu.org; Mon, 17 May 2021 06:53:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1liasC-0007lt-3z; Mon, 17 May 2021 06:53:20 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:36569)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1liasA-00078o-74; Mon, 17 May 2021 06:53:19 -0400
Received: by mail-wr1-x435.google.com with SMTP id c14so4083614wrx.3;
 Mon, 17 May 2021 03:53:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FbXrbsFgQfYCIQJ6BwzHhPAnG5B1R409h9MqBprv7hI=;
 b=T5fEWEhpwXpXOkQHpmJuynHThyXwdX0seI3TH++wZQvZxbkHdRL+6wkwuLd0cT2exI
 l1ekMpIrG8Z5LOtum8t2+1KXOyMSHUR2j2VOxy+jfoD6bspKgdCaLS1fIKla5zefMgnO
 ZKcbNru/IkzqMITB1fv/80xZ/R1GhMGfkAa7mYhF0ZUmbExIhEbOY817eDLEMYOV/tZL
 zmRh7lF3aPcY2W8UbANJtZ9VJ3s4ORPutyR0aGERw2c6leTIi9SzTrFAaE6TBasJMpHZ
 b5+hqPlcJsd1nFAU3S0tFzg2309hsHdDIcuCBT7tgpARcOp6FQ2eQ3zZMiV+MBnXARsR
 Dhww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=FbXrbsFgQfYCIQJ6BwzHhPAnG5B1R409h9MqBprv7hI=;
 b=szk+JgALXxJhNkAuZWuCygdFWS+gjRjofoWEUAS+RVkzEs0S5l+kVk5Oe5CNqVVebd
 MNzWfuNdZs3w1haM39wVWd2iMiVM7XFBJPQWo1u3CKl0uLf3u7qr5xxERTbrf/gspc0S
 ZMf/g0SqUm79rPo/kOaUJNZj8YLMO4SIh9qVZ+NA+ps+bq4zjN1QeJew+E1tNkHixTwR
 UBJeUXe6xLII9wV/24AEHcKC9M1j/cwfLxlWnx244mX0rHVF9uThAghW33Q4pydCZTgS
 Dwbldoy3Eu54jnZki7+h6J9zJORukujaWnmNSgt0rOKFm2a5u2JzD2AXWpMuFmyGRGpM
 qXWg==
X-Gm-Message-State: AOAM530fOR2gXOSF8B9w0CV11wlLWdfaCv6njyBcNbxg6q5KwzzFJAC+
 qJ1PKFtsNXaDg7JhAXgoHfm/cood8+3Pow==
X-Google-Smtp-Source: ABdhPJzIzL+TlUXxpYLx1CIaVFH/gCbEq5JUlZ8H5MmRFU6oEWCqdY+MS+aD83/bVFu4gTRn4zSRCQ==
X-Received: by 2002:a05:6000:1189:: with SMTP id
 g9mr18861219wrx.385.1621248795135; 
 Mon, 17 May 2021 03:53:15 -0700 (PDT)
Received: from localhost.localdomain (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id b62sm14383119wmc.39.2021.05.17.03.53.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 May 2021 03:53:14 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-arm@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v7 19/23] cpu: Move CPUClass::asidx_from_attrs to SysemuCPUOps
Date: Mon, 17 May 2021 12:51:36 +0200
Message-Id: <20210517105140.1062037-20-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210517105140.1062037-1-f4bug@amsat.org>
References: <20210517105140.1062037-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
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
X-List-Received-Date: Mon, 17 May 2021 10:53:22 -0000

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/core/cpu.h            | 3 ---
 include/hw/core/sysemu-cpu-ops.h | 5 +++++
 hw/core/cpu-sysemu.c             | 4 ++--
 target/arm/cpu.c                 | 2 +-
 target/i386/cpu.c                | 2 +-
 5 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index fce9bdc686e..cbc43f11376 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -108,8 +108,6 @@ struct AccelCPUClass;
  *       associated memory transaction attributes to use for the access.
  *       CPUs which use memory transaction attributes should implement this
  *       instead of get_phys_page_debug.
- * @asidx_from_attrs: Callback to return the CPU AddressSpace to use for
- *       a memory access with the specified memory transaction attributes.
  * @gdb_read_register: Callback for letting GDB read a register.
  * @gdb_write_register: Callback for letting GDB write a register.
  * @gdb_num_core_regs: Number of core registers accessible to GDB.
@@ -151,7 +149,6 @@ struct CPUClass {
     hwaddr (*get_phys_page_debug)(CPUState *cpu, vaddr addr);
     hwaddr (*get_phys_page_attrs_debug)(CPUState *cpu, vaddr addr,
                                         MemTxAttrs *attrs);
-    int (*asidx_from_attrs)(CPUState *cpu, MemTxAttrs attrs);
     int (*gdb_read_register)(CPUState *cpu, GByteArray *buf, int reg);
     int (*gdb_write_register)(CPUState *cpu, uint8_t *buf, int reg);
 
diff --git a/include/hw/core/sysemu-cpu-ops.h b/include/hw/core/sysemu-cpu-ops.h
index 19247d330dc..894bb95e4fa 100644
--- a/include/hw/core/sysemu-cpu-ops.h
+++ b/include/hw/core/sysemu-cpu-ops.h
@@ -16,6 +16,11 @@
  * struct SysemuCPUOps: System operations specific to a CPU class
  */
 typedef struct SysemuCPUOps {
+    /**
+     * @asidx_from_attrs: Callback to return the CPU AddressSpace to use for
+     *       a memory access with the specified memory transaction attributes.
+     */
+    int (*asidx_from_attrs)(CPUState *cpu, MemTxAttrs attrs);
     /**
      * @get_crash_info: Callback for reporting guest crash information in
      * GUEST_PANICKED events.
diff --git a/hw/core/cpu-sysemu.c b/hw/core/cpu-sysemu.c
index d55ef8d23d1..ba53c2eaa85 100644
--- a/hw/core/cpu-sysemu.c
+++ b/hw/core/cpu-sysemu.c
@@ -72,8 +72,8 @@ int cpu_asidx_from_attrs(CPUState *cpu, MemTxAttrs attrs)
     CPUClass *cc = CPU_GET_CLASS(cpu);
     int ret = 0;
 
-    if (cc->asidx_from_attrs) {
-        ret = cc->asidx_from_attrs(cpu, attrs);
+    if (cc->sysemu_ops->asidx_from_attrs) {
+        ret = cc->sysemu_ops->asidx_from_attrs(cpu, attrs);
         assert(ret < cpu->num_ases && ret >= 0);
     }
     return ret;
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index a56de47d1fa..f8fc0d01956 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1944,6 +1944,7 @@ static gchar *arm_gdb_arch_name(CPUState *cs)
 
 #ifndef CONFIG_USER_ONLY
 static const struct SysemuCPUOps arm_sysemu_ops = {
+    .asidx_from_attrs = arm_asidx_from_attrs,
     .write_elf32_note = arm_cpu_write_elf32_note,
     .write_elf64_note = arm_cpu_write_elf64_note,
     .virtio_is_big_endian = arm_cpu_virtio_is_big_endian,
@@ -1989,7 +1990,6 @@ static void arm_cpu_class_init(ObjectClass *oc, void *data)
     cc->gdb_write_register = arm_cpu_gdb_write_register;
 #ifndef CONFIG_USER_ONLY
     cc->get_phys_page_attrs_debug = arm_cpu_get_phys_page_attrs_debug;
-    cc->asidx_from_attrs = arm_asidx_from_attrs;
     cc->sysemu_ops = &arm_sysemu_ops;
 #endif
     cc->gdb_num_core_regs = 26;
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 44c9546eda2..d050245b502 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -6716,6 +6716,7 @@ static Property x86_cpu_properties[] = {
 
 #ifndef CONFIG_USER_ONLY
 static const struct SysemuCPUOps i386_sysemu_ops = {
+    .asidx_from_attrs = x86_asidx_from_attrs,
     .get_crash_info = x86_cpu_get_crash_info,
     .write_elf32_note = x86_cpu_write_elf32_note,
     .write_elf64_note = x86_cpu_write_elf64_note,
@@ -6752,7 +6753,6 @@ static void x86_cpu_common_class_init(ObjectClass *oc, void *data)
     cc->get_paging_enabled = x86_cpu_get_paging_enabled;
 
 #ifndef CONFIG_USER_ONLY
-    cc->asidx_from_attrs = x86_asidx_from_attrs;
     cc->get_memory_mapping = x86_cpu_get_memory_mapping;
     cc->get_phys_page_attrs_debug = x86_cpu_get_phys_page_attrs_debug;
     cc->sysemu_ops = &i386_sysemu_ops;
-- 
2.26.3


