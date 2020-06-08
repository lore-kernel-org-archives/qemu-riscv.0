Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jiKD6-00065a-00
	for mharc-qemu-riscv@gnu.org; Mon, 08 Jun 2020 12:01:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jiKCz-00060U-7e
 for qemu-riscv@nongnu.org; Mon, 08 Jun 2020 12:01:10 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:59716
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jiKCw-0007TH-Lk
 for qemu-riscv@nongnu.org; Mon, 08 Jun 2020 12:01:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591632064;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5qtqeym41wYPVUNcQP0hBuZd3ZN8CptiJr597zGfRw0=;
 b=MTeDYCcoZKac/+R/Fonn1qP58ALF9W+GHJsIUUdYnJB52JvnE0ES/cMhKLmEudeO36yfUd
 ZqiCjBL8N+8dPSqUmDwzNNzS5bSralcNdMP0xorBIPzRCa1/euyZbFWn/9Y1w+Dczpz1kc
 JqE7UVIhmcc9oImmukhRNCv6q/pPFEI=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-22-6Oc7eF5iP_OBKjr39_q_RQ-1; Mon, 08 Jun 2020 12:01:00 -0400
X-MC-Unique: 6Oc7eF5iP_OBKjr39_q_RQ-1
Received: by mail-wr1-f69.google.com with SMTP id p9so7360420wrx.10
 for <qemu-riscv@nongnu.org>; Mon, 08 Jun 2020 09:01:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5qtqeym41wYPVUNcQP0hBuZd3ZN8CptiJr597zGfRw0=;
 b=Ac3WbwmCSW+PnMuo4gVVGK3t4ELO+4zSy20rzF5X8k5gundKsksKDz7CBi2Vywixng
 XgdSO+zY9j50oerC02US3g8wNP2e1/E8V6yu3GsMi3zAvmuumlIxaTtsUQADtunJXsbw
 Rs2xAKpUqlknppBuyPubO+BBFsZwTsIjcsmCUuY66V+meSF5kob9YUxPRRC8ad8CMSZj
 nR7PSMcmgz18G5x83bI+ZKTbQ+11+3puZxhz/miPIVSHKc/D9+EQb4B6W+xews5z0gm0
 16p2Wkm0SlF6o+0OHHwhi+Vx7ERKNYkgNsZPY+E+zlPhmzKSfGwSlp5o4eylyUuJ/VAh
 mZdA==
X-Gm-Message-State: AOAM531MTYsXf4hNFam8Z4qqkZfdQnCqN9+C73iYX/RN+ViVDP0BMQxc
 8qsEwQJqFdAl/ai1Wap8fWA8zoSO8YfsZpw3lmb7a9kvd91MjiGkHRwb0NYKoz4gQpOpyxQdKCe
 7ClOkd3uHd39imAc=
X-Received: by 2002:adf:de0b:: with SMTP id b11mr24236292wrm.346.1591632059267; 
 Mon, 08 Jun 2020 09:00:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyCLkZjArfyp0BDfLlr7paJJyNdZb8aPEICM5cLMV+w6rNjL53A+D/YIALTIycqApB88KkdKg==
X-Received: by 2002:adf:de0b:: with SMTP id b11mr24236267wrm.346.1591632059025; 
 Mon, 08 Jun 2020 09:00:59 -0700 (PDT)
Received: from localhost.localdomain
 (181.red-88-10-103.dynamicip.rima-tde.net. [88.10.103.181])
 by smtp.gmail.com with ESMTPSA id z12sm227313wrg.9.2020.06.08.09.00.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jun 2020 09:00:58 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Max Filippov <jcmvbkbc@gmail.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, Michael Walle <michael@walle.cc>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Gerd Hoffmann <kraxel@redhat.com>,
 Stafford Horne <shorne@gmail.com>, Andrzej Zaborowski <balrogg@gmail.com>,
 qemu-ppc@nongnu.org, Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <rth@twiddle.net>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>, qemu-riscv@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, xen-devel@lists.xenproject.org,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Anthony Perard <anthony.perard@citrix.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Thomas Huth <huth@tuxfamily.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 David Gibson <david@gibson.dropbear.id.au>,
 Magnus Damm <magnus.damm@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [RFC PATCH 02/35] hw/core/qdev: Add
 qdev_warn_deprecated_function_used() helper
Date: Mon,  8 Jun 2020 18:00:11 +0200
Message-Id: <20200608160044.15531-3-philmd@redhat.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200608160044.15531-1-philmd@redhat.com>
References: <20200608160044.15531-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/08 01:05:50
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Mon, 08 Jun 2020 16:01:11 -0000

