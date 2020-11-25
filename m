Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ki1qv-0000ld-Tb
	for mharc-qemu-riscv@gnu.org; Wed, 25 Nov 2020 15:57:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1ki1qr-0000jf-ER
 for qemu-riscv@nongnu.org; Wed, 25 Nov 2020 15:57:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27653)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1ki1qm-0003S8-5Z
 for qemu-riscv@nongnu.org; Wed, 25 Nov 2020 15:57:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606337835;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nRCLA0xq815Y9v0x/1g5uhpoFl19bKTWQZqVIylZffQ=;
 b=fl2f1vjD6CSmjv4AIAVdcLoccdFZLI7DeVOe72k7wqUQ/RjQSIgukwx++NnnbkJ6MLTDFc
 /cPp7KHXVQX2wYkhPwDl3kWVP3JxC1o7Sn426f5SJVQfW726Bjnxk9y5SigJX+hWaK3Buc
 k6PO2s6kA8epNKIoHHO6R3hjIKfXO/I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-99-xdv5yKIONGOtWvCQQzov7g-1; Wed, 25 Nov 2020 15:57:11 -0500
X-MC-Unique: xdv5yKIONGOtWvCQQzov7g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5F02E108BC03;
 Wed, 25 Nov 2020 20:57:08 +0000 (UTC)
