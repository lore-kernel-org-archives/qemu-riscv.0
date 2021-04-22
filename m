Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lZWsO-0006tO-Jn
	for mharc-qemu-riscv@gnu.org; Thu, 22 Apr 2021 06:48:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lZWsM-0006pD-RM; Thu, 22 Apr 2021 06:48:02 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:37417)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lZWsL-0005JW-6z; Thu, 22 Apr 2021 06:48:02 -0400
Received: by mail-wr1-x42d.google.com with SMTP id j5so43332814wrn.4;
 Thu, 22 Apr 2021 03:47:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yUcZBsD9xDOXEB+nTKfFfC4Vo6h4KKYKLXyLvxGRN4A=;
 b=oZ1T7SAcX+5QgMEagUvuk7YpAxq0PVXkRcqrgDLTa3apcE4X/dHyGvdMAc8NBb6Ieg
 bVWU/KJQu0N1fx/Era151PDglMYqzVuM0BFUnisZb98NZ00eTlJoz1/OU7owPR1b8Nlu
 aV2cZnXLDDS2aJR1UsMmxOXdtwtKMnAzwC18lOTxECNJM5sB/4c/bq/mIe1hZywgSpKA
 VYvx6rC3lBn6+b9ZhtTdSviWK1w8bJztou6OLM9TRPLEd+BFlWJgWg2Fs8L7g9GpVx8n
 uV7WOdsr1DzYgf7UFiyy4hQaP4az9rSWO+1IoHPBJnmc+11+fvmYgNiXbI78JUW46g1F
 PazA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=yUcZBsD9xDOXEB+nTKfFfC4Vo6h4KKYKLXyLvxGRN4A=;
 b=WCFIqrQ0IhOG1zV1qBvirv00/mxDbYDu+1owRIyU109+5PfpTPCuK1rbN2rps9bIhC
 M48a5eWCbzzBw9fMrBy4DXDsFStlWFicPgCmnGBnupiv16fFl8L7FAV349PTNMR+7/zU
 2Qa0jLbyUdZFkBjHhYpQXYB/BhKXsQ356OmENC5PgagbohYYo9aVzrvBEaWSi3tiN6h7
 JobgKvtRBCVZh+BIumcOLvN7EQlveYn0oNOfGEfPb/Q8TN5RVGIW7l1cKp4hu4/WBVgv
 +VuYIlJ5vIjybELDfKE/dkhsu9CfYREB3pRpEe02HRA/0EAOdt8ScnZmnv7gscf3Tt3h
 mbdQ==
X-Gm-Message-State: AOAM531vezwUBFn97ZC0ryI+DyfoKR/fFZvO7Ik5krQlkiOXbrU8t8W7
 kK748BQgXBAUcvcWPXukeCSX4gJuluzGJg==
X-Google-Smtp-Source: ABdhPJwJv4PFPjnIresrNNHLhqLInDgitpN/6v/srbaV75nNYDLTqBEDVOpHAuyQ9pVr0CLAqleTKA==
X-Received: by 2002:a5d:4584:: with SMTP id p4mr3221188wrq.383.1619088478322; 
 Thu, 22 Apr 2021 03:47:58 -0700 (PDT)
