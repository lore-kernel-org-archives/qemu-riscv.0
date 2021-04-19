Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lYNDH-0002px-4T
	for mharc-qemu-riscv@gnu.org; Mon, 19 Apr 2021 02:16:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=736d87ece=alistair.francis@wdc.com>)
 id 1lYNDB-0002nK-7U; Mon, 19 Apr 2021 02:16:45 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:39840)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=736d87ece=alistair.francis@wdc.com>)
 id 1lYND9-0004zu-Ih; Mon, 19 Apr 2021 02:16:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1618813003; x=1650349003;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6Pem7nn+Ai8i7C1vw/hr6N5V118h5TJ3Ltyh7wyBDJY=;
 b=Ou95Jg4LQi6Qo7NOk29wyMrMj3eXmZSxx74yojGEHnPIW/GkCkAIv4O0
 QetUxi6GfNqm8PLit/pWsnUAftmWkRNAgWUYx0AX3rAMx/LWWVPvy8qUW
 4zrxbyP/UxeIC4bAYXjRIso+0ZDLk8S317NdknKv61M+KLxoqVmcSEqeW
 BVbvsUBipCAqPK61IxySSZAAEh6cVFCGAR9Bu1DmGNl+cTvOAg6fzmGX4
 4CJsuq0Dhngcb+k/j8A07Olr48G6oEhsCvuO2nNRW0RgjRM+J+4KZ2s1t
 6IHsDhwwkYvHEL5Lneypr6gGLOV5hmW4kigd2MOaQxHirMlMqj7W75zPK g==;
IronPort-SDR: 87/Qog4CkqRNJ7B1EB9yIcNp8nPF+Q6cMBZHPlhS2OYat4az31oMEnIRaWhe62bfH9atqjHSV7
 p9H1v8mZu2fFEbztlsPdhcc8x784meIffTKhrcR4dqAyYtgPjdXPn8BGHYcso4eWmPn3PpjI2f
 Dv2GIdTzpIddXW6PFVJmBTvLtvsMHJpeuhSYKKp1OOo88L5dN+LbTxirAlHXHvsxMszsysmqsw
 tv6OLzqibW3IhP96eLpQbS26XxorKWav+ntrqW7f3AQVrLumgUAvEoc8UKBb5lBfXdMz9ezvWS
 jY4=
X-IronPort-AV: E=Sophos;i="5.82,233,1613404800"; d="scan'208";a="169947779"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 19 Apr 2021 14:16:41 +0800
IronPort-SDR: n/bEGsZ9KaT4MlU13SQjhXGA70NvWpY+QQHGQ/I8waX4XJtBu38jpu/C8ENrda9EoicgPiMFUC
 wRbplpUBLzXQ+Aao6qDAYALhGges6IczA6Swu6nfOmmFRikwqafjiBpji5FB/Kd+t6NuJ9tzea
 v9s0UqLtQ1POBgdsqF/KiNUWCcjU+qq8h9Q7rfXmwjZwFiZHhVzdD1/l/d2gd8mUA1ATHizYt/
 AXKaP2baoZP5AsUhhGbqgypXK4QgkeLCzriasXa4XFHTvGL7fyakkn8Ueb719oOWlMmrWbP0La
 Es8wSXYicWWoU6+tbPB51v0N
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2021 22:55:49 -0700
IronPort-SDR: pAKVXrogrOhTys+S65Igw6AtaGtQjSvUZykFMF+eIqLhjZ5n6knCb9kNPDJFtmkZ7h6QCUU8Uu
 bymuBroxriAS5d8N8n5RHYsPTYjH3EJaRS09ifQNETskha/Rioqv5Ww1Oe6i6ZFNxRrMNWa75+
 Yctu4ZVEZoWhS/fHgU555VHHMi3RoJRrtDYcSxYfZN/IfvozyQOyizbEixfXXWgtK2npDRumIS
 +nXW5adttIpUPgspynSpORN4f3uBPWw7Lkjt1sWrw6Bl8JQuN9HUG13CB8lTdjsKSdEJOiSlqE
 +N4=
WDCIronportException: Internal
Received: from unknown (HELO alistair-risc6-laptop.wdc.com) ([10.225.166.23])
 by uls-op-cesaip01.wdc.com with ESMTP; 18 Apr 2021 23:16:39 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com
Subject: [PATCH v4 2/8] target/riscv: Define ePMP mseccfg
Date: Mon, 19 Apr 2021 16:16:38 +1000
Message-Id: <63245b559f477a9ce6d4f930136d2d7fd7f99c78.1618812899.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1618812899.git.alistair.francis@wdc.com>
References: <cover.1618812899.git.alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=736d87ece=alistair.francis@wdc.com;
 helo=esa3.hgst.iphmx.com
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
X-List-Received-Date: Mon, 19 Apr 2021 06:16:45 -0000

From: Hou Weiying <weiying_hou@outlook.com>

Use address 0x390 and 0x391 for the ePMP CSRs.

Signed-off-by: Hongzheng-Li <Ethan.Lee.QNL@gmail.com>
Signed-off-by: Hou Weiying <weiying_hou@outlook.com>
Signed-off-by: Myriad-Dreamin <camiyoru@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <SG2PR02MB2634D85E5DF0C2BB540AE1BB93450@SG2PR02MB2634.apcprd02.prod.outlook.com>
[ Changes by AF:
 - Tidy up commit message
]
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
---
 target/riscv/cpu_bits.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index 8549d77b4f..24d89939a0 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -220,6 +220,9 @@
 #define CSR_MTINST          0x34a
 #define CSR_MTVAL2          0x34b
 
+/* Enhanced Physical Memory Protection (ePMP) */
+#define CSR_MSECCFG         0x390
+#define CSR_MSECCFGH        0x391
 /* Physical Memory Protection */
 #define CSR_PMPCFG0         0x3a0
 #define CSR_PMPCFG1         0x3a1
-- 
2.31.1


