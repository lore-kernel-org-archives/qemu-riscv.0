Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 006A5C5DF86
	for <qemu-riscv@archiver.kernel.org>; Thu, 20 Aug 2026 20:16:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wx9Ag-0006Wr-FM; Thu, 20 Aug 2026 16:15:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wx9AV-0006CI-4F
 for qemu-riscv@nongnu.org; Thu, 20 Aug 2026 16:15:21 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wx9AS-0002bE-KL
 for qemu-riscv@nongnu.org; Thu, 20 Aug 2026 16:15:18 -0400
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67KK7YaD4012721
 for <qemu-riscv@nongnu.org>; Thu, 20 Aug 2026 20:15:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 fvBIYCS8kU8+XY5bs75QoBPYP88ZzMJVKYNZ4wSfBZ8=; b=hY/rB6grrmx4wRar
 B+Sby5VNJQNkBuZINlF4EO0c2AqLI4mozZbwmNKUUDJgdGxcd3zOXcvwu8B6qZzU
 ldzMKhfnvuGWZGu13xbLlw24TWoDUdS0WsKL3+fw7PPohpJ0hM2vGNRTdJtmjHhn
 J3exhm94935as1kee+TSN+/Dr80N3KgA7UVCHFBVcZXult4c+ohHcpFb7ni4NXrb
 HVa3Xxxppxjs67BkU+/DR5cq8EifLIK4op0xODiYIGwCrXC6Jg/+BKoUP7q9mRgH
 fs4Duu5A5MY9eEIgmmyOVIhC6KTmgg6Pez79vZOZsrDFsQuhhH+Pyr8YJ9m/GgKS
 fu++Yg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5x29k5kt-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 20 Aug 2026 20:15:05 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-51bfe3fa93bso2392651cf.2
 for <qemu-riscv@nongnu.org>; Thu, 20 Aug 2026 13:15:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787256904; x=1787861704; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=fvBIYCS8kU8+XY5bs75QoBPYP88ZzMJVKYNZ4wSfBZ8=;
 b=Z0ippduv0AcAaRKQpdA4JYN3d245meH2U4BqkGDqfLhJgpQ11yynlSUu62NjarprRc
 S6fRQncuS+9KwdQpf26FeBzlt5e/kH926/yP3uWa7dYE1+JMllV1QTzUklgn2CX2ELpF
 hsGYtbGgrq9lostMnKl/Rs+/UB+2cMzLPlaIyAgyzE6pYXYE4c1NgEGEl+kcYu/sixH9
 bXIl1hr++DZcH5eyv5HB4xLGV2ZkIHPuMTLVrJ4kHmxcLQP2b6JlB7Ys1GQ0Ih25uSkf
 CTYNvthwJPxlI+7JWgIBTPSg0NHuOG5pnozWEfr03JRpSUQUGb+ndNUeSJCFSUIROV0e
 pEgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787256904; x=1787861704;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=fvBIYCS8kU8+XY5bs75QoBPYP88ZzMJVKYNZ4wSfBZ8=;
 b=rOZk36fn3ev3wLCsKZfZfO013prP59Zhg35hvQgFUbmR9pSlnaJq0VfM/hnJA4p1BZ
 BDE2XAabb8rgg803QuBcv8EIQnc8aPjeYapyvBQsqo53F4jdpgWXpMlaiRlVaY2Ab7f4
 qCjI2z8QafX8SIaM8XqV1E9XCvJJa1zTnlbzP1q+MPdwNQLWQ5auS0AQVMkmVBK/zqps
 JrSn7nP9nATRRYTg3nRUw7+BXykKKCPZd6Tdhbh4x9xSRaWpph0OONFPo7jMfJEL4SIX
 yQDgc8ZfH8khzsG1tyRYG2tdSLMX4x1ejGm94YgbNFlPp9EFM6ksIH1MVAGC2muBCYht
 2Y3w==
X-Gm-Message-State: AOJu0YzB0tWSfQc0sUDyGsv9CCyiIzA58M005QDz8Rn2gV8qLFjXs65K
 /Y7gzMlKE1Dpw4ZVmTA8C+SYyzdFOiEoOj8znAkPuMnjs3FajNBacc0d/J7w88CCsMbCEPq4ywY
 lvSG+wHerhmW5mLA07RBHd6AH707Bpg1U+k68B2XmvVoc+ZPSQx6JaNYRlw==
