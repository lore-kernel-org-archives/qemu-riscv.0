Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 477C7C43327
	for <qemu-riscv@archiver.kernel.org>; Wed,  1 Jul 2026 12:11:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wetmq-0002Op-FZ; Wed, 01 Jul 2026 08:11:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wetmp-0002Kp-1a
 for qemu-riscv@nongnu.org; Wed, 01 Jul 2026 08:11:27 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wetmn-0002eR-CX
 for qemu-riscv@nongnu.org; Wed, 01 Jul 2026 08:11:26 -0400
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 661A8wqS753572
 for <qemu-riscv@nongnu.org>; Wed, 1 Jul 2026 12:11:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=e/zTLleUm5t
 dJd/waMYjqqRc9jTaOdCiJwO+Zrw72nA=; b=S96aI0bU1Mgjq3haPCpinyZO+cD
 ChLtlXSQEkOLpWLezl+pCnUGQDIMgXj8Rb16z9ZEnHjs07mqjtX6LR6Q49bPWzar
 UryZ4NShiZ93bFnul9RTP89Zv7kfmXCalrftzjSDEE75t+Na1ffYXCXVicdwJWZT
 qFN2JxjpCl88pcqb7bEY6lurKWY8MGegznQEsXN6OCyldoKYAsBEoQYeozzLFujM
 4RJsPL4XzgzJ0wuW1XFX19qvk83leXA1MCnyt67IfB8H4t0vjdCdVBwku3Rltsix
 H6yL5c/1vx98jTaA5j2JOOCwiVIQNRR2nxv74Ikz4ZMMGKJ+nvmJ1kuE58Q==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4rsy2m9x-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 01 Jul 2026 12:11:24 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-51c1eb52e1fso11062991cf.0
 for <qemu-riscv@nongnu.org>; Wed, 01 Jul 2026 05:11:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1782907884; x=1783512684; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=e/zTLleUm5tdJd/waMYjqqRc9jTaOdCiJwO+Zrw72nA=;
 b=O0c9Jgd4upeuGMBn98ynBizZw/ViGZeJlTQCgHocEY7AdcLiJz8nMCfJd/SJ/d0Age
 Y0OgDJuV/g5c2VRTA450kdXBOPJH8CUH2g/+1y8k0umOvBvKMzMoAkr++E/Al/hn53iq
 kkTvNkzHxHruDXCKQfyzKsfzOQbEp5vedamGdrxbaeSeyabo5je3bjJZH77ucpgyAxqQ
 SRPuQAA4+CHMuzWySUixpek8NJP4CTKKB/aR+QOdO7YyQwNunFnvKroB4qWDe16/cywf
 OAPKFiSF4UCGlF2zDnPpx5jB4oYHq+1NAgAtFwyfk0w8i/OQxzUshlXfePdP28gP9rtA
 ncRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782907884; x=1783512684;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=e/zTLleUm5tdJd/waMYjqqRc9jTaOdCiJwO+Zrw72nA=;
 b=DE6bAecikjVvAP/BV3nBio/+jlX31I9KL/gedISHwih6VvQ6Rc/VzmN7ci8RepsiPy
 ooq/rA9/Ol1jnm8RiMen2BjDcKmgKSZhvZV5ao6PIXGyGF+IEhSdWQmxRFV6dnLgwArf
 6Fvzsvrhtt4Rb/zA1Lqs7JlbMOraGK/qWqgsVV+v9tZHxc39qGRpI7vI47FDssskR+91
 Z3yKRc47urjnvFxXaV7ZhCOj6I9mLngpEvgHLIdWiqCF0+5ljtjnXAICYxJHqV2wsUn2
 B2Fp3tM21lTkGsMqa7eLWUfxwo1+b5WiT/Bdd44Xil0iIzOaOvQ3n88J3ZAOQ1yl/QG3
 i7/Q==
X-Gm-Message-State: AOJu0YzOAMlZXIg0NHN0JvtrLI54z7GXJLmh+MU7siTaqnCY32PB07Gm
 eG5HGR1OeRAj90iP6bCcc2gTIxL25Or3HQF+L6NfhX/EMeDFsxS3FF0gn+fGAPly+MzPn79kFI5
 3SRvoOA11B2S5qW52S1GMI7EZRCZ2AkLjJZe0A/VpLIKN9oH9vBeieKpsrg==
X-Gm-Gg: AfdE7cluhY3qlNVk369le6Go9gSGSo4oN3SV07SnouVkOpu+WEFZ/2jNx4CUmUlRmc0
 D6rQXDaXG6cITx1E08bDezjlttDWOBscmNqg6UlWcn1anVQzrUjbeE13IsGOCsEPo1r0GMslNO0
 9pJLP9v8Vh003L4ekhxpwnaUQDisQriRlnZjI/OzNme2w56dDkiKgTGtLqe7RJVYUObUOj4UsFg
 jZaRRdI7tGBVB0KIB6hij65zrJVaAAIz4fTPegV6tYoh4AbbFFZa0bWcN5VIoYIXx/6nTBgUrIB
 gYBO/PlHhcY8dAb60Inmc5fnYvaVM/ZTtzyTWX6cQpUnxM9udLssDjSq9zzIDAK7NgTsLv4X7ZT
 ZQO63n0Eph5jY55LRSsXTpMm1gjJ9zQLqMLtx1JfpQsJTdQ==
