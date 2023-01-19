Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pIOv8-0006zQ-AP
	for mharc-qemu-riscv@gnu.org; Thu, 19 Jan 2023 02:01:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pIOua-0006Z3-JM
 for qemu-riscv@nongnu.org; Thu, 19 Jan 2023 02:00:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pIOuN-0008Cr-01
 for qemu-riscv@nongnu.org; Thu, 19 Jan 2023 02:00:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674111612;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kurcA10CDa8OBC3t8KOxBZkJDy9234LfSV2y7uqUTw0=;
 b=dwmpuELMqoSrkdxf99jZJvr8Ld3Q5kIw+k8tVvZFkMToPhiy+FYkKv/UR17wca5xR5H6X8
 N/fARzkrn7yReeZesJHLoLpWO2hhQav/9XUxTxp//rMUolsGts4AasljsvX+Ox5bge2a7Y
 OshVVbfztlint7F2yqOf1xaYz81US4w=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-375-QSb5smJkMiyyp6d3PZ77NQ-1; Thu, 19 Jan 2023 02:00:06 -0500
X-MC-Unique: QSb5smJkMiyyp6d3PZ77NQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 422AE101B42B;
 Thu, 19 Jan 2023 07:00:05 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C6C7A140EBF6;
 Thu, 19 Jan 2023 07:00:04 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 730C421E5A69; Thu, 19 Jan 2023 07:59:59 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, pbonzini@redhat.com, kwolf@redhat.com,
 hreitz@redhat.com, imp@bsdimp.com, kevans@freebsd.org, berrange@redhat.com,
 groug@kaod.org, qemu_oss@crudebyte.com, mst@redhat.com, philmd@linaro.org,
 peter.maydell@linaro.org, alistair@alistair23.me, jasowang@redhat.com,
 jonathan.cameron@huawei.com, kbastian@mail.uni-paderborn.de,
 quintela@redhat.com, dgilbert@redhat.com, michael.roth@amd.com,
 kkostiuk@redhat.com, tsimpson@quicinc.com, palmer@dabbelt.com,
 bin.meng@windriver.com, qemu-block@nongnu.org, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org
Subject: [PATCH v4 17/19] Don't include headers already included by
 qemu/osdep.h
Date: Thu, 19 Jan 2023 07:59:57 +0100
Message-Id: <20230119065959.3104012-18-armbru@redhat.com>
In-Reply-To: <20230119065959.3104012-1-armbru@redhat.com>
References: <20230119065959.3104012-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
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
X-List-Received-Date: Thu, 19 Jan 2023 07:00:37 -0000

This commit was created with scripts/clean-includes.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 backends/tpm/tpm_ioctl.h          | 2 --
 fsdev/p9array.h                   | 2 --
 include/hw/misc/aspeed_lpc.h      | 2 --
 include/hw/pci/pcie_doe.h         | 1 -
 include/qemu/async-teardown.h     | 2 --
 include/qemu/dbus.h               | 1 -
 include/qemu/host-utils.h         | 1 -
 include/sysemu/event-loop-base.h  | 1 -
 accel/tcg/cpu-exec.c              | 1 -
 hw/9pfs/9p.c                      | 2 --
 hw/display/virtio-gpu-udmabuf.c   | 1 -
 hw/i2c/pmbus_device.c             | 1 -
 hw/remote/proxy-memory-listener.c | 1 -
 hw/sensor/adm1272.c               | 1 -
 hw/usb/dev-storage-bot.c          | 1 -
 hw/usb/dev-storage-classic.c      | 1 -
 softmmu/vl.c                      | 2 --
 tcg/tci.c                         | 1 -
 tests/unit/test-seccomp.c         | 1 -
 ui/udmabuf.c                      | 1 -
 util/main-loop.c                  | 1 -
 util/oslib-posix.c                | 2 --
 22 files changed, 29 deletions(-)

diff --git a/backends/tpm/tpm_ioctl.h b/backends/tpm/tpm_ioctl.h
index e506ef5160..b1d31768a6 100644
--- a/backends/tpm/tpm_ioctl.h
+++ b/backends/tpm/tpm_ioctl.h
@@ -12,8 +12,6 @@
 # define __USE_LINUX_IOCTL_DEFS
 #endif
 
-#include <stdint.h>
-#include <sys/types.h>
 #ifndef _WIN32
 #include <sys/uio.h>
 #include <sys/ioctl.h>
diff --git a/fsdev/p9array.h b/fsdev/p9array.h
index 90e83a7c7b..50a1b15fe9 100644
--- a/fsdev/p9array.h
+++ b/fsdev/p9array.h
@@ -27,8 +27,6 @@
 #ifndef QEMU_P9ARRAY_H
 #define QEMU_P9ARRAY_H
 
