Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 045E0C43458
	for <qemu-riscv@archiver.kernel.org>; Thu,  2 Jul 2026 20:37:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wfO99-0003fV-3A; Thu, 02 Jul 2026 16:36:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wfO97-0003ej-FL
 for qemu-riscv@nongnu.org; Thu, 02 Jul 2026 16:36:29 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wfO95-0006ia-Ka
 for qemu-riscv@nongnu.org; Thu, 02 Jul 2026 16:36:29 -0400
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 662Iusju1396948
 for <qemu-riscv@nongnu.org>; Thu, 2 Jul 2026 20:36:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=SDJ5ZGZZQpu
 KupBl2glwWLAU4IdTUnw9vBZa7wGQp0Q=; b=MpjIKrm61OkTRaqDVP6iBC30hvN
 v9Y/gA1q24tlRJXUNkliqHBtDh35kzaRRLoPKJ6XCeCDzGTfR2y/o/vCcCO2fEAR
 xrX5o84CvZAMzLz0HxS0lD3Ax4o/5fmilh9Q7lySnApdEP9a60jTRN1wj2Oqsp3/
 9FgzXZPXIFzsaTUhbFfSxrq/Ox0hMEJXVlX/rXqr4MqFAa1ALzIA2tKOl+y/YlF0
 4rqW4eADBFrDxeubVo0HKUEF79kU9yX7wyXUzrTIecAZH3uTUlg+Atsf17cmnwGO
 kGKN++NuN3DeuPXuldJoQ6nVaTSRFD2SDerurXSNDzfDzvBDW17EVNsfiZA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5mvwtvn9-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 02 Jul 2026 20:36:26 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-8ea75996387so50472266d6.1
 for <qemu-riscv@nongnu.org>; Thu, 02 Jul 2026 13:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1783024585; x=1783629385; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SDJ5ZGZZQpuKupBl2glwWLAU4IdTUnw9vBZa7wGQp0Q=;
 b=WYganqEBKKw88wjTm7QraaLHZR8qEPQYZwYBBrCiXFDp9AX1gF0BGsh6JULTVhvCtT
 FsJ0Ad4xlxd6c4v9z3BtptMy6MbfsnKhIXb6me3+w2aVNA/ABl2DM2pu7BIV//jJDAEn
 NkUA/pbU+dpiHHaR08kDRCY1aB/iSaPMxfcGDNcGhSRcOdmMyMIORnQHzs3v1jW+Eocc
 BiBmAuN4KPOZlnnlZYsOTxJBoHEcVd7dcwy8uzSMJ2A3ACL1zp914ocv89CvMZJVy8qs
 ElbBJ0nzHnsK5vIkuoTWTPa3FmFHLudItIIfNaxxTViamIwRrFIBiAh2oAnd29ZHLAWr
 ErRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783024585; x=1783629385;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=SDJ5ZGZZQpuKupBl2glwWLAU4IdTUnw9vBZa7wGQp0Q=;
 b=mrpj/2WJGUpXu7NBipQwo2rIzxFqluYjZU6K/k0MnrcGdQa0TptFpiF3CA/kJuL6t5
 w5kqtljVLbkb582z6HlwlZScAbm5D3nypxVP8gzfngvHbT+WOP0v4gRsRwG560TuMi5b
 dwYSf934XRhkfAMZiNckjStay4ANnzpV0WEGG/O+G6ffUhUeisNPX6MtPU0CW8M3S7IY
 QOZlL+3l7RTxVvo/IpPU+J+kkS/FgIxHDHqhbsc1GzykQJpIfxY/fpms1P/bzeo4nhQV
 XNwstVg6I6p70Gbf8pkbf50XNuhu0CEV6/NyCLUHU2zKB8RWwj0b1J7+zgNpIK7t7gu2
 Dvrg==
X-Gm-Message-State: AOJu0Yw8GnfU6wVpenH64AYxJJ7RSa7CYatuQn1WcVrWaFK4lueJ0gjH
 x/um+vPzT+iLmupfkaY5m6rCtxfXXdXFR+AqhLIIA4xMW5ad+iDt5Fr9Wb82lEV1xdpev1rehOP
 fjtlVmuuVzurr4omWPch7D69wvmo6XTypqLoWekkITAt7kEnTK7b/AmXoow==
X-Gm-Gg: AfdE7ckZFTWqoFVsQGkiJ6NiLD099CxWkyjzn9y02wQ/cAse94KWK0TexQmRTsUbl/H
 VqtXDO0TZ1QdImMKl5dcncb9h0UI1k19vt4ASDJ2OyqkIuUwpUdmk8rDQoykhc3lAlMQ0TjTiwk
 ImXIWpHxa6RnyiTDasnKGrxmlV5t+B2Ik0XqPKcd/VLVHCNozvLO/m3iQR3WAz0xP0Q4IFsRzVx
 efRYH7yXzj/G4Vt5zTyfUa53nuzlmdTccUe7wKoCqAG67XAceB0gwLySos1Ml5+yOfn22aMl7HG
 Cq8o/+wDr4hJV74Icyyv5ZO1ebs2IhxT457Ygm3vplvqfPfAhT4rd8wND+EBBzM/ft68etbts9P
 2swe9g/ecBIZCJLEal5OVsaJzaDJIi4CYPrTFMq4lCGqtaA==
