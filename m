Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC4A9C43458
	for <qemu-riscv@archiver.kernel.org>; Fri,  3 Jul 2026 18:08:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wfiH8-0001Je-1e; Fri, 03 Jul 2026 14:06:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wfiH6-0001Iq-Qe
 for qemu-riscv@nongnu.org; Fri, 03 Jul 2026 14:06:04 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wfiH5-000289-8J
 for qemu-riscv@nongnu.org; Fri, 03 Jul 2026 14:06:04 -0400
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 663Hj67s679223
 for <qemu-riscv@nongnu.org>; Fri, 3 Jul 2026 18:06:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 P5A1RJ41oIlsBRfOfbQ9ZlZCMWw0H1WUWGcHvw5tK1c=; b=JdQksl47CAII/Esn
 j1AA2ZLwBLWaDCtOq3n+/f5YC15AeCKTrYtGAI1KVLQvZ/WEs5zrVGWLSE+IYgb/
 CQHM6qlLLPXoAycGQHhFreNg9nLj/6o/2C4WqRR0anjZDtkRHlb/Q63PB30Am26z
 Yq5JmDNa5jaLxTT1nkdPufW3cNezRszy5gEPVWbAkh1OEEXPWWckObZuHLibrp3X
 xxoHkuIGVPinvUmUpFIaOxqS4dihrHm1Bi0PCdwbK4sXUO5OvncEJHiOMnOTWYDZ
 iA/4qw3Jg+2xC7GCZ477xrZIFGalxeq2dkML0HFXq9DTePElBIRsu/fOLALjy1Fm
 mVmqvQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f68u328yk-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Fri, 03 Jul 2026 18:06:00 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-51c0199faafso9195911cf.3
 for <qemu-riscv@nongnu.org>; Fri, 03 Jul 2026 11:06:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1783101959; x=1783706759; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=P5A1RJ41oIlsBRfOfbQ9ZlZCMWw0H1WUWGcHvw5tK1c=;
 b=LQq3tmXpPcGuwApt8LAqJ7QBS4X/u4fiVvXCZQFjGoa0qrJQZOtl6v2y9P2H2v+yIP
 uXvgB9t03I4HzPwfvnJvhnmk5dbH+DmNLjpkJzT5vx2AodJ9FRq9oQZzYVnUIxEzV9YR
 P73BMAH0iLC+uPFM9vkHQYpzLYi6c1PvjVqlw4frHOzqXSYQ65TBiv9b9RlbVJCP2Hp2
 OxKsTLRCjtNHxDPtpsSKMehX34GdWvnH1cQzgBtEzwzPcVoVNUdaz/SC7+7M8xS29Ab3
 HrVa8Zw1pAAw8plY5Bg4AZCU8grZTE//xKCdNzkxyTEgRCiIFGHSmQYx2LDn5+DF83xU
 6oIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783101959; x=1783706759;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=P5A1RJ41oIlsBRfOfbQ9ZlZCMWw0H1WUWGcHvw5tK1c=;
 b=KpMr9XGItbPofwk+Mf7FxuNn5hViwUvcAfdQGz9Ialq6zsLtCTil1EQpc9kPSi2DZk
 OUN8H3FPF+b2URWM1k3hWAgvEhLbQezFWaoxR1SRXFdzSxHV0HZhsbxfTAHPUnWicZm+
 oINum/rAXILVeWmTPB6Dw2ZxHSdF/pfH5kynB6dIH2Q04ndzTqyuD+7WyFlHyGqFsSvb
 3qFAh/M6yBaSF+QEUVHvHvJ66U6U0BA6c5GMqdwo7crS0OHdCcLtkI/eUEPOYJaa98tL
 DwS7/gw50q4eTL+nasvz+nWjkwVotEvJjxALCjSe3hqY6aWwRd/Wcj6gmeyusDEhF7UI
 Qamg==
X-Gm-Message-State: AOJu0YwYdprlSN9Wo8IpqDxilTkk7X5EX1KD0KfiToz+4HqB0qO/FD61
 mnaMr2eZUj4e2GA0jYGRxQ1pVf5J+Z0m4sjq1fpUJI8V1v1HBDtGwwMivUvJJXFk10Ceqa68WRO
 C0vegzEUSQrirUbZkt9+DNqAcWqF5l0hDt2WfE3eHGnkehDfKgKXsy2vZGw==
X-Gm-Gg: AfdE7cljzyULfP/0Fh7feO29rVdJQIOp5rYJdoDhNN9G/C3G5ikRbCYvcgZsKQVMmqO
 kRM51HWGvI4TV96DXxN7WEv6DYSkVtXqz1l9COvFia31XETRWSlYcmpiNMn9mmAKofFfsLXCGHu
 w86jXbbechDONGIwwlD+SnPg86JZ6XLNspilFJznNaonZFcDinBKZ8RvhPOWHjMgM0gYWJKopkC
 kTBUJnVeKpx/iKQC4V3W99RB0HRgvfaYtYXv/JyjvrYgirjagJyuArkQbclxkrJH7h+bNXnwhnd
 9ErL8mVJBnVZyb2CP96e5/1MNu1AcDOHJBUjBrwnwEx+e24Yok85+h+twQRMX66MoP+DT5wEOzq
 BT7HX5OImgTHtay+fJuDbocVMKVhc5Ff3nXxpOI4FborzGw==
