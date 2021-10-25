Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mf65L-0002zs-IN
	for mharc-qemu-riscv@gnu.org; Mon, 25 Oct 2021 15:56:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=925953cd0=atish.patra@wdc.com>)
 id 1mf65J-0002og-7x; Mon, 25 Oct 2021 15:56:41 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:65114)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=925953cd0=atish.patra@wdc.com>)
 id 1mf65C-0005S8-Ty; Mon, 25 Oct 2021 15:56:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1635191794; x=1666727794;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3t6KDr02/cAtke7CkQPlLresBIgrvLTmwS+t3XX9l2I=;
 b=llj9CM2yuInQjBxzrjMsEXKE+mU2vhdOhDaW9mA+/C5R3Pwhd9O0H+/1
 uDn745+HFofr3BFyS5Rd+mai2kdt+WpoBDzUyIYrZhLLkbCc6Du2xADOz
 FO3ZnyQJpWb3UL0O8dkVZieLx0nDmBEzL4vAxbN9UgPTeTUvMNtRtk2Qh
 4ehlCS8JDMRAE9+4hZg7aaHb6B+NlDK7T4pqs3UZfkS8Qx7yJhXNePvhK
 XBGrTVJX0XgKWb2trpabbGGz/EOl/Pl2NwnjkKHXkpNHm4Yp5RL6juz5r
 yOnwDNwql0sdYuy6/T/VdMNmC8gNASt7Qx8wfIr/5azP433kHtlIQfufL g==;
X-IronPort-AV: E=Sophos;i="5.87,181,1631548800"; d="scan'208";a="287683005"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 26 Oct 2021 03:56:24 +0800
IronPort-SDR: PfZzyXAcw1sbeYsReSUk4kHQGrncUnvxq/O+CR9eapiFvAI06tJHYUHhdIIzFJLmT7SAzRDDXX
 zue50git9uyncS/SCeVdNyz77I9TjMdc95Lh5bNJ7LJRn3JKPF0fk4Snn77EJ81zCo3JmxXfJ5
 FI24EFk4a3sOJSTz5bw/lP673hoQZQEBf3idR/gQvzx782WnEEFpt3fALV7qZEgLeTEkWpki9O
 d4ZbKWfIX7PwD+N4/Np7/VcBGw8kE1/zIEwBlv/JebrpKu+7ahjrmzt2cXNX4fa/Nds7uAdCE7
 d5serxuHM45UrW8I++OcZ62V
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2021 12:31:55 -0700
IronPort-SDR: OcP1rtQx0CyZAqCxN89ws7Q7kWFIwj8LebvXvphH6IlLIiyy/Y7OmEe+EoXmZCNJR9mO7ekyXX
 Xd2xLtDYdAmIG7LEmLf1MRJhgo+ARPra/mdP2S0qgJ2oTuFa3orwlzfJK9H4+k5nfLlm+Ty5LA
 H+D9R2TBRBiTGgKSMvX5GXufi8SnX1hj0mZ47fFkGwKff+P6ivYzYcz72gakATaswzO/5voag/
 aLLRyxwrAhpU0KBurg0Vi6wv1twhqjcXj4SkP3QfpXFSolGEJa2IROUmnaVNSWxY9Maz5Nvqh0
 i+8=
WDCIronportException: Internal
Received: from unknown (HELO hulk.wdc.com) ([10.225.167.27])
 by uls-op-cesaip01.wdc.com with ESMTP; 25 Oct 2021 12:56:25 -0700
From: Atish Patra <atish.patra@wdc.com>
To: qemu-devel@nongnu.org
Cc: Atish Patra <atish.patra@wdc.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org
Subject: [ PATCH v3 06/10] target/riscv: Add support for hpmcounters/hpmevents
Date: Mon, 25 Oct 2021 12:55:57 -0700
Message-Id: <20211025195601.245631-7-atish.patra@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211025195601.245631-1-atish.patra@wdc.com>
References: <20211025195601.245631-1-atish.patra@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=925953cd0=atish.patra@wdc.com; helo=esa2.hgst.iphmx.com
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
X-List-Received-Date: Mon, 25 Oct 2021 19:56:41 -0000

With SBI PMU extension, user can use any of the available hpmcounters to
track any perf events based on the value written to mhpmevent csr.
Add read/write functionality for these csrs.

Signed-off-by: Atish Patra <atish.patra@wdc.com>
---
 target/riscv/cpu.h     |  12 ++
 target/riscv/csr.c     | 468 ++++++++++++++++++++++++++++-------------
 target/riscv/machine.c |   3 +
 3 files changed, 331 insertions(+), 152 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index b421eefa623f..e7dc90d001ac 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -103,6 +103,9 @@ typedef struct CPURISCVState CPURISCVState;
 
 #define RV_VLEN_MAX 256
 
+#define RV_MAX_MHPMEVENTS 29
+#define RV_MAX_MHPMCOUNTERS 32
+
 FIELD(VTYPE, VLMUL, 0, 2)
 FIELD(VTYPE, VSEW, 2, 3)
 FIELD(VTYPE, VEDIV, 5, 2)
@@ -219,6 +222,15 @@ struct CPURISCVState {
 
     target_ulong mcountinhibit;
 
+    /* PMU counter configured values */
+    target_ulong mhpmcounter_val[RV_MAX_MHPMCOUNTERS];
+
+    /* for RV32 */
+    target_ulong mhpmcounterh_val[RV_MAX_MHPMCOUNTERS];
+
+    /* PMU event selector configured values */
+    target_ulong mhpmevent_val[RV_MAX_MHPMEVENTS];
+
     target_ulong sscratch;
     target_ulong mscratch;
 
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index faf02e12ec34..6757543090be 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -79,6 +79,15 @@ static RISCVException mctr(CPURISCVState *env, int csrno)
 #endif
 }
 
