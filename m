Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32D75C43458
	for <qemu-riscv@archiver.kernel.org>; Thu,  2 Jul 2026 17:12:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wfKxU-0000rp-Va; Thu, 02 Jul 2026 13:12:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wfKxR-0000my-J5
 for qemu-riscv@nongnu.org; Thu, 02 Jul 2026 13:12:13 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wfKxO-0002qg-Ma
 for qemu-riscv@nongnu.org; Thu, 02 Jul 2026 13:12:13 -0400
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 662E3I5a661894
 for <qemu-riscv@nongnu.org>; Thu, 2 Jul 2026 17:12:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=OiKCLdfsyg9WtOLsO+xWUlwobzjgWUuWLDt
 6lZlyWQY=; b=EHJiiUDwfVrQ1ArmNIOge/TKuY/0M8ofONWy5cvrbmYIAci+FHT
 0haEmPq2Kuv/HEWZWWn7FHQeL2xlKRHb1IvYhUQSK4dlIjb2GRvpvEiiFx9pkXUL
 j3tzxVgEZbihOtxIKDHwrws4inJz6jXuSqd6EkxuGfQaFHNlf752mTefUtbvC562
 rFKNod+JBdv9WevkcQIpLQ9cMZyEvlRRh48FubfwbiIg4NPJv1tzVQC44kUeSid4
 jz/w4bB4RlGJJH1yy354Dm0FKdcUgbpr/E7YuxeH0ZTj50dw6sJOmRt+AnfH65mX
 DKxxDAt0zhiOfUZdlOSRwibRpQuuRLnufoQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5qnp9d2d-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 02 Jul 2026 17:12:08 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-51c1d7886cdso37379731cf.1
 for <qemu-riscv@nongnu.org>; Thu, 02 Jul 2026 10:12:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1783012328; x=1783617128; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=OiKCLdfsyg9WtOLsO+xWUlwobzjgWUuWLDt6lZlyWQY=;
 b=Og2gewJr73Djk8TxT/wGHUCCqN6Djx4np/LXsIsXJkt0c6AOazD40N1BpdCEld8yQS
 sA071Mnln4ENX9cKz/IJzTUfiwBB8baPkwKS/ci2sZz/5flZnrxABvogaTcHyciySg4H
 k+9Q95isU2jXoTxeyCe2GPU+PyE43WAXevZtbBoXJDRVMOegBirfuM7gABhzBV5FOK5l
 NDVRfDz3a/9d/yuFS9JE2DNPvxlXxabJeEysge6LOzFqSBkiglBYzC7yiUjd4iXlOcVa
 SZdUCBzE9Z2mNPgnfeN3zT1Yv970aX7K2+m2B+PSHRMEGWs8iQZHBS4C942pkjhaMyZb
 smDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783012328; x=1783617128;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OiKCLdfsyg9WtOLsO+xWUlwobzjgWUuWLDt6lZlyWQY=;
 b=S0E7VS5IeCsl/mxm8x2lkI4mumdGqi7cWh9XnP+Z3dDrxtU3ahuM0SmoKwC9Z7h77o
 JvRZVZgftGAEH3ZM74mcPd1D93WDoZD942ExldcBNup2CxKXfER9w5v7iCWjemXTYPdl
 Dk24WkrD/CZREx+P+AzcUu83aOOyqELcI2nfjgRVwCZBFA9wD6S1ZxtTkr4h613NmYNu
 hQtLzoA1lj7TEqegjtf89P9Snl9QnicWgagZ4IR+IXi9rj5OEKqmOIG3vqO51GFQFiDm
 CnesM/iep8SdvnRgFO7U6ngtLWzXhRWmOYQpNGCUJuUKzSrvUn9htGanXToTqF7DI/Ik
 D5Cg==
X-Gm-Message-State: AOJu0YywGHkBtZ5H4DgSbITCbCpWVXxQE/gxEWBKJQv3wbJqbEwKGkH2
 fkjAaBjst+bfOIyfyqQyg7dpvTmsPLUCcscjJnrzVCjcuc3rbwfouwOUILTIGxVHAUvIiqxILPb
 4H7DMwFrhNXDu6Q0QKWyGvkdRyF0H6A8GecT0WF9mIEd2GI5quCupnr09EQ==
X-Gm-Gg: AfdE7ckJNo/dsJdGzMLnNwbicPjf5doDSurDQy9v2YCA5/xTJL2XZoS1Mi5qlsIspKl
 S3XSNGdxMcmA4kKOeZrn5G1gzwOT4UvbgTyUUlEXAsXF83tCIFDSzjeI61/7Q2hXyV5QaH+VMk6
 Mr/Bwchsgso36f6piF7RaRBp3AybmLfOVhXei8c0UzRbo/BFWeLvDV4uWrGJNHTtvpf7KLKksn1
 ToSfbGGR/k5o9Gbp5ciy/OgkfZef2RI9sjPpAB+7h4ZZMtuMa8wIWBGqyowR39u7pc/oOSoc0iq
 Cvqt8UYRAjrj3BG7mDpyEV4b1WB5w3cOVXlbBCUyDtbKtg7mNcdWs44zsE/gNwas7U0S1c+A2iU
 JjmAMItEAuOd6n3EIRDQrm/oFX7PLjSlbdtR+82/h4fyCWA==
