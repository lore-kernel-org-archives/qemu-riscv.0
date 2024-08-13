Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0605C52D7F
	for <qemu-riscv@archiver.kernel.org>; Tue, 13 Aug 2024 15:09:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sdt8L-0004LI-9q; Tue, 13 Aug 2024 11:08:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=5955489c63=ian.brockbank@cirrus.com>)
 id 1sdsyC-0002vJ-Jy
 for qemu-riscv@nongnu.org; Tue, 13 Aug 2024 10:57:56 -0400
Received: from mx0a-001ae601.pphosted.com ([67.231.149.25]
 helo=mx0b-001ae601.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=5955489c63=ian.brockbank@cirrus.com>)
 id 1sdsy6-0001IW-9e
 for qemu-riscv@nongnu.org; Tue, 13 Aug 2024 10:57:56 -0400
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47D5MJ6W022885;
 Tue, 13 Aug 2024 09:57:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=
 PODMain02222019; bh=bLk0ErMb1HPvGMOO/JCNS2UH7Ac+FQcP8NHwaSNR7Dc=; b=
 hhaWHURDaEWWdEmwitjAwaA+NjNYGOJb1U/Dkci2tEIhGOVIUUUNyMW/YX/Jl1NR
 ru43xTmwZi7CVQdJIdnQFx8JeOw3YJW0ZMwzBqzmySuG6s2vQNheUMMFPywV/TdW
 vEi8GDis+J/rYv4wOMhH/RM37KSw2mQ45Y16EOywXiFPNYVBdED0OJFrdTXynKqO
 9MBMNwmF3EVp5NtRABQBgaNvW5S/S4NfS842yDAWpkrXCYw4bnF6vyp6/cpwRw8S
 VnDbIPu8guymVvnSAq0q/8wOrFFUwe7DcmFxDnDkjhn4cKPsoI7ZqVX6fn9+ZMJ+
 j0LwlQkWIKh1mQlbzlO6jA==
Received: from ausex01.ad.cirrus.com ([141.131.3.19])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 40x5kwkdes-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Aug 2024 09:57:02 -0500 (CDT)
Received: from ausex02.ad.cirrus.com (141.131.37.96) by ausex01.ad.cirrus.com
 (141.131.37.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 13 Aug
 2024 09:57:01 -0500
Received: from EDIN7BQBTG3.ad.cirrus.com (141.131.38.212) by
 anon-ausex02.ad.cirrus.com (141.131.37.96) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Tue, 13 Aug 2024 09:56:59 -0500
From: Ian Brockbank <Ian.Brockbank@cirrus.com>
To: <qemu-riscv@nongnu.org>
CC: Palmer Dabbelt <palmer@dabbelt.com>, Alistair Francis
 <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>, Weiwei Li
 <liwei1518@gmail.com>, Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Ian Brockbank
 <ian.brockbank@cirrus.com>, LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH] target/riscv: Update CSR xie in CLIC mode
Date: Tue, 13 Aug 2024 15:54:05 +0100
Message-ID: <20240813145636.12223-5-Ian.Brockbank@cirrus.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240813145636.12223-1-Ian.Brockbank@cirrus.com>
References: <20240813145636.12223-1-Ian.Brockbank@cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: X5tNTVCfAb0tqmHiNJ1V5fYTIzTQ5_D5
X-Proofpoint-GUID: X5tNTVCfAb0tqmHiNJ1V5fYTIzTQ5_D5
X-Proofpoint-Spam-Reason: orgsafe
Received-SPF: pass client-ip=67.231.149.25;
 envelope-from=prvs=5955489c63=ian.brockbank@cirrus.com;
 helo=mx0b-001ae601.pphosted.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 13 Aug 2024 11:08:14 -0400
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

The xie CSR appears hardwired to zero in CLIC mode, replaced by separate
memory-mapped interrupt enables (clicintie[i]). Writes to xie will be
ignored and will not trap (i.e., no access faults).

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
Signed-off-by: Ian Brockbank <ian.brockbank@cirrus.com>
---
 target/riscv/csr.c | 34 ++++++++++++++++++++++------------
 1 file changed, 22 insertions(+), 12 deletions(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 9c824c0d8f..a5978e0929 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -30,6 +30,10 @@
 #include "qemu/guest-random.h"
 #include "qapi/error.h"

+#if !defined(CONFIG_USER_ONLY)
+#include "hw/intc/riscv_clic.h"
+#endif
+
 /* CSR function table public API */
 void riscv_get_csr_ops(int csrno, riscv_csr_operations *ops)
 {
@@ -1805,16 +1809,19 @@ static RISCVException rmw_mie64(CPURISCVState *env,=
 int csrno,
                                 uint64_t *ret_val,
                                 uint64_t new_val, uint64_t wr_mask)
 {
-    uint64_t mask =3D wr_mask & all_ints;
+    /* Access to xie will be ignored in CLIC mode and will not trap. */
+    if (!riscv_clic_is_clic_mode(env)) {
+        uint64_t mask =3D wr_mask & all_ints;

-    if (ret_val) {
-        *ret_val =3D env->mie;
-    }
+        if (ret_val) {
+            *ret_val =3D env->mie;
+        }

-    env->mie =3D (env->mie & ~mask) | (new_val & mask);
+        env->mie =3D (env->mie & ~mask) | (new_val & mask);

-    if (!riscv_has_ext(env, RVH)) {
-        env->mie &=3D ~((uint64_t)HS_MODE_INTERRUPTS);
+        if (!riscv_has_ext(env, RVH)) {
+            env->mie &=3D ~((uint64_t)HS_MODE_INTERRUPTS);
+        }
     }

     return RISCV_EXCP_NONE;
@@ -2906,13 +2913,13 @@ static int read_mintstatus(CPURISCVState *env, int =
csrno, target_ulong *val)
 static int read_mintthresh(CPURISCVState *env, int csrno, target_ulong *va=
l)
 {
     *val =3D env->mintthresh;
-    return 0;
+    return RISCV_EXCP_NONE;
 }

 static int write_mintthresh(CPURISCVState *env, int csrno, target_ulong va=
l)
 {
     env->mintthresh =3D val;
-    return 0;
+    return RISCV_EXCP_NONE;
 }

 /* Supervisor Trap Setup */
@@ -3059,7 +3066,10 @@ static RISCVException rmw_sie64(CPURISCVState *env, =
int csrno,
             *ret_val |=3D env->sie & nalias_mask;
         }

-        env->sie =3D (env->sie & ~sie_mask) | (new_val & sie_mask);
+        /* Writes to xie will be ignored in CLIC mode and will not trap. *=
/
+        if (!riscv_clic_is_clic_mode(env)) {
+            env->sie =3D (env->sie & ~sie_mask) | (new_val & sie_mask);
+        }
     }

     return ret;
@@ -3337,13 +3347,13 @@ static int read_sintstatus(CPURISCVState *env, int =
csrno, target_ulong *val)
 static int read_sintthresh(CPURISCVState *env, int csrno, target_ulong *va=
l)
 {
     *val =3D env->sintthresh;
-    return 0;
+    return RISCV_EXCP_NONE;
 }

 static int write_sintthresh(CPURISCVState *env, int csrno, target_ulong va=
l)
 {
     env->sintthresh =3D val;
-    return 0;
+    return RISCV_EXCP_NONE;
 }

 /* Supervisor Protection and Translation */
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

