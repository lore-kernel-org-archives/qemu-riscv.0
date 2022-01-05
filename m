Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n5EEL-0000S0-Mr
	for mharc-qemu-riscv@gnu.org; Wed, 05 Jan 2022 16:54:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9978dc08b=alistair.francis@opensource.wdc.com>)
 id 1n5EED-0000QK-G1
 for qemu-riscv@nongnu.org; Wed, 05 Jan 2022 16:53:54 -0500
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:17271)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9978dc08b=alistair.francis@opensource.wdc.com>)
 id 1n5EEB-0000x4-9n
 for qemu-riscv@nongnu.org; Wed, 05 Jan 2022 16:53:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1641419626; x=1672955626;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=hpS6JbyQ1xHELnVALzbFLxiaYKY0nysl4jpPNmO03mk=;
 b=fuNwECqJo627hF/BY0GDIoAWk8b6lrefY0cb3b+AM+ZvEP8qBVz88EqF
 o9xdeQ8M69E5+hg6tYnKiTiQWrDIYGruLx3Nf22SgfruO4m/F6pG0rMuV
 hWmtQqoCa7kqJv2KDOIzZYmdNm46aHpDFdLN9JUZ1CUb81W6DywDHiNH/
 CbjwTDs3jFOIcT38531Wb9BDr3dfbV98/rGVPqmX3Id6npogCoQeuUsue
 ilVNXXmEtdCN5G0Zbu74DFpwyABT4UKG8hMdj9fombTMYXJL03nFxry5p
 ZH2bfrWxRxwc89laYbKmBGZKi0fNe571Xqe4q9D/yoyJMv9X9q/lq3gfk g==;
X-IronPort-AV: E=Sophos;i="5.88,265,1635177600"; d="scan'208";a="194583048"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 06 Jan 2022 05:39:49 +0800
IronPort-SDR: 3ll+FBdTQy9RdWbCmDsN1A3qJljXrGeYMlfW/pusd1zs8m+L7Gbilm4TVS4Ats4osTksjyWR9I
 JcXhIjiy3F1c0owht7h0AkQOaQz44jGHRTknMenmPanzWCwzWmc9EQ0lI/P+zVVfgemqSXuvJe
 so/iuE59I7M8cfmolcmZplwo8HbN/2piPN+ulp00M8tU0pDu6z8IjOETs/n1uwBwwiItqD5MVq
 ATGfEtTXjZ5OUFxgf352Bk0Ij1kybGkTaq0l296NJwfBqV2sLbzG12G/qSvioXyHJ08T66Tvwh
 p+HpsGw1IeCTLpAKDdKPMbB/
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2022 13:12:20 -0800
IronPort-SDR: 3SjR8aD5ztSWjQZys5fueWpOaJZ2DNSmBKDD9QpiA52DLfCWc9HnMBdrAdY3auZPmDqXToQtrA
 Z8/HTEJWEoBU+s8XXS9ogJRUn1O4DzU2xTsvhAt/3FQ/X+gXhcFgxJ12BnIaweHJZjZQvyREpL
 Z15pPQHQkPbr2d+yuehDuBg901RIKaDhrHPXGTvWzSRCdCj/yVER7BKyTxIkXUHship/lf65xJ
 mHlz6k7VeIrfkcTYn0HERxbBTcszfEj6ZPWDZlftYevLMb9EC/p/Ve1AKq+JpqrdEeGlCcmIKq
 pmY=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2022 13:39:51 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JTjYx6yYSz1VSkd
 for <qemu-riscv@nongnu.org>; Wed,  5 Jan 2022 13:39:49 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :mime-version:x-mailer:message-id:date:subject:to:from; s=dkim;
 t=1641418789; x=1644010790; bh=hpS6JbyQ1xHELnVALzbFLxiaYKY0nysl
 4jpPNmO03mk=; b=rqHY/zp5jJFSZaT0epU+L8G8XkHR1C4ylGB3SljC8w2i0Yom
 HrXrTSubIEvpdKLRSV37JcpZPpzhVNkxUBAFTcZpWAe3zuBboRTtl+3FzEm9+hRE
 Sr2EHlp9nUMt+4v5Gza6wzPGK9IIYHSUztfkB7r+B9A7VHsnX7JU400yzK/T9CiK
 0wj3YX8PpExqCx8VNhqmRCd7iW8wVBvM4ftbG5QT+RpEuIeuxigWWjcHv8c9NWgf
 RnDTfm63IRs5uq/ZLoOY/ZUANqKQc92/JpZaWXIhw2Gvvr5b38e+XcLGv6tyvm3N
 MtWFID/TUE9xdnVEBMn+QTJwwLX68EJ/2vwN5g==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id cKJHTIx6SmNr for <qemu-riscv@nongnu.org>;
 Wed,  5 Jan 2022 13:39:49 -0800 (PST)
Received: from toolbox.wdc.com (unknown [10.225.165.73])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JTjYr0VkPz1VSkV;
 Wed,  5 Jan 2022 13:39:43 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, Palmer Dabbelt <palmer@dabbelt.com>,
 alistair23@gmail.com, Alistair Francis <alistair.francis@wdc.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>
Subject: [PATCH v4 0/8] A collection of RISC-V cleanups and improvements
Date: Thu,  6 Jan 2022 07:39:29 +1000
Message-Id: <20220105213937.1113508-1-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=9978dc08b=alistair.francis@opensource.wdc.com;
 helo=esa3.hgst.iphmx.com
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
X-List-Received-Date: Wed, 05 Jan 2022 21:53:55 -0000

From: Alistair Francis <alistair.francis@wdc.com>=0D

This is a few patches to cleanup some RISC-V hardware and mark the=0D
Hyperisor extension as non experimental.=0D
=0D
v4:=0D
 - Resend=0D
v3:=0D
 - Drop some patches=0D
 - Few small fixes from reviews=0D
v2:=0D
 - Add some more fixes=0D
 - Address review comments=0D
=0D
Alistair Francis (8):=0D
  hw/intc: sifive_plic: Add a reset function=0D
  hw/intc: sifive_plic: Cleanup the write function=0D
  hw/intc: sifive_plic: Cleanup the read function=0D
  hw/intc: sifive_plic: Cleanup remaining functions=0D
  target/riscv: Mark the Hypervisor extension as non experimental=0D
  target/riscv: Enable the Hypervisor extension by default=0D
  hw/riscv: Use error_fatal for SoC realisation=0D
  hw/riscv: virt: Allow support for 32 cores=0D
=0D
 include/hw/riscv/virt.h    |   2 +-=0D
 hw/intc/sifive_plic.c      | 254 +++++++++++--------------------------=0D
 hw/riscv/microchip_pfsoc.c |   2 +-=0D
 hw/riscv/opentitan.c       |   2 +-=0D
 hw/riscv/sifive_e.c        |   2 +-=0D
 hw/riscv/sifive_u.c        |   2 +-=0D
 target/riscv/cpu.c         |   2 +-=0D
 7 files changed, 82 insertions(+), 184 deletions(-)=0D
=0D
-- =0D
2.31.1=0D
=0D

