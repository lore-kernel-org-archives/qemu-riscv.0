Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 211E6CD4F26
	for <qemu-riscv@archiver.kernel.org>; Wed, 24 Jun 2026 00:08:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wcB9w-0007xf-99; Tue, 23 Jun 2026 20:08:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wcB9d-0007fk-Od
 for qemu-riscv@nongnu.org; Tue, 23 Jun 2026 20:07:45 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wcB9b-0003Jm-0O
 for qemu-riscv@nongnu.org; Tue, 23 Jun 2026 20:07:45 -0400
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65NK10gl1178131
 for <qemu-riscv@nongnu.org>; Wed, 24 Jun 2026 00:07:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=7/Ye8uQmQEt
 QzueRNIktNChhgXsfp7S9pzEwkRTES5k=; b=JDNzLe5khO554nbZ0Bq5UJ+rxXW
 AoO3R3mmi+VPfScCI0xeescN1phJidlez/lXFXVq3gCnrYJ5ML8XUG7eMEHfSSbO
 L+d5AGqFzPoQFL+CHWI55pQ7riw25khWwPT+8DKzYRqLI1XU7/7TazMB5e317HbR
 KdLB0boOPq+61Yad31cFGCDHZ/zJwkPxLVyk0/GhLCGhAzaQ2yd0QHQp6KFC4nBP
 vrQcwRfJxwVH1RFJ1qe00R22ikkg3s3bagyoBki1os+FmhXf7od7VWrFkG4BtM4z
 GItjh2w6YOlxC+7qf/9Gb1O41uR1v6vm0Mkxf/lLpqfjFUEBRr/P7ci72zg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eyqe6bdaf-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 24 Jun 2026 00:07:31 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-519e4aaec80so5224961cf.0
 for <qemu-riscv@nongnu.org>; Tue, 23 Jun 2026 17:07:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1782259651; x=1782864451; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7/Ye8uQmQEtQzueRNIktNChhgXsfp7S9pzEwkRTES5k=;
 b=O0nVnqTPVotKthwIs3KNQGcumHndz14KPO7UuJNcct2bViJvRPKkDpKeLkuxa81H7K
 qWCdhTJsPZvjyMXIfa9PVtn0N5tFSAWKDQz6Ev4iBUCDf0D7p/1bpGOzk2UiZcqfDqSs
 n/cU3zY12mjGR9s49YFjJwLfdnUEwRXit+pOIrswYEht/CwNzx7vY/hjizCcLHJxn5DF
 w/ON0VFF2+Yo+9F8L5qSvqGDAQtf/KbDjk3uTGIFFaMgsec63g67JeXdtxCL8hQJm3Sb
 5Zq1pF5Jg16man+n70Gg2gpW+X6uT8Py65nks7nMdt7m77Y6eMiT19YwXvvK3M+YOW0q
 l9KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782259651; x=1782864451;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=7/Ye8uQmQEtQzueRNIktNChhgXsfp7S9pzEwkRTES5k=;
 b=EiF3FNuzClPifb91nz/lzCv37+Lbb+AThPNGVer7juOkf4nUoDG3zcsiWVSb92jIds
 e+USp0/ML/pHXN2FT+91UmzK55haqT8aBrpc60efSsb86C2ZzlKI56HZjN+O02/fY2tg
 fNIwCO7yIMhS0iclFxWbRjjzMwv6ScBsJOcx51mEtTdpZJwMWLkNIwucMFk8258MUh+5
 kNJS8nSz2rD2Twq0yQBZFGqSDkINpmptMazbKCwuP3u6k670DKsuMaeU+0bFKkwtXCdg
 XsNyVbOsl+0zAJhf8jtTYaJFEhDN5V+qiYYx7H+xNgbWlkMhefND/+aSLNLwSMxPFlCL
 5RAg==
X-Gm-Message-State: AOJu0Yzu4ZqTR95NNduLkOMXlxDQZ1NPDdVGHa1N5OiilUCypUL1C5gb
 8LJ9isb7UVZQ9VK3Ub7QCl/CrWyA+nMncGxotfmTPnhP+PK5/UZ0Cr3xYg1w6XfXJFsZa5HnywW
 6smLergl7Onp7pNK+6BkEw9crYz2BEkdEXNAZuxvRRd0LwfqQbTHvuKd7Pw==
X-Gm-Gg: AfdE7cnYtGYQ48ckE6GcH0x41ewgVx6+oRXIOasXujLEZtHfwmjC7ZfAn1XUdO5pHaL
 FROLmQrcEsVPpzMXPe21ByXaNPCnSrbDAN6v4WB7y7NCuZegMzTCebyXVqHtsot00vmr6p3IRWE
 FRrXdFU2irnjCWQ3m6XknWmJzVf+BG6yyPHxdugwbBRZBxD2F1iPS0cuylW4iy8eiFXcENz6IQQ
 ENbOIk8fXcwuAEFkVz/HxSATjFcXVvk0Pab4a0rMNlq20YfS6m5Hn1KBoxa3AO0q8AA7CpUh0nM
 ibhPgVsAvlBgDHJfLCq8O6FxxW+qtebM6JPRh7keuWn5W3Um8Dx8CWs719Cf+19x+QwvjD3qGSG
 W9D2HECxct+WSHQmN0JfQpcxR0HvbhfCg3riIRO7y3flvJg==
