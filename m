Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lW90O-00065W-Ls
	for mharc-qemu-riscv@gnu.org; Mon, 12 Apr 2021 22:42:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=730c0c5bd=alistair.francis@wdc.com>)
 id 1lW90N-00064G-GR; Mon, 12 Apr 2021 22:42:19 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:62296)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=730c0c5bd=alistair.francis@wdc.com>)
 id 1lW90L-00080J-RO; Mon, 12 Apr 2021 22:42:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1618281737; x=1649817737;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6Pem7nn+Ai8i7C1vw/hr6N5V118h5TJ3Ltyh7wyBDJY=;
 b=GqcDKDIPU6tBEfIthYxL3jofElYZ7hrlvtb4J49iVYFU2flz2L15U1Fw
 iieP1RLkVwnGrZrp0Qi+pd3dqVlZ2fGa8cESjpelKcCjJKmGiXXHEeMoP
 CDq3beINXx6xVGER8t5bPBrGNFijPJpzI9ma6Yv9bp6kOELb3qsp/SV1Q
 s+PmTyuCtArijoJ3qJWL85TOboxN9+8nUcSeJzF/6DkVLguYNgFqnfiuX
 Ty3xaJSVihYi98f9zcVeS5VYRp5UkFrvvFDsirgpCgwfke78r4fORGnKN
 g0lrjYSezN5lX56mFR/UjOjWTY50QVwZLQxbvooTtME+TmyjBfm3EAqwW g==;
IronPort-SDR: ngHH1njyr/ZzbugCbSOVm914JHtwd9w0ulB5AvvzvUUyMTdD0zK6gJUUA0z775ZzxBEx1FqK+8
 F0KjLMY5iapseF0RcRL2nQHBzBvFmr5xNZcTEybP7D9k8BfcYAcKV36tR/rS3G6rD1ihHBAqVq
 2NKMsdExNSQsFi4+3GiGBWtzOJANy/OFRBQ128G427i2PWbRBVz3l0u5owJJD4+Yg+0GN4lzqt
 4wWvbvUGYV0TDvYLq/OCUREkjiuUz+PehQ5w1J3hT7xRDcX4MZTpujrhrVBYE3Q6QOt6ZnhCtP
 L88=
X-IronPort-AV: E=Sophos;i="5.82,216,1613404800"; d="scan'208";a="164190716"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 13 Apr 2021 10:42:09 +0800
IronPort-SDR: 7TLNaThtfZoWdktZJmwnpU869Kk1YRyNCFPhKIaalGC/wX9bauBIMOSn9CoqESaVUvlXLtcJIV
 DI7RqcdCUA0Rdf/l0TxRtbjMHLBkOKs038FDw3zQRigG/00MbKU1hlJL9w5O4aiZQ8rm4jNmno
 m2qMR2oGsXNSH4tP4BLjZKxknunBhoeCEMyOjbUqL+jaaRcR8VCY3LwwAhvKR0dcOm0kRvYNnb
 fh0QbiuKnsgsAiBu4cljT2dJd8aX9cV+vb0elcm6lHoZw0XwuPsOEWpHcx9Xy4c9K4e/YbHQ9c
 +pq/v7LFi1TOwfaAkMzMucza
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2021 19:21:35 -0700
IronPort-SDR: Jf+nuujwPxdHBhrE+j2hmFQJM9v8fN/wL1FP4gTbOvd5R8yEGpENIODXkzUz97fqfZppyQKG74
 CRhRUyxlWB1gfL6wph2yt48Jbl96JxIEiRAGs7pxjSAKrFjS2hP387jC55MM5E2XWs4gUM7u3w
 VdKV3v2qeWVQpDtsLGSlabIgz/WBf16v9bhO5+XiDksVq2vYSxsguBWPICa9y8q+XzNBzuh1QM
 VlKnBfkDuQG925+02l8YaNTJVDZy5WPLVawnykWu8Ktu51IwsUhapSQxSuq19kmdcMKk2xkDt0
 kuk=
WDCIronportException: Internal
Received: from unknown (HELO alistair-risc6-laptop.wdc.com) ([10.225.165.16])
 by uls-op-cesaip01.wdc.com with ESMTP; 12 Apr 2021 19:42:05 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com
Subject: [PATCH v3 2/8] target/riscv: Define ePMP mseccfg
Date: Tue, 13 Apr 2021 12:41:55 +1000
Message-Id: <919a4f45cbfd039545efadd4cfb0cd9ada8cfdb9.1618281655.git.alistair.francis@wdc.com>
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
X-List-Received-Date: Tue, 13 Apr 2021 02:42:19 -0000

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


