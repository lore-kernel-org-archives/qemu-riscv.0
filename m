Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iCRAW-0003OB-IG
	for mharc-qemu-riscv@gnu.org; Mon, 23 Sep 2019 12:26:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57712)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <vsementsov@virtuozzo.com>) id 1iCQxw-0002le-3V
 for qemu-riscv@nongnu.org; Mon, 23 Sep 2019 12:13:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <vsementsov@virtuozzo.com>) id 1iCQxu-00047J-KQ
 for qemu-riscv@nongnu.org; Mon, 23 Sep 2019 12:13:31 -0400
Received: from relay.sw.ru ([185.231.240.75]:39506)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
 id 1iCQxM-0003a7-Gv; Mon, 23 Sep 2019 12:12:56 -0400
Received: from [10.94.3.0] (helo=kvm.qa.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92.2)
 (envelope-from <vsementsov@virtuozzo.com>)
 id 1iCQx1-0001Fp-PU; Mon, 23 Sep 2019 19:12:35 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: kraxel@redhat.com, berrange@redhat.com, arei.gonglei@huawei.com,
 ehabkost@redhat.com, imammedo@redhat.com, lvivier@redhat.com,
 amit@kernel.org, kwolf@redhat.com, mreitz@redhat.com, ari@tuxera.com,
 pavel.dovgaluk@ispras.ru, pbonzini@redhat.com, stefanha@redhat.com,
 jsnow@redhat.com, sw@weilnetz.de, fam@euphon.net, ronniesahlberg@gmail.com,
 pl@kamp.de, eblake@redhat.com, den@openvz.org, armbru@redhat.com,
 berto@igalia.com, dillaman@redhat.com, wencongyang2@huawei.com,
 xiechanglong.d@gmail.com, namei.unix@gmail.com, rjones@redhat.com,
 codyprime@gmail.com, marcandre.lureau@redhat.com, rth@twiddle.net,
 groug@kaod.org, mst@redhat.com, marcel.apfelbaum@gmail.com,
 b.galvani@gmail.com, peter.maydell@linaro.org,
 Andrew.Baumann@microsoft.com, philmd@redhat.com, antonynpavlov@gmail.com,
 jcd@tribudubois.net, peter.chubb@nicta.com.au, sundeep.lkml@gmail.com,
 joel@jms.id.au, eric.auger@redhat.com, alistair@alistair23.me,
 balrogg@gmail.com, edgar.iglesias@gmail.com, sstabellini@kernel.org,
 anthony.perard@citrix.com, paul.durrant@citrix.com, pburton@wavecomp.com,
 arikalo@wavecomp.com, clg@kaod.org, andrew@aj.id.au, crwulff@gmail.com,
 marex@denx.de, david@gibson.dropbear.id.au, pasic@linux.ibm.com,
 cohuck@redhat.com, borntraeger@de.ibm.com, hpoussin@reactos.org,
 xiaoguangrong.eric@gmail.com, aurelien@aurel32.net, amarkovic@wavecomp.com,
 mark.cave-ayland@ilande.co.uk, jasowang@redhat.com, lersek@redhat.com,
 palmer@sifive.com, sagark@eecs.berkeley.edu,
 kbastian@mail.uni-paderborn.de, david@redhat.com, thuth@redhat.com,
 farman@linux.ibm.com, walling@linux.ibm.com, hare@suse.com,
 michael@walle.cc, atar4qemu@gmail.com, stefanb@linux.ibm.com,
 samuel.thibault@ens-lyon.org, akrowiak@linux.ibm.com, pmorel@linux.ibm.com,
 alex.williamson@redhat.com, mdroth@linux.vnet.ibm.com,
 zhang.zhanghailiang@huawei.com, quintela@redhat.com, dgilbert@redhat.com,
 rizzo@iet.unipi.it, g.lettieri@iet.unipi.it, v.maffione@gmail.com,
 jan.kiszka@siemens.com, green@moxielogic.com, shorne@gmail.com,
 gxt@mprc.pku.edu.cn, jcmvbkbc@gmail.com, qemu-block@nongnu.org,
 integration@gluster.org, sheepdog@lists.wpkg.org, qemu-arm@nongnu.org,
 xen-devel@lists.xenproject.org, qemu-ppc@nongnu.org, qemu-s390x@nongnu.org,
 qemu-riscv@nongnu.org, vsementsov@virtuozzo.com
Subject: [RFC v2 9/9] fix-compilation: includes
Date: Mon, 23 Sep 2019 19:12:31 +0300
Message-Id: <20190923161231.22028-10-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190923161231.22028-1-vsementsov@virtuozzo.com>
References: <20190923161231.22028-1-vsementsov@virtuozzo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 185.231.240.75
X-Mailman-Approved-At: Mon, 23 Sep 2019 12:26:31 -0400
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
X-List-Received-Date: Mon, 23 Sep 2019 16:13:34 -0000

