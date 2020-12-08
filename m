Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kmlu8-0007rI-7s
	for mharc-qemu-riscv@gnu.org; Tue, 08 Dec 2020 17:56:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=6040d5def=alistair.francis@wdc.com>)
 id 1kmlu5-0007kf-Hu; Tue, 08 Dec 2020 17:56:17 -0500
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:43219)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=6040d5def=alistair.francis@wdc.com>)
 id 1kmlu3-00047S-Pg; Tue, 08 Dec 2020 17:56:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1607468176; x=1639004176;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5TzJ0MhdBNXGaUoQfYSd1oKvkSekJTFdwh70MrGYcFk=;
 b=Tg70nm2gCgVD3gzqMWrpbo14SwUseDaf+fsGZjnghqDtX4ZbDTIk0ULm
 qU5B9jFttSBoPQDICRjCe04vHCpoHK6tAJfgeLhdRszilc0jeJ3YAw7ir
 JgruG++lnbaJfLOGvkskZ3LFK5lruQVMzdqqBxjFaE4sWoDpAqQDsyqL+
 2ByY4QWBQ+8K6g/RgRUDIpnbASLE7ZB3n7yRwM0Kvm7CeELU1aRhq7QyZ
 qsx+KVudboT8Ot4VEg+x+cF5hhztl4PLmEHOm14he0vHtKK/ghWKqLL2F
 LV5z6PkoWY+/PucRKAd++JkaZDDFQH2raYqk+17YwvxqAMhHOIKXkfTDv Q==;
IronPort-SDR: u0vLWBxlv5gLyn874P4N4Q3emgRgsNiCmHFKl6qp0VfxMgRZdeFwkOOCy52q1n3auN8fnSCkbm
 2U6Wo9OJFjlXLRY9JIYWwyDEyHsqKJjPGI4OV1xckwWUlsSmXiql6tYY8YptUynoP5bRcC21k7
 GcB/sx0RiiLFypLwcM5Y9qZLlDk2iaj0b3C5dUzgsAOvnF0UyDERNZ4z9TqaqNgNvHrnwXsjSU
 aWiCun4H7y/yr/WKi7Jotxu7TC39oeUWzBcw2yNIJC7PvbIvLE1doCDrpHl0khBHxUfXL8EgwW
 ATo=
X-IronPort-AV: E=Sophos;i="5.78,404,1599494400"; d="scan'208";a="155938394"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 09 Dec 2020 06:56:15 +0800
IronPort-SDR: dMeK0WUt/5zJJXWkTcm4SWGFm8rd3IrOqUy70t/N/qBz+7fmBnfNUf1yRZG2YJlQyiIiEn+oIJ
 pIozVgixn1ATLVa8WJbQZFxZrHRBS7na8=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2020 14:41:41 -0800
IronPort-SDR: i6B+HVGyUCQmK8o+8L/WOYtO9NK5TG6k02/5whtpN9SUBQUK2OmnXoPNNmPi8Q1FsMy2zC55oT
 hCTmvIjw2b/g==
WDCIronportException: Internal
Received: from usa001386.ad.shared (HELO risc6-mainframe.hgst.com)
 ([10.86.61.239])
 by uls-op-cesaip02.wdc.com with ESMTP; 08 Dec 2020 14:56:15 -0800
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com
Subject: [PATCH v2 02/15] target/riscv: Add a TYPE_RISCV_CPU_BASE CPU
Date: Tue,  8 Dec 2020 14:56:14 -0800
Message-Id: <d37d5968c8e15c1b3c7b2b8e5c134d43ebcfa708.1607467819.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1607467819.git.alistair.francis@wdc.com>
References: <cover.1607467819.git.alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=6040d5def=alistair.francis@wdc.com;
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
X-List-Received-Date: Tue, 08 Dec 2020 22:56:18 -0000

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


