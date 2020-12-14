Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kouXn-0000jr-NO
	for mharc-qemu-riscv@gnu.org; Mon, 14 Dec 2020 15:34:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=61015ee87=alistair.francis@wdc.com>)
 id 1kouXm-0000gv-6a; Mon, 14 Dec 2020 15:34:06 -0500
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:42389)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=61015ee87=alistair.francis@wdc.com>)
 id 1kouXj-0007s4-M8; Mon, 14 Dec 2020 15:34:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1607978044; x=1639514044;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5TzJ0MhdBNXGaUoQfYSd1oKvkSekJTFdwh70MrGYcFk=;
 b=qiaEdU+rhvjXmXaVZAoVLkQo7jVA/ychmHL9/xtksuWTBHPGsBnd0b3x
 n0BBA7aNa46aWSbiN4rA2Pt5d3ZMs4/vE5X6CeTApL/eiYGFCV6n5WbyJ
 LiOjcdbb3LKb1+whKo7TOTh3PpN8xIdrUt9JZsQvDHsCaVw246jErk3nt
 1PgYLG53NRx70YQFBFmg8q/v35kbDi7sfrObOQijYCq3V5gvANJW5uc0M
 83Vx2EUjC6gOFQZpvZodRSGH+8j5A0JrRMXum4syKTm71tQ6z4AR0Jpwl
 T8oWBI7TnSDHBuPiRFD6gRgOwVdi6Jod7lOaQI/0X9uXVeXQhj9Ge99I5 g==;
IronPort-SDR: L2lx7UDChAqwH/tiSOKcFSt9/3cGU7fROCcBalCcsgwvH8iaBrir1Zh3L1wdZBelesCShNWlJv
 pkn84FGyRQRNil6ZvNxLs2VxO5nD60Ij2ZQByRmUryR5r1Wxhsi3y/e2FIsKwF/DNBz6/zVAOl
 1GP8kiRSWnRvOFu7qoR8IkjEfm6dGdcNMNBlMkTnLdUVwEFbCy51JtJrWyH2MBz43+RCHi6zd6
 Qfux1Va6ZeVbEJ7EJn128pDtxAoJlgWxMyJ3OZ30yHqMwJqR7szgcabrkBnuip+301U5IfBZlK
 jXI=
X-IronPort-AV: E=Sophos;i="5.78,420,1599494400"; d="scan'208";a="156338104"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 15 Dec 2020 04:34:02 +0800
IronPort-SDR: QEO58y709jmkd1wH1BoCSxiXaoEZys9RquCkKKl+C1MK4lyXWo1ibh7/ZPVvzlO/gAr7evFy35
 pwGUzh4bamz2Jb19UEbliZfAXBtww/+X/XwZ4M0koT1fM3c9wHx2BMQ1VFkV+Qaof/mxH6HxpA
 a8pFWEgXfd57t7EuPuzz3My2uwkEm8LBw8CYDepoeZ+xMsV8dERBYG2b1m24U/wYCEZ89cc+f7
 TvgBv6/aIml59Ni6ob9wFWNKCRJ7ev0IO8AwVJSct3aRh0eP1aYhTc71OcZr4xOoL6UymlS9Dn
 2QCENd3WtoKpZG9kgP0LP0KI
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2020 12:17:45 -0800
IronPort-SDR: Mp9FgjYmP8Z6/r/GVaTcFhu6ogltrSUgRFJdQlw0Usbp/44JurnM4d0BGui4+hpjCtzkhJIyUk
 xzmnfJl07jLnVUqDVxLdfLD63XWF8G2j87/Wi0r9m2rS6I31yMPjs2dKxyQ0i36c+/boG5YuBH
 n3KxgEjNE5vRsC7IdqzysukGcdFLJcHpLF5DzAJ4J+Ev6re2szxJ+6D1lXvfAzNNnxbBKYupL7
 P9uP/m73h13J5qp1Mh89jXxSuxinQDyJ6dGuPap6rVq5oS2nJI7Zqb6TDSa8+YTZpqDYMSx5pO
 jUM=
WDCIronportException: Internal
Received: from cnf006900.ad.shared (HELO risc6-mainframe.hgst.com)
 ([10.86.62.52])
 by uls-op-cesaip02.wdc.com with ESMTP; 14 Dec 2020 12:34:02 -0800
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com
Subject: [PATCH v3 02/15] target/riscv: Add a TYPE_RISCV_CPU_BASE CPU
Date: Mon, 14 Dec 2020 12:34:01 -0800
Message-Id: <fd0a20ffcd4b6d857ee29a3c95b8598d8e43c2de.1607967113.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1607967113.git.alistair.francis@wdc.com>
References: <cover.1607967113.git.alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=61015ee87=alistair.francis@wdc.com;
 helo=esa6.hgst.iphmx.com
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
X-List-Received-Date: Mon, 14 Dec 2020 20:34:06 -0000

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bin.meng@windriver.com>
Tested-by: Bin Meng <bin.meng@windriver.com>
---
 target/riscv/cpu.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index c0a326c843..9c064f3094 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -44,6 +44,12 @@
 #define TYPE_RISCV_CPU_SIFIVE_U34       RISCV_CPU_TYPE_NAME("sifive-u34")
 #define TYPE_RISCV_CPU_SIFIVE_U54       RISCV_CPU_TYPE_NAME("sifive-u54")
 
+#if defined(TARGET_RISCV32)
+# define TYPE_RISCV_CPU_BASE            TYPE_RISCV_CPU_BASE32
+#elif defined(TARGET_RISCV64)
+# define TYPE_RISCV_CPU_BASE            TYPE_RISCV_CPU_BASE64
+#endif
+
 #define RV32 ((target_ulong)1 << (TARGET_LONG_BITS - 2))
 #define RV64 ((target_ulong)2 << (TARGET_LONG_BITS - 2))
 
-- 
2.29.2


