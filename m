Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3845BC43458
	for <qemu-riscv@archiver.kernel.org>; Thu,  2 Jul 2026 18:07:42 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wfLp4-0003Yn-Sh; Thu, 02 Jul 2026 14:07:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wfLoq-0003Mq-I3
 for qemu-riscv@nongnu.org; Thu, 02 Jul 2026 14:07:25 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wfLoo-0002It-Sv
 for qemu-riscv@nongnu.org; Thu, 02 Jul 2026 14:07:24 -0400
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 662FUaA9865995
 for <qemu-riscv@nongnu.org>; Thu, 2 Jul 2026 18:07:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=tPM5defz8fhiv33+DdVdq+wcC2qATd+If9J
 OKOsfJ58=; b=cF3ytA1trANgWr5wvTqscacRoQUu0BMXjL0KnWSAgSL8UTOUnrv
 gNJFtWS3t2JkPgDURQlAudUzEQTjg6bc3mJlEqDAtDK6hCKVI4XqzaMNLr4GqY2B
 nvbuap/i8BGm+QVVYeCBxu5eRMMC+gquXvcflIaZfJFBourBmhG0BwP0nfJT9s+H
 OrnU0jaURkL+J8q/OcZVs3+7f+FHY0AKSOfnU1a3uXrvm7C6p91egXL61g3AfTib
 h604QRnwlOEgYA9BIymh1rLfS+incn/TsrwwgKkQbbuesi/pVVpAg05y8aSifYzL
 4GhzbdOhFR7Gdk9xIsxBSE1Qxbh6shXqW2g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5tpngng0-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 02 Jul 2026 18:07:21 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-915d3261c5cso203403785a.3
 for <qemu-riscv@nongnu.org>; Thu, 02 Jul 2026 11:07:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1783015641; x=1783620441; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=tPM5defz8fhiv33+DdVdq+wcC2qATd+If9JOKOsfJ58=;
 b=c9mQmb3VQOHcTY5Ue+SEYqEpqT5BS7pvE0EG36mJIoEw33/jhRMTGIu93H0GT4vePR
 UiFFA13GsluhYsBRM2gRjlEyHRO7YAHh74isgxgk1nnsyi4qtkaFeOLz9iSsru/eUb3/
 LR1tkxluy680lIzN2ucIQypE8QJInfkp/d06nPXiQ3aERWK48UR4slvSFH9KkKOv3J49
 W1eV3lJ2ujBEXbA/O8V71LCsBJb7OnTH212QwZ6FwUATeCMx+k7r3ZOR2zGVPvVe6z1R
 c4FxM+EmuhgXhwoWtVrmcUkKGXLI9itn1e9/8NeT4CxvfzaUznLGpfSc/YtCCuUR2Ysy
 58zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783015641; x=1783620441;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tPM5defz8fhiv33+DdVdq+wcC2qATd+If9JOKOsfJ58=;
 b=MTLmbDANie74r93xFh2gPSF+svxSr+1pUiyEAbfYY/NsF3IzelLmOsH6lz2duRnE2i
 zwDkfFiosJoxEL+Nu1nfZQdg0rjkDoMRbscwNPNeWoe36SAXDRPvREteZ4rKPzP50N22
 ykGYKnirRSvLtfpeKXiS+KUsgK9pTv7RicgmXehLprO2vfksLw88TBSSlj6vmBBFl2V5
 JYcbYuZqJ3S+sk/TqKeAQ6rLF65WJQoGzb4RJ8CQ/mRbybDrQTWByvqh7vr7ySai/QJ1
 tuu4LV7sTSHYGiabRigDonUNWPkx+xNV7yj7/B4zzt6pT+2jJG5qCIqNoNZ4Cf6QB2kl
 TIzQ==
X-Gm-Message-State: AOJu0YyIUR8Pn0j7WnpLSi90HiYPMZCj6jQt/xG+Q4g6VNsh9erfXsvn
 OGEanBNaLIAt3CCI4dvd6GIzy7f3jrk8bs2iWwTUwA2Qlds1uPPDvC0GXB4lg50evUWdnGKNNmj
 lbCCorAXgzIbw/bai2mb0WiHG3PPPUrmzGk+5VWar1JryM2bqX/+DliT8VA==
X-Gm-Gg: AfdE7ckSHEE1+und7xiYVvrc7Aebe7+dvP2zKg5mr7rmZU7mcqj6tqeFiXtLC55g8kz
 aubCThKgfQBfJyKMG6Woj37zEODm5CPEbKT03LgptyKoQYT5lKzlo0YmiC5EPSulMziZQC9vzVK
 IwUQblhGb3zRbQv2ugh3oivV7xN/hhunPmko/21Shpil1YtZnOIHY2z8JyVFLH8Adxqbr6e0z+l
 r377uvnNABGMMIhjpFcGk57d9+5hIRMtcI7nS3fH2sputd84pKL5dWj6YIg7DuXRZdL97cnuidM
 bF1Zdr6I0Mu7E4Z/2hKenvSw4jSEzsGFyPKieIAtYZM9ZVU0LhY7N6pdxXx1hi1JaGYYWj7CumP
 IXEqgMOSKbVMgetI0Hi6YOHUiIF65oOj5xPW8v5hr3sYYWg==
