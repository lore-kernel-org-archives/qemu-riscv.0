Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF261C4450A
	for <qemu-riscv@archiver.kernel.org>; Thu, 16 Jul 2026 12:37:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wkLKF-0003CD-Fy; Thu, 16 Jul 2026 08:36:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wkLKD-00031S-Ae
 for qemu-riscv@nongnu.org; Thu, 16 Jul 2026 08:36:25 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wkLKB-00079F-PR
 for qemu-riscv@nongnu.org; Thu, 16 Jul 2026 08:36:24 -0400
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66GBj4D62622278
 for <qemu-riscv@nongnu.org>; Thu, 16 Jul 2026 12:36:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=xOMAENftPDT
 dIMAyjHhGBMJXVoQqIYtsgYzFdOIVgm8=; b=Uns8eWrSezoS/0X4kCgD1Kcy3G3
 5tVOIGRtYjfTJgbHoE639b4g5920jU32UE80s9Y6JcwcwpmHRGpb8kvtanoA+f6l
 Fa1qS2LEhcpo+mtEm4f0+V32BU3FHN7fi/leDu7FQARPGHsBOay6uw5jZqAzPHju
 Egmat4+2vOm+Y3hA91pWb4q7f4O22MbwU2YHyV/T+KQf5IIKf/8m00kP/rt5/P6f
 RAhksYuGO99lhd5F9IZw6NfrtFT8gsis9pY+I+LjBFyHibjMfi+g6cW60PwCKFxY
 6gHlpcSg7RgMC5VbKM3ki2gqjcwBomhM+UqFpg7awTxA+J4dFoh2yYWcKMw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4feefqktt0-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 16 Jul 2026 12:36:22 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-8ea75996387so161612416d6.1
 for <qemu-riscv@nongnu.org>; Thu, 16 Jul 2026 05:36:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1784205382; x=1784810182; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=xOMAENftPDTdIMAyjHhGBMJXVoQqIYtsgYzFdOIVgm8=;
 b=TxS3uPa3OA3Y7ehgAXJqYqC39AajMQ5cJtTiQEswZw3lYe6S5McdMgSvz7bYhxasdH
 hMeStiZKRg950zOSkpMokr1jepgEk6tDgN0x2XfZD+NvB+Z1F9/tSF07/QaGX+fx9RGn
 OmPdTEFN56FLMtRqmFkIstrASPYLVGLbQ2nRL8ns7GcFR8KZEySXErJ1sldO9KFktJek
 ByyUjIEydeIFqn6BHnKnROVn2/Mw8rbp1KC1Ia+zXya4XvjQjAuJilEraMWYGaeVInE8
 byhWecHOoWrBuoPpOqW3cesLwrXR9DpTRzHt59GTIg2lybkfnN1xm7WGV2+AGnVdxAOk
 WoGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784205382; x=1784810182;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=xOMAENftPDTdIMAyjHhGBMJXVoQqIYtsgYzFdOIVgm8=;
 b=RBSvIYTxiclOx1dp0mqFw49fUMMm3ZRAdOJJmaU0priwxmwIX85GP64pfcE+Fo7GZ9
 K+30RsyQZTWm3xUobsTLQJmYhS3z3pgjnga8Lh0roYGNs1n5RQCb6l54AQ4Kfr7m54yZ
 Yw8Y5O5gO8gh1bDssElql2eGg+3V08G9c94ncQMX3rGDBmMJWGQX6EedAveXhLWmVuiO
 lXOCG2miiRUM0aceeco07b3Y+ylfQ2qCzFY7l7eY676nBXCIMhpKzCUlM94jrMGAT1DG
 RgAtVqzxwW1b6NrPxnETYJ0egglsUs10s+5ul+4Y9SuOgaafoHGKOZ3rWQYLjnDhj8gS
 xCQw==
X-Gm-Message-State: AOJu0YwxBkCi5HYSu0OHGY5iALbKs4kowauGHk5mvLzDkJJRLDCCXC4p
 bG8OmHaseMfBT0JtURg6mhtWtILPSczh5h3stPZKHUWbn3LZzvjuUphMI8p4uo4jE8JwrTvtUbf
 sESyKBTmqUN8cdzhZLfca/Ckf7vYnXAnSsuMdn/oVJHNvHFmztiXheHQPJ4Mg0aWTWA==
X-Gm-Gg: AfdE7cmncX20z10b4NmH3reFT9MyUZdCHm8/HZaCmWSgALRqPZjYpjUQnVFdo52CQ9k
 JjLz8AZiR/sGhU5kqgs2zl8FXlBO/UD6ILG5Vvv83xUKhFkJ9LZa7ab9/0liu/iQR3W6L3Wdcmw
 IxKzZflsJl8/Zf8McGq4J4J2D3qlFo8xYgXufmqZEDzjbPn8g8PkbV3AwTJxFg3C5f7NGRNfkfr
 we5SRg1iZkAw5jhi9l98Nxtz67xjQ/fqRrAEf2C8bhnDJwvRCXRht3vixbZrX+uTUH20PqL9Dc+
 +9wn9nhPkLN7Ikl5IeouUZisF2gMCTqvpmwsITlWOfPUtvepUVlwD3wRJhei7IixwfylGRk490Q
 5uYNWwx9ucZ6HxEmZXL+vBIDbnXs0XopH9t8=
