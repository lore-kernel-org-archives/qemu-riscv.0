Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lW90i-0006Uw-5l
	for mharc-qemu-riscv@gnu.org; Mon, 12 Apr 2021 22:42:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=730c0c5bd=alistair.francis@wdc.com>)
 id 1lW90g-0006SN-JI; Mon, 12 Apr 2021 22:42:38 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:62315)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=730c0c5bd=alistair.francis@wdc.com>)
 id 1lW90e-0008BX-Q2; Mon, 12 Apr 2021 22:42:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1618281756; x=1649817756;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AEdLUUCBoQL5rEE7QdTBd0JifO8NvjBpCTUmr7NrzuA=;
 b=WEXs5WTgm2bvIyNo3v02VpP5LY3+Q1v1AU8x1FLxWMwotDKASL20jmbh
 Fy8Mx/zNt69FD+gB3QusKMlZsXX6rQz+an2Z6cLJfROMj+1v/+B4ZqwI4
 UwJkhSIt/HYq23XQpLaXMNJHgO5kZgszywaNsbmyhUh20W0ZEmWZP89Yo
 te75wPP1dP32n55fRmzlL11yKkg3OuQ2/dw5QLtZTrOQO+HI9NAxmv7zF
 Pj4njabSA5kIgiuxAfZSAWLNKJXEwe9bc4JzOZSgLhoeWoc7Z03E3BSYd
 mP9E3pmnBZNeipMbz//Ls8bZHa2yP2sLfDGJEexyDVHuruAIJsU5htjpY g==;
IronPort-SDR: 1S5vBJ+MwQcL570pcM62J44T66tzedzx50hQu91QuJcz40rwL7CDkXLR3HYO6+QYX5JZ190rX+
 ErSwClwOjfMHyIO35M28lbFB0igCEqp3Oqr2LbKw2Xp+3eDT2vhfjaFijzmYGgY0wqGlmcmlgU
 0OD9txBLC1vIU91JFOd6I3OIcHMrSl8OpA3JRmkW6fWg9F23novy9Bk0Qmfgb/lV5UpQRsyVgD
 EWVZUb3jwYNVoaiiWKMaijXef/cGiBCpJ1x5RmyRxGXdqhq6O3ZEBx/PkVaKHhm/4c3MGCaism
 csw=
X-IronPort-AV: E=Sophos;i="5.82,216,1613404800"; d="scan'208";a="164190738"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 13 Apr 2021 10:42:23 +0800
IronPort-SDR: SYgiMQQd6PSxYSv9iNp8QEAHuNSZM1DW3u82hJz9Hm/AoqCg232RDPgFJ2eOjHek6LfnW4r5fB
 AUOpAsK50T23+eT9V1tEsFDqyjO5w+iFNJX7sZco3BC9C3FL7at3rVwdnflW/lQ8E8mOxYkUmC
 2D7MZPle1QskVTRygTmWTYiDfXMNXRrVK2HLLOnK9gkO7Hmrh0UzuB+ACstIen4To7/iWDbrka
 Hwa352OALjtqjes1z6Aav2HIgQ9d5yb0NvBMQtH1yzJ8Db4aXDp/isVTJ1rLKMX+8CySmuOVOJ
 z77yBe+pKHtJA6F8mDlb/MDC
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2021 19:23:24 -0700
IronPort-SDR: 4cy/XtgGsOlvE2oddCxjE7SGVFqTX81AVLVEkYJM0Sh0+4blMoj8LF+QWevkkQiYLzeUnao0r+
 wQJYA/mLUIE1A2Mp40PgJz5GO4wz7UfSz9MRwTR1Yv50MAJLrxKwCkA8k4lPq98XJix2HpjeTq
 JKjwIYcM4y92spjKFjhOTetUw0DLiRxQF+nCCHDhwxKUS+QxH3ZHjXj3DtDgYFEGy6ac5FyhHn
 tztUkCZ0Uf7bVr0ULnnCW3r3+E7OIb5Pr6fXDHOQ62c8TkdCQ23aPLc4SphwT2rRf5UtB+NFPQ
 ptM=
WDCIronportException: Internal
Received: from unknown (HELO alistair-risc6-laptop.wdc.com) ([10.225.165.16])
 by uls-op-cesaip01.wdc.com with ESMTP; 12 Apr 2021 19:42:18 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com
Subject: [PATCH v3 3/8] target/riscv: Add the ePMP feature
Date: Tue, 13 Apr 2021 12:42:09 +1000
Message-Id: <3a2615d3f1433a025c7035673f66e4b72cb22878.1618281655.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1618281655.git.alistair.francis@wdc.com>
References: <cover.1618281655.git.alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=730c0c5bd=alistair.francis@wdc.com;
 helo=esa4.hgst.iphmx.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
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
X-List-Received-Date: Tue, 13 Apr 2021 02:42:39 -0000

The spec is avaliable at:
https://docs.google.com/document/d/1Mh_aiHYxemL0umN3GTTw8vsbmzHZ_nxZXgjgOUzbvc8

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
---
 target/riscv/cpu.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 842d3ab810..13a08b86f6 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -81,6 +81,7 @@
 enum {
     RISCV_FEATURE_MMU,
     RISCV_FEATURE_PMP,
+    RISCV_FEATURE_EPMP,
     RISCV_FEATURE_MISA
 };
 
-- 
2.31.1


