Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2EA1C79F9E
	for <qemu-riscv@archiver.kernel.org>; Mon,  7 Sep 2026 06:51:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x3TCW-0004BV-MP; Mon, 07 Sep 2026 02:51:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mayuresh.chitale@oss.qualcomm.com>)
 id 1x3TCU-0004BB-NR
 for qemu-riscv@nongnu.org; Mon, 07 Sep 2026 02:51:30 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mayuresh.chitale@oss.qualcomm.com>)
 id 1x3TCS-0007Xg-FM
 for qemu-riscv@nongnu.org; Mon, 07 Sep 2026 02:51:30 -0400
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6873l2Td4041970
 for <qemu-riscv@nongnu.org>; Mon, 7 Sep 2026 06:51:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=HvmaV8KpE6wqDkVL2IEgsLu+LOW/CDfli5c
 WaaGM8Vg=; b=e6cafz5Fvyy8RbKCWVNZ27XsDgGBW9boQ753DHCIEVQBR2COLdV
 aB84bVZyk8hgSLrYyAgBsep778uE9GVQXdwvF9wGwDH7RJNuG92DWHvsfbdvhlFf
 oX0vB0BXW1jYVzu7fjqTo3B2mrqxPRibDgUrTT4ABUpnti+myr09xiHu8ml/sFgr
 1J4YA9M4t6iZUG1G0/DSofzMAlIZxd1khBqpWyi3XhkiL6OXcvfo/TJJYOIMVktw
 eb/teH4O1TPD0f9m+b8dAQ2B9HYGkZ5cCwqNotFduyR0yKjEL1pyO/SwNWinywTF
 owEMfzDgndSYokMNUjKrVWB8vTBJWtDPBbA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gg8sd5wds-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 07 Sep 2026 06:51:24 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-2ce7dff6253so11258815ad.1
 for <qemu-riscv@nongnu.org>; Sun, 06 Sep 2026 23:51:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1788763883; x=1789368683; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=HvmaV8KpE6wqDkVL2IEgsLu+LOW/CDfli5cWaaGM8Vg=;
 b=YTbPiI9ixHPyvOKO/R7m7PyME13WrqMZimHJtaB1S/agRa0MCtXEd88MCtaoG3th1W
 hj2JNASJ9z3qAF1TwrIXupiys+7buQBtJ8EICjKugzSSBUmThv5onVWsVQ1yTMWFeglg
 sgEUgqiDY05VaszAHwqLm2YPhFGY21Ht+IZOo/IZjbsRGV47c0Cx38cc82T2PFqakupk
 LWZdr3Uiwvci7RqEPBK3RlmE65T4p/ri389W3Bf/vUlYlhcQnv/DwDQNwFaBkBttUhB2
 YAOQNs2EXLdHV4Xkvss27ExLofj42RrcEbzJBQJ4KY8LFuNzARsojBiYYfqbL8qEyafp
 ceiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788763883; x=1789368683;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=HvmaV8KpE6wqDkVL2IEgsLu+LOW/CDfli5cWaaGM8Vg=;
 b=U8VCMDzd9NgWtqvnKb/vI/edoWyD2ZLc4NYZ1lyLVinTGKe8dxmKsw7qyOrLypWya6
 FVdv3ELMHTuf9M5L8AJdxBZ0qQlaefpNKIPCTgMhhe+5ggKk87LQs9VMwbjSRXA27QHJ
 goUDT/MHBCLRC8LKY+sZL3iAFqUpYrXrXUbSX3kPH5kvki1+A/LoMlHbvxUegaAZBBpK
 W0ntLbUWDAM2LOVCETRs3a3d2h8Wpl5XVnCCYpGBFfsfVMtAYswvQ2g+cVq+ubQx8e4Y
 L4TTRNHLoN5HbLB/uJXjSoHUmitCqAvHvefVommWMZ+8UpfciEcHbOHFflrIuf1BKU8H
 UI+A==
X-Forwarded-Encrypted: i=1;
 AKwUvBxKN4Qs4+fqmo3Ct1qnCnwV5hyqDLlh9nkJb2LLpuYOUmZPIZ/D7PgKNFwNmG3pu/2dAsCcfAbvKxE2@nongnu.org
X-Gm-Message-State: AFuF++kjA4d8MJgKXcxtYjjfmaNUVV5h1/8Z1Lh0iytAvWdqWIikiqFG
 6Al3fHx06VoPnUYmKNX+fyl7SUerS1hMyB2ZTBlDbGAhaReUMW3sDpl8/65Va4v7+Y4YrvGu2f4
 vo+kHwxUF6uxkUpDRhmUNiZaWijbZiCZ+/2nJSPfprOzN3nycELFNiMJNFg==
