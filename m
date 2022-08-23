Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oQN9R-0007pg-Jk
	for mharc-qemu-riscv@gnu.org; Tue, 23 Aug 2022 02:12:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=2270691b0=wilfred.mallawa@opensource.wdc.com>)
 id 1oQN9Q-0007p6-9Y
 for qemu-riscv@nongnu.org; Tue, 23 Aug 2022 02:12:36 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:20223)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=2270691b0=wilfred.mallawa@opensource.wdc.com>)
 id 1oQN9O-0000gh-JO
 for qemu-riscv@nongnu.org; Tue, 23 Aug 2022 02:12:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1661235154; x=1692771154;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=mYalqw0j3WMi5ZUrlGCkQL8FhyTQmY05Blnj0TnoUUk=;
 b=Zc2xoRFeGCidz5A9H6PM7zWwSCYo7b5uvqziph5zN+dNSTjyNgDHepZR
 NZgSYmGI0/wQQPtxRlEBGuDkDDy7Iw8hGXlKffp6lW33S/QR/55JyQhfg
 SGNPOvBVJ4w8kDoj3aRt7+atN+2sT+KyjHw4Gm/boHVhEOfZ7DnnWOVRd
 UdjqvSbL26Glh5tyy3QPvlIKa1VtYvuzwgZwkBf2b/wAhx0PrOQqzAPii
 nrMWNeJO2qTTvKin/kNLQyo4f8B7b5P7V1j8XgkjWmDh0pjDvAQDu0mKx
 DDRZxcGwsCtJIBxhQ6SqDK1zWyxoOivVmaAqBvfhce6UBXQQ2j6I0eVoB g==;
X-IronPort-AV: E=Sophos;i="5.93,256,1654531200"; d="scan'208";a="321495660"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 23 Aug 2022 14:12:24 +0800
IronPort-SDR: 8NSprwV5iwd/0STYvXZQ/zzew+QfurLnU06GoEBCE2hEpd3WxgQphaJt/APm6R76+ZCYXL1bPi
 PkMYl9MIy4yczNd9ZgKXWnj/bxRlgiCX1nv2Oo9MVjzxP4/nOY/ZesZ1Z1LQc3RPbTQ9S+Vt+N
 OTs/S+Q+iNTiRtzw/2RJ5i93ag8R8AfQibvf1ECtDv7SaVvbzwLKWcOGbusmFvhm2mpr+KhZWu
 m4rbtVs6CcM5asdPls2oBm66uzoTloOuGKTTJGfNkQQ5YCIIj4Uw5uWukN8ODJDld4a30SbzaT
 lx13igGO3gmzsONxrI7qh2CP
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 22 Aug 2022 22:33:03 -0700
IronPort-SDR: JeUmTULDamXHR1I2r1pf0AVSPriQaOkZKev1F2tJ/c98CGz9FxWZtjk0O6iLLZ97Pp5EvMwL2R
 GMeJ/NqFb/hCiRsR6M4uzYMjzBi/H47XqU8wzjhXLLRyowUJhii11fWzE4n/fPse5iff332N3Q
 XLM3tTsqF2gPQ0B7H2oGTDhiqMjywFZ+3WLw9n6hG3zJm6ELF8M3y4qokiPgDlCM26TW36fe9J
 dayWbjZ3rQPresDBjRXFD72S2pKTjVKKUXb5A5aUL48PquHhhVVh9ZPI7WPlhW1y2qHTrCy1Zi
 z+E=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 22 Aug 2022 23:12:24 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4MBf5g561yz1Rwnm
 for <qemu-riscv@nongnu.org>; Mon, 22 Aug 2022 23:12:23 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :x-mailer:message-id:date:subject:to:from; s=dkim; t=1661235143;
 x=1663827144; bh=mYalqw0j3WMi5ZUrlGCkQL8FhyTQmY05Blnj0TnoUUk=; b=
 V77SfRIEtjmYZuedo7L/2Gw+hayjPG1mjsnuSKwZ5Imq6S1c3cKB/kWrz91BE/Rd
 EjMmuG/pQY1AuXjfoHXBAz2kwlJoctLG7JbCGQlH1XHNKjJYTaVcyJdoP/TF2koc
 PKEJHXsw46aApMvHTRjQeQnkJNJmsRpBa5PL3QI5807ZozGBL9IfSmUsklpq2t5t
 JFwlB4IWth/rBVYkeB+v48zT+eYg4blyaTvxZ3zwyBwrUINhWHwi2+T614yOC2UN
 bGnU+UaWJaRz/FK9JjKddBV+E949wSX5+ao4q21H7U3OjMs/F7mB+dbuIXrGyiiu
 /E1xvPkHE6T0dFMOkNeSgQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id tkTfTevD1I2x for <qemu-riscv@nongnu.org>;
 Mon, 22 Aug 2022 23:12:23 -0700 (PDT)
Received: from localhost.localdomain (unknown [10.225.165.40])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4MBf5d09hNz1RtVk;
 Mon, 22 Aug 2022 23:12:20 -0700 (PDT)
From: Wilfred Mallawa <wilfred.mallawa@opensource.wdc.com>
To: Alistair.Francis@wdc.com,
	qemu-riscv@nongnu.org
Cc: qemu-devel@nongnu.org,
	Wilfred Mallawa <wilfred.mallawa@wdc.com>
Subject: [PATCH v4 0/4] hw/ssi: ibex_spi: cleanup and fixup bugs
Date: Tue, 23 Aug 2022 16:11:58 +1000
Message-Id: <20220823061201.132342-1-wilfred.mallawa@opensource.wdc.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=2270691b0=wilfred.mallawa@opensource.wdc.com;
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
X-List-Received-Date: Tue, 23 Aug 2022 06:12:36 -0000

From: Wilfred Mallawa <wilfred.mallawa@wdc.com>

Patch V4 fixes up:
    - Fixup missing register field clearing on tx/rx_fifo_reset() in [2/4=
]

Testing:
    - Tested with Opentitan unit tests for TockOS...[OK]

Wilfred Mallawa (4):
  hw/ssi: ibex_spi: fixup typos in ibex_spi_host
  hw/ssi: ibex_spi: fixup coverity issue
  hw/ssi: ibex_spi: fixup/add rw1c functionality
  hw/ssi: ibex_spi: update reg addr

 hw/ssi/ibex_spi_host.c         | 174 ++++++++++++++++++++-------------
 include/hw/ssi/ibex_spi_host.h |   4 +-
 2 files changed, 106 insertions(+), 72 deletions(-)

--=20
2.37.2


