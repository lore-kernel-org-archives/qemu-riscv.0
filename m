Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08422C43458
	for <qemu-riscv@archiver.kernel.org>; Fri,  3 Jul 2026 18:08:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wfiIK-0002ND-PQ; Fri, 03 Jul 2026 14:07:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wfiHv-0001mE-HM
 for qemu-riscv@nongnu.org; Fri, 03 Jul 2026 14:06:56 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wfiHs-0002P9-Pq
 for qemu-riscv@nongnu.org; Fri, 03 Jul 2026 14:06:54 -0400
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 663HjALG685978
 for <qemu-riscv@nongnu.org>; Fri, 3 Jul 2026 18:06:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 GSjWbCL/dirhcrj5dWYYaOR2XqQ0JWP1BRKckTfPwSk=; b=ptB4JPBGjPRj05+S
 4CJrgBvDKddJtlTk4Rj15aKNgQSkhBA/JybGTzJ/yOhbzF+hPtuFyo+896Pjw7JI
 Tj2xIr3pEoevRaPvNUKnOAlO7IWueqN5zIcd0VHjd1GYgaaXMR6zI8SxE288JHJo
 SXDaOulqxibsxX6cXGJC6A+URmYCGs3DdMpLqSxdfrci7lDGt4bDBm50i8kAS/IZ
 EYjqZafb+fuTFXMmN0kEIYjQ4j2nvQBfrvufMBqXv+GlRCrT5BcVO4kijKh3yw07
 pbh5HKEf/jRy6sR1TrjhzrFXkfWHTnBbLP0GgeA0YjMC2bDw5JFQgBbJ41iOf6KC
 FSLY0g==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f65qck6nd-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Fri, 03 Jul 2026 18:06:51 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-8f0867a75ecso16980546d6.3
 for <qemu-riscv@nongnu.org>; Fri, 03 Jul 2026 11:06:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1783102011; x=1783706811; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GSjWbCL/dirhcrj5dWYYaOR2XqQ0JWP1BRKckTfPwSk=;
 b=QkYjXJcVaScVHTaX5JGiUYCAO+pFeTAXLsUXaNlp8qyDXlPXvuRvZChmCH/MJ5+xA3
 MQ3ywbKO3/jhI5Jl8pwF6coBWhCFLplmQJY78OzBxX46UU+iQnLSJgxFKffCMxA6hWua
 jt8uAPMPXvFhKjgNo/NBaVQpmksUgFuKBM7ROtt6A1JsDqS9sMse9x+Ggte5dyMAXm0s
 LddNTDTnuPFZFHjEeApMKTQeSGhm1wLNC6DMWGkiKZgeEVz0b6DYgOPArgeX+6hV4MoU
 hz8CL6oMuEcdmXKYFUhm36/VnOo9drPqjVQjUJY45YSmdJu4ExUI1peu9JwRwUQWSpQF
 mfgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783102011; x=1783706811;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=GSjWbCL/dirhcrj5dWYYaOR2XqQ0JWP1BRKckTfPwSk=;
 b=aIKjbpsa5Eup+4gQBMGBeryTtkdM1vnxazB0+SJ/Pg1eGNmt1AN3vYTgQcfkOP3lRA
 1aOQTy127mIyImQ6q75Ns6OEhMBnyEKlHxIyXepFFaOmoG26bHYKbXpfUGyEPNnhaSGA
 ok8kykINX0kgJyyNcaRpBXX4zJNBR/Jidu+tHMgwOywo1DJD3hyd46UbWa+Ws9PbY2Sc
 /qIpwqeooX3vBvLQ5kJA9v81ENCm2BLeDBTc5Y/ZhtmqqOO3MW5ZULHuUz8nW1Xqx4C/
 Q/ZVpa+KjRX+ntnRgHFpgretxfNsKZVbw0sf00H6mFlUw3mx4HkatoKF3o6AkrYmf9+b
 Wa5A==
X-Gm-Message-State: AOJu0Yy4wQXcF0R2ylClAaDyU4JiNZNjnk0ooLW98SGOCp2Nr9nR2Hig
 OIiZrKtNdlbOZwt4l3f5U50x7nGRy8YhM++TkUlCAG+DlwDQp17KzeALOk771zP5iIjiySUwVXJ
 N2LdttoAdYb/I/ZEcCBPqses9Ju6GNhgd8mVmhCYGbTymrmgEU01Qt5FgAw==
X-Gm-Gg: AfdE7cm/CvNxY12IG5LgxgNvzxXHsZWEtngU5Iys/umSwk0YAj0af12tJQQ6yn/esnE
 FQoN7V9+ocSiP7UNlNJi4yCN4fQlONJrMluomgFJg8Okz/NvjAOpTvXVc6DZ3PtY4sE94Al+63U
 qseSs91RfSRBU7fPLJh7adIfUkqffC6hywEYxaTWv3e5L2YdVl9NMNzwQYkL6H4OSHEvdVC5N3q
 TmkjuLKleJLw3wf9EqCsEoE2wWk2cWNWy/yhV7XXZ2apJZAryXtSZ9EsNamsqwH0oWDxSopidYN
 BHI+xgSRXI79+ZDyoIKwKgNS3KNxO+rPxJxAEUyBr4pSqsVGzslE1KNfn6zcf55Z7vvFjOd3upV
 9J+NlfOFFbLwrjBMoGW4mG0as7PLjcyPSsqd2mGc1ypAceg==
X-Received: by 2002:a05:622a:408a:b0:51b:3e56:6407 with SMTP id
 d75a77b69052e-51c4c32a935mr10577631cf.54.1783102011227; 
 Fri, 03 Jul 2026 11:06:51 -0700 (PDT)
