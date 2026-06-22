Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F729CD98F2
	for <qemu-riscv@archiver.kernel.org>; Mon, 22 Jun 2026 19:35:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wbkNx-0000og-BN; Mon, 22 Jun 2026 15:32:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wbkNr-0000lj-HJ
 for qemu-riscv@nongnu.org; Mon, 22 Jun 2026 15:32:39 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wbkNo-0001s8-Ms
 for qemu-riscv@nongnu.org; Mon, 22 Jun 2026 15:32:37 -0400
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65MFX0vf1369988
 for <qemu-riscv@nongnu.org>; Mon, 22 Jun 2026 19:32:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=JbEUpwiuB5S
 /wePK+7Qm68r9sNPteyFV0cyQLCteb8Q=; b=cSMRv2F8jOiIQGO0M6t8xR//LrP
 BM218BInjKRISejJosKQAhFoDf8p4Asjq//Bmnpwp7fHoFcm3nyo8tptcrv85oio
 O3nPC/VCG9MmBQebJgU1Kf+UgT56sd8hBLjjc/dQOw8da9sMdxjIFhkSf7x/CHIr
 Inw/TU/OaAFAJU21KdHpZlZYumfc6tFIix8Cn92mjnZu0ocG9H3F7z4V3cRRPrpb
 wTb7aLMKc7tYQHL7Togc9pO2UD2TszLg7Er0NZClGHvBEGKSGSKO12r6Vv3VLpgb
 GpD3AyCNRth4d27WG9V87qp+lA2lleBzrSs2rbgQFORpmuTVJVmnoAkfADQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4exyn1u2bv-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 22 Jun 2026 19:32:35 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-91931144870so1097996385a.1
 for <qemu-riscv@nongnu.org>; Mon, 22 Jun 2026 12:32:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1782156755; x=1782761555; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JbEUpwiuB5S/wePK+7Qm68r9sNPteyFV0cyQLCteb8Q=;
 b=G70NYg2Suve8nWnOiflMQqaDr/aw4mAi+8pykfERfI2MrOcUYWQg+dsnUovQsnt45Q
 HPfWNGc/sWuNqg7vCjctmtJVZEXfJGEWRu52LGzxsjGn9HYFgla2hep+dUDoVnTRqpnG
 /fBw5ajbF3llKKvdcj79Iy1IAjd9tQqyFF/L67x7rz26Dtjl2d/GahgwVqJ9ck1nf4sl
 ieUe2INnTpgO30V0uC02/jAtmOoRqns26XUviVmz3bL4ILY91oue3D4lo18/Ojvt8/Vv
 pPXYwqyqGaad4D7JiFh1ui5ezLBfdA0xs1aXnSZG6TBtQWZnW30hMR8uTfsoTEn6jZUP
 CWQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782156755; x=1782761555;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=JbEUpwiuB5S/wePK+7Qm68r9sNPteyFV0cyQLCteb8Q=;
 b=X9ed0JNGaP4g9ut9GmSnp8Eb8A1hp+MRAO+Jtix5lqyNbQyUalAij6yZ4sKmYFR0hF
 HX8m9QP2teD+BJOT1ibnZnD4ohWB56CL5TA5UgWnXaRjJ0UsbWtB9kh1vS92sv/9Hx0J
 LRDrGqhUHMf4a7MvSePnhOdgFFW4NEc7T65HCXZWU4nk98AoXkso8mJy+qtDF1x73Q3B
 wDvq1a8plj/lcQalJ7OPyMniIl/+yjS9F5db3fK/jDqP7D2CKUEwvB8EdnvqkD2MbEsS
 I59mbwdZ2zC+DOZHZ8m6DUwMA2AtuCuW5xO9hzE+AD9HmuSsIa1tRUdv5wqdjcfp4X1T
 TRmA==
X-Gm-Message-State: AOJu0YwFhdjRef2QD64qCIsjj1sHk6yG8+2QRknGyNX8r+smIVFuiSOk
 dp565rYtoMCH6wZcfg50f7M6g7kZdoi0+j8omtVo0qCoaqzbSVE3Ai058cc6ejB+9cktNpdCDOy
 4SfLrn7SSnGJJ2G2vEN6V62DyZeU+LTvJ9RFP8z0pAtu8jIN52YK5Asp/Ig==
X-Gm-Gg: AfdE7ckH15TkAZV6wNiJ/2OPhoTSLAzmIexy+k/aC+fNLayonDhEzjgRPW9FoO/JB1P
 FHecKcv22xTbMWqlRxKryRHzrq8O2b7vsYEdrr+rSH5XpXdGFmdz5cwXcvDI/IcaKHDEopji1eA
 1/qIciDQZbxdgDZhuV+NxhWMgUY35eURABTE+cOWsi3MDaRzPNGPM0YahFWWXZDFYKzupCv9D3S
 IKuR82lOx3soH2X114IDdeioM+7cYUUQvVmR4JhDxGbl1dWBH2Ang3czihX8EsuGq1hFImZxuuY
 8QR94Si96Z1lgR2rQxC8Tj7bp6ja/k/4cC89FnpQzk3QqOM6V2Wgg4ULpb1nC8aexU9TGz0exLJ
 g0qMvDhW37c/ok9ZNgwvJOPeF0TzDgghTTOECXq7VbBZmuQ==
