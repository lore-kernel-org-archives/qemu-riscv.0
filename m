Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gtwj6-0002Hs-ME
	for mharc-qemu-riscv@gnu.org; Wed, 13 Feb 2019 10:45:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56417)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gtwj2-0002At-VK
	for qemu-riscv@nongnu.org; Wed, 13 Feb 2019 10:45:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gtwj0-0006x0-GZ
	for qemu-riscv@nongnu.org; Wed, 13 Feb 2019 10:45:28 -0500
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644]:41878)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1gtwiy-0006hs-JS
	for qemu-riscv@nongnu.org; Wed, 13 Feb 2019 10:45:24 -0500
Received: by mail-pl1-x644.google.com with SMTP id k15so1332700pls.8
	for <qemu-riscv@nongnu.org>; Wed, 13 Feb 2019 07:45:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=subject:date:message-id:in-reply-to:references:cc:from:to;
	bh=ihjYI8w/pHOrt/O0GHzxFvfptHP8KkD3SPdesRMFnZg=;
	b=KBzQnP/VmMzdcISHAkkStCoW2xMYpkPpyhNSff4p3GX6KmtncYMe3kTg+/+xQOZL4b
	MAGsrc+Cs72XXIEcY5yuj8f6uUmZNH3nOT9slFyRsZd8WHnH4ewTUtSBj4GdehZO1/5u
	anLQREHWB6LjOQmuyS/+yyAxaPpIG+LQliCNyDOr80uiBt6KIOQZABN87DAw1wfmy/Sd
	iqpi2gFkEdaQ+ylhxE9mBKSGPv5k6TI7DMUWptzo4RSwElslBp/czzLVgUMsQEMY6uUl
	MlP0IRw5WrrhCvTL7nWtcanFkyr3l3Jym+0AgJ6yEnkRX5M1EEsSXcQtKQEf8cuf5/hv
	6STg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:date:message-id:in-reply-to:references
	:cc:from:to;
	bh=ihjYI8w/pHOrt/O0GHzxFvfptHP8KkD3SPdesRMFnZg=;
	b=B87sPPElUniok+T/Z1IZZGS4/gOlllXBF+unfbR1sAxo72tQQ0hoxS/DQhPZ7O7VSg
	COdIYSpt2Zie4EdzOv1quFNdBWewYslIorWeYkOeHcKyvYdUwxsZE+yAR7Kisfofvz9h
	GOWEdTRX48/3X9FFaOxS9To5iiB2LROq/x99RGjULcAk59WmyCAkLPF5ZzSoyBhZMeeO
	7cv1QIe0OUmAlcMGy/4Z49dKYub7vaYRF7WZVCsB4M6cL92oyfyqnfwBMdCLiOdIjhNQ
	lO0fsXi8OuCzOftbIvQrX4YwRHhd/QtHKeuoI97W9DK1g1xczsmZjySZiS/ZpZbz7eN0
	7LMw==
X-Gm-Message-State: AHQUAuZOv2t28VD3DD/r93MvNmmq65MTVOnJROwP4C9oxrdk+0hfTElU
	GoLNqbJDlU2dnIWJhYr+FWUiQvQxjEo=
X-Google-Smtp-Source: AHgI3IZiTgnVbGyC/MeKMSQzxVcXeKsb6k5l32i/8SGbEX0vQfinJfNZOkwWDzCKtnlpzNNxqm61xw==
X-Received: by 2002:a17:902:9a07:: with SMTP id
	v7mr1079458plp.247.1550072715883; 
	Wed, 13 Feb 2019 07:45:15 -0800 (PST)
Received: from localhost ([12.206.222.5]) by smtp.gmail.com with ESMTPSA id
	f18sm4182108pgf.26.2019.02.13.07.45.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 13 Feb 2019 07:45:15 -0800 (PST)
Date: Wed, 13 Feb 2019 07:44:47 -0800
Message-Id: <20190213154450.14749-9-palmer@sifive.com>
X-Mailer: git-send-email 2.18.1
In-Reply-To: <20190213154450.14749-1-palmer@sifive.com>
References: <20190213154450.14749-1-palmer@sifive.com>
Cc: qemu-riscv@nongnu.org,       qemu-devel@nongnu.org,
	Michael Clark <mjc@sifive.com>,
	Alistair Francis <alistair.francis@wdc.com>, 
	Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::644
Subject: [Qemu-riscv] [PULL 08/11] RISC-V: Add misa runtime write support
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-riscv/>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 13 Feb 2019 15:45:30 -0000

From: Michael Clark <mjc@sifive.com>

This patch adds support for writing misa. misa is validated based
on rules in the ISA specification. 'E' is mutually exclusive with
all other extensions. 'D' depends on 'F' so 'D' bit is dropped
if 'F' is not present. A conservative approach to consistency is
taken by flushing the translation cache on misa writes. misa_mask
is added to the CPU struct to store the original set of extensions.

