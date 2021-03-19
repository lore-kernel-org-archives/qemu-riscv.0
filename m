Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lNL4B-0006cu-C6
	for mharc-qemu-riscv@gnu.org; Fri, 19 Mar 2021 15:45:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=705762e65=atish.patra@wdc.com>)
 id 1lNL48-0006bZ-EF; Fri, 19 Mar 2021 15:45:48 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:41236)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=705762e65=atish.patra@wdc.com>)
 id 1lNL45-0004NN-Ix; Fri, 19 Mar 2021 15:45:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1616183145; x=1647719145;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WR+J6yckFv1viXuSKyjr7J9Q7cnHcBkLtXn3BFFV+ok=;
 b=Opys/+fgqoL58llvZQKdmpv2y/3o0NXLkI8ztQmwdbNXfQOkufRf6Z2/
 /7SFpZzGz90so3+wXwWfiY7RT4XO6owLeH9mwzj2HjL2A76AL4GuJQM+q
 zYRqKXT9zwD/JJFK09JwO43jcpJOFrnZ2fzfkbj6p9eC2JcDFtrvdoY6E
 kOK+Lsf+3NOsB+6gBg3NFS6Q4DU7kvG2E5jcaFN8Rjn6/zbJd57n1+Xac
 DqsHKp4QK8nFfrJETnuFOx7kuFoz4bk64nmsU05905UCL1Ni+9F8/jFnq
 myJ7qc2T8fcH1t2bCSE4U/1po4vb6KEhDzMpbj9L986AUtP7xH/Tk33y7 g==;
IronPort-SDR: M77SSqArd5UN4gyDA0dTO47acQ/cA67Bq9PPmrWma4OlzgtRB+1dPT3ubY/h+HSQHNA602a1Lr
 zorcL21gZXWyX8flfuvEAUfzRFD0LYza278XSnTxTVQi3Eo4EWuMbkhIX6qpOMF560cLYCX6lZ
 MwlmjyUTJ7M2c+Y7nx19WNiIILfKizEXdhYzqMloCM+ZWmj8ucM9YEtNUXZRSdXYiioUrP7NSh
 nXkPzRq3lrjBwsThxzn2Z4KT8UQWgh9ETIYyJ3rBiVU4r01pI1jY8BDerDNO/L+4DcaSziKMse
 XA4=
X-IronPort-AV: E=Sophos;i="5.81,262,1610380800"; d="scan'208";a="273319147"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 20 Mar 2021 03:45:41 +0800
IronPort-SDR: KkkLOqisNHF6qXcwmz0vy0lfnObkJkpa3Xz7gK0w4+OUxFv/uPdDw9t3ca/LBGvet7l71X2Xoe
 f3InSW93dVNgp6753zF/w5WBHU2HyADONt8lwSMrkIuSrNBX0WoX4+l32mSwn2VVIcG8jkiAzg
 pK1Eieh4QAIGqzlFELYguLywKA3OFiGa/X4ltVtJlD5DKJ9VotF7HIlSn8w08JB8z6MluJNHJr
 QmO7mNG+pAUBDwMfnX6h9znPDWUmEtnP1tXcSVgbGdGRvDgZcu95z8JtRErh7f3XEXNUwLgzmA
 EiakiwHf1ccV/ahsBdsyx50L
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2021 12:27:54 -0700
IronPort-SDR: Za3aLZ+pAblb1yk7AuQ/6SQqEWtxHJocVFMkgwtgrxJLNOqYYH/CB0agZ+vYeghHIPc4tGyzlF
 u/VS2m/6ACf+6AMImunRNhuH2eK/LT8izs8egKX0K/rJnKKhP3RS2QH+bqBXgxwrIrDeDaxw8G
 T2AoTZOtWN3Fj13a0xwcsTnSL+7shR8ZJC+JxV6U30weI1PQHcBDAXpIEIe+T/5HtyCAycp6jG
 FFR+fWSrv/315z/0UtYjSdAPqKzZi+6+/Dwd+ho7V5lt44iCims06s0WHtRr3ZTZ6VGkJtFuq1
 Tfo=
WDCIronportException: Internal
Received: from ind002560.ad.shared (HELO jedi-01.hgst.com) ([10.86.48.105])
 by uls-op-cesaip01.wdc.com with ESMTP; 19 Mar 2021 12:45:42 -0700
From: Atish Patra <atish.patra@wdc.com>
To: qemu-devel@nongnu.org
Cc: Atish Patra <atish.patra@wdc.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, anup.patel@wdc.com
Subject: [ RFC 1/6] target/riscv: Remove privilege v1.9 specific CSR related
 code
