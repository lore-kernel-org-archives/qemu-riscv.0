Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h6EU6-0007i8-Sa
	for mharc-qemu-riscv@gnu.org; Tue, 19 Mar 2019 09:08:50 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45307)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1h6EU0-0007Uw-3E
	for qemu-riscv@nongnu.org; Tue, 19 Mar 2019 09:08:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1h6EGa-0005I3-JA
	for qemu-riscv@nongnu.org; Tue, 19 Mar 2019 08:54:53 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:41606)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1h6EGa-0005H0-9X
	for qemu-riscv@nongnu.org; Tue, 19 Mar 2019 08:54:52 -0400
Received: by mail-pf1-x42b.google.com with SMTP id d25so13610425pfn.8
	for <qemu-riscv@nongnu.org>; Tue, 19 Mar 2019 05:54:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding:cc:from:to;
	bh=TAki/+aV92Fo4+cWrzg4Cw7+O5/hrEoiGd+Hur4B4Cg=;
	b=GcbeYO7xUEHgQea7+fpGW2ywNgWEJKeZi1NiNP+R6rmdhDR6aTRMAQWgT+4O2Ibbss
	3/P3AOL/eTq0UEKLA0r7o3LzB0/1oylw0glgEQCAqYcAgynpoBPLcxU2t/ljemBwgVla
	rSJjT58v+NrXXET6D+NWmMtM3LvnL8AP9tlhgQqqWDALqEVb8X1ZeO5n247kdmiTURpA
	xNlfC+A8DRfYC+IqZ50v0/zVV572OVBfCscYGXnNsgDfkMjSF+nmQUQA+PcQJ6aje/u2
	KN5rxJBbe/mUWu/IASU8SzPTVBqcAhZ6h9XLrGE8JgWsvyPiJUGk5Mktl4olU6k+hJo4
	66KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:cc:from:to;
	bh=TAki/+aV92Fo4+cWrzg4Cw7+O5/hrEoiGd+Hur4B4Cg=;
	b=uk7qNBk/o0PDJULWBjTTIyutO886bEIx+S8qfS/Q3aI3IroCZnSlzcmoGWiHCeMLrM
	ljW5NfMR2iKLmYEPpX0Zo0PFe37jZmBgNx8cCTkbJlxV0ZLtaPRv1pQy8LbxEDnmFi2T
	kFsnWmsPLG9BtfER1Qje8hIQtT/0VQ9zXCGLP+mzChBWnYOq213zQVsgHriCxb0Ig90v
	m2NU8pUqIV33hyuD0zShImNXK5ePkGCuT3T8LtO7LtiDIyOcAv5z7IENiUf+NZAnvpve
	TkxtWiBWOjvTpTnL3xywh4OF9WF6UyPBd7RPELsSkDYdG017LO1/Tda7bxN6ClvzNQxY
	sr9g==
X-Gm-Message-State: APjAAAVkcWL7KFGQTi+sDFCV8lb45PR3KsxjjJ/6IYUWIobr/7rxBxc7
	6r6m/djwST1gdFlL9m4Rxnh6blDpcaG8D2US
X-Google-Smtp-Source: APXvYqyrppCcizxTinQwErkXc2JDW5XcLzLT4NGrUnOtDGBG1/+VIM/lAP2wexO9/gWjlyEMHFJMAw==
X-Received: by 2002:a63:614c:: with SMTP id v73mr7960094pgb.395.1553000091064; 
	Tue, 19 Mar 2019 05:54:51 -0700 (PDT)
Received: from localhost
	(2001-b011-7001-1cad-363a-ebbe-dac8-3f4c.dynamic-ip6.hinet.net.
	[2001:b011:7001:1cad:363a:ebbe:dac8:3f4c])
	by smtp.gmail.com with ESMTPSA id
	j14sm19662348pfn.77.2019.03.19.05.54.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 19 Mar 2019 05:54:50 -0700 (PDT)