X-Received: by 2002:a05:6214:61ca:20b0:907:5c68:54d1 with SMTP id
 6a1803df08f44-9075c685694mr50836316d6.18.1784205382192; 
 Thu, 16 Jul 2026 05:36:22 -0700 (PDT)
X-Received: by 2002:a05:6214:61ca:20b0:907:5c68:54d1 with SMTP id
 6a1803df08f44-9075c685694mr50835746d6.18.1784205381572; 
 Thu, 16 Jul 2026 05:36:21 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([189.79.21.40])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-902de1fdb3bsm191609316d6.23.2026.07.16.05.36.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jul 2026 05:36:21 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com,
 npiggin@gmail.com, chao.liu@processmission.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH for-11.1 15/17] target/riscv/debug: Advertise icount trigger
 type in tinfo
Date: Thu, 16 Jul 2026 09:35:32 -0300
Message-ID: <20260716123535.3709148-16-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260716123535.3709148-1-daniel.barboza@oss.qualcomm.com>
References: <20260716123535.3709148-1-daniel.barboza@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=APNfGQ4N c=1 sm=1 tr=0 ts=6a58d046 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=sHJf4AwOIoU3qjeHFPlg6Q==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=NbQ-Mm45WIPNpU4tq3cA:9 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDEyOSBTYWx0ZWRfX4x+f/JxtnWBx
 SZiYeP4Hx9v74Gx4mgF5mdVUVrY/VIP6qZMWt2QAzylB7ZiPNreTrFZ48VEHKby6qHNoik43WWr
 RE1d5zeXxTscIUbzrsyAjfc1PkspXuM=
X-Proofpoint-ORIG-GUID: NDe4N0Mj89kdLszYIWIMtzjiYN_jzEoe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDEyOSBTYWx0ZWRfX3py3koVRWeaN
 X9yUO7/qJp7hKfek1zfL71PLneCG2BUSS3re+5+o8qFz5qRDUEnGIYhJWbC1VwGSBCTu1SnvY8J
 TTI/3wBdYYqa276oBxlzZCG4QFPSZbFuQDMIsiUf90qUk7QbPrQ+0roYu2vAartBqpkHFhWS6Ck
 oa5qIdCnlFfAv05Wgg1I/Cr34k06fxi3cwsohZKRqXFkS68MeMY9+uWFZ7pGS0sOo/jwlBu+s/3
 GTSPM2zvq+LhNEOcNcrYxEd+7ERpJCrAUCFiy/q7+f8BJNWRE/AVzhT+5VyZT3QxosS9M6Nyjop
 EDi5cAEWlZm/EpYqaZgn/cycsdWQjFfypr2spz+x2hxWhppqeQr5pgoQpyMFeEBSxAuneiludFz
 ESl/alxmkfsFB5rtpC4a5jrZZRRSUSAUuCk5S04wQT2rALf+HqkcwhQQC7h4v3GCUPDqPlKznlB
 QAzK5ANA1su+4xNobtQ==
X-Proofpoint-GUID: NDe4N0Mj89kdLszYIWIMtzjiYN_jzEoe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_04,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 malwarescore=0 bulkscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160129
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=daniel.barboza@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

From: Nicholas Piggin <npiggin@gmail.com>

icount triggers are supported so tinfo should advertise them.

Fixes: c472c142a7 ("target/riscv: debug: Add initial support of type 6 trigger")
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
---
 target/riscv/tcg/debug.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/target/riscv/tcg/debug.c b/target/riscv/tcg/debug.c
index 09d4cc03f9..9089d2ab78 100644
--- a/target/riscv/tcg/debug.c
+++ b/target/riscv/tcg/debug.c
@@ -958,8 +958,13 @@ void tdata_csr_write(CPURISCVState *env, int tdata_index, target_ulong val)
 
 target_ulong tinfo_csr_read(CPURISCVState *env)
 {
-    /* assume all triggers support the same types of triggers */
+    /*
+     * Assume all triggers support the same types of triggers
+     * TODO: set 1 (version 1.0) in the version field when we're
+     * ready to support it along with 0.13.
+     */
     return BIT(TRIGGER_TYPE_AD_MATCH) |
+           BIT(TRIGGER_TYPE_INST_CNT) |
            BIT(TRIGGER_TYPE_AD_MATCH6);
 }
 
-- 
2.43.0


