Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kouYM-00026m-G0
	for mharc-qemu-riscv@gnu.org; Mon, 14 Dec 2020 15:34:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=61015ee87=alistair.francis@wdc.com>)
 id 1kouYL-00023H-7e; Mon, 14 Dec 2020 15:34:41 -0500
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:20005)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=61015ee87=alistair.francis@wdc.com>)
 id 1kouYJ-0007wB-8d; Mon, 14 Dec 2020 15:34:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1607978079; x=1639514079;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uduk8fTiiFBWthDtcgxNC7lo0McDfT8xvXc/N+cyNb8=;
 b=BzLHarVbrUZq1lEe55p24qPeSlTUbQDfBkIWjLcEd2dpyQ60gyh+hC1A
 MDg0OubIF3/NCc4TLbPmkwt1a7tURk3TudqVJtkCkuVqif++JUk3o2/Zl
 W0vWkb+eLOahZZjbFUoMlSjsf/+hLqhn5h+c/0hi98ejFnD+rrVWmAfpn
 +piU2R+qYDA7l8Y9wHr31DyHoN2ABbRwS/fhLrRLCzxvr8n0AVCPv7LLt
 IgxUNvvaG9h6wgbZPTcIbiBLQtIQ8PLUKE0nSj/8BtCvPmsUgwahw966M
 uNdyDm4HRoHCfkwcOoUVwffmjy9BaoOtpaHtcnwTIqvUwkP5CxBAHygpb Q==;
IronPort-SDR: DVoyZ78YCQRdtAjXKhcbBV3HeGWgiyAQHm7VsZR7/+gnGo9QlU9esktOB6oinx2qcVlH/rzLPi
 hSjOq9xFul+07H+AmAfTPhJBSNLQeXjZc8mozBrl+OEyU7OUWpWIkl3waygfsjvZzN1jSnUTKG
 7gIYK3fN6iNa3ccZA7mQBrobTVpFNE1x9kELlmc/jQIgtLqWnQY7uzjMGE+sC1SfQyzhCQdaKZ
 sDkXgT++8d+dUOGM5MFmNSP6GxGZx4M/S8B/QCYFu814LNP/4nWLni40RXr5Dk2GzuEq6bYKmt
 Soo=
X-IronPort-AV: E=Sophos;i="5.78,420,1599494400"; d="scan'208";a="265318163"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 15 Dec 2020 04:34:37 +0800
IronPort-SDR: zaHA+0jwn5fCKqyVY3fh9aZp0hVN5cYO1VEi/nOyBy+ypiIK9uUSLACshBaYIP7KvO6dp2tEon
 6h+wnQn9+fIIbZYu9gV4Ogir7QUPK/Lotb9thqzZtxEN2W9fHaYFgaXxokswpclbBkrYgD/Jql
 cRx0s4+QCWpAT5fvHZsAjtJnN+AcvuaGhoLncOHL9ZS0G0ln583FV7mhlKLn+gEJsJAAH7cyt1
 gMnaItXQF5nxTRtKMIReIOOAH+WM8ghL2ht1AjfjzKPAm7PYgxGzhvLSF6TOWeBrc01ceYlwtq
 Yc7SWty0I3LTPVi5tMeb7Ddy
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2020 12:19:57 -0800
IronPort-SDR: p4BtJ87rGz1N3HZXKAi6KpTYxc+yUE4b4FjEVhSGbSGK1c3UWbTEj/eMmPV5WZzMZ+AM78zQHa
 qStNiYR6+oqda9fUHLxFSN8P/9UtRf5uNK6m3DADyCWupceVKYegh6Fpu9j5J+YPLXBnPVmllj
 eTIB1eAAHntXobtsvUJZNhzjvjJ3BSYdb/QZyZJ34zxe6Wo/yuXIvv487yc06ONAN8RbVQTfv6
 k5pPA1DVaviT8TGFSx/FIjWZP1T+ppjoFirNSJyNO8znb9cYGzI4lZZfKFstBz2oJmuzTGNLWh
 8xs=