X-Gm-Gg: AYBFou3Y2hINH54Ho9dNsvKti9iIV0Z1AQF8xDkmaZbEKlsdgcUstGLplavtyi8eCJ3
 cvbiqKhnzkh3RnAboDuckW+lROysHi56hl0kJF0TP4vExzaV8HKp8j3/xh2hrB9hnlrf1DIFNF8
 SZkQw4ZyF5LRQYO2miA6vetLtwwNmqR4L8Lx8JM2g3wQmi+BeCiuy1EGR61EWzwtIDmBdWsg0Cv
 FVprbI9UP0vbgkVVtRBFWP+DCF7M33Ugdt0dQa4vMlnnmSTF9t9dQ1kqhURkAEJPG9GZwZPzqVC
 il/iyU1GWz54c60HQvjYV8EfpNs7dpTkhF2MFoo4UVxwxhzATcPkASvN5XiRow6g9hfkFh2xDcx
 xPhUP+Cf5kUXdv9nW2DsgyKJ0bStZscVODFlxzHq0zSt3kFXGhFgTMZ+TCkGtCfs++sSGShiY33
 yeNxk+hYXvrv4zrv1wzIM9NbDt3A==
X-Received: by 2002:a17:90b:4ac5:b0:398:9beb:a2ba with SMTP id
 98e67ed59e1d1-39b087fb503mr30446611a91.28.1788763883337; 
 Sun, 06 Sep 2026 23:51:23 -0700 (PDT)
X-Received: by 2002:a17:90b:4ac5:b0:398:9beb:a2ba with SMTP id
 98e67ed59e1d1-39b087fb503mr30446575a91.28.1788763882814; 
 Sun, 06 Sep 2026 23:51:22 -0700 (PDT)
Received: from hu-mchitale-blr.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
 by smtp.googlemail.com with ESMTPSA id
 5a478bee46e88-3339ac24d7esm39437142eec.15.2026.09.06.23.51.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Sep 2026 23:51:22 -0700 (PDT)
From: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>
Cc: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>, Gong Shuai <gsh517025@gmail.com>,
 TianCheng TANG <lyndra@linux.alibaba.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Subject: [PATCH v2] target/riscv: Fix LCOFI interrupt masking in sie/sip/mvip
Date: Mon,  7 Sep 2026 12:21:10 +0530
Message-ID: <20260907065112.2287127-1-mayuresh.chitale@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: B9iVFVtE3mnvZo1hrHuEc0aeZzNjziTz
X-Proofpoint-ORIG-GUID: B9iVFVtE3mnvZo1hrHuEc0aeZzNjziTz
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDA3MiBTYWx0ZWRfXxr+ysjjpL+F3
 UJ3249S/QJVAtszFMZIbpAVxrpWgKJfMJIelFmTlbVaUuMu9CXSYRn7M7IyCQJq7eZnrg7drnnk
 5ibfCp3mKA7GqWM2MotSrGSU0nFIJLM=
X-Authority-Analysis: v=2.4 cv=dfmwG3Xe c=1 sm=1 tr=0 ts=6a9e5eec cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=pGLkceISAAAA:8
 a=SRrdq9N9AAAA:8 a=EUspDBNiAAAA:8 a=pY6yUR2m6-QEIg0VTF4A:9
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDA3MiBTYWx0ZWRfXyTUDTpFwYkOB
 aScZ9lTfN5SOu7QN0myY8X4aOiO+HaqS1tihSBLOarxIkwpmJOaTBRSbxCBw8tOcDY+mV2vyNEJ
 NJYugZ8Mz0acbVl6e4Vl4ZX0kNzGHkSr7qMCVbln+6qzGlqF+rmbneLiH5VzDVKxUfwgeyhBXiU
 /TO223GYq4iudGwkNKUcpjqGNAbTMvRLdPdrb+S0vtaVBaCyPdrbisTs7awcl0T/sSrIoXjr+aJ
 1BGuSuHR1RmqqTBz3yd7bJ0Ii8Zf6YoS3hohW4QnK4fAt7CxNDNYi+RFiLHoIaHx0KU1EOqzVJl
 +6iK94CNGREBg0GUPcuM8nWfy+AsrSWAN48JUJ5mpcZiOhg+YK1sU5HabCuYZcBcDk1VZ15O4Rd
 BuUz6UB4LDDTywiJke5sTQZabJ7UETqXVAawTjRgbfAVrVi553oRbHo09QdQgbUk3XNuYDUXNeV
 ZujR2Gg+h4/06rWrLAA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_01,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 priorityscore=1501 spamscore=0 malwarescore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070072
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=mayuresh.chitale@oss.qualcomm.com;
 helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

