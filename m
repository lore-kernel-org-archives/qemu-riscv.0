Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mwoMJ-0003hl-OH
	for mharc-qemu-riscv@gnu.org; Mon, 13 Dec 2021 11:39:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1mwoM7-0003Ey-ED; Mon, 13 Dec 2021 11:39:16 -0500
Received: from zm-mta-out-3.u-ga.fr ([152.77.200.56]:46726)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1mwoM3-0003bf-T0; Mon, 13 Dec 2021 11:39:15 -0500
Received: from mailhost.u-ga.fr (mailhost2.u-ga.fr [129.88.177.242])
 by zm-mta-out-3.u-ga.fr (Postfix) with ESMTP id EE8844034C;
 Mon, 13 Dec 2021 17:38:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=univ-grenoble-alpes.fr; s=2020; t=1639413525;
 bh=853iV/vkn0Ol7PCTrjBB6d0DRD7KgCEqRQUBw0ncMhg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ZkRVrpjDJ1CMY5P+VE5kkWVW0yhIqkpcFweDxlxyvXjsgJmVYOvkiDB9JroZf3gxp
 N9L0BrNrhWu7dFoOYnjGbLeDTFjhMTqs4dAMg9oMo5TZc9yPffkZ2mGg9PtMhcNWEE
 QFVy/fJxTvhTln4hsaILCUV4SSGvgAyL9iJN3nEF0Ca4qQNPdKSrDP/vu91v2LLaM7
 QVF9b5oiPmvQl38aKBNSVCMDWumXPFMOq7xDf0H9nFcsaGX5H3tf9LjKD3kx1UeEg9
 VQAPRG+Yfl0BxDuiiGlEdmGTRwnzbXTUvwehgKBLp3M55cIQucFVgg898CRHCQX7kk
 Kz4Sv+LJ68Y7g==
Received: from smtps.univ-grenoble-alpes.fr (smtps2.u-ga.fr [152.77.18.2])
 by mailhost.u-ga.fr (Postfix) with ESMTP id D59B560067;
 Mon, 13 Dec 2021 17:38:40 +0100 (CET)
Received: from palmier.tima.u-ga.fr (35.201.90.79.rev.sfr.net [79.90.201.35])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: petrotf@univ-grenoble-alpes.fr)
 by smtps.univ-grenoble-alpes.fr (Postfix) with ESMTPSA id A728114007F;
 Mon, 13 Dec 2021 17:38:40 +0100 (CET)
From: =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20P=C3=A9trot?=
 <frederic.petrot@univ-grenoble-alpes.fr>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: alistair.francis@wdc.com, richard.henderson@linaro.org,
 bin.meng@windriver.com, philmd@redhat.com, palmer@dabbelt.com,
 fabien.portas@grenoble-inp.org,
 =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20P=C3=A9trot?=
 <frederic.petrot@univ-grenoble-alpes.fr>
Subject: [PATCH v7 07/18] target/riscv: setup everything for rv64 to support
 rv128 execution
Date: Mon, 13 Dec 2021 17:38:23 +0100
Message-Id: <20211213163834.170504-8-frederic.petrot@univ-grenoble-alpes.fr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211213163834.170504-1-frederic.petrot@univ-grenoble-alpes.fr>
References: <20211213163834.170504-1-frederic.petrot@univ-grenoble-alpes.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Greylist: Whitelist-UGA SMTP Authentifie (petrotf@univ-grenoble-alpes.fr)
 via submission-587 ACL (42)
X-Greylist: Whitelist-UGA MAILHOST (SMTP non authentifie) depuis 152.77.18.2
Received-SPF: pass client-ip=152.77.200.56;
 envelope-from=frederic.petrot@univ-grenoble-alpes.fr;
 helo=zm-mta-out-3.u-ga.fr
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 13 Dec 2021 16:39:18 -0000

This patch adds the support of the '-cpu rv128' option to
qemu-system-riscv64 so that we can indicate that we want to run rv128
executables.
Still, there is no support for 128-bit insns at that stage so qemu fails
miserably (as expected) if launched with this option.

Signed-off-by: Frédéric Pétrot <frederic.petrot@univ-grenoble-alpes.fr>
Co-authored-by: Fabien Portas <fabien.portas@grenoble-inp.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 include/disas/dis-asm.h |  1 +
 target/riscv/cpu.h      |  1 +
 disas/riscv.c           |  5 +++++
 target/riscv/cpu.c      | 20 ++++++++++++++++++++
 target/riscv/gdbstub.c  |  5 +++++
 5 files changed, 32 insertions(+)

diff --git a/include/disas/dis-asm.h b/include/disas/dis-asm.h
index 08e1beec85..102a1e7f50 100644
--- a/include/disas/dis-asm.h
+++ b/include/disas/dis-asm.h
@@ -459,6 +459,7 @@ int print_insn_nios2(bfd_vma, disassemble_info*);
 int print_insn_xtensa           (bfd_vma, disassemble_info*);
 int print_insn_riscv32          (bfd_vma, disassemble_info*);
 int print_insn_riscv64          (bfd_vma, disassemble_info*);
