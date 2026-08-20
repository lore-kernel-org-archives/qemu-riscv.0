Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0574C5DF81
	for <qemu-riscv@archiver.kernel.org>; Thu, 20 Aug 2026 20:14:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wx99a-0005QG-Sc; Thu, 20 Aug 2026 16:14:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wx99Z-0005Po-Re
 for qemu-riscv@nongnu.org; Thu, 20 Aug 2026 16:14:21 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wx99W-00020f-Ct
 for qemu-riscv@nongnu.org; Thu, 20 Aug 2026 16:14:21 -0400
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67KK7XTk250307
 for <qemu-riscv@nongnu.org>; Thu, 20 Aug 2026 20:14:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 b2hfNH6s7Qj+rSFk3xgTZrDK7N6/yTIPz+i0gRL62t4=; b=WpqJ2PvMe62m7gZl
 lOr1Uqbk/IHClU29aWXIuAue8cTmu6LSUyMw4XLi/SpG9yn+p37DXYO3FXYIJnxs
 QY6W4zFjUv8W131/SXSIZ4DOjw0UVZSpw8StHC0GZTgCsm5z6N+4DHbwtFDcy9Di
 lk1xdd+8H+ybC31/v0THLhi0kRB1VPIM+++dL4xr1CYlyaQwWjoeRu1zo0C8lvdv
 4lxQ2GQhHqz8+DQrjtMWYHoH+bZv+DednhSelcRNC9cqZvA1tlKG64elUgMXAOtK
 F9BKg0L0bBc6LdTfPIsEmPi0lLVXelyU5sa17tFz6KzE1TrJNyBoSw4gVw+WFXaP
 65+5GA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5w49begm-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 20 Aug 2026 20:14:17 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-8e934385db1so3924136d6.0
 for <qemu-riscv@nongnu.org>; Thu, 20 Aug 2026 13:14:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787256856; x=1787861656; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=b2hfNH6s7Qj+rSFk3xgTZrDK7N6/yTIPz+i0gRL62t4=;
 b=YaffY4JSDU22s1HKr+s4oaKqUZALVspz8uHCFmJ/+GqCji5nPNHTEUxHDkkU4Nwy0k
 +XbW0GUoF10El7xWqJLLCvnH1TcywNmcoOeDqoS9fVtOD/6Sa3YchC4uALsxiUjym5nG
 PauxXK4WKJBrVgcS37mjB8IiYHyzGenC0DzRZPhGiXfQri0nkIUef3qFP1KXICOtMgC9
 NbZDsmppu5Vro9yhIzlAStun0r6ZcG11N1kqLH56MV/JUdm+b69ytiZtNnEmB86fi5sk
 zRih3syE8tOYvoXtgWMPPW9wCEj9omztTJEfxYmeRqwYlpwR82iS0b5wx5Vy6cyaF4lE
 NfcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787256856; x=1787861656;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=b2hfNH6s7Qj+rSFk3xgTZrDK7N6/yTIPz+i0gRL62t4=;
 b=RV6CK6AfIPobrA+zzfeYweWq5qjy6vAODsVdNLG9TRzNXQdTtdjhxVg777eQBmHxgn
 TyM2esG5IRPEfELZq/2QyBycgSa1ybW5ZrRLS/AbcZnh50ycXnNDIoIhRFU13pFTP8AM
 DhjYHLbya+smVuEFDsjNjdhIxQIirhJ0Jab3szTztCxn5nZhUDiNckRhmd6AHGzYw6vS
 vQzeC7PZlhWjo/0Sh4IJpTJMnDLm82yp2JNZypciwVMKQ2irRZF/wsup+Z3sFMuut9Bz
 lka9opgySpVkZLqwNykaiOFkGka6Vdsb0RidEYSnNyyc8x/vu3D0xnj1jnnCz7SW/U6m
 /8TA==
X-Gm-Message-State: AOJu0YxTKIExWou6+XPxKxDYfLACoGd9H0lKW7qC85boEnMgPihRF9X6
 veGF8b/Ecq3BUjtucXx3IUCsliUyMnwjRJFVmwxAR1yYwEe1QPNXwSumXxiBEOSe5KtyfrgMl32
 9KZQf51Hh3iRf+aKVS7LnnSVhGiZp2pZEa/Ce8TkLg/HE+CcnYy8I/qC6sQ==
X-Gm-Gg: AR+sD10yAWJf24x+3OZ07tLmOYZJJpn6IOB12ACXaGhU/4ew1LzEWuPV/YXCta+wjFW
 BSFjUA2cBmWHtlhKTwoe66Yj1F3waVRnIzcnvfK0/ur1YycHlC6TbQBzD/2oH1wRspF7bYQccT4
 WG3HkRHIAIPi/hShuRYjJe8mkMV4Gn2zfY8UAfOZkme5RbHSDqx/WuUa71SeNORgj9lTxVjPdJw
 9c+7HCa7+QH6qGXxCi8Qymx3FUBSPaIp0znErRjJtUuTHvcRRyHZaU1zXVb5QAy2lbwrDAuuqYn
 zkb0vTadIzSTT50KfXJiwKFzT5zQxVB0uYJRr3WUbLGlfuxCvsjKmFkjEVlSM4HJqmo2Fovec+c
 Tv/MK6Q8V1eQyQcJRgp6MsK4g0jTQL5nR8zWYetVbRA==
X-Received: by 2002:ac8:6904:0:b0:51c:e14:87a7 with SMTP id
 d75a77b69052e-52df59f3462mr9989271cf.28.1787256855875; 
 Thu, 20 Aug 2026 13:14:15 -0700 (PDT)
