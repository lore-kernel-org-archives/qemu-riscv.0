Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84DBCC43458
	for <qemu-riscv@archiver.kernel.org>; Sat, 27 Jun 2026 19:47:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wdYzR-00047d-2i; Sat, 27 Jun 2026 15:46:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wdYzP-000479-9e
 for qemu-riscv@nongnu.org; Sat, 27 Jun 2026 15:46:55 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wdYzN-0003wu-Eb
 for qemu-riscv@nongnu.org; Sat, 27 Jun 2026 15:46:55 -0400
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65RHnTmW1715233
 for <qemu-riscv@nongnu.org>; Sat, 27 Jun 2026 19:46:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=94n6dLvTjm7QHNy4xfjSKqYgyXJrT1voiLo
 hDSjYbB0=; b=WDR1dJwvcaJmqu96NkWjj2uY1U7D9pBmnmGiOkQ6F3Pc4oRNSd3
 ThJ80OFXaNAINj2Xf+hD3/Bnl9RHWD6FLmpULsDp5P71q4+dN1r26u94jvvTCtM1
 pVjRQM/divYVYprw8+T3XUp+qzUdSkC0gTCTVh/h/c7xhH8bJivZP/UL+iwMsbC1
 B1n0jH27dqvo68fbxEPWzrGNgTrbL8Q5Mf1wvPAadfNjJE2mDXxzUTGSnxhYRG8l
 qEKekaYB7CP5SVrU68ct1dSiT1o7AspErBqTV8bT2+cp2nBzBbp28gdOVk/gMqpG
 FmWmTkXGMXLJL9E7KdwQHmJzQc+MssjSIQA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f270a1kb0-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Sat, 27 Jun 2026 19:46:51 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-51bcdc337e9so12731101cf.3
 for <qemu-riscv@nongnu.org>; Sat, 27 Jun 2026 12:46:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1782589610; x=1783194410; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=94n6dLvTjm7QHNy4xfjSKqYgyXJrT1voiLohDSjYbB0=;
 b=IAC2s3bxBah/8Ck1IMu+u/0oPxCSC2j3oR/l59YLkayvUdCzXnU76KTSfmcuffFEV5
 0OixD4JvxGR/mL40SNdh3umzD9SvD8MCb0aqwdH95GoHzvYNVeQKhqQhn2X+H0WjY1db
 qYF9CPHb+XdmtBwKFRArCq6G4sZA34VYVa9+I1i4rQT49ivKOd1XFwqe2vsrYdLCV57W
 xpzOw2iFVdAF4nilomcI2daCv86zMVoXzqJ6pDKGsWL2t94PSi7plyy5zD0hNhlB7J9i
 uYuOXIryMyZvEY7Jrw7ZUA+ZjKOy4nnq83xTR3nCE/9nMcUTdzhmvc515716Ia8Evdtw
 pG3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782589610; x=1783194410;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=94n6dLvTjm7QHNy4xfjSKqYgyXJrT1voiLohDSjYbB0=;
 b=CReImtQuZgtBGgdEEWzalLcK2+wVJcSIdyOLh7Fwik/e8b4qEHFMQCZq4gGY2N3BL/
 HgwR1tSARJz8uv3rSB0rsIwO7Aea6xaLRKmOgwn5483fKn56wHbJfMxkFkzBld/DCp1j
 Er7AQdHEx+N8/gPGNYc/iW9ujZUwvlUQSvHwEDBePvPGcZAsc3Yui1wKFl0iboqAqg4+
 K8SrmI9uFfwgKtehc1E66yhd9I1SDGRC09AoCggDO2MO9iEuJAZq86eDFMxXgk80OCvE
 AuGn0lT2GSv+lMzO4QKN55vNFj2utxkidKDLKsoKpMxxg9+7AhVNvywVV2y9jsEGoyr6
 HCVg==
X-Gm-Message-State: AOJu0Ywif/MR/tFtOMRDyCJcvgW0DDzApRnLslzfvciptZCWgpBo13es
 teIsd9wZh437Xn0ZRI6MezVXDsm+GqzMCuL7jf3lSBnaQH1rXvxALyuo2DQWYxu2sR3Tg2blB27
 GGnahS+4B6sesqasYCgwaKyHSXjfN/4vqXQinX7z00GQHq+g380lLboeNcw==
X-Gm-Gg: AfdE7ckalM7lRzm324OS78UFncWwthcSzMX3Hlu8cZcigS6wuzQHn/r8TbiHr1eEpOM
 jtE4tPmRmd4YKgqYlM7rnY7Sk0Q75sL/0PgymMyPgSA9QAoy/jG+jkEEx0//VOMQM0Z/SD/GoRg
 IgvKcKoeHbYVQ9gteQRXIsgHHLrigHGSPJ51D3FW38yAEmXCzqea3/fP8kQMIz9K8Wv8o11k8yO
 quqi4RdngBoCsFDkFgGYzAlzVam4rHMqDzVocrhsIyDnJxthAyYRcJ7o5GqC0MvZFFHPeOrP5Mq
 vyZeSvXqNX4pY47nBQEKESEuSII4GZBursi969gYtnXDGKIdbehcOm6hGKvl8jvnRLEyEB4L3kW
 QYEwjIaJP8ALCQog2oSN+Qau6RdFe1+UJlbf812GukmzjsQ==
