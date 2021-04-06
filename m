Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lTuXU-0001wF-Ek
	for mharc-qemu-riscv@gnu.org; Tue, 06 Apr 2021 18:51:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7235532de=alistair.francis@wdc.com>)
 id 1lTuXS-0001uH-Qo; Tue, 06 Apr 2021 18:51:14 -0400
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:1163)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7235532de=alistair.francis@wdc.com>)
 id 1lTuXP-0000I2-V7; Tue, 06 Apr 2021 18:51:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1617749472; x=1649285472;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=60ctGhmb5rdNPZ5yyA8fLl0gcWiZtjlznFsLfIV/AAI=;
 b=rvVC3CcfqmIcn2cE7IqxwuhAlR/CWbK+3PWCE36CtsIGEr4VytlVDCrH
 E5p+usAC8f4BzC5t8fAshHCjioz1P0VvkXrv4QLfwO5PuoG7eu4gpEU7/
 7RgsdAc5dWo3XeHz9sDJseITY+Jblbfg4aKVgMzxpPP38xRU10U8Cwht9
 Vk4tNjTEWFeTOFxHhKz23Hfg3O1wJeK9L1rRjhuWWFi3RudwUbsyPEGJx
 gRStd7VH8mH4QEY+ywwRhO4xbG3J8sTuMiqe3DPrRTW1zEMc0+UmHjj/X
 nR/1LbkAPGNlQYC6DA0vutqAoMOsvemSERBF1tcGmHwhuhbg2jozk3qPs A==;
IronPort-SDR: ORtWI4Yzh9CdoIok8+n8ZXursLLze9jnmk2XV/A0yN/9HpzC4N+ofhlzHYMGNw1Xzlmm4eEXD3
 xWd9akb9XntBZb9zCBLrlHUKWHyXJq88vQTJmxxDu2i6wxPNDcTQgrLgANQ89ePAx2kddoX77b
 Yf3yj1aV7+eK0wA+FzAljPrvs7akBV0TP4rG4VIasEzplRZlDBk6jhdSFPkg/nnfle7QBf+bCG
 BdpCdPf4RB4pNmnyE+bRSzxhbwXfLUGufShrsDK7bEembcrR4QldsnG/fXEapPCHo6HLIo28t3
 fRs=
X-IronPort-AV: E=Sophos;i="5.82,201,1613404800"; d="scan'208";a="164953298"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 07 Apr 2021 06:50:34 +0800
IronPort-SDR: l9O5iL2J2X/EDDDZskm6hu4foy4/Q0OqcqUsutWc7LfPOckdxLPKWpr5WpIAyjpltnw5eZ0Qyu
 Q94H/FLnl05QhlCTFBgplkqgFhHhsKe9ypwoIlBF5ykhevVKpPrJg9ED58YOxwhx7Y9hRgt1f2
 lbNxS+gIzQMikvW2jMAx3nRRqa0VQvcu3XWRRMI3+L/XnHDU8vAJKUyXOZYPFwKQwDFk9BPWW+
 QvmyjDvul7RLf4kpz81o0wqYnLUZqJ5JuZWoMK8teumXP3vQjyH1mRqnwe/TpWdqELkcc57QaL
 sjiIBxvxTgXFt/wBZwN/xqd+
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2021 15:31:50 -0700
IronPort-SDR: 2rYWXit3/s63eJowMT/6ERJ5R6xQSrCsOBXPChh4O4q2er3ryuyxpfbndaLSBGU2TdDWBrxrOh
 myqUydoXCeeOrpiUmb5nWt69zoFiXcw7lu7YGQccOF2CeLrzFGbfK09gL8Zg5u/lulxQGyeW3F
 69mGE22/nGVZB4VBKGNim5MUo+NZCOwgGQCBp+RNmWZuXHiJBl8YzT6LMgk7wYEbgnpsLcI307
 XEM7d2GN+pPo0WtktIcb5yMrBn01QpfZmI5tdjZcnofB+P1HvcBGX+yqtATlZ6w2aSRv20JMsY
 LbQ=
WDCIronportException: Internal
Received: from unknown (HELO alistair-risc6-laptop.wdc.com) ([10.225.167.89])
 by uls-op-cesaip01.wdc.com with ESMTP; 06 Apr 2021 15:50:26 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, sagark@eecs.berkeley.edu,
 kbastian@mail.uni-paderborn.de, alistair.francis@wdc.com,
 alistair23@gmail.com
Subject: [PATCH v1 1/1] MAINTAINERS: Update the RISC-V CPU Maintainers
Date: Tue,  6 Apr 2021 18:48:25 -0400
Message-Id: <6564ba829c40ad9aa7d28f43be69d8eb5cf4b56b.1617749142.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=7235532de=alistair.francis@wdc.com;
 helo=esa6.hgst.iphmx.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
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
X-List-Received-Date: Tue, 06 Apr 2021 22:51:15 -0000

Update the RISC-V maintainers by removing Sagar and Bastian who haven't
been involved recently.

Also add Bin who has been helping with reviews.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
I have run this by all of the people involved and they are all ok with
the change.

 MAINTAINERS | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 69003cdc3c..541bd264b2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -295,9 +295,8 @@ F: tests/acceptance/machine_ppc.py
 
 RISC-V TCG CPUs
 M: Palmer Dabbelt <palmer@dabbelt.com>
-M: Alistair Francis <Alistair.Francis@wdc.com>
-M: Sagar Karandikar <sagark@eecs.berkeley.edu>
-M: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
+M: Alistair Francis <alistair.francis@wdc.com>
+M: Bin Meng <bin.meng@windriver.com>
 L: qemu-riscv@nongnu.org
 S: Supported
 F: target/riscv/
-- 
2.31.0


