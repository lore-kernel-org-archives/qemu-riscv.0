Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1njrIP-0004lV-BL
	for mharc-qemu-riscv@gnu.org; Wed, 27 Apr 2022 19:42:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=109fe075d=alistair.francis@opensource.wdc.com>)
 id 1njrIL-0004eG-HG
 for qemu-riscv@nongnu.org; Wed, 27 Apr 2022 19:42:05 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:41218)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=109fe075d=alistair.francis@opensource.wdc.com>)
 id 1njrIJ-0004Sj-NV
 for qemu-riscv@nongnu.org; Wed, 27 Apr 2022 19:42:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1651102922; x=1682638922;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ERXRsvrdRjR3/CWi/AquJTXcEHYzT5IY+YvOoS6ba6w=;
 b=D2GE3ZAejfXTraoLOWLNQbHxqcOo8UqUiNA3fOpDlq/1KeIZ+MwXlb6k
 kgJ55twBQsSLQif3Qmg9huBbATGgyXKBROiNgZymYqo7avXtXX1tM8iSg
 ljiJPedDSjtJZtiesV+N4/eSb0MV0rHOjlV1Mu+rfsXbDVEzrCJcFwOXL
 vLP3XiVlrNsOfNzfpjk3N0FXILDc69l+/puQFQhvn/F4JBQ44lkDItDhn
 TQcM/P5V4iolClQQ+7NDvZK4pNFXRT+Auut6ue+nOfllov759ItcycvaS
 8H8S9Co8D2cPi9jgJwbTWh9g0+TzgCXX8tasUOmnRxYMvlciTwqhHoXE2 A==;
X-IronPort-AV: E=Sophos;i="5.90,294,1643644800"; d="scan'208";a="203873200"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 28 Apr 2022 07:41:55 +0800
IronPort-SDR: Kk5lMfAHaUz+h/Ls4lb4zi0dG9z6DrRGzQHWEXnzjS4uMe2jJRFzlt9lAXuGKDlWi+pApWtab2
 PnGE82V7aS1h0n/GKUcLwCCtOueZnlqupecWmJ2jHhEJAU1cRy5mKxBBaT4qF8fEXWwYmJx4S/
 ioQk+OFmC9zWzP62hH+Oeuy5FU8armkth6GLMGu1K34yBeqYMGEhbbFR2d42wDWgSQF9BMAPlj
 62Y03cEa4aT3w2VmlrLomkEiy+AO7A4eXcxhF+bUCBePOi5ppGtfS2Bd8Tawgm1hTdqC6k8yft
 8lWmvTsiPztMhi/+1zR353Gh
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 27 Apr 2022 16:12:06 -0700
IronPort-SDR: f56XfyF13rtwOi1bbn6vvLFGl6wlaBb09LYD5C1PzhidleEBU/emHXfyoMryGdNA+cnUUdPX3m
 NjCdGCeMEPvtPz6R488ps41BLLbwysURZ+X0ZmchrKZ4fW5X+SLTWBoqsVysEbzgQdZe7UOJ5e
 ZTjpML5VZOVyq2/KhfKBt6GhW9u2XXEa/YaLk+6VhrmI5N5JLS1HVxHA0/o4nfiuOOfWEBP4hG
 egMW9LyoiPwWudn5WgOUG0cqT7X1/RI2munO8UegYFEp72YZoIl59tj5tuhVjpQGqk89kcavfM
 VnM=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 27 Apr 2022 16:41:57 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4KpZz760Ptz1SVp4
 for <qemu-riscv@nongnu.org>; Wed, 27 Apr 2022 16:41:55 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :content-type:x-mailer:message-id:date:subject:to:from; s=dkim;
 t=1651102915; x=1653694916; bh=ERXRsvrdRjR3/CWi/AquJTXcEHYzT5IY
 +YvOoS6ba6w=; b=bWNajGsI0s5mVXwd3FIcyBkppP46NyKyx1YLr/K+sm5c+9Fg
 dXv1OU8MkSNag1bz9ZYpETVnvNzJHik88LFGrznOkRnTCSFIiyStiurc6rso5hk0
 yG1yfk5NahczEDPZV94O9e7WJNKJHegctF6yrY/kMGRPmpZF1H6ZtIkgfUjr+5ju
 5VEo6Bu0Ld6CuNfegH2J2RxZPmRnMlKey6tnKu+YG0bZljja0jee0nmxGpppWSha
 bpjfhVz4Ta88gopCBJRshzWMM8TdcNBJVllrQLAEG+roWbospZh/8cjdkpj+k4Oy
 LgMsYg+QRSivGPNJR+yXPa74B+mDcrFas8VrTA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id skdzAtKTsSU7 for <qemu-riscv@nongnu.org>;
 Wed, 27 Apr 2022 16:41:55 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.122])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4KpZz254Pvz1Rvlc;
 Wed, 27 Apr 2022 16:41:50 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, alistair23@gmail.com,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-arm@nongnu.org,
 Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>, bmeng.cn@gmail.com
Subject: [PATCH v5 0/6] hw/riscv: Add TPM support to the virt board
Date: Thu, 28 Apr 2022 09:41:40 +1000
Message-Id: <20220427234146.1130752-1-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.35.1
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=109fe075d=alistair.francis@opensource.wdc.com;
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
X-List-Received-Date: Wed, 27 Apr 2022 23:42:05 -0000

From: Alistair Francis <alistair.francis@wdc.com>

This series adds support for connecting TPM devices to the RISC-V virt
board. This is similar to how it works for the ARM virt board.

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

Alistair Francis (6):
  hw/riscv: virt: Add a machine done notifier
  hw/core: Move the ARM sysbus-fdt to core
  hw/riscv: virt: Create a platform bus
  hw/riscv: virt: Add support for generating platform FDT entries
  hw/riscv: virt: Add device plug support
  hw/riscv: Enable TPM backends

 docs/system/riscv/virt.rst            |  20 ++
 include/hw/{arm =3D> core}/sysbus-fdt.h |   0
 include/hw/riscv/virt.h               |   8 +-
 hw/arm/virt.c                         |   2 +-
 hw/arm/xlnx-versal-virt.c             |   1 -
 hw/{arm =3D> core}/sysbus-fdt.c         |   2 +-
 hw/riscv/virt.c                       | 317 +++++++++++++++++---------
 hw/arm/meson.build                    |   1 -
 hw/core/meson.build                   |   1 +
 hw/riscv/Kconfig                      |   2 +
 10 files changed, 240 insertions(+), 114 deletions(-)
 rename include/hw/{arm =3D> core}/sysbus-fdt.h (100%)
 rename hw/{arm =3D> core}/sysbus-fdt.c (99%)

--=20
2.35.1