X-Received: by 2002:a05:622a:1b23:b0:51a:329:e802 with SMTP id
 d75a77b69052e-51a72a562b6mr184253961cf.41.1782589609168; 
 Sat, 27 Jun 2026 12:46:49 -0700 (PDT)
X-Received: by 2002:a05:622a:1b23:b0:51a:329:e802 with SMTP id
 d75a77b69052e-51a72a562b6mr184253591cf.41.1782589608734; 
 Sat, 27 Jun 2026 12:46:48 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([189.79.21.40])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-51a51a9c533sm133678271cf.14.2026.06.27.12.46.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Jun 2026 12:46:47 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com,
 andrew.jones@oss.qualcomm.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH] hw/riscv/riscv-iommu: check DC.TC reserved bits
Date: Sat, 27 Jun 2026 16:46:40 -0300
Message-ID: <20260627194640.4130073-1-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI3MDE3NCBTYWx0ZWRfX3QlnOScRK9me
 RULR3mG0t+361KObgwbvfOKHhdUCJe9Z6zDTD2j5VW7CRrp7B+iawt6/D78g/yIQ/BnLvIDLMiy
 /WjNj5cz+f0OyHCPYYgVtlqq3P4KKj81J3/7Xe4828AiDvRzFRKgfW6kQnqeVTD2ZhCu+OutYMg
 VGLFnsuuHt6g5QyFLXirJXuug1bqiU4mAn4vC3vRNRTqYTU/bCnlqRkyGgnxzMv/0ZVLikY9pxb
 Xy/bKcM2xRGX58MYxR+qgelkXihbn3CXapEziHunAvTVV2A3tMZCfdZlurofTUYznjyTmyDYo58
 ybTTMqNZCblCyYGUHjIk2UqMAs4mrLI55xHqmRKXhaoXDlpY5P4HmELUrGhY2asvbcZTbgLJGrX
 Y+GpewW9/DEj4Ec9RUmS46xqph750OwstSL46L5bJS9XpNEg6h5tunEA/bwAgEsrUbNn35VJb1Z
 lpYZ6yo7eb+gQ/uytvA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI3MDE3NCBTYWx0ZWRfX+bRMq2dN/9u8
 ivRAIRo7a+nUkKlBo2MIUpevY5rqNi7qLhF6hZpjiZeiNktMnppUEHkDG9MpWVD2SVqcOUfsVp+
 Jbu7SdVK+2ktRDjOHbdET/lM4i20hJI=
X-Proofpoint-GUID: PVkyNdpYIggubn8xDhRYOPtXOkvJHrkq
X-Proofpoint-ORIG-GUID: PVkyNdpYIggubn8xDhRYOPtXOkvJHrkq
X-Authority-Analysis: v=2.4 cv=Fe4HAp+6 c=1 sm=1 tr=0 ts=6a4028ab cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=sHJf4AwOIoU3qjeHFPlg6Q==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=p0WdMEafAAAA:8
 a=EUspDBNiAAAA:8 a=wYWBzaFdCuXwoWfkOlAA:9 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-27_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 adultscore=0 lowpriorityscore=0 phishscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606270174
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=daniel.barboza@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=0.001, SPF_HELO_NONE=0.001,
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

We are not checking for reserved TC bits being set during device context
validation.

Fixes: 0c54acb8243d ("hw/riscv: add RISC-V IOMMU base emulation")
Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/3548
Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
---
 hw/riscv/riscv-iommu-bits.h | 3 +++
 hw/riscv/riscv-iommu.c      | 4 ++++
 2 files changed, 7 insertions(+)

diff --git a/hw/riscv/riscv-iommu-bits.h b/hw/riscv/riscv-iommu-bits.h
index a938fd3eb4..f9b6f35170 100644
--- a/hw/riscv/riscv-iommu-bits.h
+++ b/hw/riscv/riscv-iommu-bits.h
@@ -308,6 +308,9 @@ struct riscv_iommu_dc {
 #define RISCV_IOMMU_DC_IOHGATP_GSCID    GENMASK_ULL(59, 44)
 #define RISCV_IOMMU_DC_IOHGATP_MODE     RISCV_IOMMU_ATP_MODE_FIELD
 
+#define RISCV_IOMMU_DC_TC_RESERVED      (GENMASK_ULL(23, 12) \
+                                         | GENMASK_ULL(63, 32))
+
 enum riscv_iommu_dc_iohgatp_modes {
     RISCV_IOMMU_DC_IOHGATP_MODE_BARE = 0,
     RISCV_IOMMU_DC_IOHGATP_MODE_SV32X4 = 8,
diff --git a/hw/riscv/riscv-iommu.c b/hw/riscv/riscv-iommu.c
index c9687e01a8..c2c470b5df 100644
--- a/hw/riscv/riscv-iommu.c
+++ b/hw/riscv/riscv-iommu.c
@@ -752,6 +752,10 @@ static bool riscv_iommu_validate_device_ctx(RISCVIOMMUState *s,
     uint32_t fsc_mode, msi_mode;
     uint64_t gatp;
 
+    if (ctx->tc & RISCV_IOMMU_DC_TC_RESERVED) {
+        return false;
+    }
+
     if (!(s->cap & RISCV_IOMMU_CAP_ATS) &&
         (ctx->tc & RISCV_IOMMU_DC_TC_EN_ATS ||
          ctx->tc & RISCV_IOMMU_DC_TC_EN_PRI ||
-- 
2.43.0