Date: Fri, 19 Mar 2021 12:45:29 -0700
Message-Id: <20210319194534.2082397-2-atish.patra@wdc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210319194534.2082397-1-atish.patra@wdc.com>
References: <20210319194534.2082397-1-atish.patra@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=705762e65=atish.patra@wdc.com; helo=esa1.hgst.iphmx.com
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
X-List-Received-Date: Fri, 19 Mar 2021 19:45:49 -0000

Qemu doesn't support RISC-V privilege specification v1.9. Remove the
remaining v1.9 specific references from the implementation.

Signed-off-by: Atish Patra <atish.patra@wdc.com>
---
 target/riscv/cpu.c        |  2 +-
 target/riscv/cpu.h        |  4 +---
 target/riscv/cpu_bits.h   | 23 ---------------------
 target/riscv/cpu_helper.c | 12 +++++------
 target/riscv/csr.c        | 43 ++++++++++-----------------------------
 target/riscv/machine.c    |  4 +---
 target/riscv/translate.c  |  4 ++--
 7 files changed, 22 insertions(+), 70 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index ddea8fbeeb39..c76e4c1a09c9 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -282,7 +282,7 @@ static void riscv_cpu_dump_state(CPUState *cs, FILE *f, int flags)
         qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "vscause ", env->vscause);
     }
     qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mtval ", env->mtval);
-    qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "stval ", env->sbadaddr);
+    qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "stval ", env->stval);
     if (riscv_has_ext(env, RVH)) {
         qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "htval ", env->htval);
         qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mtval2 ", env->mtval2);
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 0edb2826a27a..7bee351f3c99 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -163,10 +163,8 @@ struct CPURISCVState {
     target_ulong mie;
     target_ulong mideleg;
 
-    target_ulong sptbr;  /* until: priv-1.9.1 */
     target_ulong satp;   /* since: priv-1.10.0 */
-    target_ulong sbadaddr;
-    target_ulong mbadaddr;
+    target_ulong stval;
     target_ulong medeleg;
 
     target_ulong stvec;
diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index caf45992070a..b42dd4f8d8b1 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -153,12 +153,6 @@
 /* 32-bit only */
 #define CSR_MSTATUSH        0x310
 
-/* Legacy Counter Setup (priv v1.9.1) */
-/* Update to #define CSR_MCOUNTINHIBIT 0x320 for 1.11.0 */
-#define CSR_MUCOUNTEREN     0x320
-#define CSR_MSCOUNTEREN     0x321
-#define CSR_MHCOUNTEREN     0x322
-
 /* Machine Trap Handling */
 #define CSR_MSCRATCH        0x340
 #define CSR_MEPC            0x341
@@ -166,9 +160,6 @@
 #define CSR_MTVAL           0x343
 #define CSR_MIP             0x344
 
-/* Legacy Machine Trap Handling (priv v1.9.1) */
-#define CSR_MBADADDR        0x343
-
 /* Supervisor Trap Setup */
 #define CSR_SSTATUS         0x100
 #define CSR_SEDELEG         0x102
@@ -184,9 +175,6 @@
 #define CSR_STVAL           0x143
 #define CSR_SIP             0x144
 
-/* Legacy Supervisor Trap Handling (priv v1.9.1) */
-#define CSR_SBADADDR        0x143
-
 /* Supervisor Protection and Translation */
 #define CSR_SPTBR           0x180
 #define CSR_SATP            0x180
@@ -354,14 +342,6 @@
 #define CSR_MHPMCOUNTER30H  0xb9e
 #define CSR_MHPMCOUNTER31H  0xb9f
 
-/* Legacy Machine Protection and Translation (priv v1.9.1) */
-#define CSR_MBASE           0x380
-#define CSR_MBOUND          0x381
-#define CSR_MIBASE          0x382
-#define CSR_MIBOUND         0x383
-#define CSR_MDBASE          0x384
-#define CSR_MDBOUND         0x385
-
 /* mstatus CSR bits */
 #define MSTATUS_UIE         0x00000001
 #define MSTATUS_SIE         0x00000002
@@ -375,10 +355,8 @@
 #define MSTATUS_FS          0x00006000
 #define MSTATUS_XS          0x00018000
 #define MSTATUS_MPRV        0x00020000
-#define MSTATUS_PUM         0x00040000 /* until: priv-1.9.1 */
 #define MSTATUS_SUM         0x00040000 /* since: priv-1.10 */
 #define MSTATUS_MXR         0x00080000
-#define MSTATUS_VM          0x1F000000 /* until: priv-1.9.1 */
 #define MSTATUS_TVM         0x00100000 /* since: priv-1.10 */
 #define MSTATUS_TW          0x00200000 /* since: priv-1.10 */
 #define MSTATUS_TSR         0x00400000 /* since: priv-1.10 */
@@ -416,7 +394,6 @@
 #define SSTATUS_SPP         0x00000100
 #define SSTATUS_FS          0x00006000
 #define SSTATUS_XS          0x00018000
-#define SSTATUS_PUM         0x00040000 /* until: priv-1.9.1 */
 #define SSTATUS_SUM         0x00040000 /* since: priv-1.10 */
 #define SSTATUS_MXR         0x00080000
 
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 2f43939fb6d4..bb0a709c9cab 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -136,8 +136,8 @@ void riscv_cpu_swap_hypervisor_regs(CPURISCVState *env)
         env->vscause = env->scause;
         env->scause = env->scause_hs;
 
-        env->vstval = env->sbadaddr;
-        env->sbadaddr = env->stval_hs;
+        env->vstval = env->stval;
+        env->stval = env->stval_hs;
 
         env->vsatp = env->satp;
         env->satp = env->satp_hs;
@@ -159,8 +159,8 @@ void riscv_cpu_swap_hypervisor_regs(CPURISCVState *env)
         env->scause_hs = env->scause;
         env->scause = env->vscause;
 
-        env->stval_hs = env->sbadaddr;
-        env->sbadaddr = env->vstval;
+        env->stval_hs = env->stval;
+        env->stval = env->vstval;
 
         env->satp_hs = env->satp;
         env->satp = env->vsatp;
@@ -972,7 +972,7 @@ void riscv_cpu_do_interrupt(CPUState *cs)
         env->mstatus = s;
         env->scause = cause | ((target_ulong)async << (TARGET_LONG_BITS - 1));
         env->sepc = env->pc;
-        env->sbadaddr = tval;
+        env->stval = tval;
         env->htval = htval;
         env->pc = (env->stvec >> 2 << 2) +
             ((async && (env->stvec & 3) == 1) ? cause * 4 : 0);
@@ -1003,7 +1003,7 @@ void riscv_cpu_do_interrupt(CPUState *cs)
         env->mstatus = s;
         env->mcause = cause | ~(((target_ulong)-1) >> async);
         env->mepc = env->pc;
-        env->mbadaddr = tval;
+        env->mtval = tval;
         env->mtval2 = mtval2;
         env->pc = (env->mtvec >> 2 << 2) +
             ((async && (env->mtvec & 3) == 1) ? cause * 4 : 0);
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index fd2e6363f397..7166f8d710a8 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -643,26 +643,6 @@ static int write_mcounteren(CPURISCVState *env, int csrno, target_ulong val)
     return 0;
 }
 
