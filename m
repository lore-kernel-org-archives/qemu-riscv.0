Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nghkV-0003ub-Ds
	for mharc-qemu-riscv@gnu.org; Tue, 19 Apr 2022 02:54:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=101f09098=alistair.francis@opensource.wdc.com>)
 id 1nghkS-0003rg-K9
 for qemu-riscv@nongnu.org; Tue, 19 Apr 2022 02:54:04 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:61683)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=101f09098=alistair.francis@opensource.wdc.com>)
 id 1nghkQ-0004K1-LU
 for qemu-riscv@nongnu.org; Tue, 19 Apr 2022 02:54:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1650351241; x=1681887241;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=QSuHYOyhblpSDxm5ZLChlvRzUEPskl7wWcJ5MQSvdiM=;
 b=NeGGkfy+PFXMtL14tXcHT2XlWKbujKC0ue/u+z1NDipAJfY22TdJ1bka
 dlv9xEsFneG1/CappH3vhub6bKhhmsIy0QWm/nlWCYtxFCEZoifw7zlj6
 Iw73DE5tediVPm/wTgpM4GYx9j/1pH1wY3BCs30yCSc/2y+53OnfNRI5k
 SrQsR9DdtGE3ScHtYCIy20AXCC4CGUR5Qu4bhU8e44ykm8u0N4zWIL/hv
 +3gjEYIcRrj0sz7Qm02Vvx8B4ccvqYa4mFlZEexi+28FEjdmxGSMrPQsF
 VphQmsFAHe1JXJW72RygS/dexHQDTna6hounn7wkugdtWE/lrKOQyjix/ g==;
X-IronPort-AV: E=Sophos;i="5.90,272,1643644800"; d="scan'208";a="203101117"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 19 Apr 2022 14:53:51 +0800
IronPort-SDR: Vt4e6SRtDju9pvSPOTYRZiCDIm8kAqc4RzgWQXFoF8d+M/4azBexE8+NGePtsW6iJd4Vwel+Rd
 xPzScp5VkgYoGnftea9K1YQ9O5oRw5WMulM9PByNNuUz9qTdgHTSsVNSa/ON7uDCD3Iz36Bth+
 /8K63TzDmqdYBj/R7u2olqSL2civx1+R3ewoJ6wdL1f7eUUonxMycFAVblXP73dVjpvF020RMy
 bxg8QwBXn7rlicYFVpmFWPwJrMXfuPfWEZa0F3d0Z7+775GaRMQMfRxcaY8NB/uCl76pUguMIp
 16YU1i5Ul8P0xArZnJ84pl5e
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 Apr 2022 23:24:58 -0700
IronPort-SDR: k6y2e9XF2voRP2oGqKV9vVYigZKyROdRb+hBkNDEzlvEvgfkDV5tdexEvoe5raQhjgQH7CJoWx
 LBOJvoTXftQzp1X8Zj4dbFcPjXrO7q/AF+6eqyTKS3lPpPTIz8+j3o7mQwIXGUgqHyQGngyPH9
 ys7KtVEC/OFydD7qdStDgSrwepOtkF3Dl6Hrwrz4R9nia+spEOw9acG6NjJZAi6ncscaJnJf+F
 d1F2X1cYbCfnhvmDhKXOLKoBnSkI9PD+Ox6Aw3HAJZ3Ava7LQPCjJ8Fg5T+bIJXXtZOJdFPaFG
 AZ8=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 Apr 2022 23:53:52 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4KjDzg6STPz1SVp4
 for <qemu-riscv@nongnu.org>; Mon, 18 Apr 2022 23:53:51 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :content-type:x-mailer:message-id:date:subject:to:from; s=dkim;
 t=1650351230; x=1652943231; bh=QSuHYOyhblpSDxm5ZLChlvRzUEPskl7w
 WcJ5MQSvdiM=; b=sjmpdgAP/6LyP6xVygNIU7kQLna63ztFZDtTgkzoQjp625tm
 jJT09mwNfKxcRKPiMP9G6Z6paBVmJ6L30puuJZnJXvMo96INN7eRO/EyruvCsKjh
 yc8u9WpNFbleMETE/3mhErJA9+HNRi22z75lPBV7qPZweOtDqjDv9VZSVjdSJsCN
 4xEnY0HUdgtN8Gz0hkoHeKZ6VGpj18xEtHzWGx4tzmPLW0vKVl3QYrXxtKPu2sfc
 cFeZVUU0lPYYpGNxt8/D52KSC/PFSR9B4poxFwVZQWoL3vJqG5chC1Ct/Qv1BsgG
 av3Gr37uzg4uqdTZvTtZzU5AeImVv8SYzSwFtw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id kYiSHY8dzLUj for <qemu-riscv@nongnu.org>;
 Mon, 18 Apr 2022 23:53:50 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.119])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4KjDzb3F8kz1Rvlx;
 Mon, 18 Apr 2022 23:53:46 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, alistair23@gmail.com,
 palmer@dabbelt.com, bmeng.cn@gmail.com
Subject: [PATCH v3 0/6] hw/riscv: Add TPM support to the virt board
Date: Tue, 19 Apr 2022 16:53:36 +1000
Message-Id: <20220419065342.878415-1-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.35.1
Content-Type: text/plain; charset="utf-8"
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
X-List-Received-Date: Tue, 19 Apr 2022 06:54:05 -0000

From: Alistair Francis <alistair.francis@wdc.com>=0D

This series adds support for connecting TPM devices to the RISC-V virt=0D
board. This is similar to how it works for the ARM virt board.=0D
=0D
This was tested by first creating an emulated TPM device:=0D
=0D
    swtpm socket --tpm2 -t -d --tpmstate dir=3D/tmp/tpm \=0D
        --ctrl type=3Dunixio,path=3Dswtpm-sock=0D
=0D
Then launching QEMU with:=0D
=0D
    -chardev socket,id=3Dchrtpm,path=3Dswtpm-sock \=0D
    -tpmdev emulator,id=3Dtpm0,chardev=3Dchrtpm \=0D
    -device tpm-tis-device,tpmdev=3Dtpm0=0D
=0D
The TPM device can be seen in the memory tree and the generated device=0D
tree.=0D
=0D
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/942=0D
=0D
Alistair Francis (6):=0D
  hw/riscv: virt: Add a machine done notifier=0D
  hw/core: Move the ARM sysbus-fdt to core=0D
  hw/riscv: virt: Create a platform bus=0D
  hw/riscv: virt: Add support for generating platform FDT entries=0D
  hw/riscv: virt: Add device plug support=0D
  hw/riscv: Enable TPM backends=0D
=0D
 include/hw/{arm =3D> core}/sysbus-fdt.h |   0=0D
 include/hw/riscv/virt.h               |   8 +-=0D
 hw/arm/virt.c                         |   2 +-=0D
 hw/arm/xlnx-versal-virt.c             |   1 -=0D
 hw/{arm =3D> core}/sysbus-fdt.c         |   2 +-=0D
 hw/riscv/virt.c                       | 312 +++++++++++++++++---------=0D
 hw/arm/meson.build                    |   1 -=0D
 hw/core/meson.build                   |   1 +=0D
 hw/riscv/Kconfig                      |   2 +=0D
 9 files changed, 221 insertions(+), 108 deletions(-)=0D
 rename include/hw/{arm =3D> core}/sysbus-fdt.h (100%)=0D
 rename hw/{arm =3D> core}/sysbus-fdt.c (99%)=0D
=0D
-- =0D
2.35.1=0D
=0D

