Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jTtO9-000764-Jy
	for mharc-qemu-riscv@gnu.org; Wed, 29 Apr 2020 16:33:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53434)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <prvs=381fbd49e=alistair.francis@wdc.com>)
 id 1jTtNO-0006MU-GM
 for qemu-riscv@nongnu.org; Wed, 29 Apr 2020 16:32:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <prvs=381fbd49e=alistair.francis@wdc.com>)
 id 1jTtK1-00068T-V4
 for qemu-riscv@nongnu.org; Wed, 29 Apr 2020 16:32:14 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:7545)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=381fbd49e=alistair.francis@wdc.com>)
 id 1jTtK1-00065g-Dd; Wed, 29 Apr 2020 16:28:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1588192125; x=1619728125;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tbkmc57R+L0aN9VLZbhIXSvamug7nnx7kvOn3zmvZfk=;
 b=G3g8jzv8tmRsodo0wi7IaCnBUcs7v3FJywM0oD6UbQ6VHfh6IpAGMEbA
 p/8qpmjb2V2C+eDCOOgOFrPiS/yHdUxF/uha5WkRmr77D85xfa0sp18ja
 AfP7GDO2bdFic4aZ7+ZAsiN/I2MS6jB+lGP/mjNQRJSDWE4+Cfoe2XXl7
 LPpoM5Hox9eIC4cD5tvehf7jQUhPwCqNFhqks+/hUMVvc0ZOIDAXGnhse
 LtZFIrIWtZDN/Wsj6nJuOdz2zwoC8zX1TRkrqoCYgo4T8HKRi9y+3DA9r
 ni/crW0h46Whoh9JP1c/epAdAjZX0ICFaXa5rUkBqtecsCe2ZSTh65ZqX g==;
IronPort-SDR: NIoKf+cFCClzysUNxEvqxWkqARc7NJ7yAwzVRtllxSL32dqtmm9pKkxDMSICtQuAoJOO+WruQ5
 f9aoPw7zvRS1z8+JrKoE0GfUHKIU6krhgxyLKGwtRVUi6E8V1Yq0du3nuRfOp3E1nuerbkTTSu
 PL4/r46/kA+i1BoUcBSC742mD2g+A/IUlF6gVMEUTA2lL7cStxTaRrIS2gtx6Ma3SnLjm9soc6
 SYtsYXPcq2vwwMBSFBQWbhLwV0EVug+ZggvV1SjOIsmJfpvnQzqF/cTVj6fS+9QNn+0RM68suF
 VtI=
X-IronPort-AV: E=Sophos;i="5.73,333,1583164800"; d="scan'208";a="136507039"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 30 Apr 2020 04:28:40 +0800
IronPort-SDR: GhA83PvkdXTUo4VE7/y+lgk2KVRVsan7A42BSCZEtE8aY2KXeOmNyYTBTZQKP+zWupKS1pK4PL
 KJEjfEjpKx7FXStem15+p53nhKrG5d7/w=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2020 13:18:44 -0700
IronPort-SDR: huJC9rIB9WDsoyYH0o1FEdzO+tBW8DKawmjdTWhFUDuvyaqFY6dyQ+k4GvqLc7QCXZxvywgpai
 YkWXOZIC3hYg==
WDCIronportException: Internal
Received: from usa004631.ad.shared (HELO risc6-mainframe.hgst.com)
 ([10.86.56.145])
 by uls-op-cesaip01.wdc.com with ESMTP; 29 Apr 2020 13:28:39 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org
Cc: palmerdabbelt@google.com, qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Corey Wharton <coreyw7@fb.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>
Subject: [PULL v2 09/14] target/riscv: Add a sifive-e34 cpu type
Date: Wed, 29 Apr 2020 13:20:01 -0700
Message-Id: <20200429202006.775322-10-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200429202006.775322-1-alistair.francis@wdc.com>
References: <20200429202006.775322-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=381fbd49e=alistair.francis@wdc.com;
 helo=esa4.hgst.iphmx.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/29 16:28:37
X-ACL-Warn: Detected OS   = FreeBSD 9.x or newer [fuzzy]
X-Received-From: 216.71.154.42
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
X-List-Received-Date: Wed, 29 Apr 2020 20:32:59 -0000

From: Corey Wharton <coreyw7@fb.com>

The sifive-e34 cpu type is the same as the sifive-e31 with the
single precision floating-point extension enabled.

Signed-off-by: Corey Wharton <coreyw7@fb.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Message-id: 20200313193429.8035-3-coreyw7@fb.com
Message-Id: <20200313193429.8035-3-coreyw7@fb.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 10 ++++++++++
 target/riscv/cpu.h |  1 +
 2 files changed, 11 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 4e578239d3..059d71f2c7 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -164,6 +164,15 @@ static void rv32imacu_nommu_cpu_init(Object *obj)
     set_feature(env, RISCV_FEATURE_PMP);
 }
 
+static void rv32imafcu_nommu_cpu_init(Object *obj)
+{
+    CPURISCVState *env = &RISCV_CPU(obj)->env;
+    set_misa(env, RV32 | RVI | RVM | RVA | RVF | RVC | RVU);
+    set_priv_version(env, PRIV_VERSION_1_10_0);
+    set_resetvec(env, DEFAULT_RSTVEC);
+    set_feature(env, RISCV_FEATURE_PMP);
+}
+
 #elif defined(TARGET_RISCV64)
 
 static void riscv_base64_cpu_init(Object *obj)
@@ -610,6 +619,7 @@ static const TypeInfo riscv_cpu_type_infos[] = {
 #if defined(TARGET_RISCV32)
     DEFINE_CPU(TYPE_RISCV_CPU_BASE32,           riscv_base32_cpu_init),
     DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_E31,       rv32imacu_nommu_cpu_init),
+    DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_E34,       rv32imafcu_nommu_cpu_init),
     DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_U34,       rv32gcsu_priv1_10_0_cpu_init),
     /* Depreacted */
     DEFINE_CPU(TYPE_RISCV_CPU_RV32IMACU_NOMMU,  rv32imacu_nommu_cpu_init),
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 7d21addbab..d0e7f5b9c5 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -36,6 +36,7 @@
 #define TYPE_RISCV_CPU_BASE32           RISCV_CPU_TYPE_NAME("rv32")
 #define TYPE_RISCV_CPU_BASE64           RISCV_CPU_TYPE_NAME("rv64")
 #define TYPE_RISCV_CPU_SIFIVE_E31       RISCV_CPU_TYPE_NAME("sifive-e31")
+#define TYPE_RISCV_CPU_SIFIVE_E34       RISCV_CPU_TYPE_NAME("sifive-e34")
 #define TYPE_RISCV_CPU_SIFIVE_E51       RISCV_CPU_TYPE_NAME("sifive-e51")
 #define TYPE_RISCV_CPU_SIFIVE_U34       RISCV_CPU_TYPE_NAME("sifive-u34")
 #define TYPE_RISCV_CPU_SIFIVE_U54       RISCV_CPU_TYPE_NAME("sifive-u54")
-- 
2.26.2


