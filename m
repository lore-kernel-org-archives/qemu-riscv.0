Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kouYC-0001ef-AH
	for mharc-qemu-riscv@gnu.org; Mon, 14 Dec 2020 15:34:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=61015ee87=alistair.francis@wdc.com>)
 id 1kouYA-0001br-Aq; Mon, 14 Dec 2020 15:34:30 -0500
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:60614)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=61015ee87=alistair.francis@wdc.com>)
 id 1kouY8-0007vm-Ds; Mon, 14 Dec 2020 15:34:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1607978068; x=1639514068;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xdcYIR8GArbtUcuxtMCfvf73FMLCLGSC+ZDhp/W1OLg=;
 b=MCAWLQ7TybrNshHqX1YHOomeEFcl2OSLx6Wp+VZPxfCHlivSmPKkVi5h
 VQuB27BtMwhkTozKAcU0pZ5gbTbsgtqXTlMIyaItiCat6c9M1sCqRaFqk
 /Evnc0dGokYRqicuv0muMy7XHe8E+L7HQ82RudlaXgLjmHSe6kRKzUZaT
 r7zZeqdlNG7zi3kUoeDzSB8/cpjskaclF+jDaUViFqmgGVb9eOfRVesXq
 Zyvctz3cnNHGBUlfFoTsxdQGp6FPJb2tmv72RaFMYTGcwosQxAI3r6O/y
 Xr9rq2x2wuej+Q9KjSF02iLLhVlmF1FsXwClrIPSkDOFIA5oXok2HvUVZ g==;
IronPort-SDR: tpkUvhSRwK3GTos5cFe/lsQQAmfUTOpga2Hxa/kiYeo9Dl9ojOZItLxaLEl76YVi9S/oAxESsi
 syny6aUOg0TgX+BbcIPktZ8UcbCMC8YC89/ljb2TTx8MY4mCJysgspK2yxEvTE7gWUJT1QnYmQ
 LaNeWGA/YLYY0CerUoxN5HCCUEz7dnvIDcuYoVBAcHWGy2c/9NapFOzsMLNqdkF0JYLd4/AytD
 2atN7FZHSn0GxQKfSil8Lta3rqUgMtBjIeD4paUogUYweJ/urUdkWxL9pms1uErfJ1Tyehqv+y
 cMk=
X-IronPort-AV: E=Sophos;i="5.78,420,1599494400"; d="scan'208";a="159586004"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 15 Dec 2020 04:34:26 +0800
IronPort-SDR: Q7Mbsiw4Ndb1Vks6vHwpSS/9kuy3HSpLN5D6Ww3694joGw/1Rs7MFDMeWiMj1092GbQTcrmZ9d
 DlLRf/FJxqGAS/v95DXIB3/gwQX2cwzFlsQeH69qCAPjI9b2WqZxiR2HbEA74s+79S4TxO+y4j
 Rwza6WMlW1fDW4vU/b/0zRw1om4+tY04cetZfPmFsyCA3uQ5vgLoB3NAZcx/g2Eu+w3/X28bmy
 ap2VVW0kLRLEdnwTRt+rq98UbE2mAxqx8hNcYXOA6MV7nIxDPbEz+kA8MeYg7SCbFRPN3VpW0b
 3wRTQn5QwoNGWInLV33EocT4
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2020 12:18:10 -0800
IronPort-SDR: MCh2AgzQU6gzR9hbqNJ3KKM0DbZ9WbS5RGlBr8VFm3FA7H9sSxkZV6XUC4ZOTShWrJvi//DJGQ
 tbWUc9QnT0zAx/I3+qKp9B8GtEYRpfF2dso1FdeQcdg9JwxdoUEGemyL024PZ2PvwtfQMzb/+g
 V8oK+y7v3EFTSQ0GIOkSdaF+2utYXha8uGyYQHBI8fHmE7/e+hsB782YYAKukECx5vkmGQAm53
 s7heSwGBP9iXyuqzybbA4VCjOKkTrzTyPW25hhFcD9p/I6QJVhH5jglVEovbaD8H7VoPHKbRmI
 YS4=
