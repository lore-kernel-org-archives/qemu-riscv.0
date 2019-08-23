Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1i1JBu-0000mx-OA
	for mharc-qemu-riscv@gnu.org; Fri, 23 Aug 2019 19:41:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49469)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <prvs=1314b2cac=alistair.francis@wdc.com>)
 id 1i1JBr-0000iq-O0
 for qemu-riscv@nongnu.org; Fri, 23 Aug 2019 19:41:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <prvs=1314b2cac=alistair.francis@wdc.com>)
 id 1i1JBq-00006t-Hy
 for qemu-riscv@nongnu.org; Fri, 23 Aug 2019 19:41:55 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:50262)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <prvs=1314b2cac=alistair.francis@wdc.com>)
 id 1i1JBn-0008WT-Nw; Fri, 23 Aug 2019 19:41:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1566603743; x=1598139743;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hGnS7Aac7mIfYIQO11OO+v94Mp+zZko9Z6e39Hi5wek=;
 b=mwikRrTMqAWcj5jmaWADhVHrS0YngTJH2aXBHPIC2CVFnwwdXwRyNsuo
 bBx8DZxH0ytc+ljiecRIDpKoukMbkbE+pL+fccjpSu6TuEAZSYoPg5AJW
 IhtmZIwkhbueFnLgf+M7bLOtM6pYdimKV3Evf3YpqB7qvr04MT/N2cpPj
 Q1NXSw01uw+EFUI4ge3nt/YZbeYVFxCb9AEN7f5MGf4qwZC+JBmWKIeRl
 eJwOJW89eXFAweWLXjW4SXeJ4/OeDNJadBT97HLQcsMwLvRe5OW42cSgC
 PuX45nYu7wteR8GU0pzyWr94Z3Xgh3hryZGXHTETKKJYawLDvMkrsWwNU A==;
IronPort-SDR: YaMDbXY1MHtkeVsWuw4aNn2fvfVA1R/oyClGzrviWmVWvVC4tIPXhJ9Kiajn+e2fEleK5M3byR
 N0D+zk4lT6DiDc7miYEQyR+OCQFhRWD1Qk8oc95FJ7zijsFarLgZWZ+RjklL52kAyBXvxcaS0i
 Iit44O3t+XeLsQiUdZFs2gszz/KIZvavAdIRbMIk/Fyy465/mwoFjpSDkzL36XgZKtdKtdljgU
 fsQWR+JfakJkNVexSlHpGhrJG5B3eZBxe09VmG2xdYCsD6yD6Hyl8j7wvVTU8agMLI8+XJi0Kh
 Joo=
X-IronPort-AV: E=Sophos;i="5.64,422,1559491200"; d="scan'208";a="217013891"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 24 Aug 2019 07:42:22 +0800
IronPort-SDR: CNQAjvX/EBVSp7oeHeYQFxUhQsb7llhWnp6UZl98zXT1uHRe/hpwPYJ7bX/ilMU7b9XfhxWc+O
 dDPxJE63uiMKphxbpTTYQFkhFmGRIxf6gmLum+avNO/2+f9ml1OtfaY2YAbbKtFoL2LbPedffG
 1G+l5kVF3NxV7wKuFNVnIBdryjFg9yjUxhpi/2J98ScX3km+qI87nWvkNcTsCMfrNqw7lOJnHi
 dN7LrfjAUXmFSS3ne/d+Bcjx7us3WfwNKgHh3DsY0zqDgafpv94Jz6LhVOJCMc7M/prYyEZOwb
 1H1sqbzQY6zRdcmrc3YipsUc
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2019 16:39:08 -0700
IronPort-SDR: uLWoPAf1/41IXYpYl69tfesewC8EjZiuBN1/Qvc4FSsimgYggLB4+7xcCVHjONm6ytkGyZK/gx
 0mlpD6msFHfI+Ct3+Arun+qEIz+HYPGOD0vUajR5GPz9iCK9GKQzCaAGGcAD1vfRFBMQZduAsF
 NMXJElYFVBZu2Roq3Fn0snjDbDiShCHnk3R3diFv1be27YszfDUCAZGflAmMqTrn/VFmNUWc+9
 NfwXcRNpKuqqPyZmzPtJRc+LWZyHBxsELb78MvnIxafAt2QJuaIx2g1ur28f9rKpzi7//qt1Ye
 Wnk=
