Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ncHW2-0004Y8-Pm
	for mharc-qemu-riscv@gnu.org; Wed, 06 Apr 2022 22:04:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=089d0ce6d=alistair.francis@opensource.wdc.com>)
 id 1ncHW1-0004XX-9w
 for qemu-riscv@nongnu.org; Wed, 06 Apr 2022 22:04:53 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:21848)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=089d0ce6d=alistair.francis@opensource.wdc.com>)
 id 1ncHVz-00079S-6j
 for qemu-riscv@nongnu.org; Wed, 06 Apr 2022 22:04:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1649297091; x=1680833091;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=oYMGMo7iSqDxWE6BrjILNoIiUBwtZZhnoBsmDHXyqT4=;
 b=mbfbr3P154NqpKvPQMkf+Dro4wKkhl2GGcCt2Xu+HtpRZWOz72ylP2DS
 Jnlx5rgpSsiC0wAJ8y8nfPXHDmWdj8SNnV9u4SXTC2Qi3A1YGMRXzRmJW
 O2/k1d26fBejvdK2Ej+iLPibWyrBCynZ+OHMXiBfrIfQXF8H8iqsm3M3D
 M5PcvoyBse+VMHES+MudYlghgcYiNK4xuQyJHMoRuJLtamGmvfkL5Zl8m
 JjxI1CxdtDqMNcsL4aMjCEM/J3Zau/b7RNEMVvDeal3NIgg9s4VTXIBQ2
 JWDJbxPZ2C0KtsgdkfMMc1DZaXpflh8X55AIzoUTkh+zWZkULAfAoKNaZ A==;
X-IronPort-AV: E=Sophos;i="5.90,241,1643644800"; d="scan'208";a="196170916"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 07 Apr 2022 10:04:43 +0800
IronPort-SDR: lg7XJJRFiOYbKLOPjOuuIGVyayGypolO4AHZ69w5Mg4zWY+NCaWBkATQpditQ1cx3xsyiY1VKd
 ffjm0E7D4p+Iabe9+19EIbkPG1TpJEcXiwHYWW8HqIWnrwJ8WKTqptgPFi707y+5oWWOGe7oSe
 ls9SQAvjBIDP5RvPZ/H5sFsL0VXRplmc/oFW+HO7sWOtfqjhAOweUQPm7f/rYtFX5HYcC16WSQ
 pKC5kbVehOmGHz4n2UWAMqjPl1zkpf+hDIA+yo3gNRn0NrMFqHILVWJbaBymcOl7ViFXwQJPfZ
 cAVxdNtEf0kO+NXQPYvDf1xy
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 06 Apr 2022 18:36:13 -0700
IronPort-SDR: VcElh7CNEhQ0AZwv/J6hG8FfoskluXCx/DJ1hSNdH+L/aEjA+r6tPSnhY93rq4fGqsZtQ48hzX
 KSXQtfyuWGibA/594w3FgBojMrvF1CyHX41RMSCnRjzH40Pr8Hex39mLaOHfbIE4FKc3Vvqq6P
 1Ax39XDKSmiaVWIkHvi6EZlaviTK0fsqEZtTg0fV/0010BBl+ich0iM/vJUSVF9uL3fEdYyRod
 3c0I/Tf87eb8O7PSvEyuOkqFzzPvleDVDdCHKvnh5bKqC/6Um1HkzX12QIDFz1ZUTnf4zrj0oY
 t70=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 06 Apr 2022 19:04:44 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4KYl7Z6ylDz1Rwrw
 for <qemu-riscv@nongnu.org>; Wed,  6 Apr 2022 19:04:42 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :content-type:x-mailer:message-id:date:subject:to:from; s=dkim;
 t=1649297082; x=1651889083; bh=oYMGMo7iSqDxWE6BrjILNoIiUBwtZZhn
 oBsmDHXyqT4=; b=AGZD4H9TsuMA4gnGO0ncZnzv+CtdMpymqp7fMtl70+qyC3f7
 lGZ61y6t3Vud+MRFCBVBa6F+mmr7G6L3kzH6Xvy3uNEwbA7o9Dd5SK5oxOYUyPaZ
 2s2BSXeqtLNlSvBzp00OvvBQjAApZhuwgjx6TEacAFqVhoYkMniZYutsXa0e5tnz
 9vHgRUD5mBR8dk3ugW6d/Tf4GoD82xUN9NyGm943aSpu4z7dV+wx2Dkl5mprMuPU
 njsoazlDR0f1VR5oFAmdhgyOU8yCiePSHHWSRuXdpVXeJGKi6sdRz19QiQ57abs4
 ZIdN8wEfParbiegeJj/w7mq6zEddGwE1SxwQ5A==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id snXtv3m-g8lP for <qemu-riscv@nongnu.org>;
 Wed,  6 Apr 2022 19:04:42 -0700 (PDT)
Received: from toolbox.alistair23.me (unknown [10.225.165.114])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4KYl7S5Vr0z1Rvlx;
 Wed,  6 Apr 2022 19:04:36 -0700 (PDT)
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
Subject: [PATCH v2 0/6] hw/riscv: Add TPM support to the virt board
Date: Thu,  7 Apr 2022 12:04:26 +1000
Message-Id: <20220407020432.4062829-1-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.35.1
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=089d0ce6d=alistair.francis@opensource.wdc.com;
 helo=esa4.hgst.iphmx.com
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
X-List-Received-Date: Thu, 07 Apr 2022 02:04:53 -0000

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
  hw/riscv: virt: Add support for generateing platform FDT entries=0D
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