WDCIronportException: Internal
Received: from cnf006900.ad.shared (HELO risc6-mainframe.hgst.com)
 ([10.86.62.52])
 by uls-op-cesaip02.wdc.com with ESMTP; 14 Dec 2020 12:34:26 -0800
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com
Subject: [PATCH v3 11/15] target/riscv: Specify the XLEN for CPUs
Date: Mon, 14 Dec 2020 12:34:26 -0800
Message-Id: <0ba8838ef9061b5f377378ae388bfb92fe13bc2e.1607967113.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1607967113.git.alistair.francis@wdc.com>
References: <cover.1607967113.git.alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=61015ee87=alistair.francis@wdc.com;
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
X-List-Received-Date: Mon, 14 Dec 2020 20:34:30 -0000

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bin.meng@windriver.com>
Tested-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/cpu.c | 33 +++++++++++++++++++++++----------
 1 file changed, 23 insertions(+), 10 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 32a6916b8a..7d6f032122 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -158,22 +158,36 @@ static void riscv_base_cpu_init(Object *obj)
     set_misa(env, 0);
 }
 
-static void rvxx_sifive_u_cpu_init(Object *obj)
+#ifdef TARGET_RISCV64
+static void rv64_sifive_u_cpu_init(Object *obj)
 {
     CPURISCVState *env = &RISCV_CPU(obj)->env;
-    set_misa(env, RVXLEN | RVI | RVM | RVA | RVF | RVD | RVC | RVS | RVU);
+    set_misa(env, RV64 | RVI | RVM | RVA | RVF | RVD | RVC | RVS | RVU);
     set_priv_version(env, PRIV_VERSION_1_10_0);
 }
 
-static void rvxx_sifive_e_cpu_init(Object *obj)
+static void rv64_sifive_e_cpu_init(Object *obj)
 {
     CPURISCVState *env = &RISCV_CPU(obj)->env;
-    set_misa(env, RVXLEN | RVI | RVM | RVA | RVC | RVU);
+    set_misa(env, RV64 | RVI | RVM | RVA | RVC | RVU);
     set_priv_version(env, PRIV_VERSION_1_10_0);
     qdev_prop_set_bit(DEVICE(obj), "mmu", false);
 }
+#else
+static void rv32_sifive_u_cpu_init(Object *obj)
+{
+    CPURISCVState *env = &RISCV_CPU(obj)->env;
+    set_misa(env, RV32 | RVI | RVM | RVA | RVF | RVD | RVC | RVS | RVU);
+    set_priv_version(env, PRIV_VERSION_1_10_0);
+}
 
-#if defined(TARGET_RISCV32)
+static void rv32_sifive_e_cpu_init(Object *obj)
+{
+    CPURISCVState *env = &RISCV_CPU(obj)->env;
+    set_misa(env, RV32 | RVI | RVM | RVA | RVC | RVU);
+    set_priv_version(env, PRIV_VERSION_1_10_0);
+    qdev_prop_set_bit(DEVICE(obj), "mmu", false);
+}
 
 static void rv32_ibex_cpu_init(Object *obj)
 {
@@ -191,7 +205,6 @@ static void rv32_imafcu_nommu_cpu_init(Object *obj)
     set_resetvec(env, DEFAULT_RSTVEC);
     qdev_prop_set_bit(DEVICE(obj), "mmu", false);
 }
-
 #endif
 
 static ObjectClass *riscv_cpu_class_by_name(const char *cpu_model)
@@ -643,13 +656,13 @@ static const TypeInfo riscv_cpu_type_infos[] = {
 #if defined(TARGET_RISCV32)
     DEFINE_CPU(TYPE_RISCV_CPU_BASE32,           riscv_base_cpu_init),
     DEFINE_CPU(TYPE_RISCV_CPU_IBEX,             rv32_ibex_cpu_init),
-    DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_E31,       rvxx_sifive_e_cpu_init),
+    DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_E31,       rv32_sifive_e_cpu_init),
     DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_E34,       rv32_imafcu_nommu_cpu_init),
-    DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_U34,       rvxx_sifive_u_cpu_init),
+    DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_U34,       rv32_sifive_u_cpu_init),
 #elif defined(TARGET_RISCV64)
     DEFINE_CPU(TYPE_RISCV_CPU_BASE64,           riscv_base_cpu_init),
-    DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_E51,       rvxx_sifive_e_cpu_init),
-    DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_U54,       rvxx_sifive_u_cpu_init),
+    DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_E51,       rv64_sifive_e_cpu_init),
+    DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_U54,       rv64_sifive_u_cpu_init),
 #endif
 };
 
-- 
2.29.2


