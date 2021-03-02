Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lH6Up-0007S3-De
	for mharc-qemu-riscv@gnu.org; Tue, 02 Mar 2021 09:59:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lH6Um-0007Jg-9H; Tue, 02 Mar 2021 09:59:32 -0500
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:37055)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lH6Uk-0005HD-LG; Tue, 02 Mar 2021 09:59:32 -0500
Received: by mail-ed1-x52f.google.com with SMTP id d13so20525891edp.4;
 Tue, 02 Mar 2021 06:59:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WaQE95EZW9w0jtG86ZuVDK+2I8kDeUh8Unqfgkk9oi8=;
 b=pS9zqPXvVi2IsPH3cQF4J3BrAvlghDAENophKplQx6dJHds165ToSPtPjrZA9S4iIS
 xXhsk+2oVXOVkYUW6y59HMcJjih/qpQ2OAKxePlx2HGZDExyecQNXYJTkJql0kqN75NC
 Sz4qwRG7RGEv0LNS+0EV0/8mW+Xd8Tm7DoFd/Tm3lP/a2xAAc+7co0ChT1ucf/zkDHS/
 240cpQ1Ml+YP5cPGyAuvpP/kjKKyKA8qrGceeSeETR1QHgtizWJQvEKRqvT1w/Itsxo9
 bNEVECJ48XqUvpDoU2snIcMjHhT9I5JGvLxGeBdo8Jahz+as473Si4hRFAES62yGP+lr
 wNiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=WaQE95EZW9w0jtG86ZuVDK+2I8kDeUh8Unqfgkk9oi8=;
 b=f/Rremtjw3NUysGeR6W7O4gqDD0+F8b0wiim36G+ytes0XtVLeDNO/gkB0IwSynjIC
 7dxc9RZk0SiGuHRzBWd7vdMbLEGJqUEaF+yg2OzusjYbC38TY9eoow3PFvsxa46gatpa
 w7HGwW2QpHqKQ6ako+l2j3MOfVciHT9f+AmwrcIdGxdfLEOewUZgsFdOOzisJ+cfqVVh
 z5u4X+i3qcXMBIPSZhYN70Uftkv+qqVfDbGKwkSdwv+8+/GvtNkied9FiiW6F4HMoNh7
 oCSqixhG7OPwxuL0sYvqt5huEjuQ1BYiw/Axz0XIpzy5HrNwd7l5XEq1xoZFavYlNYp5
 9bDA==
X-Gm-Message-State: AOAM531WeDFrTY/8H6fYphLOWpnbiPuc6Tmys3ASNAa1TAfhyaG44D22
 czMoU4guwbimzq1tkw2yaHMJjq5+qII=
X-Google-Smtp-Source: ABdhPJyuu08Fn+7nuWgEjISzbV1FOD+wd+HqiaEdluECsuvtSAyXtctebTw9gNKEoWtO5LaV1Gs0Dg==
X-Received: by 2002:a05:6402:158d:: with SMTP id
 c13mr20719331edv.297.1614697167427; 
 Tue, 02 Mar 2021 06:59:27 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id q16sm9321215ejd.15.2021.03.02.06.59.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Mar 2021 06:59:26 -0800 (PST)
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
Subject: [PATCH v3 09/27] cpu: Move CPUClass::virtio_is_big_endian to
 SysemuCPUOps
Date: Tue,  2 Mar 2021 15:58:00 +0100
Message-Id: <20210302145818.1161461-10-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210302145818.1161461-1-f4bug@amsat.org>
References: <20210302145818.1161461-1-f4bug@amsat.org>
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
X-List-Received-Date: Tue, 02 Mar 2021 14:59:33 -0000

VirtIO devices are only meaningful with system emulation.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/core/cpu.h            | 5 -----
 include/hw/core/sysemu-cpu-ops.h | 8 ++++++++
 hw/core/cpu.c                    | 4 ++--
 target/arm/cpu.c                 | 2 +-
 target/ppc/translate_init.c.inc  | 4 +---
 5 files changed, 12 insertions(+), 11 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 471c99d9f04..dfb50b60128 100644
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
index e03977e4c3c..2bad6307cce 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -2262,6 +2262,7 @@ static gchar *arm_gdb_arch_name(CPUState *cs)
 
 #ifndef CONFIG_USER_ONLY
 static struct SysemuCPUOps arm_sysemu_ops = {
+    .virtio_is_big_endian = arm_cpu_virtio_is_big_endian,
     .vmsd = &vmstate_arm_cpu,
 };
 #endif
@@ -2305,7 +2306,6 @@ static void arm_cpu_class_init(ObjectClass *oc, void *data)
 #ifndef CONFIG_USER_ONLY
     cc->get_phys_page_attrs_debug = arm_cpu_get_phys_page_attrs_debug;
     cc->asidx_from_attrs = arm_asidx_from_attrs;
-    cc->virtio_is_big_endian = arm_cpu_virtio_is_big_endian;
     cc->write_elf64_note = arm_cpu_write_elf64_note;
     cc->write_elf32_note = arm_cpu_write_elf32_note;
     cc->sysemu_ops = &arm_sysemu_ops;
diff --git a/target/ppc/translate_init.c.inc b/target/ppc/translate_init.c.inc
index b5ed1dbfd26..2dd4f47adbb 100644
--- a/target/ppc/translate_init.c.inc
+++ b/target/ppc/translate_init.c.inc
@@ -10845,6 +10845,7 @@ static Property ppc_cpu_properties[] = {
 
 #ifndef CONFIG_USER_ONLY
 static struct SysemuCPUOps ppc_sysemu_ops = {
+    .virtio_is_big_endian = ppc_cpu_is_big_endian,
     .vmsd = &vmstate_ppc_cpu,
 };
 #endif
@@ -10913,9 +10914,6 @@ static void ppc_cpu_class_init(ObjectClass *oc, void *data)
     cc->gdb_core_xml_file = "power64-core.xml";
 #else
     cc->gdb_core_xml_file = "power-core.xml";
-#endif
-#ifndef CONFIG_USER_ONLY
-    cc->virtio_is_big_endian = ppc_cpu_is_big_endian;
 #endif
     cc->disas_set_info = ppc_disas_set_info;
 
-- 
2.26.2