Commit 27f9566dcd98 dropped bit 13 (MIP_LCOFIP) from the LOCAL_INTERRUPTS
macro and hence also from individual masks such as all_ints,
sip_writable_mask etc.

As a result, with Sscofpmf enabled and LCOFIP delegated to S-mode, the
overflow interrupt was raised in mip but was not visible in sip and it
never got delivered to the PMU driver. For the same reason, sie.LCOFIE
also became read-only 0.

Add back bit 13 in the affected masks, but gate it on Sscofpmf being
implemented. In addition, for the virtual interrupt path, mvip/mvien
LCOFI also requires Smcdeleg and Smaia to be implemented. Also make
LCOFI delegable only if Sscofpmf is implemented.

Fixes: 27f9566dcd98 ("target/riscv: Update the local interrupt mask")
Suggested-by: Gong Shuai <gsh517025@gmail.com>
Suggested-by: TianCheng TANG <lyndra@linux.alibaba.com>
Signed-off-by: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
---
v2:
- Fix the sip.LCOFIP read-back mask in rmw_sip64() so that it matches
  the write path.
- Gate LCOFI on the Sscofpmf, Smcdeleg and Smaia extensions, depending
  on the register being accessed and on whether it is the virtual
  interrupt path.

 target/riscv/tcg/csr.c | 59 +++++++++++++++++++++++++++++++++++-------
 1 file changed, 50 insertions(+), 9 deletions(-)

