Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8B6DC43327
	for <qemu-riscv@archiver.kernel.org>; Tue, 30 Jun 2026 17:21:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wec9O-0003uC-M6; Tue, 30 Jun 2026 13:21:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wec9D-0003p9-Li
 for qemu-riscv@nongnu.org; Tue, 30 Jun 2026 13:21:23 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wec9B-0006az-3e
 for qemu-riscv@nongnu.org; Tue, 30 Jun 2026 13:21:22 -0400
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65UEDeEL2152376
 for <qemu-riscv@nongnu.org>; Tue, 30 Jun 2026 17:21:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=3ro2aSb9dHcrzzgPkP3J5s3lSU/GWXp1eNi
 tAJPgj3k=; b=PdDuSoi0M/7CCoY2yJ/Sr8ZB/CnewaSSx3mQ/7ccpoAGI1Q+D6M
 hn/6TCq7Q2kML19dOFqxyR/hyLL4jEPXgCjXy9yvRfw1ROuhOrxVKV6c+2Q2LiMT
 8oHVjEB2fEmtWk7O/iEoE7g+U+jyIUfjziaZQOYAMctljGraZU3bml3JaIs/bif6
 XnRdo3s1icM7R0EjRx2RUtUtZj4cFpYxdjdfj1TMb9Pt8MtyKnXo6VsaIfI3aQk2
 RS2XKrM4aIxF301lpJqsB2oE1YQNynOXBp4KmfT4yJnuidiGP0XBpqs4U3F4NWF0
 exk/OjSUsjfu05kcGyZffb7gu7JQK4yw5uw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f44v4ks7q-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Tue, 30 Jun 2026 17:21:18 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-51c1d7886cdso7712801cf.1
 for <qemu-riscv@nongnu.org>; Tue, 30 Jun 2026 10:21:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1782840077; x=1783444877; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=3ro2aSb9dHcrzzgPkP3J5s3lSU/GWXp1eNitAJPgj3k=;
 b=d2fL7X6fL2eFiq5hbZyMZrqFrFKUHBcZZ6glns8uF1B72KsjhT/roaY5nBxGhpKfo9
 k0ivPboH8Nsg/UgOkGaCAaDLBp+M7eLQYDhjUJ4r1GjFMuN2Fk6KtH2HgeL++wv9EZXq
 ZphzJK7HyDzoKWwd+TYLnvDuc1AdemOZsACmjI6sUa0fXQEUnkggL/TN9ai0t2wgiPkB
 EL89eremzgtfbYCH66MaYcLLtl0J+gwIaozTCtLHDLRjU8Hb41uA1Ji9UKuf0Wft9GPY
 N7sJwPDDM1mavUj1qyHcCV9mN2IBEWYa3lfSDRPReRKfwx8dKvqpgK1ekvXtFQd7vo93
 RIAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782840077; x=1783444877;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3ro2aSb9dHcrzzgPkP3J5s3lSU/GWXp1eNitAJPgj3k=;
 b=h4qMzW9B2bhNUj9up0n9Vcj7bZrGL7K4ET2CCYF+IpTxIrn7BDrPxxVb8cWKdsBRpx
 12Fbq/ZmkKlRL3RMJ4gmyBGOTr6jG2Oa4mwgRtsrGwN0unY+AdiAGwfY7i8Tql1CbTyd
 ukmgEh2qv9XL1BTWiqTcE4YL0xTzbwchUX1gyGCxwqoc+p9GQ+HtEkKZFMXSk07Lq5aH
 +5Gn2JHjrQwjArN0P95SShFnmOfi1sb1S7oIOiRQiFjwFXyaaOnK4r2cx7GsteseALyl
 O5dVYmZ+Jd8+9tgewh0bGOz0EGcJ9jF4w9xdAfaYSPun62tKVVoVsiNwy30Z2OkDxCLm
 qHlQ==
X-Gm-Message-State: AOJu0YwLG/Vo/d41nnD1mHY0BFcfcGb2jMe/EfYK474G2IyugunerbZC
 6GuX8bcg0kX+GKgQIOhimYWAP6fPUccah1+oIG7sdKaeiuIdaD0So7+7qcphKRuDLMXxpRI+Ygi
 ISa+XcuFJG/7WyOJ2qwIWuZfF+DwZAMB2t0rx4FKFkuAYnUamlfHqatBuQg==
X-Gm-Gg: AfdE7cnfhuzyHy+fNtQI/vgFUY4q1scJR4140i65N64ypFFzfWIX2igU1H/1LCNuJma
 TKZNg8ogfZQOD1ZL3XVRurSBf5r5RcHKmLsHWiwSMVggqSevZd2JzTE353csUVP8ZLbpjGWPk+I
 K9tOlRmHNmhwZRNBhmHmbRjx+ndJgFvR2AYbUnRi+eVcsXInge1L9xf51moBpEQ53we3pOn/4tz
 bh7E+Cs9QERie4MPq7b1kwK3aC0avL9+mrvWy+GJA0m3wXha42jufGXEP9p4wEuhLtNIRVwTWIs
 pjwJAnyI7tFwlos3floBbojAiiWzK3unS8u4OYJ5aS1X8LlfD13buhsREAbVnIkOXxVLmWlYP6Q
 Dq9M9bWUrzKQf9YzNhwQbwBuosMPXeUGWJLMXSlOd8lbJOA==
X-Received: by 2002:a05:622a:903:b0:51c:1a46:9148 with SMTP id
 d75a77b69052e-51c1c9f3d61mr21353731cf.34.1782840077267; 
 Tue, 30 Jun 2026 10:21:17 -0700 (PDT)