-/* This regiser is replaced with CSR_MCOUNTINHIBIT in 1.11.0 */
-static int read_mscounteren(CPURISCVState *env, int csrno, target_ulong *val)
-{
-    if (env->priv_ver < PRIV_VERSION_1_11_0) {
-        return -RISCV_EXCP_ILLEGAL_INST;
-    }
-    *val = env->mcounteren;
-    return 0;
-}
-
-/* This regiser is replaced with CSR_MCOUNTINHIBIT in 1.11.0 */
-static int write_mscounteren(CPURISCVState *env, int csrno, target_ulong val)
-{
-    if (env->priv_ver < PRIV_VERSION_1_11_0) {
-        return -RISCV_EXCP_ILLEGAL_INST;
-    }
-    env->mcounteren = val;
-    return 0;
-}
-
 /* Machine Trap Handling */
 static int read_mscratch(CPURISCVState *env, int csrno, target_ulong *val)
 {
@@ -700,15 +680,15 @@ static int write_mcause(CPURISCVState *env, int csrno, target_ulong val)
     return 0;
 }
 
-static int read_mbadaddr(CPURISCVState *env, int csrno, target_ulong *val)
+static int read_mtval(CPURISCVState *env, int csrno, target_ulong *val)
 {
-    *val = env->mbadaddr;
+    *val = env->mtval;
     return 0;
 }
 
-static int write_mbadaddr(CPURISCVState *env, int csrno, target_ulong val)
+static int write_mtval(CPURISCVState *env, int csrno, target_ulong val)
 {
-    env->mbadaddr = val;
+    env->mtval = val;
     return 0;
 }
 
@@ -840,18 +820,19 @@ static int write_scause(CPURISCVState *env, int csrno, target_ulong val)
     return 0;
 }
 
