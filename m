Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jW8ji-0007x6-FS
	for mharc-qemu-riscv@gnu.org; Tue, 05 May 2020 21:20:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=3884e71da=alistair.francis@wdc.com>)
 id 1jW8jg-0007vS-Nh; Tue, 05 May 2020 21:20:32 -0400
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:1664)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=3884e71da=alistair.francis@wdc.com>)
 id 1jW8je-0005Jn-AF; Tue, 05 May 2020 21:20:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1588728030; x=1620264030;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=KMxmBEbSZynkpArTbvRdkFdC80SeLC+6DRCdSQgTjkc=;
 b=AtZHOQro3BqZJmx0CszL3h5d50WFk3SgQSv3GqXq3O7x1D6mx8rUEKq+
 HGPb9Lms9ru2d3BOhcpTZ1N+sGu5UAkkBuicoK+mqEUpoD4/KSx8y1u/F
 FCCUVpYSlwr+M5tUFCVle1vxF2gjHtok3SJ8swVHwhw7y4TN6a98oWrwp
 4USWE2WKMGciEDvrww+aalCy53hfv4JJAFRRTcuVrd82UtHxvrimgOB2i
 J7+K2gLSfSU07jK6SFd0isPyL+cNVRxg2yBLeJ8k3zVRHmw2F/6idR6Mj
 qW1JuCKaW8nfCIhzwr2B87vj1HPF6jFtWAkLQyXLQUi+bc8AIVYmcg8ZZ w==;
IronPort-SDR: hK8u2hk9PmSaZ0TpFmee1ynuuhOH5tTtJ1HD11UJnoKNt44B6zUQFcOXS6mlTHUbjj/XA3Gk4D
 g6wNIbv30uYAK0Qt4ucDuegBBBmKnyFeAaZ+FXhcgfv7Zf8KJ7DVxcOU+OsVNRM8E03tTPBoFP
 neGzojXh8VhsgxfKamqPV2Vy3ND3ELMEodxSvjLK08w25IrPi4FFezW8tzEWScn2PoPCM3uWXv
 G7PzbnQtsvz0gWQ8fy8zcfnd0m6BxoGOCxfISl9NR50XvZCtxcdOw82h8U1FnJ5Cr+T91b4jAb
 k0g=
X-IronPort-AV: E=Sophos;i="5.73,357,1583164800"; d="scan'208";a="138433825"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 06 May 2020 09:20:22 +0800
IronPort-SDR: 69kOihnE/7QQMzhXP6Q5Y4aApzaX+wFUNxELZnUnqKyXSf3KmUlcZmTaKrJBVAvSMzEBMlyAhX
 nKJF1D7WbIYt8y+FyAl2kOsDjHr2/jqR8=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2020 18:10:48 -0700
IronPort-SDR: DAqbYknlFXmVUGZuwkzPpUlZXgmE5iHYBHj63Kj3nN6bD4f/gUcmW/ihf5hi0MuF+lYrWRXi2l
 kWf2YEUGODgg==
WDCIronportException: Internal
Received: from use204286.ad.shared (HELO risc6-mainframe.hgst.com)
 ([10.86.56.224])
 by uls-op-cesaip01.wdc.com with ESMTP; 05 May 2020 18:20:21 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: palmer@dabbelt.com,
	alistair.francis@wdc.com,
	alistair23@gmail.com
Subject: [PATCH v1 0/2]  RTISC-V: Remove deprecated ISA, CPUs and machines
Date: Tue,  5 May 2020 18:12:04 -0700
Message-Id: <cover.1588727508.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=3884e71da=alistair.francis@wdc.com;
 helo=esa6.hgst.iphmx.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/05 21:20:25
X-ACL-Warn: Detected OS   = FreeBSD 9.x or newer [fuzzy]
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Wed, 06 May 2020 01:20:33 -0000


Alistair Francis (2):
  hw/riscv: spike: Remove deprecated ISA specific machines
  target/riscv: Drop support for ISA spec version 1.09.1

 hw/riscv/spike.c                              | 217 ------------------
 include/hw/riscv/spike.h                      |   6 +-
 target/riscv/cpu.c                            |  30 ---
 target/riscv/cpu.h                            |   8 -
 target/riscv/csr.c                            |  82 ++-----
 .../riscv/insn_trans/trans_privileged.inc.c   |   6 -
 tests/qtest/machine-none-test.c               |   4 +-
 7 files changed, 21 insertions(+), 332 deletions(-)

-- 
2.26.2


