Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iO91E-0005GL-Hz
	for mharc-qemu-riscv@gnu.org; Fri, 25 Oct 2019 19:29:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49773)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <prvs=194c68654=alistair.francis@wdc.com>)
 id 1iO90z-00056C-UY
 for qemu-riscv@nongnu.org; Fri, 25 Oct 2019 19:29:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <prvs=194c68654=alistair.francis@wdc.com>)
 id 1iO90x-0004Lv-RG
 for qemu-riscv@nongnu.org; Fri, 25 Oct 2019 19:29:05 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:10430)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <prvs=194c68654=alistair.francis@wdc.com>)
 id 1iO90q-0004CY-C9; Fri, 25 Oct 2019 19:28:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1572046136; x=1603582136;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=88AOf5/ricp3Olf5cMT5yk+9tNyrWu3Wq5dzzImifuI=;
 b=quaRH4MrVUItjH+J0Vmj8Q+sEMtXN+Z5VfVNggTSHH4o6spwd3JcIwSG
 5ENWlepOna4lUKLGsjwXtAqcnwa2xJOkQsJ2KzvvZkZm7Bqwrx2vzbZBC
 EpfZH/1L9Nw6QszgRBWGfK8qxZeIBgEXOOn1jb2isdmnF8gtkgUOZoLxt
 nUBpunEjVjR1K0JTDRuFyuekKnPb7hNbH0OohHUc+t5gx8A3eYCkXt2Bm
 ZNbu6TaEyCc5eY23pDGZQ6nQaTzZOw4TYCA6e14Y3oiBoSxxWyHWGkUj0
 6qyNGti4DYV1CSmKr9d26mad87hZvLEBgkZIQFemw+qodFmNvwNYKFrst g==;
IronPort-SDR: avVTqrbhW6Qy8YkUBg9qTp+G4BT0WMtPhLMnSEYEZ4zpMh/KevzfwkwT0fzGgLSiHLZwa3vfKm
 Sq7REheKw6aKWc7fDn7KoYesUqWcfX4NBsVNAGAQjuNiveIN/dkbd75alndZo3FPIjHW1cDOCf
 /j8T7VBy7aWisWuTqMNuHUDOBkdnL+XOFDYn076i6geOpMXQXmDTT+DgW2aQ5yuNermxN3FNTt
 zYkssyGgXq4XRjv9IAZKvXKe/NzNaPLAh1NKfP7hjIgf/Ikd681S3wiK4icUPW0qVB9juVvbQz
 xvI=
X-IronPort-AV: E=Sophos;i="5.68,230,1569254400"; d="scan'208";a="228520404"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 26 Oct 2019 07:28:38 +0800
IronPort-SDR: H9xo/IoxqE/yKFFwYlm9bmrc34A/mlG3Gyqm3CfAMaPZgJAwicwRdZiCqL/kQ2ksaa6RD0ADPk
 jy09Yx3yK6CHdTb/sn+ZedR26Kstf2Hibs5scmWKUjawZPrCmm/ZwQEuGRK3AR65GkemmYAuLl
 T94zaCdXomtSoVYWBxnOl2RNNHWFQV2Iys6dOOtRq9lMU8s7ctDEJotmx+N3Sjbf6S9dkWKX6P
 q7N3zHFYLIcBp87d4P91Iq6r79IUSBpc10WpQpBmGVH30Lx1Z9fqpezzb2MVYWsBPQ4qsYNBFP
 I0BfO5WTD0qMVfX1e0AKXLGs
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2019 16:24:04 -0700
IronPort-SDR: psxqcSipS3CbgbkRJHHv+Vbaes24J5/t+0pkJ6lnNAwLp9sQlcMEd508RN53nzVbvr4f07pDXw
 0T6oMyrEwFRxd9eFduJUiig+sRVcJW2stDyFFXbH5nWlSfm00dX9/bcDIswvbzWnOpKha0x58B
 5f2e8aHQ91Vst8MMYzIk0HUyM0H/FPAk1pM0v6JCWxYBhHrFtwQHVRaNme4aLs0kpWcZCKJwp+
 W2jKC3kVO+yPqpnY9hmEoGLIhNuSFZSlk7Pejs1oA/dQ+9f8PKKdU+xUYGttDXTNcrcOxOMrcz
 nZ4=
WDCIronportException: Internal
Received: from risc6-mainframe.sdcorp.global.sandisk.com (HELO
 risc6-mainframe.int.fusionio.com) ([10.196.157.58])
 by uls-op-cesaip01.wdc.com with ESMTP; 25 Oct 2019 16:28:38 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: palmer@sifive.com,
	alistair.francis@wdc.com,
	alistair23@gmail.com
Subject: [PATCH v2 10/27] target/riscv: Add Hypervisor virtual CSRs accesses
Date: Fri, 25 Oct 2019 16:23:42 -0700
Message-Id: <99971b33159ada296222261e922b11a119a7bceb.1572045716.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <cover.1572045716.git.alistair.francis@wdc.com>
References: <cover.1572045716.git.alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: FreeBSD 9.x [fuzzy]
X-Received-From: 68.232.141.245
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
X-List-Received-Date: Fri, 25 Oct 2019 23:29:10 -0000

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Palmer Dabbelt <palmer@sifive.com>
---
 target/riscv/cpu_bits.h |  11 ++++
 target/riscv/csr.c      | 119 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 130 insertions(+)

diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index 162d42f211..95909f159a 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -191,6 +191,17 @@
 #define HGATP_PPN            SATP64_PPN
 #endif
 
+/* Virtual CSRs */
+#define CSR_VSSTATUS        0x200
+#define CSR_VSIE            0x204
+#define CSR_VSTVEC          0x205
+#define CSR_VSSCRATCH       0x240
+#define CSR_VSEPC           0x241
+#define CSR_VSCAUSE         0x242
+#define CSR_VSTVAL          0x243
+#define CSR_VSIP            0x244
+#define CSR_VSATP           0x280
+
 /* Physical Memory Protection */
 #define CSR_PMPCFG0         0x3a0
 #define CSR_PMPCFG1         0x3a1
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index edfafca06f..a1eb15f507 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -817,6 +817,115 @@ static int write_hgatp(CPURISCVState *env, int csrno, target_ulong val)
     return 0;
 }
 
+/* Virtual CSR Registers */
+static int read_vsstatus(CPURISCVState *env, int csrno, target_ulong *val)
+{
+    *val = env->vsstatus;
+    return 0;
+}
+
+static int write_vsstatus(CPURISCVState *env, int csrno, target_ulong val)
+{
+    env->vsstatus = val;
+    return 0;
+}
+
+static int read_vsie(CPURISCVState *env, int csrno, target_ulong *val)
+{
+    *val = env->vsie;
+    return 0;
+}
+
+static int write_vsie(CPURISCVState *env, int csrno, target_ulong val)
+{
+    env->vsie = val;
+    return 0;
+}
+
+static int read_vstvec(CPURISCVState *env, int csrno, target_ulong *val)
+{
+    *val = env->vstvec;
+    return 0;
+}
+
+static int write_vstvec(CPURISCVState *env, int csrno, target_ulong val)
+{
+    env->vstvec = val;
+    return 0;
+}
+
+static int read_vsscratch(CPURISCVState *env, int csrno, target_ulong *val)
+{
+    *val = env->vsscratch;
+    return 0;
+}
+
+static int write_vsscratch(CPURISCVState *env, int csrno, target_ulong val)
+{
+    env->vsscratch = val;
+    return 0;
+}
+
+static int read_vsepc(CPURISCVState *env, int csrno, target_ulong *val)
+{
+    *val = env->vsepc;
+    return 0;
+}
+
+static int write_vsepc(CPURISCVState *env, int csrno, target_ulong val)
+{
+    env->vsepc = val;
+    return 0;
+}
+
+static int read_vscause(CPURISCVState *env, int csrno, target_ulong *val)
+{
+    *val = env->vscause;
+    return 0;
+}
+
+static int write_vscause(CPURISCVState *env, int csrno, target_ulong val)
+{
+    env->vscause = val;
+    return 0;
+}
+
+static int read_vstval(CPURISCVState *env, int csrno, target_ulong *val)
+{
+    *val = env->vstval;
+    return 0;
+}
+
+static int write_vstval(CPURISCVState *env, int csrno, target_ulong val)
+{
+    env->vstval = val;
+    return 0;
+}
+
+static int read_vsip(CPURISCVState *env, int csrno, target_ulong *val)
+{
+    *val = (target_ulong)atomic_read(&env->vsip);
+    return 0;
+}
+
+static int write_vsip(CPURISCVState *env, int csrno, target_ulong val)
+{
+    atomic_set(&env->vsip, val);
+    return 0;
+}
+
+static int read_vsatp(CPURISCVState *env, int csrno, target_ulong *val)
+{
+    *val = env->vsatp;
+    return 0;
+}
+
+static int write_vsatp(CPURISCVState *env, int csrno, target_ulong val)
+{
+    env->vsatp = val;
+    return 0;
+}
+
 /* Physical Memory Protection */
 static int read_pmpcfg(CPURISCVState *env, int csrno, target_ulong *val)
 {
@@ -1025,6 +1134,16 @@ static riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     [CSR_HIDELEG] =             { hmode,   read_hideleg,     write_hideleg    },
     [CSR_HGATP] =               { hmode,   read_hgatp,       write_hgatp      },
 
+    [CSR_VSSTATUS] =            { hmode,   read_vsstatus,    write_vsstatus   },
+    [CSR_VSIE] =                { hmode,   read_vsie,        write_vsie       },
+    [CSR_VSTVEC] =              { hmode,   read_vstvec,      write_vstvec     },
+    [CSR_VSSCRATCH] =           { hmode,   read_vsscratch,   write_vsscratch  },
+    [CSR_VSEPC] =               { hmode,   read_vsepc,       write_vsepc      },
+    [CSR_VSCAUSE] =             { hmode,   read_vscause,     write_vscause    },
+    [CSR_VSTVAL] =              { hmode,   read_vstval,      write_vstval     },
+    [CSR_VSIP] =                { hmode,   read_vsip,        write_vsip       },
+    [CSR_VSATP] =               { hmode,   read_vsatp,       write_vsatp      },
+
     /* Physical Memory Protection */
     [CSR_PMPCFG0  ... CSR_PMPADDR9] =  { pmp,   read_pmpcfg,  write_pmpcfg   },
     [CSR_PMPADDR0 ... CSR_PMPADDR15] = { pmp,   read_pmpaddr, write_pmpaddr  },
-- 
2.23.0