Hmm. Should we allow empty stubs with errp parameter without calling
new macro?

Or, just apply this commit before auto-generated commit.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 target/ppc/kvm_ppc.h        | 2 ++
 target/s390x/cpu_models.h   | 1 +
 hw/i386/kvm/apic.c          | 1 +
 hw/misc/arm11scu.c          | 1 +
 hw/misc/mps2-scc.c          | 1 +
 hw/pci-bridge/dec.c         | 1 +
 qapi/qapi-dealloc-visitor.c | 1 +
 stubs/xen-hvm.c             | 1 +
 8 files changed, 9 insertions(+)

diff --git a/target/ppc/kvm_ppc.h b/target/ppc/kvm_ppc.h
index 807c245e90..f6366c19aa 100644
--- a/target/ppc/kvm_ppc.h
+++ b/target/ppc/kvm_ppc.h
@@ -9,6 +9,8 @@
 #ifndef KVM_PPC_H
 #define KVM_PPC_H
 
+#include "qapi/error.h"
+
 #define TYPE_HOST_POWERPC_CPU POWERPC_CPU_TYPE_NAME("host")
 
 #ifdef CONFIG_KVM
diff --git a/target/s390x/cpu_models.h b/target/s390x/cpu_models.h
index 5329045a71..062161c5fa 100644
--- a/target/s390x/cpu_models.h
+++ b/target/s390x/cpu_models.h
@@ -16,6 +16,7 @@
 #include "cpu_features.h"
 #include "gen-features.h"
 #include "hw/core/cpu.h"
+#include "qapi/error.h"
 
 /* static CPU definition */
 struct S390CPUDef {
diff --git a/hw/i386/kvm/apic.c b/hw/i386/kvm/apic.c
index d125b370f4..cadf75b71c 100644
--- a/hw/i386/kvm/apic.c
+++ b/hw/i386/kvm/apic.c
@@ -18,6 +18,7 @@
 #include "sysemu/hw_accel.h"
 #include "sysemu/kvm.h"
 #include "target/i386/kvm_i386.h"
+#include "qapi/error.h"
 
 static inline void kvm_apic_set_reg(struct kvm_lapic_state *kapic,
                                     int reg_id, uint32_t val)
diff --git a/hw/misc/arm11scu.c b/hw/misc/arm11scu.c
index befc85f321..9c1fec7825 100644
--- a/hw/misc/arm11scu.c
+++ b/hw/misc/arm11scu.c
@@ -13,6 +13,7 @@
 #include "hw/qdev-properties.h"
 #include "qemu/log.h"
 #include "qemu/module.h"
+#include "qapi/error.h"
 
 static uint64_t mpcore_scu_read(void *opaque, hwaddr offset,
                                 unsigned size)
diff --git a/hw/misc/mps2-scc.c b/hw/misc/mps2-scc.c
index f2a00d3235..c41e776996 100644
--- a/hw/misc/mps2-scc.c
+++ b/hw/misc/mps2-scc.c
@@ -26,6 +26,7 @@
 #include "hw/registerfields.h"
 #include "hw/misc/mps2-scc.h"
 #include "hw/qdev-properties.h"
+#include "qapi/error.h"
 
 REG32(CFG0, 0)
 REG32(CFG1, 4)
diff --git a/hw/pci-bridge/dec.c b/hw/pci-bridge/dec.c
index fbe781474e..06445e0545 100644
--- a/hw/pci-bridge/dec.c
+++ b/hw/pci-bridge/dec.c
@@ -31,6 +31,7 @@
 #include "hw/pci/pci_host.h"
 #include "hw/pci/pci_bridge.h"
 #include "hw/pci/pci_bus.h"
+#include "qapi/error.h"
 
 /* debug DEC */
 //#define DEBUG_DEC
diff --git a/qapi/qapi-dealloc-visitor.c b/qapi/qapi-dealloc-visitor.c
index 3ee4c7a2e7..e265e29234 100644
--- a/qapi/qapi-dealloc-visitor.c
+++ b/qapi/qapi-dealloc-visitor.c
@@ -16,6 +16,7 @@
 #include "qapi/dealloc-visitor.h"
 #include "qapi/qmp/qnull.h"
 #include "qapi/visitor-impl.h"
+#include "qapi/error.h"
 
 struct QapiDeallocVisitor
 {
diff --git a/stubs/xen-hvm.c b/stubs/xen-hvm.c
index 840a2a0d09..350c762c64 100644
--- a/stubs/xen-hvm.c
+++ b/stubs/xen-hvm.c
@@ -12,6 +12,7 @@
 #include "hw/xen/xen.h"
 #include "exec/memory.h"
 #include "qapi/qapi-commands-misc.h"
+#include "qapi/error.h"
 
 int xen_pci_slot_get_pirq(PCIDevice *pci_dev, int irq_num)
 {
-- 
2.21.0