diff --git a/target/riscv/tcg/csr.c b/target/riscv/tcg/csr.c
index 002f7e69c1..966a0897bb 100644
--- a/target/riscv/tcg/csr.c
+++ b/target/riscv/tcg/csr.c
@@ -1812,7 +1812,7 @@ static RISCVException write_stimecmph(CPURISCVState *env, int csrno,
 #define LOCAL_INTERRUPTS   (~0xFFFFULL)
 
 static const uint64_t delegable_ints =
-    S_MODE_INTERRUPTS | VS_MODE_INTERRUPTS | MIP_LCOFIP;
+    S_MODE_INTERRUPTS | VS_MODE_INTERRUPTS;
 static const uint64_t vs_delegable_ints =
     (VS_MODE_INTERRUPTS | LOCAL_INTERRUPTS) & ~MIP_LCOFIP;
 static const uint64_t all_ints = M_MODE_INTERRUPTS | S_MODE_INTERRUPTS |
@@ -1874,6 +1874,25 @@ static const uint64_t hvien_writable_mask = LOCAL_INTERRUPTS;
 
 static const uint64_t vsip_writable_mask = MIP_VSSIP | LOCAL_INTERRUPTS;
 
+static bool lcofi_present(CPURISCVState *env, bool virt_int)
+{
+    const RISCVCPUConfig *cfg = riscv_cpu_cfg(env);
+
+    if (!cfg->ext_sscofpmf) {
+        return false;
+    }
+
+    /*
+     * For the virtual interrupts path, we also need to check if smcdeleg and
+     * smaia are both implemented.
+     */
+    if (virt_int && !(cfg->ext_smcdeleg && cfg->ext_smaia)) {
+        return false;
+    }
+
+    return true;
+}
+
 /* Machine Information Registers */
 static RISCVException read_zero(CPURISCVState *env, int csrno,
                                 target_ulong *val)
@@ -2248,6 +2267,10 @@ static RISCVException rmw_mideleg64(CPURISCVState *env, int csrno,
 {
     uint64_t mask = wr_mask & delegable_ints;
 
+    if (lcofi_present(env, false)) {
+        mask |= wr_mask & MIP_LCOFIP;
+    }
+
     if (ret_val) {
         *ret_val = env->mideleg;
     }
@@ -2299,6 +2322,10 @@ static RISCVException rmw_mie64(CPURISCVState *env, int csrno,
 {
     uint64_t mask = wr_mask & all_ints;
 
+    if (lcofi_present(env, false)) {
+        mask |= wr_mask & MIP_LCOFIP;
+    }
+
     if (ret_val) {
         *ret_val = env->mie;
     }
@@ -2349,6 +2376,10 @@ static RISCVException rmw_mvien64(CPURISCVState *env, int csrno,
 {
     uint64_t mask = wr_mask & mvien_writable_mask;
 
+    if (lcofi_present(env, true)) {
+        mask |= wr_mask & MIP_LCOFIP;
+    }
+
     if (ret_val) {
         *ret_val = env->mvien;
     }
@@ -3784,6 +3815,10 @@ static RISCVException rmw_mip64(CPURISCVState *env, int csrno,
     uint64_t old_mip, mask = wr_mask & delegable_ints;
     uint32_t gin;
 
+    if (lcofi_present(env, false)) {
+        mask |= wr_mask & MIP_LCOFIP;
+    }
+
     /*
      * When mvien[9]=1, mip.SEIP is read-only and reflects only
      * the external interrupt signal from the interrupt controller.
@@ -3897,9 +3932,11 @@ static RISCVException rmw_mvip64(CPURISCVState *env, int csrno,
      *  alias_mask denotes the bits that come from mip nalias_mask denotes bits
      *  that come from hvip.
      */
-    uint64_t alias_mask = ((S_MODE_INTERRUPTS | LOCAL_INTERRUPTS) &
+    bool virt_int = (csrno == CSR_MVIP) || (csrno == CSR_MVIPH);
+    uint64_t lcofi_mask = lcofi_present(env, virt_int) ? MIP_LCOFIP : 0;
+    uint64_t alias_mask = ((S_MODE_INTERRUPTS | lcofi_mask | LOCAL_INTERRUPTS) &
         (env->mideleg | ~env->mvien)) | MIP_STIP;
-    uint64_t nalias_mask = (S_MODE_INTERRUPTS | LOCAL_INTERRUPTS) &
+    uint64_t nalias_mask = (S_MODE_INTERRUPTS | lcofi_mask | LOCAL_INTERRUPTS) &
         (~env->mideleg & env->mvien);
     uint64_t wr_mask_mvip;
     uint64_t wr_mask_mip;
@@ -3928,8 +3965,8 @@ static RISCVException rmw_mvip64(CPURISCVState *env, int csrno,
         alias_mask &= ~MIP_STIP;
     }
 
-    wr_mask_mip = wr_mask & alias_mask & mvip_writable_mask;
-    wr_mask_mvip = wr_mask & nalias_mask & mvip_writable_mask;
+    wr_mask_mip = wr_mask & alias_mask & (mvip_writable_mask | lcofi_mask);
+    wr_mask_mvip = wr_mask & nalias_mask & (mvip_writable_mask | lcofi_mask);
 
     /*
      * For bits set in alias_mask, mvip needs to be alias of mip, so forward
@@ -4132,9 +4169,11 @@ static RISCVException rmw_sie64(CPURISCVState *env, int csrno,
                                 uint64_t *ret_val,
                                 uint64_t new_val, uint64_t wr_mask)
 {
-    uint64_t nalias_mask = (S_MODE_INTERRUPTS | LOCAL_INTERRUPTS) &
+    uint64_t lcofi_mask = lcofi_present(env, false) ? MIP_LCOFIP : 0;
+    uint64_t nalias_mask = (S_MODE_INTERRUPTS | lcofi_mask | LOCAL_INTERRUPTS) &
         (~env->mideleg & env->mvien);
-    uint64_t alias_mask = (S_MODE_INTERRUPTS | LOCAL_INTERRUPTS) & env->mideleg;
+    uint64_t alias_mask = (S_MODE_INTERRUPTS | lcofi_mask | LOCAL_INTERRUPTS) &
+        env->mideleg;
     uint64_t sie_mask = wr_mask & nalias_mask;
     RISCVException ret;
 
@@ -4379,7 +4418,9 @@ static RISCVException rmw_sip64(CPURISCVState *env, int csrno,
                                 uint64_t new_val, uint64_t wr_mask)
 {
     RISCVException ret;
-    uint64_t mask = (env->mideleg | env->mvien) & sip_writable_mask;
+    uint64_t lcofi_mask = lcofi_present(env, false) ? MIP_LCOFIP : 0;
+    uint64_t mask = (env->mideleg | env->mvien) &
+                    (sip_writable_mask | lcofi_mask);
 
     if (env->virt_enabled) {
         if (env->hvictl & HVICTL_VTI) {
@@ -4392,7 +4433,7 @@ static RISCVException rmw_sip64(CPURISCVState *env, int csrno,
 
     if (ret_val) {
         *ret_val &= (env->mideleg | env->mvien) &
-            (S_MODE_INTERRUPTS | LOCAL_INTERRUPTS);
+            (S_MODE_INTERRUPTS | lcofi_mask | LOCAL_INTERRUPTS);
     }
 
     return ret;

base-commit: a925240509d1b4b656cc480f1cc79ba4d7c8bc08
-- 
2.43.0


