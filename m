Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pDMMT-0003Q5-9F
	for mharc-qemu-riscv@gnu.org; Thu, 05 Jan 2023 04:16:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pDMMP-0003Ni-Sl
 for qemu-riscv@nongnu.org; Thu, 05 Jan 2023 04:16:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pDMMN-0007cB-Vy
 for qemu-riscv@nongnu.org; Thu, 05 Jan 2023 04:16:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672910187;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EFOIoQLNbqm54L5Do76w2NAFyZTxILsaJK5E5Fz584A=;
 b=Jo2Tjsrb7lBll6Y+9mtsKUJqp34DxI2HyXlK82plFOb8BAinTThKYDkKELAn6auDwDn9Ff
 4GCviqHf7EF4NYV84HM8euZ4BAyhEZXN3wkJpMTTLlzNqceFtEXZUGmZJdcFYmDphmMxLR
 gFGTZIgM9qHm5ZUkI65Pf8lOdiDN+Ng=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-197-4LIqUWScMma5GldKFs1ikg-1; Thu, 05 Jan 2023 04:16:24 -0500
X-MC-Unique: 4LIqUWScMma5GldKFs1ikg-1
Received: by mail-wr1-f72.google.com with SMTP id
 c21-20020adfa315000000b0029ae4de27efso1758203wrb.6
 for <qemu-riscv@nongnu.org>; Thu, 05 Jan 2023 01:16:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EFOIoQLNbqm54L5Do76w2NAFyZTxILsaJK5E5Fz584A=;
 b=061ok1N5z4EpDWRLyOuZNTdgwwPasIaA0VmyMUfI0FTmAxtlhnrWpqAFbC4+paQ4fH
 UvlQ2Yv/A8iHON++ldXhp6sLncpEqh+CFRA83R91NCh8MF9T58jADiZWWwYVMJZy9kzv
 oZgh+XrHCoYCKnlf/L/RcYNRxEpP4BqjEGEmheg/I9R8bU8Ufg9q5rPmv6laHKchw2sa
 cBzj3VZQAlrXV6BuI8PGmDxNc9tU2Pwrv4ze8bvXnFgNGAcfSTBXP0+ULk5X/JA5YpPD
 i3buBklzEMN7bKVXLJZCFr583RFaqIszgJWSQG3baCPlh9hBO/wetT/N6ShFeL7yveC8
 KIpw==
X-Gm-Message-State: AFqh2krr3CJEsKoIiIzbRoRx9be2A9eiLbMiV8Wq/EZwYDMy+TCLXRPq
 S4XXdI5qWw29NXCIxK/mx6QYReMzFYoXVDW5+Zf3AV78+eJc1t/P+JY+2Y/s8Pv5YS4aJPsof/K
 Qh4kcWOjjSIoC3J8=
X-Received: by 2002:a05:600c:1d18:b0:3d9:73fe:9744 with SMTP id
 l24-20020a05600c1d1800b003d973fe9744mr27399268wms.26.1672910183253; 
 Thu, 05 Jan 2023 01:16:23 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtVuPI8Vox1U4kqZB1U3vQi1ZwUCt0811Ii6xGYdnL8bJaBoF8QAepnLpmi3w3uGL5Ox1KdUg==
X-Received: by 2002:a05:600c:1d18:b0:3d9:73fe:9744 with SMTP id
 l24-20020a05600c1d1800b003d973fe9744mr27399256wms.26.1672910183029; 
 Thu, 05 Jan 2023 01:16:23 -0800 (PST)
Received: from redhat.com ([2.52.151.85]) by smtp.gmail.com with ESMTPSA id
 i6-20020a5d55c6000000b00283c7b5ee3bsm24702583wrw.101.2023.01.05.01.16.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jan 2023 01:16:22 -0800 (PST)
Date: Thu, 5 Jan 2023 04:16:18 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Bin Meng <bmeng.cn@gmail.com>, Taylor Simpson <tsimpson@quicinc.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Warner Losh <imp@bsdimp.com>, Kyle Evans <kevans@freebsd.org>,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 Ben Widawsky <ben.widawsky@intel.com>,
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Jason Wang <jasowang@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Konstantin Kostiuk <kkostiuk@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Bin Meng <bin.meng@windriver.com>, qemu-riscv@nongnu.org
Subject: [PULL 36/51] include: Don't include qemu/osdep.h
Message-ID: <20230105091310.263867-37-mst@redhat.com>
References: <20230105091310.263867-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20230105091310.263867-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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
X-List-Received-Date: Thu, 05 Jan 2023 09:16:30 -0000

From: Markus Armbruster <armbru@redhat.com>

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
Message-Id: <20221222120813.727830-4-armbru@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
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
 qga/cutils.c                    | 3 ++-
 12 files changed, 2 insertions(+), 12 deletions(-)

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
MST


