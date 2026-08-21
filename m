Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6841AC5DF7D
	for <qemu-riscv@archiver.kernel.org>; Fri, 21 Aug 2026 10:56:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wxMpx-0004nQ-FS; Fri, 21 Aug 2026 06:51:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wxMpv-0004mP-Dc
 for qemu-riscv@nongnu.org; Fri, 21 Aug 2026 06:50:59 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wxMps-0003Sq-Po
 for qemu-riscv@nongnu.org; Fri, 21 Aug 2026 06:50:59 -0400
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67L9Lpsc1799091
 for <qemu-riscv@nongnu.org>; Fri, 21 Aug 2026 10:50:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 WWjKl8lE0l15HkiBp4oGylMn+2gkaoOjSN4ksHt/pc4=; b=hc1m1jrOV7xNBmy2
 nsErzd8irCu0V8T5lU2FNpk5HSArK7xrwmJ1tp25bDKhbiirYNMW4dwVtfFJQqs2
 b1oFTiFY38c4vl8wEODQtmeXShtgn43erv8SnTXH88TfBJMl6R0JkMpS2DgHmHkh
 0w6pe84bsZcpX7tKaLvv+mTGuTMeDA+xuN/UDsPyY7ypP6/o+3fVlgH2rdB4B+f0
 hLdPb23EMX6x7lesqCQiGf8KPRBiCiejDZG0yBMACet1Kgg2ptTkebMQB52An3as
 ZGLPA/1yQvuEMJY9DPGSjTRWo3nj7UysjChkFZyoXDCwxRyZ+fJkE4sWZlrNTqTi
 HML6+g==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g6ecb9jhk-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Fri, 21 Aug 2026 10:50:44 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-52b4f6ac06aso14247231cf.1
 for <qemu-riscv@nongnu.org>; Fri, 21 Aug 2026 03:50:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787309444; x=1787914244; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=WWjKl8lE0l15HkiBp4oGylMn+2gkaoOjSN4ksHt/pc4=;
 b=X5JNCCRPFEPBBgehUnYE1n6fEFFY6FUehAIVDPBm+n7YGeOiwkCpovTpaJEn/UZf32
 drHhKvB3y4rUWZquyNzEYQVq/sJpJ9EwcsHEsT5XTmePbPpg+71hkNHNy5vi+Gp2FLu8
 D+PD6JAQ6FAmHNGgtKIYkV/2/0aaJpPlOa5vZquKXMkC7DdQHwr8cs0rIhP1SaubCG16
 j+Ygy+bbn/NUeTUOrx/g+OxpQ0Qk7Uz9zXTZSFisQdYgus0UYLVxPLA9C88NS/C9B+Lw
 78R+Zz008XV/Dw033oNzEkUcnQW4zydnQs/CGLVijl20qlZB4+ctg83opE15+HtBsFcp
 6/kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787309444; x=1787914244;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=WWjKl8lE0l15HkiBp4oGylMn+2gkaoOjSN4ksHt/pc4=;
 b=WX4la9c5ZJFhGFeY8gvgSuIdOTCjk7yySx4JA/+lwwoOBs44AbFWLJm2CJAIriWbCX
 jBez6Y/Hy0JKtEskXjBtl1lneMcdnSafaftQQ+weLpUQUmQ/JldQSdfq8ZmL79LRWFRh
 6ZP5qtQ6KbMxqWIj+VHkx/b9jWeN3MUIbIcL5eqXF0+3PqVnl2nNgDnIgMfBvcARPAzS
 6T47NUMHm224UcBNeHSFfkmVMLPlG5IYRHMnwO63+2bV+27cmxypF7yw5uSv8y+FxGcO
 OWtuazoqanil9tJgePWb/1ZqTEsVsSvlM3wU9rdpLcZ8OzLQZBD5iro70KPxvL/bvjd+
 bLGQ==
X-Forwarded-Encrypted: i=1;
 AHgh+Rp2tg1jY3uWDUoHqyocf5apq2OZ01NzHG/TuUskTOBbkp2aIXN9yGLNnX2Srxdn6ZHDsIafnIlPMuRK@nongnu.org
X-Gm-Message-State: AOJu0YwFEO/wAARlabY2bPWDoM+ZAnaG0EYgSW4wP6RsGU6KQmnv+4eI
 hYhR/ZfXB2aEMmvxANNekw2VxYq3/AMcV9rxG09Ll27mZaZraJM4GcLT6j6yBXiRnEKrh/0NyU6
 qT1SsD/IK1780XpnqLTPzWDSe6W+WD+Zbmhx7hy5fap/mSuIPQHnwUud2yw==
