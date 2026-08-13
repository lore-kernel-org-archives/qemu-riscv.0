Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 346B3C5B572
	for <qemu-riscv@archiver.kernel.org>; Thu, 13 Aug 2026 18:21:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wua13-0003pe-LQ; Thu, 13 Aug 2026 14:18:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wua0V-0002uw-Lw
 for qemu-riscv@nongnu.org; Thu, 13 Aug 2026 14:18:27 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wua0N-0002E1-Ui
 for qemu-riscv@nongnu.org; Thu, 13 Aug 2026 14:18:17 -0400
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67DGDvvI2916957
 for <qemu-riscv@nongnu.org>; Thu, 13 Aug 2026 18:18:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 MsVnRq6tTlLn6rJyDkFaPR9BDkcmhfUBFcym5esfn2o=; b=c97tR2ddpDb5+1FW
 RxPrsNF3AsjCNIfxMfYWE2Pwq/0+hiX/05ArbaOF1Ahk8675cJspq3vwy04hO+Tp
 sHYj6jnHEzSGfZLJWwk52EImY6corNunFtH5s33gbvkXovncmGLdHbTzozMLWWKE
 EJAUGzWAEBOI158QPMv9xejpkJPxVWN8ny/4w5jm4FQ726rVkWwGV8p1A9NVmqi/
 Lo8RyntVD8836HcC0Sc7teFsit88wsju9TR+3Iz/sMfJgwBTsr7/7pi6+TydxoXk
 2GB5DXcRgVPXvzB7ch18uRhGcNn/0Qg/eVMCRHr0N/fRTQSVlwYiXIxL2U/kRky7
 QdN9gg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g1h90rj9b-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 13 Aug 2026 18:18:05 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-92e63df032bso119014685a.0
 for <qemu-riscv@nongnu.org>; Thu, 13 Aug 2026 11:18:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1786645084; x=1787249884; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=MsVnRq6tTlLn6rJyDkFaPR9BDkcmhfUBFcym5esfn2o=;
 b=ehixXi0JUQtigCh8j8JdVEGRtlHbBCGAVKXYVDmgabL/hdtmpbtqjXqC9aTK4gN2IR
 sedJkLtrUXQ+yLMa08BTlp7I7eFRHwyFactDUHH5QSguF/YKV9NlSh6DaZj8jIvswM5q
 NwucXHjMg4xvDOfGVVDD0yPrKG51sfJLH9x5+c2p8Ub0aKyICAM/pORxnCYgGIMailoK
 Q1ImdSMBwDRXGelPwUfW54q+Oda+WMTRXz8YIthCaAeKmgR1TutgcACIUZbRAR8N33Lh
 ihRK3gkYPgdTKXqeZ9oZ6lFMje7NnIMExPOv09+BatvXW/I24PVHP7yp1omiEEOnNFtW
 i/1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786645084; x=1787249884;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=MsVnRq6tTlLn6rJyDkFaPR9BDkcmhfUBFcym5esfn2o=;
 b=kr7bWiHBffMfYoL4EI55p+f4JEqENI3JnaqMogtH06uL2ygNQxJ2N1U2lO9v2qxRok
 pEcNcB+WI5bC91nE65WdHBnq8DDVBVLKSv8MgtDVVxwzOFJySh/mYjTo/6H01783JT4k
 HcsaiuzmzMDHvtYuqcsgcEnatyFm6i3BULBL15vrUjCRTDu+PH6KWVZ/kjQBjMXHwq5H
 3lch0xSqAjSzf36VATFbIz/HYk//gZatCgnNqbuIVSR5HnA5g3ND+ZUHycnjMrN04HNk
 7RPuODKjE9L0w3lplUYGNdPRWJvR10AyqTbTRdU9Uwo19JtCzWaPd7sU6JnqnVc5eFfC
 ym/Q==
X-Forwarded-Encrypted: i=1;
 AHgh+RoauCiuTbhDwgFfy5YIjO/B1s7shfLqmsHzOM1zoHOLJexHKnM/0sooXTTBLpHepNScI9WOSznIev8f@nongnu.org
X-Gm-Message-State: AOJu0YzCZB+9v1k7Lgv5x/Y3eyiYa7WmFiQ3kb8NMxyiZOgFCI9D4Rah
 PkAr8eVmSkFcy7Exe4zuO1ffCUipiMdQPoPyD24hX5IQr8LUfhsJwsHDYsT5/P/h5fVX2urD+Kn
 6khyNCD/1gmdWl5HxS34bW7pYYIP6g/f3Hj4hr8wUrMMLZHQUjRtvj6Lu0A==
X-Gm-Gg: AR+sD133Pzoa1NzVHQRev0QBeLtnPTvoCcx995hzfD9k7ZSjB12OxAbjgN7Wjh5MyGt
 J2DXUGXaNNVn6NMIhVA8xeLN5QrRDXauIIn4ZHRr+sPGs+Wi7PT81hUkCqeah3OkYqgfiWqcvHb
 ASR9qVfI/smP3dL2lr+eCXquqNdUyiAUhFRgqGGLpwDxHo8pBHTkQQtthyyShlE5jZmUREXLKF4
 0ydH0K2NaTYrGHS4mvK4rtFSaywFwKk1IXQAAQFKCBGzh14gc5Xzc/LY57RlYVOTqkR88rIROGh
 LVU+GUlaVSjtAffaHbbLfINQhM05pp+z8rfvAoQEvdzsqVP+TrZtHfvtSZjnRRS+WeYeu9J/a7L
 4JduXDBJth+VKR5LqLbDsQqDC/P4HZljAHLY6wVOC2w==