+int print_insn_riscv128         (bfd_vma, disassemble_info*);
 int print_insn_rx(bfd_vma, disassemble_info *);
 int print_insn_hexagon(bfd_vma, disassemble_info *);
 
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 53a295efb7..cbd4daa6d9 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -38,6 +38,7 @@
 #define TYPE_RISCV_CPU_ANY              RISCV_CPU_TYPE_NAME("any")
 #define TYPE_RISCV_CPU_BASE32           RISCV_CPU_TYPE_NAME("rv32")
 #define TYPE_RISCV_CPU_BASE64           RISCV_CPU_TYPE_NAME("rv64")
+#define TYPE_RISCV_CPU_BASE128          RISCV_CPU_TYPE_NAME("rv128")
 #define TYPE_RISCV_CPU_IBEX             RISCV_CPU_TYPE_NAME("lowrisc-ibex")
 #define TYPE_RISCV_CPU_SHAKTI_C         RISCV_CPU_TYPE_NAME("shakti-c")
 #define TYPE_RISCV_CPU_SIFIVE_E31       RISCV_CPU_TYPE_NAME("sifive-e31")
diff --git a/disas/riscv.c b/disas/riscv.c
index 793ad14c27..03c8dc9961 100644
--- a/disas/riscv.c
+++ b/disas/riscv.c
@@ -3090,3 +3090,8 @@ int print_insn_riscv64(bfd_vma memaddr, struct disassemble_info *info)
 {
     return print_insn_riscv(memaddr, info, rv64);
 }
+
+int print_insn_riscv128(bfd_vma memaddr, struct disassemble_info *info)
+{
+    return print_insn_riscv(memaddr, info, rv128);
+}
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 364140f5ff..7f5370f2b2 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -178,6 +178,19 @@ static void rv64_sifive_e_cpu_init(Object *obj)
     set_priv_version(env, PRIV_VERSION_1_10_0);
     qdev_prop_set_bit(DEVICE(obj), "mmu", false);
 }
+
+static void rv128_base_cpu_init(Object *obj)
+{
+    if (qemu_tcg_mttcg_enabled()) {
+        /* Missing 128-bit aligned atomics */
+        error_report("128-bit RISC-V currently does not work with Multi "
+                     "Threaded TCG. Please use: -accel tcg,thread=single");
+        exit(EXIT_FAILURE);
+    }
+    CPURISCVState *env = &RISCV_CPU(obj)->env;
+    /* We set this in the realise function */
+    set_misa(env, MXL_RV128, 0);
+}
 #else
 static void rv32_base_cpu_init(Object *obj)
 {
@@ -402,6 +415,9 @@ static void riscv_cpu_disas_set_info(CPUState *s, disassemble_info *info)
     case MXL_RV64:
         info->print_insn = print_insn_riscv64;
         break;
+    case MXL_RV128:
+        info->print_insn = print_insn_riscv128;
+        break;
     default:
         g_assert_not_reached();
     }
@@ -464,6 +480,8 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
 #ifdef TARGET_RISCV64
     case MXL_RV64:
         break;
+    case MXL_RV128:
+        break;
 #endif
     case MXL_RV32:
         break;
@@ -670,6 +688,7 @@ static gchar *riscv_gdb_arch_name(CPUState *cs)
     case MXL_RV32:
         return g_strdup("riscv:rv32");
     case MXL_RV64:
+    case MXL_RV128:
         return g_strdup("riscv:rv64");
     default:
         g_assert_not_reached();
@@ -822,6 +841,7 @@ static const TypeInfo riscv_cpu_type_infos[] = {
     DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_E51,       rv64_sifive_e_cpu_init),
     DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_U54,       rv64_sifive_u_cpu_init),
     DEFINE_CPU(TYPE_RISCV_CPU_SHAKTI_C,         rv64_sifive_u_cpu_init),
+    DEFINE_CPU(TYPE_RISCV_CPU_BASE128,          rv128_base_cpu_init),
 #endif
 };
 
diff --git a/target/riscv/gdbstub.c b/target/riscv/gdbstub.c
index 23429179e2..2fbdcc5879 100644
--- a/target/riscv/gdbstub.c
+++ b/target/riscv/gdbstub.c
@@ -164,6 +164,11 @@ static int riscv_gen_dynamic_csr_xml(CPUState *cs, int base_reg)
     int bitsize = 16 << env->misa_mxl_max;
     int i;
 
+    /* Until gdb knows about 128-bit registers */
+    if (bitsize > 64) {
+        bitsize = 64;
+    }
+
     g_string_printf(s, "<?xml version=\"1.0\"?>");
     g_string_append_printf(s, "<!DOCTYPE feature SYSTEM \"gdb-target.dtd\">");
     g_string_append_printf(s, "<feature name=\"org.gnu.gdb.riscv.csr\">");
-- 
2.34.1


