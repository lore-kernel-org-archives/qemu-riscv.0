Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C64FC5DF88
	for <qemu-riscv@archiver.kernel.org>; Thu, 20 Aug 2026 10:48:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wx0JS-0008HT-6F; Thu, 20 Aug 2026 06:47:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wx0JO-0008FW-9P
 for qemu-riscv@nongnu.org; Thu, 20 Aug 2026 06:47:54 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wx0JK-0005ia-FI
 for qemu-riscv@nongnu.org; Thu, 20 Aug 2026 06:47:53 -0400
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67KA3FiI3454839
 for <qemu-riscv@nongnu.org>; Thu, 20 Aug 2026 10:47:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 WVunpjLVA0I0Wfv3sDB+jNp2S9PTkMt6jmB8Jx0E2VM=; b=FnE1RaEyf010Ymju
 xbECEk3N8Ui0bdVvrGirefr5jkvVwGb3Szg7OQvKGBtsVOcM5EHFoJAFOWIP/uLd
 S++R4GzHMLuQEPwBfj6CRmxggcIiFlFUM4FE5azTI3oNKobXaKv+zr6J7aJH0Sh4
 W2Rgw0AvGYzYmfflO3mX/2DfusOm/5o59AQ3SqSG9YKnKKAXGtAoaZCzpiBLGWd+
 ISYnQpE79Ivp+XAr6GqTrHk48LhfqxNL1rYBWiVR+HtlJetyvBrRHrAy9vg26v8m
 XGmJUqEznhyDpznuBH6BmhsAX8fl6MF5VJ7vwbWuxVr15fbRHNOeFm/Rf2sb3lGi
 a9cRZA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5yg885mu-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 20 Aug 2026 10:47:48 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-930a098ea19so315628785a.1
 for <qemu-riscv@nongnu.org>; Thu, 20 Aug 2026 03:47:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787222868; x=1787827668; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=WVunpjLVA0I0Wfv3sDB+jNp2S9PTkMt6jmB8Jx0E2VM=;
 b=IposVl0/fjEQBbTvqXPqUfMiAX5J12TKdG1OhT5UXRoDRh+O/rzAePyRnIoEi44WG3
 xCIyMksriC5WCPU9BZLNimNheMx9YFeTPRTXb3lIFk1NMCZK84X3gbBxQqZqqQkT/PN5
 uvQ1wqzz69YeJpjAmsU2ExO4/n2D4iqkY4699ZFlKb1QFc7CZ6ekG5VSDnOiGEqmRPJY
 KoA8Fr0BRel71Cw4dm3rxCl51ZB/6JXS/w8RvbDE0l5BGsQcAAgoETVgl9mXonJ2IfrB
 rBwYzvja+GjJtRsHbXJocMoH1urJeIpvvzdCyrRic5NlL0osMfBzUz97DNHqVtsyzgNm
 G0sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787222868; x=1787827668;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=WVunpjLVA0I0Wfv3sDB+jNp2S9PTkMt6jmB8Jx0E2VM=;
 b=bEbJerxnrh7Tll+ysYmO6uYeIGqW2Y/WefW4brcqkNVi7zmeahGUCTWROqrWSdfyHU
 MF1Ert0AFaUoiK7rPIlKJm/bM0W8d+G0/x0fgRWnt4GuLGEdWIHIg7MW63rXuBhKN9L8
 NYNWSNOKIggUJZb216xsinSXcJwwSDixdZfkEkdBW0jBuVbau0R+NsOK+QQiaUzIB6qL
 gMsb9K6yCacmQHaLP92wrVJcvPJnsDhjRR56Gak8ZwrhnJ/cEvSyRWZia24U5v4B8l5H
 IijWN03qv3c10y11YkSQozyBg+5ix0bi5s+u5+blm5QiFza5vlsHN5/6REY6mRGfG+z/
 Aq/g==
X-Forwarded-Encrypted: i=1;
 AHgh+Ro09vm5Sbd8pVamKWvqY/toA/iUNATf8oyyV47cyVSWogCVOAWyP/XzwXVaR2V/GB2BQAId3vHS2WKq@nongnu.org
X-Gm-Message-State: AOJu0YyIUuPtiBPQOkZPEdkSfFNv/Mf/w2RACmYeI2qt2QdPmy7dIdsq
 1hhwj3fy5QZrY868/yK/vq/kKnMSLmQ/RClPmzYShIVv/klh3StHmlu1jGiZLWZ7MXJz4eOXx8t
 OHPLberLllEfouxQdzUP2ejTx2YsRLp+3ndQmaxNRBcJLor/3SUhHhvG4fA==
X-Gm-Gg: AR+sD11mx7P9v3T0LgL29z9/yE4plWGizlLp2+LlE/eErC8U7eMMnl7zx5EFbmzCRN4
 ZbLgF4xQqmvyJ+sOYbja9w/R/fqgMfZCbyvuKBiNvdJLT52Ake8fW89XRFWV4g255aMMir3yggf
 rEXj0ywY5EGfoRgygHmyw2S5MaF0Epo88RHePr8bIgcrb3yY9sxttawRYC33Gnge2qvo2ykFRiN
 h/ItBQ0mTae6njadCwEohDdfBCRu8stxD2fbup2uZs019QGh1XnWUsfelRlfy/egqPMDsp9oglp
 XIG/Rr8erKPWvzb6dZ6l5O3tD6mepMVLwcCTIsYGA6QTQ+06LrLNoPgp1oML3NqSV4JLyRNclXk
 fbptzmZg0JJxaZF+RdThshk7E8F0DEXoM3HLcN6dbvw==