X-Received: by 2002:a05:622a:408a:b0:51b:3e56:6407 with SMTP id
 d75a77b69052e-51c4c32a935mr10576831cf.54.1783102010656; 
 Fri, 03 Jul 2026 11:06:50 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([189.79.21.40])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-51c41d2d688sm22560081cf.17.2026.07.03.11.06.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jul 2026 11:06:49 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH v4 22/24] target/riscv: move riscv_cpu_set_geilen() to
 riscv-imsic
Date: Fri,  3 Jul 2026 15:05:34 -0300
Message-ID: <20260703180538.3346781-23-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260703180538.3346781-1-daniel.barboza@oss.qualcomm.com>
References: <20260703180538.3346781-1-daniel.barboza@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 4b9s5_rr_bAei3UPr8OKSjqSOrdfe1Rr
X-Authority-Analysis: v=2.4 cv=Bb7oFLt2 c=1 sm=1 tr=0 ts=6a47fa3b cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=sHJf4AwOIoU3qjeHFPlg6Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=Lr_FLp39YrF5VQqdKKgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: 4b9s5_rr_bAei3UPr8OKSjqSOrdfe1Rr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDE4MSBTYWx0ZWRfXwA3RAvPtpRYu
 4inOFGGeTCnZbJrcblW747zUEDmuHtCLfdWEmsxCJ4O7tmHFqj31ED7e2GHIy3FWctVRvNR8RMW
 1wo4V/IEu3UkOainuOuVo82zujcryZ5hQbnsSgrsRF/dHJxlKIgYB019oqYXqSMVG6ay0asvURc
 OIlr2RSyW/P22+YJzXXx7816dMD5D//PcL4JRhWvsU+6mTlAS8n/rZbCUCHbGD+9J8yw3/OwT+q
 7YV56GTIDk5t9k3ohmDul8aMB6Z9yOiWATkS73vWL6xmDDKeX/kbi48NRDTyXUZk3BRZBOpwSnD
 M7QSBvcJixvDD4E2d0jWCqKUHGsbgFYT7S0wAc3FshuNxAyCdg9uhQbxc7OTBdfz0X+ZNcYS4Ka
 i8bCrGLPvLMTQc906EfbrHqDUi8wdXfTDfZufOXeki6N3ezXECT8PminV3uH3OnUh/ipaJ00Dpc
 SRcDXocZOJI51dQ4Dgg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDE4MSBTYWx0ZWRfX9CrHkbp537rp
 AozSXjsUxcEZh5LWIlGfURYR/Ya92+AlFn4k32eljZq4+iwpAFJtTHo2hfgjxumUEYP9/dAEZvc
 B6fuwE9QO4DebnXHZGHXZP6r/am5AME=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_03,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 phishscore=0 adultscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030181
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

riscv_imsic.c is the only caller.  Having it sitting in the TCG only
cpu_helper.c gets in the way of --disable-tcg for no good reason.

Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 hw/intc/riscv_imsic.c         | 13 +++++++++++++
 target/riscv/cpu.h            |  1 -
 target/riscv/tcg/cpu_helper.c | 13 -------------
 3 files changed, 13 insertions(+), 14 deletions(-)

diff --git a/hw/intc/riscv_imsic.c b/hw/intc/riscv_imsic.c
index 7e5b5349ba..ebb55191c7 100644
--- a/hw/intc/riscv_imsic.c
+++ b/hw/intc/riscv_imsic.c
@@ -46,6 +46,19 @@
 #define IMSIC_EISTATE_ENPEND           (IMSIC_EISTATE_ENABLED | \
                                         IMSIC_EISTATE_PENDING)
 
+static void riscv_cpu_set_geilen(CPURISCVState *env, uint8_t geilen)
+{
+    if (!riscv_has_ext(env, RVH)) {
+        return;
+    }
+
+    if (geilen > (TARGET_LONG_BITS - 1)) {
+        return;
+    }
+
+    env->geilen = geilen;
+}
+
 static uint32_t riscv_imsic_topei(RISCVIMSICState *imsic, uint32_t page)
 {
     uint32_t i, max_irq, base;
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 7618110412..7a4d8abe07 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -646,7 +646,6 @@ int riscv_cpu_pending_to_irq(CPURISCVState *env,
 
 
 bool riscv_cpu_fp_enabled(CPURISCVState *env);
-void riscv_cpu_set_geilen(CPURISCVState *env, uint8_t geilen);
 bool riscv_cpu_vector_enabled(CPURISCVState *env);
 void riscv_cpu_set_virt_enabled(CPURISCVState *env, bool enable);
 int riscv_env_mmu_index(CPURISCVState *env, bool ifetch);
diff --git a/target/riscv/tcg/cpu_helper.c b/target/riscv/tcg/cpu_helper.c
index 6b39152ee2..71a96a20ef 100644
--- a/target/riscv/tcg/cpu_helper.c
+++ b/target/riscv/tcg/cpu_helper.c
@@ -526,19 +526,6 @@ void riscv_cpu_swap_hypervisor_regs(CPURISCVState *env)
     }
 }
 
-void riscv_cpu_set_geilen(CPURISCVState *env, uint8_t geilen)
-{
-    if (!riscv_has_ext(env, RVH)) {
-        return;
-    }
-
-    if (geilen > (TARGET_LONG_BITS - 1)) {
-        return;
-    }
-
-    env->geilen = geilen;
-}
-
 void riscv_cpu_set_rnmi(RISCVCPU *cpu, uint32_t irq, bool level)
 {
     CPURISCVState *env = &cpu->env;
-- 
2.43.0


