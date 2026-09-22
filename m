Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3BCDC982FA
	for <qemu-riscv@archiver.kernel.org>; Tue, 22 Sep 2026 16:54:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x93kq-0000Ju-Ce; Tue, 22 Sep 2026 12:54:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x93iY-0004wD-Dz
 for qemu-riscv@nongnu.org; Tue, 22 Sep 2026 12:51:44 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x93iW-0002er-QT
 for qemu-riscv@nongnu.org; Tue, 22 Sep 2026 12:51:42 -0400
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68MEj3MI1423097
 for <qemu-riscv@nongnu.org>; Tue, 22 Sep 2026 16:51:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 VscxCLnI2dGnGBzBwxcHvgdrFWZJrGl9KKZv7JgH7Xc=; b=ChKu6M/nilbqAG88
 +QkAVSbvSgdk2eZaMlAxiP6wj7pmcnXt0SxBm9CJoplqN4uckdAOHlm4kIJinIrB
 5dl5hSICeQzRObkUaMSFvVNEfK5AtoGGMNkgnsZSnFTMn44nn+g+uyfyMuqVnH3h
 DavUOlvggdcNMtfPuZJT5yvFC19bED6WlhFARUDkqzPJe3dKqRTOXy2fpvpUmfo6
 /um6z+QpIlyL3o9zcqiGODYP5dUuFETbyYWs2OvbhTraTORm8cXIWGK7q3t1TRMI
 UwVf0H9Rd50kt1NXT902uqDAqhHyaChx4jwQYz+yLrl2r/rLMDlZUVyeh6GoI1T8
 uWOm8A==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com
 [209.85.217.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guqk4suh7-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Tue, 22 Sep 2026 16:51:39 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id
 ada2fe7eead31-78a5a291af3so7417137.0
 for <qemu-riscv@nongnu.org>; Tue, 22 Sep 2026 09:51:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1790095898; x=1790700698; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=VscxCLnI2dGnGBzBwxcHvgdrFWZJrGl9KKZv7JgH7Xc=;
 b=F0qIQWHwDDwZe3tEssYYcEuZ7apShkN5Wp36yzICzyEPNqLivE82ixPIzLY6JpsXR8
 zjaV7cFMP3brrkx8rzgeta/xtiQzvYeLAmyE35XdijNeHeDu9XL1EBrAgBtEdFh6IPc6
 UfdMrqZ93iQdBLeJCtnb12WgX/djrPg9Y4s6OOtxRrkvAcxOm7oiQfmajzcrI6cbunnd
 WBfBZjxcAbfLyihLKyf3rPStwWYt+XQOJcYBcLxqRAvty6YPrzKVWFZMpT1s4erd61No
 phMZFellbcHT4/AJ9zXJmSFKdBa3lD3KnJFg3BHeVaRVMGxLeWLeXFMFTgrYO+3tQz3z
 FlzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790095898; x=1790700698;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=VscxCLnI2dGnGBzBwxcHvgdrFWZJrGl9KKZv7JgH7Xc=;
 b=PN8Kdr2K+gTRVdFmJtNS9bsQu3D1+neOHmMeJ7Drz0frWJ5L+pq5kjC3A7HfbaEFKU
 UBeaMm7aAAAttZH/FF4WqOocMcnP+6kY+tgc4r6RENF8jjnwZRzKYbnmBm/c8tMp9K+X
 6BPbmuCb3wmVT0HDgMbM7SXZPWMkGukmrjy8YIagatA4epRbdZWlC2kIJCizbr/xeDGu
 hDSr7rDiGQk+3MFhwwvLzM0kZX6S766200MZNDPY1xgOP0AQLYdt7yyGQLR3cp8ykffs
 hPZCRTD5lri/3yGL9FAGrVb4SUrP4yqKV5eNNcYsb6sJxtuMwd23dshaoQZZHA2CBazB
 +2hA==
X-Gm-Message-State: AFuF++mPqTzl6pGnTkXh8g9tJ7KY3yQtk+BntQMbcL4THKrGMiBcJ2ot
 Emm1sl15+PSTt8Xlm61keDKbTFbd3Lk8MVrMtSFdoaZScmZ412WBQwZWGuvJ3H1lbjb1LFrccgC
 enzlXGmbM73sw76mwJK2FeWsKZBb54DZKr10itXv/zQg9hjy6U2SXHcp+EQ==
X-Gm-Gg: AYBFou3W7u8KF8nW77rQGJHjvp+fvtUaljo06v/gLB20MMN7cB/vOVydBs42eIHXryc
 mN4RXdnrTqXj2a5Lmtwsjov0bNImiTlQGbsV8mDUcdrvcZ7AGILBxAQVNU1FHTkI+JrabeGv59B
 z2pvANXzO/EShL+hjlYP63QnTxqtWPxzpRyq93zRNp3un6THPgQnCIWGI3Z4e8gEtS028bmgpuH
 wbXwQOz3SD6PBitKSIzcGtsAHaPteBkWn6MZDzSKo4O3rD+JBpUA7q4fKVBgBy2Rnb/2bFoXVTV
 iGL7pHV29l5KSjW8KnxJKBq0GKO4w+gfZJfkNPKWTw5wK5NXVyWAOTQsFsigakxK0mTfwp7uDjt
 RWg5DTucMHzSGqkwCeYfk8H/jgfxw0TNbGnH06Je1
X-Received: by 2002:a05:6102:8007:b0:7a1:f7d2:e817 with SMTP id
 ada2fe7eead31-7a55ba4d3eemr10035476137.16.1790095898055; 
 Tue, 22 Sep 2026 09:51:38 -0700 (PDT)
X-Received: by 2002:a05:6102:8007:b0:7a1:f7d2:e817 with SMTP id
 ada2fe7eead31-7a55ba4d3eemr10035444137.16.1790095897665; 
 Tue, 22 Sep 2026 09:51:37 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fdab0c240sm44540925e9.4.2026.09.22.09.51.36
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 22 Sep 2026 09:51:37 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Subject: [PATCH v2 16/17] target/i386: Use generic halt transition handlers
Date: Tue, 22 Sep 2026 18:49:34 +0200
Message-ID: <20260922164936.15189-17-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260922164936.15189-1-philmd@oss.qualcomm.com>
References: <20260922164936.15189-1-philmd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDI0NiBTYWx0ZWRfX/5nc1gvgH0KD
 gFfsL+SzXrjxzwixedyoCBiECuWBQtHxgv2BNPgqkymd4gsEHuJF8HyS+zlzUHHwHqbnM4IPPPk
 Y0Sjr3xB2WkV1sfCpFl8ONxydA3KYZC7ckhyarUn30NWCBQcfnoCL1N1LhxmVFo+Xp5+LhP4l+s
 F/Pf+2FXU+bKxkkbrKJ8bKs7qrlatTQMdBB6ab7/KSOeGtb6zsoijkBO71+4vWMZZkSoZ6QZmNw
 QkvIU+GCz2dbQ2mCZ/kOCctagZUt71SVi4j1HEoC8OrvspJlPnOhHKojH+OGLWVwTmcPwBE+Saf
 qRl7EerD9fihAYXV9I+5p0P8HlD4+WiH/wRdKHI1OLpZLBveOfY/TO32f6VHQ49ivtV1x5nvh6r
 dkUTBlufS6t5PyHESk+BZPE0XQqFmljHTNTD+ZDavby2un8SM7XVGkNHsT4BlI5Bgn6fXgLqEDQ
 TMjTv7XQqHddIJHSfJQ==
X-Proofpoint-GUID: w53W_pl69oR1u4xciW5FpiHfNZQN4mxY
X-Proofpoint-ORIG-GUID: w53W_pl69oR1u4xciW5FpiHfNZQN4mxY
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDI0NiBTYWx0ZWRfX8s4kmp8vcUhV
 urccs3/65UQ3Pn0WAQUxYbJccLEIWV5wXTCrP4LGQGf9FExJ6BYypvv8akhzUTy+pQcL5zqTvpQ
 JzmaTZBQxsbwM4CTKplTi9ppwiHOaoA=
X-Authority-Analysis: v=2.4 cv=XrVvqlF9 c=1 sm=1 tr=0 ts=6ab2b21b cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=xWu8-Agft_6X_INOG6MA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=gYDTvv6II1OnSo0itH1n:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 phishscore=0 bulkscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220246
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


