Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1on8TM-0003AQ-8f
	for mharc-qemu-riscv@gnu.org; Mon, 24 Oct 2022 21:11:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=290a5aa6e=wilfred.mallawa@opensource.wdc.com>)
 id 1on8TJ-00036E-EO
 for qemu-riscv@nongnu.org; Mon, 24 Oct 2022 21:11:14 -0400
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=290a5aa6e=wilfred.mallawa@opensource.wdc.com>)
 id 1on8TH-00013V-Sx
 for qemu-riscv@nongnu.org; Mon, 24 Oct 2022 21:11:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1666660271; x=1698196271;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=0s/ks0F2M8fn5m4+xFB4lCmYgbP5PpTyNuQG1wQctJ8=;
 b=APhiNbt/e+yWnqcO2atdyKbqBs1bg4hae1qELyfYm62/a3yxuWnqmjQK
 +DmEBKuMsvlieVYfZNRnosrKYiQ8vZaQL5CweiiXZ7ODEX/+sW9sZ9aqx
 XSUDTpXG2ygkaFT9NG5JK8tFkkMB6/rM7DzVFRvF0W3e2q8JeOlggAuZv
 Hasn9rOS9QwdieWvh9ox66kjFwKnlDmHTlBl4TG2ZxBTRL1XDsYxeAv/6
 swV/f8wcXPsCza3pRdKHEzZkVev97Uwg899nsStkOsv6SVL1mzBV5NeOy
 qeQGWVsU9Nrlcqqk/Xl7LqLmgZY3rqe3FY/o9kehTzVjxAVyRdazu1mN9 g==;
X-IronPort-AV: E=Sophos;i="5.95,210,1661788800"; d="scan'208";a="215012532"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 25 Oct 2022 09:10:56 +0800
IronPort-SDR: +ndA/sb9RUD5Ewlqy1Cm6Y8oml4ABWcPQHQdvzyt1SXQxUA0UUJ+O+/eL/sE74DjFG0fN92BDH
 QXGsguTfVSMLQdMVIuHQz2EGqu/k51Ya9q8Qq3NGh59JCRuwsjOgg5f5tWZitelKkXJDVW2TZ7
 rDbbKTkjK0XELgNZX/Od0OgvzVHKIDfy0syOjhQbcY5Godmy73+Qf4Uxe4YgXN+21TX2LBBKgU
 aZKeQGT9Bxd+fmOAFqNxmeCW3dpS8E0qYm6atmCYF2Qf6Q45K7AIV6+J0sbl9sFu/qqoHLf9f7
 NdzWPCY6Se6M5ybVspNxF3Sd
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 24 Oct 2022 17:24:38 -0700
IronPort-SDR: Jk3TSBvOCZv+biw99BJ+OHGY2xgTuKHt1i99j8mFFecaMeJlNnUxgHmiTf6ObmulNfkP+vNbTu
 eDLfBUBvZK7nq/CoF3QCJY6NT8OLRrffVvFT8w+uVEnHsiEYFWQjD8d8xrv7mOjsfTmB86vcPs
 OMMFIhxJznqCzKDSW3lePMURJRACedYdavAKUWcZrLb++J+darePr4F/9fpYHPpq55izSQqYgL
 l2OmYuwb2Dgpi8+U5uJG36hV+ejKFkk7He14JHHTEUabSKy1C1ziYD/MJUPO42W/hFKjFPRLQ1
 Ekw=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 24 Oct 2022 18:10:56 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4MxDQl5S2jz1Rwrq
 for <qemu-riscv@nongnu.org>; Mon, 24 Oct 2022 18:10:55 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :x-mailer:message-id:date:subject:to:from; s=dkim; t=1666660255;
 x=1669252256; bh=0s/ks0F2M8fn5m4+xFB4lCmYgbP5PpTyNuQG1wQctJ8=; b=
 bvmXIp+8spdpcCbMh9obf4TfAjSqCyoe7fyTMjvE7Ub9V/yKEKH+UsLTVSU56/ZR
 KWAeJhNDnqvYzdIQ15TdxCWXhGCkRVZ8keU2O2Fk1giOtcK1iPyP20tgEmDjjE0j
 1rn+jVtuDdywZ6eVveC1JTUH/ti3M9sU/FdnCnZN54GXhbtIVDTR6oZuOCB8b99R
 FpDY5r8wJsAMg2WEOgwTzdSu1qi6OpJhMs7GW5W7Mr/tbPZ4myE9vB/qoQwM6BpN
 C8TPn2TJ5FFrEYfTqNozi1KAKKUL6xK8TvasqhwQqvcmvAH+HoK9PjS5FolttiQD
 XZcdU1Vt5Ulj89nr/TtSDA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id OwcNgT5o4od1 for <qemu-riscv@nongnu.org>;
 Mon, 24 Oct 2022 18:10:55 -0700 (PDT)
Received: from oni.wdc.com (unknown [10.225.165.77])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4MxDQg6rnRz1RvLy;
 Mon, 24 Oct 2022 18:10:51 -0700 (PDT)
From: Wilfred Mallawa <wilfred.mallawa@opensource.wdc.com>
To: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com,
 qemu-riscv@nongnu.org
Cc: qemu-devel@nongnu.org,
	Wilfred Mallawa <wilfred.mallawa@wdc.com>
Subject: [PATCH v0 0/2] hw/riscv/opentitan: bump opentitan version
Date: Tue, 25 Oct 2022 11:10:39 +1000
Message-Id: <20221025011040.246503-1-wilfred.mallawa@opensource.wdc.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=290a5aa6e=wilfred.mallawa@opensource.wdc.com;
 helo=esa6.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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
X-List-Received-Date: Tue, 25 Oct 2022 01:11:14 -0000

From: Wilfred Mallawa <wilfred.mallawa@wdc.com>

This patch provides updates to the OpenTitan model to bump to RTL
version <d072ac505f82152678d6e04be95c72b728a347b8>.

A unique change here is the merger of hwip `padctrl` into `pinmux`, to
reflect this change, any references to `padctrl` are removed.
Additionally, an unimplemented device for `aon_timer` is added and IRQ
numbers are updated.=20

Patch was tested by running the latest master of
TockOS as of this patch.

Wilfred Mallawa (2):
  hw/riscv/opentitan: bump opentitan
  hw/riscv/opentitan: add aon_timer base unimpl

 hw/riscv/opentitan.c         | 16 ++++++++--------
 include/hw/riscv/opentitan.h | 10 +++++-----
 2 files changed, 13 insertions(+), 13 deletions(-)

--=20
2.37.3


