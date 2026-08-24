Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF739C61CE2
	for <qemu-riscv@archiver.kernel.org>; Mon, 24 Aug 2026 11:19:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wySgu-0001r4-T8; Mon, 24 Aug 2026 07:18:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wySgu-0001qC-7Y
 for qemu-riscv@nongnu.org; Mon, 24 Aug 2026 07:18:12 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wySgq-0005DF-Cx
 for qemu-riscv@nongnu.org; Mon, 24 Aug 2026 07:18:11 -0400
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67O99LOJ2083170
 for <qemu-riscv@nongnu.org>; Mon, 24 Aug 2026 11:17:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 VTnZDkxqxcWE+Uhz4CNPQNK9aE/+Gp16fw+HxNLxbPo=; b=UXpVjzX1Ll1hWj17
 GvmqP23IfqVLS0if6NvrMUQeIbLhMwzGONhapTLuyr1TrER5J1+CfuQtbRlwHXz6
 sfzka/i9dDiI3bfXFsWDbMULmtRXBoXw1dp7amlk6KxbGwKfTv7TUnch0aH1bb9W
 w/0RVtqY58hfjWynXMuyjFOLtmQPR+hzlGElHM7kf8W0WEW47j3gLHgrS6R58pRc
 FGhixC923yjfuWS5mAXan2QBUijXbjpXzr0MhBWMywwBfLe6gsMhy70O688c7l91
 VFtY+LNqEEC0tI5aOvMet0MlQSdjol3lnPZpBh7wnt7zqcMrIlzkYdsEfdEItEcE
 6Mb5dg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8hbth09w-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 24 Aug 2026 11:17:59 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-52de05de414so38478451cf.2
 for <qemu-riscv@nongnu.org>; Mon, 24 Aug 2026 04:17:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787570278; x=1788175078; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=VTnZDkxqxcWE+Uhz4CNPQNK9aE/+Gp16fw+HxNLxbPo=;
 b=CJWu0sHheVtbU4JqLrqkDRdQwGwPlFMpGFBLHxZke5HjVK4n3442VJ5KlhEN9LS85T
 mXh2WAsEbTQoq+joSaujqP9YurYp6n388sTJRyQf/TQr7oXwArIiSJHUhaxVb1H5FXyk
 7kAMpCP1pC+xsm/mwzdVqod12ALp/gscuO60Ct6cf1GTL0wPq0wcMwbs/+BgicxGOWvk
 TiQL7qS2BK7nMJ8kUQpe/8CU3LGKhFjusLqRRO+O39hcJi9HiEzEoL3SMtIX6b/2VfPC
 sAtwefrfTtd/EA95JZqZe1kAORF0V+3Hmv/6dcxxfZlGiqj1z1tN6Xbe3tEAbz/sGXYV
 Pdzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787570278; x=1788175078;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=VTnZDkxqxcWE+Uhz4CNPQNK9aE/+Gp16fw+HxNLxbPo=;
 b=mQO5L6r6jI2UVetvkLH4HTT9EMg3TN0WCil1eYeVTIFr7sgCTQM6ttDTjAd/odvGzi
 iAOeURgWtNEk7K/ImEDdZ+FvsweV9BJkk4SQk7PKuxSLVIx8iI+mfWYGL6wnam3soOBb
 IW62//UgCQi086Fm34s9vhK6k7XTa91fgHAcqPawzwr5qqOoMnZmwILBJYRjegbLVPZO
 II6ZwsPwxoBlyRK/tKzz20YjuQrcx3HczEg7ahq78enb11IyAQ91VhKSmXY/Lea1lcWL
 yPBlqkJPYCZFxnXnUrC7H1jelDji1ToLzns4cPAhwpLVgGNvn9+PnbKUqMeAOFTTcDES
 BVDg==
X-Gm-Message-State: AFuF++kQaOP0CGHqupC2dhUlJHQ+iPsS0StKf97aot9MBtuFlKW3uuPf
 /2rWnA6HNJgu5thSPY6koacH/+2Uz8YovzVo9J1ZRIZGtkuZwbft4XPYKHVzimwcxcetcMuFp0B
 5+3WgmIhsSNRllxsTxW7kGpLDkNuNIg5nGCWryI2XuOwj7mY//8fLjhnT7w==
