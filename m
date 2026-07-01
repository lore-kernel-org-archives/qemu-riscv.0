Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57C5DC43327
	for <qemu-riscv@archiver.kernel.org>; Wed,  1 Jul 2026 09:23:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wer9j-0007Zc-OK; Wed, 01 Jul 2026 05:22:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wer9i-0007Z7-4A
 for qemu-riscv@nongnu.org; Wed, 01 Jul 2026 05:22:54 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wer9g-0002Wl-CH
 for qemu-riscv@nongnu.org; Wed, 01 Jul 2026 05:22:53 -0400
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6618GFcU488405
 for <qemu-riscv@nongnu.org>; Wed, 1 Jul 2026 09:22:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=aP3/6FaYOBbAQXbEok4/lvQIxgKUn33JL3G
 GE4UZhGU=; b=BLOzJ7txiIw29G3Ol8vaj4xniqUBaTIh3uREU3Ba22CvK0q/YeG
 gqGP2j8aEgzHpCccJS9JFoSyoOkT6mHWGaQ5G+PFMso6snyUoVBTpvoT4ChoaBmr
 CxZK2VQjciqvtEb3V1eKTRvDz4RurKQIfDp++kfJdxjw/nKbq36TOcpYQ8bMuO+/
 u9Bus02z6tN76qY9qufH4gMMjEee1A8zCYau1ClhI/YCZ0CGKV8IBFh6HG33cvqA
 09+5I/o0fgYZw9mZ/SxZP4Ah3IRwJqno/UxeZ9PTOIzuMFWTN3+b5TBClhMbWnwk
 DLDwnaNPEcn9f4uvJIJopgQQuizpRriSuSg==
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com
 [209.85.160.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4rsy1wnb-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 01 Jul 2026 09:22:50 +0000 (GMT)
Received: by mail-oa1-f70.google.com with SMTP id
 586e51a60fabf-43b6de00772so239253fac.2
 for <qemu-riscv@nongnu.org>; Wed, 01 Jul 2026 02:22:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1782897770; x=1783502570; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=aP3/6FaYOBbAQXbEok4/lvQIxgKUn33JL3GGE4UZhGU=;
 b=gt+b4slcu9iisuj41oGrIwTRyaYZLwy5PlaUoyy32txPTuGMCRAHjbblPZ4Nk5MbpO
 xTFk66fwSOKIc9sOlWCSEdNbxes8GV17qv/ilgKsgoz9d2NEd0DhbAdgHYPkSvRKKBJK
 l8EvGPj6IKPtyHFhyOAx1R61CtI2vwLuibDO8jLWcgMJRnraTF0mR735LaegIVFPVdBe
 SJntmK9a8S1LP5iZXD0mHNO4wzisk6IXmmjDPHKw4cWqKjWx2HTo4LpxY3FLmbbPrF1+
 LnRZJFKP2Fg0ac4+JwKgs8oWiVT3u4SauJHumvJfJHs27gkIMtsR2ggfgy/KrSPTmDAE
 /MxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782897770; x=1783502570;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aP3/6FaYOBbAQXbEok4/lvQIxgKUn33JL3GGE4UZhGU=;
 b=WX/JJJhs/L5v0/siIoc2a1qMFw9sEC94Nz/vzpMQv2AoYr2CXqy90lNKwyKpiha97Y
 vzUio42qAV7XL4UkQDBEiK6zGrRFOuG6CYW5OdvXnH1SmXr45yMcIHtkBF3woL62XlpP
 1ELgib6WTgf6ui5ctgEAp/wzJ8GUihIdjHNba0bA5G1sHXyxi3jn/qnU/1BAouHXs4/q
 o5D/yJT51H8r9DhI9FH7s+LeDkHnIqUAxXrafwJyAnSdcmibsF7LbkXmDA2SfBhm4Jmj
 7LLRLRsdlzyghvbrgOl3vM8HJ1R4lZORWVWGIyf7C2yYoH9hqbz0r6MBrVLZRBxPE/Y0
 a2pw==
X-Gm-Message-State: AOJu0YwCswzrFRbqjn/3pgKCeIMuc9lphljU58uqVCIU9CMcr4oIeCnN
 ErX4+ajPBGXHOMojgdhz624auadgerV134VvZ7ahWIwxz0UmtuU1yMxfzuEnedw10a2qc3mJNQq
 j7oX7JEKLbOs6ubjFH96yl5BkDQ+L3j6UTARvZnqktG+9iVv9GnaWuWPo8w==
X-Gm-Gg: AfdE7clTDKsZzkSu/u+WAAHmx/mFOhSu1LEgKopLrxTNCE93GGXHBo0mCFb2GiajtRZ
 qsyi+Gkkw4XH7DHZlzErvLUogMTu0EfpqGb7d5sNDSdAzbl2nkTul0t3PGl3Mj9/3l7qDLKPuA9
 8VCRHDqNPMqV4fCpRfpcTBUkllD5AdU+VvIFvmG/b2UYEsNYmC6tC5JpeRr/uoaEC1uFaLUomz+
 UUKFQDjx9cG3I9NM4NJGh1h2+IIcxDkw/Xeh5Qpm7DlqF5eArDH6zYTif6/m2rk/mFKNK+KdNLI
 KbNMN/jEx6Wp24w2rKzCYPnAFsNCwFdsdBrBT4jMJJsYjzlSEGDr4Yw8Fke2tgdtEtl9kIcIWFk
 PGfx14yTFedD4wfs0IJwic8Zt1AGwzywYn2WsK1sD3QlE2w==
X-Received: by 2002:a05:6870:d40e:b0:448:558c:d8b3 with SMTP id
 586e51a60fabf-44cabc2e295mr392062fac.41.1782897769906; 
 Wed, 01 Jul 2026 02:22:49 -0700 (PDT)
X-Received: by 2002:a05:6870:d40e:b0:448:558c:d8b3 with SMTP id
 586e51a60fabf-44cabc2e295mr392041fac.41.1782897769451; 
 Wed, 01 Jul 2026 02:22:49 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([189.79.21.40])
 by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-44c613c0457sm1222120fac.3.2026.07.01.02.22.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jul 2026 02:22:48 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com,
 andrew.jones@oss.qualcomm.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH] hw/riscv/riscv-iommu.c: set ftype and iova in
 riscv_iommu_ctx()