-#include "qemu/compiler.h"
-
 /**
  * P9Array provides a mechanism to access arrays in common C-style (e.g. by
  * square bracket [] operator) in conjunction with reference variables that
diff --git a/include/hw/misc/aspeed_lpc.h b/include/hw/misc/aspeed_lpc.h
index fd228731d2..fa398959af 100644
--- a/include/hw/misc/aspeed_lpc.h
+++ b/include/hw/misc/aspeed_lpc.h
@@ -12,8 +12,6 @@
 
 #include "hw/sysbus.h"
 
-#include <stdint.h>
-
 #define TYPE_ASPEED_LPC "aspeed.lpc"
 #define ASPEED_LPC(obj) OBJECT_CHECK(AspeedLPCState, (obj), TYPE_ASPEED_LPC)
 
diff --git a/include/hw/pci/pcie_doe.h b/include/hw/pci/pcie_doe.h
index ba4d8b03bd..87dc17dcef 100644
--- a/include/hw/pci/pcie_doe.h
+++ b/include/hw/pci/pcie_doe.h
@@ -11,7 +11,6 @@
 #define PCIE_DOE_H
 
 #include "qemu/range.h"
-#include "qemu/typedefs.h"
 #include "hw/register.h"
 
 /*
diff --git a/include/qemu/async-teardown.h b/include/qemu/async-teardown.h
index 092e7a37e7..b281da005b 100644
--- a/include/qemu/async-teardown.h
+++ b/include/qemu/async-teardown.h
@@ -13,8 +13,6 @@
 #ifndef QEMU_ASYNC_TEARDOWN_H
 #define QEMU_ASYNC_TEARDOWN_H
 
-#include "config-host.h"
-
 #ifdef CONFIG_LINUX
 void init_async_teardown(void);
 #endif
diff --git a/include/qemu/dbus.h b/include/qemu/dbus.h
index 08f00dfd53..81d3de8a5a 100644
--- a/include/qemu/dbus.h
+++ b/include/qemu/dbus.h
@@ -15,7 +15,6 @@
 #include "qom/object.h"
 #include "chardev/char.h"
 #include "qemu/notify.h"
-#include "qemu/typedefs.h"
 
 /* glib/gio 2.68 */
 #define DBUS_METHOD_INVOCATION_HANDLED TRUE
diff --git a/include/qemu/host-utils.h b/include/qemu/host-utils.h
index 88d476161c..3ce62bf4a5 100644
--- a/include/qemu/host-utils.h
+++ b/include/qemu/host-utils.h
@@ -30,7 +30,6 @@
 #ifndef HOST_UTILS_H
 #define HOST_UTILS_H
 
-#include "qemu/compiler.h"
 #include "qemu/bswap.h"
 #include "qemu/int128.h"
 
diff --git a/include/sysemu/event-loop-base.h b/include/sysemu/event-loop-base.h
index 2748bf6ae1..a6c24f1351 100644
--- a/include/sysemu/event-loop-base.h
+++ b/include/sysemu/event-loop-base.h
@@ -14,7 +14,6 @@
 
 #include "qom/object.h"
 #include "block/aio.h"