X-Received: by 2002:ac8:5a50:0:b0:519:f02b:45cb with SMTP id
 d75a77b69052e-51c26a7a3bemr94016191cf.26.1783012327500; 
 Thu, 02 Jul 2026 10:12:07 -0700 (PDT)
X-Received: by 2002:ac8:5a50:0:b0:519:f02b:45cb with SMTP id
 d75a77b69052e-51c26a7a3bemr94015411cf.26.1783012326877; 
 Thu, 02 Jul 2026 10:12:06 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([189.79.21.40])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-51c30c1582esm18338491cf.16.2026.07.02.10.12.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jul 2026 10:12:06 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com,
 andrew.jones@oss.qualcomm.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH] hw/riscv/riscv-iommu.c: update ioval2 when faulting in
 spa_fetch()
Date: Thu,  2 Jul 2026 14:12:02 -0300
Message-ID: <20260702171202.1322493-1-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDE4MCBTYWx0ZWRfXw8OCWPPXEIkT
 RxX9pcNMy7HJG39+xVro/+gGMFXnsZEuWic0TWPdlUO34NW58lrmjHeO1iPbzMvEUKbaULok85C
 wpghHU5DNanXNYodEblekn4LXlgEmyg=
X-Authority-Analysis: v=2.4 cv=FoI1OWrq c=1 sm=1 tr=0 ts=6a469be8 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=sHJf4AwOIoU3qjeHFPlg6Q==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=p0WdMEafAAAA:8
 a=EUspDBNiAAAA:8 a=brxubhDnoS8KGqh5eZoA:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDE4MCBTYWx0ZWRfXwy4IxtKod6O3
 PlV9frLocr0npHtWh9p5mZcJve/+w5on6UdbVT6T7w91BEJJd5cFPjhSQBlOFGaNo0AeIv3uexV
 tBM8SNRbPoOGId1N3nRW+iN+RwgW52J9TQ98EHAizVrbmL1O7aDjgCIdp9WXA2vFPcJ3Bctbi40
 J5beug/gq7RkcnDwAeImv3hURSqg3QKWV1WRjJnKqi5zW0q9C/bVJzfH4e9jy5U6x2Wo2M5t/tm
 lDnN5PHOzrH9ykpLScqKYDMR6b+F4Fe14UOUG8IeGejwPo6EnYWPD95svI2pLcaGmu+UhLO8bVo
 lAIneTRM6JMEApc/AuqDvYlVEyY3xxy/SvPRBZvd8RgBOFF+rO0qc1Jtx9q29b+aijVKHBa/G+A
 KwpLaz6w9FdvNQtC+dmlLkSufy1qiVJLtxndbxQvCR/hMHkFCtR0LaxhQeuMe6jt7S++Ee67+fI
 rWW8Wp2ULSwmx7scYbA==
X-Proofpoint-ORIG-GUID: _FeNwm8ESn1q-baj4vfvA762WRUG_n_p
X-Proofpoint-GUID: _FeNwm8ESn1q-baj4vfvA762WRUG_n_p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607020180
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

riscv_iommu_translate(), the only caller of riscv_iommu_spa_fetch(),
will use riscv_iommu_report_fault() for all faults it detects.  And it
will use iotlb->translated_addr as 'iotval2' every time.

At this moment we're updating iotlb->translated_addr only after a
translation step is completed, meaning any fault that occur before that
will have a zeroed iotlb->translated_addr, and as a result iotval2 will
also be zero later on.

Keep iotlb->translated_addr updated with the latest translated addr we
have.

Fixes: 0c54acb8243d ("hw/riscv: add RISC-V IOMMU base emulation")
Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/3559
Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
---
 hw/riscv/riscv-iommu.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/hw/riscv/riscv-iommu.c b/hw/riscv/riscv-iommu.c
index 974042d017..6761b77f95 100644
--- a/hw/riscv/riscv-iommu.c
+++ b/hw/riscv/riscv-iommu.c
@@ -546,6 +546,14 @@ static int riscv_iommu_spa_fetch(RISCVIOMMUState *s, RISCVIOMMUContext *ctx,
         }
     } while (1);
 
+    /*
+     * riscv_iommu_translate() will receive a fault and then call
+     * riscv_iommu_report_fault() using iotlb->translated_addr
+     * as iotval2.  Update translated_addr it with the latest
+     * translated addr we have.
+     */
+    iotlb->translated_addr = addr;
+
     return (iotlb->perm & IOMMU_WO) ?
                 (pass ? RISCV_IOMMU_FQ_CAUSE_WR_FAULT_VS :
                         RISCV_IOMMU_FQ_CAUSE_WR_FAULT_S) :
-- 
2.43.0


