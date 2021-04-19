Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lYNCy-0002YO-QO
	for mharc-qemu-riscv@gnu.org; Mon, 19 Apr 2021 02:16:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=736d87ece=alistair.francis@wdc.com>)
 id 1lYNCv-0002XY-Dg; Mon, 19 Apr 2021 02:16:29 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:6307)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=736d87ece=alistair.francis@wdc.com>)
 id 1lYNCr-0004oC-Ba; Mon, 19 Apr 2021 02:16:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1618813014; x=1650349014;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=+1GiSz7+P62FEV2PnFYavsLOvKHYVXKA0OiQ6DkjTVs=;
 b=r7+7qeZaBRl0qJ1NuMLg/SzPlzYbj09O/mrB7pLlfmnJYcxbZpDph/6Z
 R8nmDCydR9Ehbp3i+GY+x160Snm8dpOf4iZ2qBYqRq2H3yS+PhRvcBfQO
 0nqKGMs71fF7t/TjO3ZyjnmP9C86NZ7K475X6k+pw6iFGxG3b/KEDRmkc
 Q0EolRNeXK94zmwtkZEn/RN3YlnjVCr/XzONOQkpbyyIiyN2fNJgmVaBw
 QkthFCX4J3beqGK7JjQQGLvrjMChOpwmWJYauLZg8l2PVNBr+eML75mpH
 7yjl4KnIx0FCBdSWAdb4Yf3fFC2fD3dG144869srU8rIqGlXuIxSscAWx A==;
IronPort-SDR: jfLbhaG9cFm5nEGoL+Puy2IJ3kbtqEd8qWjhBjd0PNPnhBL+S+bmcqQOv6AyA4YAU3ciXuFwO/
 OwHVkCNHQA74zmeFINRDZVKH6pHchzVmHdwvPsKIpYWewx3G5poJf0yArbvEO/rU9tmCngeI3X
 ff9BbFTtKZMjTIjGsuNO+zOpGYjv/Tk4MV35RNWpMk0OTaZIbQRb73snjxq6VIM5I+5PyX65Sw
 MS1R3AT++s0GM+mK6ELMqGGN2z/SvTEdjmqSqzR74wQwUj7HRali94r9TiOC5EKlLO2jYtwxyx
 Wq0=
X-IronPort-AV: E=Sophos;i="5.82,233,1613404800"; d="scan'208";a="269339297"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 19 Apr 2021 14:16:48 +0800
IronPort-SDR: o5EX3SWJSTt9EapS+Ej0DlNGHfv1EH+UCY1uVGyfshZEbGXQc6bHZyYjMX34JHryZBPNFVFdPl
 3v6spSDjxZ1gzxy5p4U5+36Dl26MCW42+xxNd7MaO1Pz/3h/7UFV0xpOYdcDF82fk4Cbh3cAss
 K2FXXnFv30XoZ3+0KHHKM7VtqjDuPKp516g9FnT1druYJYLZXFZafc0TogMkLFlwsSUXRRqFp/
 oGkau3eAieHU0M6TKgpWlyAI8Y81qmzrlRSf+Y1Q7exFTXUnLQRoJy40a0z9MCJY5SHkiqq8X/
 9nX4vi5HkUGeOuFc2wFueGvU
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2021 22:57:06 -0700
IronPort-SDR: xHd1Dx3OIl+WMovpTC2aD2WHUm1lLBGbO6b9B9s/bG9aZtg/MqPKLFZlLI4NZtvb1PVVXqirt7
 gO//ECD9pGySxTARLwQQpzFjW6dKmOGu4j0+2wYoHd/wy0InASsdIJXyPWGPez5SnCt2RVgZ6D
 Yg0EQKaYgMCLiutpQtgeYPgcAO2luC9EhNJ3Lvvldq3EhXMhmx87ZyWYe18SyYsTLp6bfc/7ma
 1HVX5EOJT/0Us3k6niRuWF3XB6yo3KVl2hFDe7ETF/VmsQ8bO2PwTzowc94VJN8Bz4Pjlb7zSE
 gl0=
WDCIronportException: Internal
Received: from unknown (HELO alistair-risc6-laptop.wdc.com) ([10.225.166.23])
 by uls-op-cesaip02.wdc.com with ESMTP; 18 Apr 2021 23:16:19 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com
Subject: [PATCH v4 0/8]  RISC-V: Add support for ePMP v0.9.1
Date: Mon, 19 Apr 2021 16:16:16 +1000
Message-Id: <cover.1618812899.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=736d87ece=alistair.francis@wdc.com;
 helo=esa2.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 19 Apr 2021 06:16:30 -0000

This series adds support for ePMP v0.9.1 to the QEMU RISC-V target.

This is based on previous patches, but has been rebased on the latest
master and updated for the latest spec.

The spec is avaliable at: https://docs.google.com/document/d/1Mh_aiHYxemL0umN3GTTw8vsbmzHZ_nxZXgjgOUzbvc8

This was tested by running Tock on the OpenTitan board.

This is based on the original work by:
 Hongzheng-Li <Ethan.Lee.QNL@gmail.com>
 Hou Weiying <weiying_hou@outlook.com>
 Myriad-Dreamin <camiyoru@gmail.com>

v4:
 - Fix the pmpcfg write function and log
v3:
 - Address Bin's comments on the ePMP implementation
v2:
 - Rebase on the RISC-V tree

Alistair Francis (4):
  target/riscv: Fix the PMP is locked check when using TOR
  target/riscv: Add the ePMP feature
  target/riscv/pmp: Remove outdated comment
  target/riscv: Add ePMP support for the Ibex CPU

Hou Weiying (4):
  target/riscv: Define ePMP mseccfg
  target/riscv: Add ePMP CSR access functions
  target/riscv: Implementation of enhanced PMP (ePMP)
  target/riscv: Add a config option for ePMP

 target/riscv/cpu.h        |   3 +
 target/riscv/cpu_bits.h   |   3 +
 target/riscv/pmp.h        |  14 +++
 target/riscv/cpu.c        |  11 ++
 target/riscv/csr.c        |  24 +++++
 target/riscv/pmp.c        | 218 ++++++++++++++++++++++++++++++++++----
 target/riscv/trace-events |   3 +
 7 files changed, 254 insertions(+), 22 deletions(-)

-- 
2.31.1


