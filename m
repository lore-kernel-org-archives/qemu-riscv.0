Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lFg47-0005JF-Cy
	for mharc-qemu-riscv@gnu.org; Fri, 26 Feb 2021 11:34:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lFg3w-00051p-Pk; Fri, 26 Feb 2021 11:33:58 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:39396)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lFg3s-0007ph-8g; Fri, 26 Feb 2021 11:33:54 -0500
Received: by mail-wm1-x335.google.com with SMTP id u125so8315968wmg.4;
 Fri, 26 Feb 2021 08:33:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2B3Q/ylS5ZNA1mrgb7ev39AiksBcxa1Cjiz4dKBsJpg=;
 b=SRMILkPUFjVtR86aa3EyK1deYZtGw3fRznVtQ3u0RMONqxpvpx3ctxR1gPPgP35PYt
 CVClTcxxdrLzUz5a5pEkfThbVAM/dxYOI/fDWI1u1CNV6TtR2PjfpcwIXB6qBE2a/S/m
 FIBKlQRCKakqDLASCb7sme3oZaphogi0YsmdCS2SIt1TBh/nCd5pAfGhjOn2RcJtflPC
 wHB1R48ZNlgWWiGks0yCIvJc6O/7aXFdbnjdWdczF/mmAbwOaWozuV4Njab5NW7S1Xq1
 XVoq4TL0IG04qCxl4mtyNq0ZKlTDhyw41gPXjp1qxEzwGKGbT8ei3U/mCaq/3SSHermc
 lOXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=2B3Q/ylS5ZNA1mrgb7ev39AiksBcxa1Cjiz4dKBsJpg=;
 b=Ac/PWzb+2IkiS63dAFTPyFhohqKxstV7rnvHXU3TMbmRSsBRNr7VEfKNdSKLJvhUu/
 QmJJ8OomRNKcg5TOZq0FnpYAjvgLsm7bbmZgAyk28KGXDe9aHvQFnLAMFI1GuFInuLEV
 dybOAtFzU4bnN30tt4Pod/yflVjqlvk6FOtyM8rtfpqME19uzWfd+WuJLpxm83OrJSL+
 vSb6znIpQIk8qN0f8XOwgWPjQdFQAzToA03Scv+qtCS4gj3Wnco/qKSzQUjeSVgr5OlN
 zG2rDbnKlhkHJSVnkoG7XbgU9qMhw///Vny9PnPccFSNAHk4Evhp5NvzUyGBNq477mNH
 XAEA==
X-Gm-Message-State: AOAM531bSE3UTXJ6yE+Vg5pvBSlnu/xwZ5eRR+i1LaAomQgVGgaNCu/U
 6pk+dssDIOnpK4QIXjS5w3An5Okwamo=
X-Google-Smtp-Source: ABdhPJxoLdAPZ0Ft6m7N2DlNxzLfZNEnULVAX158KT3cXTWU060IUvNJcDv/7GGgqlyNaOfQPTBGvw==
X-Received: by 2002:a05:600c:2298:: with SMTP id
 24mr3790497wmf.136.1614357228294; 
 Fri, 26 Feb 2021 08:33:48 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id t14sm14686281wru.64.2021.02.26.08.33.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Feb 2021 08:33:47 -0800 (PST)
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
Subject: [PATCH 12/16] cpu: Move CPUClass::asidx_from_attrs to
 CPUSystemOperations
