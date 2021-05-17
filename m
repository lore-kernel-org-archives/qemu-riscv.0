Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1liasB-0007kE-PJ
	for mharc-qemu-riscv@gnu.org; Mon, 17 May 2021 06:53:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1liary-0007YO-CH; Mon, 17 May 2021 06:53:06 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:36565)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1liarv-00070x-QE; Mon, 17 May 2021 06:53:06 -0400
Received: by mail-wr1-x433.google.com with SMTP id c14so4082874wrx.3;
 Mon, 17 May 2021 03:53:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=63onU3fEYl+uRL/ePx949VTfyQdXHEiC6uRm6+a0hK8=;
 b=KaoKdbeif/Ibc1q3jebyXE+kfjBYxefCHMKFCfVGN7ZWvalO9bzRVDCahiWZlgIOlY
 jp86O9+9tTtKOb8jAsNJuOhuqVI2IZB66vA0KIAizRxF3puxmXlzkdjbCEt5KwT3inG3
 KSaayB1T/OhtY04TY7HhUrPr7Tud4N1dSqIueRUnz4CCCTfJpTHea75DoIv/KeXNNBft
 /dE7HBHuLc3iTKJlnWPk0zNDfcV+XBwafO57ai1rCMvAYXUepVEwJXhLuNB6fffhVAwn
 h2D7E2mh6RJs/XEMpHNPQGYp5bUqZNg3V+awER0EsvBfm7NROsRvwfBlUY3Y/E/irf7h
 2KrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=63onU3fEYl+uRL/ePx949VTfyQdXHEiC6uRm6+a0hK8=;
 b=sQ6aqn+nq4ljwKXxdeJya/4GVgXSPl4l9A54gcfsonvRMis2557R12ESFc+JYgkHWu
 rngKeniuZmFDgHZhwlZUPpK47tbxW8RfESn5znAYOBa2vAXETAj5pF/+1ZlufV20qwSD
 jr4ZhU3YKAcM/2/ibpDaPZ1fmlNB5O7tooNlgJKlA2xSVeZJ3G5RAyd1wStDU/w4Xq0x
 fco/3MKJ6fDeGIpqKwbpyjiHe3HKazBQYtUiLZB2lcim1R6LpIEGwdgP/LfWwZWi0wwJ
 SDvP6UGwPewKt+rqhnJFeFyZQYN18c3Exzj5QzdgwwTTGFBnKAjOXymf5at8wLmB//Ps
 O0tw==
X-Gm-Message-State: AOAM532m2rmFjlGwLC8uJqgjnoobYky+8dc7LHDrWBo48lTffuiriz5F
 13HhXj+OB/5J3FSO/hOh5iEa+LSiZgvZ0Q==
X-Google-Smtp-Source: ABdhPJwxzxTtvDIXAOW55WeFxDVgptFoXz1U/8jWr+4SXApU3E7rkOkXDelW/laOysP7uSBEUhFGwg==
X-Received: by 2002:adf:fb87:: with SMTP id a7mr74184247wrr.58.1621248780538; 
 Mon, 17 May 2021 03:53:00 -0700 (PDT)
Received: from localhost.localdomain (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id f4sm17426570wrz.33.2021.05.17.03.52.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 May 2021 03:53:00 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-arm@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v7 16/23] cpu: Move CPUClass::virtio_is_big_endian to
 SysemuCPUOps
Date: Mon, 17 May 2021 12:51:33 +0200
Message-Id: <20210517105140.1062037-17-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210517105140.1062037-1-f4bug@amsat.org>
References: <20210517105140.1062037-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
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
X-List-Received-Date: Mon, 17 May 2021 10:53:12 -0000

VirtIO devices are only meaningful with system emulation.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/core/cpu.h            | 5 -----
 include/hw/core/sysemu-cpu-ops.h | 9 +++++++++
 hw/core/cpu-sysemu.c             | 5 +++--
 target/arm/cpu.c                 | 2 +-
 target/ppc/translate_init.c.inc  | 4 +---
 5 files changed, 14 insertions(+), 11 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 8e4f0662eb5..1b7e815c871 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -89,10 +89,6 @@ struct AccelCPUClass;
  * @parse_features: Callback to parse command line arguments.
  * @reset_dump_flags: #CPUDumpFlags to use for reset logging.
  * @has_work: Callback for checking if there is work to do.
- * @virtio_is_big_endian: Callback to return %true if a CPU which supports
- * runtime configurable endianness is currently big-endian. Non-configurable
- * CPUs can use the default implementation of this method. This method should
- * not be used by any callers other than the pre-1.0 virtio devices.
  * @memory_rw_debug: Callback for GDB memory access.
  * @dump_state: Callback for dumping state.
  * @dump_statistics: Callback for dumping statistics.
