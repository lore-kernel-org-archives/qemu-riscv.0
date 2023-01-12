Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pFw6X-0000uA-MC
	for mharc-qemu-riscv@gnu.org; Thu, 12 Jan 2023 06:50:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pFw64-0000q9-Vr
 for qemu-riscv@nongnu.org; Thu, 12 Jan 2023 06:50:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pFw62-0000SM-LK
 for qemu-riscv@nongnu.org; Thu, 12 Jan 2023 06:50:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673524214;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pm9no63Gh/VwyX03yviNU3MTjFd5bbQ28HgEQPd/cVs=;
 b=OzfyKrYMat4jmrbWUIqI3A80p6weKkJR/pNuy0spis8Zha25WHeCpERBlTEAa5h0S3d7yM
 Kr8SP6QjL75dFo9lZT1e2s0iN1aY+rVAFrG/hocTgpT+zKsNbKNUZVsY6kCgFFX9V+RmG8
 vnKGVZ60eW074GLPUZBiwraKdSWUdFY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-265-Q76FFjMAPdytH4irqvepRQ-1; Thu, 12 Jan 2023 06:50:08 -0500
X-MC-Unique: Q76FFjMAPdytH4irqvepRQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 194B71C0691B;
 Thu, 12 Jan 2023 11:50:08 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.78])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E3CC12026D68;
 Thu, 12 Jan 2023 11:50:06 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id DF8E921E5DF6; Thu, 12 Jan 2023 12:50:05 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: imp@bsdimp.com, kevans@freebsd.org, berrange@redhat.com,
 ben.widawsky@intel.com, jonathan.cameron@huawei.com,
 kbastian@mail.uni-paderborn.de, jasowang@redhat.com, michael.roth@amd.com,
 kkostiuk@redhat.com, tsimpson@quicinc.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, qemu-riscv@nongnu.org,
 philmd@linaro.org, mst@redhat.com, Bin Meng <bmeng.cn@gmail.com>
Subject: [PATCH v3 1/1] include: Don't include qemu/osdep.h
Date: Thu, 12 Jan 2023 12:50:05 +0100
Message-Id: <20230112115005.1504812-2-armbru@redhat.com>
In-Reply-To: <20230112115005.1504812-1-armbru@redhat.com>
References: <20230112115005.1504812-1-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 12 Jan 2023 11:50:28 -0000

docs/devel/style.rst mandates:

    The "qemu/osdep.h" header contains preprocessor macros that affect
    the behavior of core system headers like <stdint.h>.  It must be
    the first include so that core system headers included by external
    libraries get the preprocessor macros that QEMU depends on.

    Do not include "qemu/osdep.h" from header files since the .c file
    will have already included it.

A few violations have crept in.  Fix them.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Taylor Simpson <tsimpson@quicinc.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 bsd-user/qemu.h                 | 1 -
 crypto/block-luks-priv.h        | 1 -
 include/hw/cxl/cxl_host.h       | 1 -
 include/hw/input/pl050.h        | 1 -
 include/hw/tricore/triboard.h   | 1 -
 include/qemu/userfaultfd.h      | 1 -
 net/vmnet_int.h                 | 1 -
 qga/cutils.h                    | 1 -
 target/hexagon/hex_arch_types.h | 1 -
 target/hexagon/mmvec/macros.h   | 1 -
 target/riscv/pmu.h              | 1 -
 bsd-user/arm/signal.c           | 1 +
 bsd-user/arm/target_arch_cpu.c  | 2 ++
 bsd-user/freebsd/os-sys.c       | 1 +
 bsd-user/i386/signal.c          | 1 +
 bsd-user/x86_64/signal.c        | 1 +
 qga/cutils.c                    | 3 ++-
 17 files changed, 8 insertions(+), 12 deletions(-)

diff --git a/bsd-user/qemu.h b/bsd-user/qemu.h
index be6105385e..0ceecfb6df 100644
--- a/bsd-user/qemu.h
+++ b/bsd-user/qemu.h
@@ -17,7 +17,6 @@
 #ifndef QEMU_H
 #define QEMU_H
 