Date: Fri, 26 Feb 2021 17:32:23 +0100
Message-Id: <20210226163227.4097950-13-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210226163227.4097950-1-f4bug@amsat.org>
References: <20210226163227.4097950-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x335.google.com
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
X-List-Received-Date: Fri, 26 Feb 2021 16:34:01 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/core/cpu.h | 8 +++++---
 hw/core/cpu.c         | 4 ++--
 target/arm/cpu.c      | 2 +-
 target/i386/cpu.c     | 2 +-
 4 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index e8c2e9af3bb..fc3c4c217b1 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -84,6 +84,11 @@ struct AccelCPUClass;
  * struct CPUSystemOperations: System operations specific to a CPU class
  */
 typedef struct CPUSystemOperations {
+    /**
+     * @asidx_from_attrs: Callback to return the CPU AddressSpace to use for
+     *       a memory access with the specified memory transaction attributes.
+     */
+    int (*asidx_from_attrs)(CPUState *cpu, MemTxAttrs attrs);
     /**
      * @get_crash_info: Callback for reporting guest crash information in
      * GUEST_PANICKED events.
@@ -153,8 +158,6 @@ typedef struct CPUSystemOperations {
  *       associated memory transaction attributes to use for the access.
  *       CPUs which use memory transaction attributes should implement this
  *       instead of get_phys_page_debug.
- * @asidx_from_attrs: Callback to return the CPU AddressSpace to use for
- *       a memory access with the specified memory transaction attributes.
  * @gdb_read_register: Callback for letting GDB read a register.
  * @gdb_write_register: Callback for letting GDB write a register.
  * @gdb_num_core_regs: Number of core registers accessible to GDB.
@@ -196,7 +199,6 @@ struct CPUClass {
     hwaddr (*get_phys_page_debug)(CPUState *cpu, vaddr addr);
     hwaddr (*get_phys_page_attrs_debug)(CPUState *cpu, vaddr addr,
                                         MemTxAttrs *attrs);
-    int (*asidx_from_attrs)(CPUState *cpu, MemTxAttrs attrs);
     int (*gdb_read_register)(CPUState *cpu, GByteArray *buf, int reg);
     int (*gdb_write_register)(CPUState *cpu, uint8_t *buf, int reg);
 
diff --git a/hw/core/cpu.c b/hw/core/cpu.c
index 3dc8faf6086..d38eda36bc3 100644
--- a/hw/core/cpu.c
+++ b/hw/core/cpu.c
@@ -116,8 +116,8 @@ int cpu_asidx_from_attrs(CPUState *cpu, MemTxAttrs attrs)
     CPUClass *cc = CPU_GET_CLASS(cpu);
     int ret = 0;
 
-    if (cc->asidx_from_attrs) {
-        ret = cc->asidx_from_attrs(cpu, attrs);
+    if (cc->system_ops.asidx_from_attrs) {
+        ret = cc->system_ops.asidx_from_attrs(cpu, attrs);
         assert(ret < cpu->num_ases && ret >= 0);
     }
     return ret;
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 4941a651e64..86af15b0625 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -2298,7 +2298,7 @@ static void arm_cpu_class_init(ObjectClass *oc, void *data)
     cc->gdb_write_register = arm_cpu_gdb_write_register;
 #ifndef CONFIG_USER_ONLY
     cc->get_phys_page_attrs_debug = arm_cpu_get_phys_page_attrs_debug;
-    cc->asidx_from_attrs = arm_asidx_from_attrs;
+    cc->system_ops.asidx_from_attrs = arm_asidx_from_attrs;
     cc->system_ops.vmsd = &vmstate_arm_cpu;
     cc->system_ops.virtio_is_big_endian = arm_cpu_virtio_is_big_endian;
     cc->system_ops.write_elf64_note = arm_cpu_write_elf64_note;
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index c34d41d4c79..36b34eee62f 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -7418,7 +7418,7 @@ static void x86_cpu_common_class_init(ObjectClass *oc, void *data)
     cc->get_paging_enabled = x86_cpu_get_paging_enabled;
 
 #ifndef CONFIG_USER_ONLY
-    cc->asidx_from_attrs = x86_asidx_from_attrs;
+    cc->system_ops.asidx_from_attrs = x86_asidx_from_attrs;
     cc->get_memory_mapping = x86_cpu_get_memory_mapping;
     cc->get_phys_page_attrs_debug = x86_cpu_get_phys_page_attrs_debug;
     cc->system_ops.get_crash_info = x86_cpu_get_crash_info;
-- 
2.26.2