Date: Wed,  1 Jul 2026 06:22:41 -0300
Message-ID: <20260701092241.307801-1-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: zEshWcPrKBNIAwAOZpy7Q5gdMIWfEs-X
X-Authority-Analysis: v=2.4 cv=fLgJG5ae c=1 sm=1 tr=0 ts=6a44dc6a cx=c_pps
 a=nSjmGuzVYOmhOUYzIAhsAg==:117 a=sHJf4AwOIoU3qjeHFPlg6Q==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=p0WdMEafAAAA:8
 a=EUspDBNiAAAA:8 a=u8ADOvQWIPrcURbT9VIA:9 a=1zu1i0D7hVQfj8NKfPKu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDA5NiBTYWx0ZWRfX9ZJ5VKlgC6Rx
 OT6fUnm69xWCc8dKCGC6fxQ0UiiG4GM9U/ZPBLcNuqXIZRBLNoILP/3RicPu/YqMtdHLZUXk8a8
 ZWqejOYORFVqq7LVKokwj/WcQuKVB+9Rofu1S9a4wcKukNpZU3DZqjPT117HJYH7QXS6MI5kfEg
 dyRRez64ANUmL7DTZYHEOrh0kMJ9kSeEUMIzNCG3qU4XBA+31+YJ2Zd0plt716rQtGKxqYnd/pK
 C+iol+8tg/NGT3MGLgk0hTa2xQx7FJD0Gxgz362aZIf2Rmx5IeXHN2OAJ23Lr0Fq/IL/17Ql7+F
 qxo6QSuq/4ikrYvP1QWpni0Jj0Fx6Gm9frMgbkBAVGSyYWQq59RdW1PmCbsvCZCQaItROzDkr6I
 ENj/T82FNHUxmhO2Y1ayT7YgV7xRoyrWSEWueviBWGCTVRaON0MbNoZniMqb36pR6Bjqx3bjQej
 6krZ+lQgUyTOd1xsm3Q==
X-Proofpoint-ORIG-GUID: zEshWcPrKBNIAwAOZpy7Q5gdMIWfEs-X
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDA5NiBTYWx0ZWRfX1645xULDazwN
 wDI7LNKSDqQlwmRCiqlESCJcF2AWeW8DtVtJQkz1KOieNga7rKEg12OUdYMGA6xkN4imdKsT1ZH
 U53y8loz8zGXpTzFCELfVKjCEFv6uGI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 bulkscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010096
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=daniel.barboza@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
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

We're hardcoding faulting type as READ, where it could very well be a
write access, and we're not recording the faulting addr/iova.

A note was added in the fault_type logic because I wasn't able to
trivially handle a probable code repeitition it in this same patch.
Something to do in a later date.

Fixes: 0c54acb8243d ("hw/riscv: add RISC-V IOMMU base emulation")
Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/3564
Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
---
 hw/riscv/riscv-iommu.c | 29 +++++++++++++++++++++++------
 1 file changed, 23 insertions(+), 6 deletions(-)

