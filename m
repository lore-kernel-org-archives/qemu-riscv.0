Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nZiG9-0005Sf-Bx
	for mharc-qemu-riscv@gnu.org; Wed, 30 Mar 2022 20:01:53 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1nZiG5-0005JW-D4
 for qemu-riscv@nongnu.org; Wed, 30 Mar 2022 20:01:49 -0400
Received: from [2607:f8b0:4864:20::1032] (port=46623
 helo=mail-pj1-x1032.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1nZiG2-0005Vw-41
 for qemu-riscv@nongnu.org; Wed, 30 Mar 2022 20:01:49 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 bx24-20020a17090af49800b001c6872a9e4eso1862026pjb.5
 for <qemu-riscv@nongnu.org>; Wed, 30 Mar 2022 17:01:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Z6OqhqNkQzV2T2WXzzSg83GptfOA3k5J9zT03Gfp6t0=;
 b=yyxsMaPMt2NVe6WhSpJ6xFmch7yRr6Z2vBwIt/nUrV5l0ayrpfBhZ0MfOiPL/iwyGE
 HB55PL8waFOyjcTEW1fd81n6fO+p+DT0sH8MztwZt7cRW+DygJ0FbKea8rLEvYx2iz3Q
 GSw75EJttPaLCWiXOcYPi9w5q2JoPqf0wvTm+T7wo5Wv0Tamt0+YIzsIkEYV7MGtHWFg
 hDgDwufg5LrLx8ZVJw/VK+s4i3OFxIG3YImQ6LxyK/V30qIXUYgFgikC1m+7x3XkiTRj
 ax44WQvp8E/f4nPeCbpwyRy8mdxsFQ7cZAlxMcbuT2ROA0qQ9kTJD3H2Afvg+JOxNqoW
 kzQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Z6OqhqNkQzV2T2WXzzSg83GptfOA3k5J9zT03Gfp6t0=;
 b=QJM0V9vjKmUCJT6sW4C3NiHIMbzQsG2S/pmjcu8Iwh1szoHxOn7EMXe/gJWKeMQk77
 aZuATfJFnccGRuh8xA0w6V61OMEFUQFIlpkry7tBYVxrPa1srHkoG9WbxVOz2wpJuK8F
 GgzV1b+f9NuYeNoLjnayt+KIHoYJohEnjAjMltP3SaxjmNzN1bFUBm8GLjzf0oGk9ZIh
 mSpU5HhsoRFVxCGC6yNl3VKAoIdP0YpmQolzosilhBxCW1XKyJIjuku+Du7AzXnYRuDt
 GKnWYvnr6gZx1/8wCKgc9H3sg7I02+9npVCEwEKAe15i3vQVIwb471zaHYjLuUouMHMb
 4QYA==
X-Gm-Message-State: AOAM530dR/VrK3oY31r2A/MOlETRa/mAVoX1CDHASgF/nY4sCH2ZnfEL
 maXeeKuX5/EcKGPejtL9L/4dCw==
X-Google-Smtp-Source: ABdhPJxJCi0BWPP+U/fkPT8KidFCHcAUO+GzQdE8v72ZpP5cDa5TmJi0bOqr6jWLZgz6RvJi81IcPw==
X-Received: by 2002:a17:90a:b008:b0:1c7:8810:a08d with SMTP id
 x8-20020a17090ab00800b001c78810a08dmr2528230pjq.181.1648684904688; 
 Wed, 30 Mar 2022 17:01:44 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
 by smtp.gmail.com with ESMTPSA id
 ij17-20020a17090af81100b001c67c964d93sm8891669pjb.2.2022.03.30.17.01.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Mar 2022 17:01:44 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: qemu-devel@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 Atish Patra <atishp@rivosinc.com>, Bin Meng <bin.meng@windriver.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org
Subject: [PATCH v7 06/12] target/riscv: Add support for hpmcounters/hpmevents
Date: Wed, 30 Mar 2022 17:01:20 -0700
Message-Id: <20220331000127.2107823-7-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220331000127.2107823-1-atishp@rivosinc.com>
References: <20220331000127.2107823-1-atishp@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1032
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=atishp@rivosinc.com; helo=mail-pj1-x1032.google.com
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
X-List-Received-Date: Thu, 31 Mar 2022 00:01:49 -0000

From: Atish Patra <atish.patra@wdc.com>

With SBI PMU extension, user can use any of the available hpmcounters to
track any perf events based on the value written to mhpmevent csr.
Add read/write functionality for these csrs.

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Signed-off-by: Atish Patra <atish.patra@wdc.com>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 target/riscv/cpu.h     |  11 +
 target/riscv/csr.c     | 466 +++++++++++++++++++++++++++--------------
 target/riscv/machine.c |   3 +
 3 files changed, 328 insertions(+), 152 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index be826a19f68e..07db107054a6 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -111,6 +111,8 @@ typedef struct CPUArchState CPURISCVState;
 #endif
 
 #define RV_VLEN_MAX 1024
+#define RV_MAX_MHPMEVENTS 29
+#define RV_MAX_MHPMCOUNTERS 32
 
 FIELD(VTYPE, VLMUL, 0, 3)
 FIELD(VTYPE, VSEW, 3, 3)
@@ -271,6 +273,15 @@ struct CPUArchState {
 
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
index bc093406a1d5..f947a440568e 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -228,6 +228,15 @@ static RISCVException mctr(CPURISCVState *env, int csrno)
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
 static RISCVException any(CPURISCVState *env, int csrno)
 {
     return RISCV_EXCP_NONE;
@@ -593,6 +602,72 @@ static RISCVException read_timeh(CPURISCVState *env, int csrno,
 
 #else /* CONFIG_USER_ONLY */
 
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
 static RISCVException read_time(CPURISCVState *env, int csrno,
                                 target_ulong *val)
 {
@@ -3591,157 +3666,244 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
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
index 87cd55bfd3a7..99193c85bb97 100644
--- a/target/riscv/machine.c
+++ b/target/riscv/machine.c
@@ -331,6 +331,9 @@ const VMStateDescription vmstate_riscv_cpu = {
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
2.25.1