-#include "qemu/typedefs.h"
 
 #define TYPE_EVENT_LOOP_BASE         "event-loop-base"
 OBJECT_DECLARE_TYPE(EventLoopBase, EventLoopBaseClass,
diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index 8927092537..dd8f54a415 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -28,7 +28,6 @@
 #include "exec/exec-all.h"
 #include "tcg/tcg.h"
 #include "qemu/atomic.h"
-#include "qemu/compiler.h"
 #include "qemu/timer.h"
 #include "qemu/rcu.h"
 #include "exec/log.h"
diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
index 072cf67956..9621ec1341 100644
--- a/hw/9pfs/9p.c
+++ b/hw/9pfs/9p.c
@@ -19,8 +19,6 @@
 #include "qemu/osdep.h"
 #ifdef CONFIG_LINUX
 #include <linux/limits.h>
-#else
-#include <limits.h>
 #endif
 #include <glib/gprintf.h>
 #include "hw/virtio/virtio.h"
diff --git a/hw/display/virtio-gpu-udmabuf.c b/hw/display/virtio-gpu-udmabuf.c
index 8bdf4bac6e..847fa4c0cc 100644
--- a/hw/display/virtio-gpu-udmabuf.c
+++ b/hw/display/virtio-gpu-udmabuf.c
@@ -21,7 +21,6 @@
 #include "exec/ramblock.h"
 #include "sysemu/hostmem.h"
 #include <sys/ioctl.h>
-#include <fcntl.h>
 #include <linux/memfd.h>
 #include "qemu/memfd.h"
 #include "standard-headers/linux/udmabuf.h"
diff --git a/hw/i2c/pmbus_device.c b/hw/i2c/pmbus_device.c
index 4071a88cfc..c3d6046784 100644
--- a/hw/i2c/pmbus_device.c
+++ b/hw/i2c/pmbus_device.c
@@ -8,7 +8,6 @@
 
 #include "qemu/osdep.h"
 #include <math.h>
-#include <string.h>
 #include "hw/i2c/pmbus_device.h"
 #include "migration/vmstate.h"
 #include "qemu/module.h"
diff --git a/hw/remote/proxy-memory-listener.c b/hw/remote/proxy-memory-listener.c
index eb9918fe72..18d96a1d04 100644
--- a/hw/remote/proxy-memory-listener.c
+++ b/hw/remote/proxy-memory-listener.c
@@ -8,7 +8,6 @@
 
 #include "qemu/osdep.h"
 
-#include "qemu/compiler.h"
 #include "qemu/int128.h"
 #include "qemu/range.h"
 #include "exec/memory.h"
diff --git a/hw/sensor/adm1272.c b/hw/sensor/adm1272.c
index 7310c769be..8f4a1c2cd4 100644
--- a/hw/sensor/adm1272.c
+++ b/hw/sensor/adm1272.c
@@ -8,7 +8,6 @@
  */
 
 #include "qemu/osdep.h"
-#include <string.h>
 #include "hw/i2c/pmbus_device.h"
 #include "hw/irq.h"
 #include "migration/vmstate.h"
diff --git a/hw/usb/dev-storage-bot.c b/hw/usb/dev-storage-bot.c
index b24b3148c2..1e5c5c711f 100644
--- a/hw/usb/dev-storage-bot.c
+++ b/hw/usb/dev-storage-bot.c
@@ -8,7 +8,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu/typedefs.h"
 #include "qapi/error.h"
 #include "hw/usb.h"
 #include "hw/usb/desc.h"
diff --git a/hw/usb/dev-storage-classic.c b/hw/usb/dev-storage-classic.c
index 00f25bade2..84d19752b5 100644
--- a/hw/usb/dev-storage-classic.c
+++ b/hw/usb/dev-storage-classic.c
@@ -8,7 +8,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu/typedefs.h"
 #include "qapi/error.h"
 #include "qapi/visitor.h"
 #include "hw/usb.h"
diff --git a/softmmu/vl.c b/softmmu/vl.c
index 9177d95d4e..5355a7fe5a 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -136,8 +136,6 @@
 #include "qemu/guest-random.h"
 #include "qemu/keyval.h"
 
-#include "config-host.h"
-
 #define MAX_VIRTIO_CONSOLES 1
 
 typedef struct BlockdevOptionsQueueEntry {
diff --git a/tcg/tci.c b/tcg/tci.c
index 05a24163d3..e7ac74cab0 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -21,7 +21,6 @@
 #include "exec/cpu_ldst.h"
 #include "tcg/tcg-op.h"
 #include "tcg/tcg-ldst.h"
-#include "qemu/compiler.h"
 #include <ffi.h>
 
 
diff --git a/tests/unit/test-seccomp.c b/tests/unit/test-seccomp.c
index 3d7771e46c..f02c79cafd 100644
--- a/tests/unit/test-seccomp.c
+++ b/tests/unit/test-seccomp.c
@@ -25,7 +25,6 @@
 #include "qapi/error.h"
 #include "qemu/module.h"
 
-#include <unistd.h>
 #include <sys/syscall.h>
 
 static void test_seccomp_helper(const char *args, bool killed,
diff --git a/ui/udmabuf.c b/ui/udmabuf.c
index cebceb2610..cbf4357bb1 100644
--- a/ui/udmabuf.c
+++ b/ui/udmabuf.c
@@ -8,7 +8,6 @@
 #include "qapi/error.h"
 #include "ui/console.h"
 
-#include <fcntl.h>
 #include <sys/ioctl.h>
 
 int udmabuf_fd(void)
diff --git a/util/main-loop.c b/util/main-loop.c
index 58f776a8c9..3c0f525192 100644
--- a/util/main-loop.c
+++ b/util/main-loop.c
@@ -33,7 +33,6 @@
 #include "block/thread-pool.h"
 #include "qemu/error-report.h"
 #include "qemu/queue.h"
-#include "qemu/compiler.h"
 #include "qom/object.h"
 
 #ifndef _WIN32
diff --git a/util/oslib-posix.c b/util/oslib-posix.c
index 59a891b6a8..fd03fd32c8 100644
--- a/util/oslib-posix.c
+++ b/util/oslib-posix.c
@@ -40,7 +40,6 @@
 #include "qemu/thread.h"
 #include <libgen.h>
 #include "qemu/cutils.h"
-#include "qemu/compiler.h"
 #include "qemu/units.h"
 #include "qemu/thread-context.h"
 
@@ -50,7 +49,6 @@
 
 #ifdef __FreeBSD__
 #include <sys/thr.h>
-#include <sys/types.h>
 #include <sys/user.h>
 #include <libutil.h>
 #endif
-- 
2.39.0


