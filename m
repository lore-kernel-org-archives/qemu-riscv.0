Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57B95C5DF81
	for <qemu-riscv@archiver.kernel.org>; Mon, 24 Aug 2026 11:20:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wyShm-0003ZP-3d; Mon, 24 Aug 2026 07:19:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wyShj-0003Ok-Oy
 for qemu-riscv@nongnu.org; Mon, 24 Aug 2026 07:19:03 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wyShh-0005Zs-S0
 for qemu-riscv@nongnu.org; Mon, 24 Aug 2026 07:19:03 -0400
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67O98u2A3109544
 for <qemu-riscv@nongnu.org>; Mon, 24 Aug 2026 11:18:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 WWjKl8lE0l15HkiBp4oGylMn+2gkaoOjSN4ksHt/pc4=; b=okLhfKOWv3GguvKR
 W0kG5k00RdZSpbukZ9TL5IfHhrHHS4kT8JRK+4WNJfmau06M/CByq+IS8TvdjjJq
 2KLB+X8HX2pDsCMlGszBesmQGijxLOdEY1S1caKllMynjdd95ydH1xc8QweVFBq5
 rRDJDdLv9roYqm5PB3Mjz0dM/xfODw72w543vgiAkpY7DhLhwfSIE1R2QyVfiYr/
 vy+9TuRniS+xB8yg5yYO0dniKAogQbAct+MpGFE2LLQFGUd1+z5jFhw9ale/Qetx
 5pBfDC5Ux9iz/juDt4jWzwp1sYK2OaTJAoLqZEykZWCtQND5uvH4aSMujBSDCvY9
 2YNEAg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8jgk0qp4-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 24 Aug 2026 11:18:50 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-52dcf1bb6e9so42233931cf.1
 for <qemu-riscv@nongnu.org>; Mon, 24 Aug 2026 04:18:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787570329; x=1788175129; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=WWjKl8lE0l15HkiBp4oGylMn+2gkaoOjSN4ksHt/pc4=;
 b=jwMxID2AObR13xULByswvsfBcXyiiZokwFK6tGQMBx4FLSalbKzeNtqld7lib0RD38
 BCf3jOWkDbuD8jWrvSbJh9PL6MY586H+t9Nqr4byHGIo7QQ0WR84J1iQM551a6HO5SWP
 J7+eQt4ziD1ND4SvGjd48AKJtwhCq6IzJ5RENGNRfWGbIYUedS+sAe6adBFrWbUhpdz0
 IbtbaS7tOT4NSGo3WfdDLPVI83JmsDxy1V6W/24Lh5MVSPEoGEZGnWEZlT2uV9TJLc1D
 ajrxKPLsScQg0+fSTR+8HXbiIOcCOFosg21S2m7W0LJbWQ0/onhUh23G+M+PXyfz2hHo
 CUOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787570329; x=1788175129;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=WWjKl8lE0l15HkiBp4oGylMn+2gkaoOjSN4ksHt/pc4=;
 b=Q2qd5HbaEP8WFunO41tLOwAnAzSoT9avO+j+4gx0rAz+KyxThFOxVbrP1G+MhbmTAS
 ctxj8oK22G7EHl3NOSvAz0X2LOwDSJ9OvrdrdlksZOgH153EK4OvxSTIvpo55B2Nx/yc
 xXf7QdbdOhYvp4YlNE91DW9KKNudDWwKH/rOsd4+7qR3vHCx3cylLad4cHDzdDuNKTwT
 hQ+/q9RaighdcVfkp38a3QQW4qRIuLHY8cLklxgxsehJtUPLYRecVYDQznI4nT6OgKCk
 Q27RT9FnUpESqkm8gBlTdzDqmtRDz5ENfRwkQbXJtBdMb2vymqXokW5CwnSlrv1CcokW
 Er5A==
X-Gm-Message-State: AFuF++mZimvLzQc1cIXg9x1lb61jy1OzF4pWw4re/qD1Xbs+/IAhYOA0
 eaTP5hdbPpgNAtx1Zt0JMu0CY0mD4YRIfdg9xApNMTu9sYw7O7eb8VY+NACh8uk/+nM28cefbCy
 8CgIWBDzbmfvXQc2iF2NkIeF5MwmVH7nQyPYGbeJgCsLP7d4psBn7cne3PQ==
X-Gm-Gg: AR+sD139v31v7bq+Kcu5rZAODMJH8kRn4jxOfBp64cIwatmabH3Nkpz94uBKcbptRDZ
 bF4tOIEyX1lLQpPGs+P/yZXwGQxErUdT8BXBkNSSk6Xkeu7VhiarJqV/fZckbkT9i5CnBSaqKOU
 BUysElDvb3oUuYC6arFSEmUB+5ehZ775r+wGIHYTR4KC3ubLuPxN2VyPAQDEhEwl8Oquf2vUmh5
 zkZZIpwQ363yAdfNLMk59nPdaJaPJhoN9zgF1osLTZR7AaL+0DVTCi0AWtEA0a5kLjWj9EGzO06
 AHKD3q2F2BekQTSTBq7R5zvLfk1gzq+/GT8KEmj9SBLuxNPFo2aF0x09V9AKlTdtSlxwwdN8v8x
 inLjl5DibeWk8+KUjBpxTxsmXov0MAoaRfoAMPr4N7c+Ijt8bMQ==
