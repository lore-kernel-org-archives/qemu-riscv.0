Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kpbSC-00060o-4y
	for mharc-qemu-riscv@gnu.org; Wed, 16 Dec 2020 13:23:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=612374860=alistair.francis@wdc.com>)
 id 1kpbSA-0005wJ-2n; Wed, 16 Dec 2020 13:23:10 -0500
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:16701)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=612374860=alistair.francis@wdc.com>)
 id 1kpbS7-0000Nm-NW; Wed, 16 Dec 2020 13:23:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1608142987; x=1639678987;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JROCVnbUOqkdLIeAqp3OBuXadPgnVHgJrJLARu6eHR0=;
 b=cGX7QlZ/pgd5UM/gDqhDjR90OVX8WauAhe6YV0KnycF5TUml7Yny2qA/
 LSk59WzcKtvMFziEtkR0Dygb8VgOdC9RXw0PS7AJcmYlEVb4KVTgf8L6A
 XAJVafgsd6pVgvzft1vImyiFPdxerxvxOJhLimUZnZ5TShtX20S9dPFIY
 QTAPCiyI/QEEJ+miXMLHAFgdXfm5CajXFJ1MiLxnXvPj4S05SivDt7bSr
 YWn3sOtWudx3YGRvzxlqjWGvpKha2TztWAstlR6CHofoOpCZjs12QR1HL
 oAg4k90GqU9ERnkiNVFMup1I1b2BnuRAK8RBIMVIAjW1/t9GWHfMDatC3 w==;
IronPort-SDR: MeifR9ixAQWfddWVZEGOUaQbikgYRWlw7s3MjpOT17btJVhkj1a7j+goCRVsgO7LtQKEd9qVGu
 d1PK4pOcuUb+DGmZhOzvMNxCDyCHew/a4DIBTQWOBT3ChrJ5Q1Aevy8HcKNyjKyEVYFI+sIVdB
 iIoYRX6mXLWoy2G4mFvSISquFLpTbZQnCFCYWrn+HSr+97OcVJUv6IR1ZCFsRJ/CUcKjLyk+BK
 VSgCQofYM9B32lRGDWT0uehsa33l07Crh7FtuQkhDy9fOo4R+rLuk21a3qjqYSLpphHuxHEuqg
 a7w=
X-IronPort-AV: E=Sophos;i="5.78,425,1599494400"; d="scan'208";a="265507650"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 17 Dec 2020 02:23:05 +0800
IronPort-SDR: d6DMJU73dAmWD1TNfNbyIlI2U807bMdYuwumErRnurmcQ14+PVrEiQayo0i/lz8d7/3XAMhRIO
 af05M+iqbxMAgDtoCcXZFYwihQbvLXVILi9UINmK5clC1+y00YXiNF6T6xCJALxlUvZRDJgE+I
 QKYSFaTCuMAIiDHlGcT2jcTuOY13hJqlEK8jsTOkDcTDtaH8spoltYseFAl4epc1HBXi1LFCXY
 TMqlgRdeDp2GfjmkcLzaa6pUWYOXRQx9Ods8X8VCqeVB/pj7xkpLrNKN6L1XrBRLIf57tUtGu+
 VodOU8/SH12umfutPfALJwVO
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2020 10:06:40 -0800
IronPort-SDR: avpeVv2NESlGl+6NDvW7RcfNWKeHwTTvVAVdbPFJ5ad7H9olWq8Lr8v9h7VXCnSFSqj+slN1zK
 d7O7bBTwnyhlzeB9jOb0Q/Ddld4qDsjUHOV8S5/0ffJFa+BRxsKofvg0SqFR/MdqjxzbkRXpXF
 XqMe/mC2/0I3SkdMIVqhARfdq3y8O9PRrsOSPe6iAccczcdgP51aKWXFcymvk+y3pA1ob5p9O7
 fg8qWlanyV3lpfzD866EE1NiZ5vqvFbtdI51QX/RljyCwx5LTOYf3rZnkP8wpMSit8sZH+A4Rh
 tRo=
WDCIronportException: Internal
Received: from 1996l72.ad.shared (HELO risc6-mainframe.hgst.com)
 ([10.86.62.67])
 by uls-op-cesaip01.wdc.com with ESMTP; 16 Dec 2020 10:23:06 -0800
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com
Subject: [PATCH v4 15/16] target/riscv: cpu: Set XLEN independently from target
Date: Wed, 16 Dec 2020 10:23:05 -0800
Message-Id: <7eddba45b5d223321c031431849fdd42eceb514b.1608142916.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1608142916.git.alistair.francis@wdc.com>
References: <cover.1608142916.git.alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=612374860=alistair.francis@wdc.com;
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
X-List-Received-Date: Wed, 16 Dec 2020 18:23:10 -0000

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bin.meng@windriver.com>
Tested-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
Acked-by: Palmer Dabbelt <palmerdabbelt@google.com>
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


