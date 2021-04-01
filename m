Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lRtbh-0003uy-95
	for mharc-qemu-riscv@gnu.org; Thu, 01 Apr 2021 05:27:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lRtbf-0003rK-Mu
 for qemu-riscv@nongnu.org; Thu, 01 Apr 2021 05:27:15 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:42919)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lRtbc-0000fl-EI
 for qemu-riscv@nongnu.org; Thu, 01 Apr 2021 05:27:15 -0400
Received: by mail-pf1-x431.google.com with SMTP id 11so987207pfn.9
 for <qemu-riscv@nongnu.org>; Thu, 01 Apr 2021 02:27:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=w+sxb2pmXx2NKUNxTUJUqBUs0FQUfA8tBTXis1GCdoI=;
 b=IhD+kcduQSaKJ53ewRhUW5qeN1dcW8NRqvtcslxk44pMGsGpXIvV+lNzCveHQty7ke
 dVX032ZNN8wbv77O1aj6ovxnmifnv6TPoj4+Qqo6EQSkEHd5NjjSU7cgPNjZkzpv+NvL
 c0wB/OP8+cit6/si+PDBlytKpWX/4Qo7oE1FmyzzM1NYwowtYx4zNArg0GRZhgiXyV6+
 qUrsTF3fNgQg9qziPBbXDYqhBa63gaymwEpWdwT6oTp+4ClUd6MqHYIuPAXeFMuoFZ+w
 Ns0bOVn3jCOQth4d+uLN9ovFd+xVkoDNzXE3fkfIppL4t0J6Ld38DfkJSOtPfj3wAj1C
 1OcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=w+sxb2pmXx2NKUNxTUJUqBUs0FQUfA8tBTXis1GCdoI=;
 b=cNTVDXV7fWYwdPYzThaoKPswA7RfRw/bI/vRqS42CG8i5eSOzv8UzlDP4zFX/cEfzg
 aJqVdiKYrsHZRKouqT/r56NdJxp6i3lKWdgBm0vj2QJWB1DlzI+VZqVhgHpXmBvttVCL
 8d5me8nczFpaXK5guoYd48xaaJQTVfX/024SnQwqNCdLtLyEVMuIAwI9uwu52netrGn1
 fqJP6N0eNDv/uW/eF0mZN23HU0RnaI9JZLqmyQ7mTjBhU4wMFXj5r4uyHggLRX0/LAdY
 uy7Ue4NYgoJ30MPNQew1p+/Eo18nBnvRt4J89c31tEMHCkk7BA82urIczu252p0/LNh1
 HLSQ==
X-Gm-Message-State: AOAM531fCI2jJAoNWHtpGsodJkUxpG6YQcJBlIiDjoWYz3gvSvYb6dG1
 zqGnGgK4cdBJ9d8dBG/JhSVYAA==
X-Google-Smtp-Source: ABdhPJy5RYF3QRkILgdlyZOaHui6ssblsvayBfDhD/0o6lEEkGdjmaMT6PchHPyF3Lwvd4nkSZT3FA==
X-Received: by 2002:a63:2214:: with SMTP id i20mr6551391pgi.189.1617269231183; 
 Thu, 01 Apr 2021 02:27:11 -0700 (PDT)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id i7sm4751319pgq.16.2021.04.01.02.27.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Apr 2021 02:27:10 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Subject: [RFC v2 2/4] target/riscv: add RNMI CSRs