X-Received: by 2002:a05:622a:253:b0:519:e1b7:5ba with SMTP id
 d75a77b69052e-51a61d6f330mr19124051cf.15.1782259651374; 
 Tue, 23 Jun 2026 17:07:31 -0700 (PDT)
X-Received: by 2002:a05:622a:253:b0:519:e1b7:5ba with SMTP id
 d75a77b69052e-51a61d6f330mr19123581cf.15.1782259651022; 
 Tue, 23 Jun 2026 17:07:31 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([189.79.21.40])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8df81cdec56sm142422976d6.32.2026.06.23.17.07.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jun 2026 17:07:30 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com,
 pierrick.bouvier@oss.qualcomm.com, philmd@oss.qualcomm.com,
 fritchleybohrer@gmail.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH v2 17/24] target/riscv/cpu.c: filter TCG only bits in
 riscv_cpu_reset_hold()
Date: Tue, 23 Jun 2026 21:06:24 -0300
Message-ID: <20260624000632.2149359-18-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260624000632.2149359-1-daniel.barboza@oss.qualcomm.com>
References: <20260624000632.2149359-1-daniel.barboza@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: zQhGPK_xfjC99BrdvnKWjYQ3AKyVz27D
X-Proofpoint-ORIG-GUID: zQhGPK_xfjC99BrdvnKWjYQ3AKyVz27D
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDE5OSBTYWx0ZWRfX/sT8sIkBfs1D
 YwKkjB7oQsZC11HltpRNOnsW+IWg369Nb7saKyoArGMB4mYY7H/jSfw0vW160CTW5VwdGUCnXO9
 BMiyGPZ0zATp6C+y4YX0N8b7Mz3HaTI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDE5OSBTYWx0ZWRfX43xgHsXnaMqD
 NDKptpxBvHhsG0ZUwbFGnjueNoh25QoVJyw1PaJDTRkQAQsH8DV1jCtYBbibaLwSAnXqKtXtE2+
 uVQyNUN2h+4n1Smj/ax9m9YQfWuzSxDcgskziRtD4tSD619Dr3E7alDc3wQZvUnU0fZkW/JlEYH
 oDuE1nnk47yMiYsTbWwDv+UKUEOZo1TCwYdDQ9DJMIUycv5FYjErWmBydxqvsszSh9vSTJfPI9z
 VysmpPmhaZ/NjUWSeeDjfTU5PXJsNMcYMpwImgzDoqQym1ttMfGTDiWykiCXFcpepBalWWMSFuj
 R/gQO5oekWC5zfKGsEHsG3jOMRoAYxRd+tfT4rp92eqj9CmEwwu/YIq3BTn2ESV4uKF7lvdWUFp
 6urzfPJ0xmatiHGI9iENZT2EY3UiTnE43MwzIZ8N815k9W+0HSQ1kMCWdTpb3RAh4adOLjZjpqg
 zGmIosVZNCWkSY3ayQQ==
X-Authority-Analysis: v=2.4 cv=OeKoyBTY c=1 sm=1 tr=0 ts=6a3b1fc3 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=sHJf4AwOIoU3qjeHFPlg6Q==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=bJI4hLjMr12y1cUB6bUA:9 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_04,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 malwarescore=0 adultscore=0
 suspectscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606230199
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

We have a lot of TCG only initialization in the common cpu_reset_hold
callback that prevents --disable-tcg to work.

Put a CONFIG_TCG ifdef around those bits to make the build work.
Eventually we'll create a TCG specific reset function in tcg-cpu.c but
for now this suffices.

Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
---
 target/riscv/cpu.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 8f9d2967ef..0c777b76d6 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -958,10 +958,6 @@ bool riscv_cpu_has_work(CPUState *cs)
 
 static void riscv_cpu_reset_hold(Object *obj, ResetType type)
 {
-#ifndef CONFIG_USER_ONLY
-    uint8_t iprio;
-    int i, irq, rdzero;
-#endif
     CPUState *cs = CPU(obj);
     RISCVCPU *cpu = RISCV_CPU(cs);
     RISCVCPUClass *mcc = RISCV_CPU_GET_CLASS(obj);
@@ -1013,6 +1009,10 @@ static void riscv_cpu_reset_hold(Object *obj, ResetType type)
                     MENVCFG_ADUE : 0);
     env->henvcfg = 0;
 
+#ifdef CONFIG_TCG
+    uint8_t iprio;
+    int i, irq, rdzero;
+
     /* Initialized default priorities of local interrupts. */
     for (i = 0; i < ARRAY_SIZE(env->miprio); i++) {
         iprio = riscv_cpu_default_priority(i);
@@ -1050,11 +1050,12 @@ static void riscv_cpu_reset_hold(Object *obj, ResetType type)
     }
 
     pmp_unlock_entries(env);
+#endif /* ifdef CONFIG_TCG */
 #else
     env->priv = PRV_U;
     env->senvcfg = 0;
     env->menvcfg = 0;
-#endif
+#endif /* ifndef CONFIG_USER_ONLY */
 
     /* on reset elp is clear */
     env->elp = false;
-- 
2.43.0


