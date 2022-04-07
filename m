Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ncHWi-0005PD-21
	for mharc-qemu-riscv@gnu.org; Wed, 06 Apr 2022 22:05:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=089d0ce6d=alistair.francis@opensource.wdc.com>)
 id 1ncHWW-0005M3-FC
 for qemu-riscv@nongnu.org; Wed, 06 Apr 2022 22:05:27 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:43527)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=089d0ce6d=alistair.francis@opensource.wdc.com>)
 id 1ncHWU-0007Qe-86
 for qemu-riscv@nongnu.org; Wed, 06 Apr 2022 22:05:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1649297122; x=1680833122;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=l0CXaP+tbwyurpGlT0CWLXD+mibNyZO0xUI/IwjNBKM=;
 b=W6EHiCF5klqetXYsi7+eikwrt+n79WcOb/EuM13le7KYweHq1WuOjC3T
 StyKyBwZFUPtJNqfF9vlOi2MDA8P005lHcHIdEJrQRIFh/61NQXgKOM7w
 v+8X0/r90uvapLsk8Qmxm3txUATzUI0OQhdPzziCDj7gnmOfRcK6AZGkF
 SZdNUPAh3ofLSYCui1gFXMzlCI7pf3aTqg/Fi8RcaPDj/hUQvhD0cvVGM
 8aQG+ZI+L+Xyo56XaFXIsKJXWYBCPoxih3+MxLpT2Es1sgwXpnal3b/PI
 OMJPIutY+eXy+UxMkAD2V/2DoSEVTLOU9u9GBhbTTamlfckWHyf+Io+Pt A==;
X-IronPort-AV: E=Sophos;i="5.90,241,1643644800"; d="scan'208";a="309261478"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 07 Apr 2022 10:05:17 +0800
IronPort-SDR: yvNe298hGz7k16x8ZFmRpWfzz7RWtVFNf5zpv+RocnnFMEEGq9dN0scu0Rm8x1rpxJhpxFNXP1
 bLurNxmnOO3Y6e/7T3UzB3lz/G9KFzhaUqseuW2XjZTtgAH8uSWFuGlg5ZHqumgDOE9SuLykDi
 /B7WYFEsH/YzZnGCbH+dAiMPSCFHWAEO6OY+SMCRJ1xkDrP6nnlPpzvzmi9qBXfH8P3/z+Gahx
 SynOQBXBb0L3Rzlpr0GX6y9YZSu5nVWeom1ECbekTgqixDdPXFIW661u2n2X/oVNBqSa7nyRv1
 31NjegCQ60FpsxZEmBGw1kNu
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 06 Apr 2022 18:36:48 -0700
IronPort-SDR: b0BxYQvVxJxEdKWXvvsSJevy+me5YPeRziubbZUAgHpARoY6Ur6VArWuoRnMXnOyIRBU19fCHR
 BdarzaXztx/bnY7+O2mlGHdDQlMxvSwKCDsGrmVT6bih/pUikbmZ4Bbqg2MiuY9zO158SqsJv2
 qz7x8eGDbLpdULUorGI7YgDIE+BsjDI+7dlQVfDFEVn4bSWhGR0tcBjof3rjgsEr3IvKL7+AWZ
 18V7EaIk1Vt+TkkA/Zl45YrbJ3s87OggoigeLPxSsdwAk3FmlpcNePdq6jMheQjROYXUeKzZTc
 bV4=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 06 Apr 2022 19:05:18 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4KYl8F22Smz1SVp8
 for <qemu-riscv@nongnu.org>; Wed,  6 Apr 2022 19:05:17 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1649297116; x=1651889117; bh=l0CXaP+tbwyurpGlT0
 CWLXD+mibNyZO0xUI/IwjNBKM=; b=tBV02YX/ACTTIJpGJl/ln73gdNY1E5RPIz
 T0ygfOpE/6oFs/dbu/4fIQFjInGRzTuoElsemrrEBVetaQ7R44/1bKzZ/3LBNTM2
 Ge3Kf2q6G4kp6C3rp0nk/UKzHHcgEpjGL8hPe9jrKVzsGFEcEILDy3WwtOLgQ+mR
 7GteRCCQ0TTPK3jf4anDwiym2SnBhCjfMOqVVr3AiFhjgTOvzK4pzeC8jDJiIlQ5
 JqSQdmB3+dBYbwdBIDg/JzQt4Mnd/UVW66PXntn1M6ZRCfL1HF5ES5gppyLuEFdv
 n2BBNmY718FIJ9SJhlEWi1oFgNvLr4xScpeM+DWui4xj70ac9fjg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id 8rOkk-x_LY6k for <qemu-riscv@nongnu.org>;
 Wed,  6 Apr 2022 19:05:16 -0700 (PDT)