X-Received: by 2002:a05:622a:c06:b0:516:eaf9:f6f1 with SMTP id
 d75a77b69052e-51c4c1f62bbmr9931711cf.13.1783101959201; 
 Fri, 03 Jul 2026 11:05:59 -0700 (PDT)
X-Received: by 2002:a05:622a:c06:b0:516:eaf9:f6f1 with SMTP id
 d75a77b69052e-51c4c1f62bbmr9931011cf.13.1783101958598; 
 Fri, 03 Jul 2026 11:05:58 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([189.79.21.40])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-51c41d2d688sm22560081cf.17.2026.07.03.11.05.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jul 2026 11:05:58 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH v4 05/24] target/riscv/machine.c: do not migrate pmp state
 with kvm
Date: Fri,  3 Jul 2026 15:05:17 -0300
Message-ID: <20260703180538.3346781-6-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260703180538.3346781-1-daniel.barboza@oss.qualcomm.com>
References: <20260703180538.3346781-1-daniel.barboza@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: T3HkarRpsCyM9HbpyRRgS531HW2_XM81
X-Proofpoint-ORIG-GUID: T3HkarRpsCyM9HbpyRRgS531HW2_XM81
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDE4MSBTYWx0ZWRfXymBxxaNIU6/z
 g9kjBUYnOi5YrsEI8+YLvlY56kzuOnu3OgA0OrQlbqJqPBI0dOntW9oxnlAdoj63nCd6FfB3raZ
 H89yqpl+KwVRt3jMObch4L/hg0zfWik=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDE4MSBTYWx0ZWRfX2zVrKZZ8BKpa
 F6k4V2RafY5N9k/Hd/5LM/LJlCPSM8wDvFLkA1W8vPzi3BuOq519ij+B9cjPLafOFMGsyneAFR4
 dLa5b4e4NBUOxl/XIQ/Va1vzW5WmG7h0ZDYxnw4eJRtpzbyVkVGkAPr4gkp99GTgN0scm4hzB/m
 W+dhZesHRRrJtl65yxyzYv/mHfQ40ThP/otTN3UIAmwsKCY6O4/jSfgPALXgFq2UXBcgbH4jYoU
 lKoEMSf1+ReR6mrEVCm/yXcLdZBkOhDicw0MMaMuVzzuIeBwlIzUPnu9jyYHXmzyvk0ZWQLXnK+
 OU6wP2wvhSYof1vzVXMG5xcQ4yeE3FTDWAe0EXUKVS4VHLmdoOmcpSPPbWcB5vguphnlmY9IHtO
 bWCmqzg48v9U8mUtdJCw1hE9jVKzyCfqA5gZPW7xDCV4YXEFsRmKfgcaDeW9MLAJcCsPb/Vd6+H
 ig9d+C7H9azLT/OcMbQ==
X-Authority-Analysis: v=2.4 cv=OaKoyBTY c=1 sm=1 tr=0 ts=6a47fa08 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=sHJf4AwOIoU3qjeHFPlg6Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=2BT_W6hdZ_SFZ63FK7AA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_03,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 spamscore=0 phishscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607030181
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=daniel.barboza@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
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

The PMP emulation isn't present in the KVM driver.

Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 target/riscv/machine.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/target/riscv/machine.c b/target/riscv/machine.c
index ba96ceceef..ef0a8eae24 100644
--- a/target/riscv/machine.c
+++ b/target/riscv/machine.c
@@ -20,6 +20,7 @@
 #include "cpu.h"
 #include "qemu/error-report.h"
 #include "system/kvm.h"
+#include "system/tcg.h"
 #include "migration/cpu.h"
 #include "exec/icount.h"
 #include "target/riscv/debug.h"
@@ -29,21 +30,25 @@ static bool pmp_needed(void *opaque)
 {
     RISCVCPU *cpu = opaque;
 
-    return cpu->cfg.pmp;
+    if (kvm_enabled()) {
+        return false;
+    }
+
+    return tcg_enabled() && cpu->cfg.pmp;
 }
 
 static int pmp_post_load(void *opaque, int version_id)
 {
+#ifdef CONFIG_TCG
     RISCVCPU *cpu = opaque;
     CPURISCVState *env = &cpu->env;
-    int i;
     uint8_t pmp_regions = riscv_cpu_cfg(env)->pmp_regions;
 
-    for (i = 0; i < pmp_regions; i++) {
+    for (int i = 0; i < pmp_regions; i++) {
         pmp_update_rule_addr(env, i);
     }
     pmp_update_rule_nums(env);
-
+#endif
     return 0;
 }
 
-- 
2.43.0


