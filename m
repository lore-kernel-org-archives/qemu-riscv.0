Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B268BCD98E4
	for <qemu-riscv@archiver.kernel.org>; Wed, 17 Jun 2026 13:18:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wZq8y-0006FD-JW; Wed, 17 Jun 2026 09:17:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wZq8v-0006EM-TZ
 for qemu-riscv@nongnu.org; Wed, 17 Jun 2026 09:17:22 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wZq8u-0002yS-3M
 for qemu-riscv@nongnu.org; Wed, 17 Jun 2026 09:17:21 -0400
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65HD0kSC2881776
 for <qemu-riscv@nongnu.org>; Wed, 17 Jun 2026 13:17:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 8GztL1Elr1qdIuEyXh8KObvYDmXHW9cI0PCqtZBYkx8=; b=TWkQyaRHzN+Jn+Qp
 1IuPF+AYkdywPZfEi36qCi3wEY6zcVIf9OhLuy7JCx2wigcxD9hPopNJpe0G0bJv
 L//sj7rRwUfosxjnVD+CDYpi0rC0zn2DjtUbfICO71GX/9xLRzreWLPtOlbOaIzD
 KDOil+LJO46fkKiJ14GH1R2GNgm+XyZAt5h7ChBW9GJcB6UxAIUOdrKs2yAPVA/e
 U5zlj5R1YMhxNaS2cQdB1nErl1c0/P1deR235tyEWe8Pz1ugfhDbRp6yRNef10EF
 nMA1y84oN2Ijtkm1NaQo+z1U7gIq9Otubrezq6pWKsEwOXz89MhZfPXwgxLkuZce
 LHPOGA==
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4euef2bbjn-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 17 Jun 2026 13:17:18 +0000 (GMT)
Received: by mail-yw1-f199.google.com with SMTP id
 00721157ae682-7ff705a4289so710327b3.2
 for <qemu-riscv@nongnu.org>; Wed, 17 Jun 2026 06:17:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1781702238; x=1782307038; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8GztL1Elr1qdIuEyXh8KObvYDmXHW9cI0PCqtZBYkx8=;
 b=hN9IWE4uaPLHuC4geIsZEQdwwb94ML++Pa53/y/ryHMrdSmSAhF2Xnm6UzCKk4GGd7
 dmWL26q1N3vjMi6nBV37ay6az100iqymGdr7oqWHjJEhVDu6L4DOlHygzOWErXE0FZT3
 fBiJ2zqvIbRFKl4GH48pyInHJ3p4r2nOMGOQSV1DLLqXfl7ZV9XNPmVfCDWjBfiUl7mK
 KnGcaltRm1xa0IN++c3gmZZ1LlGRrDQbOUznFCi6DLjFl4b4Ukp+Vih2euOw9ZSGZnPm
 jalKBd4ducOKIfeGI4W+9KDDHpACuuOEU4aUGpjOxy0zTkaFRQd7LgmJ/Svqb2kB+Ed7
 zdeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781702238; x=1782307038;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=8GztL1Elr1qdIuEyXh8KObvYDmXHW9cI0PCqtZBYkx8=;
 b=RNATd3k9RQE0Ca8HOWgTqtDD4uQCth+NrfWTqXlPFSeXJKd40InaloEQymjRSFNurJ
 T1AJllzJnbsAg2+MCvOkwIywZD5xVcH7cQuZOe0iwRZVjvyN4wmHzh9Pk0tQ499jDSEY
 2yNe+I0oX+mibhbRVtP4XwIA/SsvPxVZxMvFvWRYI59oijDA7UgS5LRIHUDSrfZb0eM2
 1WNcpb3SxCcR4JsYZB9ljlyvnVvk4gxYJ0uTO2lraEn/iOZ6hijsRU9mEwE+PWOKP9u8
 hFoy07sfMCWhlOuK6bW101eoM8gW3O6MEaxhlSaEZTX280VQY6O4joZs/39rolNn8/yE
 tbMA==
X-Gm-Message-State: AOJu0Yxmisq8dI5tW1RK4owDf33mCgWlXZ+AIfraEBAoHR+P+IANxVH7
 TZSYPJzHZTDpg7utPS6lP82PN2pQIuOem/bhTdNjWxjgiD7wdFH9X4xIyCTHyw2Bqaa6BC9LmUM
 wpjMMboke4M13e3JHMJcRtv9tbEli9SM5QsE4ZXk3TU9AtO5CbtoDBhpkCg==
X-Gm-Gg: AfdE7ck1yQbo9208TWH/i0j/BA/Ix7bK8YYxuLLmmCvhTaMpqQsO8KkkO4Nqbyns8rU
 H/LeTyGaijwCTDZTHuRZFPJrBGolHVwBy/c/Exh+hvy6uT/AqQOWbBM+WHYeVA0+H3vYvBPfB4i
 Sus8gCRPgOxm08NXtEkraDqpq+LW1Pt9ENgsXQ1yl/0SALQIWTC4+ZjCnLVqTE6BgbTnwoVi+tQ
 iWTN9i6aPRYnvRala0jWK15WlWsAs1SYIq4+PS5/xVds6sT5Qu+mi7Gh/r9WdbAv4IqSPhH8Wcp
 y5YA+Y9hHhYofRYGbQKt/B30bBUrPaYCWu+SNKOtg8OqdMe09Shmy+sw7NrRaQkd6yDvaei4Tqu
 nuXS5ndFFJbk2PfzxYdwQ/npa9vunton+/Srv7iEQ/K1guGFi