X-Gm-Gg: AR+sD11dMPHMn69wavocdaTRqNyhIpbd8V5En5qAB7G7jacF7CSTRSu/crTS5Nd3lZd
 sCilAXW0v+yGkldHr1dvnwMGCbwrc1hJx/spMxfCCo0KaElbdNymjw/B82liDgnHfiM6Z8hYEM/
 Uc00RQ+iH6KuLgyBmeIRHin5095x2EZA174EjjMqba7HXO9JztYjld5t0l8BUILdf8VVk04I2G8
 Hlqc8dovxJXRkouqn8ZrQe6tL1WXItwwREKIIb2McaOPwWIyTR/Wf1MjGKat5uVKAaun0DXI3ZU
 wrQlG5d+pSKoj4V4ZgqW6GKBDSeqVNghE6yqbXAv86KaF00OIcIncKzDwRR87fiUKA9psQQQ0mu
 ODjQ9DOVHJECXg2np2WSDS1Ybmu1MDCg3ZW/gW8JeDQ==
X-Received: by 2002:a05:622a:4cc7:b0:52d:8743:bc83 with SMTP id
 d75a77b69052e-52df5a4041amr10547681cf.34.1787256903354; 
 Thu, 20 Aug 2026 13:15:03 -0700 (PDT)
X-Received: by 2002:a05:622a:4cc7:b0:52d:8743:bc83 with SMTP id
 d75a77b69052e-52df5a4041amr10547121cf.34.1787256902918; 
 Thu, 20 Aug 2026 13:15:02 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-499b98e765dsm108725e9.3.2026.08.20.13.15.00
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 20 Aug 2026 13:15:02 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-s390x@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Eric Farman <farman@linux.ibm.com>, David Hildenbrand <david@kernel.org>,
 Cornelia Huck <cohuck@redhat.com>, Matthew Rosato <mjrosato@linux.ibm.com>
Subject: [PATCH v2 08/15] target/s390x: Constify S390CPU for cpu_has_*()
 getters
Date: Thu, 20 Aug 2026 22:13:48 +0200
Message-ID: <20260820201356.29775-9-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260820201356.29775-1-philmd@oss.qualcomm.com>
References: <20260820201356.29775-1-philmd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: oqjgyWWi9ebdr7GM8-WJ0KiThGa0nkBM
X-Authority-Analysis: v=2.4 cv=V8BNF+ni c=1 sm=1 tr=0 ts=6a876049 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=VnNF1IyMAAAA:8 a=20KFwNOVAAAA:8 a=mU8mmpTTODwToQi1tsoA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDE1MiBTYWx0ZWRfX6loRpK8Wt8D1
 nfg4WhEHaQi0MP01gJ2D2umqcGc+fFGMjCeLTwRarmSNiTGcEPg/6AtyeyCkFoH9oOsJvcHN4Ec
 W/Exis5/H8pR7H269u0Q4OmHyRMkmwyvV9R/aQY6JV2/2oimO9EKZBOkPDu7k4yotZPwj032P9G
 DpW+Y6LQ258z5ZxaXaRXgo8OGauuBVXSKYczvwFgSuR3zz7ODxOL6tavI6XnnhpOz3JrKMre9OC
 bwT6maw8vAeqe9atYW6c5/V9UKX6okP55z/lgNaoGr9DiDTb4bXIkVdPo5rGmnkU2yKfrNN8M/u
 So93aDEUmhOJXbAsPBUUS5ObYHVkKRHm1VEEGzcNsAoxzbd0amCVTLR9UsK2pg0GRm1sw7//lVV
 hJuhhcJTlA+yZJIpp14vzV5uiKzrG2qI9syTGUvw4T1d8V4j2HBp8AwFEZutCEwOVVoqg/X1NOG
 LQbZkaOnamH/zQxPsTw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDE1MiBTYWx0ZWRfX3PZL2Xzb5Dxa
 K1pSi1QGrKUIFPHWj64rCycRuDapKEgJhH9FkTlkqYES5BfNrq+bjN+nbpe6JyR+McyU4rMWOk5
 AhmKKwG/V3oeQ/sS31V19euHe8inkGY=
X-Proofpoint-GUID: oqjgyWWi9ebdr7GM8-WJ0KiThGa0nkBM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-20_02,2026-08-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 clxscore=1015 bulkscore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608200152
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

Add the const qualifier to S390CPU when the argument
is accessed without modification.

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Reviewed-by: Ilya Leoshkevich <iii@linux.ibm.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Acked-by: Eric Farman <farman@linux.ibm.com>
---
 target/s390x/cpu.h            |  2 +-
 target/s390x/s390x-internal.h | 12 ++++++------
 target/s390x/interrupt.c      | 22 +++++++++++-----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/target/s390x/cpu.h b/target/s390x/cpu.h
index f55b79ef8ac..998bbb0d7ff 100644
--- a/target/s390x/cpu.h
+++ b/target/s390x/cpu.h
@@ -854,7 +854,7 @@ static inline unsigned int s390_cpu_set_state(uint8_t cpu_state, S390CPU *cpu)
     return 0;
 }
 #endif /* CONFIG_USER_ONLY */