X-Received: by 2002:ac8:594d:0:b0:51c:1f35:4638 with SMTP id
 d75a77b69052e-52d74ba523bmr65865121cf.21.1786645084292; 
 Thu, 13 Aug 2026 11:18:04 -0700 (PDT)
X-Received: by 2002:ac8:594d:0:b0:51c:1f35:4638 with SMTP id
 d75a77b69052e-52d74ba523bmr65864691cf.21.1786645083884; 
 Thu, 13 Aug 2026 11:18:03 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4815f2b1d9bsm1099831f8f.24.2026.08.13.11.18.02
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 13 Aug 2026 11:18:03 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 Alexander Graf <agraf@csgraf.de>, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org, kvm@vger.kernel.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Magnus Kulke <magnuskulke@linux.microsoft.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>
Subject: [PATCH 11/16] accel/kvm: Consistently return CPU halt state from
 process_async_events
Date: Thu, 13 Aug 2026 20:16:34 +0200
Message-ID: <20260813181640.6537-12-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260813181640.6537-1-philmd@oss.qualcomm.com>
References: <20260813181640.6537-1-philmd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Ovh/DS/t c=1 sm=1 tr=0 ts=6a7e0a5d cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=GGjvRDhnLmMstqdV9EAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=O8hF6Hzn-FEA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEzMDEzMiBTYWx0ZWRfX1CwpV8DZLVU6
 Hb6bTrWj44CIPdMQIModhsB9FUQihCXqf8/WowU7BVgPOKVckwPzQIFs9Y57dmLijIO3yYBOlSa
 V9qZQED6kY0bppN7kArU1bDS3vUbQWo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEzMDEzMiBTYWx0ZWRfX8Be/F4lZWaFt
 2wKqmbzHJj1bM2LdZLl9vKDdqXdo5uTPbl/QCup4QJXIvkisGiLSvryRyd+j9KWEyrKkjIF28+U
 F5M7uDXAbYi/PBRfCxEmPLP9ZJrdgLokQ/itsIovcwuy5c5Jkj3R8K6Opysgou4VZwoBYbQNRKJ
 W+0UzmhGpsaQw479A4jqDA5KIWOFspa9d7iToHJIbG9ztwKszVewG43xKbJH6idGTLBo+9jkDNc
 pbxgSPQumVAm8XbV9VGtctLHann2L8r9O0XpIYHVAx3fAZZrXCQwWkJu1QPYtckmOiJG5APKxUF
 JN+wRjbU6PztpXivkOVrd5JVhwKbq87ft2vDrDKKvecIaGP3VbSM7orJYlM0Q9Yju73lWuBYAUS
 4prulB8UVvyu+I6pQaAZx01Ipv23sIewLfsj4dCgNBYSWPJw9ySTgHH9OlLvevfjyqH7QJ0ruiZ
 XDNgAni+3z3ghOwV5SQ==
X-Proofpoint-ORIG-GUID: glvhvOvgmefeVlc1FESu-Sy_Zv6xT5dK
X-Proofpoint-GUID: glvhvOvgmefeVlc1FESu-Sy_Zv6xT5dK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-13_05,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 priorityscore=1501 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608130132
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

When comparing the KVM implementations, RISCV and ARM differ
from S390x / PPC and LoongArch. The caller expects a non-zero
value to return pausing execution with the EXCP_HLT exception:

  3427 int kvm_cpu_exec(CPUState *cpu)
  3428 {
  ...
  3434     if (kvm_arch_process_async_events(cpu)) {
  3435         return EXCP_HLT;
  3436     }
  3437
  3438     bql_unlock();
  3439     cpu_exec_start(cpu);
  3440
  3441     /* Inner vCPU loop */
  3442     do {
  ...

Change ARM and RISC-V to return cs->halted for consistent behavior.

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 target/arm/kvm.c           | 2 +-
 target/riscv/kvm/kvm-cpu.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index d40a6a98591..5caabfab63f 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -1575,7 +1575,7 @@ bool kvm_arch_stop_on_emulation_error(CPUState *cs)
 
 int kvm_arch_process_async_events(CPUState *cs)
 {
-    return 0;
+    return cs->halted;
 }
 
 /**
diff --git a/target/riscv/kvm/kvm-cpu.c b/target/riscv/kvm/kvm-cpu.c
index 97069bf597a..1a61cd5ef37 100644
--- a/target/riscv/kvm/kvm-cpu.c
+++ b/target/riscv/kvm/kvm-cpu.c
@@ -1568,7 +1568,7 @@ int kvm_arch_irqchip_create(KVMState *s)
 
 int kvm_arch_process_async_events(CPUState *cs)
 {
-    return 0;
+    return cs->halted;
 }
 
 void kvm_arch_pre_run(CPUState *cs, struct kvm_run *run)
-- 
2.53.0