Signed-off-by: Michael Clark <mjc@sifive.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Palmer Dabbelt <palmer@sifive.com>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 target/riscv/cpu.c      |  2 +-
 target/riscv/cpu.h      |  4 ++-
 target/riscv/cpu_bits.h | 11 +++++++++
 target/riscv/csr.c      | 54 ++++++++++++++++++++++++++++++++++++++++-
 4 files changed, 68 insertions(+), 3 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 28d7e5302fb1..cc3ddc0ae4b5 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -88,7 +88,7 @@ typedef struct RISCVCPUInfo {
 
 static void set_misa(CPURISCVState *env, target_ulong misa)
 {
-    env->misa = misa;
+    env->misa_mask = env->misa = misa;
 }
 
 static void set_versions(CPURISCVState *env, int user_ver, int priv_ver)
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index a97435bd7b1d..5c2aebf13251 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -86,7 +86,8 @@
    so a cpu features bitfield is required, likewise for optional PMP support */
 enum {
     RISCV_FEATURE_MMU,
-    RISCV_FEATURE_PMP
+    RISCV_FEATURE_PMP,
+    RISCV_FEATURE_MISA
 };
 
 #define USER_VERSION_2_02_0 0x00020200
@@ -118,6 +119,7 @@ struct CPURISCVState {
     target_ulong user_ver;
     target_ulong priv_ver;
     target_ulong misa;
+    target_ulong misa_mask;
 
     uint32_t features;
 
diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index 5439f4719ee5..7afcb2468d80 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -311,10 +311,21 @@
 #define MSTATUS32_SD        0x80000000
 #define MSTATUS64_SD        0x8000000000000000ULL
 
+#define MISA32_MXL          0xC0000000
+#define MISA64_MXL          0xC000000000000000ULL
+
+#define MXL_RV32            1
+#define MXL_RV64            2
+#define MXL_RV128           3
+
 #if defined(TARGET_RISCV32)
 #define MSTATUS_SD MSTATUS32_SD
+#define MISA_MXL MISA32_MXL
+#define MXL_VAL MXL_RV32
 #elif defined(TARGET_RISCV64)
 #define MSTATUS_SD MSTATUS64_SD
+#define MISA_MXL MISA64_MXL
+#define MXL_VAL MXL_RV64
 #endif
 
 /* sstatus CSR bits */
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index e2bd374f09ed..e72fcf1265d4 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -332,6 +332,58 @@ static int read_misa(CPURISCVState *env, int csrno, target_ulong *val)
     return 0;
 }
 
+static int write_misa(CPURISCVState *env, int csrno, target_ulong val)
+{
+    if (!riscv_feature(env, RISCV_FEATURE_MISA)) {
+        /* drop write to misa */
+        return 0;
+    }
+
+    /* 'I' or 'E' must be present */
+    if (!(val & (RVI | RVE))) {
+        /* It is not, drop write to misa */
+        return 0;
+    }
+
+    /* 'E' excludes all other extensions */
+    if (val & RVE) {
+        /* when we support 'E' we can do "val = RVE;" however
+         * for now we just drop writes if 'E' is present.
+         */
+        return 0;
+    }
+
+    /* Mask extensions that are not supported by this hart */
+    val &= env->misa_mask;
+
+    /* Mask extensions that are not supported by QEMU */
+    val &= (RVI | RVE | RVM | RVA | RVF | RVD | RVC | RVS | RVU);
+
+    /* 'D' depends on 'F', so clear 'D' if 'F' is not present */
+    if ((val & RVD) && !(val & RVF)) {
+        val &= ~RVD;
+    }
+
+    /* Suppress 'C' if next instruction is not aligned
+     * TODO: this should check next_pc
+     */
+    if ((val & RVC) && (GETPC() & ~3) != 0) {
+        val &= ~RVC;
+    }
+
+    /* misa.MXL writes are not supported by QEMU */
+    val = (env->misa & MISA_MXL) | (val & ~MISA_MXL);
+
+    /* flush translation cache */
+    if (val != env->misa) {
+        tb_flush(CPU(riscv_env_get_cpu(env)));
+    }
+
+    env->misa = val;
+
+    return 0;
+}
+
 static int read_medeleg(CPURISCVState *env, int csrno, target_ulong *val)
 {
     *val = env->medeleg;
@@ -810,7 +862,7 @@ static riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
 
     /* Machine Trap Setup */
     [CSR_MSTATUS] =             { any,  read_mstatus,     write_mstatus     },
-    [CSR_MISA] =                { any,  read_misa                           },
+    [CSR_MISA] =                { any,  read_misa,        write_misa        },
     [CSR_MIDELEG] =             { any,  read_mideleg,     write_mideleg     },
     [CSR_MEDELEG] =             { any,  read_medeleg,     write_medeleg     },
     [CSR_MIE] =                 { any,  read_mie,         write_mie         },
-- 
2.18.1


