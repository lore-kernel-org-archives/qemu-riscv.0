Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jh1BX-0002Rk-ID
	for mharc-qemu-riscv@gnu.org; Thu, 04 Jun 2020 21:30:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=4185f83b6=alistair.francis@wdc.com>)
 id 1jh1BT-0002Is-Gg; Thu, 04 Jun 2020 21:30:11 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:22008)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=4185f83b6=alistair.francis@wdc.com>)
 id 1jh1BS-00009e-IW; Thu, 04 Jun 2020 21:30:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1591320611; x=1622856611;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=z8VaLoKTwg3sLdA7SkrOvr7GWa/yDdx8KFbYEC1qzJQ=;
 b=lmHphc+vLuKtFyRzLt5XS4TafM9RWyISfbt6uoNNVV1eDbAxgRjgTpVr
 sfmSsLD7PErc3yLm2wCNfo6Ki8DxOFWgSW5+xXmwQ2a5DAEuNeYCY1pTK
 5GJ0bqAZYPmdCvf+N7+7Wqwh2lKq1VaBdOyr7Eaz2HjxGNwck7IeFdQZl
 E/VJxhKDlpLZT8gKnba9C98W1DxqA2XOGJRHFy5KXm5SKRKHFp9JeOqrO
 eOW9hy1Z9GnAvX9cxjrp9+oqKOja9KTpiOtccSAt/eb+lcG643OjpC/ae
 V8IDbVZFiXYPZK1MV47XfRPQZWSJl9DrFtUNKkpUrM/O5xmZ5R3/XzSbS A==;
IronPort-SDR: JQcrJ/rkELxvKVGO0EZxgMCrcBESmgvo0H5lllZaDmPIp6K8vQBRw2GpSMBgvmTQE43hK2xiLk
 DN59uACcaQBEasPAC440d6mJh8X0bsLTmJCXigqME6H7wKVMhxRLOCiO9UutVcfwNmkuNoQmWM
 S3VOQaGLWZ7uvmD9nD9JOAuyG1tws02f5HuYalxjqmCCHUkgJ/XaVRKA0D+VZki5PPQeHxMQbE
 eaXbB8h8RccTekIKskeGlucfQ5zWJFSxeGB1aQTRISBqbxC4mPfJTJVdd8id+zRBvDBkGxegbJ
 GUw=
X-IronPort-AV: E=Sophos;i="5.73,474,1583164800"; d="scan'208";a="242127062"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 05 Jun 2020 09:30:10 +0800
IronPort-SDR: dFdBb6foojPeiGgyHfSe5O+Win3ORGvKiNSuwj5wn+CD3KDt5V/buNY98/ubGzbuP9o7vQcR7V
 ZC6iJ3ar6biLr6WuRAG3N7wV9iqIbsPb0=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2020 18:19:45 -0700
IronPort-SDR: E0Ty70A44x+A5ncCZuKy4iFVZDkxZHuyP6C6LG3Dc5/foKlQSIdcRDz2cQRtamGoXFNVnhqr53
 wIaP3DR+TlWw==
WDCIronportException: Internal
Received: from cnf006056.ad.shared (HELO risc6-mainframe.hgst.com)
 ([10.86.57.233])
 by uls-op-cesaip02.wdc.com with ESMTP; 04 Jun 2020 18:30:09 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, alistair23@gmail.com,
 anup.pate@wdc.com
Subject: [PATCH v2 14/17] target/riscv: Only support little endian guests
Date: Thu,  4 Jun 2020 18:21:21 -0700
Message-Id: <7faee43fc9a209a9c801e0a543a51b09a479331a.1591319882.git.alistair@alistair23.me>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1591319882.git.alistair@alistair23.me>
References: <cover.1591319882.git.alistair@alistair23.me>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=4185f83b6=alistair.francis@wdc.com;
 helo=esa2.hgst.iphmx.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/04 21:30:00
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
X-List-Received-Date: Fri, 05 Jun 2020 01:30:12 -0000

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/csr.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 973404d0aa..5b64539efb 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -772,6 +772,8 @@ static int read_hstatus(CPURISCVState *env, int csrno, target_ulong *val)
     /* We only support 64-bit VSXL */
     *val = set_field(*val, HSTATUS_VSXL, 2);
 #endif
+    /* We only support little endian */
+    *val = set_field(*val, HSTATUS_VSBE, 0);
     return 0;
 }
 
@@ -783,6 +785,9 @@ static int write_hstatus(CPURISCVState *env, int csrno, target_ulong val)
         qemu_log_mask(LOG_UNIMP, "QEMU does not support mixed HSXLEN options.");
     }
 #endif
+    if (get_field(val, HSTATUS_VSBE) != 0) {
+        qemu_log_mask(LOG_UNIMP, "QEMU does not support big endian guests.");
+    }
     return 0;
 }
 
-- 
2.26.2


