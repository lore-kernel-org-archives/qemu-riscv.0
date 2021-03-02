Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lH6VA-0008PI-97
	for mharc-qemu-riscv@gnu.org; Tue, 02 Mar 2021 09:59:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lH6V8-0008Iq-09; Tue, 02 Mar 2021 09:59:54 -0500
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:44222)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lH6V6-0005JY-CV; Tue, 02 Mar 2021 09:59:53 -0500
Received: by mail-ej1-x62b.google.com with SMTP id w1so35814255ejf.11;
 Tue, 02 Mar 2021 06:59:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GB8inY6UkxSK7b05oz5LFm6GUiIud2UztI6zOEllLW8=;
 b=IMJjTSYiB1fkBZFp2MrDYC/AUegkX+zhWk1OFuVLXWDTPYaqqISGPzuyvsKBQt9U6W
 De/+vWjkmxBsLjiuOtFiCsy5I0xlREAwz4sPwIQL19nm00I0nIhlotDaiW15aO3uL/8I
 fc/hhq7X6U4iQEbwoVVkZ6viotJGtsT2ezTydJW92mPzm6u8q7B0W/Iogb1mxocf3dsg
 yptUzjzQUp7Vny8RMwBgPAfiAVGyP9TegKscTbMmzzdIGKnzQ6NnkUekIGdDDmzwrN7p
 3KRAqMaBsoapuTx8TcRzArq+OI2KndhCVVhuh7SOWdgyj4U3/ui7J3LgLuTenvG7O42u
 hrlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=GB8inY6UkxSK7b05oz5LFm6GUiIud2UztI6zOEllLW8=;
 b=hRj81+Hnlf245LjdAHxMPFEta9V/YVh/+XsQyKhUmPPBhSYFEK2C+9tHrULSrQ3tPL
 MfJz8MX3M9Vq/3XjAgD78J2rUkNa/n1P03Bqekv8tYdM0O+gjkCXg2NV/M5zuvKUSw6N
 3myMVgqVGEnae1uN4CB+QSOrG9qTnC0Hc/ujxzBolusx0K5py7/J5RjI8ydk2dEkLnMd
 eNn2Ik2PRFIDyOR/t2G/ds22Pu8sEMCR69Ir3ygZzwE0e6TtKHmoczqydnoFPrfCdNUM
 wjs+2yMLvWqVTCJr1a3/VJIrmImKuxLNE2LQ3tYpPOpkz2VdCVoRumOH3bnugLoWCznY
 97qw==
X-Gm-Message-State: AOAM5313avW2IhEGHoLyr+JVrcVGQPlojr1JPFL0RBOjaJnvKISKK72k
 ++CHX0r/GzXpGZTtzch4T1wnCst0Wig=
X-Google-Smtp-Source: ABdhPJzo22ITm008d6QcdO0TtZIJ79gugpoCnWtNIh62a947O2gaIfoL+MrH30DTkvKuGEd8jXNN4g==
X-Received: by 2002:a17:907:76bb:: with SMTP id
 jw27mr20988095ejc.366.1614697189065; 
 Tue, 02 Mar 2021 06:59:49 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id y8sm17819516edd.97.2021.03.02.06.59.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Mar 2021 06:59:48 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 Max Filippov <jcmvbkbc@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Guan Xuetao <gxt@mprc.pku.edu.cn>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Michael Rolnik <mrolnik@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Paolo Bonzini <pbonzini@redhat.com>,
 Greg Kurz <groug@kaod.org>, Stafford Horne <shorne@gmail.com>,
 qemu-ppc@nongnu.org, Anthony Green <green@moxielogic.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Cornelia Huck <cohuck@redhat.com>,
 Claudio Fontana <cfontana@suse.de>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Michael Walle <michael@walle.cc>, Marek Vasut <marex@denx.de>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Chris Wulff <crwulff@gmail.com>, David Hildenbrand <david@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-s390x@nongnu.org, Sarah Harris <S.E.Harris@kent.ac.uk>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, qemu-riscv@nongnu.org,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Taylor Simpson <tsimpson@quicinc.com>
Subject: [PATCH v3 12/27] cpu: Move CPUClass::asidx_from_attrs to SysemuCPUOps
Date: Tue,  2 Mar 2021 15:58:03 +0100
Message-Id: <20210302145818.1161461-13-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210302145818.1161461-1-f4bug@amsat.org>
References: <20210302145818.1161461-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x62b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
X-List-Received-Date: Tue, 02 Mar 2021 14:59:55 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/core/cpu.h            | 3 ---
 include/hw/core/sysemu-cpu-ops.h | 5 +++++
 hw/core/cpu.c                    | 4 ++--
 target/arm/cpu.c                 | 2 +-
 target/i386/cpu.c                | 2 +-
 5 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 0a2c29c3735..6713a615916 100644
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
index 60c667801ef..3c3f211136d 100644
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
diff --git a/hw/core/cpu.c b/hw/core/cpu.c
index c74390aafbf..c44229205ff 100644
--- a/hw/core/cpu.c
+++ b/hw/core/cpu.c
@@ -116,8 +116,8 @@ int cpu_asidx_from_attrs(CPUState *cpu, MemTxAttrs attrs)
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
index 7dc6956f2cc..acaa3ab68da 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -2262,6 +2262,7 @@ static gchar *arm_gdb_arch_name(CPUState *cs)
 
 #ifndef CONFIG_USER_ONLY
 static struct SysemuCPUOps arm_sysemu_ops = {
+    .asidx_from_attrs = arm_asidx_from_attrs,
     .write_elf32_note = arm_cpu_write_elf32_note,
     .write_elf64_note = arm_cpu_write_elf64_note,
     .virtio_is_big_endian = arm_cpu_virtio_is_big_endian,
@@ -2307,7 +2308,6 @@ static void arm_cpu_class_init(ObjectClass *oc, void *data)
     cc->gdb_write_register = arm_cpu_gdb_write_register;
 #ifndef CONFIG_USER_ONLY
     cc->get_phys_page_attrs_debug = arm_cpu_get_phys_page_attrs_debug;
-    cc->asidx_from_attrs = arm_asidx_from_attrs;
     cc->sysemu_ops = &arm_sysemu_ops;
 #endif
     cc->gdb_num_core_regs = 26;
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index b26905b22a3..10884540610 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -7388,6 +7388,7 @@ static Property x86_cpu_properties[] = {
 
 #ifndef CONFIG_USER_ONLY
 static struct SysemuCPUOps i386_sysemu_ops = {
+    .asidx_from_attrs = x86_asidx_from_attrs,
     .get_crash_info = x86_cpu_get_crash_info,
     .write_elf32_note = x86_cpu_write_elf32_note,
     .write_elf64_note = x86_cpu_write_elf64_note,
@@ -7429,7 +7430,6 @@ static void x86_cpu_common_class_init(ObjectClass *oc, void *data)
     cc->get_paging_enabled = x86_cpu_get_paging_enabled;
 
 #ifndef CONFIG_USER_ONLY
-    cc->asidx_from_attrs = x86_asidx_from_attrs;
     cc->get_memory_mapping = x86_cpu_get_memory_mapping;
     cc->get_phys_page_attrs_debug = x86_cpu_get_phys_page_attrs_debug;
     cc->sysemu_ops = &i386_sysemu_ops;
-- 
2.26.2


