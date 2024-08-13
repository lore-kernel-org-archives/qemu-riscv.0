Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF6AEC52D7F
	for <qemu-riscv@archiver.kernel.org>; Tue, 13 Aug 2024 15:08:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sdt8H-00046o-8c; Tue, 13 Aug 2024 11:08:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=5955489c63=ian.brockbank@cirrus.com>)
 id 1sdsy1-0002lU-MZ
 for qemu-riscv@nongnu.org; Tue, 13 Aug 2024 10:57:45 -0400
Received: from mx0a-001ae601.pphosted.com ([67.231.149.25]
 helo=mx0b-001ae601.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=5955489c63=ian.brockbank@cirrus.com>)
 id 1sdsxy-0001G9-1z
 for qemu-riscv@nongnu.org; Tue, 13 Aug 2024 10:57:45 -0400
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47D5MJ6X022885;
 Tue, 13 Aug 2024 09:57:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=
 PODMain02222019; bh=kMPphC3b0p48Y8Ln8ctJDdWvTWFp1ap/vJ2PSbXlvME=; b=
 GFNnOZour3FLdDYx8qO7Zu5Dub5sEEfrHH6xZGH+w4WzIr8+14ExQLUuHTIeoX/e
 XqAuDVvllE5o2l5hgD8ryv63VWsO1W7QufNJpRy8hVrpXIloP0U2VvbLYm/6GlKd
 SA0jwH9mJXJipEgZrwRB8YattwGqvN/Llhk5KOQtWH9p4LUanELX1vYxyIEbhB1D
 hs/5s33eZOCODp/sjaBn56CrvNnkufA/hCX1mhXw01Up6rxYpioVPgIBPbvb1H0n
 zHSIxwi8xCw24t3tkVXcnHlKDDYWGBItlElD0+Zm5qvHnwMWQKripv6n6JdkVjhk
 DGSXqBiUum7A4ehTgGSa1w==
Received: from ausex01.ad.cirrus.com ([141.131.3.19])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 40x5kwkdew-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Aug 2024 09:57:14 -0500 (CDT)
Received: from ausex02.ad.cirrus.com (141.131.37.96) by ausex01.ad.cirrus.com
 (141.131.37.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 13 Aug
 2024 09:57:12 -0500
Received: from EDIN7BQBTG3.ad.cirrus.com (141.131.38.212) by
 anon-ausex02.ad.cirrus.com (141.131.37.96) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Tue, 13 Aug 2024 09:57:11 -0500
From: Ian Brockbank <Ian.Brockbank@cirrus.com>
To: <qemu-riscv@nongnu.org>
CC: Palmer Dabbelt <palmer@dabbelt.com>, Alistair Francis
 <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>, Weiwei Li
 <liwei1518@gmail.com>, Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Ian Brockbank
 <ian.brockbank@cirrus.com>, LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH] target/riscv: Update interrupt return in CLIC mode
Date: Tue, 13 Aug 2024 15:54:10 +0100
Message-ID: <20240813145636.12223-10-Ian.Brockbank@cirrus.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240813145636.12223-1-Ian.Brockbank@cirrus.com>
References: <20240813145636.12223-1-Ian.Brockbank@cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: ppwmUsTD8313TzedIKRiaGmSrOojhvRj
X-Proofpoint-GUID: ppwmUsTD8313TzedIKRiaGmSrOojhvRj
X-Proofpoint-Spam-Reason: orgsafe
Received-SPF: pass client-ip=67.231.149.25;
 envelope-from=prvs=5955489c63=ian.brockbank@cirrus.com;
 helo=mx0b-001ae601.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 13 Aug 2024 11:08:12 -0400
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

From: Ian Brockbank <ian.brockbank@cirrus.com>

When a vectored interrupt is selected and serviced, the hardware will
automatically clear the corresponding pending bit in edge-triggered mode.
This may lead to a lower privilege interrupt pending forever.

Therefore when interrupts return, pull a pending interrupt to service.

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
Signed-off-by: Ian Brockbank <ian.brockbank@cirrus.com>
---
 target/riscv/op_helper.c | 29 +++++++++++++++++++++++++++--
 1 file changed, 27 insertions(+), 2 deletions(-)

diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
index 25a5263573..b6ca3ad598 100644
--- a/target/riscv/op_helper.c
+++ b/target/riscv/op_helper.c
@@ -25,7 +25,11 @@
 #include "exec/cpu_ldst.h"
 #include "exec/helper-proto.h"

-/* Exceptions processing helpers */
+#if !defined(CONFIG_USER_ONLY)
+#include "hw/intc/riscv_clic.h"
+#endif
+
+/* Exception processing helpers */
 G_NORETURN void riscv_raise_exception(CPURISCVState *env,
                                       uint32_t exception, uintptr_t pc)
 {
@@ -259,6 +263,7 @@ void helper_cbo_inval(CPURISCVState *env, target_ulong =
address)

 #ifndef CONFIG_USER_ONLY

+/* Return from PRV_S interrupt */
 target_ulong helper_sret(CPURISCVState *env)
 {
     uint64_t mstatus;
@@ -292,8 +297,17 @@ target_ulong helper_sret(CPURISCVState *env)
     }
     env->mstatus =3D mstatus;

+    if (riscv_clic_is_clic_mode(env)) {
+        /* Update mintstatus with the PRV_S information */
+        target_ulong spil =3D get_field(env->scause, SCAUSE_SPIL);
+        env->mintstatus =3D set_field(env->mintstatus, MINTSTATUS_SIL, spi=
l);
+        env->scause =3D set_field(env->scause, SCAUSE_SPIE, 1);
+        env->scause =3D set_field(env->scause, SCAUSE_SPP, PRV_U);
+        riscv_clic_get_next_interrupt(env->clic);
+    }
+
     if (riscv_has_ext(env, RVH) && !env->virt_enabled) {
-        /* We support Hypervisor extensions and virtulisation is disabled =
*/
+        /* We support Hypervisor extensions and virtualization is disabled=
 */
         target_ulong hstatus =3D env->hstatus;

         prev_virt =3D get_field(hstatus, HSTATUS_SPV);
@@ -312,6 +326,7 @@ target_ulong helper_sret(CPURISCVState *env)
     return retpc;
 }

+/* Return from PRV_M interrupt */
 target_ulong helper_mret(CPURISCVState *env)
 {
     if (!(env->priv >=3D PRV_M)) {
@@ -344,6 +359,16 @@ target_ulong helper_mret(CPURISCVState *env)
     }
     env->mstatus =3D mstatus;

+    if (riscv_clic_is_clic_mode(env)) {
+        /* Update mintstatus with the PRV_M information */
+        target_ulong mpil =3D get_field(env->mcause, MCAUSE_MPIL);
+        env->mintstatus =3D set_field(env->mintstatus, MINTSTATUS_MIL, mpi=
l);
+        env->mcause =3D set_field(env->mcause, MCAUSE_MPIE, 1);
+        env->mcause =3D set_field(env->mcause, MCAUSE_MPP,
+                                riscv_has_ext(env, RVU) ? PRV_U : PRV_M);
+        riscv_clic_get_next_interrupt(env->clic);
+    }
+
     if (riscv_has_ext(env, RVH) && prev_virt) {
         riscv_cpu_swap_hypervisor_regs(env);
     }
--
2.46.0.windows.1

This message and any attachments may contain privileged and confidential in=
formation that is intended solely for the person(s) to whom it is addressed=
. If you are not an intended recipient you must not: read; copy; distribute=
; discuss; take any action in or make any reliance upon the contents of thi=
s message; nor open or read any attachment. If you have received this messa=
ge in error, please notify us as soon as possible on the following telephon=
e number and destroy this message including any attachments. Thank you. Cir=
rus Logic International (UK) Ltd and Cirrus Logic International Semiconduct=
or Ltd are companies registered in Scotland, with registered numbers SC0898=
39 and SC495735 respectively. Our registered office is at 7B Nightingale Wa=
y, Quartermile, Edinburgh, EH3 9EG, UK. Tel: +44 (0)131 272 7000. www.cirru=
s.com

