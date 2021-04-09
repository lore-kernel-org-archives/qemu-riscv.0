Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lUq9k-0000iT-Qa
	for mharc-qemu-riscv@gnu.org; Fri, 09 Apr 2021 08:22:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=726c96411=alistair.francis@wdc.com>)
 id 1lUq9Y-0000gc-FL; Fri, 09 Apr 2021 08:22:26 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:37630)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=726c96411=alistair.francis@wdc.com>)
 id 1lUq9R-0000cp-Of; Fri, 09 Apr 2021 08:22:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1617970937; x=1649506937;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Emy89PT75W/m7gnXNBv5IRhW/jx9xxwLsHzjvOO01c8=;
 b=eySqtkLV5g8r+yY4GrEvePoX1kIZO98s8h0PajyuImcUf7ZaM6HJCMeR
 vTZLvEmAdCp3dZECB/oDqcAy0woeWKh2C1YVuvOiblJEFLR8ODid2aRU8
 4VtrZzAUEux/9EHfxQ+0OzApxz2Kx15WrA0VKA4TCEQpDn1dnCFtKvCIl
 Kfa2lGCG8WSAwK2Cdsqg6LZHS2L+kTAhTonXeDJS2eDJLGcZT47BotVzg
 1nFigw/IukTWNZyK3nI08NGffhhEPcNM/kPZnz0ST/zrTSywC7k3jld8a
 OrPXTUyaj+7i9eaqb1+QsRjxNpYmvpcUnZGd6JQ18Ivob0R1ranbn/Wh0 A==;
IronPort-SDR: 46Hbe5zXwpwV7cBfl1c2lYNbvGPqkTrzp49wS8uB6j2e5Fagc67owrD92ChljLJErR8PDiOv4D
 SgGIi7ffMHQ+BjZqBzrebqPGrNcuWRYuBg3abc7Xd4gpedQh+jRWa7HKeCQFLBN7LM0FDusrQZ
 WEbvuzDQXhjWNiPY4+tCC93PATkuVianZPebI8mRWjiZPCmGUGajxnPi2WO0l9jrabH8DL1x6n
 0h2RoGfnOAUHrLYxXkZ2924esgM9OAuj2I6PBsFTWZTWzFEm6c/koTI8/an1k6oMIg+T+GtXBH
 qcM=
X-IronPort-AV: E=Sophos;i="5.82,209,1613404800"; d="scan'208";a="164302817"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 09 Apr 2021 20:22:16 +0800
IronPort-SDR: BC8O/20N+i5vHKpA+cdWaskgYGwvtAVDPrio/ex3rIy6q5i3cb76e34iVqkwa0tCJbDYYbA6Uj
 aaKZOClCzSIWn6Z3X31mNlXqcm4DZ+y48DZlR8QFiYZbKy5aiy1tSlH48w14Ed9UYK0vyF3DYo
 kECAz0HLa8thlWRnZ3P/WwXh3yQhZ7MqYQeDeboX6vI8BjQFIV94BKqmAzWPO25GXG2rkFKUOh
 N2MdMa2SGizTnuw8rbciB4pRVD/wa1nl1e44AccJjEPaWo0q23JyyH8PeQ3K6c+K3gvUfJW4RP
 uPRL5Dm3PeeBrzPp4KkP+/0w
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2021 05:03:26 -0700
IronPort-SDR: OyboRPPMGoSFy/5lbmea1V0BH/xtFCJ0O43Va1etu/yd/INWoNNJJUogWO1QMnkcOEffyR/WTF
 +4vIosYQbrX90kOcKU8je2s89RHuX9A+RZn8JTPpfSXig5W4+00+KQo0mMbcs+DIkh0fccesH2
 ZdhuDNpz6iyLxzxeYLs80PTMDqrX5kNi1wHV4vY5Bo6SE5t+er7RHqbSwwjRmTJ3WyhugasuH/
 0Zux0nc3vhv5g6swb8Sn6o5M/alNNCtMmkEZhguUMqy1bOH1aur3sixDyuU/4jy5k+hmZbstw0
 NH8=
WDCIronportException: Internal
Received: from unknown (HELO alistair-risc6-laptop.wdc.com) ([10.225.167.98])
 by uls-op-cesaip01.wdc.com with ESMTP; 09 Apr 2021 05:22:16 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com
Subject: [PATCH v2 3/8] target/riscv: Add the ePMP feature
Date: Fri,  9 Apr 2021 08:20:14 -0400
Message-Id: <af5c76c1bb7866ac9d91a47fb330163ee516da38.1617970729.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <cover.1617970729.git.alistair.francis@wdc.com>
References: <cover.1617970729.git.alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=726c96411=alistair.francis@wdc.com;
 helo=esa5.hgst.iphmx.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
X-List-Received-Date: Fri, 09 Apr 2021 12:22:31 -0000

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
2.31.0