X-Received: by 2002:a05:622a:903:b0:51c:1a46:9148 with SMTP id
 d75a77b69052e-51c1c9f3d61mr21353231cf.34.1782840076754; 
 Tue, 30 Jun 2026 10:21:16 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([189.79.21.40])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-51c10862ecbsm22704371cf.11.2026.06.30.10.21.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Jun 2026 10:21:16 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com,
 andrew.jones@oss.qualcomm.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH] hw/riscv/riscv-iommu: forbid GATE/SADE if caps.AMO_HWADD is
 zero
Date: Tue, 30 Jun 2026 14:21:10 -0300
Message-ID: <20260630172110.1866951-1-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: oB8OyjjB_7lG3LyvvJ-Q_00hIZ3Sggd_
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDE2NSBTYWx0ZWRfX3TVk6aPQUoZG
 eG0B8LuONGmnoTyJzGZ/hNfD8GfmldvQU1Qfa73Yd4TLBeoLDXgJ9NZVk4Iu1z0Bm0DDxtQ4WAG
 fQjqsPW+TlVdydwj9/HJnJtLwk48t2M=
X-Authority-Analysis: v=2.4 cv=JI0LdcKb c=1 sm=1 tr=0 ts=6a43fb0e cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=sHJf4AwOIoU3qjeHFPlg6Q==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=p0WdMEafAAAA:8
 a=EUspDBNiAAAA:8 a=fpgzQ8Lw9WClb1XMRzwA:9 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: oB8OyjjB_7lG3LyvvJ-Q_00hIZ3Sggd_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDE2NSBTYWx0ZWRfX+zRHm2f7r1bS
 X6wmlcIjHGxR3jauzYroID11ROS7CsF1/Un4NS6hfaolhUpuVA79bDF6CH3y0YRCMyo7aQX91y1
 askJ6DUjTuWmzovr7eyO3yFMpIn4jEc5MWifA5UyMZ5SeMU3ky4NJ83GFNqhyIaGYHGg74Pgi66
 8EVqhxhPJ2dGXwinzxZsD6zItBAVfEiS5P7Bp0ox/jBFd3d9muZKoUdHaBuVjfnbIsX7vU7bMj8
 qw9y3h+2xXpgYLbtrbfzuv2XXSOK0uFYnw7Mz1YBtVN1Bns/kRSxJYioym3LLTU3UkAcptGyRsV
 cZBjWGhei090EBbrGWrz/hvMmCB1a4z5RfeHM6ABQZTNXnJ8euN40RQPBMCLlrfeKj/u6r25VvZ
 DLLWJqlqcCrczwSQnbSBFPKqNxjn4Z5/7shmreE4zpCybwACniZjmWxWGEaaMl4HEhjVVi6CykH
 p7H820es1wZiZvDbfdQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_04,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 impostorscore=0 lowpriorityscore=0
 spamscore=0 bulkscore=0 suspectscore=0 malwarescore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606300165
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=daniel.barboza@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
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

When capabilities.AMO_HWADD isn't set, DC.tc.GADE and DC.tc.SADE are
reserved bits and setting them throws a DDT_MISCONFIGURED error.

Fixes: 0c54acb8243d ("hw/riscv: add RISC-V IOMMU base emulation")
Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/3549
Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
---
 hw/riscv/riscv-iommu-bits.h | 1 +
 hw/riscv/riscv-iommu.c      | 5 +++++
 2 files changed, 6 insertions(+)

diff --git a/hw/riscv/riscv-iommu-bits.h b/hw/riscv/riscv-iommu-bits.h
index a938fd3eb4..2e8bc19dca 100644
--- a/hw/riscv/riscv-iommu-bits.h
+++ b/hw/riscv/riscv-iommu-bits.h
@@ -86,6 +86,7 @@ struct riscv_iommu_pq_record {
 #define RISCV_IOMMU_CAP_SV57X4          BIT_ULL(19)
 #define RISCV_IOMMU_CAP_MSI_FLAT        BIT_ULL(22)
 #define RISCV_IOMMU_CAP_MSI_MRIF        BIT_ULL(23)
+#define RISCV_IOMMU_CAP_AMO_HWAD        BIT_ULL(24)
 #define RISCV_IOMMU_CAP_ATS             BIT_ULL(25)
 #define RISCV_IOMMU_CAP_T2GPA           BIT_ULL(26)
 #define RISCV_IOMMU_CAP_IGS             GENMASK_ULL(29, 28)
diff --git a/hw/riscv/riscv-iommu.c b/hw/riscv/riscv-iommu.c
index c9687e01a8..891a56e731 100644
--- a/hw/riscv/riscv-iommu.c
+++ b/hw/riscv/riscv-iommu.c
@@ -416,6 +416,11 @@ static int riscv_iommu_spa_fetch(RISCVIOMMUState *s, RISCVIOMMUContext *ctx,
         const bool ade =
             ctx->tc & (pass ? RISCV_IOMMU_DC_TC_GADE : RISCV_IOMMU_DC_TC_SADE);
 
+        if (ade && !(s->cap & RISCV_IOMMU_CAP_AMO_HWAD)) {
+            /* GADE/SADE are reserved bits if AMO_HWAD is cleared.  */
+            return RISCV_IOMMU_FQ_CAUSE_DDT_MISCONFIGURED;
+        }
+
         /* Address range check before first level lookup */
         if (!sc[pass].step) {
             const uint64_t va_len = va_skip + va_bits;
-- 
2.43.0