X-Received: by 2002:a05:620a:2b4d:b0:932:dc4d:c755 with SMTP id
 af79cd13be357-9371e30f089mr1163995185a.15.1787222868135; 
 Thu, 20 Aug 2026 03:47:48 -0700 (PDT)
X-Received: by 2002:a05:620a:2b4d:b0:932:dc4d:c755 with SMTP id
 af79cd13be357-9371e30f089mr1163991385a.15.1787222867626; 
 Thu, 20 Aug 2026 03:47:47 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-482b1450e54sm13595774f8f.11.2026.08.20.03.47.46
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 20 Aug 2026 03:47:46 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Zhao Liu <zhao1.liu@intel.com>
Subject: [PATCH 02/13] target/i386: Constify CPU*State for cpu_*_interrupt()
 getters
Date: Thu, 20 Aug 2026 12:47:18 +0200
Message-ID: <20260820104730.25462-3-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260820104730.25462-1-philmd@oss.qualcomm.com>
References: <20260820104730.25462-1-philmd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDA3OSBTYWx0ZWRfXzmSW3CZguTz6
 fgrGbZ52sSIgs44pLAJZyjhEQ/I05R3x1Tg7JGbLe1Ar97u8DDOkdRl14xuockSALeCYiHGjrTS
 z8n71S41XiMJBU3ygIr/5Anw2VPNt6w=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDA3OSBTYWx0ZWRfX0d3YvRr0kxOU
 qVCNY+UoCSnzjGHryuh5i7smbnY4V5kmJhys1iWI5B+OY3bTWP+jpZACqbY9Sr9V9CtZQVk0fod
 9DNfcXNxI6uUJUk0qE4FyYnwWEejxf7WYGx4G6KrHNRPyaZ9boKSw///ulkgjzwBXyQblNkoY9N
 Q90bL7xHNKho9F8+1RpuT4cIQWp8JZfJc+PozKE1PxnUjEsKXhAJmXAV2C7ZESy3UgFqsjydNqf
 do2A0jKMleiBS72OL6x82dskyD0OY8G5PQydf2xk9xaB1ndazY/n325R3lxR0yWDE8Q/D8oJ9If
 PxLNEDvj/VhIMngzdtn7eoCan+hWJOP7Cs3RC4HTWG1yMaHWI13O0rur56hG/Zxs2iyrgY/QRPp
 DI6ZHWGI4YAn0p1rrC0S+OlesVk7MUWZV4leg1guWcCDyzG4vX5g1CeOX77/PK/jYj6deQbgGTH
 Ne8OXb9zcujD4NiB4NA==
X-Authority-Analysis: v=2.4 cv=Y7/IdBeN c=1 sm=1 tr=0 ts=6a86db54 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=rZlSPvJ8NcuramrJ918A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: x7KWIPtfnR78xznoeYcktz0UqJYgBZgM
X-Proofpoint-ORIG-GUID: x7KWIPtfnR78xznoeYcktz0UqJYgBZgM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_06,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 clxscore=1015 phishscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608200079
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=0.001, SPF_HELO_NONE=0.001,
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

x86_cpu_pending_interrupt() and x86_cpu_interrupts_enabled()
only read CPU state without modification, add the const
qualifiers to CPUState and CPUX86State parameters.

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 target/i386/cpu.h | 4 ++--
 target/i386/cpu.c | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index e6a197602d8..72adf075bfd 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -2584,7 +2584,7 @@ void x86_cpu_gdb_init(CPUState *cs);
 int cpu_x86_support_mca_broadcast(CPUX86State *env);
 
 #ifndef CONFIG_USER_ONLY
-int x86_cpu_pending_interrupt(CPUState *cs, int interrupt_request);
+int x86_cpu_pending_interrupt(const CPUState *cs, int interrupt_request);
 
 bool x86_cpu_translate_for_debug(CPUState *cpu, vaddr addr,
                                  TranslateForDebugResult *result);
@@ -3092,7 +3092,7 @@ static inline bool ctl_has_irq(CPUX86State *env)
     return (env->int_ctl & V_IRQ_MASK) && (int_prio >= tpr);
 }
 
-static inline bool x86_cpu_interrupts_enabled(CPUX86State *env)
+static inline bool x86_cpu_interrupts_enabled(const CPUX86State *env)
 {
     return ((env->eflags & IF_MASK) &&
             !(env->hflags & HF_INHIBIT_IRQ_MASK)) ||
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index e5ffb10d156..8777bcbae85 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -10601,10 +10601,10 @@ static vaddr x86_cpu_get_pc(CPUState *cs)
 }
 
 #if !defined(CONFIG_USER_ONLY)
-int x86_cpu_pending_interrupt(CPUState *cs, int interrupt_request)
+int x86_cpu_pending_interrupt(const CPUState *cs, int interrupt_request)
 {
-    X86CPU *cpu = X86_CPU(cs);
-    CPUX86State *env = &cpu->env;
+    const X86CPU *cpu = X86_CPU(cs);
+    const CPUX86State *env = &cpu->env;
 
     if (interrupt_request & CPU_INTERRUPT_POLL) {
         return CPU_INTERRUPT_POLL;
-- 
2.53.0


