Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mzCUT-00070n-Qy
	for mharc-qemu-riscv@gnu.org; Mon, 20 Dec 2021 01:49:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9816edf2f=alistair.francis@opensource.wdc.com>)
 id 1mzCUQ-0006xP-Rr
 for qemu-riscv@nongnu.org; Mon, 20 Dec 2021 01:49:43 -0500
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:22091)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9816edf2f=alistair.francis@opensource.wdc.com>)
 id 1mzCUP-0002OG-1i
 for qemu-riscv@nongnu.org; Mon, 20 Dec 2021 01:49:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1639982979; x=1671518979;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=F+7bfdjesS0s3LHB18SglbSGmQHmIYhCVWoJ8rzL6PQ=;
 b=giht15LZ9eIyOVpLPOXvkxCGAJLqf1RhmbgUwRdm/a8dn68zX4dIbYKh
 M2rlv44/sJ2e95jFO8Fhc1vurn9QWvGeDjkFrfSC2uzlMBylQx2/zHL5y
 4LZkAqUQEnRZaY7Mi9zolxw/lRr8jBxDhMrKWS7xHcWB0DO/KOfRVCCGp
 QZpJQRPvlXdWM6g05mlfDyLB7bi0zEqecOiF0a0l+aMJLmxAqvycI5Ft3
 UuPKp0Nt/U8ygRAGOyg9jhaBYWhgiN0Z+/tMV7zibkVdG9CVXhYEBC8aW
 kDJ2+e+/VrM2ybe/21wB3eaGjQITmNC+GpEDLlUNe6fpzr6+ZNsBIFTRP Q==;
X-IronPort-AV: E=Sophos;i="5.88,219,1635177600"; d="scan'208";a="188654150"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 20 Dec 2021 14:49:37 +0800
IronPort-SDR: PCu/tLu4+KGApZt5aHRN07aGZ3O+inS2FShP6zrrs4YkOcjGJ+6h8rXti/IsxcS8CkDQKhF09j
 2gKISi9bohiaE4NG1xB+ZfghL74D5C9VRdATXS8Y4sEJ6YcJ7+mj070T6LSLx06QKSLRtomN0R
 F4eejZZB0mdua5OdDIZEOI/raXzcnurgduTxVyxwdMrM+XZ910b3EAso637BGUH61nz+5LK//e
 +yYIMbe4V1yLrGS9iSsL4JCF+ojdmJtzLuCqsO+PVYHdXe91BLvRF7hP7nu76jcMJZHhwbNCRN
 8dhHj4Yvz7+YYLw4zdDdmVMF
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2021 22:23:55 -0800
IronPort-SDR: oHkFTIBdZ1zV0O6UjEd78b4ckLmCO/HH4KjUQ/uklLrp8wVk5cyA7l3GPB8Vz/9NshD6ZQtA/x
 u4nlnIhRloWAviuZ1Eo7F0E+srcLXS6YUSGzx6OaQwAMGO/NPsoVYuAoj/wR1wPdBcK0bV8v/m
 m/kUDlNLASSiERIKdx2KBjrOMfcNjVlL7P9ZzC+81t9z00555cntxfBjzGyK8ppoWQCgKlKyg7
 vyZpvpWjbTy3kcRq9lAY1yOZltNOftIOcIDQv7yZFsBbegak5GMowlgiELotittozRlzh31FYq
 fN8=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2021 22:49:39 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JHVZB0CHXz1Rwnx
 for <qemu-riscv@nongnu.org>; Sun, 19 Dec 2021 22:49:38 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1639982977; x=1642574978; bh=F+7bfdjesS0s3LHB18
 SglbSGmQHmIYhCVWoJ8rzL6PQ=; b=pR8DmTHiyZyrwF/xycGiYP2dSsXpLCeMeW
 +6GdTAIqnYVXxf/hikwz9V1Y7WUNhjCHOPCUWuyEyEGclLPIwwnSvH90r00O33dy
 VQ6Ehy0jBQAaYjqBb/MI6Eb84oAQCOBnQzB/k1a5PW3stJBx2m67Olee9lYLDpQw
 WdRq7f1cPvB1JCKnowKVLG9y6M5tWD5gyZGcoP2vtC37+StecbsncdKjPySoC93O
 nE0qWe2rHKjjdCW/osaA6/0M98JN2Qmvk2yHiXjEfI1hVao6O/3JzrG1pp3xS6mF
 Km6LWveDFCnkAL2GbALvE8bUjggPIyfIAyuViBsBv+S4xjudjt7g==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id 8p0tTANgpWvF for <qemu-riscv@nongnu.org>;
 Sun, 19 Dec 2021 22:49:37 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.165.68])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JHVZ51zRfz1RtVG;
 Sun, 19 Dec 2021 22:49:32 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, bmeng.cn@gmail.com,
 alistair23@gmail.com, Bin Meng <bin.meng@windriver.com>
