Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0367DC98302
	for <qemu-riscv@archiver.kernel.org>; Wed, 23 Sep 2026 17:17:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x9QaY-0001m0-2r; Wed, 23 Sep 2026 13:16:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x9QXk-0006f1-9C
 for qemu-riscv@nongnu.org; Wed, 23 Sep 2026 13:14:06 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x9QXi-0001OJ-Af
 for qemu-riscv@nongnu.org; Wed, 23 Sep 2026 13:14:03 -0400
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68NGTh95217677
 for <qemu-riscv@nongnu.org>; Wed, 23 Sep 2026 17:13:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 VscxCLnI2dGnGBzBwxcHvgdrFWZJrGl9KKZv7JgH7Xc=; b=X8CfVDa6uMDQ/2jq
 TFs5twY5EcHA+4Ngete2R3F+/zNXqH/rJ1r880J9xud5fc7AZbZBWEYfniZLatc2
 1QJak11Q6AmdbUe4kySQg76ygT4tPN0IM7RYGsZCTRQanpkNOSnBNIASyTX4i8JB
 qbH5wPZSbbx+UzDqtYrWevXlFBrZvm8JX8BHCzKHUZ6/RdGlpcObZkBk2GZz7NTV
 QuCJiahkD7irE5pJSLwAIbaHZ4fD5T1FzWAum/v799ZstZNXGBy3Iia6C8gF3ezm
 i/0JGfAkF+bSsxi9L5E37CwC9roAS/sShrS+KbdZv9ya8/7CeLrN/qXknnr38ZLc
 VW2SXQ==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com
 [209.85.217.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvdb61mke-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 23 Sep 2026 17:13:50 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id
 ada2fe7eead31-788e076423aso332038137.3
 for <qemu-riscv@nongnu.org>; Wed, 23 Sep 2026 10:13:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1790183630; x=1790788430; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=VscxCLnI2dGnGBzBwxcHvgdrFWZJrGl9KKZv7JgH7Xc=;
 b=b5eCe3asfUCsbeQmQKlPCd7eVBSVvkI2I3uSIAfqAdCxDeYkVlLw8UfmQ/xLQe76o0
 omtcMHvEBEj4LH/UraPhNMIIiIE3t2Uk8DydR9XcbP9sfpquqJgCjjWI+7/jkZ4J8IFT
 +hAJKGVP+ajBxHIJx0YHDq3O/U1eupmZUAUj6aBKqH4LHLJjwn7vlxJCh41qmDKOpaI7
 k3Ze3UQ6JyozsgFS2aaxOy9gmFCV4pV5jX3e5l9fjza+XtbqEVL7Tpmz5uBvr3+pFuF/
 yjzfH6+SQHrXpdtQlKC2NbPMLmIOp2yshXtW6lXTdR876PHoRiVtrAtcgbyKmvph70Vn
 ePdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790183630; x=1790788430;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=VscxCLnI2dGnGBzBwxcHvgdrFWZJrGl9KKZv7JgH7Xc=;
 b=N+m1alkU6jJdllpFu6dLssCsvOAuMcHeLUaPgfkBT53I+HEETV0iY+1TVxezhMMZ20
 arsnQ0YnNI6+t9xUcJx2AmlqwccJMzdW+ra+eVbBGL0qoaD0WkRfRWZGfWaytqlnK0+Z
 Qxjv4aWV+1il6yk51TGuEx61KOfxnOb/jNhaqXPZTLPTgBox/wmwJBvmTYcKYHGcbdFi
 lApXE2Mcdkic5qPMzrQy+O5j4FfOAfZtf40BGlM+4vQ7R8/Vk8GJaMf7B0tWpRmtNJ9M
 hqrAQUK4OvJNEPeXPBRZU2qyuWXdee4AqyEjpxKwe9PZn/Gy895hF6Xhx3H9CtVQKiyZ
 B7Fg==
X-Forwarded-Encrypted: i=1;
 AKwUvBzC2kd2zxO/sjvqqGbTt4zf4DDBWDN+ufPNVjcnyE+vklcTEwCMCbBqGImryDC/uu35SnWMvyLAUO0A@nongnu.org
X-Gm-Message-State: AFuF++n47ZplqGUOhcJucxc28V+eGXtR6Giyez1Q6WJJ7gys/QAx+VTy
 HaMNeglaNdRHJQ9cf4pfbXmDTYh4Hofy7SZxdgfXSUubjaLT3Epd25BRmvEANH5V6UG1PkI8w1G
 3W5G4iT/FbHfUT+cJkTsmlc8Pu16BBjzaw4sqQUlgzyT3Zz5kyx4Ga5ktWA==
X-Gm-Gg: AYBFou1LCJHqztWbtJJ2e3X2D2KCn0x8eHYW4yEePwTDFYdoVPYreZKZFXaVpFd4Xll
 Yd4PUjpQOzHzz5aZGpbtUAwfNSYrFl1n/D3aqX8gnftq4kQdEoIgGzXGlHDxAV8VQQY51aud2b5
 feJFuGxnSWEAfezXMzsEnerZUqhBPx4tCvuwEWPE36kLT7T+RiCTJcvuIxlM1ZknQEOZyfRaafV
 WEYtIieN+GFLisOJ4TTxN7N4QNoAG1i2moh3JYJsupyfD7FAD7rY0GT2+VtLvGD2nO8x4QR+4JA
 +DZ6CWcJc/iyXj0x6Pu1d7+iyoDMayy8f66HjuBTwmjUMe+YThdYDFcyOz427P11tHVF3AV2yIK
 kvbLCvSgF2ezV0fHs7MWq6umbgupjQ35YRNUTPbq0
X-Received: by 2002:a05:6102:f97:b0:7a1:f7d2:e832 with SMTP id
 ada2fe7eead31-7ac1d4ed253mr2983807137.18.1790183630237; 
 Wed, 23 Sep 2026 10:13:50 -0700 (PDT)
X-Received: by 2002:a05:6102:f97:b0:7a1:f7d2:e832 with SMTP id
 ada2fe7eead31-7ac1d4ed253mr2983785137.18.1790183629496; 
 Wed, 23 Sep 2026 10:13:49 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48868886e45sm8590301f8f.31.2026.09.23.10.13.48
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 23 Sep 2026 10:13:48 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-riscv@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Subject: [PATCH v3 20/21] target/i386: Use generic halt transition handlers
Date: Wed, 23 Sep 2026 19:11:14 +0200
Message-ID: <20260923171116.31276-21-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260923171116.31276-1-philmd@oss.qualcomm.com>
References: <20260923171116.31276-1-philmd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: BIzG6KvKO6M3_hHMDl_S_FcTxaiR6_Dw
X-Proofpoint-ORIG-GUID: BIzG6KvKO6M3_hHMDl_S_FcTxaiR6_Dw
X-Authority-Analysis: v=2.4 cv=QeXzLcbv c=1 sm=1 tr=0 ts=6ab408ce cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=xWu8-Agft_6X_INOG6MA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=crWF4MFLhNY0qMRaF8an:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA2OCBTYWx0ZWRfX3xkG6agU1XRj
 ltefh4ozqSW7ECfGHBT7j4+P0YMyiaGTnpe5yMMtNVcr14QHmtl7rXEapbxCIDpou+7XIje30ql
 HGm8duo6jsAPHBNPw+PYIfkaV3b2iHg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA2OCBTYWx0ZWRfX1/aSbJDDIqom
 0KXKBUEyOtDEz5TWhurZMnaH0xggGUeScXmmaJJqNCa5Ir7uoLtCCldpHx7/xlfIrK0NSPTR2eQ
 jGDlt9nX0sGDM0iN+h2ERWIovtmuD4pCECTZ6+QwxACv2kKhzPUDUcFZTOGMm/7+Ps7g5CwvSzf
 qtq3JxIgCAx0Gn43UKHgIHy61jAry+Jd1t6FTC4/nApWqUOeaSyF8eDxnrcqnZQnvDhBlX6EGTR
 A7/OIIev+Qci3f1LFtTDqNfDBAqd3lDWWWi2GhyoPAEhPN69v/bpf2vhrGOPbIMiHEn83Bam7Nf
 x588nmKQyIRFrFZonQOP0TUWnjHJpu+hquCcmJR+OfswbW9I1iT1o1x0x8ncbfQ0BQrQVxWdkkP
 +F6HHZLaV7OQTIifj38uwPx/aqwFr6A6wYf8NOwh1XlnrM6JAoXujJxncX8kJVkmPR/aoffTlca
 xoHD64oKL0EwlXmMtxg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_06,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0 bulkscore=0
 impostorscore=0 adultscore=0 clxscore=1015 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230068
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
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

Register x86_cpu_poll_during_halt() and x86_cpu_leaving_halt()
with the generic TCG halt flow. Remove the target-specific
x86_cpu_exec_halt() wrapper.

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/tcg/helper-tcg.h        |  1 -
 target/i386/tcg/system/seg_helper.c | 11 -----------
 target/i386/tcg/tcg-cpu.c           |  3 ++-
 3 files changed, 2 insertions(+), 13 deletions(-)

diff --git a/target/i386/tcg/helper-tcg.h b/target/i386/tcg/helper-tcg.h
index 96accb30a80..4d543556a9f 100644
--- a/target/i386/tcg/helper-tcg.h
+++ b/target/i386/tcg/helper-tcg.h
@@ -38,7 +38,6 @@
 void x86_cpu_do_interrupt(CPUState *cpu);
 #ifndef CONFIG_USER_ONLY
 void x86_cpu_poll_during_halt(CPUState *cpu);
-bool x86_cpu_exec_halt(CPUState *cpu);
 void x86_cpu_leaving_halt(CPUState *cpu);
 bool x86_need_replay_interrupt(int interrupt_request);
 bool x86_cpu_exec_interrupt(CPUState *cpu, int int_req);
diff --git a/target/i386/tcg/system/seg_helper.c b/target/i386/tcg/system/seg_helper.c
index 566b3d4d80c..e24d01000ad 100644
--- a/target/i386/tcg/system/seg_helper.c
+++ b/target/i386/tcg/system/seg_helper.c
@@ -157,17 +157,6 @@ void x86_cpu_leaving_halt(CPUState *cpu)
     }
 }
 