X-Gm-Gg: AR+sD13hed0AlVJPoIiWXViSRfzPu91GKq61UfPFiDy5ksX6CPVeXLOlOwkM4oDnde7
 ECAEAINr/MjY57LOdPEe6j5S8f7rZ4XBYajgdxHuhVSRUERZSXlmP4hXoCbQ3djFdGp5k9XiWOb
 wx/eXrX9tqTE2Y1Q7mqp3ZjSRumYprg22nqdsHE1TRrqPn4Rhy4/k/2Nawvb8iHLZBL72/5z1xl
 /oKkyNy/e8Rrr0czXXKWj97xo8/zSNm7iCmVVvmqV7RfEGG4BK9rKQDF7XmB3XAtf1owdEDgXVu
 aWgwyFTFiBY4KLidnWyOKoWiSeEGWwNPE+f9RGFJRvEbPfIdDhPabGChagJM7M3IQziNzebnMmm
 jyVyI8x6lEMukkoIXru4QIq5fpdHK6eqCuVMFrOgARg==
X-Received: by 2002:ac8:7f96:0:b0:51b:fd82:22dd with SMTP id
 d75a77b69052e-52df5698102mr47698251cf.15.1787309444167; 
 Fri, 21 Aug 2026 03:50:44 -0700 (PDT)
X-Received: by 2002:ac8:7f96:0:b0:51b:fd82:22dd with SMTP id
 d75a77b69052e-52df5698102mr47698011cf.15.1787309443839; 
 Fri, 21 Aug 2026 03:50:43 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-482b1441753sm18640395f8f.5.2026.08.21.03.50.42
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 21 Aug 2026 03:50:43 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-riscv@nongnu.org, qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Zhao Liu <zhao1.liu@intel.com>
Subject: [PATCH v3 07/15] target/i386: Constify CPU*State for
 cpu_*_interrupt() getters
Date: Fri, 21 Aug 2026 12:49:41 +0200
Message-ID: <20260821104950.32108-8-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260821104950.32108-1-philmd@oss.qualcomm.com>
References: <20260821104950.32108-1-philmd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIxMDA4MSBTYWx0ZWRfX27OJ8JObgy1X
 fu/jhxygIcu5GfbuQM+Zmxa+9xYCXLvGZOEpLTSZhcu17OkD9v0zNP3J/UlDjjcIdrU7XS0KiPc
 sm/quOMdG5yQjNIJZpFBYZMa4rfILVLmoezluxVn11tvsIG4vJ6AoLGIDoPD+xmO5SulD1jYAhc
 qqoPKrYZpWE1y/WDRcrjYrt2e3ANSRVWqcMJ2Jxx3ohFFBePq5RhUROPTyrL2UfIMh5BcUup+U2
 V+GJyQLn/sryAxyWnPx/MRWuPDfu78VnRuFWprrw1knEtlniwDOWqNhGNheh0+vz9BOB3gOOmCl
 ZvZ4se1QxsyQoIqK1B+Xk1VzhlDvBEM+loZcZBFgdVHsv8OYTVqSL/WQPy3iInfkLgOkT5+Ehey
 jFiydRPzGV04mUSBHt0MICFfJ9oXvvCNn7XZj+HBZATQbAuJKhvKRd/DVvatQMX4MIB/TufFT64
 1IzIilf5UPezYOiopAA==
X-Authority-Analysis: v=2.4 cv=e/s2j6p/ c=1 sm=1 tr=0 ts=6a882d84 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=20KFwNOVAAAA:8 a=tlxghdvPRZsVr19qFskA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: Pz2LS0F8OYvxKq8HgUpUQDkP3Ppm2wQr
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIxMDA4MSBTYWx0ZWRfXwZyr0hR6T2LH
 FdfDF6w34Q0nM+sJsruYMEdmZCMmXc/BTFPA3MdzJnqi76OOZvQKrH07kjCoEGEZoBMWY62YO86
 tb+Tzbbib8na1gwz1MKfLYlWAe79AWA=
X-Proofpoint-ORIG-GUID: Pz2LS0F8OYvxKq8HgUpUQDkP3Ppm2wQr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-21_03,2026-08-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 suspectscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 priorityscore=1501
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608210081
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


