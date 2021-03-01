Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lGqTV-0003Q6-65
	for mharc-qemu-riscv@gnu.org; Mon, 01 Mar 2021 16:53:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lGqTS-0003KL-HV; Mon, 01 Mar 2021 16:53:06 -0500
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:44026)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lGqTQ-0005VI-Tq; Mon, 01 Mar 2021 16:53:06 -0500
Received: by mail-ed1-x52f.google.com with SMTP id bd6so9517894edb.10;
 Mon, 01 Mar 2021 13:53:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MXkQdWgohB9uSSp9OtT22O1oCJ949jTBzJW7O9qsdTc=;
 b=hNZjpVdrVI63phJbFYUzDIPLoonxJsaqtraOR5sYfaAoSgzWe7io18UVu0L6m7RhH4
 bebZKBGTfRRLxU6MTxQX4UltQ7Smz38CS4M/cEI5pYD1dNlLhequCNf+vWDETmDo+Onn
 t/WipwsglUfsAUmVlJ+abKHbUhazMEvHJTmOxqYKUIYZvs3BqBuJYyeF5CC5n4vdYDS3
 ZqAZV9zwDoHgK+LaBvifxtvxJmBxCg5CP0surZ2LI8zceyYSu5iiqK9HlY4Dw09AUUWB
 7gevru6kx7Z4Ju8EX7X6p7zbhTT6MIpuQz0qEQ96pP/IcaSjzp4yqsdLKQ+iScPEJa1x
 wE4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=MXkQdWgohB9uSSp9OtT22O1oCJ949jTBzJW7O9qsdTc=;
 b=VU0AJ4OdROoGpu+IjfSJ2MIQhA7XwO0lwtAXWRv8MTlPq64LUfsl/uUHvEmx+eItWb
 GvHm9Y7hxMJvqj/jYnUOyH3epAKmBfpcMBGAl+F1KscCjV9R8EABYe/OJgQUOdRj247F
 A3CR1heBQBj3QRKqUAeNxOrsWnTpsTKRNYObscTc+V/loPJmsuD6SMIiKNwb9snGsQ1h
 0a16H5Nd+Hb3tuD0zPvryNQALRpmd7/YaEYyvPVMWWd2fMrO39sgcpcMTR1e9SxoFpJH
 7lHbFNxz1otR0m/M5VDK0cy+1s8salqrFtPkxsrvw1I2G3rfFcQjtSD+3Y+YOHivT1p2
 wnvw==
X-Gm-Message-State: AOAM530mLTOZoLCyh4tKQcRrQ2yUMkS33z994AhKlWaniSaGbVhw+IPA
 HNgu1JDcX0jCu03riyCPzl3CH2ga4KE=
X-Google-Smtp-Source: ABdhPJypEelAe2MQJO+QsAlt6vhlOKERbfLpxu5hJmk9ARnOY43j4ecWuvtrsDfZSyTh/d4Ud0/o6Q==
X-Received: by 2002:a05:6402:31b7:: with SMTP id
 dj23mr18452684edb.245.1614635581892; 
 Mon, 01 Mar 2021 13:53:01 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id y8sm10716968eju.31.2021.03.01.13.52.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Mar 2021 13:53:01 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Cc: Michael Rolnik <mrolnik@gmail.com>, Anthony Green <green@moxielogic.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Marek Vasut <marex@denx.de>, Paolo Bonzini <pbonzini@redhat.com>,
 Stafford Horne <shorne@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, qemu-s390x@nongnu.org,
 Chris Wulff <crwulff@gmail.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Aurelien Jarno <aurelien@aurel32.net>,
 David Gibson <david@gibson.dropbear.id.au>,
 Sarah Harris <S.E.Harris@kent.ac.uk>, David Hildenbrand <david@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, qemu-riscv@nongnu.org,
 Alistair Francis <Alistair.Francis@wdc.com>, qemu-ppc@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>, Claudio Fontana <cfontana@suse.de>,
 Michael Walle <michael@walle.cc>, Guan Xuetao <gxt@mprc.pku.edu.cn>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Thomas Huth <thuth@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Greg Kurz <groug@kaod.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Max Filippov <jcmvbkbc@gmail.com>
Subject: [PATCH v2 15/17] cpu: Move CPUClass::get_paging_enabled to
 SysemuCPUOps
Date: Mon,  1 Mar 2021 22:51:08 +0100
Message-Id: <20210301215110.772346-16-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210301215110.772346-1-f4bug@amsat.org>
References: <20210301215110.772346-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x52f.google.com
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
X-List-Received-Date: Mon, 01 Mar 2021 21:53:07 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/core/cpu.h            | 2 --
 include/hw/core/sysemu-cpu-ops.h | 4 ++++
 hw/core/cpu.c                    | 4 ++--
 target/i386/cpu.c                | 4 +++-
 4 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 8af78cdde23..960846d2b64 100644
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
index d33ee9f831e..3519cef8fba 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -7157,12 +7157,14 @@ static int64_t x86_cpu_get_arch_id(CPUState *cs)
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
@@ -7389,6 +7391,7 @@ static Property x86_cpu_properties[] = {
 #ifndef CONFIG_USER_ONLY
 static struct SysemuCPUOps i386_sysemu_ops = {
     .get_memory_mapping = x86_cpu_get_memory_mapping,
+    .get_paging_enabled = x86_cpu_get_paging_enabled,
     .get_phys_page_attrs_debug = x86_cpu_get_phys_page_attrs_debug,
     .asidx_from_attrs = x86_asidx_from_attrs,
     .get_crash_info = x86_cpu_get_crash_info,
@@ -7429,7 +7432,6 @@ static void x86_cpu_common_class_init(ObjectClass *oc, void *data)
     cc->gdb_read_register = x86_cpu_gdb_read_register;
     cc->gdb_write_register = x86_cpu_gdb_write_register;
     cc->get_arch_id = x86_cpu_get_arch_id;
-    cc->get_paging_enabled = x86_cpu_get_paging_enabled;
 
 #ifndef CONFIG_USER_ONLY
     cc->sysemu_ops = &i386_sysemu_ops;
-- 
2.26.2


