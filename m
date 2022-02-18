Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nL6PW-00085G-23
	for mharc-qemu-riscv@gnu.org; Fri, 18 Feb 2022 11:47:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1nL6PV-00083R-0w; Fri, 18 Feb 2022 11:47:09 -0500
Received: from beetle.greensocs.com ([5.135.226.135]:48200)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1nL6PR-0007ZY-Sa; Fri, 18 Feb 2022 11:47:08 -0500
Received: from crumble.bar.greensocs.com (unknown [172.17.10.6])
 by beetle.greensocs.com (Postfix) with ESMTPS id 834672089E;
 Fri, 18 Feb 2022 16:47:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1645202824;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H4p+4KovWb/FJ5Zi+VtCTfrkAKtSSXwV+qbaQx93f+0=;
 b=TGUueIQgRUoWBihzKsvlHPLzUcNojs9+u5r/RE7AfOAk6YsOwPM5jkJTMMhw23Cg5P22g1
 xll8VmF+AE79mxY8ApLiGfbeXaNmpOdUrrrmBdRqzhDiQbe3wi+9e9C6xiqEGo6mzQz4ka
 of4ez8rYfF4hicWixO7W8YNzAYsM0Rc=
From: Damien Hedde <damien.hedde@greensocs.com>
To: qemu-devel@nongnu.org
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org, Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH 2/5] target/riscv: add riscv_cpu_release_claimed_interrupts
 function
Date: Fri, 18 Feb 2022 17:46:43 +0100
Message-Id: <20220218164646.132112-3-damien.hedde@greensocs.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220218164646.132112-1-damien.hedde@greensocs.com>
References: <20220218164646.132112-1-damien.hedde@greensocs.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam: Yes
Received-SPF: pass client-ip=5.135.226.135;
 envelope-from=damien.hedde@greensocs.com; helo=beetle.greensocs.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 18 Feb 2022 16:47:09 -0000

This function will be used to undo an interrupt claim made by
a previous call to riscv_cpu_claim_interrupts().

Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
---
 target/riscv/cpu.h        | 7 +++++++
 target/riscv/cpu_helper.c | 8 ++++++++
 2 files changed, 15 insertions(+)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 8183fb86d5..9f0c432053 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -469,6 +469,13 @@ void riscv_cpu_list(void);
 bool riscv_cpu_exec_interrupt(CPUState *cs, int interrupt_request);
 void riscv_cpu_swap_hypervisor_regs(CPURISCVState *env);
 int riscv_cpu_claim_interrupts(RISCVCPU *cpu, uint64_t interrupts);
+
+/*
+ * riscv_cpu_release_unclaimed_interrupts:
+ * Release previously claimed interrupts by riscv_cpu_claim_interrupts().
+ */
+void riscv_cpu_release_claimed_interrupts(RISCVCPU *cpu, uint64_t interrupts);
+
 uint64_t riscv_cpu_update_mip(RISCVCPU *cpu, uint64_t mask, uint64_t value);
 #define BOOL_TO_MASK(x) (-!!(x)) /* helper for riscv_cpu_update_mip value */
 void riscv_cpu_set_rdtime_fn(CPURISCVState *env, uint64_t (*fn)(uint32_t),
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 746335bfd6..170fed6dff 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -596,6 +596,14 @@ int riscv_cpu_claim_interrupts(RISCVCPU *cpu, uint64_t interrupts)
     }
 }
 
+void riscv_cpu_release_claimed_interrupts(RISCVCPU *cpu, uint64_t interrupts)
+{
+    CPURISCVState *env = &cpu->env;
+    /* ensure all claimed interrupt are really there */
+    g_assert((env->miclaim & interrupts) == interrupts);
+    env->miclaim &= ~interrupts;
+}
+
 uint64_t riscv_cpu_update_mip(RISCVCPU *cpu, uint64_t mask, uint64_t value)
 {
     CPURISCVState *env = &cpu->env;
-- 
2.35.1