Subject: [PATCH v4 2/3] target/riscv: Fixup setting GVA
Date: Mon, 20 Dec 2021 16:49:15 +1000
Message-Id: <20211220064916.107241-3-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211220064916.107241-1-alistair.francis@opensource.wdc.com>
References: <20211220064916.107241-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=9816edf2f=alistair.francis@opensource.wdc.com;
 helo=esa5.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 20 Dec 2021 06:49:44 -0000

From: Alistair Francis <alistair.francis@wdc.com>

In preperation for adding support for the illegal instruction address
let's fixup the Hypervisor extension setting GVA logic and improve the
variable names.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu_helper.c | 21 ++++++---------------
 1 file changed, 6 insertions(+), 15 deletions(-)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 9eeed38c7e..9e1f5ee177 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -967,6 +967,7 @@ void riscv_cpu_do_interrupt(CPUState *cs)
=20
     RISCVCPU *cpu =3D RISCV_CPU(cs);
     CPURISCVState *env =3D &cpu->env;
+    bool write_gva =3D false;
     uint64_t s;
=20
     /* cs->exception is 32-bits wide unlike mcause which is XLEN-bits wi=
de
@@ -975,7 +976,6 @@ void riscv_cpu_do_interrupt(CPUState *cs)
     bool async =3D !!(cs->exception_index & RISCV_EXCP_INT_FLAG);
     target_ulong cause =3D cs->exception_index & RISCV_EXCP_INT_MASK;
     target_ulong deleg =3D async ? env->mideleg : env->medeleg;
-    bool write_tval =3D false;
     target_ulong tval =3D 0;
     target_ulong htval =3D 0;
     target_ulong mtval2 =3D 0;
@@ -1004,7 +1004,7 @@ void riscv_cpu_do_interrupt(CPUState *cs)
         case RISCV_EXCP_INST_PAGE_FAULT:
         case RISCV_EXCP_LOAD_PAGE_FAULT:
         case RISCV_EXCP_STORE_PAGE_FAULT:
-            write_tval  =3D true;
+            write_gva =3D true;
             tval =3D env->badaddr;
             break;
         default:
@@ -1041,18 +1041,6 @@ void riscv_cpu_do_interrupt(CPUState *cs)
         if (riscv_has_ext(env, RVH)) {
             target_ulong hdeleg =3D async ? env->hideleg : env->hedeleg;
=20
-            if (env->two_stage_lookup && write_tval) {
-                /*
-                 * If we are writing a guest virtual address to stval, s=
et
-                 * this to 1. If we are trapping to VS we will set this =
to 0
-                 * later.
-                 */
-                env->hstatus =3D set_field(env->hstatus, HSTATUS_GVA, 1)=
;
-            } else {
-                /* For other HS-mode traps, we set this to 0. */
-                env->hstatus =3D set_field(env->hstatus, HSTATUS_GVA, 0)=
;
-            }
-
             if (riscv_cpu_virt_enabled(env) && ((hdeleg >> cause) & 1)) =
{
                 /* Trap to VS mode */
                 /*
@@ -1063,7 +1051,7 @@ void riscv_cpu_do_interrupt(CPUState *cs)
                     cause =3D=3D IRQ_VS_EXT) {
                     cause =3D cause - 1;
                 }
-                env->hstatus =3D set_field(env->hstatus, HSTATUS_GVA, 0)=
;
+                write_gva =3D false;
             } else if (riscv_cpu_virt_enabled(env)) {
                 /* Trap into HS mode, from virt */
                 riscv_cpu_swap_hypervisor_regs(env);
@@ -1072,6 +1060,7 @@ void riscv_cpu_do_interrupt(CPUState *cs)
                 env->hstatus =3D set_field(env->hstatus, HSTATUS_SPV,
                                          riscv_cpu_virt_enabled(env));
=20
+
                 htval =3D env->guest_phys_fault_addr;
=20
                 riscv_cpu_set_virt_enabled(env, 0);
@@ -1079,7 +1068,9 @@ void riscv_cpu_do_interrupt(CPUState *cs)
                 /* Trap into HS mode */
                 env->hstatus =3D set_field(env->hstatus, HSTATUS_SPV, fa=
lse);
                 htval =3D env->guest_phys_fault_addr;
+                write_gva =3D false;
             }
+            env->hstatus =3D set_field(env->hstatus, HSTATUS_GVA, write_=
gva);
         }
=20
         s =3D env->mstatus;
--=20
2.31.1


