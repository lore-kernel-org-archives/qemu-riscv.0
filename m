Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ieNax-0007bO-Ur
	for mharc-qemu-riscv@gnu.org; Mon, 09 Dec 2019 13:17:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34888)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <prvs=23948302b=alistair.francis@wdc.com>)
 id 1ieNat-0007Vf-N9
 for qemu-riscv@nongnu.org; Mon, 09 Dec 2019 13:17:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <prvs=23948302b=alistair.francis@wdc.com>)
 id 1ieNas-0007WN-M6
 for qemu-riscv@nongnu.org; Mon, 09 Dec 2019 13:17:15 -0500
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:28155)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <prvs=23948302b=alistair.francis@wdc.com>)
 id 1ieNaq-0007TS-6y; Mon, 09 Dec 2019 13:17:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1575915432; x=1607451432;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=j69gV5BkPyse4XIUAzBgRZKTarqchjs9y1SXrKo0rYI=;
 b=E2Ss9N1vBguYos6LM8E8xbaMCTH+zDURrC6inYQ0jsgc2PjboqNn1kSL
 sP/HY/9VADeJtJ2WOrM83mBteEuZPNP+xSKbzJlCKbLpG8lZHWNVwPEb4
 Pmin5cP6i08Sa4JNKQyO9LTmOrKs110ktKn1iHkf8iAlfgC+DTqmzPjkY
 V0X1/DXBAc1qO7vKa2TgbrC/8aRxKYhZjKOG6ZpZb+xkv7l83W9onh9lY
 t1LlMcRTFRqyo4FvgrcU1qJj6dRCYi1dgYRJga78dVlKqAhUDV1HduZny
 m7Yolrgf350ktpdQRM+S+VVnMbjr8WLxQmp37ZEk580nKj/MJ58fTXybM Q==;
IronPort-SDR: N3vGFH2qMXLGK7Mx6qCc5gk1Ug1dFwVolp/PQs8ZMMZ7ukHpcx+OENt3kMadmmKl6YPDAF9LZT
 16CzBphPeEy+6QkZ+k3oFX4Kvf7f+mdvFQNwUEAiuhgr1nuJZrRPqDXwVWSO7YqNsexwUFGbn6
 zKwKAAuOP0byi1bk2mOHGQqwnMRLFH8c5LqZYdcI9wVPXGe9t4JqA1YRKrz9AdxzqqP0KRPe3N
 SoEWKGH9TB2fkO8j4+5Qv2lXOeUneA1xff87gJwWzm4PW7ezQMuGthOZvSYjosCchEE5NXlEJm
 kwo=
X-IronPort-AV: E=Sophos;i="5.69,296,1571673600"; d="scan'208";a="232461558"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 10 Dec 2019 02:17:11 +0800
IronPort-SDR: NfxiOWRiKFgCOtJK1hY/hIkFbs89x7Q8BBWhJQnCDwAcMtdoV3nPbMd+ph8g4I6VLdGrHcBmSV
 yf0dbWDP2TsyuS/GYrio0ag3drkNUSEEN7lgx/jxG79WGKVoKfmzfmrfXYIKe9KpTpMryf49cq
 h6cd1dbE/WNdBr+tKeLI+0DBrD07wwFbAjTx0Ai3SNIVrdOLPFgZcvPIhBVHuAj0lPR8RzWVGG
 uuWrAxVaFN8U2sKupgkpdAIAWvyyhbaFlRRKE6bxDFoqJBOO/sYEYHPec9Dbbcm6iBd5kYtx60
 qeDE9lGTvbkGkhb2CEHRKFfL
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2019 10:11:28 -0800
IronPort-SDR: dm9qwYjnadvSqV6hGiMcKQPGbdJdhYHmQxRDJFmgr4tJBbqi4esvCQ9YQBWF+dTFq7TCUQTA7z
 G92OaaT5XTQc0vlSDjCQhyodASor0uRlahUUEaRlhXu3GBgc4IbMeccrhvaLXIJMy41ylfMA8S
 0AZ4rt6cEwycD7jarkO2qgZO6U7LhgCuwpOkDt2BM5qmb+C/6xutUIep9aOtR5YZgkREhYG2LA
 Ets34LcMJh9ETPyEcnaPw3WZOfg/CWcV0UVsANnBrCxc7mkSqblOORSgoypNjwSRIynCI9ZSZz
 ag0=
WDCIronportException: Internal
Received: from risc6-mainframe.sdcorp.global.sandisk.com (HELO
 risc6-mainframe.int.fusionio.com) ([10.196.158.235])
 by uls-op-cesaip02.wdc.com with ESMTP; 09 Dec 2019 10:17:11 -0800
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: palmer@dabbelt.com,
	alistair.francis@wdc.com,
	alistair23@gmail.com
Subject: [PATCH v1 19/36] target/riscv: Extend the SIP CSR to support
 virtulisation
Date: Mon,  9 Dec 2019 10:11:30 -0800
Message-Id: <eecc3f2848d9afa8e640f608bd13112868ca2e5f.1575914822.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <cover.1575914822.git.alistair.francis@wdc.com>
References: <cover.1575914822.git.alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: FreeBSD 9.x [fuzzy]
X-Received-From: 68.232.141.245
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
X-List-Received-Date: Mon, 09 Dec 2019 18:17:18 -0000

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/csr.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 54edfb280e..d028dfb60b 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -744,8 +744,19 @@ static int write_sbadaddr(CPURISCVState *env, int csrno, target_ulong val)
 static int rmw_sip(CPURISCVState *env, int csrno, target_ulong *ret_value,
                    target_ulong new_value, target_ulong write_mask)
 {
-    int ret = rmw_mip(env, CSR_MSTATUS, ret_value, new_value,
+    int ret;
+
+    if (riscv_cpu_virt_enabled(env)) {
+        /* Shift the new values to line up with the VS bits */
+        ret = rmw_mip(env, CSR_MSTATUS, ret_value, new_value << 1,
+                      (write_mask & sip_writable_mask) << 1 & env->mideleg);
+        ret &= vsip_writable_mask;
+        ret >>= 1;
+    } else {
+        ret = rmw_mip(env, CSR_MSTATUS, ret_value, new_value,
                       write_mask & env->mideleg & sip_writable_mask);
+    }
+
     *ret_value &= env->mideleg;
     return ret;
 }
-- 
2.24.0


