Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mOB9b-00073F-0t
	for mharc-qemu-riscv@gnu.org; Wed, 08 Sep 2021 23:55:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=879ac4819=alistair.francis@opensource.wdc.com>)
 id 1mOB9Z-00071M-Iw
 for qemu-riscv@nongnu.org; Wed, 08 Sep 2021 23:55:09 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:13241)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=879ac4819=alistair.francis@opensource.wdc.com>)
 id 1mOB9Y-00067t-0y
 for qemu-riscv@nongnu.org; Wed, 08 Sep 2021 23:55:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1631159706; x=1662695706;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=7F9IXXP60JX52d85pljg43t1k6mm8CfBsugYwM02zpI=;
 b=m5x9snYhI5AuGi81dhWPjHnTEhmDyZverMDoWH1e0MjsC/uMABiMCTU0
 muFniM9kH9X38CvzywZcmttROjNq/macyZ2xTTdPSiWOqbsY6UsVfVeSW
 8gAtLxrGzje30OGbqtJ1W7GMYhOgc58DYcLlcqDAHpylpydBfQOwuoJtx
 VppLxqnmr5ALEisbYk38YC6MLtt6DWNYpRuZF7oAmHt+dWGiLPp4MlsfY
 XLaFo4RsWBQ1F1o9yoXsQSRVElfPpYTzXa+r0JnfzkAsvVgSHEc5cmdmf
 mOh7ywm4qcaU/09QbRe3ugLdHQYzFQeJAOr6qqrCNl+31wWHJZtzFxEZX w==;
X-IronPort-AV: E=Sophos;i="5.85,279,1624291200"; d="scan'208";a="179540903"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 09 Sep 2021 11:55:00 +0800
IronPort-SDR: 95mUOVaTft93TVO1Im9ALTNg/cmPYKZIrXNHAGk+VVTY/3F6dRq1T8C6JxooKA7d0FO0Gz11PT
 YdaWgDxvK/18b8ap2W3rOv1Klcf6/eT9x35Y26nCxkBNfygMYLfSy/D7j7nz2KucZisLmCuAb2
 QlM/zQzFIZj+iOiEsGCfKRrEPQ5kmXE5RWOmNhOx6wou+sBmixlj1J/BOUJiq/HE1GCN/FmNRn
 6+yi54VYG39+J7BOiL4IUgqLS0eJz0z0mCZix5u3iMI9pPO7kKlA+WLuRjDTy8nqRknquKYSUf
 uSJFZkpCZNkwdtW6/+0A1Gcb
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2021 20:29:58 -0700
IronPort-SDR: +IdVmrwOkPGZjZEJvbPYlF81JypFVjWCLBJhoRkFAhSqkMXK5QKCz4mjmFataZ8UIXHoQb6TO9
 WR/y3cGd29yu3d8oDAXMJIABJ3J37wPvyzHY7tqyovRUoWn2KiWiGZFCSdeZ8Ie44krCj1ocA5
 YR13gI20J3DoA81oEcTxy4kAh865KBm5FQ6TgDnazCWKZVZU9v+Vo+7h7IJGe3jdmyMXU06U5J
 SoGqc+LZFN61mjpM265dG4jrqsuCDy7VPwNdOtCSkLvlOgf6C8SEmtS/mxreJpD46v4nEAGwCx
 dFI=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2021 20:55:02 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4H4lWn1Ytjz1Rvld
 for <qemu-riscv@nongnu.org>; Wed,  8 Sep 2021 20:55:01 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :x-mailer:message-id:date:subject:to:from; s=dkim; t=1631159700;
 x=1633751701; bh=7F9IXXP60JX52d85pljg43t1k6mm8CfBsugYwM02zpI=; b=
 Y88uXAA0m5hcZHG7CPepqJJL9m+4L6sx7fGhFFyYgW/nNUG5gJO+gh7ezQrjffa/
 PFOKBGlWH4AXHTYA6vl93MrWsBdV7kPaqb7oQaQOud6qMwj4bb3RL8xdkADBRDDf
 jywpSDhYWedexkYWRoO53SeQ7IciWhO1O03I2pTaFRNk4dJJpRtQDAR9xGs/pyFL
 fPDbxlZ4V677wwHTxljOzjqVv9wRt62A3i10zxzNbBzXzWGJM5DGyu/MnCSSC6a+
 CYal3frRXol3uHrH569oqg7SRgAo+sJxITAag6ZnaiZ4pFRxAaiKDiM+Ekyurczw
 UYDTN1dtWOoZ2z1JuQKZHQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id tzXog3QW0ATp for <qemu-riscv@nongnu.org>;
 Wed,  8 Sep 2021 20:55:00 -0700 (PDT)
Received: from toolbox.alistair23.me (unknown [10.225.165.20])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4H4lWh1SjBz1RvlP;
 Wed,  8 Sep 2021 20:54:55 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com
Subject: [PATCH v3 0/2]  Add the SiFive PWM device
Date: Thu,  9 Sep 2021 13:54:49 +1000
Message-Id: <cover.1631159656.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=879ac4819=alistair.francis@opensource.wdc.com;
 helo=esa5.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Thu, 09 Sep 2021 03:55:09 -0000

From: Alistair Francis <alistair.francis@wdc.com>


This series adds a the SiFive PWM device and connects it to the
sifive_u machine. This has been tested as a timer with seL4.

v3:
 - Small fixups
v2:
 - Address Bin's comments
 - Expose PWM via the device tree


Alistair Francis (2):
  hw/timer: Add SiFive PWM support
  sifive_u: Connect the SiFive PWM device

 docs/system/riscv/sifive_u.rst |   1 +
 include/hw/riscv/sifive_u.h    |  14 +-
 include/hw/timer/sifive_pwm.h  |  62 +++++
 hw/riscv/sifive_u.c            |  55 +++-
 hw/timer/sifive_pwm.c          | 468 +++++++++++++++++++++++++++++++++
 hw/riscv/Kconfig               |   1 +
 hw/timer/Kconfig               |   3 +
 hw/timer/meson.build           |   1 +
 hw/timer/trace-events          |   6 +
 9 files changed, 609 insertions(+), 2 deletions(-)
 create mode 100644 include/hw/timer/sifive_pwm.h
 create mode 100644 hw/timer/sifive_pwm.c

--=20
2.31.1


