Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iO91D-0005Dq-A1
	for mharc-qemu-riscv@gnu.org; Fri, 25 Oct 2019 19:29:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49674)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <prvs=194c68654=alistair.francis@wdc.com>)
 id 1iO90u-00054M-GP
 for qemu-riscv@nongnu.org; Fri, 25 Oct 2019 19:29:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <prvs=194c68654=alistair.francis@wdc.com>)
 id 1iO90s-0004Gr-1n
 for qemu-riscv@nongnu.org; Fri, 25 Oct 2019 19:28:59 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:10429)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <prvs=194c68654=alistair.francis@wdc.com>)
 id 1iO90n-0004C1-F8; Fri, 25 Oct 2019 19:28:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1572046133; x=1603582133;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DQhnDwCbo6vEY1b2mnRNEHztbBzy3si6NxsIoxUeN4c=;
 b=n++I7cVVcQl6vJOjAm2y/dlisgNHu8gdv0UATGljIfRhAMD9OaGt+WVr
 gyrcPL058aGHSG6nKbCVR2MaRlX9cnj1+ZFk7ENYgopmFtyM1qURU4QcL
 1hTeeK+0T9Cz/bflLgqS2ejIlEoYiF96zqoxBVN6ofkJw2YH87Rj/9lZF
 0afFd3CvcoUFoqa72vXdCW7AeKklDolDAHAdTOmlv4dUs7LnIfrPJMUEE
 X3qmjZkVa/1Q926j65+qa+GLRF45Cdj1xaPA1wpnu+6ebhfeVCuWZ6436
 VOlcB/RJyXvJOwX2jdLUO48+xGTSp7i1usLDfJe36CIf2v8WaN38MhLOt w==;
IronPort-SDR: DK0vAbxQinLkjjZAVPLfJcp3jv/UCrYt32nm864d0j4QFMfTT9eOkUUgPdPe3ykbxFHVVQDmlE
 CObysZGQp8NVYFoi8V32qtRbgf9iPoAhYcj4b3JQqwNbWUs0gCZOr4qAKetP6Io+vHvuSKTH5M
 xZvFmGHt/xuKpwK4khCMPc+XejsS77W2askKxGQYcWDfl+A0GUT9FYhVCzXWon45cFapCCoA/N
 Lti1r7D7ZiB4X63zxcsOxsqh2LMeuBZeZQNNKgew9IYaBz8orfHOomwDKeaYPX3DJxmnzkeL7N
 gQc=
X-IronPort-AV: E=Sophos;i="5.68,230,1569254400"; d="scan'208";a="228520390"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 26 Oct 2019 07:28:17 +0800
IronPort-SDR: xraDWs50hkmG/574bz49ro4Vz8gDCvkzB0cgOqoPdPptinTzZLU784SiHiMt1xxTjw4ZuGmLDW
 VWdCPkKfL+1RQx0YDnX3MaM1+WaHvZv5eqB5rsLUMQedqj8PlI2Eso0fGVS7Rjz73Ld6XstXyr
 Rq57yqvFjffsehETjy+OnL+C++HNAhgr8rXTJC6cCUDo02ZdO/VycyHCCoOf53LYfz5MGW85hE
 pSC3T2iAzVFvJo/svEj3x+t7kSFg6TMSRHHuyY8HR+qGQZDs+M+6FKJQiQE/q3vkjYKE4vGK+M
 uIcXk0SkidnEG0mDSlthHMD3
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2019 16:23:42 -0700
IronPort-SDR: +ESVu87LeHna/YsCn3EQVqngXV3zB37lQxa4MMJRcKNSoOrAuNpLnYsjl9CjqMLo8UvtDz/4F0
 UPwBu9XJBfO3zle4QfAh2+MfHv7I2cv0ysf3Cm9WNXzHRDDi2K1SooJBb3ifImv+9nIUL21ydp
 WJZlgX+8vJnD2BmBXaXPuR5yLKPKSUgdDF5cpwcBenL674WL1a81wC7JcJr3LdeO9rArxkKXQR
 Tfe0ebkyeXjZwza2qottm+qv04I4ZNCpxIREFFglVxNmucACf32F+a0rA1aUVxEjVAAsrJY7YZ
 tzQ=
WDCIronportException: Internal
Received: from risc6-mainframe.sdcorp.global.sandisk.com (HELO
 risc6-mainframe.int.fusionio.com) ([10.196.157.58])
 by uls-op-cesaip02.wdc.com with ESMTP; 25 Oct 2019 16:28:17 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: palmer@sifive.com,
	alistair.francis@wdc.com,
	alistair23@gmail.com
Subject: [PATCH v2 04/27] target/riscv: Add the force HS exception mode
Date: Fri, 25 Oct 2019 16:23:21 -0700
Message-Id: <44f1fe6d0b3ee43c2cd60d574ab8ea5a48ca757b.1572045716.git.alistair.francis@wdc.com>
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
X-List-Received-Date: Fri, 25 Oct 2019 23:29:02 -0000

Add a FORCE_HS_EXCEP mode to the RISC-V virtulisation status. This bit
specifies if an exeption should be taken to HS mode no matter the
current delegation status. This is used when an exeption must be taken
to HS mode, such as when a second level page fault occurs.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h        |  2 ++
 target/riscv/cpu_bits.h   |  6 ++++++
 target/riscv/cpu_helper.c | 18 ++++++++++++++++++
 3 files changed, 26 insertions(+)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 469dcbd1c0..bb7a0e27a7 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -252,6 +252,8 @@ bool riscv_cpu_exec_interrupt(CPUState *cs, int interrupt_request);
 bool riscv_cpu_fp_enabled(CPURISCVState *env);
 bool riscv_cpu_virt_enabled(CPURISCVState *env);
 void riscv_cpu_set_virt_enabled(CPURISCVState *env, bool enable);
+bool riscv_cpu_force_hs_excep_enabled(CPURISCVState *env);
+void riscv_cpu_set_force_hs_excep(CPURISCVState *env, bool enable);
 int riscv_cpu_mmu_index(CPURISCVState *env, bool ifetch);
 hwaddr riscv_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
 void  riscv_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index b4119cc002..162d42f211 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -424,6 +424,12 @@
 
 /* Virtulisation Register Fields */
 #define VIRT_ONOFF          1
+/* This is used to save state for when we take an exception. If this is set
+ * that means that we want to force a HS level exception (no matter what the
+ * delegation is set to). This will occur for things such as a second level
+ * page table fault.
+ */
+#define FORCE_HS_EXCEP      2
 
 /* RV32 satp CSR field masks */
 #define SATP32_MODE         0x80000000
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 0306f3181d..1464f73bee 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -100,6 +100,24 @@ void riscv_cpu_set_virt_enabled(CPURISCVState *env, bool enable)
     env->virt = set_field(env->virt, VIRT_ONOFF, enable);
 }
 
+bool riscv_cpu_force_hs_excep_enabled(CPURISCVState *env)
+{
+    if (!riscv_has_ext(env, RVH)) {
+        return false;
+    }
+
+    return get_field(env->virt, FORCE_HS_EXCEP);
+}
+
+void riscv_cpu_set_force_hs_excep(CPURISCVState *env, bool enable)
+{
+    if (!riscv_has_ext(env, RVH)) {
+        return;
+    }
+
+    env->virt = set_field(env->virt, FORCE_HS_EXCEP, enable);
+}
+
 int riscv_cpu_claim_interrupts(RISCVCPU *cpu, uint32_t interrupts)
 {
     CPURISCVState *env = &cpu->env;
-- 
2.23.0