-#include "qemu/osdep.h"
 #include "cpu.h"
 #include "qemu/units.h"
 #include "exec/cpu_ldst.h"
diff --git a/crypto/block-luks-priv.h b/crypto/block-luks-priv.h
index 90a20d432b..1066df0307 100644
--- a/crypto/block-luks-priv.h
+++ b/crypto/block-luks-priv.h
@@ -18,7 +18,6 @@
  *
  */
 
-#include "qemu/osdep.h"
 #include "qapi/error.h"
 #include "qemu/bswap.h"
 
diff --git a/include/hw/cxl/cxl_host.h b/include/hw/cxl/cxl_host.h
index a1b662ce40..c9bc9c7c50 100644
--- a/include/hw/cxl/cxl_host.h
+++ b/include/hw/cxl/cxl_host.h
@@ -7,7 +7,6 @@
  * COPYING file in the top-level directory.
  */
 
-#include "qemu/osdep.h"
 #include "hw/cxl/cxl.h"
 #include "hw/boards.h"
 
diff --git a/include/hw/input/pl050.h b/include/hw/input/pl050.h
index 89ec4fafc9..4cb8985f31 100644
--- a/include/hw/input/pl050.h
+++ b/include/hw/input/pl050.h
@@ -10,7 +10,6 @@
 #ifndef HW_PL050_H
 #define HW_PL050_H
 
-#include "qemu/osdep.h"
 #include "hw/sysbus.h"
 #include "migration/vmstate.h"
 #include "hw/input/ps2.h"
diff --git a/include/hw/tricore/triboard.h b/include/hw/tricore/triboard.h
index 094c8bd563..4fdd2d7d97 100644
--- a/include/hw/tricore/triboard.h
+++ b/include/hw/tricore/triboard.h
@@ -18,7 +18,6 @@
  * License along with this library; if not, see <http://www.gnu.org/licenses/>.
  */
 
-#include "qemu/osdep.h"
 #include "qapi/error.h"
 #include "hw/boards.h"
 #include "sysemu/sysemu.h"
diff --git a/include/qemu/userfaultfd.h b/include/qemu/userfaultfd.h
index 6b74f92792..55c95998e8 100644
--- a/include/qemu/userfaultfd.h
+++ b/include/qemu/userfaultfd.h
@@ -13,7 +13,6 @@
 #ifndef USERFAULTFD_H
 #define USERFAULTFD_H
 
-#include "qemu/osdep.h"
 #include "exec/hwaddr.h"
 #include <linux/userfaultfd.h>
 
diff --git a/net/vmnet_int.h b/net/vmnet_int.h
index adf6e8c20d..d0b90594f2 100644
--- a/net/vmnet_int.h
+++ b/net/vmnet_int.h
@@ -10,7 +10,6 @@
 #ifndef VMNET_INT_H
 #define VMNET_INT_H
 
-#include "qemu/osdep.h"
 #include "vmnet_int.h"
 #include "clients.h"
 
diff --git a/qga/cutils.h b/qga/cutils.h
index f0f30a7d28..2bfaf554a8 100644
--- a/qga/cutils.h
+++ b/qga/cutils.h
@@ -1,7 +1,6 @@
 #ifndef CUTILS_H_
 #define CUTILS_H_
 
-#include "qemu/osdep.h"
 
 int qga_open_cloexec(const char *name, int flags, mode_t mode);
 
diff --git a/target/hexagon/hex_arch_types.h b/target/hexagon/hex_arch_types.h
index 885f68f760..52a7f2b2f3 100644
--- a/target/hexagon/hex_arch_types.h
+++ b/target/hexagon/hex_arch_types.h
@@ -18,7 +18,6 @@
 #ifndef HEXAGON_HEX_ARCH_TYPES_H
 #define HEXAGON_HEX_ARCH_TYPES_H
 
-#include "qemu/osdep.h"
 #include "mmvec/mmvec.h"
 #include "qemu/int128.h"
 
