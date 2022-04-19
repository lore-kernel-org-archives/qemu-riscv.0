Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nghkk-00047T-42
	for mharc-qemu-riscv@gnu.org; Tue, 19 Apr 2022 02:54:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=101f09098=alistair.francis@opensource.wdc.com>)
 id 1nghkg-0003zR-61
 for qemu-riscv@nongnu.org; Tue, 19 Apr 2022 02:54:18 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:61796)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=101f09098=alistair.francis@opensource.wdc.com>)
 id 1nghke-0004MC-Dt
 for qemu-riscv@nongnu.org; Tue, 19 Apr 2022 02:54:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1650351255; x=1681887255;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=54LNDcv7kZB26uhwQDpQcWJg6cxn2r4zaQ0u9RhnAYA=;
 b=SrWVGEF7zq5EdDFko8o/n4L7nGh01ZwYKPxyx9WETL7qOc5R96llDpxo
 NmXaj6HbtBThaPDIgdnDZk6nQZvTj5ysjn0Z0pjoH5DiKTsFefUgecgQN
 fDbfsbbkR05ICRWjiw51c9K3Bhx04+Lbfq2XOnF2eLdSyOqMv1U+rO+Go
 MsRX0zYGI4Vtt2H1gTRy9DvPc1ODx+JFe6Z+6PdI3IsCsWjHGvf4zySc2
 BGNEG+hIEDlUCfAmnJit6XVsyYtmw4jgbcvSOi6BgnRQrNkjDD8irUekN
 yiwdzJg0UPD/LhB879jZM3w3hP5J6b2dHPbgl1x1hXVa2f/x0vChDErkM A==;
X-IronPort-AV: E=Sophos;i="5.90,272,1643644800"; d="scan'208";a="203101189"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 19 Apr 2022 14:54:11 +0800
IronPort-SDR: vKnLghu62yvcVjtcQGazmN2T0h4G6KREr/3+avXTeNjuq2OWSADMdHwxGgBaQWBsvNtwgH6RXp
 CzViO41D/wBPj2e3Uxf3vXFpVov0CJxbsrjF7L+AVFfnhQoZ6G9X6P1QZvQgQ/hVPYOQSEyq0b
 L9C1/vSF7x6vvqrcaFGLZOV7k8CLD0zgxDNt4JXhBcdaBMGlPLq5g5C5v8fcHNoA8OaLKD8zYw
 HUAMXjTcug61izBDpnpfWWSw/516wq2oVdDe2F2o2xj+F63uwYUfb9j+Obt6q3cE5TZS1n7+Wz
 RkJ/amz5C7sUSVx23+RnVSlh
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 Apr 2022 23:25:18 -0700
IronPort-SDR: lc8B5oP8asZCLcjb6EfUa0A2y65AGE3ZmxDzJBiSww9S0YJL1Sk/djwawbDRhJNAVRnRCn6H6h
 mO5ZWnBtq6olFcq3nHBXurg5B3mdzCthG53Zqf8rRKUUHVT2X/haMdbIdmJ8kgggslaF7+LKWf
 gWsqXudMSrz2wNELZAof/oqnVYKgz2l7bq3h7T8qUIioxReCAl78+aZCP2ZXEm2cffrm0lvIGh
 wSh0eMDw950XG6/hMosnZkrI5P0i6FGPNdH0zXD+gK6e2LH8/J5eRD5WHqzjUf4P9H17+Dw/91
 8dA=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 Apr 2022 23:54:13 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4KjF043cYVz1SVnx
 for <qemu-riscv@nongnu.org>; Mon, 18 Apr 2022 23:54:12 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1650351251; x=1652943252; bh=54LNDcv7kZB26uhwQD
 pQcWJg6cxn2r4zaQ0u9RhnAYA=; b=ajApXSrc+uwOayU6HzLZd4+MJrsGBfYpgk
 WP0UMD+kMZRvBcO9P9+BxxbctL8PEkliaOA0rW4cAGa681/B6/vsJOiDDbVTucSJ
 kddVyIqlUFvoOTbexQaVQcZVU2UcFMLGR7SPC4lmnU/+wzz1KQZdwn2N14o4FxP2
 FT9xcZf2beLo7HW5TcdBi53pF8+5/Zv2h9ATCs4/ujcshn4nmabG5o2gHFVAb6iS
 KftrOfaPxhOzPEVxlXzoAGIjbZsLnb+yOX5HWYekATP2E2mii0jcSUOkRDFCpX6k
 uwkkEjN+umIw/llL3o1OKjy/11BiVIfP4MUD0LB6Aplry8h6VlYw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id IMTnGn8lHgAb for <qemu-riscv@nongnu.org>;
 Mon, 18 Apr 2022 23:54:11 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.119])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4KjF006QCNz1SVp3;
 Mon, 18 Apr 2022 23:54:08 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, alistair23@gmail.com,
 palmer@dabbelt.com, bmeng.cn@gmail.com
Subject: [PATCH v3 6/6] hw/riscv: Enable TPM backends
Date: Tue, 19 Apr 2022 16:53:42 +1000
Message-Id: <20220419065342.878415-7-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220419065342.878415-1-alistair.francis@opensource.wdc.com>
References: <20220419065342.878415-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=101f09098=alistair.francis@opensource.wdc.com;
 helo=esa3.hgst.iphmx.com
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
X-List-Received-Date: Tue, 19 Apr 2022 06:54:19 -0000

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
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
---
 hw/riscv/virt.c  | 4 ++++
 hw/riscv/Kconfig | 1 +
 2 files changed, 5 insertions(+)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 6eed1f4d70..b62fd66a49 100644
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


