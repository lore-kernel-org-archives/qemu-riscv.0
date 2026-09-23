Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4E11C98302
	for <qemu-riscv@archiver.kernel.org>; Wed, 23 Sep 2026 17:17:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x9QYS-0007dL-C6; Wed, 23 Sep 2026 13:14:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x9QX9-0005zZ-Ff
 for qemu-riscv@nongnu.org; Wed, 23 Sep 2026 13:13:30 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x9QX5-0001I6-In
 for qemu-riscv@nongnu.org; Wed, 23 Sep 2026 13:13:26 -0400
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68NGTrrU596174
 for <qemu-riscv@nongnu.org>; Wed, 23 Sep 2026 17:13:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 kNtz7Wsg4/5oYhsduTgWMHFHx5o63oBFXK1BI+bPv0Q=; b=HAREu84GgSQzQC8F
 hsIPKrtpjf49b/kXo1YJDNYOmGrKQRoi9wUcyoLsGHcZXGKN3zzGtgGDbNH5xx3v
 pyYIQBcNIZZl5UfG0Q+dOAU0FOgVkF6byXqEmbQSSEf+3Djk8UsoHO6k3DB0AvKA
 tRxwWmaEd0ckv28/5XQwA+0+6Txlo3sp84Eqsbg2+KpUStto7SPTSyNAfP2rXrL3
 Nn3Rw+v7EMCBxcAnR14YhC8ROe5PR+NSW/YSNYXIWbMReXeDcyoA62ysMeBAeaDA
 T+PNTbWdiw7azppwISYvRNt7qGXVWYnKDCP2RIpHcdQzE29n9GHvpkAO/xHh37JI
 nkarSQ==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com
 [209.85.217.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvfjxs3k0-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 23 Sep 2026 17:13:12 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id
 ada2fe7eead31-78d25a8ff32so424338137.2
 for <qemu-riscv@nongnu.org>; Wed, 23 Sep 2026 10:13:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1790183591; x=1790788391; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=kNtz7Wsg4/5oYhsduTgWMHFHx5o63oBFXK1BI+bPv0Q=;
 b=IlHH60i0y9lSMQLfqYQfIkZgO1Zqs3WoVMsArUHKFXmLqOOdNAm2Ecj1XePk6ltL5C
 CSdSH9HQjG4eFRZIqHqJQtrk0DSZ870ZQHl5ywTt/gIj7hO6wk2iK2ZyQSkWfgDEMhtw
 ZBNaC/mQc6FlPgF5nhNYNi+IRochMSajmu8ofRAOWKPCj67gWfRIIKBlO5DwRVQu/UnV
 zsinZBvwcp4MTwEZkbJoPX2XDOQLZe5boUcksQ/kY6FPvVJefWbS+QmDjNxfYW6mFWeR
 2Vq+FbniGIo7qsvla83kFSDcu3QzVLQThT6SYHDOq7/2anuWXLfR0/u47endysfzscRe
 AMHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790183591; x=1790788391;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=kNtz7Wsg4/5oYhsduTgWMHFHx5o63oBFXK1BI+bPv0Q=;
 b=gffnuAgBmc+Yx02nnoBbYpfH+0Y28cE0xg37nX95ZJkSZRlZZ+CNablj/BDkgdRcTg
 GIWbdsid3XdO3gOdtgRmtDVVmW3rMnIssPJTl4C0y1JRF93o3EmSTNpkJmEevuX66E/o
 erNUl2F44e3ngiAoiRFg5PQverITQ6BMbLfubmloRFujSOGjoyj1rC8643HWNbmRNlR2
 ALbaPEIRCG6onS7aTnF6OfJEWuorMYjMubNJ82T9HJCOpx8cjtu9LaRUFPl508WrRFha
 aFz/u2ojJnkMncLEl2CDdT3T/Fvy+Wkd4DhGoZQGwN491VG4fMqTEJn9rZmAQ4bWkcFA
 STNg==
X-Forwarded-Encrypted: i=1;
 AKwUvByWh6C4Srq4mvXMe3bO8/lvwvTyLQVtpTB5ihuPMH/JqRjZwgNrhVSNMo5hpNYWyl+q66DKqsi3+EY0@nongnu.org
X-Gm-Message-State: AFuF++kzm2rk2pQ446HaLNaP/e5zUIbGTjocKzNZsGjwudvi2fsP5gwW
 0vkvUEQoLYBW5N/nuVZ0xUs4uRrFPAKXdkrilhammQZpdGGfjz+ejj0OQIhPH3nPymh773d6joQ
 yCVPbcY2iP3CfbDHkUTnVvPHEhTRfdwLnazfk1iPRKI0a3rj6SEhj9Rs79A==
X-Gm-Gg: AYBFou1B+xh9qZh4nG9v6lm+x3hnnS0XtCPB6Q0ry/PYebceBuzjlKg93CCFK+XaV2F
 UPxkXdratBf4f4Oq+RwlA/X92pReOaxCBXX3jkPe53+KMPxsdxCO49pnD/YEVPOoJogFgppOmca
 bgTEy8c5HlA3aM2I+uYW/fuGvQc5A2kKyOlXYXbZWjtdU4A+uhvs3fP/bSRaBebnQWQTUsWVn2W
 9uoLX5ds+LAjVu1Ln9xloYu+RgvegQlDAt94DFToy6LuyFfi05KXiRgsWR6jx1BKK6/C84ig3Pl
 l9rcyeNRhMX6DX0xUiFge4ZqiC5mNrQBUb8TtQsHA/kiv7dcWMo6O1Uku47X7HTdW6bv8bclm/g
 W6c45yw97ZaZyxw/F/caAeU+jQMrSlFLoGPrj2ux0
X-Received: by 2002:a05:6102:5121:b0:7a5:4d80:a913 with SMTP id
 ada2fe7eead31-7ac1abd2294mr3118752137.7.1790183591141; 
 Wed, 23 Sep 2026 10:13:11 -0700 (PDT)
X-Received: by 2002:a05:6102:5121:b0:7a5:4d80:a913 with SMTP id
 ada2fe7eead31-7ac1abd2294mr3118728137.7.1790183590672; 
 Wed, 23 Sep 2026 10:13:10 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fe5cd4271sm926755e9.5.2026.09.23.10.13.08
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 23 Sep 2026 10:13:09 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-riscv@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Subject: [PATCH v3 15/21] target/arm: Split leaving-halt handling from
 arm_cpu_exec_halt()
Date: Wed, 23 Sep 2026 19:11:09 +0200
Message-ID: <20260923171116.31276-16-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260923171116.31276-1-philmd@oss.qualcomm.com>
References: <20260923171116.31276-1-philmd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: T3d32sRoetmYb4nVCEckabcx8kqppyqz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA2OCBTYWx0ZWRfXwIWT+RMZWg+t
 w9J+zYOovEkowJx3MrWYiD49TurhmcM4nWjj7VtZAbtlhJy05DUTPCc6CY5TVfwcmhLeBtrXLzr
 vBd99dTQ0p3FYFJV1pDJnR1lE+7ym/hDxCWmUPJpO10yIbrPV1YqJq7LR852GRIuo6XBpVLp79B
 PG09ZtdKfT4qU4a2AX17/nGwDznKoYqZsHOQv1jVqj9EVHR5Yh+NBPGeZN/LII9WOszFf9YZYVu
 bAcFsPVXBdKtby7iNn58oBvdIQ3yEIl6tMb1/6tXbR/wWhOBqs9Mvh+907L5ZdO4z0xibDH9Thy
 +rG5FfWh9iia3gEP4BErufX4T2UtPBs0uOai25l1bI3pkyYeks4WaXZzNG6KXdQLeeUKXbA61bu
 9b2ebuTRm9yEmEX1Uj1fkQ7aJiXqVMtbYSuqlvQhCkh8xT9p8fhtIUu7zyjDs0GwZfKUFY8821Q
 /zTwGZQQU1zIBKIlpfg==
X-Proofpoint-GUID: T3d32sRoetmYb4nVCEckabcx8kqppyqz
X-Authority-Analysis: v=2.4 cv=NLpAaE6g c=1 sm=1 tr=0 ts=6ab408a8 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=snbnvTbt-5-dSQZ-83gA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=ODZdjJIeia2B_SHc_B0f:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA2OCBTYWx0ZWRfX1JDovDSXn3K9
 NkJAdVEXN2uVnsRgMhLLsREt+qwjWSpX84yhpaDi4QCpQIuxt9fnEFjvw3m9Lnjl8+UCrhj9Rro
 3mNmhf0sEJSwgPJKZGbhjmPvBergby4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_06,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 adultscore=0 suspectscore=0 priorityscore=1501
 impostorscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230068
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
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

Move WFxT timer cleanup and halt-reason reset into
arm_cpu_leaving_halt(). Keep arm_cpu_exec_halt()
focused on deciding whether the CPU can leave the
halted state.

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 090470da40a..0885a8eb03e 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -872,18 +872,24 @@ static bool arm_cpu_internal_is_big_endian(CPUState *cs)
 }
 
 #ifdef CONFIG_TCG
+static void arm_cpu_leaving_halt(CPUState *cs)
+{
+    ARMCPU *cpu = ARM_CPU(cs);
+
+    /* We're about to come out of WFI/WFE: disable the WFxT timer */
+    if (cpu->wfxt_timer) {
+        timer_del(cpu->wfxt_timer);
+    }
+    /* clear the halt reason */
+    qatomic_set(&cpu->env.halt_reason, NOT_HALTED);
+}
+
 bool arm_cpu_exec_halt(CPUState *cs)
 {
     bool leave_halt = cpu_has_work(cs);
 
     if (leave_halt) {
-        /* We're about to come out of WFI/WFE: disable the WFxT timer */
-        ARMCPU *cpu = ARM_CPU(cs);
-        if (cpu->wfxt_timer) {
-            timer_del(cpu->wfxt_timer);
-        }
-        /* clear the halt reason */
-        qatomic_set(&cpu->env.halt_reason, NOT_HALTED);
+        arm_cpu_leaving_halt(cs);
     }
     return leave_halt;
 }
-- 
2.53.0


