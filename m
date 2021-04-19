Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lYNDU-0002wW-SR
	for mharc-qemu-riscv@gnu.org; Mon, 19 Apr 2021 02:17:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=736d87ece=alistair.francis@wdc.com>)
 id 1lYNDO-0002sc-FQ; Mon, 19 Apr 2021 02:16:58 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:6358)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=736d87ece=alistair.francis@wdc.com>)
 id 1lYNDI-000541-2d; Mon, 19 Apr 2021 02:16:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1618813054; x=1650349054;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AEdLUUCBoQL5rEE7QdTBd0JifO8NvjBpCTUmr7NrzuA=;
 b=qD7ho70m9irsHj70Z/0poFKfGt8byMakeSUk/H4Fid8Mv0xMJhroUTJN
 B/CKrKQOoiCdaSpuYekNs3RP81iw7A2YrjuvT+fglQN5RVrl2IRxpOb0G
 Kdh3ASAviuIczZ56VxIw2+lq9upy8X0n46JPmy5Dl7xLjilzSNXw5S+E0
 Z78wzR7kC0w4DEKPtS8IkrpAits4vU238iif+tQ16ETQVUOszgPYiZFWN
 QGYGD+XKXNpgde8mMcAjrZ0EZPc4xDY2bkBXAeFt6uG70LJMdZWCohTPt
 uAZ9gp1qkl3yh6VicRJuhLsEaiAMzTYCfaoWyn94TPMadLnpFjApBtt92 w==;
IronPort-SDR: Q2bKQ+LFsjJMpaI6kcVxUW2HEKSaDSp0xPqMsPu/8P4Omj96gQVb0LqroPi33qBcfYDKnqUZh+
 gtCf6T/0Zz6hQb168W2nK+32muZtp5RrSpMtS0gZRK81mOs+BkgsrNHnI6ahu86XZ2Nwq5JmoJ
 4AUq8yY4g3z4Ko79kGlvv9+II0oM/wdujINZta2papcsRx7FxKG9ACZZVLNPyMRYb6EkZCk5xy
 Yy3onV9Ooo1uqp/zbIBEqMpetRe+39aAM2qXkzH4wrBBKhla20gTbXroGAW365FZ7I9EfvrHzB
 L5Q=
X-IronPort-AV: E=Sophos;i="5.82,233,1613404800"; d="scan'208";a="269339318"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 19 Apr 2021 14:17:31 +0800
IronPort-SDR: LUBW467kJLxHB9MCnFO1KgbG+cQ2Jg9z6tenxfP65hE1dWmEg4waurTQ6mbExgPrDGOOXQqsHj
 KDxjD0/vaoo4Z3raOcPLoHhC7rFtBYgnCDWoPhMph/mTJFhToaF00ITg69MtNbtqQ1aUBvqKJ9
 /dVJrDYmOZsIXtbt/kQNovsqs7k3t1NIay2pp26/gYMIDkIkX1M6UPbhziPXdvK2fNlso7XGpt
 msEgtJP50aHWA++6QswMCqCqrLCnLkY7Elf6cX658oQ9l20jIwu1EI+wqQnnlS+I/8dpXKWLy2
 KUWA7S7iycHEaPQzwLtAQ99w
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2021 22:57:34 -0700
IronPort-SDR: r88Ocmw4WEqwMah5NMSbeqbxGi/v/sp+m/DqU/AKKZ/bzjKltsqjH0BRS4cdPr42DCwLuja8TD
 iP08XkcVExo4AgEJ6LXvSQwftec5yaa3uMGmSSpi7Dky4wWG9ubeO+ZGIppnMOhz7SquXMgICY
 Tt+l/qvOUpcCFHZ5RUdfp8AL5q2aaMHGaof4Vaw7b1Oso7VNIFpiJuURH1FraimO0pezs5v+y6
 wn1qA3lpS01Tmcqf9863Shk9S3XD61Fp3c7ql84ouwY5TXrSklKMQkjoSMKuA86PrSv6e8yx2k
 z5k=
WDCIronportException: Internal
Received: from unknown (HELO alistair-risc6-laptop.wdc.com) ([10.225.166.23])
 by uls-op-cesaip02.wdc.com with ESMTP; 18 Apr 2021 23:16:47 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com
Subject: [PATCH v4 3/8] target/riscv: Add the ePMP feature
Date: Mon, 19 Apr 2021 16:16:44 +1000
Message-Id: <28c8855c80b0388a08c3ae009f5467e2b3960ce0.1618812899.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1618812899.git.alistair.francis@wdc.com>
References: <cover.1618812899.git.alistair.francis@wdc.com>
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
X-List-Received-Date: Mon, 19 Apr 2021 06:17:03 -0000

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