X-Received: by 2002:a05:620a:7083:b0:92b:7370:2ddb with SMTP id
 af79cd13be357-92e784d0d2dmr1026480185a.38.1783024585286; 
 Thu, 02 Jul 2026 13:36:25 -0700 (PDT)
X-Received: by 2002:a05:620a:7083:b0:92b:7370:2ddb with SMTP id
 af79cd13be357-92e784d0d2dmr1026477685a.38.1783024584862; 
 Thu, 02 Jul 2026 13:36:24 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([189.79.21.40])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-92e801bbd5bsm309347085a.44.2026.07.02.13.36.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jul 2026 13:36:24 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com,
 nutty.liu@hotmail.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH v2 1/1] hw/riscv/riscv-iommu.c: check for misaligned
 IOHGATP_PPN
Date: Thu,  2 Jul 2026 17:36:16 -0300
Message-ID: <20260702203616.1795588-2-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260702203616.1795588-1-daniel.barboza@oss.qualcomm.com>
References: <20260702203616.1795588-1-daniel.barboza@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: OsPrU6N3B2j6KyC2uw6s2kVjMUlYkhVq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDIxNSBTYWx0ZWRfX5Ov8SVg5nM1k
 C9P4kGSf4GSgAmQ/hd2Etd/I5g6wUmRFCPTqSfBVQmVaC6o6ISd1ynlL3RaqdIaJB5y/HhppG67
 qz04BPEJb1wTuWPqTI41yydsZ505L6i8ypMxaDOkqa9go6qGSq25gyjXIBAlhrVWu8vDANmrca8
 WLDfKprK7zUVe9xLb5G3zVhfZ/dkF3dXfGl/nqCYKkE6CkDp8Ds+8Ofsx+njO40tiC1y9dnKuqI
 RP85jKgYFNRjjh1SI67WwjVOc0ePFOgPgz0OuCZlXyXYUodA4ilaAI7RxrMA6AqCbD1TqwIG+gh
 lwdoeTEts8D7phuyf7baP8biSTt8S6vtJ+eJTaPdMYXnmm4+wONmBJy+9nGNegsbDc9OIGvHguK
 GmYBov5BUbAp78pbtge90S+iehDtYWejS3ugtGiClvipxxDxmbxVMdBP5VC8bJWAqTUTKcm+4ta
 3usuFpa85THWE1gcCeg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDIxNSBTYWx0ZWRfX+hA2wJRD1ykR
 Mab0KRrcRdgml7qXthk9c50vIcWjQJiiT4yIjiywEJ7elu/GQDzaU5vkV51Ba0yxtvAOp/DvUTy
 fyBhHYZOKaLsfvh0ZQ8LqN1xrbjCAsc=
X-Authority-Analysis: v=2.4 cv=N+UZ0W9B c=1 sm=1 tr=0 ts=6a46cbca cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=sHJf4AwOIoU3qjeHFPlg6Q==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=p0WdMEafAAAA:8
 a=EUspDBNiAAAA:8 a=OFnKmOOrP17mNN9m7kIA:9 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: OsPrU6N3B2j6KyC2uw6s2kVjMUlYkhVq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0 spamscore=0
 priorityscore=1501 phishscore=0 adultscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020215
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

We must check if IOHGATP_PPN is 16kb aligned for non-bare GATP modes.

Fixes: 69a9ae4836 ("hw/riscv/riscv-iommu: add ATS support")
Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/3550
Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
---
 hw/riscv/riscv-iommu.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/hw/riscv/riscv-iommu.c b/hw/riscv/riscv-iommu.c
index 974042d017..ad8e108a23 100644
--- a/hw/riscv/riscv-iommu.c
+++ b/hw/riscv/riscv-iommu.c
@@ -813,6 +813,21 @@ static bool riscv_iommu_validate_device_ctx(RISCVIOMMUState *s,
         return false;
     }
 
+    if (gatp != RISCV_IOMMU_DC_IOHGATP_MODE_BARE) {
+        uint64_t iohgatp_ppn = get_field(ctx->gatp,
+                                         RISCV_IOMMU_DC_IOHGATP_PPN);
+
+        /*
+         * One of the conditions for a misconfigured DDT entry
+         * according to the riscv-spec: "DC.iohgatp.MODE is not
+         * Bare and the root page table (address) determined by
+         * DC.iohgatp.PPN is not aligned to a 16-KiB boundary."
+         */
+        if (PPN_PHYS(iohgatp_ppn) & ((1ULL << 14) - 1)) {
+            return false;
+        }
+    }
+
     fsc_mode = get_field(ctx->satp, RISCV_IOMMU_DC_FSC_MODE);
 
     if (ctx->tc & RISCV_IOMMU_DC_TC_PDTV) {
-- 
2.43.0