Received: from x1w.redhat.com (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id b206sm2654028wmc.15.2021.04.22.03.47.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Apr 2021 03:47:57 -0700 (PDT)
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
 David Hildenbrand <david@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Thomas Huth <thuth@redhat.com>
Subject: [PATCH v5 09/15] cpu: Move CPUClass::get_crash_info to SysemuCPUOps
Date: Thu, 22 Apr 2021 12:46:58 +0200
Message-Id: <20210422104705.2454166-10-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210422104705.2454166-1-f4bug@amsat.org>
References: <20210422104705.2454166-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
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
X-List-Received-Date: Thu, 22 Apr 2021 10:48:03 -0000

cpu_get_crash_info() is called on GUEST_PANICKED events,
which only occur in system emulation.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/core/cpu.h            | 1 -
 include/hw/core/sysemu-cpu-ops.h | 5 +++++
 hw/core/cpu.c                    | 4 ++--
 target/i386/cpu.c                | 2 +-
 target/s390x/cpu.c               | 2 +-
 5 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index e3c702b8b74..4289cd0d78a 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -150,7 +150,6 @@ struct CPUClass {
     int (*memory_rw_debug)(CPUState *cpu, vaddr addr,
                            uint8_t *buf, int len, bool is_write);
     void (*dump_state)(CPUState *cpu, FILE *, int flags);
-    GuestPanicInformation* (*get_crash_info)(CPUState *cpu);
     void (*dump_statistics)(CPUState *cpu, int flags);
     int64_t (*get_arch_id)(CPUState *cpu);
     bool (*get_paging_enabled)(const CPUState *cpu);
diff --git a/include/hw/core/sysemu-cpu-ops.h b/include/hw/core/sysemu-cpu-ops.h
index 9c3ac4f2280..b9ffca07665 100644
--- a/include/hw/core/sysemu-cpu-ops.h
+++ b/include/hw/core/sysemu-cpu-ops.h
@@ -16,6 +16,11 @@
  * struct SysemuCPUOps: System operations specific to a CPU class
  */
 typedef struct SysemuCPUOps {
+    /**
+     * @get_crash_info: Callback for reporting guest crash information in
+     * GUEST_PANICKED events.
+     */
+    GuestPanicInformation* (*get_crash_info)(CPUState *cpu);
     /**
      * @virtio_is_big_endian: Callback to return %true if a CPU which supports
      *       runtime configurable endianness is currently big-endian.
diff --git a/hw/core/cpu.c b/hw/core/cpu.c
index 09eaa3fa49f..0aebc18c41f 100644
--- a/hw/core/cpu.c
+++ b/hw/core/cpu.c
@@ -220,8 +220,8 @@ GuestPanicInformation *cpu_get_crash_info(CPUState *cpu)
     CPUClass *cc = CPU_GET_CLASS(cpu);
     GuestPanicInformation *res = NULL;
 
-    if (cc->get_crash_info) {
-        res = cc->get_crash_info(cpu);
+    if (cc->sysemu_ops->get_crash_info) {
+        res = cc->sysemu_ops->get_crash_info(cpu);
     }
     return res;
 }
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index a0cce7aafda..538104d4557 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -7393,6 +7393,7 @@ static Property x86_cpu_properties[] = {
 
 #ifndef CONFIG_USER_ONLY
 static const struct SysemuCPUOps i386_sysemu_ops = {
+    .get_crash_info = x86_cpu_get_crash_info,
     .vmsd = &vmstate_x86_cpu,
 };
 #endif
@@ -7432,7 +7433,6 @@ static void x86_cpu_common_class_init(ObjectClass *oc, void *data)
     cc->asidx_from_attrs = x86_asidx_from_attrs;
     cc->get_memory_mapping = x86_cpu_get_memory_mapping;
     cc->get_phys_page_attrs_debug = x86_cpu_get_phys_page_attrs_debug;
-    cc->get_crash_info = x86_cpu_get_crash_info;
     cc->write_elf64_note = x86_cpu_write_elf64_note;
     cc->write_elf64_qemunote = x86_cpu_write_elf64_qemunote;
     cc->write_elf32_note = x86_cpu_write_elf32_note;
diff --git a/target/s390x/cpu.c b/target/s390x/cpu.c
index fe908d9bc40..fdc169bb0ac 100644
--- a/target/s390x/cpu.c
+++ b/target/s390x/cpu.c
@@ -479,6 +479,7 @@ static void s390_cpu_reset_full(DeviceState *dev)
 
 #ifndef CONFIG_USER_ONLY
 static const struct SysemuCPUOps s390_sysemu_ops = {
+    .get_crash_info = s390_cpu_get_crash_info,
     .vmsd = &vmstate_s390_cpu,
 };
 #endif
@@ -523,7 +524,6 @@ static void s390_cpu_class_init(ObjectClass *oc, void *data)
     cc->gdb_write_register = s390_cpu_gdb_write_register;
 #ifndef CONFIG_USER_ONLY
     cc->get_phys_page_debug = s390_cpu_get_phys_page_debug;
-    cc->get_crash_info = s390_cpu_get_crash_info;
     cc->write_elf64_note = s390_cpu_write_elf64_note;
     cc->sysemu_ops = &s390_sysemu_ops;
 #endif
-- 
2.26.3