X-Received: by 2002:a05:622a:4d89:b0:52d:3483:ed0a with SMTP id
 d75a77b69052e-52de33af2aemr340162421cf.18.1787570329315; 
 Mon, 24 Aug 2026 04:18:49 -0700 (PDT)
X-Received: by 2002:a05:622a:4d89:b0:52d:3483:ed0a with SMTP id
 d75a77b69052e-52de33af2aemr340156531cf.18.1787570324808; 
 Mon, 24 Aug 2026 04:18:44 -0700 (PDT)
Received: from localhost.localdomain (44.170.88.92.rev.sfr.net. [92.88.170.44])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c249606a905sm1375485266b.13.2026.08.24.04.18.42
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 24 Aug 2026 04:18:44 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Zhao Liu <zhao1.liu@intel.com>
Subject: [PATCH v4 09/20] target/i386: Constify CPU*State for
 cpu_*_interrupt() getters
Date: Mon, 24 Aug 2026 13:16:58 +0200
Message-ID: <20260824111711.26297-10-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260824111711.26297-1-philmd@oss.qualcomm.com>
References: <20260824111711.26297-1-philmd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 0H5hWs6kcDThDPrTVJbOys56nDU-yBr5
X-Proofpoint-GUID: 0H5hWs6kcDThDPrTVJbOys56nDU-yBr5
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA5NCBTYWx0ZWRfX9OihFeWGeOzg
 JP1hlv0exp0r5OPT5m4tK9+Ww4it9p5ZH/LK4oMGJBsGQP6wz2s3LUAJq1MiWJX4lBiUbrkJJyC
 IUJIIE47AIrUtp7Z/Z1G3pJ+ZkXVim0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA5NCBTYWx0ZWRfXxOs0h0IqVP5z
 fre//spogOd/mSN6oem9s17/pCWluSy4OjZVbwy0Nc1sAasqWlc40Bht7fbphyacetwjClrzVBq
 p2v/dDW51SWQGPEiut/woCGjh+VIOzLqkqxPaUvxE5T0SjZGnyqC5SlJXB897ULLEdZDAB9G9UU
 adQoQPpiqTI/pON4OmNDr8iIpJoPrDEzfiEQNo7wTP1tKozmIJtVZNpMaWfKRzN/m7xMf6aQApt
 1YIJyYoD/Njp2LaMjCz9MhDzs751l+Dxz59e8PcdtfCwWCECwfepxNqfYnGM9/Xi6prdavxHarW
 FeJ0pOo+RV/8AzNrJ02IIy6I6ocWwMfSqcQxx1uBj4nlktYcUvQiFvBvJrWBHvoFoc6zSkVozyH
 DGJDKFcuU92Zb6ZbH7/+JmdGrxzznho4scSsBWTc9/Fbuo8nlDKBu2+yqHPDNhWaX3/mPdipH5/
 lhdRl59SXOHantumU4A==
X-Authority-Analysis: v=2.4 cv=KcvidwYD c=1 sm=1 tr=0 ts=6a8c289a cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=s1NLoHz9uzatdv2VNqxUSg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=20KFwNOVAAAA:8 a=tlxghdvPRZsVr19qFskA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_03,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 adultscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240094
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
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

x86_cpu_pending_interrupt() and x86_cpu_interrupts_enabled()
only read CPU state without modification, add the const
qualifiers to CPUState and CPUX86State parameters.
Simplify directly using cpu_env() in x86_cpu_pending_interrupt.

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 target/i386/cpu.h | 4 ++--
 target/i386/cpu.c | 5 ++---
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 641f3ee5c2f..b0436dbf665 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -2596,7 +2596,7 @@ void x86_cpu_gdb_init(CPUState *cs);
 int cpu_x86_support_mca_broadcast(CPUX86State *env);
 
 #ifndef CONFIG_USER_ONLY
-int x86_cpu_pending_interrupt(CPUState *cs, int interrupt_request);
+int x86_cpu_pending_interrupt(const CPUState *cs, int interrupt_request);
 
 bool x86_cpu_translate_for_debug(CPUState *cpu, vaddr addr,
                                  TranslateForDebugResult *result);
@@ -3104,7 +3104,7 @@ static inline bool ctl_has_irq(CPUX86State *env)
     return (env->int_ctl & V_IRQ_MASK) && (int_prio >= tpr);
 }
 
-static inline bool x86_cpu_interrupts_enabled(CPUX86State *env)
+static inline bool x86_cpu_interrupts_enabled(const CPUX86State *env)
 {
     return ((env->eflags & IF_MASK) &&
             !(env->hflags & HF_INHIBIT_IRQ_MASK)) ||
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index e5ffb10d156..1fc02cf94e6 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -10601,10 +10601,9 @@ static vaddr x86_cpu_get_pc(CPUState *cs)
 }
 
 #if !defined(CONFIG_USER_ONLY)
-int x86_cpu_pending_interrupt(CPUState *cs, int interrupt_request)
+int x86_cpu_pending_interrupt(const CPUState *cs, int interrupt_request)
 {
-    X86CPU *cpu = X86_CPU(cs);
-    CPUX86State *env = &cpu->env;
+    const CPUX86State *env = cpu_env(cs);
 
     if (interrupt_request & CPU_INTERRUPT_POLL) {
         return CPU_INTERRUPT_POLL;
-- 
2.53.0


