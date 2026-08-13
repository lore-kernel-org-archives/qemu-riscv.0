Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE8F6C5DF6D
	for <qemu-riscv@archiver.kernel.org>; Thu, 13 Aug 2026 18:21:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wua17-0003w4-Ft; Thu, 13 Aug 2026 14:19:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wua0d-000308-J5
 for qemu-riscv@nongnu.org; Thu, 13 Aug 2026 14:18:38 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wua0X-0002FD-FK
 for qemu-riscv@nongnu.org; Thu, 13 Aug 2026 14:18:29 -0400
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67DFU46g2375684
 for <qemu-riscv@nongnu.org>; Thu, 13 Aug 2026 18:18:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 JzbDkxS3itZNpjD41FPb0w8HQM5ewTacpZ4P5EQ4taQ=; b=oUWs89iLelCmwkJ/
 Mvy/9ND+MihY70Nc6KbUpVGUUH9SZanld6qEdOQpJfUiGQtpvgJXsY97kAahP9U7
 T3WWqw1+UizKvIh2yYs2Iws+/BuiD9XBdPi+afda9TrNUZB4e+YkX0oNIgwHNW77
 mS7javzGCJevOC5tK8v9B5UrBBHwlYwcWC91pEqAhoxGROveyGYnuXZWuajxpKVv
 +2HCK70OJSYgWWC/3W9/XpardUkR7hPmgN51vo+Ve24lW2eWHPFSpGdX7x9zHy9W
 RGQq8tm2/ultltdt5+qNZghqsn4uQq5TjqTqjHaYGC2iE6+yHoavzZYsM7B5p+ME
 T2CBkw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g14sykxpe-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 13 Aug 2026 18:18:12 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-51c1b4d961dso849541cf.1
 for <qemu-riscv@nongnu.org>; Thu, 13 Aug 2026 11:18:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1786645091; x=1787249891; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=JzbDkxS3itZNpjD41FPb0w8HQM5ewTacpZ4P5EQ4taQ=;
 b=IEpJMRpGWWYeBP4ghDUJKSEJXU57gilw4/EvNhNPeK0+UyXNV1+BrglSTImAIhX26r
 Is3mguNAyQy7XrsfU62UqQvDMCDYB0ALL4fj54ISFrWdtUHPAapDKMHcPxspoWB9kUhS
 HkybrQZlEYs874soDUGCZ1pdOz5gJS60HJCtBzkNDIyB7rOcg27eVRZiydjH0NLxRD2G
 BTjy0o26+FNVdGei+nUZb2YssXu8gqEYh0wbOCa0aY7miSxQ13WoD3fmonfxf26kagLN
 nil2FfKVqkQ6v+TFsW9krBFpVUPCee9l1MzQF8jOg9WSnuQmmEHR05Aw9Atf1cxzBLFV
 yFWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786645091; x=1787249891;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=JzbDkxS3itZNpjD41FPb0w8HQM5ewTacpZ4P5EQ4taQ=;
 b=XIAZ2fODGtJu5f89Xoa4/UNkgt7K9M0GPYPJII6ZDzhYYvb6+h1SEiT/jXa8v1ySTQ
 8eAYCeesmJHK2QvgqHtgsF1zdmWLve2PKY/yC6aTYw4e6+nabRijPLd4zcvbCcGKAxDM
 5jqOS59BqAvhDvf4tseCWxa12mCj/hLwIInFphid9QLxS8Lo8EUu0i7CSDGmcXp4D1Ha
 y5xYq0VzV/Q8yVrSl7YpNFVXPETzi80PsEH+2aTplTAqg0kWciMcwL6dznIo4MpPLnd/
 2Tv1gvX28OX7910GZRu37MpuslUpTK7ezHhatnXLtHaV8k2FlXekiQWEuFOWgJyHDZEh
 tGMg==
X-Forwarded-Encrypted: i=1;
 AHgh+Rp/URf2No5u/0yVmH/uIQgVdQUN5cRAQ09vtFkYDrKavY0BMYmzM7yPFUobn1pVXSzhUbsTytp4Hyic@nongnu.org
X-Gm-Message-State: AOJu0YyphKr7pZANaZ1s9RtRV1DEDf3f2ZSiwTC8SZWUw/isewm4l1cI
 xhOAa6mzmAxx3lHGIpB/lD4Ul+iOQc+Zcj1zODZzkV1BP9rQ3U/f0o1yVjRgv/zIItKqHiMHeEt
 CR/Hlcn1jA3dYb4HFlCoOerTX5fMhrp+bqvQS/8z1ufbigcpI8yc+2S0uMw==