Received: from localhost (unknown [10.10.67.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B700F5D6AC;
 Wed, 25 Nov 2020 20:56:57 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Markus Armbruster <armbru@redhat.com>,
 David Hildenbrand <david@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Subject: [PATCH v2 5/6] Remove unnecessary usage of arch_init.h
Date: Wed, 25 Nov 2020 15:56:35 -0500
Message-Id: <20201125205636.3305257-6-ehabkost@redhat.com>
In-Reply-To: <20201125205636.3305257-1-ehabkost@redhat.com>
References: <20201125205636.3305257-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Wed, 25 Nov 2020 20:57:22 -0000

The only declarations in arch_init.h are the `arch_type` variable
and the QEMU_ARCH_* constants.  Stop including arch_init.h from
code that don't use neither.

Patch generated automatically using the command:

 $ sed -i -e '/#include "sysemu.arch_init.h"/d' \
   $(comm -23 \
      <(git grep -l arch_init.h | sort) \
      <((git grep -l -w 'arch_type'; g grep -l QEMU_ARCH;) | sort -u))

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
Cc: Richard Henderson <richard.henderson@linaro.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Eduardo Habkost <ehabkost@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Cc: "Hervé Poussineau" <hpoussin@reactos.org>
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
Cc: "Philippe Mathieu-Daudé" <f4bug@amsat.org>
Cc: Aurelien Jarno <aurelien@aurel32.net>
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: David Gibson <david@gibson.dropbear.id.au>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>
Cc: Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Cc: Markus Armbruster <armbru@redhat.com>
Cc: David Hildenbrand <david@redhat.com>
Cc: Cornelia Huck <cohuck@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>
Cc: Halil Pasic <pasic@linux.ibm.com>
Cc: Christian Borntraeger <borntraeger@de.ibm.com>
Cc: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org
Cc: qemu-riscv@nongnu.org
Cc: qemu-s390x@nongnu.org
---
 accel/accel.c                   | 1 -
 hw/i386/pc.c                    | 1 -
 hw/i386/pc_piix.c               | 1 -
 hw/i386/pc_q35.c                | 1 -
 hw/mips/jazz.c                  | 1 -
 hw/mips/malta.c                 | 1 -
 hw/ppc/prep.c                   | 1 -
 hw/riscv/sifive_e.c             | 1 -
 hw/riscv/sifive_u.c             | 1 -
 hw/riscv/spike.c                | 1 -
 hw/riscv/virt.c                 | 1 -
 monitor/qmp-cmds.c              | 1 -
 target/i386/cpu.c               | 1 -
 target/s390x/cpu.c              | 1 -
 target/s390x/cpu_models.c       | 1 -
 target/ppc/translate_init.c.inc | 1 -
 16 files changed, 16 deletions(-)

diff --git a/accel/accel.c b/accel/accel.c
index 4a64a2b38a..3e567a001f 100644
--- a/accel/accel.c
+++ b/accel/accel.c
@@ -26,7 +26,6 @@
 #include "qemu/osdep.h"
 #include "sysemu/accel.h"
 #include "hw/boards.h"
-#include "sysemu/arch_init.h"
 #include "sysemu/sysemu.h"
 #include "qom/object.h"
 
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 17b514d1da..48a5fb0798 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -67,7 +67,6 @@
 #include "ui/qemu-spice.h"
 #include "exec/memory.h"
 #include "exec/address-spaces.h"
-#include "sysemu/arch_init.h"
 #include "qemu/bitmap.h"
 #include "qemu/config-file.h"
 #include "qemu/error-report.h"
diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 13d1628f13..95ee1f39d8 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -44,7 +44,6 @@
 #include "hw/kvm/clock.h"
 #include "sysemu/sysemu.h"
 #include "hw/sysbus.h"
-#include "sysemu/arch_init.h"
 #include "hw/i2c/smbus_eeprom.h"
 #include "hw/xen/xen-x86.h"
 #include "exec/memory.h"
diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index a3f4959c43..cf85b240bc 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -31,7 +31,6 @@
 #include "qemu/osdep.h"
 #include "qemu/units.h"
 #include "hw/loader.h"
-#include "sysemu/arch_init.h"
 #include "hw/i2c/smbus_eeprom.h"
 #include "hw/rtc/mc146818rtc.h"
 #include "sysemu/kvm.h"
diff --git a/hw/mips/jazz.c b/hw/mips/jazz.c
index 71448f72ac..6fee2a4ec0 100644
--- a/hw/mips/jazz.c
+++ b/hw/mips/jazz.c
@@ -34,7 +34,6 @@
 #include "hw/isa/isa.h"
 #include "hw/block/fdc.h"
 #include "sysemu/sysemu.h"
-#include "sysemu/arch_init.h"
 #include "hw/boards.h"
 #include "net/net.h"
 #include "hw/scsi/esp.h"
diff --git a/hw/mips/malta.c b/hw/mips/malta.c
index 9d1a3b50b7..6b4387c179 100644
--- a/hw/mips/malta.c
+++ b/hw/mips/malta.c
@@ -38,7 +38,6 @@
 #include "hw/mips/cpudevs.h"
 #include "hw/pci/pci.h"
 #include "sysemu/sysemu.h"
-#include "sysemu/arch_init.h"
 #include "qemu/log.h"
 #include "hw/mips/bios.h"
 #include "hw/ide.h"
diff --git a/hw/ppc/prep.c b/hw/ppc/prep.c
index 4a0cb434a6..5c9ec45749 100644
--- a/hw/ppc/prep.c
+++ b/hw/ppc/prep.c
@@ -43,7 +43,6 @@
 #include "hw/rtc/mc146818rtc.h"
 #include "hw/isa/pc87312.h"
 #include "hw/qdev-properties.h"
-#include "sysemu/arch_init.h"
 #include "sysemu/kvm.h"
 #include "sysemu/qtest.h"
 #include "sysemu/reset.h"
diff --git a/hw/riscv/sifive_e.c b/hw/riscv/sifive_e.c
index 59bac4cc9a..6185872127 100644
--- a/hw/riscv/sifive_e.c
+++ b/hw/riscv/sifive_e.c
@@ -46,7 +46,6 @@
 #include "hw/intc/sifive_plic.h"
 #include "hw/misc/sifive_e_prci.h"
 #include "chardev/char.h"
-#include "sysemu/arch_init.h"
 #include "sysemu/sysemu.h"
 #include "exec/address-spaces.h"
 
diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index 2f19a9cda2..53b62284ab 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -53,7 +53,6 @@
 #include "hw/intc/sifive_plic.h"
 #include "chardev/char.h"
 #include "net/eth.h"
-#include "sysemu/arch_init.h"
 #include "sysemu/device_tree.h"
 #include "sysemu/runstate.h"
 #include "sysemu/sysemu.h"
diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
index facac6e7d2..660fcfcfed 100644
--- a/hw/riscv/spike.c
+++ b/hw/riscv/spike.c
@@ -38,7 +38,6 @@
 #include "hw/char/riscv_htif.h"
 #include "hw/intc/sifive_clint.h"
 #include "chardev/char.h"
-#include "sysemu/arch_init.h"
 #include "sysemu/device_tree.h"
 #include "sysemu/qtest.h"
 #include "sysemu/sysemu.h"
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 25cea7aa67..cfce799ffe 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -37,7 +37,6 @@
 #include "hw/intc/sifive_plic.h"
 #include "hw/misc/sifive_test.h"
 #include "chardev/char.h"
-#include "sysemu/arch_init.h"
 #include "sysemu/device_tree.h"
 #include "sysemu/sysemu.h"
 #include "hw/pci/pci.h"
diff --git a/monitor/qmp-cmds.c b/monitor/qmp-cmds.c
index ac5b8a97d7..64ed976fac 100644
--- a/monitor/qmp-cmds.c
+++ b/monitor/qmp-cmds.c
@@ -26,7 +26,6 @@
 #include "ui/vnc.h"
 #include "sysemu/kvm.h"
 #include "sysemu/runstate.h"
-#include "sysemu/arch_init.h"
 #include "sysemu/blockdev.h"
 #include "sysemu/block-backend.h"
 #include "qapi/error.h"
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 5a8c96072e..e5a42a8663 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -44,7 +44,6 @@
 #include "qapi/qmp/qerror.h"
 #include "qapi/visitor.h"
 #include "qom/qom-qobject.h"
-#include "sysemu/arch_init.h"
 #include "qapi/qapi-commands-machine-target.h"
 
 #include "standard-headers/asm-x86/kvm_para.h"
diff --git a/target/s390x/cpu.c b/target/s390x/cpu.c
index 7b66718c44..c1e336c760 100644
--- a/target/s390x/cpu.c
+++ b/target/s390x/cpu.c
@@ -39,7 +39,6 @@
 #ifndef CONFIG_USER_ONLY
 #include "hw/s390x/pv.h"
 #include "hw/boards.h"
-#include "sysemu/arch_init.h"
 #include "sysemu/sysemu.h"
 #include "sysemu/tcg.h"
 #endif
diff --git a/target/s390x/cpu_models.c b/target/s390x/cpu_models.c
index b5abff8bef..04896560ad 100644
--- a/target/s390x/cpu_models.c
+++ b/target/s390x/cpu_models.c
@@ -25,7 +25,6 @@
 #include "qapi/qobject-input-visitor.h"
 #include "qapi/qmp/qdict.h"
 #ifndef CONFIG_USER_ONLY
-#include "sysemu/arch_init.h"
 #include "hw/pci/pci.h"
 #endif
 #include "qapi/qapi-commands-machine-target.h"
diff --git a/target/ppc/translate_init.c.inc b/target/ppc/translate_init.c.inc
index 78cc8f043b..df66852a74 100644
--- a/target/ppc/translate_init.c.inc
+++ b/target/ppc/translate_init.c.inc
@@ -21,7 +21,6 @@
 #include "disas/dis-asm.h"
 #include "exec/gdbstub.h"
 #include "kvm_ppc.h"
-#include "sysemu/arch_init.h"
 #include "sysemu/cpus.h"
 #include "sysemu/hw_accel.h"
 #include "sysemu/tcg.h"
-- 
2.28.0


