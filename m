Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mxin0-0002IJ-DD
	for mharc-qemu-riscv@gnu.org; Wed, 15 Dec 2021 23:54:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=977d27bfe=alistair.francis@opensource.wdc.com>)
 id 1mximy-0002I4-Me
 for qemu-riscv@nongnu.org; Wed, 15 Dec 2021 23:54:44 -0500
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:45669)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=977d27bfe=alistair.francis@opensource.wdc.com>)
 id 1mximw-0003oJ-2M
 for qemu-riscv@nongnu.org; Wed, 15 Dec 2021 23:54:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1639630482; x=1671166482;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=a5GlfVVoy9AEKVLH8CrZSSzqoUOWy1GWj6EYcgPFIq4=;
 b=q3kWMPhArRmHzr8shsl/lv/oafNzPm9+OC1/WUkI3FkXwLvdi/dHwWEh
 Uz7jTUNbykSxS+Y2JMQ7i7uvabZlujQpTxaB+Sh1pGob88WeSQrjwlsDQ
 XNcQZFwKMgU2gG4431z37mcvdeT2TFLAe9VsiXDQTKEmpo0J7r/NEJMc2
 3/Qkk5Gp412iiGzIvHlLMz/QlSE12Dxsit/yjxJCT0Pk9IsYHtv83M/D/
 joekzQ6v7wfG7aABA6cdlF7aGREcD0nf6rXrWNI15OeoKuXe3hyJLW71x
 TeXcApmruCnxHKxwFQ09lUZzeAbHXF5iipT1vDNcb8ohaz9WYO5Op5TC/ Q==;
X-IronPort-AV: E=Sophos;i="5.88,210,1635177600"; d="scan'208";a="189397522"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 16 Dec 2021 12:54:39 +0800
IronPort-SDR: o9N0QyddvjpR1XyvwYfC2bX1PWGWJZ+DL8jJP6fABZ0aVWNon/sWeO3MbMR2HXxbVT/6HcNnbF
 mS3SW4gm3jJn8DvO0S3gmmPVZoBqhWj6jLIuicIijuEmKwkBuciEOUdKKH3i/qBsTjCWO/L15d
 dZtNv9fNgMSpzMFscO++H2p+sEShxeOm6m4l9T3VvTuxpZkDZ2HJz8EathFxfKedOzss4xgPbm
 YC/yRcRP8ihKJ+tQgL9Ie84t56s7O45E/QTJJMFuDKPJEo/9GRfl0aI+3sr10AOcy4lwGgORIS
 qNuGVos8qdd2p9ieOB+Egl5M
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2021 20:27:32 -0800
IronPort-SDR: nfhRjvq8A73OTVcwu+9ur2qWevRON5lihsuEvTbE9Evo74pyIh/5VISKCkFCnwQcD9gz22+CEB
 vlGfcW/eKHLt/zvqjDV3pr6jswdK9aR5cIeLes0T7PduIk0rgOFzcg1oPZRw3zAJfOfR5i9XNT
 XeD2Lqn4nCkG7yCudUXORkRaTYVxCvbBAN5G8Ckk6kUp66lw6mQUBIIMtyZ1xXWZaybn2oPz1f
 St9SVL+XO/szOgolRtWehpR2TDxtJ4JooFcz9Cu7SnxHwpBoRXKg/MVIhbKdSY0tHZ9UAzadBn
 se0=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2021 20:54:39 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JF0CL3k9Nz1Rwnv
 for <qemu-riscv@nongnu.org>; Wed, 15 Dec 2021 20:54:38 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :mime-version:x-mailer:message-id:date:subject:to:from; s=dkim;
 t=1639630478; x=1642222479; bh=a5GlfVVoy9AEKVLH8CrZSSzqoUOWy1GW
 j6EYcgPFIq4=; b=jwJ9NXxdmiJAlAT7sR0eqRUeFdAemgG6mYkcljSOFB+3T/LR
 xrwV7rWH1Tcd0fraoHkcHIZsogPCarvHAFReAIl/va6kvJ8gqSh60mcfzg2PNx0j
 LwKO9d+msMu516Wuonf2g8zlFcPjssaHJQ28mk2aLVOHgE72LAlOgbegZrlVOb/0
 K8XkzC1LlSLa43bdj+FeoqXNdC0EbsQvG9rFxIHFf0p3AJu1IyKG3WXNVruAzLJs
 inDkiis/gGpJnmpaTRK8yNxMB9Hu/okD+DezwMgslxCHytWHhH0hnWqN6lwGRQB9
 IexfRF0Y1UmbbMDqWi48SAKJXXEK3B2DR7Sf2g==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id VUaO8_5Uyznd for <qemu-riscv@nongnu.org>;
 Wed, 15 Dec 2021 20:54:38 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.165.66])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JF0CF3Ssyz1RtVG;
 Wed, 15 Dec 2021 20:54:32 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>, alistair23@gmail.com,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, bmeng.cn@gmail.com
Subject: [PATCH v2 0/9] A collection of RISC-V cleanups and improvements
Date: Thu, 16 Dec 2021 14:54:18 +1000
Message-Id: <20211216045427.757779-1-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=977d27bfe=alistair.francis@opensource.wdc.com;
 helo=esa6.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 16 Dec 2021 04:54:44 -0000

From: Alistair Francis <alistair.francis@wdc.com>=0D

This is a few patches to cleanup some RISC-V hardware and mark the=0D
Hyperisor extension as non experimental.=0D
=0D
v2:=0D
 - Add some more fixes=0D
 - Address review comments=0D
=0D
Alistair Francis (9):=0D
  hw/intc: sifive_plic: Add a reset function=0D
  hw/intc: sifive_plic: Cleanup the write function=0D
  hw/intc: sifive_plic: Cleanup the read function=0D
  hw/intc: sifive_plic: Cleanup remaining functions=0D
  target/riscv: Mark the Hypervisor extension as non experimental=0D
  target/riscv: Enable the Hypervisor extension by default=0D
  hw/riscv: Use error_fatal for SoC realisation=0D
  hw/riscv: virt: Allow support for 32 cores=0D
  hw/riscv: virt: Set the clock-frequency=0D
=0D
 include/hw/riscv/virt.h    |   2 +-=0D
 hw/intc/sifive_plic.c      | 254 +++++++++++--------------------------=0D
 hw/riscv/microchip_pfsoc.c |   2 +-=0D
 hw/riscv/opentitan.c       |   2 +-=0D
 hw/riscv/sifive_e.c        |   2 +-=0D
 hw/riscv/sifive_u.c        |   2 +-=0D
 hw/riscv/virt.c            |   1 +=0D
 target/riscv/cpu.c         |   2 +-=0D
 8 files changed, 83 insertions(+), 184 deletions(-)=0D
=0D
-- =0D
2.31.1=0D
=0D

