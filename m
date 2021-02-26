Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lFg40-000546-VT
	for mharc-qemu-riscv@gnu.org; Fri, 26 Feb 2021 11:34:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lFg3Z-0004tM-3B; Fri, 26 Feb 2021 11:33:33 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:40923)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lFg3W-0007kM-OX; Fri, 26 Feb 2021 11:33:32 -0500
Received: by mail-wr1-x429.google.com with SMTP id d11so9156767wrj.7;
 Fri, 26 Feb 2021 08:33:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=R56Oi6nr8e9B0WiiV+if7tvwfnjn9mxxVgPa8IGhuYc=;
 b=GIK9QnVGxJj+2JyxxpSs2kwEIQSaQgByN23qMxB9CnyIZlfO11v5Cy1mdDF7/FZg9S
 hT+clxlxxrXwtpxbNMie7alBa+EdYWAPFEAIaFZlxCQ4PMR4QUAAbyeidWQs4SugWkBB
 NkiTYrLn8oYYy6TZzgU6+066q+Z5gvVDK2YqIxJPrMgcsA2OjQTLDskYj5SgvzExQkfi
 MWS5BPvufyr6ibMRkbheWeD1oYk1KUxGr2CNrhDeezx0guNLLylObuwgI+JZL8gary51
 h5FgfO14/4kLCyrquBEp/OMkE2yq+6lPMzxvemYCBDVaTIokK+szjW0RmD93Pv6362SI
 NmmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=R56Oi6nr8e9B0WiiV+if7tvwfnjn9mxxVgPa8IGhuYc=;
 b=nZnpXKX2e+eaOhhnKjLxLwFsXsPnDeUJ3cBvNRsMfthh0HMQynACX3+zdFlYyLLtba
 cJ/KjXPtXViKq2s9TvbRrhTmgYfiQzZzIBxrpH/r7U4+pYvqeZ96LC3hpSGnAEoa3dAF
 stsAC++dj3Ohux50eyv+o53fxCqKNAbE9T5A5diRJXkDzuHplFEmGObYrZHgxmUVZNom
 +WLP2G9UlgjMJHTeQ6JlbZpIKMoCn3pVh463EKYlXnLB59l2LzCtSvrwlJ46Q/cfeVtF
 zGM2Xdj7JUR0nCPUeI3l1UFkvAgafhlb6ql9T45ldyOQKByi9XzltL1IRd0G0jhgPTOU
 /elg==
X-Gm-Message-State: AOAM530BdVL/C/gMC+U3aUUpOT0W0VV/HrYeMExt7FxY/Ey5z75goVJN
 ceICxt/2xCOgDKLbhkw1NMUhDan4IPY=
X-Google-Smtp-Source: ABdhPJxDb1NSzZxAVDXyJpmM/HE7k20qbNt0LkezV0LwNuf9xxvYg+GA9NeqMNOj3xAo6Ws07C81uQ==
X-Received: by 2002:a5d:570c:: with SMTP id a12mr4117870wrv.209.1614357205310; 
 Fri, 26 Feb 2021 08:33:25 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id m6sm14242583wrv.73.2021.02.26.08.33.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Feb 2021 08:33:24 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Sarah Harris <S.E.Harris@kent.ac.uk>,
 Paolo Bonzini <pbonzini@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, qemu-s390x@nongnu.org,
 Michael Rolnik <mrolnik@gmail.com>, qemu-ppc@nongnu.org,
 Marek Vasut <marex@denx.de>, Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Michael Walle <michael@walle.cc>, Guan Xuetao <gxt@mprc.pku.edu.cn>,
 Laurent Vivier <laurent@vivier.eu>, Anthony Green <green@moxielogic.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, David Hildenbrand <david@redhat.com>,
 qemu-riscv@nongnu.org, David Gibson <david@gibson.dropbear.id.au>,
 Peter Maydell <peter.maydell@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Chris Wulff <crwulff@gmail.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Claudio Fontana <cfontana@suse.de>, Thomas Huth <thuth@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Greg Kurz <groug@kaod.org>,
 Stafford Horne <shorne@gmail.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Subject: [PATCH 09/16] cpu: Move CPUClass::virtio_is_big_endian to
 CPUSystemOperations
