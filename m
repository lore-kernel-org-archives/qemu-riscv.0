Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D7D2C98302
	for <qemu-riscv@archiver.kernel.org>; Tue, 22 Sep 2026 16:53:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x93ib-0004tq-Qe; Tue, 22 Sep 2026 12:51:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x93hd-0004JS-JQ
 for qemu-riscv@nongnu.org; Tue, 22 Sep 2026 12:50:51 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x93hb-0002Ul-BA
 for qemu-riscv@nongnu.org; Tue, 22 Sep 2026 12:50:44 -0400
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68MEjdcO898354
 for <qemu-riscv@nongnu.org>; Tue, 22 Sep 2026 16:50:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 NVL8DScROpX5FRrNBTXD1YKsAIvozSDWDpA2JU39ztQ=; b=ZoOJBd0AGI1LqeNn
 1CaexlAOGlHxB8NI/0SWOnMkfuI6u0Kwu/4T4TFyofiBA1GNEhx0mFCufkcl0fT/
 DIY3j/jPh0G3m5OIqa3sJM3fLRAa0lcrkayWQsY615sRLgq/BOXabksd4s7iEF4p
 IKOm/JWEmYaM3qyRY9yBRRBoitsjjqfCcPaHDEHjGc8el7Ehwf3h/WIegAK0/+gV
 6AanJbP8ULz6aytXgiZX6goNktb7YsMjaMlVeEWtFc2/pYfJ6bOmqWSKohjGeKSe
 w1uF6WhTHlGLWr5IoftLZXFA4C0pc2wP0AjKqna6e6AH0AzSOYdq0GiDwCCGVdY+
 a5DaKg==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com
 [209.85.217.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gueybkvud-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Tue, 22 Sep 2026 16:50:32 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id
 ada2fe7eead31-78a5a291af3so5663137.0
 for <qemu-riscv@nongnu.org>; Tue, 22 Sep 2026 09:50:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1790095832; x=1790700632; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=NVL8DScROpX5FRrNBTXD1YKsAIvozSDWDpA2JU39ztQ=;
 b=DUvw/vVtBdQ2hmUHyZnhJ1Pt3dv2B1r45QNavY6ZkVMY7ewyhKewP6aZIlwotUjj6u
 fPVTQ4uyZxnt5IEi7pdpfA+l6P8O31N4kBqdOgAJ4MxiuDZww305h2fYRvK4k8OnKILd
 QE6Wn5n9MjN9rLX65ur1jrk8R5fdaVG2e3pEJgpzwFoo58Vt/tumQiRSSBJqO1/QOl4o
 UMGxpCFQlpLK/AHVCdvCkh/F7XJmZYMUIql6rAAl3DxUDeszuL+Aio2p1mi0V0yst/5F
 IhTH5IjKrTCaRimxpkeSHs+egbvfHdPCOrCpwvmzUPC2TAIUN7GS9uqLFAsjbx0OLgAt
 1Htg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790095832; x=1790700632;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=NVL8DScROpX5FRrNBTXD1YKsAIvozSDWDpA2JU39ztQ=;
 b=yVAHsZ3bHIokIVoK5WwQ/t6yCUqD+JNQn+HhKf6sW2xSN3Rm1QHhJlpL2hW0W5hgVm
 636nRLJ6Lv996AjjHEDTyxc+htEECkcS5dcYnP1SZQQeDNyNGV9Ke3XSyk3+y7AsoQ40
 bzBUkPtsyfq0CFNgpVk2kc94n3lHP7RoFN+8mU0m180A5QGX9bcd1Dm0Oi8YQ5+3/3FJ
 nqRT+hOIGjUHMMYNoFRE+dF3/V0EdRluLzwsE/Hrnb/EfxW+4+Otyh6DGuuues1w6h9d
 uwLnF4aBwWhGzKBwRc0zS46FnhNbva7UMLPxe5L2R7u/+CVeyv8humKnX7OcdaEG+Hl4
 8BtQ==
X-Gm-Message-State: AFuF++mhgTJJ9nyeGgtH/g3D/WV/w/yqdanq79Ega9hpd2iDW6e2DJPZ
 /aAFkkutnDzA2fyxB4VXV3kR+mjG0uGYqHD8Mf8fxMEsLMl95xgzElzw7X5vl45ONcegyXmCwyf
 V0YcSsN5Ya9fex9zUdyejHM/cFq57ctl8HiiZALDUj0dCSkpPI9rOAOGFMQ==
X-Gm-Gg: AYBFou0Vf/P568V+nzMQrtC7sskkfhdM9PMmX9vVzZQk1BsLU7JuNG8SWexW+R096Mt
 ZNZXQAMgiq32iSBy5e9caM2QnIhm1QqMAFxJkSs5biryGW8Fuc4k5T4r6aOCxpxm/6az+H+ar85
 Zwftr3Z+uojuiVpESRB7K7D57R/t7VBWW/vkz3I/3pmjET9FXtCypBgAWWeknT0jI8urqx9JEXZ
 JXsejqZC32db2UIzxcDREtCt7AQdvsT7gxVgiyWyANLvp+E/AKo4TCcjtUuRpxQUTHax5+6sjVf
 ZOWDw596M1L1ZtZx/+GwDHzFar4toThjHy1FbHLGUEFKPCLqVy05CF/clPmkK7aaM4Ys5dp8ICd
 uukA64d/odu+A5Crfh3CkezC985gjNU7qBiggPcrs
X-Received: by 2002:a05:6102:5f0c:b0:7a1:f7d2:e81b with SMTP id
 ada2fe7eead31-7a55d28bc28mr7904513137.20.1790095831698; 
 Tue, 22 Sep 2026 09:50:31 -0700 (PDT)
X-Received: by 2002:a05:6102:5f0c:b0:7a1:f7d2:e81b with SMTP id
 ada2fe7eead31-7a55d28bc28mr7904471137.20.1790095831349; 
 Tue, 22 Sep 2026 09:50:31 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fde199c21sm3642075e9.9.2026.09.22.09.50.30
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 22 Sep 2026 09:50:30 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 qemu-arm@nongnu.org
Subject: [PATCH v2 07/17] target/arm: Kick vCPU after updating PSCI power state
Date: Tue, 22 Sep 2026 18:49:25 +0200
Message-ID: <20260922164936.15189-8-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260922164936.15189-1-philmd@oss.qualcomm.com>
References: <20260922164936.15189-1-philmd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=bP6Ds/+Z c=1 sm=1 tr=0 ts=6ab2b1d8 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=ZUU6x_L2PbSNHYkWwXMA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-ORIG-GUID: dRjUVzxM5Fhjc3tRrNoY-spTOVQn6xjl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDI0NiBTYWx0ZWRfX0kmFaueP5NZr
 YcsKV2cWf2ilhjZX2m1PyeNk6cvJ1zsyOaiP8iF4/34OOmrjQ1wyz9iQ4BcG0YrVFrGlCJJSyTm
 cd1CQkFXFko7KB9YVkqzEoFFOOxi8pdUoox63PSJPOtBdbLUh/JP6Q5YwY8PZYRnNf7pkCG7FKE
 D8C1+jHvk/mlBEGTKhvShGMrzT0Tgt7X6n1FaYcustWIOawoPfJJL1RG/FQOZGmVkL9YZ+jpMai
 GRyU3FUh8s90EJfN/5xyZ0CYxOEb+K/7Ls6rP0dpq/N/vBgyY4gf9MaZ/OywZG2uSqcTPtkBw5q
 yvmET3t5WiP5mxdcLCLYBIAEDWekQW9zmVV98ElY/OhFxS61h4q2wV3Jmb0BXV0q82L2IPawSGr
 gOpY4/Bg3KBMBeqls/+cTNeglzaJ1nuF+GpUi4mSqrfGSEH9E4Xb7nBCvlaBUzFs0tTh/KeoeGo
 wfTJU5W36rm3QEES7pg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDI0NiBTYWx0ZWRfXzbcRm7izm+f5
 NN3jY+PoXZgt3sYBa7FlGncCODm/Vbrucxxtsd+kSEM1JxMTMsoi4viEYH73ePNUYUOylSp9GP9
 elWpfTyNu62l+9BoRwTUam6TDXtkZcQ=
X-Proofpoint-GUID: dRjUVzxM5Fhjc3tRrNoY-spTOVQn6xjl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 priorityscore=1501 spamscore=0 bulkscore=0
 suspectscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220246
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
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

PSCI can update the power state of a vCPU other than the caller.
Kick that vCPU after changing its state so it observes the update
promptly.

Reported-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 target/arm/arm-powerctl.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/target/arm/arm-powerctl.c b/target/arm/arm-powerctl.c
index 213e7ae056c..1bd8a549cc9 100644
--- a/target/arm/arm-powerctl.c
+++ b/target/arm/arm-powerctl.c
@@ -48,9 +48,14 @@ struct CpuOnInfo {
 void arm_set_cpu_power_state(ARMCPU *cpu, ARMPSCIState state)
 {
     CPUARMState *env = &cpu->env;
+    CPUState *cs = CPU(cpu);
 
     cpu->power_state = state;
     env->halt_reason = state == PSCI_OFF ? HALT_PSCI : NOT_HALTED;
+
+    if (!qemu_cpu_is_self(cs)) {
+        qemu_cpu_kick(cs);
+    }
 }
 
 static void arm_set_cpu_on_async_work(CPUState *target_cpu_state,
-- 
2.53.0


