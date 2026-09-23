Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F7C7C9830B
	for <qemu-riscv@archiver.kernel.org>; Wed, 23 Sep 2026 17:17:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x9QaT-0001Ni-08; Wed, 23 Sep 2026 13:16:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x9QXb-0006Wp-U2
 for qemu-riscv@nongnu.org; Wed, 23 Sep 2026 13:14:00 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x9QXa-0001Mn-Ai
 for qemu-riscv@nongnu.org; Wed, 23 Sep 2026 13:13:55 -0400
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68NGU4Wv3106277
 for <qemu-riscv@nongnu.org>; Wed, 23 Sep 2026 17:13:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 NMMUYlRFOEu4Y+0NjhX8Ge/q9RoTfSWrF7SafoChtWc=; b=fJGYs3VPFpDR1GkG
 5Ms5UCqNUru+3di6NMJKOgYye1y/etGby4orSJZ8Squw2YJMzvGKAixxBYvCPKZ6
 ZYYr+cwooZ69oxuGEWYI2fTaBcr1KPyUgoBwaZFaMm6tGfIlG82N0iil+OreNiuw
 vFEH5HzM0Yu3mB9oDzFXRvvt9pGwkJrMYzDZKHju2eJkVFBlPAN8mJ6SkSztdS4R
 8dduiOk6buUQyL5DwkywCHd/ICJkCH94IZPaTbK8okAR7yOX8Ggg+pt+TOlLlpQF
 UzaI8IawwxJ+4p7bydE95scWMDRbdG4+RST/1mkRiXZcqsFLQrt2rbLrwF/k+At0
 PEeNCQ==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com
 [209.85.217.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvfmwh157-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 23 Sep 2026 17:13:43 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id
 ada2fe7eead31-78350646d7eso66522137.1
 for <qemu-riscv@nongnu.org>; Wed, 23 Sep 2026 10:13:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1790183623; x=1790788423; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=NMMUYlRFOEu4Y+0NjhX8Ge/q9RoTfSWrF7SafoChtWc=;
 b=AIsQrkRNhMMdmBF57mxstSIWACBBuSwFevrAkdpcXbew7nof6SitDnfK7/+b7hZdnU
 COSwHWpTu2naw/h8S8obV4fLJ8+BcmKVC3z0hgaq0CF4mOitLRumXF+QMzGWJS2qjWPO
 Q6cMlhqvKBKTORbjg365zKs5ea7QYFCp4BkRE31mBw7+7Z6DwlDn//RWcKYwPPFrlcry
 OnXa3W+NM9Tcp1r8EovpWi60eyJMThGO3WPRhM5lvs4EcWUCS3lIiv8IHkG2GEgLeZ+L
 4WrV9l8tQpxsL9NT9sJf1pC5ANurGaaeZxgXGcD6BR7DV/UDxz8Tx4x21NXVv7TUPhri
 l+cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790183623; x=1790788423;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=NMMUYlRFOEu4Y+0NjhX8Ge/q9RoTfSWrF7SafoChtWc=;
 b=KkkEqQsGowBxF6pRXFjK3tMa/TfPRyUcamdNNCF9lMsI1XyMBL8hZGudbmflbraGgL
 +s7rPY0suwtwLlrhnxLge/KQT+sm589n5qEwMTwnyNDZfXCmRC3tp3UUGhXt+4UsvJJH
 sWqe7RQ1hbzx+kH16ozfGkYS7Z1fvARJ2XxORwUSKrvWCdh0a9TbNTaydgvWPGsBooMi
 X64SLsLn61rRoIhQKOM9ehN3dsat1yM7sw3/IilGGgHHuAnl+1crv5vYCL4yGvAlz1X6
 zbyNgbRoUqW2FTm+Lxa3uEO2ikcdBcgxR7vrXLjFWXxBpcTbrODRAIuZD/VYWrdU2Y6A
 GyMw==
X-Forwarded-Encrypted: i=1;
 AKwUvByPIcma0Bc/cNbHCl5RAnCfQ1SZlf+4DYwTkTYtUQ3bZo82hzOl/jBG8iPRTBQw680FQ7AXvk3J/Q+8@nongnu.org
X-Gm-Message-State: AFuF++nC5HffIJ8gOXav+Fvjnq5ZiO7ossIdSzUWfiEdAdfhnkoU/1K3
 7BXlJad2ODfxWSz55V6NwDGCpdLnevdok2robckmXzB1EbqaNqCbfdeSN6H3Bgy/MNmmYXCNCQe
 r02Xy4JmQMF9GruUC6L6iRETII8beKE/teqGNlzm1C+8hyKq64rvbJ/PfTg==
X-Gm-Gg: AYBFou0N19QAr4XhitZ4Cb5hK0BJcgrjw/QgjjXd4Qjzer5Ea86MoeFxUSEmgpH/ouP
 qo29SXYK99Uf1v87AM0rZbo7kkiGLFsxUR4RYwkFRma04JVa3zsDfntYnVRF1ozgs/eYVjy33fx
 hrv/LiVXqiFwYo10rpw0FWwK83QmjcJD7kjwzNiqQ7fR/HuLAseEOAd5MtNoX3/vFWNOuZ0+xxs
 RUaWdc4Fvgt2bpL1IOGGuEzpxvCHz09AD+dWYVU4N5RTcb4Ir/wtecEVJIWyRfdAblUPrao61SC
 +bAhAiUh7u1HdHQ64WpEzrpkQ6llhExZYnTAiVXxXnfPhfO1ifB4MQmALMkcvYVgzS3SMKk+Mxb
 4T5xavuMd/bzfTQSyhWBlPTgPmgSumwAAwmj9OTks
X-Received: by 2002:a05:6102:8192:10b0:785:6b42:b7b0 with SMTP id
 ada2fe7eead31-7aa9df8e032mr5426513137.4.1790183622718; 
 Wed, 23 Sep 2026 10:13:42 -0700 (PDT)
X-Received: by 2002:a05:6102:8192:10b0:785:6b42:b7b0 with SMTP id
 ada2fe7eead31-7aa9df8e032mr5426502137.4.1790183622364; 
 Wed, 23 Sep 2026 10:13:42 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4886877970fsm8890958f8f.24.2026.09.23.10.13.40
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 23 Sep 2026 10:13:41 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-riscv@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Subject: [PATCH v3 19/21] target/i386: Split leaving-halt handling from
 x86_cpu_exec_halt()
Date: Wed, 23 Sep 2026 19:11:13 +0200
Message-ID: <20260923171116.31276-20-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260923171116.31276-1-philmd@oss.qualcomm.com>
References: <20260923171116.31276-1-philmd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA2OCBTYWx0ZWRfX4/C8hu9CKBF7
 l5vjLRXlBdKmMVVRl1tF07laHBy+20y1x1nbZX5sSHjC2cAWY+h5ZrJghAmNGz2YBcBbIx6TdDu
 TEsS+dPNKemVY366QHagI8mSbNPZ5W7zUMq2bEE4oQTPDX12omrwuAj684F4LY7UEh44gBD4v7D
 Tj24G7yHbI6LiuHVv0Syfvy1PRexUjY4eoS0r96hv99Y1owUx56kbshNLKDTzcBAI9xFtUCuPal
 cjyXV6xNFY00BbyS99wW3Rnzy7qaBRaFKPswpcDbI7dF6fkNIrF7zhtD6Vgumm7y5Vhzqo36/cE
 bMJz2bNxq/K0oKvklHepjv+JM6jrzMoJ7QUIx9xikWLTn8aIOcL7L0jWm5FyAdPew5KQ4+qiX0O
 9pQBnttcxZHxqmvsvjtY37jz/AHXHJafcJ3vuJSov/jCHkbPVGaHf7iHonVDfGfTdw8JXMWA3cH
 Go2hTu2VComBpf6p0Iw==
X-Authority-Analysis: v=2.4 cv=WK/qzXsR c=1 sm=1 tr=0 ts=6ab408c7 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=GiXQl85om2WzCxkx9rAA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=-aSRE8QhW-JAV6biHavz:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA2OCBTYWx0ZWRfX1YLdFGz7pPUg
 BrG7fiGZUrEWF+3hSsiQJ9YLdEDQzd8fqMqdGyJE6yy0n+x2sy2xN1hHBJ7042nmSfGo4gcfH6V
 vBKJhI3IlqA1qUSPoQsOOEX70awDne0=
X-Proofpoint-ORIG-GUID: Xgf3rsmNHYtSyL_ZUpKsN65Eep2bmuwO
X-Proofpoint-GUID: Xgf3rsmNHYtSyL_ZUpKsN65Eep2bmuwO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_06,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 bulkscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609230068
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
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

Move debug exception handling performed when leaving HLT into
x86_cpu_leaving_halt(). Keep x86_cpu_exec_halt() responsible
for checking whether the CPU can resume.

Document that #DB IRQ delivery through do_interrupt_all() runs
in the vCPU thread and does not require BQL protection.

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/tcg/helper-tcg.h        |  1 +
 target/i386/tcg/system/seg_helper.c | 25 +++++++++++++++++--------
 2 files changed, 18 insertions(+), 8 deletions(-)

diff --git a/target/i386/tcg/helper-tcg.h b/target/i386/tcg/helper-tcg.h
index 58e8ca0bc1b..96accb30a80 100644
--- a/target/i386/tcg/helper-tcg.h
+++ b/target/i386/tcg/helper-tcg.h
@@ -39,6 +39,7 @@ void x86_cpu_do_interrupt(CPUState *cpu);
 #ifndef CONFIG_USER_ONLY
 void x86_cpu_poll_during_halt(CPUState *cpu);
 bool x86_cpu_exec_halt(CPUState *cpu);
+void x86_cpu_leaving_halt(CPUState *cpu);
 bool x86_need_replay_interrupt(int interrupt_request);
 bool x86_cpu_exec_interrupt(CPUState *cpu, int int_req);
 #endif
diff --git a/target/i386/tcg/system/seg_helper.c b/target/i386/tcg/system/seg_helper.c
index 9ce608a0bb7..566b3d4d80c 100644
--- a/target/i386/tcg/system/seg_helper.c
+++ b/target/i386/tcg/system/seg_helper.c
@@ -140,22 +140,31 @@ void x86_cpu_poll_during_halt(CPUState *cpu)
     }
 }
 
-bool x86_cpu_exec_halt(CPUState *cpu)
+void x86_cpu_leaving_halt(CPUState *cpu)
 {
     X86CPU *x86_cpu = X86_CPU(cpu);
-    CPUX86State *env = &x86_cpu->env;
-
-    x86_cpu_poll_during_halt(cpu);
-
-    if (!cpu_has_work(cpu)) {
-        return false;
-    }
+    CPUX86State *env = cpu_env(cpu);
 
     /* Complete HLT instruction.  */
     if (env->eflags & TF_MASK) {
         env->dr[6] |= DR6_BS;
+        /*
+         * do_interrupt_all() is the normal TCG exception-delivery path
+         * and runs in the same vCPU thread context, so #DB delivery does
+         * not require BQL protection here.
+         */
         do_interrupt_all(x86_cpu, EXCP01_DB, 0, 0, env->eip, 0);
     }
+}
+
+bool x86_cpu_exec_halt(CPUState *cpu)
+{
+    if (!cpu_has_work(cpu)) {
+        return false;
+    }
+
+    x86_cpu_leaving_halt(cpu);
+
     return true;
 }
 
-- 
2.53.0