X-Received: by 2002:a05:622a:1194:b0:51b:eb55:2914 with SMTP id
 d75a77b69052e-51c26b00647mr15070971cf.33.1782907883653; 
 Wed, 01 Jul 2026 05:11:23 -0700 (PDT)
X-Received: by 2002:a05:622a:1194:b0:51b:eb55:2914 with SMTP id
 d75a77b69052e-51c26b00647mr15070321cf.33.1782907883034; 
 Wed, 01 Jul 2026 05:11:23 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([189.79.21.40])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8f3611df020sm19794706d6.30.2026.07.01.05.11.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jul 2026 05:11:21 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com,
 andrew.jones@oss.qualcomm.com, nutty.liu@hotmail.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH v2 1/3] hw/riscv/riscv-iommu.c: check for reserved PTE bits
Date: Wed,  1 Jul 2026 09:11:09 -0300
Message-ID: <20260701121111.537654-2-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260701121111.537654-1-daniel.barboza@oss.qualcomm.com>
References: <20260701121111.537654-1-daniel.barboza@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: v2Eul36faX35RTaWfkzUXZoSJzCqQk0-
X-Authority-Analysis: v=2.4 cv=fLgJG5ae c=1 sm=1 tr=0 ts=6a4503ec cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=sHJf4AwOIoU3qjeHFPlg6Q==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=p0WdMEafAAAA:8
 a=EUspDBNiAAAA:8 a=69EAbJreAAAA:8 a=pGLkceISAAAA:8 a=gKrNVKmnkRrTeqt_gscA:9
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDEyOCBTYWx0ZWRfX5iKXQC0MPRpG
 bZjImT1Io/7u0Hi3dPrVaDjtBiO7F/INQ9tMn3QTLTDOEx6q/qZdPq9EttZoTLyArEo9Cau1jVL
 E22xJIENpLry62uXR0RXPYmmh99XaB46CJAaxTItBHMbvugEkItnYc8H7MpvPraIZqzvc4TMxLE
 GagH7Ejoi9zhzBJJFFhmcYZtL/RBLiGHp9rMkiZrLLjQgAXGB+4A+Banu+7lmHP5mTl4mA8VBE6
 uLVChk7Krc1zOprNlbGyFRQP4wLvPGltSnfFR0FiEAuDoPXTCNfZr2Zvui22Zp7h8neSfhgJoPE
 UjdB8BBERxfPphMkH/gRYAyNHJ/vrb8Y0+MGkTcBIA4pfdXw/3Y8BWIfPhvHo/61wBe9a07IZdB
 abSliiFJGNo4t9xKfeTToKkChyUa5v9fsJcfZlwpKrJ1l8WHv4ZKrBx+WIvKPjhJg0k9NieYXKE
 XlzWv+VKZig5Tqqm+Sw==
X-Proofpoint-ORIG-GUID: v2Eul36faX35RTaWfkzUXZoSJzCqQk0-
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDEyOCBTYWx0ZWRfXx/mmVfZ279BJ
 /CMyqVpwrAkWymviehnidAQ2QTVx1POPgMmRAQPJYpXlKFAh9rsBREukRqXNcyHAbp75NLksmmh
 3p0rfUuhppA3eBYw3DAYMF+99UkLeug=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 bulkscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010128
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

We need to fault if reserved PTE bits (60:54) are set.

Fixes: 0c54acb8243d ("hw/riscv: add RISC-V IOMMU base emulation")
Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/3554
Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Reviewed-by: Nutty Liu <nutty.liu@hotmail.com>
Reviewed-by: Chao Liu <chao.liu.zevorn@gmail.com>
---
 hw/riscv/riscv-iommu.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/riscv/riscv-iommu.c b/hw/riscv/riscv-iommu.c
index 974042d017..2c2273e1d2 100644
--- a/hw/riscv/riscv-iommu.c
+++ b/hw/riscv/riscv-iommu.c
@@ -468,6 +468,8 @@ static int riscv_iommu_spa_fetch(RISCVIOMMUState *s, RISCVIOMMUContext *ctx,
 
         if (!(pte & PTE_V)) {
             break;                /* Invalid PTE */
+        } else if (pte & PTE_RESERVED(false)) {
+            break;                /* Reserved PTE bits set */
         } else if (!(pte & (PTE_R | PTE_W | PTE_X))) {
             base = PPN_PHYS(ppn); /* Inner PTE, continue walking */
         } else if ((pte & (PTE_R | PTE_W | PTE_X)) == PTE_W) {
-- 
2.43.0