WDCIronportException: Internal
Received: from cnf006900.ad.shared (HELO risc6-mainframe.hgst.com)
 ([10.86.62.52])
 by uls-op-cesaip01.wdc.com with ESMTP; 14 Dec 2020 12:34:38 -0800
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com
Subject: [PATCH v3 15/15] target/riscv: cpu: Set XLEN independently from target
Date: Mon, 14 Dec 2020 12:34:37 -0800
Message-Id: <0508789530dc788a1abda41e04bafb65d377a1ad.1607967113.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1607967113.git.alistair.francis@wdc.com>
References: <cover.1607967113.git.alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=61015ee87=alistair.francis@wdc.com;
 helo=esa1.hgst.iphmx.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
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
X-List-Received-Date: Mon, 14 Dec 2020 20:34:41 -0000

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bin.meng@windriver.com>
Tested-by: Bin Meng <bin.meng@windriver.com>
---
 target/riscv/cpu.c | 25 ++++++++++++++++---------
 1 file changed, 16 insertions(+), 9 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 47b738c314..254cd83f8b 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -151,14 +151,14 @@ static void riscv_any_cpu_init(Object *obj)
     set_priv_version(env, PRIV_VERSION_1_11_0);
 }
 
-static void riscv_base_cpu_init(Object *obj)
+#if defined(TARGET_RISCV64)
+static void rv64_base_cpu_init(Object *obj)
 {
     CPURISCVState *env = &RISCV_CPU(obj)->env;
     /* We set this in the realise function */
-    set_misa(env, 0);
+    set_misa(env, RV64);
 }
 
-#ifdef TARGET_RISCV64
 static void rv64_sifive_u_cpu_init(Object *obj)
 {
     CPURISCVState *env = &RISCV_CPU(obj)->env;
@@ -174,6 +174,13 @@ static void rv64_sifive_e_cpu_init(Object *obj)
     qdev_prop_set_bit(DEVICE(obj), "mmu", false);
 }
 #else
+static void rv32_base_cpu_init(Object *obj)
+{
+    CPURISCVState *env = &RISCV_CPU(obj)->env;
+    /* We set this in the realise function */
+    set_misa(env, RV32);
+}
+
 static void rv32_sifive_u_cpu_init(Object *obj)
 {
     CPURISCVState *env = &RISCV_CPU(obj)->env;
@@ -372,7 +379,7 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
     RISCVCPUClass *mcc = RISCV_CPU_GET_CLASS(dev);
     int priv_version = PRIV_VERSION_1_11_0;
     int vext_version = VEXT_VERSION_0_07_1;
-    target_ulong target_misa = 0;
+    target_ulong target_misa = env->misa;
     Error *local_err = NULL;
 
     cpu_exec_realizefn(cs, &local_err);
@@ -407,8 +414,8 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
 
     set_resetvec(env, cpu->cfg.resetvec);
 
-    /* If misa isn't set (rv32 and rv64 machines) set it here */
-    if (!env->misa) {
+    /* If only XLEN is set for misa, then set misa from properties */
+    if (env->misa == RV32 || env->misa == RV64) {
         /* Do some ISA extension error checking */
         if (cpu->cfg.ext_i && cpu->cfg.ext_e) {
             error_setg(errp,
@@ -504,7 +511,7 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
             set_vext_version(env, vext_version);
         }
 
-        set_misa(env, RVXLEN | target_misa);
+        set_misa(env, target_misa);
     }
 
     riscv_cpu_register_gdb_regs_for_features(cs);
@@ -655,13 +662,13 @@ static const TypeInfo riscv_cpu_type_infos[] = {
     },
     DEFINE_CPU(TYPE_RISCV_CPU_ANY,              riscv_any_cpu_init),
 #if defined(TARGET_RISCV32)
-    DEFINE_CPU(TYPE_RISCV_CPU_BASE32,           riscv_base_cpu_init),
+    DEFINE_CPU(TYPE_RISCV_CPU_BASE32,           rv32_base_cpu_init),
     DEFINE_CPU(TYPE_RISCV_CPU_IBEX,             rv32_ibex_cpu_init),
     DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_E31,       rv32_sifive_e_cpu_init),
     DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_E34,       rv32_imafcu_nommu_cpu_init),
     DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_U34,       rv32_sifive_u_cpu_init),
 #elif defined(TARGET_RISCV64)
-    DEFINE_CPU(TYPE_RISCV_CPU_BASE64,           riscv_base_cpu_init),
+    DEFINE_CPU(TYPE_RISCV_CPU_BASE64,           rv64_base_cpu_init),
     DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_E51,       rv64_sifive_e_cpu_init),
     DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_U54,       rv64_sifive_u_cpu_init),
 #endif
-- 
2.29.2