Date: Tue, 19 Mar 2019 05:47:57 -0700
Message-Id: <20190319124803.13826-14-palmer@sifive.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20190319124803.13826-1-palmer@sifive.com>
References: <20190319124803.13826-1-palmer@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,       qemu-devel@nongnu.org,
	Michael Clark <mjc@sifive.com>, Palmer Dabbelt <palmer@sifive.com>,
	Alistair Francis <Alistair.Francis@wdc.com>,
	Alistair Francis <alistair.francis@wdc.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::42b
Subject: [Qemu-riscv] [PULL 13/19] RISC-V: Add support for vectored
 interrupts
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
X-List-Received-Date: Tue, 19 Mar 2019 13:08:47 -0000

From: Michael Clark <mjc@sifive.com>

If vectored interrupts are enabled (bits[1:0]
of mtvec/stvec == 1) then use the following
logic for trap entry address calculation:

 pc = mtvec + cause * 4

In addition to adding support for vectored interrupts
this patch simplifies the interrupt delivery logic
by making sync/async cause decoding and encoding
steps distinct.

The cause code and the sign bit indicating sync/async
is split at the beginning of the function and fixed
cause is renamed to cause. The MSB setting for async
traps is delayed until setting mcause/scause to allow
redundant variables to be eliminated. Some variables
are renamed for conciseness and moved so that decls
are at the start of the block.

Cc: Palmer Dabbelt <palmer@sifive.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>
Signed-off-by: Michael Clark <mjc@sifive.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 target/riscv/cpu_helper.c | 145 ++++++++++++++------------------------
 target/riscv/csr.c        |  12 ++--
 2 files changed, 60 insertions(+), 97 deletions(-)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 073bdcfe7410..a02f4dad8c00 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -454,118 +454,81 @@ void riscv_cpu_do_interrupt(CPUState *cs)
     RISCVCPU *cpu = RISCV_CPU(cs);
     CPURISCVState *env = &cpu->env;
 
