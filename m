Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1njrJ0-0005Ex-3L
	for mharc-qemu-riscv@gnu.org; Wed, 27 Apr 2022 19:42:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=109fe075d=alistair.francis@opensource.wdc.com>)
 id 1njrIp-0005BB-VI
 for qemu-riscv@nongnu.org; Wed, 27 Apr 2022 19:42:39 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:48854)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=109fe075d=alistair.francis@opensource.wdc.com>)
 id 1njrIn-0004cb-SA
 for qemu-riscv@nongnu.org; Wed, 27 Apr 2022 19:42:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1651102953; x=1682638953;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3rA4FRItsOqLVgQM+oGrFTLS5j2TeDg62u3vN5EeVYg=;
 b=eOA5bsT5Y+8SvLA/A5xUf2r87vXkbvBzdZbQLMeuQIG1RoZDNC2Hybr/
 ceAvUaIsVs8lLU6cMkWrERNiS5zxrcHbLyanfABcT62lJ3r4FgCHz7PcW
 2DG4PW78LIngV+nyH1yIwrSOAKqZ8FqR87XgycGtIShgHfGcWdG9+f/xM
 Gx6ZXCd2BZWLfiqN4taBohCZFZ2BOFRKSXX/uYILZv0JQX4eN+Ll3VUrZ
 h07UunGq3Z9HA3DCg+yf4nteRJ9nnt5/Rl/U4euSF4xZ0CXscbeXr1D3d
 p4y/r0icQBhoE63D6guUYR3g9m0qLEmiI+8NWmfqDIhRmWveqNnONfhKj Q==;
X-IronPort-AV: E=Sophos;i="5.90,294,1643644800"; d="scan'208";a="197844560"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 28 Apr 2022 07:42:22 +0800
IronPort-SDR: Ev0vIf0MVWnTWbeWshJccYk84maSBfBPP4552cXv4yE+2u3weLhQxTd6aW6qgZKy5gVZMD8YRU
 V5LD3wFoxtor0pbMFMzxpnVC7GHkh2c2G+rVNemdikcvJ/s1YEmN/WA57wxUARO9pV7e47KA08
 VqRLGihPUD9iFJn+si0SYAziWhF5IHnZsBpPjiRPpshAu6V8wnfSArgbucEdjU6bqOe+iG1Cfk
 Bfr6Pc3MMcG67HyYACgrzGmRqZ1WAxSWksn5yTTofzf52Q+ZKcn0TTq2yuti5KlzJiXhs54i6M
 bpZ/4aGwgcrBURPie8cflRMh
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 27 Apr 2022 16:12:32 -0700
IronPort-SDR: i7wAaqJ1YHErCL1uBPIZtfHBZeDu7Jj8Ms0F+FwLF3Dbla0b5iSfgbE5/Tu8ceKQNZug+umUN4
 glh9yltFpyglCA0GdazX5t/RZNphFUTqNjDZoIyQ7WW8vf5UV1EdEgXCfgpzEXNG6dHVHgc7HX
 rh8/xdlkLYVGcoZIX4F2sw56w93YjEMRj679106IMuL0InPBWQ+QEwWetcnrRdOGJ+SA/Mt3rt
 alYHpzvedV8kjz2HldqaW3CW1KnTz8WXNSf5R2iD7t9uW+JaIE0LvqvNbZru3cJ8qgiO0B727G
 wic=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 27 Apr 2022 16:42:22 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4KpZzd5jYrz1SVp0
 for <qemu-riscv@nongnu.org>; Wed, 27 Apr 2022 16:42:21 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1651102940; x=1653694941; bh=3rA4FRItsOqLVgQM+o
 GrFTLS5j2TeDg62u3vN5EeVYg=; b=QXq19D3WkOlc1ob3QnQrqtNoQdOAb8m8Fj
 4nBL7/x+YiXoubM6IvqTihc0ajhgAJsUV9pHg17fLYXHK+P5w+6eAs0MtEwPvHgY
 hfb4WGt3Ah8jhs8F0tgnUemtEOXqok/1ipVZziJIDcyBIXlhY4wuGuDFtUdULAwJ
 QxB9QO2HOWOTn0vm/mqE6fKF7WeqRZkQzQhvB+q+yH8SE9Nbf9jCNq7g6FV+LAv7
 2QVOwuVZ9hCozj24AaVaCgT7lg6RRr+pRkdz7y8lxSnDecHVHomsgg0uerZYOf0/
 vNswiF/fKS1n3ZkZhvXfNt5aUezpjs3VWbLJ2vnx/jj0vgorq8/A==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id Z5roYBjiIaGi for <qemu-riscv@nongnu.org>;
 Wed, 27 Apr 2022 16:42:20 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.122])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4KpZzY1YzNz1SVp3;
 Wed, 27 Apr 2022 16:42:16 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, alistair23@gmail.com,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-arm@nongnu.org,
 Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>, bmeng.cn@gmail.com
Subject: [PATCH v5 6/6] hw/riscv: Enable TPM backends
Date: Thu, 28 Apr 2022 09:41:46 +1000
Message-Id: <20220427234146.1130752-7-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220427234146.1130752-1-alistair.francis@opensource.wdc.com>
References: <20220427234146.1130752-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=109fe075d=alistair.francis@opensource.wdc.com;
 helo=esa4.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 27 Apr 2022 23:42:39 -0000

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
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
---
 docs/system/riscv/virt.rst | 20 ++++++++++++++++++++
 hw/riscv/virt.c            |  4 ++++
 hw/riscv/Kconfig           |  1 +
 3 files changed, 25 insertions(+)

diff --git a/docs/system/riscv/virt.rst b/docs/system/riscv/virt.rst
index 1272b6659e..f8ecec95f3 100644
--- a/docs/system/riscv/virt.rst
+++ b/docs/system/riscv/virt.rst
@@ -162,3 +162,23 @@ The minimal QEMU commands to run U-Boot SPL are:
 To test 32-bit U-Boot images, switch to use qemu-riscv32_smode_defconfig=
 and
 riscv32_spl_defconfig builds, and replace ``qemu-system-riscv64`` with
 ``qemu-system-riscv32`` in the command lines above to boot the 32-bit U-=
Boot.
+
+Enabling TPM
+------------
+
+A TPM device can be connected to the virt board by following the steps b=
elow.
+
+First launch the TPM emulator
+
+    swtpm socket --tpm2 -t -d --tpmstate dir=3D/tmp/tpm \
+        --ctrl type=3Dunixio,path=3Dswtpm-sock
+
+Then launch QEMU with:
+
+    ...
+    -chardev socket,id=3Dchrtpm,path=3Dswtpm-sock \
+    -tpmdev emulator,id=3Dtpm0,chardev=3Dchrtpm \
+    -device tpm-tis-device,tpmdev=3Dtpm0
+
+The TPM device can be seen in the memory tree and the generated device
+tree and should be accessible from the guest software.
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index da098917dd..fb99ff7708 100644
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
@@ -1617,6 +1618,9 @@ static void virt_machine_class_init(ObjectClass *oc=
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