X-Received: by 2002:ac8:6904:0:b0:51c:e14:87a7 with SMTP id
 d75a77b69052e-52df59f3462mr9988811cf.28.1787256855471; 
 Thu, 20 Aug 2026 13:14:15 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-482b1441c85sm17038684f8f.1.2026.08.20.13.14.13
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 20 Aug 2026 13:14:14 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-s390x@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Zhao Liu <zhao1.liu@intel.com>
Subject: [PATCH v2 02/15] system/cpus: Constify various CPUState arguments
Date: Thu, 20 Aug 2026 22:13:42 +0200
Message-ID: <20260820201356.29775-3-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260820201356.29775-1-philmd@oss.qualcomm.com>
References: <20260820201356.29775-1-philmd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDE1MiBTYWx0ZWRfX7y6o2hhRJ092
 jTL4LxDn/AAS4h2Am4ASPCmXXLe7XvbytM+P16i6O5Bn12w9pA8IGYGhPyIa/LbbcTrhknyr0NA
 Wd/kB5WXPZu3fbApDAHBB0GqWyqfc5U=
X-Authority-Analysis: v=2.4 cv=YP+vDxGx c=1 sm=1 tr=0 ts=6a876019 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=xPOHbBPGvMiCLs31fh8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: BtrGb1_8foiXZVzuh_kgs0P4DI7j9IkC
X-Proofpoint-GUID: BtrGb1_8foiXZVzuh_kgs0P4DI7j9IkC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDE1MiBTYWx0ZWRfXyPtQoQpM+G3a
 52k+g7yhp18+g5pKaLafJvGdkLupmK6cH20B44XRan170CUTsvJSOIzrOKOECUXrUM0gvxKOiX/
 lz67FY3DrnlQhzT6aq3fDLeaW+HMTy8KCiwo0NzTVWc+0A2DQCbkjPcUWnXjl1ve5853hNU9NFF
 NAEJZOT5tUsTBOct7Sd4numzACWLReizFc2Ci4rhcaErPnBNivTuIaIJHmWybvG1Ym7Dj2eEsYG
 AGZvw0NxZD7jfBfFrGQf1GryWNGkcaXchQ9wAz4zTIbAcmvk3r7XQQSNF2duEBjF2/ziJ3nKj7H
 cs+B5DBgtmpJ+Tf8T2BQaheQ6wodh0iagYyJOhWyXYmdr3ppW4v4GYv+uql79onhyQQtyiWsKZz
 +2bI87MMSYBDxrCGEkUKpcpor/6iQAI8T1qvsdtqV8ypHRov7Zgihp2LYaUF/v3TIPbN+nIiWf3
 jsVT8GVBEN8Q4LjFtmQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-20_02,2026-08-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 bulkscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608200152
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

Mark the CPUState structure const when it is only accessed read-only.

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 include/hw/core/cpu.h | 4 ++--
 include/system/cpus.h | 4 ++--
 system/cpus.c         | 6 +++---
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 81af7b9ee1a..a16acf14370 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -893,7 +893,7 @@ void qemu_cpu_kick(CPUState *cpu);
  * Returns: %true if run state is not running or if artificially stopped;
  * %false otherwise.
  */
-bool cpu_is_stopped(CPUState *cpu);
+bool cpu_is_stopped(const CPUState *cpu);
 
 /**
  * do_run_on_cpu:
@@ -1000,7 +1000,7 @@ void cpu_interrupt(CPUState *cpu, int mask);
  *
  * Checks if any of interrupts in @mask are pending on @cpu.
  */
-static inline bool cpu_test_interrupt(CPUState *cpu, int mask)
+static inline bool cpu_test_interrupt(const CPUState *cpu, int mask)
 {
     return qatomic_load_acquire(&cpu->interrupt_request) & mask;
 }
diff --git a/include/system/cpus.h b/include/system/cpus.h
index 508444ccf1c..bf36b823769 100644
--- a/include/system/cpus.h
+++ b/include/system/cpus.h
@@ -13,10 +13,10 @@ const AccelOpsClass *cpus_get_accel(void);
 #define VCPU_THREAD_NAME_SIZE 16
 
 void cpus_kick_thread(CPUState *cpu);
-bool cpu_work_list_empty(CPUState *cpu);
+bool cpu_work_list_empty(const CPUState *cpu);
 bool cpu_thread_is_idle(CPUState *cpu);
 bool all_cpu_threads_idle(void);
-bool cpu_can_run(CPUState *cpu);
+bool cpu_can_run(const CPUState *cpu);
 void qemu_process_cpu_events_common(CPUState *cpu);
 void cpu_thread_signal_created(CPUState *cpu);
 void cpu_thread_signal_destroyed(CPUState *cpu);
diff --git a/system/cpus.c b/system/cpus.c
index f37e215c586..e11a5aab6a6 100644
--- a/system/cpus.c
+++ b/system/cpus.c
@@ -69,12 +69,12 @@ static QemuMutex bql;
  */
 static const AccelOpsClass *cpus_accel;
 
-bool cpu_is_stopped(CPUState *cpu)
+bool cpu_is_stopped(const CPUState *cpu)
 {
     return cpu->stopped || !runstate_is_running();
 }
 
-bool cpu_work_list_empty(CPUState *cpu)
+bool cpu_work_list_empty(const CPUState *cpu)
 {
     return QSIMPLEQ_EMPTY_ATOMIC(&cpu->work_list);
 }
@@ -271,7 +271,7 @@ void cpu_interrupt(CPUState *cpu, int mask)
     cpus_accel->handle_interrupt(cpu, mask);
 }
 
-bool cpu_can_run(CPUState *cpu)
+bool cpu_can_run(const CPUState *cpu)
 {
     if (cpu->stop) {
         return false;
-- 
2.53.0