Received: from toolbox.alistair23.me (unknown [10.225.165.114])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4KYl873v9cz1SVp4;
 Wed,  6 Apr 2022 19:05:11 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org,
 richard.henderson@linaro.org,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>, alistair23@gmail.com,
 Palmer Dabbelt <palmer@dabbelt.com>, bmeng.cn@gmail.com,
 Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v2 6/6] hw/riscv: Enable TPM backends
Date: Thu,  7 Apr 2022 12:04:32 +1000
Message-Id: <20220407020432.4062829-7-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220407020432.4062829-1-alistair.francis@opensource.wdc.com>
References: <20220407020432.4062829-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=089d0ce6d=alistair.francis@opensource.wdc.com;
 helo=esa1.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Thu, 07 Apr 2022 02:05:28 -0000

From: Alistair Francis <alistair.francis@wdc.com>

Imply the TPM sysbus devices. This allows users to add TPM devices to
the RISC-V virt board.

This was tested by first creating an emulated TPM device:

    swtpm socket --tpm2 -t -d --tpmstate dir=3D/tmp/tpm \
        --ctrl type=3Dunixio,path=3Dswtpm-sock

Then launching QEMU with:

    -chardev socket,id=3Dchrtpm,path=3Dswtpm-sock \
    -tpmdev emulator,id=3Dtpm0,chardev=3Dchrtpm \
    -device tpm-tis-device,tpmdev=3Dtpm0

The TPM device can be seen in the memory tree and the generated device
tree.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/942
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/riscv/virt.c  | 4 ++++
 hw/riscv/Kconfig | 1 +
 2 files changed, 5 insertions(+)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index bec83d26fd..e435b1f118 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -43,6 +43,7 @@
 #include "sysemu/device_tree.h"
 #include "sysemu/sysemu.h"
 #include "sysemu/kvm.h"
+#include "sysemu/tpm.h"
 #include "hw/pci/pci.h"
 #include "hw/pci-host/gpex.h"
 #include "hw/display/ramfb.h"
@@ -1612,6 +1613,9 @@ static void virt_machine_class_init(ObjectClass *oc=
, void *data)
     hc->plug =3D virt_machine_device_plug_cb;
=20
     machine_class_allow_dynamic_sysbus_dev(mc, TYPE_RAMFB_DEVICE);
+#ifdef CONFIG_TPM
+    machine_class_allow_dynamic_sysbus_dev(mc, TYPE_TPM_TIS_SYSBUS);
+#endif
=20
     object_class_property_add_bool(oc, "aclint", virt_get_aclint,
                                    virt_set_aclint);
diff --git a/hw/riscv/Kconfig b/hw/riscv/Kconfig
index da790f5936..79ff61c464 100644
--- a/hw/riscv/Kconfig
+++ b/hw/riscv/Kconfig
@@ -34,6 +34,7 @@ config RISCV_VIRT
     imply PCI_DEVICES
     imply VIRTIO_VGA
     imply TEST_DEVICES
+    imply TPM_TIS_SYSBUS
     select RISCV_NUMA
     select GOLDFISH_RTC
     select MSI_NONBROKEN
--=20
2.35.1


