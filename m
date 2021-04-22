Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lZWsJ-0006hq-PN
	for mharc-qemu-riscv@gnu.org; Thu, 22 Apr 2021 06:47:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lZWsH-0006cT-Rv; Thu, 22 Apr 2021 06:47:57 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:39498)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lZWsF-0005F7-Ur; Thu, 22 Apr 2021 06:47:57 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 i21-20020a05600c3555b029012eae2af5d4so2968075wmq.4; 
 Thu, 22 Apr 2021 03:47:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tP2J+wCmSfixgkbUO0OS9j1xOz4RXS1xTWip+OxPRIE=;
 b=nqlgUw5wBnL4GCJe/3bzAWYmKr20OCo60bg7OuF4yKfsI14YIYr4fE07FCb8ZiHPgK
 v+Yi+jD9MCFIo0Z1XABbiSVix/GD3S9isn8LVLDipUBDYDA36SiAuRSbmOJoHENx0sNa
 DifpMGHR+5E53ANUHJNgOHCyQKr7hUdwrqPkntg08upCxGTwAOEULJc7ZLHlEy5VtJS8
 bDsq6ejLYbgCTqpZ8J/wcjqTz1QGBmPYEV/WWisrbW3laraIZ2WMqbYEDw46s+HqTFRU
 JS0wJbVIR/6ubWcf4Id19IbyPZdmNva81cYQ1/D+qHuTF83MM2HjN+Ph/xxlspjpRMSp
 CLPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=tP2J+wCmSfixgkbUO0OS9j1xOz4RXS1xTWip+OxPRIE=;
 b=ql/3LlNqtRRagIQgFYYIunaHRpPSslsYIcORx3fc4Q08qRUC2ntVHCqEFF/6xppIcm
 B6wbgPVRB/nBVKuMUnFlFRSrGoZ7UMH15foNleOPpQJX17P30+eu1BsKyUQKKpsJOi75
 EwQit7t8nyQcQxTrIPNEdKqCWfINLSnUkN4a8ASrABJm1NzO0d3K/n6kSPUi0Ky6wB2U
 42snZmCpUH8h8UVl3seVbcerpDXkjBDY5Jl29Xs7Hr1sc+w6zQOIb7FD1H4h8L5XSKvd
 jiHsAASlsym1XRCmN1CA27NhGxh2jWT2742WMgZlsVFsFYbqX+4/Hm6j816lqeZxnLXb
 rNuA==
X-Gm-Message-State: AOAM532H0YKT3gsFn95pgN8Np/3YmqwjmJMneOFG/mYFd9azUV8r44KL
 Q1rIAQg5yp/Qf91VVW7JecY3vqFAo3vwUA==
X-Google-Smtp-Source: ABdhPJwf2KUOcN4rfcqd4xZAzNqlCGTmwdOudbp+f2BJG/rbHG9p2bX+R//Y/C+ck98SpAqhB/3qGA==
X-Received: by 2002:a7b:cd85:: with SMTP id y5mr14783816wmj.93.1619088472900; 
 Thu, 22 Apr 2021 03:47:52 -0700 (PDT)
Received: from x1w.redhat.com (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id i4sm3002746wrx.56.2021.04.22.03.47.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Apr 2021 03:47:52 -0700 (PDT)
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
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>
Subject: [PATCH v5 08/15] cpu: Move CPUClass::virtio_is_big_endian to
 SysemuCPUOps
Date: Thu, 22 Apr 2021 12:46:57 +0200
Message-Id: <20210422104705.2454166-9-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210422104705.2454166-1-f4bug@amsat.org>
References: <20210422104705.2454166-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x334.google.com
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
X-List-Received-Date: Thu, 22 Apr 2021 10:47:58 -0000

VirtIO devices are only meaningful with system emulation.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/core/cpu.h            | 5 -----
 include/hw/core/sysemu-cpu-ops.h | 8 ++++++++
 hw/core/cpu.c                    | 4 ++--
 target/arm/cpu.c                 | 2 +-
 target/ppc/translate_init.c.inc  | 4 +---
 5 files changed, 12 insertions(+), 11 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index bdc702894bf..e3c702b8b74 100644
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
index 05f19b22070..9c3ac4f2280 100644
--- a/include/hw/core/sysemu-cpu-ops.h
+++ b/include/hw/core/sysemu-cpu-ops.h
@@ -16,6 +16,14 @@
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
     /**
      * @vmsd: State description for migration.
      */
diff --git a/hw/core/cpu.c b/hw/core/cpu.c
index 5abf8bed2e4..09eaa3fa49f 100644
--- a/hw/core/cpu.c
+++ b/hw/core/cpu.c
@@ -204,8 +204,8 @@ bool cpu_virtio_is_big_endian(CPUState *cpu)
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
index 6421877c978..edefcc340af 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1945,6 +1945,7 @@ static gchar *arm_gdb_arch_name(CPUState *cs)
 
 #ifndef CONFIG_USER_ONLY
 static const struct SysemuCPUOps arm_sysemu_ops = {
+    .virtio_is_big_endian = arm_cpu_virtio_is_big_endian,
     .vmsd = &vmstate_arm_cpu,
 };
 #endif
@@ -1988,7 +1989,6 @@ static void arm_cpu_class_init(ObjectClass *oc, void *data)
 #ifndef CONFIG_USER_ONLY
     cc->get_phys_page_attrs_debug = arm_cpu_get_phys_page_attrs_debug;
     cc->asidx_from_attrs = arm_asidx_from_attrs;
-    cc->virtio_is_big_endian = arm_cpu_virtio_is_big_endian;
     cc->write_elf64_note = arm_cpu_write_elf64_note;
     cc->write_elf32_note = arm_cpu_write_elf32_note;
     cc->sysemu_ops = &arm_sysemu_ops;
diff --git a/target/ppc/translate_init.c.inc b/target/ppc/translate_init.c.inc
index 32fa62aded0..b8a095d3f3a 100644
--- a/target/ppc/translate_init.c.inc
+++ b/target/ppc/translate_init.c.inc
@@ -10880,6 +10880,7 @@ static Property ppc_cpu_properties[] = {
 
 #ifndef CONFIG_USER_ONLY
 static const struct SysemuCPUOps ppc_sysemu_ops = {
+    .virtio_is_big_endian = ppc_cpu_is_big_endian,
     .vmsd = &vmstate_ppc_cpu,
 };
 #endif
@@ -10948,9 +10949,6 @@ static void ppc_cpu_class_init(ObjectClass *oc, void *data)
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


