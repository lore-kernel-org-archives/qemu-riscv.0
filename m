Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lZfBa-0003FE-Ux
	for mharc-qemu-riscv@gnu.org; Thu, 22 Apr 2021 15:40:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lZfBO-0003C3-GC; Thu, 22 Apr 2021 15:40:15 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:39501)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lZfBL-0005fZ-MQ; Thu, 22 Apr 2021 15:40:13 -0400
Received: by mail-wr1-x431.google.com with SMTP id s7so45862664wru.6;
 Thu, 22 Apr 2021 12:40:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uLpgUUvTtmkbS378/dgmetDuRLNqY34+bULmG92CLFU=;
 b=b8OAqAl9ljQ5ZYTsPIy6IFqdLayCI/yYsKDOC9fZHCO/poQfztK8RSq3K9FdmStWrE
 Y8qByfa9glVNiWKx9Br+7OsqD9PrfR5qiT2fQX6+oqGg02AP5FsuXB6xDSsaPLN4o21h
 uQLBvB1Ot1sZUcxGiOF9hjjv5fgfFO81pd4nJB1IkjY2VEKMJen7eMgp+k32Cxnx9+iT
 5HM1hh81nqw3aZ29DLTqhzfOQGY8vz30+JSQ9T8bbv8weukT+341TPBPoebRwnJFvtGc
 J3LDVtsXCXqgtVhHvCPrJEyDlGF7YRQCb3KYmPIL3Za2ZfkeKk928Z3YCwX1uMI9+eXJ
 I+tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=uLpgUUvTtmkbS378/dgmetDuRLNqY34+bULmG92CLFU=;
 b=R+gMcADyzLziyOkIndX265W4fgmwXefvZY0Y5l1pDDspCagEJuFzF+f/hs4oNBq3M4
 a4kg5aMKPdyZp1NbDjKSDV7H1Z4R+bTujt4JCy9WdAFOorlEMkzhGScLxmDIJnPH1cBO
 2IDGu1cF3uX9YwGMImCRQn+6NMMG/k0/7zu8Zu9QoetS1jsIj+BT13sRX8zwvzrV7+qk
 G84zYGBrI8tmLhP13anfEzE5TERKsF0Rk1u2Ypd0txDTsBaYGOaa+5CryGfhgrZOMgu3
 LzNXCvDHM+njX4Vn06RFbqyVcq23oFhXRp4FBjrNKpZ7leElExHvWTvhduMfpX4kEmU0
 1c4w==
X-Gm-Message-State: AOAM533/pL6LqqTdPjs9iTgs9i5fQ5tciexpkU5vj1i3ywGg3IoZ1GLe
 AKeRhtg8NNNIxO6DQeAtCMuJsNPUoMZ1jA==
X-Google-Smtp-Source: ABdhPJzY13FoHhOEcp8xqb/Skv7Z4klTFux9/UotxkAZJtjnjEAHsebHcjQo7cCcvwWHr/VUgvK7pg==
X-Received: by 2002:a5d:4b8e:: with SMTP id b14mr39922wrt.86.1619120408939;
 Thu, 22 Apr 2021 12:40:08 -0700 (PDT)
Received: from x1w.redhat.com (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id o17sm4522281wmq.47.2021.04.22.12.40.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Apr 2021 12:40:08 -0700 (PDT)
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
 Paolo Bonzini <pbonzini@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Thomas Huth <thuth@redhat.com>, David Hildenbrand <david@redhat.com>
Subject: [PATCH v6 12/18] cpu: Move CPUClass::get_crash_info to SysemuCPUOps
Date: Thu, 22 Apr 2021 21:38:56 +0200
Message-Id: <20210422193902.2644064-13-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210422193902.2644064-1-f4bug@amsat.org>
References: <20210422193902.2644064-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x431.google.com
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
X-List-Received-Date: Thu, 22 Apr 2021 19:40:16 -0000

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
index 1c325d62b94..f7a91a66e06 100644
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
index eb96dd42556..ab0c07fe9b4 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -7393,6 +7393,7 @@ static Property x86_cpu_properties[] = {
 
 #ifndef CONFIG_USER_ONLY
 static const struct SysemuCPUOps i386_sysemu_ops = {
+    .get_crash_info = x86_cpu_get_crash_info,
     .legacy_vmsd = &vmstate_x86_cpu,
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
index 131e7dfdf82..55d7a727602 100644
--- a/target/s390x/cpu.c
+++ b/target/s390x/cpu.c
@@ -479,6 +479,7 @@ static void s390_cpu_reset_full(DeviceState *dev)
 
 #ifndef CONFIG_USER_ONLY
 static const struct SysemuCPUOps s390_sysemu_ops = {
+    .get_crash_info = s390_cpu_get_crash_info,
     .legacy_vmsd = &vmstate_s390_cpu,
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