-static inline uint8_t s390_cpu_get_state(S390CPU *cpu)
+static inline uint8_t s390_cpu_get_state(const S390CPU *cpu)
 {
     return cpu->env.cpu_state;
 }
diff --git a/target/s390x/s390x-internal.h b/target/s390x/s390x-internal.h
index 50782fac3ce..ca4445e6474 100644
--- a/target/s390x/s390x-internal.h
+++ b/target/s390x/s390x-internal.h
@@ -333,12 +333,12 @@ void cpu_inject_clock_comparator(S390CPU *cpu);
 void cpu_inject_cpu_timer(S390CPU *cpu);
 void cpu_inject_emergency_signal(S390CPU *cpu, uint16_t src_cpu_addr);
 int cpu_inject_external_call(S390CPU *cpu, uint16_t src_cpu_addr);
-bool s390_cpu_has_io_int(S390CPU *cpu);
-bool s390_cpu_has_ext_int(S390CPU *cpu);
-bool s390_cpu_has_mcck_int(S390CPU *cpu);
-bool s390_cpu_has_int(S390CPU *cpu);
-bool s390_cpu_has_restart_int(S390CPU *cpu);
-bool s390_cpu_has_stop_int(S390CPU *cpu);
+bool s390_cpu_has_io_int(const S390CPU *cpu);
+bool s390_cpu_has_ext_int(const S390CPU *cpu);
+bool s390_cpu_has_mcck_int(const S390CPU *cpu);
+bool s390_cpu_has_int(const S390CPU *cpu);
+bool s390_cpu_has_restart_int(const S390CPU *cpu);
+bool s390_cpu_has_stop_int(const S390CPU *cpu);
 void cpu_inject_restart(S390CPU *cpu);
 void cpu_inject_stop(S390CPU *cpu);
 #endif /* CONFIG_USER_ONLY */
diff --git a/target/s390x/interrupt.c b/target/s390x/interrupt.c
index 1dca835c5d8..d7e3fd45e4b 100644
--- a/target/s390x/interrupt.c
+++ b/target/s390x/interrupt.c
@@ -139,10 +139,10 @@ void s390_crw_mchk(void)
     fsc->inject_crw_mchk(fs);
 }
 
-bool s390_cpu_has_mcck_int(S390CPU *cpu)
+bool s390_cpu_has_mcck_int(const S390CPU *cpu)
 {
     QEMUS390FLICState *flic = s390_get_qemu_flic(s390_get_flic());
-    CPUS390XState *env = &cpu->env;
+    const CPUS390XState *env = &cpu->env;
 
     if (!(env->psw.mask & PSW_MASK_MCHECK)) {
         return false;
@@ -157,10 +157,10 @@ bool s390_cpu_has_mcck_int(S390CPU *cpu)
     return false;
 }
 
-bool s390_cpu_has_ext_int(S390CPU *cpu)
+bool s390_cpu_has_ext_int(const S390CPU *cpu)
 {
     QEMUS390FLICState *flic = s390_get_qemu_flic(s390_get_flic());
-    CPUS390XState *env = &cpu->env;
+    const CPUS390XState *env = &cpu->env;
 
     if (!(env->psw.mask & PSW_MASK_EXT)) {
         return false;
@@ -199,10 +199,10 @@ bool s390_cpu_has_ext_int(S390CPU *cpu)
     return false;
 }
 
-bool s390_cpu_has_io_int(S390CPU *cpu)
+bool s390_cpu_has_io_int(const S390CPU *cpu)
 {
     QEMUS390FLICState *flic = s390_get_qemu_flic(s390_get_flic());
-    CPUS390XState *env = &cpu->env;
+    const CPUS390XState *env = &cpu->env;
 
     if (!(env->psw.mask & PSW_MASK_IO)) {
         return false;
@@ -211,21 +211,21 @@ bool s390_cpu_has_io_int(S390CPU *cpu)
     return qemu_s390_flic_has_io(flic, env->cregs[6]);
 }
 
-bool s390_cpu_has_restart_int(S390CPU *cpu)
+bool s390_cpu_has_restart_int(const S390CPU *cpu)
 {
-    CPUS390XState *env = &cpu->env;
+    const CPUS390XState *env = &cpu->env;
 
     return env->pending_int & INTERRUPT_RESTART;
 }
 
-bool s390_cpu_has_stop_int(S390CPU *cpu)
+bool s390_cpu_has_stop_int(const S390CPU *cpu)
 {
-    CPUS390XState *env = &cpu->env;
+    const CPUS390XState *env = &cpu->env;
 
     return env->pending_int & INTERRUPT_STOP;
 }
 
-bool s390_cpu_has_int(S390CPU *cpu)
+bool s390_cpu_has_int(const S390CPU *cpu)
 {
     if (!tcg_enabled()) {
         return false;
-- 
2.53.0


