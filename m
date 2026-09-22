Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F198C982FA
	for <qemu-riscv@archiver.kernel.org>; Tue, 22 Sep 2026 16:52:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x93jW-0005uV-SG; Tue, 22 Sep 2026 12:52:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x93hn-0004N3-6o
 for qemu-riscv@nongnu.org; Tue, 22 Sep 2026 12:50:58 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x93hk-0002W2-F7
 for qemu-riscv@nongnu.org; Tue, 22 Sep 2026 12:50:54 -0400
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68MG5psT884492
 for <qemu-riscv@nongnu.org>; Tue, 22 Sep 2026 16:50:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 VWAPWAp+zhiL5Viz57fv4ZOSFOIrqkMoe1JjS/wZSI4=; b=P2WOBmfCgtkoa4gk
 AqiUrXvrD0z9QPbOpyMdMlGZeeEp2kGxb9Ey0Nt7/KIUc+RuohOgqlidnx59f92Y
 bc09Mgc2ggtTXy7Lhz8XYH4+/1MexSuoltYYzFZGLmET02X5i4Vkn3M/nK50MORs
 wluMJN/e0+/290Y7Fj8Eu8pow0LqfKmfBHaq2NuN0AZ0ZMDP2JcWVSkv/tYIEPW5
 Q6OpTjdyKb/xFyQJI/muGdsLr16hCBmcW4HK9/kT+0jb2iYULX1YfwN1P835Z0kg
 D7zK2HOE5g88tMYLz427Nt+U4qxrpA/baVWUSGoHYx7f62PaxHHcbf0scYBGx79z
 TrQa/Q==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com
 [209.85.221.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guvw7g6s4-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Tue, 22 Sep 2026 16:50:39 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id
 71dfb90a1353d-5c8487ce333so79169e0c.1
 for <qemu-riscv@nongnu.org>; Tue, 22 Sep 2026 09:50:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1790095839; x=1790700639; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=VWAPWAp+zhiL5Viz57fv4ZOSFOIrqkMoe1JjS/wZSI4=;
 b=QUaUBKBWifXgJ890RNU0RB3odaB9HrfQvFwv2OvvGn9ghY6yyTbcxjEN7kGOxCjPaq
 6ixyTQBkfUr7gzE4Ruywyllbzl44PRgTt/2tqTuQOHc52+/gr9cmm1NK67ML7lKuMWig
 gXj4pnKAnCoWXV02XA42/MVPRyf9xc+1/ElBTc3cw91Te5zLFBUonKJW2+/Q8lAj2u18
 FoSlAXHkvkLyABHKP8uuErULCVjWbjOmgTWz8rdFWOjo5Eb0dXVoBRg2dtCoUWwVq3Z0
 jwljf9u7QsjP2pXb4Urcx5tmN5COg63pG35ws8SFOrfMLm9ymAD7G54UnFK5mMqOJsta
 e7gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790095839; x=1790700639;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=VWAPWAp+zhiL5Viz57fv4ZOSFOIrqkMoe1JjS/wZSI4=;
 b=HO69cpAEaFdN9FTwIkFA6oVTYX8t0Kt3LZX768tXlZ38WGdkm0VA7Nx7nx+w7DHFQy
 gVCs7V1F5IMqV1zWjw0yqAGlZzvxoT66P1HSeTUHzhaSHwXnxvr+vb3QerL33TFTrGFg
 kAA8/4JsDXpJ7JuBctsYd+oz/U/Er7dUlavqOp0An2WxqXk3Anre2Xhs73tGSOctbzy7
 1PWrne1DOMNnhltNn4QO0hGrJkme3/UIxMR9Ae328c8kaymCsTPPJbdHQnzUqHY5QOZ7
 dmgWUCyarUc8v0zyGX+JawAoLOXGaEJ2ePTTDZISsoigjD8lNaXoQRhZwdJfBno1WjDi
 I4xA==
X-Gm-Message-State: AFuF++msjinvtQsca0ZmVaq81njZr3hbGndIfwr1wtuUK6xgn9KwPVz+
 ljlQJ+3vJ9s5vnqoTH22oVQNgp1QGcGT4zHXO5Juy0izUW5XTeTypkq7Si9oq9UzjrCgI/CYvAk
 UbClHMswsJnWxn+T5SvQwgXSarMMIXId+YQKzrqjE9gqg3DTWRf8amCLAIw==
X-Gm-Gg: AYBFou2i+NUii18Qn0cA/e8/phWdb8TpXW4t0hVzIkXzzODYkfpWvCe4e14W725qEHf
 eZM9NZC5XbKLfCpQIXyzZAH/gaJQ3HfchugTC+mYnIzwlsrktZm71lDhRMfuB0+FjDcEnhu6Evo
 RBh2lY6kEGGogjVpf8Sufwjj7lwGhMfFYY2BcaRnJPlXfMZxnESlfpqIR/m5YQwztgQ4ElHb4xl
 BgkX3GwZA1jHuXSg1i5H3/kLQsBrMZ84KFwixyiiw4SPm7UPIEOxLDpNqFw3TnPaoZ6/Gyk9WKk
 YlTdmDLrK9WbfMj2b0pdKAtcfMuSW0ypbHL0aanxdGb7t9XKQzLJEkYMnmzPpehKAe5OoY4khyo
 9KM9/KXVZGQ0ON/gkC1ajlQb5k+dGsRDF9Zn3t1wf
X-Received: by 2002:a05:6122:1d08:b0:5bf:b3a0:388c with SMTP id
 71dfb90a1353d-5c9f15a1910mr164139e0c.6.1790095838965; 
 Tue, 22 Sep 2026 09:50:38 -0700 (PDT)
X-Received: by 2002:a05:6122:1d08:b0:5bf:b3a0:388c with SMTP id
 71dfb90a1353d-5c9f15a1910mr164091e0c.6.1790095838531; 
 Tue, 22 Sep 2026 09:50:38 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-488627314d2sm6503348f8f.2.2026.09.22.09.50.37
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 22 Sep 2026 09:50:37 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 qemu-arm@nongnu.org
Subject: [PATCH v2 08/17] target/arm: Access PSCI state atomically
Date: Tue, 22 Sep 2026 18:49:26 +0200
Message-ID: <20260922164936.15189-9-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260922164936.15189-1-philmd@oss.qualcomm.com>
References: <20260922164936.15189-1-philmd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDI0NiBTYWx0ZWRfXyB5lbgOGcpej
 n+86ecm5fBvwxyOZ9M7DskvoJWVCPjq3zS96SdC1A4UMJBoZRJ2H/jhan3gFMxLAFEgGm5JzHBz
 HwMyQBQXhk3TsM7AhsM9SF9jLiqI7jI=
X-Authority-Analysis: v=2.4 cv=ZYqIpcVA c=1 sm=1 tr=0 ts=6ab2b1df cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=MMc1H2EL_fK9NYWBrJgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-ORIG-GUID: gluRB3G8rDu3W3L-xQ8fU8jVYOazyTkD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDI0NiBTYWx0ZWRfX5ONk5AcmpQqC
 sz/PZ9AFqsh+CAzo8O/pdSskUuQKtqAQ6fM9XFbA514CFJc4DZ9x8usZq53fNgw3jlIo51pQLvo
 EH3FDdVpHrB/OkPZgalGWrJJTCBcxXr/J08Bg2HEgYUKbgN/P4i/qL5EI3p48uR5++drOzT0K0l
 0qVMsOmCeguVqLjd+P0qrSbpdho8OP1VeTE7PH8F0z3A8JjggbT2Cet4T8rwS9mMC0CO0ZnzxKX
 U3Kw9hYw/wMykifRHG2KqRFVdVro2I/UNPHPNAoqXUvlHqapVXG41mHRPSgf/JvCsWLowHQLqZT
 3JmPlRRSETfYzxv4SoOMubR+KJI6ccu0o/ZAtKZBRMoeKk2Ay/VWK0F1Ekl1NdzYrEX/siuNOvK
 0uQ7OLwkgbt4ZfQGA79fa+egPYJfWDulmB4n6l7/BO4gpo4eQrXktLy2t0skn+Iepwx5gnT86Xz
 pSoHVvHXJ+dTc5RcCRQ==
X-Proofpoint-GUID: gluRB3G8rDu3W3L-xQ8fU8jVYOazyTkD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 malwarescore=0 spamscore=0 impostorscore=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015 adultscore=0
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

Use qatomic_set() when updating ARMCPU::power_state and
CPUARMState::halt_reason. Read ARMCPU::power_state atomically in
arm_cpu_has_work(), which can run without the BQL held.

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 target/arm/arm-powerctl.c | 5 +++--
 target/arm/cpu.c          | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/target/arm/arm-powerctl.c b/target/arm/arm-powerctl.c
index 1bd8a549cc9..fcac26d9190 100644
--- a/target/arm/arm-powerctl.c
+++ b/target/arm/arm-powerctl.c
@@ -50,8 +50,9 @@ void arm_set_cpu_power_state(ARMCPU *cpu, ARMPSCIState state)
     CPUARMState *env = &cpu->env;
     CPUState *cs = CPU(cpu);
 
-    cpu->power_state = state;
-    env->halt_reason = state == PSCI_OFF ? HALT_PSCI : NOT_HALTED;
+    qatomic_set(&cpu->power_state, state);
+    qatomic_set(&env->halt_reason, state == PSCI_OFF ? HALT_PSCI
+                                                     : NOT_HALTED);
 
     if (!qemu_cpu_is_self(cs)) {
         qemu_cpu_kick(cs);
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 76aa47ac503..5cfd3bcfc8e 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -149,7 +149,7 @@ static bool arm_cpu_has_work(CPUState *cs)
      * Only another PSCI call can wake the CPU up in which case the
      * power_state would be set by arm_set_cpu_on_and_reset_async_work()
      */
-    if (cpu->power_state == PSCI_OFF) {
+    if (qatomic_read(&cpu->power_state) == PSCI_OFF) {
         g_assert(cpu->env.halt_reason == HALT_PSCI);
         return false;
     }
-- 
2.53.0