WDCIronportException: Internal
Received: from risc6-mainframe.sdcorp.global.sandisk.com (HELO
 risc6-mainframe.int.fusionio.com) ([10.196.157.58])
 by uls-op-cesaip01.wdc.com with ESMTP; 23 Aug 2019 16:41:51 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: palmer@sifive.com, alistair.francis@wdc.com, alistair23@gmail.com,
 Atish.Patra@wdc.com, Anup.Patel@wdc.com
Date: Fri, 23 Aug 2019 16:38:10 -0700
Message-Id: <bc32540efd592bc56ef8c4a59ecc142d8dc594a0.1566603412.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <cover.1566603412.git.alistair.francis@wdc.com>
References: <cover.1566603412.git.alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: FreeBSD 9.x
X-Received-From: 68.232.143.124
Subject: [Qemu-riscv] [PATCH v1 08/28] target/riscv: Add Hypervisor CSR
 access functions
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
X-List-Received-Date: Fri, 23 Aug 2019 23:41:57 -0000

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/csr.c | 68 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 68 insertions(+)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 471f23a1d0..388775d45a 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -98,6 +98,20 @@ static int smode(CPURISCVState *env, int csrno)
     return -!riscv_has_ext(env, RVS);
 }
 
+static int hmode(CPURISCVState *env, int csrno)
+{
+    if (riscv_has_ext(env, RVS) &&
+        riscv_has_ext(env, RVH)) {
+        /* Hypervisor extension is supported */
+        if ((env->priv == PRV_S && !riscv_cpu_virt_enabled(env)) ||
+            env->priv == PRV_M) {
+            return 0;
+        }
+    }
+
+    return -1;
+}
+
 static int pmp(CPURISCVState *env, int csrno)
 {
     return -!riscv_feature(env, RISCV_FEATURE_PMP);
@@ -754,6 +768,55 @@ static int write_satp(CPURISCVState *env, int csrno, target_ulong val)
     return 0;
 }
 
+/* Hypervisor Extensions */
+static int read_hstatus(CPURISCVState *env, int csrno, target_ulong *val)
+{
+    *val = env->hstatus;
+    return 0;
+}
+
+static int write_hstatus(CPURISCVState *env, int csrno, target_ulong val)
+{
+    env->hstatus = val;
+    return 0;
+}
+
+static int read_hedeleg(CPURISCVState *env, int csrno, target_ulong *val)
+{
+    *val = env->hedeleg;
+    return 0;
+}
+
+static int write_hedeleg(CPURISCVState *env, int csrno, target_ulong val)
+{
+    env->hedeleg = val;
+    return 0;
+}
+
+static int read_hideleg(CPURISCVState *env, int csrno, target_ulong *val)
+{
+    *val = env->hideleg;
+    return 0;
+}
+
+static int write_hideleg(CPURISCVState *env, int csrno, target_ulong val)
+{
+    env->hideleg = val;
+    return 0;
+}
+
+static int read_hgatp(CPURISCVState *env, int csrno, target_ulong *val)
+{
+    *val = env->hgatp;
+    return 0;
+}
+
+static int write_hgatp(CPURISCVState *env, int csrno, target_ulong val)
+{
+    env->hgatp = val;
+    return 0;
+}
+
 /* Physical Memory Protection */
 static int read_pmpcfg(CPURISCVState *env, int csrno, target_ulong *val)
 {
@@ -950,6 +1013,11 @@ static riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     /* Supervisor Protection and Translation */
     [CSR_SATP] =                { smode, read_satp,        write_satp        },
 
+    [CSR_HSTATUS] =             { hmode,   read_hstatus,     write_hstatus    },
+    [CSR_HEDELEG] =             { hmode,   read_hedeleg,     write_hedeleg    },
+    [CSR_HIDELEG] =             { hmode,   read_hideleg,     write_hideleg    },
+    [CSR_HGATP] =               { hmode,   read_hgatp,       write_hgatp      },
+
     /* Physical Memory Protection */
     [CSR_PMPCFG0  ... CSR_PMPADDR9] =  { pmp,   read_pmpcfg,  write_pmpcfg   },
     [CSR_PMPADDR0 ... CSR_PMPADDR15] = { pmp,   read_pmpaddr, write_pmpaddr  },
-- 
2.22.0