X-Received: by 2002:a05:620a:2956:b0:915:6c63:b9eb with SMTP id
 af79cd13be357-92e7b3fd9a0mr863040085a.47.1783015640706; 
 Thu, 02 Jul 2026 11:07:20 -0700 (PDT)
X-Received: by 2002:a05:620a:2956:b0:915:6c63:b9eb with SMTP id
 af79cd13be357-92e7b3fd9a0mr863026985a.47.1783015639575; 
 Thu, 02 Jul 2026 11:07:19 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([189.79.21.40])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-92e801bbcd3sm279917085a.46.2026.07.02.11.07.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jul 2026 11:07:18 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com,
 andrew.jones@oss.qualcomm.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH] hw/riscv/riscv-iommu: fix MSI_PTE_M_BASIC address
Date: Thu,  2 Jul 2026 15:07:14 -0300
Message-ID: <20260702180714.1428013-1-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 3Yc2npiDlyKpWQVVu2Key6CserwHHTo7
X-Proofpoint-ORIG-GUID: 3Yc2npiDlyKpWQVVu2Key6CserwHHTo7
X-Authority-Analysis: v=2.4 cv=UMft2ify c=1 sm=1 tr=0 ts=6a46a8d9 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=sHJf4AwOIoU3qjeHFPlg6Q==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=p0WdMEafAAAA:8
 a=EUspDBNiAAAA:8 a=3qWkeR8UY6TRQuDf8skA:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDE4OSBTYWx0ZWRfX9sCqJv4v92/+
 sn6ovl2Ra+YWb9EO9eFu98tGRQkBpQxD68diW/vdhndCL9R9TfpcAad/l9F6DMCP1ZEPWkfzGS+
 2m7Lkaa9jAZ7Cp8SQOh5pNYOE13i5NU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDE4OSBTYWx0ZWRfX7HmfYzCgb6XX
 hsutDcZiNZacND1Vn1g/1ce0u6lIIb+Q0zIN5bf/lc8XPfXD2egFYwU1DsLZVsan/4QEYcMxIZE
 VWx0yVFQD4/9dZokqT0WbskGQvqDWWFECjPtND+UdrGsjDQuPCeVfb5LDkFEyMiuiJjqMK66Uzm
 Fdi5uyBX8ulVRL1Z0vzInyYOTVtjLoDg16KjgBJjc94OcJktNqAGPkZ1y4LZKqz/4YKgEFELqvL
 OAvmrHLTjzCcPPNQS1wXGNnV8h3qYpQLUm0I6jc+afZDobOsFeJgHILt4XSKO+AQn2zy7cR5FUQ
 Plm6VghKU0i9a57YxVt32drrEmze8lRTjQej6mFKjN9Iu67JE1Lfi/uLl++8C6imfpXhvvk2LY4
 5xjOB/cN9iaLv0BRNdQjm5RHmLE1fE18e8O1ROvFlraAoaojBfg8K/WLeTq3yr19offqfg7GrOr
 /8Ml58/xNThJvuEbJ2Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 spamscore=0 adultscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607020189
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

We're not considering the page offset when retrieving the MSI address.
riscv-iommu spec 1.0 says:

"1. Let A be the GPA

 (...)

 13. If msipte.M == 3 the PTE is in basic translate mode and the
 translation process is as follows:
   (...)
   b. Compute the translated address as msipte.PPN << 12 | A[11:0]."

I.e. we need to bit_ior the GPA page offset in the translated address.

Fixes: 0c54acb8243d ("hw/riscv: add RISC-V IOMMU base emulation")
Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/3560
Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
---
 hw/riscv/riscv-iommu-bits.h | 1 +
 hw/riscv/riscv-iommu.c      | 1 +
 2 files changed, 2 insertions(+)

diff --git a/hw/riscv/riscv-iommu-bits.h b/hw/riscv/riscv-iommu-bits.h
index cc0b1c3ccd..f1f10cc318 100644
--- a/hw/riscv/riscv-iommu-bits.h
+++ b/hw/riscv/riscv-iommu-bits.h
@@ -471,4 +471,5 @@ struct riscv_iommu_msi_pte {
 #define RISCV_IOMMU_MSI_MRIF_NPPN       RISCV_IOMMU_PPN_FIELD
 #define RISCV_IOMMU_MSI_MRIF_NID_MSB    BIT_ULL(60)
 
+#define RISCV_IOMMU_MSI_BASIC_PAGE_OFFSET  GENMASK_ULL(11, 0)
 #endif /* _RISCV_IOMMU_BITS_H_ */
diff --git a/hw/riscv/riscv-iommu.c b/hw/riscv/riscv-iommu.c
index 6761b77f95..6f3db7b73d 100644
--- a/hw/riscv/riscv-iommu.c
+++ b/hw/riscv/riscv-iommu.c
@@ -658,6 +658,7 @@ static MemTxResult riscv_iommu_msi_write(RISCVIOMMUState *s,
     case RISCV_IOMMU_MSI_PTE_M_BASIC:
         /* MSI Pass-through mode */
         addr = PPN_PHYS(get_field(pte[0], RISCV_IOMMU_MSI_PTE_PPN));
+        addr |= (gpa & RISCV_IOMMU_MSI_BASIC_PAGE_OFFSET);
 
         trace_riscv_iommu_msi(s->parent_obj.id, PCI_BUS_NUM(ctx->devid),
                               PCI_SLOT(ctx->devid), PCI_FUNC(ctx->devid),
-- 
2.43.0


