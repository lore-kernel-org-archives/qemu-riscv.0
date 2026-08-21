Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA875C5DF7D
	for <qemu-riscv@archiver.kernel.org>; Fri, 21 Aug 2026 10:51:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wxMpb-0004Mr-18; Fri, 21 Aug 2026 06:50:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wxMpX-0004K2-DZ
 for qemu-riscv@nongnu.org; Fri, 21 Aug 2026 06:50:35 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wxMpV-0003Bz-IQ
 for qemu-riscv@nongnu.org; Fri, 21 Aug 2026 06:50:35 -0400
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67L9MPLx1572264
 for <qemu-riscv@nongnu.org>; Fri, 21 Aug 2026 10:50:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 lEnvXfEMJ3q8d6QNi/AAV3stk1lN6HSf4sh7CE8qq2U=; b=mSWEu4LA7ZN9SmWw
 58WgL9LY0p6TjvKcuBPBAQvPevKPV9/5Uoc0PrmetnINO5ChXvYmPPH1hyo0ApwX
 UXfxMw+7igB4nSPFFFldoEA4p/wlSIFfdN4VS0FCoD2eBoX/Zt9aEYzVBQJBYFD3
 iCP2mbL8uLCAiqW+mpP6K0o4wDKBjEB9jMlY7qojurkzN9Dk1p9QhWZOxrPRZ910
 zqetki7SDK6SHejBT5By0Sd4jxU7LVwxecKN4i+eYS8uXBtfDdTkMQu73isbst7l
 hwrVff3W8tkd1nBA1o/Qei9u1ZaxEHcZO5xkNXW6e7aOJa47AtjQ/YmhPsW/qCzF
 OaymiQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g6fue18x5-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Fri, 21 Aug 2026 10:50:22 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-51bfe3fa93bso8733531cf.2
 for <qemu-riscv@nongnu.org>; Fri, 21 Aug 2026 03:50:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787309422; x=1787914222; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=lEnvXfEMJ3q8d6QNi/AAV3stk1lN6HSf4sh7CE8qq2U=;
 b=HEBJjEh8Qif9cgQr6EJPPQKnn6d2Kx9UZoLBmI3CB3bfozo7ZnhN7JAEzACdNLf3lJ
 laKLNmzyi5fdNguLXtmN5mV/7Smn/stsRM1wDt27k3UTXn+GqdAm3CI6FDqcLmEiu4KC
 H5Td2G8V/yts7I5Joa0m9QM/ztugfDJHQDbgNf6kkrv4LslUbAyEovvspq3t8Mx2LRyc
 /jXSwQpp/9bflGsaIbDS+YTvi0zGvYG1zapS1CJS1/iOfqOw+EtFiiZQ4FRV+nBOHYYB
 5VO8TwJIAvk5r/uFdijcHg3eWdIRRdLwoIvtnNwOrapry+VEh1b4BfYaZ8jrq5MOdFE2
 axRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787309422; x=1787914222;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=lEnvXfEMJ3q8d6QNi/AAV3stk1lN6HSf4sh7CE8qq2U=;
 b=hIQtlYo+vFV5bCsJwhybU4ekg1tJtvDqNQsLsmkr8dXK7QV2QYCspzBSX5VdJv8p5R
 tNP3WorrjzRjGhDPetlz3jaAV8DJPf1ZyuJxTnpcxnTduPELnGl/AmPA3bzX4EC3Sdks
 OAlDOVVu/bkTtGtB682iimQrL/E4Md8pKb+HqnTni1a7lkp4e3nwPXZekUOVqWOIRmFY
 rgtymcQpnN9WNtnLPx9Ut3yJ0q6J9IQClAVhA0rHSfJvN56X8BfjzBlxIR0nltl+j2ZV
 R98Tz+JSoqi+xgBFcfVecU+D3bvOdrKjfk9ji6n2CgwPrASK/nT0RhCJsK5EkavBVg6Y
 BOIA==
X-Forwarded-Encrypted: i=1;
 AHgh+RoqLgRMhJT5J1MxabBN9ewEIL/LaTVxtr9DBRLaOaDyhfyef3GYQsuRSMhNyTu4Qv3zh49w1wloDyw9@nongnu.org
X-Gm-Message-State: AOJu0YzqcHoK4LJKuHpIoZloa5kbq/qBVwa0mlJCYKrFe44xaDm5UvBQ
 sX+c5Qab5oblpKL66ikwb1FfWvPwA09iPYCT+Pi9DQg9Mp7A+soWi87RgTRpB7dIcHOMe71ed+s
 6iCzit9lfv5+1nWQ+ONCl//BExGTCoHj7CicDazn+bAXWbbFlcPknlMBHbg==
