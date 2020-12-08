Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kmlum-0008Ss-6j
	for mharc-qemu-riscv@gnu.org; Tue, 08 Dec 2020 17:57:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=6040d5def=alistair.francis@wdc.com>)
 id 1kmlug-0008QT-Ox; Tue, 08 Dec 2020 17:56:56 -0500
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:31149)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=6040d5def=alistair.francis@wdc.com>)
 id 1kmlud-0004Ed-Ny; Tue, 08 Dec 2020 17:56:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1607468211; x=1639004211;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uduk8fTiiFBWthDtcgxNC7lo0McDfT8xvXc/N+cyNb8=;
 b=ENKvbk45rPvMZERqaVBpriNwvEro3vSB1Cz0n8vcd45MdRPMKoTImf7T
 kNRAXFBhXME6ys147ap5V2Qikdo62VhLQ0XNnujEQnxRJd8rtizBnTjCN
 WHs3/4t5rTqw5n02gJSNMJQwUeejYFYeZCNGyRCt9tj/4Uk8wM9GfHthV
 qFhrNMhVZ7wQnldJRxdiZbTnQPWth/kQ2iSldKB1pK+BzsaqhNjS5FOBV
 Kixw9pniMy7tlwUr9/uR2ZV04YT0ei+M5PSuAhlfFW9Wb4qAOAqiTJ+f+
 f/w6EKECt6Z7USF4VbrvpggQhAXpI0UsP8fMJDUEmdCjwq7/0hOF3zmXB Q==;
IronPort-SDR: BP3iLnTf3H+HaOEN+wTC0rL2yk2wdafiXdym6UMNs0V2tpEhb2/KZ1+TrN+ewXJaEWFMVTjVyy
 /tICJs8MsoakUWYXRJkYVRwcJiDmthOeEZ+kF63/Ms7Mdxz/DqP1mBX0bIlvLOnGvGEmE1OBKR
 I3rFimISP4GK75IC98tMm8//ojMczq74HSbPPHiRugmoG8mKxGs5CSds9cmnO95TIKCUAIrDf7
 tTb2IGjLfBf/Jb3lBYilnMJOuuN9cyvWtSP7D/QzeJxqumE95QZiBmZtAwUHj5BwbykBzHxjjV
 CpA=
X-IronPort-AV: E=Sophos;i="5.78,404,1599494400"; d="scan'208";a="154713858"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 09 Dec 2020 06:56:50 +0800
IronPort-SDR: R/OqeDfqEN5EYnvt1d3uVfF66QokyR0aBw6cmkEzhW/T66Ao1DUgapRjNqz1WkLK1qAKRBuPy7
 lWEt0p7aRpISIWuEiqud9yz5Xbvs36SM0=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2020 14:42:17 -0800
IronPort-SDR: n23fRTZ8m50niCpMjf4pqrz/mhc1m89hA4xyPyYIq5hhYWK2+bhWf5urCuuJbbSDHUYhe8TYfi
 OOxfAdE8RaRw==
WDCIronportException: Internal
Received: from usa001386.ad.shared (HELO risc6-mainframe.hgst.com)
 ([10.86.61.239])
 by uls-op-cesaip01.wdc.com with ESMTP; 08 Dec 2020 14:56:50 -0800
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com
Subject: [PATCH v2 15/15] target/riscv: cpu: Set XLEN independently from target
Date: Tue,  8 Dec 2020 14:56:50 -0800
Message-Id: <4b309ddc9f794205b497968524715ba4cd73b455.1607467819.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1607467819.git.alistair.francis@wdc.com>
References: <cover.1607467819.git.alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=6040d5def=alistair.francis@wdc.com;
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
X-List-Received-Date: Tue, 08 Dec 2020 22:56:58 -0000

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