Date: Thu,  1 Apr 2021 17:26:49 +0800
Message-Id: <20210401092659.12014-3-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210401092659.12014-1-frank.chang@sifive.com>
References: <20210401092659.12014-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Thu, 01 Apr 2021 09:27:16 -0000

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/cpu.h      |  4 +++
 target/riscv/cpu_bits.h |  9 +++++++
 target/riscv/csr.c      | 59 +++++++++++++++++++++++++++++++++++++++++
 3 files changed, 72 insertions(+)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 7d2bb7e7003..674ee4dc999 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -180,6 +180,10 @@ struct CPURISCVState {
     target_ulong mtval;  /* since: priv-1.10.0 */
 
     /* NMI */
+    target_ulong mnscratch;
+    target_ulong mnepc;
+    target_ulong mncause; /* mncause without bit XLEN-1 set to 1 */
+    target_ulong mnstatus;
     bool nmie;
     target_ulong nmip;
     target_ulong rnmi_irqvec;
diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index 8e5f0be599a..a376ede0cc5 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -166,6 +166,12 @@
 #define CSR_MTVAL           0x343
 #define CSR_MIP             0x344
 
+/* NMI */
+#define CSR_MNSCRATCH       0x350
+#define CSR_MNEPC           0x351
+#define CSR_MNCAUSE         0x352
+#define CSR_MNSTATUS        0x353
+
 /* Legacy Machine Trap Handling (priv v1.9.1) */
 #define CSR_MBADADDR        0x343
 
@@ -558,6 +564,9 @@
 #define RISCV_EXCP_INT_FLAG                0x80000000
 #define RISCV_EXCP_INT_MASK                0x7fffffff
 
+/* RNMI mnstatus CSR mask */
+#define MNSTATUS_MPP                       MSTATUS_MPP
+
 /* Interrupt causes */
 #define IRQ_U_SOFT                         0
 #define IRQ_S_SOFT                         1
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index d2585395bfb..489d6d90e68 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -188,6 +188,11 @@ static int pmp(CPURISCVState *env, int csrno)
 {
     return -!riscv_feature(env, RISCV_FEATURE_PMP);
 }
+
+static int nmi(CPURISCVState *env, int csrno)
+{
+    return -!riscv_feature(env, RISCV_FEATURE_RNMI);
+}
 #endif
 
 /* User Floating-Point CSRs */
@@ -713,6 +718,54 @@ static int write_mbadaddr(CPURISCVState *env, int csrno, target_ulong val)
     return 0;
 }
 
+static int read_mnscratch(CPURISCVState *env, int csrno, target_ulong *val)
+{
+    *val = env->mnscratch;
+    return 0;
+}
+
+static int write_mnscratch(CPURISCVState *env, int csrno, target_ulong val)
+{
+    env->mnscratch = val;
+    return 0;
+}
+
+static int read_mnepc(CPURISCVState *env, int csrno, target_ulong *val)
+{
+    *val = env->mnepc;
+    return 0;
+}
+
+static int write_mnepc(CPURISCVState *env, int csrno, target_ulong val)
+{
+    env->mnepc = val;
+    return 0;
+}
+
+static int read_mncause(CPURISCVState *env, int csrno, target_ulong *val)
+{
+    *val = env->mncause;
+    return 0;
+}
+
+static int write_mncause(CPURISCVState *env, int csrno, target_ulong val)
+{
+    env->mncause = val;
+    return 0;
+}
+
+static int read_mnstatus(CPURISCVState *env, int csrno, target_ulong *val)
+{
+    *val = env->mnstatus;
+    return 0;
+}
+
+static int write_mnstatus(CPURISCVState *env, int csrno, target_ulong val)
+{
+    env->mnstatus = val & MNSTATUS_MPP;
+    return 0;
+}
+
 static int rmw_mip(CPURISCVState *env, int csrno, target_ulong *ret_value,
                    target_ulong new_value, target_ulong write_mask)
 {
@@ -1428,6 +1481,12 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     [CSR_MBADADDR] = { "mbadaddr", any,  read_mbadaddr, write_mbadaddr },
     [CSR_MIP]      = { "mip",      any,  NULL,    NULL, rmw_mip        },
 
+    /* NMI */
+    [CSR_MNSCRATCH] = { "mnscratch", nmi, read_mnscratch, write_mnscratch },
+    [CSR_MNEPC]     = { "mnepc",     nmi, read_mnepc,     write_mnepc     },
+    [CSR_MNCAUSE]   = { "mncause",   nmi, read_mncause,   write_mncause   },
+    [CSR_MNSTATUS]  = { "mnstatus",  nmi, read_mnstatus,  write_mnstatus  },
+
     /* Supervisor Trap Setup */
     [CSR_SSTATUS]    = { "sstatus",    smode, read_sstatus,    write_sstatus    },
     [CSR_SIE]        = { "sie",        smode, read_sie,        write_sie        },
-- 
2.17.1