@@ -151,7 +147,6 @@ struct CPUClass {
 
     int reset_dump_flags;
     bool (*has_work)(CPUState *cpu);
-    bool (*virtio_is_big_endian)(CPUState *cpu);
     int (*memory_rw_debug)(CPUState *cpu, vaddr addr,
                            uint8_t *buf, int len, bool is_write);
     void (*dump_state)(CPUState *cpu, FILE *, int flags);
diff --git a/include/hw/core/sysemu-cpu-ops.h b/include/hw/core/sysemu-cpu-ops.h
index 0370ac15196..ed212085f89 100644
--- a/include/hw/core/sysemu-cpu-ops.h
+++ b/include/hw/core/sysemu-cpu-ops.h
@@ -16,6 +16,15 @@
  * struct SysemuCPUOps: System operations specific to a CPU class
  */
 typedef struct SysemuCPUOps {
+    /**
+     * @virtio_is_big_endian: Callback to return %true if a CPU which supports
+     *       runtime configurable endianness is currently big-endian.
+     * Non-configurable CPUs can use the default implementation of this method.
+     * This method should not be used by any callers other than the pre-1.0
+     * virtio devices.
+     */
+    bool (*virtio_is_big_endian)(CPUState *cpu);
+
     /**
      * @legacy_vmsd: Legacy state for migration.
      *               Do not use in new targets, use #DeviceClass::vmsd instead.
diff --git a/hw/core/cpu-sysemu.c b/hw/core/cpu-sysemu.c
index aa68ca281e8..bad7d2cb016 100644
--- a/hw/core/cpu-sysemu.c
+++ b/hw/core/cpu-sysemu.c
@@ -21,6 +21,7 @@
 #include "qemu/osdep.h"
 #include "qapi/error.h"
 #include "hw/core/cpu.h"
+#include "hw/core/sysemu-cpu-ops.h"
 
 bool cpu_paging_enabled(const CPUState *cpu)
 {
@@ -126,8 +127,8 @@ bool cpu_virtio_is_big_endian(CPUState *cpu)
 {
     CPUClass *cc = CPU_GET_CLASS(cpu);
 
-    if (cc->virtio_is_big_endian) {
-        return cc->virtio_is_big_endian(cpu);
+    if (cc->sysemu_ops->virtio_is_big_endian) {
+        return cc->sysemu_ops->virtio_is_big_endian(cpu);
     }
     return target_words_bigendian();
 }
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 0a104cec633..9100947905a 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1944,6 +1944,7 @@ static gchar *arm_gdb_arch_name(CPUState *cs)
 
 #ifndef CONFIG_USER_ONLY
 static const struct SysemuCPUOps arm_sysemu_ops = {
+    .virtio_is_big_endian = arm_cpu_virtio_is_big_endian,
     .legacy_vmsd = &vmstate_arm_cpu,
 };
 #endif
@@ -1987,7 +1988,6 @@ static void arm_cpu_class_init(ObjectClass *oc, void *data)
 #ifndef CONFIG_USER_ONLY
     cc->get_phys_page_attrs_debug = arm_cpu_get_phys_page_attrs_debug;
     cc->asidx_from_attrs = arm_asidx_from_attrs;
-    cc->virtio_is_big_endian = arm_cpu_virtio_is_big_endian;
     cc->write_elf64_note = arm_cpu_write_elf64_note;
     cc->write_elf32_note = arm_cpu_write_elf32_note;
     cc->sysemu_ops = &arm_sysemu_ops;
diff --git a/target/ppc/translate_init.c.inc b/target/ppc/translate_init.c.inc
index 9f20cdb569b..73e859ea0d3 100644
--- a/target/ppc/translate_init.c.inc
+++ b/target/ppc/translate_init.c.inc
@@ -10239,6 +10239,7 @@ static Property ppc_cpu_properties[] = {
 
 #ifndef CONFIG_USER_ONLY
 static const struct SysemuCPUOps ppc_sysemu_ops = {
+    .virtio_is_big_endian = ppc_cpu_is_big_endian,
     .legacy_vmsd = &vmstate_ppc_cpu,
 };
 #endif
@@ -10307,9 +10308,6 @@ static void ppc_cpu_class_init(ObjectClass *oc, void *data)
     cc->gdb_core_xml_file = "power64-core.xml";
 #else
     cc->gdb_core_xml_file = "power-core.xml";
-#endif
-#ifndef CONFIG_USER_ONLY
-    cc->virtio_is_big_endian = ppc_cpu_is_big_endian;
 #endif
     cc->disas_set_info = ppc_disas_set_info;
 
-- 
2.26.3


