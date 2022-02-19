Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nLDa5-0008Rz-Me
	for mharc-qemu-riscv@gnu.org; Fri, 18 Feb 2022 19:26:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1nLDa4-0008Pm-Pn
 for qemu-riscv@nongnu.org; Fri, 18 Feb 2022 19:26:32 -0500
Received: from [2607:f8b0:4864:20::c2a] (port=36643
 helo=mail-oo1-xc2a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1nLDZX-00070n-Tn
 for qemu-riscv@nongnu.org; Fri, 18 Feb 2022 19:26:32 -0500
Received: by mail-oo1-xc2a.google.com with SMTP id
 r15-20020a4ae5cf000000b002edba1d3349so5564093oov.3
 for <qemu-riscv@nongnu.org>; Fri, 18 Feb 2022 16:25:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5nf1I0P6XLR2wb26Z/lcwH3HbiGdqL8pkGsSTb74ssw=;
 b=gFDUbrIjRWsig6MPowKmbIa4M/f66j/p0Ou5P4eLo6KeT1IZUUJ11p+sglwxoZ5obG
 l2mawcpJRIkuftzKFkdqucPXCxr4osn4x+8+97MlHX3udtp8l08QKmX9sKtczvLpqV78
 L9FmtseSF0JITwxdKwadA5RmgmUILJ5Rx5y9dVIWbp2juGlrtOptIVw9beHyvSSte1vl
 hLOd6AeAvXV6JSm3ZlBqExQ9GOtn1QslgDmin3WO9wyn/aO3zP4bU5PER8IIp/CQo3NF
 HeE+9GmsFeXDoyMeWtYiZmlhgNG4BEqSeBd1f2OdBplYXIJwNpSR/qNjqc8xJzfiXeBl
 8Vvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5nf1I0P6XLR2wb26Z/lcwH3HbiGdqL8pkGsSTb74ssw=;
 b=Br6+AdlW4RprRDn6BjBiQjkX7cjrNXwmknwJ3YCm0QoEux3nC/Nb97ww4EYRaSX6IR
 gyyJGgSiknRang5PMUPT8ijUCe6pxQJQ92CbgLC7oTUgCDfaIHkeWhq35pZ74ukZl73/
 W5q0ZyAMT+LWMYOFH2LiWIsJomfH/YtRG+rxwuzdMi3AFAzOXMk7Hq1KvWdTHxEyzhqD
 ppSUbVL+4byOgMWKHiFEtvGFDqTx+/V9AhClXJUT9wfXq11ekq3bHYCxQuGmSqhsJKSG
 09/2udA0U/dAPVjRZY/Gq/H+tbwld8pRUAtJhbIl4EIpWSWVy3GzB5Q2tCZAHMBKoPAs
 mBLA==
X-Gm-Message-State: AOAM5315iKE+6nhYEwnEUdVaV7m2ucpujsJHyweam1cOu48ck5mp3wsE
 JqSo7K/MuJzu7fYHSZIeWdhe3mdw7SxYDHOB
X-Google-Smtp-Source: ABdhPJw6kF/qeXloQkJIA7pwHTWtmSfgQGOAg4VbA3pmPSdA35qKks0ZkU9XLaMX+MeZYYEbdEuKPQ==
X-Received: by 2002:a05:6870:2497:b0:c7:5ea5:c92b with SMTP id
 s23-20020a056870249700b000c75ea5c92bmr3926817oaq.271.1645230342298; 
 Fri, 18 Feb 2022 16:25:42 -0800 (PST)
Received: from rivos-atish.. (adsl-70-228-75-190.dsl.akrnoh.ameritech.net.
 [70.228.75.190])
 by smtp.gmail.com with ESMTPSA id r38sm2315588otv.72.2022.02.18.16.25.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Feb 2022 16:25:41 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: qemu-devel@nongnu.org
Cc: Bin Meng <bmeng.cn@gmail.com>, Atish Patra <atishp@rivosinc.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org
Subject: [PATCH v5 06/12] target/riscv: Add support for hpmcounters/hpmevents
Date: Fri, 18 Feb 2022 16:25:12 -0800
Message-Id: <20220219002518.1936806-7-atishp@rivosinc.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220219002518.1936806-1-atishp@rivosinc.com>
References: <20220219002518.1936806-1-atishp@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::c2a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2a;
 envelope-from=atishp@rivosinc.com; helo=mail-oo1-xc2a.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-List-Received-Date: Sat, 19 Feb 2022 00:26:33 -0000

From: Atish Patra <atish.patra@wdc.com>

With SBI PMU extension, user can use any of the available hpmcounters to
track any perf events based on the value written to mhpmevent csr.
Add read/write functionality for these csrs.

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Signed-off-by: Atish Patra <atish.patra@wdc.com>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 target/riscv/cpu.h     |  11 +
 target/riscv/csr.c     | 466 +++++++++++++++++++++++++++--------------
 target/riscv/machine.c |   3 +
 3 files changed, 328 insertions(+), 152 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index ea3862ccbf5c..cce5c3538c89 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -109,6 +109,8 @@ typedef struct CPURISCVState CPURISCVState;
 #endif
 
 #define RV_VLEN_MAX 1024
+#define RV_MAX_MHPMEVENTS 29
+#define RV_MAX_MHPMCOUNTERS 32
 
 FIELD(VTYPE, VLMUL, 0, 3)
 FIELD(VTYPE, VSEW, 3, 3)
@@ -261,6 +263,15 @@ struct CPURISCVState {
 
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
index 2283ff33a5d7..dbb723a3307b 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -84,6 +84,15 @@ static RISCVException mctr(CPURISCVState *env, int csrno)
     return RISCV_EXCP_NONE;
 }
 
+static RISCVException mctr32(CPURISCVState *env, int csrno)
+{
+    if (riscv_cpu_mxl(env) != MXL_RV32) {
+        return RISCV_EXCP_ILLEGAL_INST;
+    }
+
+    return mctr(env, csrno);
+}
+
 static RISCVException ctr(CPURISCVState *env, int csrno)
 {
 #if !defined(CONFIG_USER_ONLY)
@@ -560,6 +569,72 @@ static RISCVException read_instreth(CPURISCVState *env, int csrno,
     return RISCV_EXCP_NONE;
 }
 
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
+    return RISCV_EXCP_NONE;
+}
+
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
@@ -3515,157 +3590,244 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     [CSR_SPMBASE] =    { "spmbase", pointer_masking, read_spmbase, write_spmbase },
 
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
index a34cc3f69c4b..042d655ce3ef 100644
--- a/target/riscv/machine.c
+++ b/target/riscv/machine.c
@@ -300,6 +300,9 @@ const VMStateDescription vmstate_riscv_cpu = {
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
2.30.2