X-Gm-Gg: AR+sD13BqOTCtOIIsRI5qnxqSy0/6Vdn5gZQex9LPZSPLi6Y51BfspKWjR3b8PV5+4J
 baFLMvBqG4ycIP6e5CTLhPwq7EqGV2/pjdJGMmv/2f4kO8e4SEWNilFwIZNStOGltDpD0VP9PDm
 J4vi3UvuQUcHWr7IVZfWgkPocpPlMPqKOg1GKZT9xVzQCoyH6VWNjfgAZ/52RTRecqKx7aexH/g
 HoIdK/0gJYCKsFk6aHNWxhqr16gH1b5Hy+2fmYlHo1gL3YKESMkb6C3W26loJP/hczuIJFwDnZo
 89IkyuWeOzfKqdLhZiSiUKEGxvGi2jGBOSw5puoeYZqgjOSNNCR7AAJkkDhCqGGLbm9qNqX1xQZ
 OcDTsM2mdUPN3QoHLA/rlg2QjTZMlkETroTbKYgW2cA==
X-Received: by 2002:a05:622a:5816:b0:51f:20e1:137f with SMTP id
 d75a77b69052e-52df5766f0cmr48308691cf.19.1787309421989; 
 Fri, 21 Aug 2026 03:50:21 -0700 (PDT)
X-Received: by 2002:a05:622a:5816:b0:51f:20e1:137f with SMTP id
 d75a77b69052e-52df5766f0cmr48308371cf.19.1787309421594; 
 Fri, 21 Aug 2026 03:50:21 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-499b90d3046sm23917705e9.1.2026.08.21.03.50.20
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 21 Aug 2026 03:50:20 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-riscv@nongnu.org, qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Zhao Liu <zhao1.liu@intel.com>
Subject: [PATCH v3 04/15] system/cpus: Constify various CPUState arguments
Date: Fri, 21 Aug 2026 12:49:38 +0200
Message-ID: <20260821104950.32108-5-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260821104950.32108-1-philmd@oss.qualcomm.com>
References: <20260821104950.32108-1-philmd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIxMDA4MSBTYWx0ZWRfXyVTek2bFoFQq
 Bl7hAO0u5DjIXdXwtj8UlHJxFPTo01xHEodpUrfJVP4ebLvos3jaNLQs5P4I6PQ3PRctwu+ca30
 D1NlHLoR8ukBkK0ZbtpdQ47xu6kv8GY=
X-Authority-Analysis: v=2.4 cv=U9+iy+ru c=1 sm=1 tr=0 ts=6a882d6e cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=xPOHbBPGvMiCLs31fh8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: hIcDqNdTK0koj5QLYtkQ1c3sIMw27bFN
X-Proofpoint-ORIG-GUID: hIcDqNdTK0koj5QLYtkQ1c3sIMw27bFN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIxMDA4MSBTYWx0ZWRfXwnaGrDf8HrJX
 TplcNyNo38uah2YAg7B1yaodN+1oNWt8x3N0sQYDH2fhCuJingFkOngRZ03hSrtufXO65tbCS3G
 vUF0jno0vOfOEUd9BwJIvHaObaNxtGsd3Bb97uFw8PfRA64lXIg36EmVlWRlEsiWklVIaCaqDx+
 hfU9xQYP8RTDkmh+G6soWt+cp8qshtf2XObPYq6sKK3AOuFeIF3/dsqreD7OwPZtqALC95OnFEA
 045/3OzqGWhE5alBV4Nquwzy2ptZO4pMXkumN0+oH9mZC40EsTJ9B2s/sOkQajTnJbrz9v/d82s
 s9OSntPiwtrF4WpLAqgAC8+GI0ZMjdZvEaTih+2m1KQtRJqyusTF7/faXhtZFaV01pT+XMTmJLB
 bXyBiiHAh26C3lhOf7H8k4fwnCS81aAHAcAD5ON1H0XnJAa7jk6BBwRDp6RcgtEIaMvRqiyN4kX
 +W1PcFr+PkEhE7g09Dw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-21_03,2026-08-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 phishscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608210081
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

Mark the CPUState structure const when it is only accessed read-only.

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 include/hw/core/cpu.h | 4 ++--
 include/system/cpus.h | 4 ++--
 system/cpus.c         | 6 +++---
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 0b5bb81b35d..372485a2e54 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -900,7 +900,7 @@ void qemu_cpu_kick(CPUState *cpu);
  * Returns: %true if run state is not running or if artificially stopped;
  * %false otherwise.
  */
-bool cpu_is_stopped(CPUState *cpu);
+bool cpu_is_stopped(const CPUState *cpu);
 
 /**
  * do_run_on_cpu:
@@ -1007,7 +1007,7 @@ void cpu_interrupt(CPUState *cpu, int mask);
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