diff --git a/target/hexagon/mmvec/macros.h b/target/hexagon/mmvec/macros.h
index 8c864e8c68..1201d778d0 100644
--- a/target/hexagon/mmvec/macros.h
+++ b/target/hexagon/mmvec/macros.h
@@ -18,7 +18,6 @@
 #ifndef HEXAGON_MMVEC_MACROS_H
 #define HEXAGON_MMVEC_MACROS_H
 
-#include "qemu/osdep.h"
 #include "qemu/host-utils.h"
 #include "arch.h"
 #include "mmvec/system_ext_mmvec.h"
diff --git a/target/riscv/pmu.h b/target/riscv/pmu.h
index 3004ce37b6..0c819ca983 100644
--- a/target/riscv/pmu.h
+++ b/target/riscv/pmu.h
@@ -16,7 +16,6 @@
  * this program.  If not, see <http://www.gnu.org/licenses/>.
  */
 
-#include "qemu/osdep.h"
 #include "qemu/log.h"
 #include "cpu.h"
 #include "qemu/main-loop.h"
diff --git a/bsd-user/arm/signal.c b/bsd-user/arm/signal.c
index 2b1dd745d1..9734407543 100644
--- a/bsd-user/arm/signal.c
+++ b/bsd-user/arm/signal.c
@@ -17,6 +17,7 @@
  *  along with this program; if not, see <http://www.gnu.org/licenses/>.
  */
 
+#include "qemu/osdep.h"
 #include "qemu.h"
 
 /*
diff --git a/bsd-user/arm/target_arch_cpu.c b/bsd-user/arm/target_arch_cpu.c
index 02bf9149d5..fe38ae2210 100644
--- a/bsd-user/arm/target_arch_cpu.c
+++ b/bsd-user/arm/target_arch_cpu.c
@@ -16,6 +16,8 @@
  *  You should have received a copy of the GNU General Public License
  *  along with this program; if not, see <http://www.gnu.org/licenses/>.
  */
+
+#include "qemu/osdep.h"
 #include "target_arch.h"
 
 void target_cpu_set_tls(CPUARMState *env, target_ulong newtls)
diff --git a/bsd-user/freebsd/os-sys.c b/bsd-user/freebsd/os-sys.c
index 309e27b9d6..1676ec10f8 100644
--- a/bsd-user/freebsd/os-sys.c
+++ b/bsd-user/freebsd/os-sys.c
@@ -17,6 +17,7 @@
  *  along with this program; if not, see <http://www.gnu.org/licenses/>.
  */
 
+#include "qemu/osdep.h"
 #include "qemu.h"
 #include "target_arch_sysarch.h"
 
diff --git a/bsd-user/i386/signal.c b/bsd-user/i386/signal.c
index 5dd975ce56..a3131047b8 100644
--- a/bsd-user/i386/signal.c
+++ b/bsd-user/i386/signal.c
@@ -17,6 +17,7 @@
  *  along with this program; if not, see <http://www.gnu.org/licenses/>.
  */
 
+#include "qemu/osdep.h"
 #include "qemu.h"
 
 /*
diff --git a/bsd-user/x86_64/signal.c b/bsd-user/x86_64/signal.c
index c3875bc4c6..46cb865180 100644
--- a/bsd-user/x86_64/signal.c
+++ b/bsd-user/x86_64/signal.c
@@ -16,6 +16,7 @@
  *  along with this program; if not, see <http://www.gnu.org/licenses/>.
  */
 
+#include "qemu/osdep.h"
 #include "qemu.h"
 
 /*
diff --git a/qga/cutils.c b/qga/cutils.c
index b8e142ef64..b21bcf3683 100644
--- a/qga/cutils.c
+++ b/qga/cutils.c
@@ -2,8 +2,9 @@
  * This work is licensed under the terms of the GNU GPL, version 2 or later.
  * See the COPYING file in the top-level directory.
  */
-#include "cutils.h"
 
+#include "qemu/osdep.h"
+#include "cutils.h"
 #include "qapi/error.h"
 
 /**
-- 
2.39.0