X-Gm-Gg: AR+sD12Yf6tBIebnWAgQBi9+ZKMcWA5dSbdFCNn4GtMOapt3glfDni4zyf2bBgbos08
 uVomPGxDyGBSmXfyXXLnhbKr810uWiBz/nihJfa8PQG22V5qYLz1LsZaaEvaU0jLgYcpWXfHZgp
 PzgQ/E2W2ObcyXu4vMPin+Gh4GTlRduBU2JmYDe78qvn5Fcp+n4q9DqvSnD5zNHoIUS1uSERGkn
 LxPP/UIZ5dflXNsYqX9ZIXjFFBJpT4ZHjNWBkszNbwESjfr1KQuAjjHSUWWdwu/ExDV83YoXu6K
 YemHyHgv+3BgwC2kMH3CvlAHjn3DY+3zZG/SLSRCXDPc/9HbteGyEUsnLWgDizMl3018VLyzrns
 cWd+TUENDLKL32A6OGH/RL4j1F0U7sTdtKPTqe98hOPC0NsRQow==
X-Received: by 2002:a05:622a:5812:b0:52d:3352:f7ac with SMTP id
 d75a77b69052e-52e09cabc0fmr185062001cf.28.1787570278319; 
 Mon, 24 Aug 2026 04:17:58 -0700 (PDT)
X-Received: by 2002:a05:622a:5812:b0:52d:3352:f7ac with SMTP id
 d75a77b69052e-52e09cabc0fmr185061491cf.28.1787570277889; 
 Mon, 24 Aug 2026 04:17:57 -0700 (PDT)
Received: from localhost.localdomain (44.170.88.92.rev.sfr.net. [92.88.170.44])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c2496296b8bsm1120780666b.16.2026.08.24.04.17.54
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 24 Aug 2026 04:17:57 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Laurent Vivier <laurent@vivier.eu>, Helge Deller <deller@gmx.de>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Subject: [PATCH v4 04/20] linux-user: Replace env_cpu_const() by generic
 env_cpu() equivalent
Date: Mon, 24 Aug 2026 13:16:53 +0200
Message-ID: <20260824111711.26297-5-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260824111711.26297-1-philmd@oss.qualcomm.com>
References: <20260824111711.26297-1-philmd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA5NCBTYWx0ZWRfX3I0vsiAQXw9h
 LZhGUZvo8F+hfKm6ToL+4gj45EQgmNp98JPHrioZF2UheskQ6GTO1Aayc5et6wskgxwxRoxAxfU
 75qPQb0AztiteG/f4RejLapv94rqYK6QxSqDa2MtIkYcO1LyXFUSCy+aCSeCqYSuwVrewqQLkJu
 R8Kcy13RirALDOlEO5mkHgTqEhQHj8BUSJxThcC4agpMqv5aajkT78VGUzqWhbb/RVK6AMZuAan
 cQoXJqWjsCTWSO14tCpWm8exnT6LrG04A0D1TBES8eU+lhuHpsWFpw+UMPYRZsH+ge2dmXC0WAK
 iOHcI9Mx2y3Znlvo8Pzjxrkaxy/RYhi8oFjq3GZf3H0U/9K3A9xjUa6hNsESkrprBJB7qUzla7e
 McaTQ8drdJ9SJQ/Iwm7PCno/mg8NAlGTtvl5LdWqXzpBn6Df9+si1c2oph+3Aed2ly6TP0aOSvs
 FZI88lr7GOS5NAW4n1g==
X-Authority-Analysis: v=2.4 cv=JL0LdcKb c=1 sm=1 tr=0 ts=6a8c2867 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=s1NLoHz9uzatdv2VNqxUSg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=xWu8-Agft_6X_INOG6MA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA5NCBTYWx0ZWRfX8/rCm8RUy5xe
 hnfIueyc55NAjxrNusTVLinjyGm/Yl/+7FsBLGanNQtv9Cd9MiSitGfMs8jlG9bUyEXLUGEHCFq
 pfMqp0pohBlWsOjslFkhpU1XapBj7zo=