diff --git a/hw/riscv/riscv-iommu.c b/hw/riscv/riscv-iommu.c
index 70eede3f14..690c21289f 100644
--- a/hw/riscv/riscv-iommu.c
+++ b/hw/riscv/riscv-iommu.c
@@ -1330,6 +1330,7 @@ static void riscv_iommu_ctx_inval(RISCVIOMMUState *s, GHFunc func,
 /* Find or allocate translation context for a given {device_id, process_id} */
 static RISCVIOMMUContext *riscv_iommu_ctx(RISCVIOMMUState *s,
                                           unsigned devid, unsigned process_id,
+                                          IOMMUAccessFlags perm, uint64_t iova,
                                           void **ref)
 {
     GHashTable *ctx_cache;
@@ -1339,6 +1340,7 @@ static RISCVIOMMUContext *riscv_iommu_ctx(RISCVIOMMUState *s,
         .process_id = process_id,
     };
     unsigned mode = get_field(s->ddtp, RISCV_IOMMU_DDTP_MODE);
+    uint32_t fault_type;
 
     ctx_cache = g_hash_table_ref(s->ctx_cache);
 
@@ -1381,8 +1383,21 @@ static RISCVIOMMUContext *riscv_iommu_ctx(RISCVIOMMUState *s,
     g_hash_table_unref(ctx_cache);
     *ref = NULL;
 
-    riscv_iommu_report_fault(s, ctx, RISCV_IOMMU_FQ_TTYPE_UADDR_RD,
-                             fault, !!process_id, 0, 0);
+    /*
+     * TODO: (1) do we need to distinguish other fault types
+     * for ctx fetching and (2) evaluate putting the 'fault_type'
+     * logic inside riscv_iommu_report_fault() - there's at
+     * least one other place (end of riscv_iommu_translate())
+     * that does something similar.
+     */
+    if (perm & IOMMU_RO) {
+        fault_type = RISCV_IOMMU_FQ_TTYPE_UADDR_RD;
+    } else {
+        fault_type = RISCV_IOMMU_FQ_TTYPE_UADDR_WR;
+    }
+
+    riscv_iommu_report_fault(s, ctx, fault_type, fault,
+                             !!process_id, iova, 0);
 
     g_free(ctx);
     return NULL;
@@ -2128,6 +2143,8 @@ static void riscv_iommu_process_dbg(RISCVIOMMUState *s)
     uint64_t ctrl = riscv_iommu_reg_get64(s, RISCV_IOMMU_REG_TR_REQ_CTL);
     unsigned devid = get_field(ctrl, RISCV_IOMMU_TR_REQ_CTL_DID);
     unsigned pid = get_field(ctrl, RISCV_IOMMU_TR_REQ_CTL_PID);
+    IOMMUAccessFlags perm = ctrl & RISCV_IOMMU_TR_REQ_CTL_NW
+                            ? IOMMU_RO : IOMMU_RW;
     RISCVIOMMUContext *ctx;
     void *ref;
 
@@ -2135,7 +2152,7 @@ static void riscv_iommu_process_dbg(RISCVIOMMUState *s)
         return;
     }
 
-    ctx = riscv_iommu_ctx(s, devid, pid, &ref);
+    ctx = riscv_iommu_ctx(s, devid, pid, perm, iova, &ref);
     if (ctx == NULL) {
         riscv_iommu_reg_set64(s, RISCV_IOMMU_REG_TR_RESPONSE,
                                  RISCV_IOMMU_TR_RESPONSE_FAULT |
@@ -2143,7 +2160,7 @@ static void riscv_iommu_process_dbg(RISCVIOMMUState *s)
     } else {
         IOMMUTLBEntry iotlb = {
             .iova = iova,
-            .perm = ctrl & RISCV_IOMMU_TR_REQ_CTL_NW ? IOMMU_RO : IOMMU_RW,
+            .perm = perm,
             .addr_mask = ~0,
             .target_as = NULL,
         };
@@ -2482,7 +2499,7 @@ static MemTxResult riscv_iommu_trap_write(void *opaque, hwaddr addr,
     /* FIXME: PCIe bus remapping for attached endpoints. */
     devid |= s->bus << 8;
 
-    ctx = riscv_iommu_ctx(s, devid, 0, &ref);
+    ctx = riscv_iommu_ctx(s, devid, 0, IOMMU_RW, addr, &ref);
     if (ctx == NULL) {
         res = MEMTX_ACCESS_ERROR;
     } else {
@@ -2784,7 +2801,7 @@ static IOMMUTLBEntry riscv_iommu_memory_region_translate(
     };
     uint32_t devid = riscv_iommu_space_devid(as);
 
-    ctx = riscv_iommu_ctx(as->iommu, devid, iommu_idx, &ref);
+    ctx = riscv_iommu_ctx(as->iommu, devid, iommu_idx, flag, addr, &ref);
     if (ctx == NULL) {
         /* Translation disabled or invalid. */
         iotlb.addr_mask = 0;
-- 
2.43.0