X-Received: by 2002:a05:620a:bca:b0:916:421:4626 with SMTP id
 af79cd13be357-920d403aaa8mr2328061385a.37.1782156755046; 
 Mon, 22 Jun 2026 12:32:35 -0700 (PDT)
X-Received: by 2002:a05:620a:bca:b0:916:421:4626 with SMTP id
 af79cd13be357-920d403aaa8mr2328055285a.37.1782156754406; 
 Mon, 22 Jun 2026 12:32:34 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([189.79.21.40])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-926004ab49csm61489585a.34.2026.06.22.12.32.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jun 2026 12:32:33 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com,
 philmd@oss.qualcomm.com, pierrick.bouvier@oss.qualcomm.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH 15/24] target/riscv/cpu.c: handle TCG bits of
 riscv_cpu_dump_state
Date: Mon, 22 Jun 2026 16:31:31 -0300
Message-ID: <20260622193141.1449724-16-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260622193141.1449724-1-daniel.barboza@oss.qualcomm.com>
References: <20260622193141.1449724-1-daniel.barboza@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: rdeZAL8hP_WyZM9psuaugYkXWGmNsF-K
X-Authority-Analysis: v=2.4 cv=EOU2FVZC c=1 sm=1 tr=0 ts=6a398dd3 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=sHJf4AwOIoU3qjeHFPlg6Q==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=n_Gjmr79VRyvsDPUZ2MA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDE4OSBTYWx0ZWRfX6XqAemrwmgAS
 V2blrh2KZkMQRBsNgisk5kjzZlTgyHcqUGUzuhT08KkVc5mgJfDdsHUCBfALUA2zt+HgTNyfn/W
 kuMSjoroRXkoySJRtVgwXh8DBC5Kh4g=
X-Proofpoint-ORIG-GUID: rdeZAL8hP_WyZM9psuaugYkXWGmNsF-K
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDE4OSBTYWx0ZWRfX4BZ4AT7dh0nK
 pHa5UeWy8rTa7IXHmuVcUv2IDGGzuTOeNf8QFKR5OT9haA+BbXmX0EsmGT0kWaD3hKHUN3Q2xGI
 BI/qcleNMYHu0/MFQl7dIwAEERzbLO3tTMc6EnG9ZQzG62qnY5PCx3BI4aFsof7EBKytdegLPNC
 VdZN1YPn1V1g8KN9q4O/yg660g/WDA16kpk/OH0FOvx47H/vfIGB87Bzu0GYd8y0OmzJB6A0Hgi
 JT6iHKKQHwEAOODtejSStS3ndQi1zaqvylqaARyqaqnuCYKh8Srt5oOt49+zkjkFTWcC1O10pdO
 1fW0dXAHDLEVHaRyGpdy5g4kaODZaBR9LtdrPXYngTIm9yaHojFX/AwWEfwYtsuadpaQrUpm1z2
 9VokJ//dvwp4H0LuE8V02xUKy52+4zZATduZ6bEaedmutor8FOyaFwaSyNOrEdxcSArAee77g1h
 X1wepUaInnMaqApSSxg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_03,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606220189
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

riscv_dump_csr() is a TCG only function but we'll have to implement it
at some capacity for KVM eventually, therefore put it under a CONFIG_TCG
ifdef while making a note that this function is unimplemented in KVM.

The csr_ops array is also TCG specific, thus the for loop inside
dump_state that iterates it is also TCG only business.

Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
---
 target/riscv/cpu.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 2b1fbe4b0b..9c1b55c3c1 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -605,8 +605,10 @@ char *riscv_cpu_get_name(RISCVCPU *cpu)
     return cpu_model_from_type(typename);
 }
 
+/* Note: this function needs a KVM implementation.  */
 static void riscv_dump_csr(CPURISCVState *env, int csrno, FILE *f)
 {
+#ifdef CONFIG_TCG
     target_ulong val = 0;
     RISCVException res = riscv_csrrw_debug(env, csrno, &val, 0, 0);
 
@@ -618,6 +620,7 @@ static void riscv_dump_csr(CPURISCVState *env, int csrno, FILE *f)
         qemu_fprintf(f, " %-13s " TARGET_FMT_lx "\n",
                      csr_ops[csrno].name, val);
     }
+#endif
 }
 
 #if !defined(CONFIG_USER_ONLY)
@@ -655,7 +658,7 @@ static void riscv_cpu_dump_state(CPUState *cs, FILE *f, int flags)
     }
 #endif
     qemu_fprintf(f, " %-13s %" PRIx64 "\n", "pc", env->pc);
-#ifndef CONFIG_USER_ONLY
+#if defined(CONFIG_TCG) && !defined(CONFIG_USER_ONLY)
     for (i = 0; i < ARRAY_SIZE(csr_ops); i++) {
         int csrno = i;
 
-- 
2.43.0


