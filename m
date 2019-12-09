Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ieNb4-0007lH-CI
	for mharc-qemu-riscv@gnu.org; Mon, 09 Dec 2019 13:17:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34954)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <prvs=23948302b=alistair.francis@wdc.com>)
 id 1ieNb1-0007gI-FW
 for qemu-riscv@nongnu.org; Mon, 09 Dec 2019 13:17:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <prvs=23948302b=alistair.francis@wdc.com>)
 id 1ieNb0-0007a5-ER
 for qemu-riscv@nongnu.org; Mon, 09 Dec 2019 13:17:23 -0500
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:28155)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <prvs=23948302b=alistair.francis@wdc.com>)
 id 1ieNay-0007TS-2P; Mon, 09 Dec 2019 13:17:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1575915440; x=1607451440;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3GUezvYl0H8iOtJ+zLcxM7nTRgaszMLdmG6eo3ecBcI=;
 b=BMOTsgTDdOzYILvl3umC/CHzYvGBbqNvX02aAG4ysJzqYv1J9/ljt+ka
 K/k9fff94vDa3QnoxttOT5evjhJQSfBobUBW76F9Q1iRGfBBCFlkAUkzm
 AjdTwoVP0Gw4AJ1ksBemTezkfz/pjfbHp4VMgvi6pwA0eAmt1J1scHVbK
 dQksfS08DZtiqG9ZcQljKNXM2Mf8X8gtROBOqA0KxWP8lzePkqlgIjtMC
 NGht/GdZ/TSGGB1PLnDTCox+ZUM6d7n74lPIqjqOIkjn4KSJ3xnpIhCgM
 N4sD6pRpjBD/j6fsMVpxHDKg3DWmtvc9fzKJDUYsRmw26HaGSPwX0aav7 A==;
IronPort-SDR: U6OAfgGlMhagaUT1KWsP86v2txHAYTs83vy+5IDmxNcJ/KKIc1axkylpoYpf5M4Vqiho+RdSLP
 qwmgRJEcabBBfzJNY+g92I7orczm5kOQb6rQ5JXukONZmQtjDSUwYLgb7daGiOqgSqhBXIpWIF
 2eo1UQGI5vRSDsr7QHynHJK9wZL91Fcq4L324x2IW3FKRbRN16XmrcnM76bR3ao/918ekthD4T
 cm3fzie/aoizzUpSaOkRVNGvZEAwZp/3XaVpfGasNeVvy13pvv6dwCleVW41fPpfCRhtrocV3X
 dFw=
X-IronPort-AV: E=Sophos;i="5.69,296,1571673600"; d="scan'208";a="232461570"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 10 Dec 2019 02:17:19 +0800
IronPort-SDR: f+dCn0Xe3dPlCDA3C1gYB6Io20BFFVOJAoubgxrShWHkrWJeCb8Ub+3DEgGNsV3j5ym1Pn7cBt
 Ke2rBUs1Yvuo5sY31Ek9ml0Fyk5/BypVCFXZ0er8FwQjbQdCtqlFco6ar74ifFvLuumabrR0Lq
 VNpxfEZHSdCwX45waglqnrsrTTbFvw0O3jzKQGtsB6/sPkxMKKkfhkU4SkQZUA7Qj6MLf28SPY
 0U7/d/VWyVEUIh5jg114wIENxHHmUVRbBI/phfMsIg7UkPdZLHnDQ3NcNlNssAm1J0sEbDO+cC
 zzUzp5uUfQl9vgfLYrpqYxNQ
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2019 10:11:36 -0800
IronPort-SDR: Nx/ONmtuUC5/tRqFPD2IDWEn4zy1z83RMi+PQEXMjLfcSqYbjcRy0oQc0dP+F/9QM7UXXIZ8lT
 zUh6yruwBdAfsg1xG/XFvdPEADIhVzR/bNFTYA/OG+NspV9erXuS8CMNWIYd80ip6XHv+evOz4
 6AGS3WklFF81fcubxIvDlwCjBl0AIInHt2M59cQUov42e/4SRvy3ixF9fRIsYSyKpbHcswNJNI
 L8k8htQ8Naj7f9wXfOjsCmZrXn6XA8rpEmjqwJJNidncLMGdcOQw2prm3wr5GbXTprr5e1hRyq
 ZZw=
WDCIronportException: Internal
Received: from risc6-mainframe.sdcorp.global.sandisk.com (HELO
 risc6-mainframe.int.fusionio.com) ([10.196.158.235])
 by uls-op-cesaip02.wdc.com with ESMTP; 09 Dec 2019 10:17:19 -0800
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: palmer@dabbelt.com,
	alistair.francis@wdc.com,
	alistair23@gmail.com
Subject: [PATCH v1 22/36] target/riscv: Generate illegal instruction on WFI
 when V=1
Date: Mon,  9 Dec 2019 10:11:37 -0800
Message-Id: <b1b5cc3f1f924b8dadb615feac199df7ab266335.1575914822.git.alistair.francis@wdc.com>
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
X-List-Received-Date: Mon, 09 Dec 2019 18:17:25 -0000

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Palmer Dabbelt <palmer@sifive.com>
---
 target/riscv/op_helper.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
index d150551bc9..beb34e705b 100644
--- a/target/riscv/op_helper.c
+++ b/target/riscv/op_helper.c
@@ -130,9 +130,10 @@ void helper_wfi(CPURISCVState *env)
 {
     CPUState *cs = env_cpu(env);
 
-    if (env->priv == PRV_S &&
+    if ((env->priv == PRV_S &&
         env->priv_ver >= PRIV_VERSION_1_10_0 &&
-        get_field(*env->mstatus, MSTATUS_TW)) {
+        get_field(*env->mstatus, MSTATUS_TW)) ||
+        riscv_cpu_virt_enabled(env)) {
         riscv_raise_exception(env, RISCV_EXCP_ILLEGAL_INST, GETPC());
     } else {
         cs->halted = 1;
-- 
2.24.0


