Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 505C4C5CFDB
	for <qemu-riscv@archiver.kernel.org>; Thu, 13 Aug 2026 18:19:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wua0C-0002Wt-0C; Thu, 13 Aug 2026 14:18:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wuZzz-0002Nw-0F
 for qemu-riscv@nongnu.org; Thu, 13 Aug 2026 14:17:55 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wuZzw-00029v-8f
 for qemu-riscv@nongnu.org; Thu, 13 Aug 2026 14:17:50 -0400
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67DFTYoi2778996
 for <qemu-riscv@nongnu.org>; Thu, 13 Aug 2026 18:17:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 sfQPhzstlT3wFstnUDQR+/OGDWmf4BOlIE5Yj0Rzf9I=; b=LO5+V9GJKwL/u3SB
 hiqHpTZea6BHhcnTuECZnXdPEBPwkMxXVqE66wlDc63j40rvFePmhDw9iKJPRbOn
 Z+eo324Sinad8WjGYvFfxTsM50BDrXkiW+hBndrbJVl/IAuVMzivZlWMbeSOAiEP
 53Cljg/2GsoWxzwBX/HDmJ0+ZSb5+Vb7HtNQUNSIdpN0sb2nj93KI7Lbq8C4wE8M
 s3uGYqWqx/g2v4i89w5JZmfWzwHW355aTfA7yGu/SM4ePQ42xf7I93MtUrLzuh4y
 GhJzU9JKIi/7e/HJSW47KAzi21N6pJLR6TKh0hG5MDWjccNAN++IJhEltP/U+st8
 HVm5+A==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g1cb5j2q4-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 13 Aug 2026 18:17:36 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-51c1a97644aso2645201cf.2
 for <qemu-riscv@nongnu.org>; Thu, 13 Aug 2026 11:17:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1786645056; x=1787249856; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=sfQPhzstlT3wFstnUDQR+/OGDWmf4BOlIE5Yj0Rzf9I=;
 b=F3q2a05ESVdKWGydb/Cl/0x1QwoC3lCLW7FlCIlKXjBCgD7o92sr2Hse/AIco5UdVA
 cVjThgr0zaJpXrTSbXzNabj2iW76gUwNVqNWBVzFjZhzgfbZlj4wRNNYcL+YV3rE8Mi5
 ZNCLxIG3J1DTwoXehKivXgSIyuKoeYF24579kvdLdi0hVDTTWucajdOyFuJR2z/7Sy4h
 FrkWba5Rm0IRASxDc17DwY8gBjkU6GuptEX0HELCTQP5Po345lwI0fGlERabZJb5ZAnl
 f/zQpTRrhpClUZIvIbfU5458uymBUEj8H389emlv09jC8LmBt/l0j91nlNHSlEhErqmT
 o7pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786645056; x=1787249856;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=sfQPhzstlT3wFstnUDQR+/OGDWmf4BOlIE5Yj0Rzf9I=;
 b=gOnQqpZbCIUEuue7acPyBnMRecOiKPm9es+WTeoKWgBFiNJwzZVEf3gnZZgnppUI4A
 yQbkEqm4f6/q4erkO1m+j4475opbB0qNzap/ch0w/GzM1aDqdJHEnUzPlRnaVXXEe42e
 SMS/lJTcBDfbWIHTuK8hRZWhhdxG+WMep+hTKFM26Hu4DH4aygSoKquR7tXdiFlf066r
 Piuz9njbNm24GXG9zMHBDOU2KNkO4yngzzBWAostV0N4VDYUBxy0dt42D9I1D+7/yPt+
 y4b4Bh5aAlEMxoWENbZJEpabn6LGW+zwlPCRL2xyC+QFM677lL8kMeiyuu8Pbdw7MdK4
 kU2A==
X-Forwarded-Encrypted: i=1;
 AHgh+RpghqOVhtIKBVqkxi1PPJXrC8nlTb8tPB63r4FiRTaolanoRG0EyYQwOu6catWjeg/YgomMAqoXuNW4@nongnu.org
X-Gm-Message-State: AOJu0YzDBuS0Qpf6egW/0l1rWVtZ3HEYqRZ+rdfeSxtVWrs0pfMf2rX6
 83317hBLFcxYridQ9j8iJbvO1H7MFblOeGybkwSr2hYL8zXN3uymESqznh/FKF2dH0aua7q2+6M
 2s5hZ/r7MDC79JXQ8TVcTRH4Ekp1yQEq4gdtIJixvHSyiv+DbYa5Y6j7gVw==
X-Gm-Gg: AR+sD13zig5Z5Wex9AU0ko96aN19XGppFnMBR+sIIUud+LgckXoRYF4vLZRoGsUeF1t
 IsOXWpd2j7SI2wteBy7mtzDf/jxWsIBXsypYYQspLw243dxy5S68T33j/NJp/SbVAuyaFIELHoc
 fCgXaTlisSumspHHDSJdrElOnr34+PGIp0//Lt8IeDR47/WzR8zJeYbEyGdKD71bD354/ojsb5F
 4sPZghnIu51pR4+196ZKm/TyjjAcnK3nrlf+KME8xsRzbycsKZQ0chFTp4/t93uVEyfAkzGTBaH
 dBN1TY9vhTkG6CPqTTzbeNnd2NIJBAhGkOwByq9BAtpZU41r7h04B8i63GFG6O+klsSUT1ID5zb
 SKDxCx1qRMgjvL70MO64oX+TLtorcKlHuYDK3xn3uuQ==