+static RISCVException mctr32(CPURISCVState *env, int csrno)
+{
+    if (!riscv_cpu_is_32bit(env)) {
+        return RISCV_EXCP_ILLEGAL_INST;
+    }
+
+    return mctr(env, csrno);
+}
+
 static RISCVException ctr(CPURISCVState *env, int csrno)
 {
 #if !defined(CONFIG_USER_ONLY)
@@ -426,6 +435,7 @@ static RISCVException read_instret(CPURISCVState *env, int csrno,
 #else
     *val = cpu_get_host_ticks();
 #endif
+
     return RISCV_EXCP_NONE;
 }
 
@@ -441,9 +451,76 @@ static RISCVException read_instreth(CPURISCVState *env, int csrno,
 #else
     *val = cpu_get_host_ticks() >> 32;
 #endif
+
+    return RISCV_EXCP_NONE;
+}
+
+static int read_mhpmevent(CPURISCVState *env, int csrno, target_ulong *val)
+{
+    int evt_index = csrno - CSR_MHPMEVENT3;
+
+    *val = env->mhpmevent_val[evt_index];
+
+    return RISCV_EXCP_NONE;
+}
+
+static int write_mhpmevent(CPURISCVState *env, int csrno, target_ulong val)
+{
+    int evt_index = csrno - CSR_MHPMEVENT3;
+
+    env->mhpmevent_val[evt_index] = val;
+
+    return RISCV_EXCP_NONE;
+}
+
+static int write_mhpmcounter(CPURISCVState *env, int csrno, target_ulong val)
+{
+    int ctr_index = csrno - CSR_MHPMCOUNTER3 + 3;
+
+    env->mhpmcounter_val[ctr_index] = val;
+
     return RISCV_EXCP_NONE;
 }
 
+static int write_mhpmcounterh(CPURISCVState *env, int csrno, target_ulong val)
+{
+    int ctr_index = csrno - CSR_MHPMCOUNTER3H + 3;
+
+    env->mhpmcounterh_val[ctr_index] = val;
+
+    return RISCV_EXCP_NONE;
+}
+
+static int read_hpmcounter(CPURISCVState *env, int csrno, target_ulong *val)
+{
+    int ctr_index;
+
+    if (env->priv == PRV_M) {
+        ctr_index = csrno - CSR_MHPMCOUNTER3 + 3;
+    } else {
+        ctr_index = csrno - CSR_HPMCOUNTER3 + 3;
+    }
+    *val = env->mhpmcounter_val[ctr_index];
+
+    return RISCV_EXCP_NONE;
+}
+
+static int read_hpmcounterh(CPURISCVState *env, int csrno, target_ulong *val)
+{
+    int ctr_index;
+
+    if (env->priv == PRV_M) {
+        ctr_index = csrno - CSR_MHPMCOUNTER3H + 3;
+    } else {
+        ctr_index = csrno - CSR_HPMCOUNTER3H + 3;
+    }
+
+    *val = env->mhpmcounterh_val[ctr_index];
+
+    return RISCV_EXCP_NONE;
+}
+
+
 #if defined(CONFIG_USER_ONLY)
 static RISCVException read_time(CPURISCVState *env, int csrno,
                                 target_ulong *val)
@@ -1742,157 +1819,244 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     [CSR_PMPADDR15] =  { "pmpaddr15", pmp, read_pmpaddr, write_pmpaddr },
 
     /* Performance Counters */
-    [CSR_HPMCOUNTER3]    = { "hpmcounter3",    ctr,    read_zero },
-    [CSR_HPMCOUNTER4]    = { "hpmcounter4",    ctr,    read_zero },
-    [CSR_HPMCOUNTER5]    = { "hpmcounter5",    ctr,    read_zero },
-    [CSR_HPMCOUNTER6]    = { "hpmcounter6",    ctr,    read_zero },
-    [CSR_HPMCOUNTER7]    = { "hpmcounter7",    ctr,    read_zero },
-    [CSR_HPMCOUNTER8]    = { "hpmcounter8",    ctr,    read_zero },
-    [CSR_HPMCOUNTER9]    = { "hpmcounter9",    ctr,    read_zero },
-    [CSR_HPMCOUNTER10]   = { "hpmcounter10",   ctr,    read_zero },
-    [CSR_HPMCOUNTER11]   = { "hpmcounter11",   ctr,    read_zero },
-    [CSR_HPMCOUNTER12]   = { "hpmcounter12",   ctr,    read_zero },
-    [CSR_HPMCOUNTER13]   = { "hpmcounter13",   ctr,    read_zero },
-    [CSR_HPMCOUNTER14]   = { "hpmcounter14",   ctr,    read_zero },
-    [CSR_HPMCOUNTER15]   = { "hpmcounter15",   ctr,    read_zero },
-    [CSR_HPMCOUNTER16]   = { "hpmcounter16",   ctr,    read_zero },
-    [CSR_HPMCOUNTER17]   = { "hpmcounter17",   ctr,    read_zero },
-    [CSR_HPMCOUNTER18]   = { "hpmcounter18",   ctr,    read_zero },
-    [CSR_HPMCOUNTER19]   = { "hpmcounter19",   ctr,    read_zero },
-    [CSR_HPMCOUNTER20]   = { "hpmcounter20",   ctr,    read_zero },
-    [CSR_HPMCOUNTER21]   = { "hpmcounter21",   ctr,    read_zero },
-    [CSR_HPMCOUNTER22]   = { "hpmcounter22",   ctr,    read_zero },
-    [CSR_HPMCOUNTER23]   = { "hpmcounter23",   ctr,    read_zero },
-    [CSR_HPMCOUNTER24]   = { "hpmcounter24",   ctr,    read_zero },
-    [CSR_HPMCOUNTER25]   = { "hpmcounter25",   ctr,    read_zero },
-    [CSR_HPMCOUNTER26]   = { "hpmcounter26",   ctr,    read_zero },
-    [CSR_HPMCOUNTER27]   = { "hpmcounter27",   ctr,    read_zero },
-    [CSR_HPMCOUNTER28]   = { "hpmcounter28",   ctr,    read_zero },
-    [CSR_HPMCOUNTER29]   = { "hpmcounter29",   ctr,    read_zero },
-    [CSR_HPMCOUNTER30]   = { "hpmcounter30",   ctr,    read_zero },
-    [CSR_HPMCOUNTER31]   = { "hpmcounter31",   ctr,    read_zero },
-
-    [CSR_MHPMCOUNTER3]   = { "mhpmcounter3",   mctr,   read_zero },
-    [CSR_MHPMCOUNTER4]   = { "mhpmcounter4",   mctr,   read_zero },
-    [CSR_MHPMCOUNTER5]   = { "mhpmcounter5",   mctr,   read_zero },
-    [CSR_MHPMCOUNTER6]   = { "mhpmcounter6",   mctr,   read_zero },
-    [CSR_MHPMCOUNTER7]   = { "mhpmcounter7",   mctr,   read_zero },
-    [CSR_MHPMCOUNTER8]   = { "mhpmcounter8",   mctr,   read_zero },
-    [CSR_MHPMCOUNTER9]   = { "mhpmcounter9",   mctr,   read_zero },
-    [CSR_MHPMCOUNTER10]  = { "mhpmcounter10",  mctr,   read_zero },
-    [CSR_MHPMCOUNTER11]  = { "mhpmcounter11",  mctr,   read_zero },
-    [CSR_MHPMCOUNTER12]  = { "mhpmcounter12",  mctr,   read_zero },
-    [CSR_MHPMCOUNTER13]  = { "mhpmcounter13",  mctr,   read_zero },
-    [CSR_MHPMCOUNTER14]  = { "mhpmcounter14",  mctr,   read_zero },
-    [CSR_MHPMCOUNTER15]  = { "mhpmcounter15",  mctr,   read_zero },
-    [CSR_MHPMCOUNTER16]  = { "mhpmcounter16",  mctr,   read_zero },
-    [CSR_MHPMCOUNTER17]  = { "mhpmcounter17",  mctr,   read_zero },
-    [CSR_MHPMCOUNTER18]  = { "mhpmcounter18",  mctr,   read_zero },
-    [CSR_MHPMCOUNTER19]  = { "mhpmcounter19",  mctr,   read_zero },
-    [CSR_MHPMCOUNTER20]  = { "mhpmcounter20",  mctr,   read_zero },
-    [CSR_MHPMCOUNTER21]  = { "mhpmcounter21",  mctr,   read_zero },
-    [CSR_MHPMCOUNTER22]  = { "mhpmcounter22",  mctr,   read_zero },
-    [CSR_MHPMCOUNTER23]  = { "mhpmcounter23",  mctr,   read_zero },
-    [CSR_MHPMCOUNTER24]  = { "mhpmcounter24",  mctr,   read_zero },
-    [CSR_MHPMCOUNTER25]  = { "mhpmcounter25",  mctr,   read_zero },
-    [CSR_MHPMCOUNTER26]  = { "mhpmcounter26",  mctr,   read_zero },
-    [CSR_MHPMCOUNTER27]  = { "mhpmcounter27",  mctr,   read_zero },
-    [CSR_MHPMCOUNTER28]  = { "mhpmcounter28",  mctr,   read_zero },
-    [CSR_MHPMCOUNTER29]  = { "mhpmcounter29",  mctr,   read_zero },
-    [CSR_MHPMCOUNTER30]  = { "mhpmcounter30",  mctr,   read_zero },
-    [CSR_MHPMCOUNTER31]  = { "mhpmcounter31",  mctr,   read_zero },
-
-    [CSR_MCOUNTINHIBIT]  = { "mcountinhibit",   any,    read_mcountinhibit,
-                                                       write_mcountinhibit },
-
-    [CSR_MHPMEVENT3]     = { "mhpmevent3",     any,    read_zero },
-    [CSR_MHPMEVENT4]     = { "mhpmevent4",     any,    read_zero },
-    [CSR_MHPMEVENT5]     = { "mhpmevent5",     any,    read_zero },
-    [CSR_MHPMEVENT6]     = { "mhpmevent6",     any,    read_zero },
-    [CSR_MHPMEVENT7]     = { "mhpmevent7",     any,    read_zero },
-    [CSR_MHPMEVENT8]     = { "mhpmevent8",     any,    read_zero },
-    [CSR_MHPMEVENT9]     = { "mhpmevent9",     any,    read_zero },
-    [CSR_MHPMEVENT10]    = { "mhpmevent10",    any,    read_zero },
-    [CSR_MHPMEVENT11]    = { "mhpmevent11",    any,    read_zero },
-    [CSR_MHPMEVENT12]    = { "mhpmevent12",    any,    read_zero },
-    [CSR_MHPMEVENT13]    = { "mhpmevent13",    any,    read_zero },
-    [CSR_MHPMEVENT14]    = { "mhpmevent14",    any,    read_zero },
-    [CSR_MHPMEVENT15]    = { "mhpmevent15",    any,    read_zero },
-    [CSR_MHPMEVENT16]    = { "mhpmevent16",    any,    read_zero },
-    [CSR_MHPMEVENT17]    = { "mhpmevent17",    any,    read_zero },
-    [CSR_MHPMEVENT18]    = { "mhpmevent18",    any,    read_zero },
-    [CSR_MHPMEVENT19]    = { "mhpmevent19",    any,    read_zero },
-    [CSR_MHPMEVENT20]    = { "mhpmevent20",    any,    read_zero },
-    [CSR_MHPMEVENT21]    = { "mhpmevent21",    any,    read_zero },
-    [CSR_MHPMEVENT22]    = { "mhpmevent22",    any,    read_zero },
-    [CSR_MHPMEVENT23]    = { "mhpmevent23",    any,    read_zero },
-    [CSR_MHPMEVENT24]    = { "mhpmevent24",    any,    read_zero },
-    [CSR_MHPMEVENT25]    = { "mhpmevent25",    any,    read_zero },
-    [CSR_MHPMEVENT26]    = { "mhpmevent26",    any,    read_zero },
-    [CSR_MHPMEVENT27]    = { "mhpmevent27",    any,    read_zero },
-    [CSR_MHPMEVENT28]    = { "mhpmevent28",    any,    read_zero },
-    [CSR_MHPMEVENT29]    = { "mhpmevent29",    any,    read_zero },
-    [CSR_MHPMEVENT30]    = { "mhpmevent30",    any,    read_zero },
-    [CSR_MHPMEVENT31]    = { "mhpmevent31",    any,    read_zero },
-
-    [CSR_HPMCOUNTER3H]   = { "hpmcounter3h",   ctr32,  read_zero },
-    [CSR_HPMCOUNTER4H]   = { "hpmcounter4h",   ctr32,  read_zero },
-    [CSR_HPMCOUNTER5H]   = { "hpmcounter5h",   ctr32,  read_zero },
-    [CSR_HPMCOUNTER6H]   = { "hpmcounter6h",   ctr32,  read_zero },
-    [CSR_HPMCOUNTER7H]   = { "hpmcounter7h",   ctr32,  read_zero },
-    [CSR_HPMCOUNTER8H]   = { "hpmcounter8h",   ctr32,  read_zero },
-    [CSR_HPMCOUNTER9H]   = { "hpmcounter9h",   ctr32,  read_zero },
-    [CSR_HPMCOUNTER10H]  = { "hpmcounter10h",  ctr32,  read_zero },
-    [CSR_HPMCOUNTER11H]  = { "hpmcounter11h",  ctr32,  read_zero },
-    [CSR_HPMCOUNTER12H]  = { "hpmcounter12h",  ctr32,  read_zero },
-    [CSR_HPMCOUNTER13H]  = { "hpmcounter13h",  ctr32,  read_zero },
-    [CSR_HPMCOUNTER14H]  = { "hpmcounter14h",  ctr32,  read_zero },
-    [CSR_HPMCOUNTER15H]  = { "hpmcounter15h",  ctr32,  read_zero },
-    [CSR_HPMCOUNTER16H]  = { "hpmcounter16h",  ctr32,  read_zero },
-    [CSR_HPMCOUNTER17H]  = { "hpmcounter17h",  ctr32,  read_zero },
-    [CSR_HPMCOUNTER18H]  = { "hpmcounter18h",  ctr32,  read_zero },
-    [CSR_HPMCOUNTER19H]  = { "hpmcounter19h",  ctr32,  read_zero },
-    [CSR_HPMCOUNTER20H]  = { "hpmcounter20h",  ctr32,  read_zero },
-    [CSR_HPMCOUNTER21H]  = { "hpmcounter21h",  ctr32,  read_zero },
-    [CSR_HPMCOUNTER22H]  = { "hpmcounter22h",  ctr32,  read_zero },
-    [CSR_HPMCOUNTER23H]  = { "hpmcounter23h",  ctr32,  read_zero },
-    [CSR_HPMCOUNTER24H]  = { "hpmcounter24h",  ctr32,  read_zero },
-    [CSR_HPMCOUNTER25H]  = { "hpmcounter25h",  ctr32,  read_zero },
-    [CSR_HPMCOUNTER26H]  = { "hpmcounter26h",  ctr32,  read_zero },
-    [CSR_HPMCOUNTER27H]  = { "hpmcounter27h",  ctr32,  read_zero },
-    [CSR_HPMCOUNTER28H]  = { "hpmcounter28h",  ctr32,  read_zero },
-    [CSR_HPMCOUNTER29H]  = { "hpmcounter29h",  ctr32,  read_zero },
-    [CSR_HPMCOUNTER30H]  = { "hpmcounter30h",  ctr32,  read_zero },
-    [CSR_HPMCOUNTER31H]  = { "hpmcounter31h",  ctr32,  read_zero },
-
-    [CSR_MHPMCOUNTER3H]  = { "mhpmcounter3h",  any32,  read_zero },
-    [CSR_MHPMCOUNTER4H]  = { "mhpmcounter4h",  any32,  read_zero },
-    [CSR_MHPMCOUNTER5H]  = { "mhpmcounter5h",  any32,  read_zero },
-    [CSR_MHPMCOUNTER6H]  = { "mhpmcounter6h",  any32,  read_zero },
-    [CSR_MHPMCOUNTER7H]  = { "mhpmcounter7h",  any32,  read_zero },
-    [CSR_MHPMCOUNTER8H]  = { "mhpmcounter8h",  any32,  read_zero },
-    [CSR_MHPMCOUNTER9H]  = { "mhpmcounter9h",  any32,  read_zero },
-    [CSR_MHPMCOUNTER10H] = { "mhpmcounter10h", any32,  read_zero },
-    [CSR_MHPMCOUNTER11H] = { "mhpmcounter11h", any32,  read_zero },
-    [CSR_MHPMCOUNTER12H] = { "mhpmcounter12h", any32,  read_zero },
-    [CSR_MHPMCOUNTER13H] = { "mhpmcounter13h", any32,  read_zero },
-    [CSR_MHPMCOUNTER14H] = { "mhpmcounter14h", any32,  read_zero },
-    [CSR_MHPMCOUNTER15H] = { "mhpmcounter15h", any32,  read_zero },
-    [CSR_MHPMCOUNTER16H] = { "mhpmcounter16h", any32,  read_zero },
-    [CSR_MHPMCOUNTER17H] = { "mhpmcounter17h", any32,  read_zero },
-    [CSR_MHPMCOUNTER18H] = { "mhpmcounter18h", any32,  read_zero },
-    [CSR_MHPMCOUNTER19H] = { "mhpmcounter19h", any32,  read_zero },
-    [CSR_MHPMCOUNTER20H] = { "mhpmcounter20h", any32,  read_zero },
-    [CSR_MHPMCOUNTER21H] = { "mhpmcounter21h", any32,  read_zero },
-    [CSR_MHPMCOUNTER22H] = { "mhpmcounter22h", any32,  read_zero },
-    [CSR_MHPMCOUNTER23H] = { "mhpmcounter23h", any32,  read_zero },
-    [CSR_MHPMCOUNTER24H] = { "mhpmcounter24h", any32,  read_zero },
-    [CSR_MHPMCOUNTER25H] = { "mhpmcounter25h", any32,  read_zero },
-    [CSR_MHPMCOUNTER26H] = { "mhpmcounter26h", any32,  read_zero },
-    [CSR_MHPMCOUNTER27H] = { "mhpmcounter27h", any32,  read_zero },
-    [CSR_MHPMCOUNTER28H] = { "mhpmcounter28h", any32,  read_zero },
-    [CSR_MHPMCOUNTER29H] = { "mhpmcounter29h", any32,  read_zero },
-    [CSR_MHPMCOUNTER30H] = { "mhpmcounter30h", any32,  read_zero },
-    [CSR_MHPMCOUNTER31H] = { "mhpmcounter31h", any32,  read_zero },
+    [CSR_HPMCOUNTER3]    = { "hpmcounter3",    ctr,    read_hpmcounter },
+    [CSR_HPMCOUNTER4]    = { "hpmcounter4",    ctr,    read_hpmcounter },
+    [CSR_HPMCOUNTER5]    = { "hpmcounter5",    ctr,    read_hpmcounter },
+    [CSR_HPMCOUNTER6]    = { "hpmcounter6",    ctr,    read_hpmcounter },
+    [CSR_HPMCOUNTER7]    = { "hpmcounter7",    ctr,    read_hpmcounter },
+    [CSR_HPMCOUNTER8]    = { "hpmcounter8",    ctr,    read_hpmcounter },
+    [CSR_HPMCOUNTER9]    = { "hpmcounter9",    ctr,    read_hpmcounter },
+    [CSR_HPMCOUNTER10]   = { "hpmcounter10",   ctr,    read_hpmcounter },
+    [CSR_HPMCOUNTER11]   = { "hpmcounter11",   ctr,    read_hpmcounter },
+    [CSR_HPMCOUNTER12]   = { "hpmcounter12",   ctr,    read_hpmcounter },
+    [CSR_HPMCOUNTER13]   = { "hpmcounter13",   ctr,    read_hpmcounter },
+    [CSR_HPMCOUNTER14]   = { "hpmcounter14",   ctr,    read_hpmcounter },
+    [CSR_HPMCOUNTER15]   = { "hpmcounter15",   ctr,    read_hpmcounter },
+    [CSR_HPMCOUNTER16]   = { "hpmcounter16",   ctr,    read_hpmcounter },
+    [CSR_HPMCOUNTER17]   = { "hpmcounter17",   ctr,    read_hpmcounter },
+    [CSR_HPMCOUNTER18]   = { "hpmcounter18",   ctr,    read_hpmcounter },
+    [CSR_HPMCOUNTER19]   = { "hpmcounter19",   ctr,    read_hpmcounter },
+    [CSR_HPMCOUNTER20]   = { "hpmcounter20",   ctr,    read_hpmcounter },
+    [CSR_HPMCOUNTER21]   = { "hpmcounter21",   ctr,    read_hpmcounter },
+    [CSR_HPMCOUNTER22]   = { "hpmcounter22",   ctr,    read_hpmcounter },
+    [CSR_HPMCOUNTER23]   = { "hpmcounter23",   ctr,    read_hpmcounter },
+    [CSR_HPMCOUNTER24]   = { "hpmcounter24",   ctr,    read_hpmcounter },
+    [CSR_HPMCOUNTER25]   = { "hpmcounter25",   ctr,    read_hpmcounter },
+    [CSR_HPMCOUNTER26]   = { "hpmcounter26",   ctr,    read_hpmcounter },
+    [CSR_HPMCOUNTER27]   = { "hpmcounter27",   ctr,    read_hpmcounter },
+    [CSR_HPMCOUNTER28]   = { "hpmcounter28",   ctr,    read_hpmcounter },
+    [CSR_HPMCOUNTER29]   = { "hpmcounter29",   ctr,    read_hpmcounter },
+    [CSR_HPMCOUNTER30]   = { "hpmcounter30",   ctr,    read_hpmcounter },
+    [CSR_HPMCOUNTER31]   = { "hpmcounter31",   ctr,    read_hpmcounter },
+
+    [CSR_MHPMCOUNTER3]   = { "mhpmcounter3",   mctr,    read_hpmcounter,
+                                                       write_mhpmcounter },
+    [CSR_MHPMCOUNTER4]   = { "mhpmcounter4",   mctr,    read_hpmcounter,
+                                                       write_mhpmcounter },
+    [CSR_MHPMCOUNTER5]   = { "mhpmcounter5",   mctr,    read_hpmcounter,
+                                                       write_mhpmcounter },
+    [CSR_MHPMCOUNTER6]   = { "mhpmcounter6",   mctr,    read_hpmcounter,
+                                                       write_mhpmcounter },
+    [CSR_MHPMCOUNTER7]   = { "mhpmcounter7",   mctr,    read_hpmcounter,
+                                                       write_mhpmcounter },
+    [CSR_MHPMCOUNTER8]   = { "mhpmcounter8",   mctr,    read_hpmcounter,
+                                                       write_mhpmcounter },
+    [CSR_MHPMCOUNTER9]   = { "mhpmcounter9",   mctr,    read_hpmcounter,
+                                                       write_mhpmcounter },
+    [CSR_MHPMCOUNTER10]  = { "mhpmcounter10",  mctr,    read_hpmcounter,
+                                                       write_mhpmcounter },
+    [CSR_MHPMCOUNTER11]  = { "mhpmcounter11",  mctr,    read_hpmcounter,
+                                                       write_mhpmcounter },
+    [CSR_MHPMCOUNTER12]  = { "mhpmcounter12",  mctr,    read_hpmcounter,
+                                                       write_mhpmcounter },
+    [CSR_MHPMCOUNTER13]  = { "mhpmcounter13",  mctr,    read_hpmcounter,
+                                                       write_mhpmcounter },
+    [CSR_MHPMCOUNTER14]  = { "mhpmcounter14",  mctr,    read_hpmcounter,
+                                                       write_mhpmcounter },
+    [CSR_MHPMCOUNTER15]  = { "mhpmcounter15",  mctr,    read_hpmcounter,
+                                                       write_mhpmcounter },
+    [CSR_MHPMCOUNTER16]  = { "mhpmcounter16",  mctr,    read_hpmcounter,
+                                                       write_mhpmcounter },
+    [CSR_MHPMCOUNTER17]  = { "mhpmcounter17",  mctr,    read_hpmcounter,
+                                                       write_mhpmcounter },
+    [CSR_MHPMCOUNTER18]  = { "mhpmcounter18",  mctr,    read_hpmcounter,
+                                                       write_mhpmcounter },
+    [CSR_MHPMCOUNTER19]  = { "mhpmcounter19",  mctr,    read_hpmcounter,
+                                                       write_mhpmcounter },
+    [CSR_MHPMCOUNTER20]  = { "mhpmcounter20",  mctr,    read_hpmcounter,
+                                                       write_mhpmcounter },
+    [CSR_MHPMCOUNTER21]  = { "mhpmcounter21",  mctr,    read_hpmcounter,
+                                                       write_mhpmcounter },
+    [CSR_MHPMCOUNTER22]  = { "mhpmcounter22",  mctr,    read_hpmcounter,
+                                                       write_mhpmcounter },
+    [CSR_MHPMCOUNTER23]  = { "mhpmcounter23",  mctr,    read_hpmcounter,
+                                                       write_mhpmcounter },
+    [CSR_MHPMCOUNTER24]  = { "mhpmcounter24",  mctr,    read_hpmcounter,
+                                                       write_mhpmcounter },
+    [CSR_MHPMCOUNTER25]  = { "mhpmcounter25",  mctr,    read_hpmcounter,
+                                                       write_mhpmcounter },
+    [CSR_MHPMCOUNTER26]  = { "mhpmcounter26",  mctr,    read_hpmcounter,
+                                                       write_mhpmcounter },
+    [CSR_MHPMCOUNTER27]  = { "mhpmcounter27",  mctr,    read_hpmcounter,
+                                                       write_mhpmcounter },
+    [CSR_MHPMCOUNTER28]  = { "mhpmcounter28",  mctr,    read_hpmcounter,
+                                                       write_mhpmcounter },
+    [CSR_MHPMCOUNTER29]  = { "mhpmcounter29",  mctr,    read_hpmcounter,
+                                                       write_mhpmcounter },
+    [CSR_MHPMCOUNTER30]  = { "mhpmcounter30",  mctr,    read_hpmcounter,
+                                                       write_mhpmcounter },
+    [CSR_MHPMCOUNTER31]  = { "mhpmcounter31",  mctr,    read_hpmcounter,
+                                                       write_mhpmcounter },
+
+    [CSR_MCOUNTINHIBIT]  = { "mcountinhibit",  any, read_mcountinhibit,
+                                                    write_mcountinhibit },
+
+    [CSR_MHPMEVENT3]     = { "mhpmevent3",     any,    read_mhpmevent,
+                                                       write_mhpmevent },
+    [CSR_MHPMEVENT4]     = { "mhpmevent4",     any,    read_mhpmevent,
+                                                       write_mhpmevent },
+    [CSR_MHPMEVENT5]     = { "mhpmevent5",     any,    read_mhpmevent,
+                                                       write_mhpmevent },
+    [CSR_MHPMEVENT6]     = { "mhpmevent6",     any,    read_mhpmevent,
+                                                       write_mhpmevent },
+    [CSR_MHPMEVENT7]     = { "mhpmevent7",     any,    read_mhpmevent,
+                                                       write_mhpmevent },
+    [CSR_MHPMEVENT8]     = { "mhpmevent8",     any,    read_mhpmevent,
+                                                       write_mhpmevent },
+    [CSR_MHPMEVENT9]     = { "mhpmevent9",     any,    read_mhpmevent,
+                                                       write_mhpmevent },
+    [CSR_MHPMEVENT10]    = { "mhpmevent10",    any,    read_mhpmevent,
+                                                       write_mhpmevent },
+    [CSR_MHPMEVENT11]    = { "mhpmevent11",    any,    read_mhpmevent,
+                                                       write_mhpmevent },
+    [CSR_MHPMEVENT12]    = { "mhpmevent12",    any,    read_mhpmevent,
+                                                       write_mhpmevent },
+    [CSR_MHPMEVENT13]    = { "mhpmevent13",    any,    read_mhpmevent,
+                                                       write_mhpmevent },
+    [CSR_MHPMEVENT14]    = { "mhpmevent14",    any,    read_mhpmevent,
+                                                       write_mhpmevent },
+    [CSR_MHPMEVENT15]    = { "mhpmevent15",    any,    read_mhpmevent,
+                                                       write_mhpmevent },
+    [CSR_MHPMEVENT16]    = { "mhpmevent16",    any,    read_mhpmevent,
+                                                       write_mhpmevent },
+    [CSR_MHPMEVENT17]    = { "mhpmevent17",    any,    read_mhpmevent,
+                                                       write_mhpmevent },
+    [CSR_MHPMEVENT18]    = { "mhpmevent18",    any,    read_mhpmevent,
+                                                       write_mhpmevent },
+    [CSR_MHPMEVENT19]    = { "mhpmevent19",    any,    read_mhpmevent,
+                                                       write_mhpmevent },
+    [CSR_MHPMEVENT20]    = { "mhpmevent20",    any,    read_mhpmevent,
+                                                       write_mhpmevent },
+    [CSR_MHPMEVENT21]    = { "mhpmevent21",    any,    read_mhpmevent,
+                                                       write_mhpmevent },
+    [CSR_MHPMEVENT22]    = { "mhpmevent22",    any,    read_mhpmevent,
+                                                       write_mhpmevent },
+    [CSR_MHPMEVENT23]    = { "mhpmevent23",    any,    read_mhpmevent,
+                                                       write_mhpmevent },
+    [CSR_MHPMEVENT24]    = { "mhpmevent24",    any,    read_mhpmevent,
+                                                       write_mhpmevent },
+    [CSR_MHPMEVENT25]    = { "mhpmevent25",    any,    read_mhpmevent,
+                                                       write_mhpmevent },
+    [CSR_MHPMEVENT26]    = { "mhpmevent26",    any,    read_mhpmevent,
+                                                       write_mhpmevent },
+    [CSR_MHPMEVENT27]    = { "mhpmevent27",    any,    read_mhpmevent,
+                                                       write_mhpmevent },
+    [CSR_MHPMEVENT28]    = { "mhpmevent28",    any,    read_mhpmevent,
+                                                       write_mhpmevent },
+    [CSR_MHPMEVENT29]    = { "mhpmevent29",    any,    read_mhpmevent,
+                                                       write_mhpmevent },
+    [CSR_MHPMEVENT30]    = { "mhpmevent30",    any,    read_mhpmevent,
+                                                       write_mhpmevent },
+    [CSR_MHPMEVENT31]    = { "mhpmevent31",    any,    read_mhpmevent,
+                                                       write_mhpmevent },
+
+    [CSR_HPMCOUNTER3H]   = { "hpmcounter3h",   ctr32,  read_hpmcounterh },
+    [CSR_HPMCOUNTER4H]   = { "hpmcounter4h",   ctr32,  read_hpmcounterh },
+    [CSR_HPMCOUNTER5H]   = { "hpmcounter5h",   ctr32,  read_hpmcounterh },
+    [CSR_HPMCOUNTER6H]   = { "hpmcounter6h",   ctr32,  read_hpmcounterh },
+    [CSR_HPMCOUNTER7H]   = { "hpmcounter7h",   ctr32,  read_hpmcounterh },
+    [CSR_HPMCOUNTER8H]   = { "hpmcounter8h",   ctr32,  read_hpmcounterh },
+    [CSR_HPMCOUNTER9H]   = { "hpmcounter9h",   ctr32,  read_hpmcounterh },
+    [CSR_HPMCOUNTER10H]  = { "hpmcounter10h",  ctr32,  read_hpmcounterh },
+    [CSR_HPMCOUNTER11H]  = { "hpmcounter11h",  ctr32,  read_hpmcounterh },
+    [CSR_HPMCOUNTER12H]  = { "hpmcounter12h",  ctr32,  read_hpmcounterh },
+    [CSR_HPMCOUNTER13H]  = { "hpmcounter13h",  ctr32,  read_hpmcounterh },
+    [CSR_HPMCOUNTER14H]  = { "hpmcounter14h",  ctr32,  read_hpmcounterh },
+    [CSR_HPMCOUNTER15H]  = { "hpmcounter15h",  ctr32,  read_hpmcounterh },
+    [CSR_HPMCOUNTER16H]  = { "hpmcounter16h",  ctr32,  read_hpmcounterh },
+    [CSR_HPMCOUNTER17H]  = { "hpmcounter17h",  ctr32,  read_hpmcounterh },
+    [CSR_HPMCOUNTER18H]  = { "hpmcounter18h",  ctr32,  read_hpmcounterh },
+    [CSR_HPMCOUNTER19H]  = { "hpmcounter19h",  ctr32,  read_hpmcounterh },
+    [CSR_HPMCOUNTER20H]  = { "hpmcounter20h",  ctr32,  read_hpmcounterh },
+    [CSR_HPMCOUNTER21H]  = { "hpmcounter21h",  ctr32,  read_hpmcounterh },
+    [CSR_HPMCOUNTER22H]  = { "hpmcounter22h",  ctr32,  read_hpmcounterh },
+    [CSR_HPMCOUNTER23H]  = { "hpmcounter23h",  ctr32,  read_hpmcounterh },
+    [CSR_HPMCOUNTER24H]  = { "hpmcounter24h",  ctr32,  read_hpmcounterh },
+    [CSR_HPMCOUNTER25H]  = { "hpmcounter25h",  ctr32,  read_hpmcounterh },
+    [CSR_HPMCOUNTER26H]  = { "hpmcounter26h",  ctr32,  read_hpmcounterh },
+    [CSR_HPMCOUNTER27H]  = { "hpmcounter27h",  ctr32,  read_hpmcounterh },
+    [CSR_HPMCOUNTER28H]  = { "hpmcounter28h",  ctr32,  read_hpmcounterh },
+    [CSR_HPMCOUNTER29H]  = { "hpmcounter29h",  ctr32,  read_hpmcounterh },
+    [CSR_HPMCOUNTER30H]  = { "hpmcounter30h",  ctr32,  read_hpmcounterh },
+    [CSR_HPMCOUNTER31H]  = { "hpmcounter31h",  ctr32,  read_hpmcounterh },
+
+    [CSR_MHPMCOUNTER3H]  = { "mhpmcounter3h",  mctr32,  read_hpmcounterh,
+                                                       write_mhpmcounterh },
+    [CSR_MHPMCOUNTER4H]  = { "mhpmcounter4h",  mctr32,  read_hpmcounterh,
+                                                       write_mhpmcounterh },
+    [CSR_MHPMCOUNTER5H]  = { "mhpmcounter5h",  mctr32,  read_hpmcounterh,
+                                                       write_mhpmcounterh },
+    [CSR_MHPMCOUNTER6H]  = { "mhpmcounter6h",  mctr32,  read_hpmcounterh,
+                                                       write_mhpmcounterh },
+    [CSR_MHPMCOUNTER7H]  = { "mhpmcounter7h",  mctr32,  read_hpmcounterh,
+                                                       write_mhpmcounterh },
+    [CSR_MHPMCOUNTER8H]  = { "mhpmcounter8h",  mctr32,  read_hpmcounterh,
+                                                       write_mhpmcounterh },
+    [CSR_MHPMCOUNTER9H]  = { "mhpmcounter9h",  mctr32,  read_hpmcounterh,
+                                                       write_mhpmcounterh },
+    [CSR_MHPMCOUNTER10H] = { "mhpmcounter10h", mctr32,  read_hpmcounterh,
+                                                       write_mhpmcounterh },
+    [CSR_MHPMCOUNTER11H] = { "mhpmcounter11h", mctr32,  read_hpmcounterh,
+                                                       write_mhpmcounterh },
+    [CSR_MHPMCOUNTER12H] = { "mhpmcounter12h", mctr32,  read_hpmcounterh,
+                                                       write_mhpmcounterh },
+    [CSR_MHPMCOUNTER13H] = { "mhpmcounter13h", mctr32,  read_hpmcounterh,
+                                                       write_mhpmcounterh },
+    [CSR_MHPMCOUNTER14H] = { "mhpmcounter14h", mctr32,  read_hpmcounterh,
+                                                       write_mhpmcounterh },
+    [CSR_MHPMCOUNTER15H] = { "mhpmcounter15h", mctr32,  read_hpmcounterh,
+                                                       write_mhpmcounterh },
+    [CSR_MHPMCOUNTER16H] = { "mhpmcounter16h", mctr32,  read_hpmcounterh,
+                                                       write_mhpmcounterh },
+    [CSR_MHPMCOUNTER17H] = { "mhpmcounter17h", mctr32,  read_hpmcounterh,
+                                                       write_mhpmcounterh },
+    [CSR_MHPMCOUNTER18H] = { "mhpmcounter18h", mctr32,  read_hpmcounterh,
+                                                       write_mhpmcounterh },
+    [CSR_MHPMCOUNTER19H] = { "mhpmcounter19h", mctr32,  read_hpmcounterh,
+                                                       write_mhpmcounterh },
+    [CSR_MHPMCOUNTER20H] = { "mhpmcounter20h", mctr32,  read_hpmcounterh,
+                                                       write_mhpmcounterh },
+    [CSR_MHPMCOUNTER21H] = { "mhpmcounter21h", mctr32,  read_hpmcounterh,
+                                                       write_mhpmcounterh },
+    [CSR_MHPMCOUNTER22H] = { "mhpmcounter22h", mctr32,  read_hpmcounterh,
+                                                       write_mhpmcounterh },
+    [CSR_MHPMCOUNTER23H] = { "mhpmcounter23h", mctr32,  read_hpmcounterh,
+                                                       write_mhpmcounterh },
+    [CSR_MHPMCOUNTER24H] = { "mhpmcounter24h", mctr32,  read_hpmcounterh,
+                                                       write_mhpmcounterh },
+    [CSR_MHPMCOUNTER25H] = { "mhpmcounter25h", mctr32,  read_hpmcounterh,
+                                                       write_mhpmcounterh },
+    [CSR_MHPMCOUNTER26H] = { "mhpmcounter26h", mctr32,  read_hpmcounterh,
+                                                       write_mhpmcounterh },
+    [CSR_MHPMCOUNTER27H] = { "mhpmcounter27h", mctr32,  read_hpmcounterh,
+                                                       write_mhpmcounterh },
+    [CSR_MHPMCOUNTER28H] = { "mhpmcounter28h", mctr32,  read_hpmcounterh,
+                                                       write_mhpmcounterh },
+    [CSR_MHPMCOUNTER29H] = { "mhpmcounter29h", mctr32,  read_hpmcounterh,
+                                                       write_mhpmcounterh },
+    [CSR_MHPMCOUNTER30H] = { "mhpmcounter30h", mctr32,  read_hpmcounterh,
+                                                       write_mhpmcounterh },
+    [CSR_MHPMCOUNTER31H] = { "mhpmcounter31h", mctr32,  read_hpmcounterh,
+                                                       write_mhpmcounterh },
 #endif /* !CONFIG_USER_ONLY */
 };
diff --git a/target/riscv/machine.c b/target/riscv/machine.c
index 20dea0843604..a2b32064b07a 100644
--- a/target/riscv/machine.c
+++ b/target/riscv/machine.c
@@ -178,6 +178,9 @@ const VMStateDescription vmstate_riscv_cpu = {
         VMSTATE_UINTTL(env.scounteren, RISCVCPU),
         VMSTATE_UINTTL(env.mcounteren, RISCVCPU),
         VMSTATE_UINTTL(env.mcountinhibit, RISCVCPU),
+        VMSTATE_UINTTL_ARRAY(env.mhpmcounter_val, RISCVCPU, RV_MAX_MHPMCOUNTERS),
+        VMSTATE_UINTTL_ARRAY(env.mhpmcounterh_val, RISCVCPU, RV_MAX_MHPMCOUNTERS),
+        VMSTATE_UINTTL_ARRAY(env.mhpmevent_val, RISCVCPU, RV_MAX_MHPMEVENTS),
         VMSTATE_UINTTL(env.sscratch, RISCVCPU),
         VMSTATE_UINTTL(env.mscratch, RISCVCPU),
         VMSTATE_UINT64(env.mfromhost, RISCVCPU),
-- 
2.31.1