-bool x86_cpu_exec_halt(CPUState *cpu)
-{
-    if (!cpu_has_work(cpu)) {
-        return false;
-    }
-
-    x86_cpu_leaving_halt(cpu);
-
-    return true;
-}
-
 bool x86_need_replay_interrupt(int interrupt_request)
 {
     /*
diff --git a/target/i386/tcg/tcg-cpu.c b/target/i386/tcg/tcg-cpu.c
index 6f5dc06b3b9..2fde412394f 100644
--- a/target/i386/tcg/tcg-cpu.c
+++ b/target/i386/tcg/tcg-cpu.c
@@ -180,7 +180,8 @@ const TCGCPUOps x86_tcg_ops = {
     .tlb_fill = x86_cpu_tlb_fill,
     .pointer_wrap = x86_pointer_wrap,
     .do_interrupt = x86_cpu_do_interrupt,
-    .cpu_exec_halt = x86_cpu_exec_halt,
+    .poll_during_halt = x86_cpu_poll_during_halt,
+    .leaving_halt = x86_cpu_leaving_halt,
     .cpu_exec_interrupt = x86_cpu_exec_interrupt,
     .cpu_exec_reset = x86_cpu_exec_reset,
     .do_unaligned_access = x86_cpu_do_unaligned_access,
-- 
2.53.0


