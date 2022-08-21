Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oPuan-00018L-Jn
	for mharc-qemu-riscv@gnu.org; Sun, 21 Aug 2022 19:42:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=225a36311=wilfred.mallawa@opensource.wdc.com>)
 id 1oPuai-000146-V6
 for qemu-riscv@nongnu.org; Sun, 21 Aug 2022 19:42:53 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:27682)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=225a36311=wilfred.mallawa@opensource.wdc.com>)
 id 1oPuaf-00034t-G8
 for qemu-riscv@nongnu.org; Sun, 21 Aug 2022 19:42:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1661125368; x=1692661368;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=rsGaFrNcWTjGlSxxEaBkSitBACK8HAoH4NGxPwI9aho=;
 b=SS1uea9KaGjYROQKpJiq51qTacMTz8in+19jCnsPOqNpsEpFoX6DLC6d
 ObMwIWWwWSmevnjEAMYCy//Nu4k9roQgzCDL9sack8Hmw7p6Iz9KhWww+
 rDhTX2UddlddPLL7SXUpepbiXE66XlNVqNmzLW6j4ELVErmJYHKZfTv83
 UvZBkgsBHwj/iwvCUd0NhuL+35D5VCTKNJTRrPsbFcShUEVhiJSSlv5sh
 RN5KT/VKuw5w2MidCMMHnn444FwwDyoAbHW5gAEhamwmq0B/Ve1dk5BQG
 KCSBd3dgfcPXnFlFBEMdeY+Td6Zz0YB1zXbpkWS1Gc6+lAZdNZwZPkCaf A==;
X-IronPort-AV: E=Sophos;i="5.93,253,1654531200"; d="scan'208";a="214404824"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 22 Aug 2022 07:42:39 +0800
IronPort-SDR: qESE1d/J1WWjCtKa2FL4SyaXt4PQTCcruEASLbS+WGZ4M7uVHAz5QZ6MEoAl4SlHeeFN2M0h7V
 QyDRUxU58fOIMSlLHm+59NssVC9bUMS5KmJObMa7p8g4twys+xTNUAE9oRQji0E44G23+DK6an
 Vi9S2lkHZEQ85UadFHTlshVhGjZCesJ1/8D4NShNaLaSDV/Xg4lmYsF8XJt53XoAmSTpj4wOHG
 rXTt2qQUBb0NfGyofdtgZOaeSkqUuWM2sq90jQTWOhkd3I/1nW1tbMr5lfeNgO1pJT5AVuiX/c
 Z0Ku+Zf/uB867KCKQY+jY9KV
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Aug 2022 15:58:02 -0700
IronPort-SDR: 5Z627kBXmD1ojkiQUjnoO1Wgt4CShJx7V8gevcmboriPMsrnI4A+lokXnGvgmuOnakHKdSxVM1
 nHse+bC+doMHsC8/42MV9LelQ0xVswPj6xO6d/lJrAaYVOKGFbQYG37CPym//vhitiu/1+p5sS
 310zGi2tHIt1uOOTotqKrGpTvRjoct8E/7UNV24Z9jDlMCs3+WLqQbUmPMFWBgZZ2gg/3UCYo+
 GPjJmnPFc+hhF9TDDjyiSWOaK20w7A32IJEBzv1i16LvJfpCS34H6OBtPwpUwjWON1Ubxe6QUe
 AU8=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Aug 2022 16:42:40 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4M9sVS1Qltz1Rwnm
 for <qemu-riscv@nongnu.org>; Sun, 21 Aug 2022 16:42:40 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :x-mailer:message-id:date:subject:to:from; s=dkim; t=1661125359;
 x=1663717360; bh=rsGaFrNcWTjGlSxxEaBkSitBACK8HAoH4NGxPwI9aho=; b=
 LgC0fymTij6fPluEtpk1G327C1C1RYZG/g22q0Q56+bMPexnYbevcj8ypWJmbON9
 uOVquY4oOMLulr5udaVzLvQPUodEAVZLa3OvzfteTe9CxC6Ii71tjoHx7wBUf9qu
 u9IOcJmm4u2hOS+rJTGtkXDot6Ssx4u6UWZ/c98cVIkcIoCRalSc3N04AB0VIdzl
 cmWfyYpEd5ZEbNx34+sug4wuLQ2deKzxQJ4IDolD2D7cD8MYBGHBD+bjEVNPKmqN
 SHCkRMK31cLs4y/P45ZVcXK5h5QhW6UQD4c2z4e6ejxsVjAeyhTs381+mdw+fv+Z
 a2ake6nUt2ourr5SIE9xmg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id EINelaIesW_C for <qemu-riscv@nongnu.org>;
 Sun, 21 Aug 2022 16:42:39 -0700 (PDT)
Received: from fedora.home (unknown [10.225.165.39])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4M9sVP3p6Mz1RtVk;
 Sun, 21 Aug 2022 16:42:37 -0700 (PDT)
From: Wilfred Mallawa <wilfred.mallawa@opensource.wdc.com>
To: Alistair.Francis@wdc.com,
	qemu-riscv@nongnu.org
Cc: qemu-devel@nongnu.org,
	Wilfred Mallawa <wilfred.mallawa@wdc.com>
Subject: [PATCH v3 0/4] hw/ssi: ibex_spi: cleanup and fixup bugs
Date: Mon, 22 Aug 2022 09:41:57 +1000
Message-Id: <20220821234200.34052-1-wilfred.mallawa@opensource.wdc.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=225a36311=wilfred.mallawa@opensource.wdc.com;
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
X-List-Received-Date: Sun, 21 Aug 2022 23:42:53 -0000

From: Wilfred Mallawa <wilfred.mallawa@wdc.com>

This patch series cleans up the ibex_spi driver,
fixes the specified coverity issue,
implements register rw1c functionality and
updates an incorrect register offset.

Patch V3 fixes up:
    - Style errors (excess indentation on multi-line)
    - Remove patch note from commit message in [2/4]

Testing:
    - Tested with Opentitan unit tests for TockOS...[OK]

Wilfred Mallawa (4):
  hw/ssi: ibex_spi: fixup typos in ibex_spi_host
  hw/ssi: ibex_spi: fixup coverity issue
  hw/ssi: ibex_spi: fixup/add rw1c functionality
  hw/ssi: ibex_spi: update reg addr

 hw/ssi/ibex_spi_host.c         | 172 +++++++++++++++++++--------------
 include/hw/ssi/ibex_spi_host.h |   4 +-
 2 files changed, 104 insertions(+), 72 deletions(-)

--=20
2.37.2


