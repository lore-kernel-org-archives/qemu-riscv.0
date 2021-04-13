Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lW907-0005kq-IC
	for mharc-qemu-riscv@gnu.org; Mon, 12 Apr 2021 22:42:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=730c0c5bd=alistair.francis@wdc.com>)
 id 1lW905-0005ji-Fx; Mon, 12 Apr 2021 22:42:01 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:1951)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=730c0c5bd=alistair.francis@wdc.com>)
 id 1lW902-0007fw-D2; Mon, 12 Apr 2021 22:42:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1618281721; x=1649817721;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=n3nwbJib2YznG66tzjAueVrCesshKzWUGmiBU37ZDDA=;
 b=UCFx6Ry3XuHXpnO5FZc7i5W2jHITyidEu7CBqiH3IzJCn54K9Gx4+/Ep
 6Sa85y6de7PpTl7nV5C5lLIpgiQxy5dUaMZs/h12QA3w/uoYSXUTdTRPx
 VwDnJyOvCHXuma+9GgzGl70hzvIO691j/o4Ni4ZKiQKZx0suTIbtUKHYG
 5tbRHpsRpJHR3mwPcXO+vWK0V96QkZ+7W7eFydHNnZBiJ9quIjPWJeMvK
 951bP+yXXR0+J4V7aZHu3Zw4XODebqlZK8WOQa0kIdWf1LNk2A2a92blz
 G0P++dxG7hIl6EB2bLvPDduGIXVu2cWm6XbP1UlEEoCLavAJVtoW63KBk A==;
IronPort-SDR: /SLw24ArSNLSIZvZSsOmb+pMMK4q7pUabPDJo1e1DTcWlpbQ/5Btxcgzog/R8lLKldfJ2m/rpx
 QQHXPoJHUngu2dFIgBFQkaNtQvItcvxoXng18MyEVPguaT8V+B6CQVgUV6uB+h1Wt3sybzIfKJ
 btAqBrFgIlzU0GfIqJkAu4uvsmMwwALe6/dGv7wyS39y9RfEPhkHgZaCPsKjjoBGlz9642Dczr
 WaxjqmNybpxgo6vhzIRRMZLSAbpRBsR4y7dapX1/Hs0oEujGx9yF21aBXpKLviZPgbqRO5GEln
 xNo=
X-IronPort-AV: E=Sophos;i="5.82,216,1613404800"; d="scan'208";a="268800683"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 13 Apr 2021 10:41:50 +0800
IronPort-SDR: +wVdMS22ctMQEda5ukuNDndKA4dNrnpPXdGCH4kIdtzeOMstfXsphDKQQNq60a/FjcACjtyLLx
 W8+kAUX4TX2fBkQFyyPJ23MKmC+eUSwPAoj3cvBqoKEfna3UUIRyc8F55xeboi0XyPUZcaQMnZ
 ORBbApwrL6OBQpdY9q3yRPqzhwjxsJ/VljwciQL0YSNcEnhCkc/K+7fV3KmML3ZM+B1D2cgO5g
 tB17lLLPKr5u0BkcHgY39v7qzrBQ4dB6aUwTmsAWnlMY6+meG2ZzXPNo7s/l3o132fNPSnObdO
 +VFDOsc/VtjTI6V+DQAL80Rf
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2021 19:22:33 -0700
IronPort-SDR: yJc9//4T+FjUoByDnJP34A9rpsr6RQx6I/nIz8dyU60WRfKufV43wQ1xP6abxCvJCayZ9R2QQQ
 hCqY+ohqtkxq8VNQtWUk6frGVizVe8miMJ8RECGuOsNXaAzg+0IUDFHzYH/V97lovaGpavwUnd
 UI46u/jEl+naQpSPYaCggjh0BwJgkIDr12sLpAzI35bdjbPXmSWa9K6UfwRtyiUF5lxd1B4Thj
 oqYRkYsjWvdnl+pVBUTo7JcK7kJN/QlJZ/OmL6LXBUcQiT5tph4DA4R6bKqTM9bvkc2apmi5Ki
 Tt4=
WDCIronportException: Internal
Received: from unknown (HELO alistair-risc6-laptop.wdc.com) ([10.225.165.16])
 by uls-op-cesaip01.wdc.com with ESMTP; 12 Apr 2021 19:41:16 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com
Subject: [PATCH v3 0/8]  RISC-V: Add support for ePMP v0.9.1
Date: Tue, 13 Apr 2021 12:41:14 +1000
Message-Id: <cover.1618281655.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=730c0c5bd=alistair.francis@wdc.com;
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
X-List-Received-Date: Tue, 13 Apr 2021 02:42:01 -0000

This series adds support for ePMP v0.9.1 to the QEMU RISC-V target.

This is based on previous patches, but has been rebased on the latest
master and updated for the latest spec.

The spec is avaliable at: https://docs.google.com/document/d/1Mh_aiHYxemL0umN3GTTw8vsbmzHZ_nxZXgjgOUzbvc8

This was tested by running Tock on the OpenTitan board.

This is based on the original work by:
 Hongzheng-Li <Ethan.Lee.QNL@gmail.com>
 Hou Weiying <weiying_hou@outlook.com>
 Myriad-Dreamin <camiyoru@gmail.com>

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
 target/riscv/csr.c        |  24 ++++
 target/riscv/pmp.c        | 228 +++++++++++++++++++++++++++++++++-----
 target/riscv/trace-events |   3 +
 7 files changed, 260 insertions(+), 26 deletions(-)

-- 
2.31.1