When built with --enable-qdev-deprecation-warning, calling
qdev_warn_deprecated_function_used() will emit a warning such:

  $ qemu-system-arm -M verdex ...
  qemu-system-arm: warning: use of deprecated non-qdev/non-qom code in pxa2xx_lcdc_init()
  qemu-system-arm: warning: use of deprecated non-qdev/non-qom code in pxa2xx_i2s_init()
  qemu-system-arm: warning: use of deprecated non-qdev/non-qom code in pxa27x_keypad_init()

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 configure                    |  8 ++++++++
 include/hw/qdev-deprecated.h | 26 ++++++++++++++++++++++++++
 hw/core/qdev.c               |  8 ++++++++
 3 files changed, 42 insertions(+)
 create mode 100644 include/hw/qdev-deprecated.h

diff --git a/configure b/configure
index 597e909b53..9b7a8927c6 100755
--- a/configure
+++ b/configure
@@ -434,6 +434,7 @@ edk2_blobs="no"
 pkgversion=""
 pie=""
 qom_cast_debug="yes"
+qdev_deprecation_warning="no"
 trace_backends="log"
 trace_file="trace"
 spice=""
@@ -1114,6 +1115,8 @@ for opt do
   ;;
   --enable-qom-cast-debug) qom_cast_debug="yes"
   ;;
+  --enable-qdev-deprecation-warning) qdev_deprecation_warning="yes"
+  ;;
   --disable-virtfs) virtfs="no"
   ;;
   --enable-virtfs) virtfs="yes"
@@ -1882,6 +1885,7 @@ disabled with --disable-FEATURE, default is enabled if available:
   virglrenderer   virgl rendering support
   xfsctl          xfsctl support
   qom-cast-debug  cast debugging support
+  qdev-deprecation-warning display qdev deprecation warnings
   tools           build qemu-io, qemu-nbd and qemu-img tools
   vxhs            Veritas HyperScale vDisk backend support
   bochs           bochs image format support
@@ -6723,6 +6727,7 @@ echo "gcov enabled      $gcov"
 echo "TPM support       $tpm"
 echo "libssh support    $libssh"
 echo "QOM debugging     $qom_cast_debug"
+echo "QDEV deprecation warnings $qdev_deprecation_warning"
 echo "Live block migration $live_block_migration"
 echo "lzo support       $lzo"
 echo "snappy support    $snappy"
@@ -7345,6 +7350,9 @@ fi
 if test "$qom_cast_debug" = "yes" ; then
   echo "CONFIG_QOM_CAST_DEBUG=y" >> $config_host_mak
 fi
+if test "$qdev_deprecation_warning" = "yes" ; then
+  echo "CONFIG_QDEV_DEPRECATION_WARNING=y" >> $config_host_mak
+fi
 if test "$rbd" = "yes" ; then
   echo "CONFIG_RBD=m" >> $config_host_mak
   echo "RBD_CFLAGS=$rbd_cflags" >> $config_host_mak
diff --git a/include/hw/qdev-deprecated.h b/include/hw/qdev-deprecated.h
new file mode 100644
index 0000000000..b815f62dae
--- /dev/null
+++ b/include/hw/qdev-deprecated.h
@@ -0,0 +1,26 @@
+/*
+ * QEMU QOM qdev deprecation helpers
+ *
+ * Copyright (c) 2020 Red Hat, Inc.
+ *
+ * Author:
+ *   Philippe Mathieu-Daudé <philmd@redhat.com>
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+#ifndef HW_QDEV_DEPRECATED_H
+#define HW_QDEV_DEPRECATED_H
+
+/**
+ * qdev_warn_deprecated_function_used:
+ *
+ * Display a warning that deprecated code is used.
+ */
+#define qdev_warn_deprecated_function_used() \
+    qdev_warn_deprecated_function(__func__)
+void qdev_warn_deprecated_function(const char *function);
+
+#endif
diff --git a/hw/core/qdev.c b/hw/core/qdev.c
index 9e5538aeae..901fa93657 100644
--- a/hw/core/qdev.c
+++ b/hw/core/qdev.c
@@ -35,6 +35,7 @@
 #include "hw/hotplug.h"
 #include "hw/irq.h"
 #include "hw/qdev-properties.h"
+#include "hw/qdev-deprecated.h"
 #include "hw/boards.h"
 #include "hw/sysbus.h"
 #include "hw/qdev-clock.h"
@@ -819,6 +820,13 @@ void qdev_alias_all_properties(DeviceState *target, Object *source)
     } while (class != object_class_by_name(TYPE_DEVICE));
 }
 
+void qdev_warn_deprecated_function(const char *function)
+{
+#ifdef CONFIG_QDEV_DEPRECATION_WARNING
+    warn_report("use of deprecated non-qdev/non-qom code in %s()", function);
+#endif
+}
+
 static bool device_get_realized(Object *obj, Error **errp)
 {
     DeviceState *dev = DEVICE(obj);
-- 
2.21.3


