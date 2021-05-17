Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1liasD-0007p4-5w
	for mharc-qemu-riscv@gnu.org; Mon, 17 May 2021 06:53:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lias1-0007bC-Q7; Mon, 17 May 2021 06:53:12 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:37810)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lias0-00073s-8x; Mon, 17 May 2021 06:53:09 -0400
Received: by mail-wr1-x42c.google.com with SMTP id q5so5887107wrs.4;
 Mon, 17 May 2021 03:53:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mNroUX3BeAka8NdiLyy2HrifOJFWYU+B+TgnTgbcsqY=;
 b=htA/JO62MIPWqMM8tgAdaw8+n8BDVcJmTO6X9HNgLDImG7fCL54Hsf4Ua24ZjaYeAY
 eRuOYkPGrbnw4AWxRWP7fUCYAji7KmG8OGKUZIZc/hEnNTZ8r/X23/P1jDFmFPLwkpot
 Qr8irfpNnCQscmEoiQYLUhXopnmU9sJbFYzcM2wg3x81Rw3syjnvqIVu8cLxu3GlG1xW
 E6CDvp2YwD/htIBWiGb+FuLkFLUeZu7crgfdmzk0q0h1Q3QZcpVHNdMNhd420CdLkhwY
 S5//4ebo9obU4cCqW3G6LpBF92MSGet81re/9OvWkMv7r95O8ZnHUsISxlWHfZI4yS6g
 xzOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=mNroUX3BeAka8NdiLyy2HrifOJFWYU+B+TgnTgbcsqY=;
 b=dxClm1KC6OgbCzRsgFrOiZlaJItGsKGLqBvZu0QQSj1eEZVFNltGDesgeE8DoPU2dl
 697HFk9oFU/FVTrBbrV2kCp2VDUZ0siyCC39gJJw3fzRVzy5oxlSyPnQRd9BKdkVKuvc
 VoNTz0kqe8Z8mjInkKw58o9i4mKwKd6WHOhwei2h0kh2JL//eD9/RNVXA0YznhYOtiJu
 ZYpZSw9CgEnyEYmtXaz9hAg/0VqxGe0ebgeFZ5hAizhvflj4bvq4rNBWEFAmx+lHXIX0
 tEsb0qWHrY8flsbc+hsFIESwKnV/yvfEtxUlLAW8jlkZaJ4XW0iTb+VOCELU3l25LGSY
 cryg==
X-Gm-Message-State: AOAM5312z7dr3BrGRiUa+NMwJa/FJGdLo6jO+OB7GTn4J6Hk7A1xjFV4
 StLFxTRd5EjIsockKGBU6glp1Iqecf7EBg==
X-Google-Smtp-Source: ABdhPJy/wkIOO3bdTRTA4r7yyPIY92NFP4/oBAwG1Y9cz+mafUmCu45WXOvC8zg7Wy+/7EgmGsv2MQ==
X-Received: by 2002:a5d:52c5:: with SMTP id r5mr73462267wrv.391.1621248785231; 
 Mon, 17 May 2021 03:53:05 -0700 (PDT)
Received: from localhost.localdomain (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id e3sm6058502wru.48.2021.05.17.03.53.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 May 2021 03:53:04 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-arm@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v7 17/23] cpu: Move CPUClass::get_crash_info to SysemuCPUOps
Date: Mon, 17 May 2021 12:51:34 +0200
Message-Id: <20210517105140.1062037-18-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210517105140.1062037-1-f4bug@amsat.org>
References: <20210517105140.1062037-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
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
X-List-Received-Date: Mon, 17 May 2021 10:53:18 -0000

cpu_get_crash_info() is called on GUEST_PANICKED events,
which only occur in system emulation.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/core/cpu.h            | 1 -
 include/hw/core/sysemu-cpu-ops.h | 5 +++++
 hw/core/cpu-sysemu.c             | 4 ++--
 target/i386/cpu.c                | 2 +-
 target/s390x/cpu.c               | 2 +-
 5 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 1b7e815c871..6f5e04ae580 100644
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
index ed212085f89..c6ec9b0a7f6 100644
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
diff --git a/hw/core/cpu-sysemu.c b/hw/core/cpu-sysemu.c
index bad7d2cb016..90b5ac8eb9e 100644
--- a/hw/core/cpu-sysemu.c
+++ b/hw/core/cpu-sysemu.c
@@ -138,8 +138,8 @@ GuestPanicInformation *cpu_get_crash_info(CPUState *cpu)
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
index f8750f6400f..1106dc3fc98 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -6716,6 +6716,7 @@ static Property x86_cpu_properties[] = {
 
 #ifndef CONFIG_USER_ONLY
 static const struct SysemuCPUOps i386_sysemu_ops = {
+    .get_crash_info = x86_cpu_get_crash_info,
     .legacy_vmsd = &vmstate_x86_cpu,
 };
 #endif
@@ -6750,7 +6751,6 @@ static void x86_cpu_common_class_init(ObjectClass *oc, void *data)
     cc->asidx_from_attrs = x86_asidx_from_attrs;
     cc->get_memory_mapping = x86_cpu_get_memory_mapping;
     cc->get_phys_page_attrs_debug = x86_cpu_get_phys_page_attrs_debug;
-    cc->get_crash_info = x86_cpu_get_crash_info;
     cc->write_elf64_note = x86_cpu_write_elf64_note;
     cc->write_elf64_qemunote = x86_cpu_write_elf64_qemunote;
     cc->write_elf32_note = x86_cpu_write_elf32_note;
diff --git a/target/s390x/cpu.c b/target/s390x/cpu.c
index aafe5fa2ef5..470aaeb72e6 100644
--- a/target/s390x/cpu.c
+++ b/target/s390x/cpu.c
@@ -478,6 +478,7 @@ static void s390_cpu_reset_full(DeviceState *dev)
 
 #ifndef CONFIG_USER_ONLY
 static const struct SysemuCPUOps s390_sysemu_ops = {
+    .get_crash_info = s390_cpu_get_crash_info,
     .legacy_vmsd = &vmstate_s390_cpu,
 };
 #endif
@@ -522,7 +523,6 @@ static void s390_cpu_class_init(ObjectClass *oc, void *data)
     cc->gdb_write_register = s390_cpu_gdb_write_register;
 #ifndef CONFIG_USER_ONLY
     cc->get_phys_page_debug = s390_cpu_get_phys_page_debug;
-    cc->get_crash_info = s390_cpu_get_crash_info;
     cc->write_elf64_note = s390_cpu_write_elf64_note;
     cc->sysemu_ops = &s390_sysemu_ops;
 #endif
-- 
2.26.3