-    if (RISCV_DEBUG_INTERRUPT) {
-        int log_cause = cs->exception_index & RISCV_EXCP_INT_MASK;
-        if (cs->exception_index & RISCV_EXCP_INT_FLAG) {
-            qemu_log_mask(LOG_TRACE, "core "
-                TARGET_FMT_ld ": trap %s, epc 0x" TARGET_FMT_lx "\n",
-                env->mhartid, riscv_intr_names[log_cause], env->pc);
-        } else {
-            qemu_log_mask(LOG_TRACE, "core "
-                TARGET_FMT_ld ": intr %s, epc 0x" TARGET_FMT_lx "\n",
-                env->mhartid, riscv_excp_names[log_cause], env->pc);
+    /* cs->exception is 32-bits wide unlike mcause which is XLEN-bits wide
+     * so we mask off the MSB and separate into trap type and cause.
+     */
+    bool async = !!(cs->exception_index & RISCV_EXCP_INT_FLAG);
+    target_ulong cause = cs->exception_index & RISCV_EXCP_INT_MASK;
+    target_ulong deleg = async ? env->mideleg : env->medeleg;
+    target_ulong tval = 0;
+
+    static const int ecall_cause_map[] = {
+        [PRV_U] = RISCV_EXCP_U_ECALL,
+        [PRV_S] = RISCV_EXCP_S_ECALL,
+        [PRV_H] = RISCV_EXCP_H_ECALL,
+        [PRV_M] = RISCV_EXCP_M_ECALL
+    };
+
+    if (!async) {
+        /* set tval to badaddr for traps with address information */
+        switch (cause) {
+        case RISCV_EXCP_INST_ADDR_MIS:
+        case RISCV_EXCP_INST_ACCESS_FAULT:
+        case RISCV_EXCP_LOAD_ADDR_MIS:
+        case RISCV_EXCP_STORE_AMO_ADDR_MIS:
+        case RISCV_EXCP_LOAD_ACCESS_FAULT:
+        case RISCV_EXCP_STORE_AMO_ACCESS_FAULT:
+        case RISCV_EXCP_INST_PAGE_FAULT:
+        case RISCV_EXCP_LOAD_PAGE_FAULT:
+        case RISCV_EXCP_STORE_PAGE_FAULT:
+            tval = env->badaddr;
+            break;
+        default:
+            break;
         }
-    }
-
-    target_ulong fixed_cause = 0;
-    if (cs->exception_index & (RISCV_EXCP_INT_FLAG)) {
-        /* hacky for now. the MSB (bit 63) indicates interrupt but cs->exception
-           index is only 32 bits wide */
-        fixed_cause = cs->exception_index & RISCV_EXCP_INT_MASK;
-        fixed_cause |= ((target_ulong)1) << (TARGET_LONG_BITS - 1);
-    } else {
-        /* fixup User ECALL -> correct priv ECALL */
-        if (cs->exception_index == RISCV_EXCP_U_ECALL) {
-            switch (env->priv) {
-            case PRV_U:
-                fixed_cause = RISCV_EXCP_U_ECALL;
-                break;
-            case PRV_S:
-                fixed_cause = RISCV_EXCP_S_ECALL;
-                break;
-            case PRV_H:
-                fixed_cause = RISCV_EXCP_H_ECALL;
-                break;
-            case PRV_M:
-                fixed_cause = RISCV_EXCP_M_ECALL;
-                break;
-            }
-        } else {
-            fixed_cause = cs->exception_index;
+        /* ecall is dispatched as one cause so translate based on mode */
+        if (cause == RISCV_EXCP_U_ECALL) {
+            assert(env->priv <= 3);
+            cause = ecall_cause_map[env->priv];
         }
     }
 
-    target_ulong backup_epc = env->pc;
-
-    target_ulong bit = fixed_cause;
-    target_ulong deleg = env->medeleg;
-
-    int hasbadaddr =
-        (fixed_cause == RISCV_EXCP_INST_ADDR_MIS) ||
-        (fixed_cause == RISCV_EXCP_INST_ACCESS_FAULT) ||
-        (fixed_cause == RISCV_EXCP_LOAD_ADDR_MIS) ||
-        (fixed_cause == RISCV_EXCP_STORE_AMO_ADDR_MIS) ||
-        (fixed_cause == RISCV_EXCP_LOAD_ACCESS_FAULT) ||
-        (fixed_cause == RISCV_EXCP_STORE_AMO_ACCESS_FAULT) ||
-        (fixed_cause == RISCV_EXCP_INST_PAGE_FAULT) ||
-        (fixed_cause == RISCV_EXCP_LOAD_PAGE_FAULT) ||
-        (fixed_cause == RISCV_EXCP_STORE_PAGE_FAULT);
-
-    if (bit & ((target_ulong)1 << (TARGET_LONG_BITS - 1))) {
-        deleg = env->mideleg;
-        bit &= ~((target_ulong)1 << (TARGET_LONG_BITS - 1));
+    if (RISCV_DEBUG_INTERRUPT) {
+        qemu_log_mask(LOG_TRACE, "core " TARGET_FMT_ld ": %s %s, "
+            "epc 0x" TARGET_FMT_lx ": tval 0x" TARGET_FMT_lx "\n",
+            env->mhartid, async ? "intr" : "trap",
+            (async ? riscv_intr_names : riscv_excp_names)[cause],
+            env->pc, tval);
     }
 
-    if (env->priv <= PRV_S && bit < 64 && ((deleg >> bit) & 1)) {
+    if (env->priv <= PRV_S &&
+            cause < TARGET_LONG_BITS && ((deleg >> cause) & 1)) {
         /* handle the trap in S-mode */
-        /* No need to check STVEC for misaligned - lower 2 bits cannot be set */
-        env->pc = env->stvec;
-        env->scause = fixed_cause;
-        env->sepc = backup_epc;
-
-        if (hasbadaddr) {
-            if (RISCV_DEBUG_INTERRUPT) {
-                qemu_log_mask(LOG_TRACE, "core " TARGET_FMT_ld ": badaddr 0x"
-                    TARGET_FMT_lx "\n", env->mhartid, env->badaddr);
-            }
-            env->sbadaddr = env->badaddr;
-        } else {
-            /* otherwise we must clear sbadaddr/stval
-             * todo: support populating stval on illegal instructions */
-            env->sbadaddr = 0;
-        }
-
         target_ulong s = env->mstatus;
         s = set_field(s, MSTATUS_SPIE, env->priv_ver >= PRIV_VERSION_1_10_0 ?
             get_field(s, MSTATUS_SIE) : get_field(s, MSTATUS_UIE << env->priv));
         s = set_field(s, MSTATUS_SPP, env->priv);
         s = set_field(s, MSTATUS_SIE, 0);
         env->mstatus = s;
+        env->scause = cause | ~(((target_ulong)-1) >> async);
+        env->sepc = env->pc;
+        env->sbadaddr = tval;
+        env->pc = (env->stvec >> 2 << 2) +
+            ((async && (env->stvec & 3) == 1) ? cause * 4 : 0);
         riscv_cpu_set_mode(env, PRV_S);
     } else {
-        /* No need to check MTVEC for misaligned - lower 2 bits cannot be set */
-        env->pc = env->mtvec;
-        env->mepc = backup_epc;
-        env->mcause = fixed_cause;
-
-        if (hasbadaddr) {
-            if (RISCV_DEBUG_INTERRUPT) {
-                qemu_log_mask(LOG_TRACE, "core " TARGET_FMT_ld ": badaddr 0x"
-                    TARGET_FMT_lx "\n", env->mhartid, env->badaddr);
-            }
-            env->mbadaddr = env->badaddr;
-        } else {
-            /* otherwise we must clear mbadaddr/mtval
-             * todo: support populating mtval on illegal instructions */
-            env->mbadaddr = 0;
-        }
-
+        /* handle the trap in M-mode */
         target_ulong s = env->mstatus;
         s = set_field(s, MSTATUS_MPIE, env->priv_ver >= PRIV_VERSION_1_10_0 ?
             get_field(s, MSTATUS_MIE) : get_field(s, MSTATUS_UIE << env->priv));
         s = set_field(s, MSTATUS_MPP, env->priv);
         s = set_field(s, MSTATUS_MIE, 0);
         env->mstatus = s;
+        env->mcause = cause | ~(((target_ulong)-1) >> async);
+        env->mepc = env->pc;
+        env->mbadaddr = tval;
+        env->pc = (env->mtvec >> 2 << 2) +
+            ((async && (env->mtvec & 3) == 1) ? cause * 4 : 0);
         riscv_cpu_set_mode(env, PRV_M);
     }
     /* TODO yield load reservation  */
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 385bb38768d0..e1d91b6c6049 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -435,10 +435,10 @@ static int read_mtvec(CPURISCVState *env, int csrno, target_ulong *val)
 static int write_mtvec(CPURISCVState *env, int csrno, target_ulong val)
 {
     /* bits [1:0] encode mode; 0 = direct, 1 = vectored, 2 >= reserved */
-    if ((val & 3) == 0) {
-        env->mtvec = val >> 2 << 2;
+    if ((val & 3) < 2) {
+        env->mtvec = val;
     } else {
-        qemu_log_mask(LOG_UNIMP, "CSR_MTVEC: vectored traps not supported");
+        qemu_log_mask(LOG_UNIMP, "CSR_MTVEC: reserved mode not supported\n");
     }
     return 0;
 }
@@ -607,10 +607,10 @@ static int read_stvec(CPURISCVState *env, int csrno, target_ulong *val)
 static int write_stvec(CPURISCVState *env, int csrno, target_ulong val)
 {
     /* bits [1:0] encode mode; 0 = direct, 1 = vectored, 2 >= reserved */
-    if ((val & 3) == 0) {
-        env->stvec = val >> 2 << 2;
+    if ((val & 3) < 2) {
+        env->stvec = val;
     } else {
-        qemu_log_mask(LOG_UNIMP, "CSR_STVEC: vectored traps not supported");
+        qemu_log_mask(LOG_UNIMP, "CSR_STVEC: reserved mode not supported\n");
     }
     return 0;
 }
-- 
2.19.2