Date: Fri, 26 Feb 2021 17:32:20 +0100
Message-Id: <20210226163227.4097950-10-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210226163227.4097950-1-f4bug@amsat.org>
References: <20210226163227.4097950-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
X-List-Received-Date: Fri, 26 Feb 2021 16:33:41 -0000

VirtIO devices are only meaningful with system emulation.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/core/cpu.h           | 13 ++++++++-----
 hw/core/cpu.c                   |  4 ++--
 target/arm/cpu.c                |  2 +-
 target/ppc/translate_init.c.inc |  2 +-
 4 files changed, 12 insertions(+), 9 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index bd1cb3b0d37..fe85a1b81e6 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -84,6 +84,14 @@ struct AccelCPUClass;
  * struct CPUSystemOperations: System operations specific to a CPU class
  */
 typedef struct CPUSystemOperations {
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
@@ -97,10 +105,6 @@ typedef struct CPUSystemOperations {
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
@@ -159,7 +163,6 @@ struct CPUClass {
 
     int reset_dump_flags;
     bool (*has_work)(CPUState *cpu);
-    bool (*virtio_is_big_endian)(CPUState *cpu);
     int (*memory_rw_debug)(CPUState *cpu, vaddr addr,
                            uint8_t *buf, int len, bool is_write);
     void (*dump_state)(CPUState *cpu, FILE *, int flags);
diff --git a/hw/core/cpu.c b/hw/core/cpu.c
index 5abf8bed2e4..86b65624a9e 100644
--- a/hw/core/cpu.c
+++ b/hw/core/cpu.c
@@ -204,8 +204,8 @@ bool cpu_virtio_is_big_endian(CPUState *cpu)
 {
     CPUClass *cc = CPU_GET_CLASS(cpu);
 
-    if (cc->virtio_is_big_endian) {
-        return cc->virtio_is_big_endian(cpu);
+    if (cc->system_ops.virtio_is_big_endian) {
+        return cc->system_ops.virtio_is_big_endian(cpu);
     }
     return target_words_bigendian();
 }
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 11505e1db10..3cbb17a5879 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -2300,7 +2300,7 @@ static void arm_cpu_class_init(ObjectClass *oc, void *data)
     cc->get_phys_page_attrs_debug = arm_cpu_get_phys_page_attrs_debug;
     cc->asidx_from_attrs = arm_asidx_from_attrs;
     cc->system_ops.vmsd = &vmstate_arm_cpu;
-    cc->virtio_is_big_endian = arm_cpu_virtio_is_big_endian;
+    cc->system_ops.virtio_is_big_endian = arm_cpu_virtio_is_big_endian;
     cc->write_elf64_note = arm_cpu_write_elf64_note;
     cc->write_elf32_note = arm_cpu_write_elf32_note;
 #endif
diff --git a/target/ppc/translate_init.c.inc b/target/ppc/translate_init.c.inc
index 65c45e7870a..2e5c272190b 100644
--- a/target/ppc/translate_init.c.inc
+++ b/target/ppc/translate_init.c.inc
@@ -10909,7 +10909,7 @@ static void ppc_cpu_class_init(ObjectClass *oc, void *data)
     cc->gdb_core_xml_file = "power-core.xml";
 #endif
 #ifndef CONFIG_USER_ONLY
-    cc->virtio_is_big_endian = ppc_cpu_is_big_endian;
+    cc->system_ops.virtio_is_big_endian = ppc_cpu_is_big_endian;
 #endif
     cc->disas_set_info = ppc_disas_set_info;
 
-- 
2.26.2


