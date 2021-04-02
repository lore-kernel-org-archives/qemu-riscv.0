Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lSJFB-0001WQ-9X
	for mharc-qemu-riscv@gnu.org; Fri, 02 Apr 2021 08:49:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7197bd837=alistair.francis@wdc.com>)
 id 1lSJF9-0001UA-Ro; Fri, 02 Apr 2021 08:49:43 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:3524)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7197bd837=alistair.francis@wdc.com>)
 id 1lSJF8-0004wX-9N; Fri, 02 Apr 2021 08:49:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1617367782; x=1648903782;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=arIzgXLNsXFV59LBlt/qPi792+nckdmzeESZkM5VfiY=;
 b=qkQk60FEDZhJtNJn6tfbvC4lzF86vdFcJSOgoVHwZBXlSFTRz2WIuZ/X
 E1/dCR9WWJDV2eomYtBu+eX5TcwOPv1dZe1dpWwm2aU5msrFctwiDfZcH
 yIDHXL7YoYbRy2vWz/Q0LanQ4hgRZjX6YppxVxrzE3YBq+WNE9QXqQgwj
 UwxaiNdtA21yczqHJoreK2zK7/Bmm6eY2RTkLLA9jD2y+89+Exx/jDSoj
 hUXcGYbaSNwaNAJqQ2lPNuB1Lf93pSDz+gmHfXwE3JcujcUKG60GTRUvZ
 xWJhvLBizFWg8QF2pK0i1BJJDOIXWqzf5goUa9f55aeDgWmNitxYhOSpi g==;
IronPort-SDR: tYhLX2IsRRhaMJ+IYYoee9fWe9pYyZxsr9cRCERU1XnZyftMdf+7PuBXTaz0oSzlWAXWGfZFtI
 7Ktv2ZgJOQJHEXoK0p/i7NK2j8z5f725YYzAuySKoHZLHTZ83CUBzIxd87Ew4+g3OQml4riD9t
 LInSDZMtlYNClLMJz5Y9C+tVbQ9CW46nAIp8OCEB3J8r22vcFbICIBBwtEsILmh9/8DMZkeXoD
 +atG/+1BrTcw3DTHF21uA3aD/lWFnL78I6Jv6gTLtYbIz/m2sNizdPEyEDkizAopbYRml+GpQO
 vsI=
X-IronPort-AV: E=Sophos;i="5.81,299,1610380800"; d="scan'208";a="274495124"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 02 Apr 2021 20:49:40 +0800
IronPort-SDR: D+oN6uVdXT3wQc/xRHSFls6Qhk6doZE6sejbRlltMXesVa7mJPa/Z7izPYR8adMJKn5pJm01Lf
 X5AMnyc4oo/1eijWvqBQBj7o3Di3xQtIZQ7XGDaX601t1sBk1op9qiJ1ZTqf7Ym6MU2xITyr/P
 WXgNRrAEkCaR36aoOPr6qcNTGzo/2oa8BeypMAtdfdxtDrmBMIw67Wr3b10NGElMOr56HFtnEC
 YyQYMMhfIJTfab4VS+mM1UMm5sPJ44XR9zAnZZWER+hsDxKZyuQRoNcx/QyvV+Kfgk9SJsgmfq
 VDCmcwTV//6z6KQmFOBKlIpS
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2021 05:31:21 -0700
IronPort-SDR: /xSwc9H9Db0x4bH4+Ic9VC5yEf8Ge9Y+uU3fvedVbMaqmtfUiZ13Mhs5wiPpMdmX9BHdY+T25+
 5jt2fDP4BojQtzEEptz4i8NmxMQxDROz6UtdtqHntgHjHMOkylcQvcLd1PVsC1qafZmoRLtM0I
 BvEFvVEm2Ik7tnzc7IMzaxmhGlWv6kwEWv9jLhgXk9zy7+aZtvEAk/DYgxq0HIGt9D5JVMiZAf
 EAYsdId0KqnVaoYDCKySpvCgqvwuborWFo2oCckPlNb0xWJX7V+aQ0YcaXp6tVpqTAk5XzrnQm
 4UY=
WDCIronportException: Internal
Received: from unknown (HELO alistair-risc6-laptop.wdc.com) ([10.225.167.78])
 by uls-op-cesaip02.wdc.com with ESMTP; 02 Apr 2021 05:49:39 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com, Ethan.Lee.QNL@gmail.com, weiying_hou@outlook.com,
 camiyoru@gmail.com
Subject: [PATCH v1 3/8] target/riscv: Add the ePMP feature
Date: Fri,  2 Apr 2021 08:47:44 -0400
Message-Id: <5c59f6a40a5bdff35c086f35665e97de5b872c64.1617367533.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <cover.1617367533.git.alistair.francis@wdc.com>
References: <cover.1617367533.git.alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=7197bd837=alistair.francis@wdc.com;
 helo=esa1.hgst.iphmx.com
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
X-List-Received-Date: Fri, 02 Apr 2021 12:49:44 -0000

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 0a33d387ba..8dcb4a4bb2 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -80,6 +80,7 @@
 enum {
     RISCV_FEATURE_MMU,
     RISCV_FEATURE_PMP,
+    RISCV_FEATURE_EPMP,
     RISCV_FEATURE_MISA
 };
 
-- 
2.31.0