X-Proofpoint-GUID: JhSFitPiF3YNGpE0EOjk-NKLstF4PRff
X-Proofpoint-ORIG-GUID: JhSFitPiF3YNGpE0EOjk-NKLstF4PRff
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_03,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 adultscore=0 bulkscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240094
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_CSS_A=0.1 autolearn=unavailable autolearn_force=no
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

Use the generic env_cpu() macro introduced in the previous
commit and remove the few env_cpu_const() uses.

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/cpu-common.h   | 1 -
 linux-user/elfload.c        | 2 +-
 linux-user/i386/elfload.c   | 2 +-
 linux-user/x86_64/elfload.c | 2 +-
 4 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/include/exec/cpu-common.h b/include/exec/cpu-common.h
index 60997628cc6..c14362f780d 100644
--- a/include/exec/cpu-common.h
+++ b/include/exec/cpu-common.h
@@ -102,6 +102,5 @@ static inline bool cpu_loop_exit_requested(const CPUState *cpu)
                 (CPUState *)((void *)(env) - sizeof(CPUState)), \
             const CPUArchState *: \
                 (const CPUState *)((const void *)(env) - sizeof(CPUState)))
-#define env_cpu_const(cpu) env_cpu(cpu)
 
 #endif /* CPU_COMMON_H */
diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index 88508deac50..c4bdaa146a7 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -2128,7 +2128,7 @@ static int wmr_write_region(void *opaque, vaddr start,
 #endif
 static int elf_core_dump(int signr, const CPUArchState *env)
 {
-    const CPUState *cpu = env_cpu_const(env);
+    const CPUState *cpu = env_cpu(env);
     const TaskState *ts = (const TaskState *)get_task_state((CPUState *)cpu);
     struct rlimit dumpsize;
     CountAndSizeRegions css;
diff --git a/linux-user/i386/elfload.c b/linux-user/i386/elfload.c
index 26b12001a3e..2e10f38a412 100644
--- a/linux-user/i386/elfload.c
+++ b/linux-user/i386/elfload.c
@@ -38,7 +38,7 @@ void elf_core_copy_regs(target_elf_gregset_t *r, const CPUX86State *env)
     r->pt.es = tswapal(env->segs[R_ES].selector & 0xffff);
     r->pt.fs = tswapal(env->segs[R_FS].selector & 0xffff);
     r->pt.gs = tswapal(env->segs[R_GS].selector & 0xffff);
-    r->pt.orig_ax = tswapal(get_task_state(env_cpu_const(env))->orig_ax);
+    r->pt.orig_ax = tswapal(get_task_state(env_cpu(env))->orig_ax);
     r->pt.ip = tswapal(env->eip);
     r->pt.cs = tswapal(env->segs[R_CS].selector & 0xffff);
     r->pt.flags = tswapal(env->eflags);
diff --git a/linux-user/x86_64/elfload.c b/linux-user/x86_64/elfload.c
index 49a6f6180e0..121a8167acc 100644
--- a/linux-user/x86_64/elfload.c
+++ b/linux-user/x86_64/elfload.c
@@ -59,7 +59,7 @@ void elf_core_copy_regs(target_elf_gregset_t *r, const CPUX86State *env)
     r->pt.dx = tswapal(env->regs[R_EDX]);
     r->pt.si = tswapal(env->regs[R_ESI]);
     r->pt.di = tswapal(env->regs[R_EDI]);
-    r->pt.orig_ax = tswapal(get_task_state(env_cpu_const(env))->orig_ax);
+    r->pt.orig_ax = tswapal(get_task_state(env_cpu(env))->orig_ax);
     r->pt.ip = tswapal(env->eip);
     r->pt.cs = tswapal(env->segs[R_CS].selector & 0xffff);
     r->pt.flags = tswapal(env->eflags);
-- 
2.53.0