X-Received: by 2002:a05:622a:1a8a:b0:528:3471:937f with SMTP id
 d75a77b69052e-52d73d3724dmr92390011cf.29.1786645055396; 
 Thu, 13 Aug 2026 11:17:35 -0700 (PDT)
X-Received: by 2002:a05:622a:1a8a:b0:528:3471:937f with SMTP id
 d75a77b69052e-52d73d3724dmr92388851cf.29.1786645054663; 
 Thu, 13 Aug 2026 11:17:34 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49981b0f4afsm97444205e9.5.2026.08.13.11.17.33
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 13 Aug 2026 11:17:33 -0700 (PDT)
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Zhao Liu <zhao1.liu@intel.com>
Subject: [PATCH 07/16] cpus: Document process_queued_cpu_work*() runs on
 current vCPU
Date: Thu, 13 Aug 2026 20:16:30 +0200
Message-ID: <20260813181640.6537-8-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260813181640.6537-1-philmd@oss.qualcomm.com>
References: <20260813181640.6537-1-philmd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: R22b1AkvoRKDhRyG6B8VkCxGqo2OnXT-
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEzMDEzMiBTYWx0ZWRfX/Fd43/EFdA/C
 1lx0Pq1SO9SxtmVES3Vt+SwUuVNAwPiiIkLMQWVGQgLHfOnPJNnPCPXllUSsVuQwQMEpxiQ2T/g
 LtLrZOO2T5yk/b/GR4uuZZqQNKgALxs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEzMDEzMiBTYWx0ZWRfX0USrBylkWuuh
 E10KcJZHnRA8qYE0Y+F+820QMuz2dwaPLUYWmxjKvJ2VIqyCnwG5RfzK6RHbWsWd+15SqhZE56t
 xgNXXUC89erewe5lkFOKUGPnK2K1AQbP/vktLslOYe2AMUmMWpwaAmJWTTO4IDO52gf1gpmBRCz
 O3agHNbh18JmwyS2nJWApdypwDg9Xd5gDEDbvK7AoN3xbz1HcuMyt5/DxXqwoRS43G+QKKUUfmM
 ES8MJA/kemlhpzsdDtzLljyDMmk3Un8eraO3qYy1DHa9X+YUk7iAoMFUgzmmCMoxqhREjoyl5iy
 GiwEXtpy2mSRY3j4ka75JczEiPAFa/yRwPnuQruew7H/MPRg4X6RBih3dssKtX1aU0sISp3UG8J
 qJd/nFkrM+2Z0MW3IS9y/rVWe8bbSthar6VRjbIE6xA/502STImjAU53Qot+3BCtFRntSBf4W/j
 T91X6SkXZCLHsJ8Nrmg==
X-Authority-Analysis: v=2.4 cv=GoNyPE1C c=1 sm=1 tr=0 ts=6a7e0a40 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=--_MrfCweEvJdlqdJWAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: R22b1AkvoRKDhRyG6B8VkCxGqo2OnXT-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-13_05,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 adultscore=0 bulkscore=0
 impostorscore=0 phishscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608130132
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

Mention process_queued_cpu_work*() functions must run on
a vCPU thread.

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 include/hw/core/cpu.h | 4 ++++
 include/system/cpus.h | 1 +
 2 files changed, 5 insertions(+)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 7da81f3ee85..183ef9f4ef2 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -1081,6 +1081,8 @@ void free_queued_cpu_work(CPUState *cpu);
 /**
  * process_queued_cpu_work() - process all items on CPU work queue
  * @cpu: The CPU which work queue to process.
+ *
+ * Must be called from within the vCPU thread itself.
  */
 void process_queued_cpu_work(CPUState *cpu);
 
@@ -1179,6 +1181,8 @@ G_NORETURN void cpu_abort(CPUState *cpu, const char *fmt, ...)
  *
  * Perform accelerator-independent work after the CPU has left
  * the inner execution loop.
+ *
+ * Must be called from within the vCPU thread itself.
  */
 void qemu_process_cpu_events(CPUState *cpu);
 
diff --git a/include/system/cpus.h b/include/system/cpus.h
index 2365c7c4597..0bdb231b996 100644
--- a/include/system/cpus.h
+++ b/include/system/cpus.h
@@ -17,6 +17,7 @@ bool cpu_work_list_empty(CPUState *cpu);
 bool cpu_thread_is_idle(CPUState *cpu);
 bool all_cpu_threads_idle(void);
 bool cpu_can_run(CPUState *cpu);
+/* Must be called from within the vCPU thread itself */
 void qemu_process_cpu_events_common(CPUState *cpu);
 void cpu_thread_signal_created(CPUState *cpu);
 void cpu_thread_signal_destroyed(CPUState *cpu);
-- 
2.53.0