X-Received: by 2002:a05:690c:7403:b0:7dd:3f36:59e3 with SMTP id
 00721157ae682-7fe5de9ccfemr36529557b3.36.1781702238309; 
 Wed, 17 Jun 2026 06:17:18 -0700 (PDT)
X-Received: by 2002:a05:690c:7403:b0:7dd:3f36:59e3 with SMTP id
 00721157ae682-7fe5de9ccfemr36528877b3.36.1781702237809; 
 Wed, 17 Jun 2026 06:17:17 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([177.170.117.62])
 by smtp.gmail.com with ESMTPSA id
 00721157ae682-7fcd345a5fesm44861707b3.36.2026.06.17.06.17.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jun 2026 06:17:17 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH v4 1/3] target/riscv/cpu: add CPU unrealize callback
Date: Wed, 17 Jun 2026 10:17:08 -0300
Message-ID: <20260617131710.1855353-2-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260617131710.1855353-1-daniel.barboza@oss.qualcomm.com>
References: <20260617131710.1855353-1-daniel.barboza@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=F8hnsKhN c=1 sm=1 tr=0 ts=6a329e5e cx=c_pps
 a=72HoHk1woDtn7btP4rdmlg==:117 a=gdiugJE53z4H+vvYeRBHqw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=JF9118EUAAAA:8 a=-V4TLcwJ7WInddZtJMgA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=kA6IBgd4cpdPkAWqgNAz:22 a=xVlTc564ipvMDusKsbsT:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDEyNiBTYWx0ZWRfX6HBxkIKPUSSc
 cXby55u+vxpJ/pPW/iTDbhpbp1ZfFIyn2XK4Oza/EZsxipD9x1oieouC2nXbUuNxu7xATsiA+Pt
 7Yjd0+JRyvJPCIzTxnjaLyPI5ws8d9M=
X-Proofpoint-GUID: vPWeIFlr1pRH3LbXeClPlinHYH7mIgAZ
X-Proofpoint-ORIG-GUID: vPWeIFlr1pRH3LbXeClPlinHYH7mIgAZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDEyNiBTYWx0ZWRfXy+JQgmuahpjB
 PzAAURh558i9aIOntz1JYRHzuElq9i0WZW4Q92nSukVgEPtf3UwHb37iF/PVOg8Ii6mrYQLKDmF
 EUdVAB46aRh8P4UwUnbDm/KJgGjS1bIZ/1zEI17OfuiXn6yQcMbSMiKGHtDM39UrBPX3ockXnSI
 uuMTCvjD0p5UHS8fgAvymu/x0PCCSDbZ9nDcfXfdVm+/Z8hp4jcXH5I1eoAJ3M4Af8XP5wkY6Dz
 7Ds71PwE9zBQBvdBQVdA0swVsqd5xLmf9GELzfMbjZNzAYwXGzsfEZcSQMCptBz+Q/uGs3MIQKU
 XFMIkHKzEuIeEDo5CXk0SD9W1dTPVZkVfxalfWB76FmI+0SMXh/sP/KlHZEeZykK9vVdPQdrU4e
 9N84IAuD5a1TTSs/eLtLJxUesK1A0JX0Uql2bSk8z4EfbuRMhzQhGSgPMbvuqUwoyXSC4EsmtUt
 Tb7SHr5mvq4m+3rFmLg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-17_01,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 phishscore=0 adultscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606170126
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

Next patch is going to dynamically allocate debug trigger arrays during
realize() time.  We need a way of freeing them during unrealize(), which
doesn't exist at this moment.

There's a lot going on in that patch already so we're adding the
callback infrastructure beforehand.

Suggested-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 9 +++++++++
 target/riscv/cpu.h | 2 ++
 2 files changed, 11 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index fa497e5e8a..b47e2b41c8 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1009,6 +1009,13 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
     mcc->parent_realize(dev, errp);
 }
 
+static void riscv_cpu_unrealize(DeviceState *dev)
+{
+    RISCVCPUClass *mcc = RISCV_CPU_GET_CLASS(dev);
+
+    mcc->parent_unrealize(dev);
+}
+
 bool riscv_cpu_accelerator_compatible(RISCVCPU *cpu)
 {
     if (tcg_enabled()) {
@@ -2664,6 +2671,8 @@ static void riscv_cpu_common_class_init(ObjectClass *c, const void *data)
 
     device_class_set_parent_realize(dc, riscv_cpu_realize,
                                     &mcc->parent_realize);
+    device_class_set_parent_unrealize(dc, riscv_cpu_unrealize,
+                                      &mcc->parent_unrealize);
 
     resettable_class_set_parent_phases(rc, NULL, riscv_cpu_reset_hold, NULL,
                                        &mcc->parent_phases);
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 7582874c35..16e9f87b83 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -576,6 +576,7 @@ typedef struct RISCVCPUDef {
 /**
  * RISCVCPUClass:
  * @parent_realize: The parent class' realize handler.
+ * @parent_unrealize: The parent class' unrealize handler.
  * @parent_phases: The parent class' reset phase handlers.
  *
  * A RISCV CPU model.
@@ -584,6 +585,7 @@ struct RISCVCPUClass {
     CPUClass parent_class;
 
     DeviceRealize parent_realize;
+    DeviceUnrealize parent_unrealize;
     ResettablePhases parent_phases;
     RISCVCPUDef *def;
 };
-- 
2.43.0


