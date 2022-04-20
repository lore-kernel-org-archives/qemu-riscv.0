Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nh3H2-0007pA-4e
	for mharc-qemu-riscv@gnu.org; Wed, 20 Apr 2022 01:53:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1021dae20=alistair.francis@opensource.wdc.com>)
 id 1nh3H0-0007oF-IV
 for qemu-riscv@nongnu.org; Wed, 20 Apr 2022 01:53:06 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:41244)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1021dae20=alistair.francis@opensource.wdc.com>)
 id 1nh3Gy-0004Qd-OY
 for qemu-riscv@nongnu.org; Wed, 20 Apr 2022 01:53:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1650433984; x=1681969984;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=QSuHYOyhblpSDxm5ZLChlvRzUEPskl7wWcJ5MQSvdiM=;
 b=Brr/gxL2R2q1ljM6tJEOEhggWgbd6kU8uJwhcydjYWT0iuDwDvLV5ICO
 OCM2peeEOia2ePhUkMyGskr6AA3VVTDJj1b7ekSECIxyYaZXEqfYfvwPM
 mBhWmYnozz9chRb3F3goNctGXVThPNnRD/1Prc4ZtzVA9q5cINoqgSu1k
 As+JZZ+vK6EXHTJEH/qOaLOYUiiI2/wBuMRyB58wp0jd2olc/LKJzdYUo
 OefjPyDW/2eJcFbn2lraosvi0XNON40Y6Me87NfwJHpPj2u+lVd0NhAb9
 ADUFIweSyPS6dMZYVqy/eW0I0Ws2iqktn05ztEe2LWmEN4S9ca2ExgMTc Q==;
X-IronPort-AV: E=Sophos;i="5.90,274,1643644800"; d="scan'208";a="310304315"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 20 Apr 2022 13:52:58 +0800
IronPort-SDR: zjDLowO5Rc23++cVV00gkK8z6r13xQqPZL5Nl46SC63FFrF6mvxNtsls+GAdZq3SPDUT2GMlp3
 cV8hwobW1n5DKPkrInJEHpvWT30lI3+A6LIT98ZY9dR4Gd5wUUvNy/TcUxutTQ/GzjFZYuagJp
 xiLFJVmhrQfMPu7dl/M3/B+6q9vTjzFPb++7Z1msyzIXImVqrM+hj4g8eMpM05onRdiasMV8lD
 GdcxCyxCMQvsF6G8Yt0/zaD0UYwlTz6vTZUmQWCazejvVICX+gkPFlAYwN37RTinDb8JCtfv7H
 1lYHbDSW18g+X3OeH9oyfzzt
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 19 Apr 2022 22:23:17 -0700
IronPort-SDR: yd7db5ZSeU+IX514O9VKnu3vy7H6WW444KqAu+Zeasn8p3CtvSiqHWUFL2goCrZJeOa3mdcM85
 HOKGk7/Zcx1KVpkqyxMFWzppsB8dyOY9whMAHViICN07I6CKzDPHoYrDDG7CvP9avU3N+sr1ye
 6WtK5wiJnn/QVpR76ue/ZAIDNbzpf9irafB0DpUeqFjr7rwt6rc83Y63hwdbqEBfnpbAU7/hC2
 AkRtPWi5pLiYz/sR+c9rvWNfl+tLbcl4ANZ/buUWX2clqD2o7boY+GnxgkTPrwtqQBzqExugzq
 Vso=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 19 Apr 2022 22:52:59 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4KjqZy0ljVz1SVp7
 for <qemu-riscv@nongnu.org>; Tue, 19 Apr 2022 22:52:58 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :content-type:x-mailer:message-id:date:subject:to:from; s=dkim;
 t=1650433977; x=1653025978; bh=QSuHYOyhblpSDxm5ZLChlvRzUEPskl7w
 WcJ5MQSvdiM=; b=VT9CyLNDtlpH7sgVfx6r0wh10ZqLGIOvRgIzdpQINV9YE5bd
 ow3tDO4RQs1LNPMpvImu6neqf1nyKSY96ShNBxOOT7SU3lGQz3hZZc3HLF4IEl41
 KvFCo17RYzkBbyVOE9MqjuI2UrQ/Uq6PE/p+ilkX6mpfal1gkKRWUqTi/g4wX8a0
 mMzIpNNTovnSjwjuSKsmHTCkDxhCdtQjOt6HXm436uYTtmhcXLoKgs8wF+J6ol6K
 OzJ8uCC3d3HKzc1tcsSUz6L5As8u2jnegsuc1CQnRKvbGNVvoVE8LdVTEtd7fBoz
 CMFYi2VzPVJo64aWyycX/BNNVKrnN359ICi50Q==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id uwss8On6Hsat for <qemu-riscv@nongnu.org>;
 Tue, 19 Apr 2022 22:52:57 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.119])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4KjqZr5Qn4z1Rvlx;
 Tue, 19 Apr 2022 22:52:52 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair@alistair23.me>, alistair23@gmail.com,
 Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, bmeng.cn@gmail.com,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Subject: [PATCH v4 0/6] hw/riscv: Add TPM support to the virt board
Date: Wed, 20 Apr 2022 15:52:42 +1000
Message-Id: <20220420055248.960491-1-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.35.1
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=1021dae20=alistair.francis@opensource.wdc.com;
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
X-List-Received-Date: Wed, 20 Apr 2022 05:53:06 -0000

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