-static int read_sbadaddr(CPURISCVState *env, int csrno, target_ulong *val)
+static int read_stval(CPURISCVState *env, int csrno, target_ulong *val)
 {
-    *val = env->sbadaddr;
+    *val = env->stval;
     return 0;
 }
 
-static int write_sbadaddr(CPURISCVState *env, int csrno, target_ulong val)
+static int write_stval(CPURISCVState *env, int csrno, target_ulong val)
 {
-    env->sbadaddr = val;
+    env->stval = val;
     return 0;
 }
 
+
 static int rmw_sip(CPURISCVState *env, int csrno, target_ulong *ret_value,
                    target_ulong new_value, target_ulong write_mask)
 {
@@ -1418,13 +1399,11 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
 
     [CSR_MSTATUSH]    = { "mstatush",   any32, read_mstatush,    write_mstatush    },
 
-    [CSR_MSCOUNTEREN] = { "msounteren", any,   read_mscounteren, write_mscounteren },
-
     /* Machine Trap Handling */
     [CSR_MSCRATCH] = { "mscratch", any,  read_mscratch, write_mscratch },
     [CSR_MEPC]     = { "mepc",     any,  read_mepc,     write_mepc     },
     [CSR_MCAUSE]   = { "mcause",   any,  read_mcause,   write_mcause   },
-    [CSR_MBADADDR] = { "mbadaddr", any,  read_mbadaddr, write_mbadaddr },
+    [CSR_MTVAL]    = { "mtval",    any,  read_mtval,    write_mtval    },
     [CSR_MIP]      = { "mip",      any,  NULL,    NULL, rmw_mip        },
 
     /* Supervisor Trap Setup */
@@ -1437,7 +1416,7 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     [CSR_SSCRATCH] = { "sscratch", smode, read_sscratch, write_sscratch },
     [CSR_SEPC]     = { "sepc",     smode, read_sepc,     write_sepc     },
     [CSR_SCAUSE]   = { "scause",   smode, read_scause,   write_scause   },
-    [CSR_SBADADDR] = { "sbadaddr", smode, read_sbadaddr, write_sbadaddr },
+    [CSR_STVAL]    = { "stval",    smode, read_stval,   write_stval   },
     [CSR_SIP]      = { "sip",      smode, NULL,    NULL, rmw_sip        },
 
     /* Supervisor Protection and Translation */
diff --git a/target/riscv/machine.c b/target/riscv/machine.c
index 44d4015bd675..27fcc770aa4b 100644
--- a/target/riscv/machine.c
+++ b/target/riscv/machine.c
@@ -165,10 +165,8 @@ const VMStateDescription vmstate_riscv_cpu = {
         VMSTATE_UINT32(env.miclaim, RISCVCPU),
         VMSTATE_UINTTL(env.mie, RISCVCPU),
         VMSTATE_UINTTL(env.mideleg, RISCVCPU),
-        VMSTATE_UINTTL(env.sptbr, RISCVCPU),
         VMSTATE_UINTTL(env.satp, RISCVCPU),
-        VMSTATE_UINTTL(env.sbadaddr, RISCVCPU),
-        VMSTATE_UINTTL(env.mbadaddr, RISCVCPU),
+        VMSTATE_UINTTL(env.stval, RISCVCPU),
         VMSTATE_UINTTL(env.medeleg, RISCVCPU),
         VMSTATE_UINTTL(env.stvec, RISCVCPU),
         VMSTATE_UINTTL(env.sepc, RISCVCPU),
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 0f28b5f41e4f..1740be3d4bd9 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -130,7 +130,7 @@ static void generate_exception(DisasContext *ctx, int excp)
     ctx->base.is_jmp = DISAS_NORETURN;
 }
 
-static void generate_exception_mbadaddr(DisasContext *ctx, int excp)
+static void generate_exception_mtval(DisasContext *ctx, int excp)
 {
     tcg_gen_movi_tl(cpu_pc, ctx->base.pc_next);
     tcg_gen_st_tl(cpu_pc, cpu_env, offsetof(CPURISCVState, badaddr));
@@ -174,7 +174,7 @@ static void gen_exception_illegal(DisasContext *ctx)
 
 static void gen_exception_inst_addr_mis(DisasContext *ctx)
 {
-    generate_exception_mbadaddr(ctx, RISCV_EXCP_INST_ADDR_MIS);
+    generate_exception_mtval(ctx, RISCV_EXCP_INST_ADDR_MIS);
 }
 
 static inline bool use_goto_tb(DisasContext *ctx, target_ulong dest)
-- 
2.25.1