X-Gm-Gg: AR+sD12d0ZovjEzX6DI3DWwYRKcc4AhF7X16UKJR57RAQ/wHFaQATbj48aZFGgtpKB2
 Cs1f3PepNpUV/cQl6gvtVCU/D/fwvAtyC/CkRZJnLyBUggPmIQ02JBkJmIm3wNEJMQ3QJPutALB
 jChOQIZKpDm7kbHcojYcdBrUhvNmSyX1za27Y416FAyE4IIitSYAJ0E/HdFrpoNQzhbxmqLGGDY
 dbkCU5RLcxpB7To3S3Xs+W5pce6ySaa6oD0nc5fffbZuDisWXat/QMr0mtZC14apRkR3AN+yTQX
 ivfNiRqdXiCwej/xpYjKk7Co0Ql+HyorxSrXrwPwKatW2ihYDXaS7PCOBaCXbWNvZe37TY37h87
 YAdPhC+tGmM+SfbCXdDEXMVURpD5slB9mQ78dHmRf7w==
X-Received: by 2002:a05:622a:5812:b0:527:7756:3ee9 with SMTP id
 d75a77b69052e-52d748bf7c0mr76996031cf.0.1786645091511; 
 Thu, 13 Aug 2026 11:18:11 -0700 (PDT)
X-Received: by 2002:a05:622a:5812:b0:527:7756:3ee9 with SMTP id
 d75a77b69052e-52d748bf7c0mr76995381cf.0.1786645091089; 
 Thu, 13 Aug 2026 11:18:11 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4815f1fff25sm1953402f8f.3.2026.08.13.11.18.09
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 13 Aug 2026 11:18:10 -0700 (PDT)
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Subject: [PATCH 12/16] target/arm/hvf: Move flush_cpu_state() into the inner
 vCPU loop
Date: Thu, 13 Aug 2026 20:16:35 +0200
Message-ID: <20260813181640.6537-13-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260813181640.6537-1-philmd@oss.qualcomm.com>
References: <20260813181640.6537-1-philmd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=ZcQt8MVA c=1 sm=1 tr=0 ts=6a7e0a64 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=xMUYw9VpK-qeDZ3ugSsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=O8hF6Hzn-FEA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEzMDEzMiBTYWx0ZWRfX/50TFBeTPC4e
 Su+fthpo0zUiujEsvyaEWO/ZpGTzDB/1sGmQCcF+oR0Ht/tj1KA9RCGc/3P5vyabKmBCdWICxIr
 /9Q7gesQzukpodx+pF0HB0wSFEPbQACGBqBa7GaUpm0kv7DXRSoiw5H9vLSa7APcimqkN0TS21U
 DnCJzu/Rfue2lwWbOv3htfShAGdST22rRnjuStwaqiF3OA7m9gbYC2SuzMJ0ArFjP4IPhR/g40T
 4nsoHpCHKx6jdRCeIkQWFl3q91Kbu7Q9n7Hwu+LeqUt0N7XIrgDNHD7r8131n6lermD+wLHF6ZP
 MIHHMK8gtCFNMwLZb/W1PoPyPUngxfBAylDUU/dt6vr4HGp7nUFHyb2bNtdjz6BsiEBBG11e38V
 njuAoNBTNIWXrNMvAJiA/HK29S1evUZEXjiQENvpxb+eUrjH3aOgrWMuuwa403WUqr6g/XDK8Hp
 qUiOywi+cmaWaoSgWDA==
X-Proofpoint-ORIG-GUID: wmV9bax2vTuNkEw0mNGB7p5l-CuSNvzT
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEzMDEzMiBTYWx0ZWRfX0G+GY18bS01p
 yueR3OpRZyEkSkrKHSIvpsyc6aHbPf0eboIEvmcTmCsYldnV3JZFBPUyFVIit2ORZQkjjmaNFlk
 x3Zhpd19CcELY2tc98Ntn3MWYT1APXA=
X-Proofpoint-GUID: wmV9bax2vTuNkEw0mNGB7p5l-CuSNvzT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-13_05,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 malwarescore=0 suspectscore=0
 adultscore=0 bulkscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
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

To ensure the vCPU state is flushed on each inner loop iteration,
move the flush_cpu_state() inside it, right after the interrupt
injection check (catching any interrupt changes from previous loop).

Since flush_cpu_state() uses CPUState::vcpu_dirty field as a lazy
synchronization mechanism, there is no performance penalty if the
cache is clean.

This got missed while refactoring the inner loop in commit 93ac76507.

Fixes: 93ac765076a ("target/arm/hvf: Keep calling hv_vcpu_run() in loop")
Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 target/arm/hvf/hvf.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index 3eeb9f70de4..c14ea54a67f 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -2598,8 +2598,6 @@ int hvf_arch_vcpu_exec(CPUState *cpu)
         }
     }
 
-    flush_cpu_state(cpu);
-
     /* Inner vCPU loop */
     do {
         if (!(cpu->singlestep_flags & SSTEP_NOIRQ) &&
@@ -2607,6 +2605,8 @@ int hvf_arch_vcpu_exec(CPUState *cpu)
             return EXCP_INTERRUPT;
         }
 
+        flush_cpu_state(cpu);
+
         bql_unlock();
         cpu_exec_start(cpu);
         r = hv_vcpu_run(cpu->accel->fd);
-- 
2.53.0


