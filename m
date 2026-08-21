Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 896E0C5DF89
	for <qemu-riscv@archiver.kernel.org>; Fri, 21 Aug 2026 10:50:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wxMpS-0004E1-Ef; Fri, 21 Aug 2026 06:50:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wxMpR-0004DQ-N9
 for qemu-riscv@nongnu.org; Fri, 21 Aug 2026 06:50:29 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wxMpP-0003A5-Er
 for qemu-riscv@nongnu.org; Fri, 21 Aug 2026 06:50:29 -0400
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67L9LsYV1895322
 for <qemu-riscv@nongnu.org>; Fri, 21 Aug 2026 10:50:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 nP79f5AuOovrDB1ajsH1nmtiPD9rLwAHKHFOF2+RQ3k=; b=FHK0QkV4C2Qgetmf
 XdHQsVn5dlBIr64adF0H5qvVjx+OXdub1f0pFSr0d1RfWlBmlDJxRSJch1gflm1T
 bfgByBIM0qJQRNQioMUrjJ0rUDUqKAYsjSurxIiFtvrKsNAlpLc4H9XQ7Cl/D/Hh
 snbExd7pGeVxArnBH+QnrHIMDqZYzaz1Z2KlXZJyzCA4SGCLhCM/NkoyQObBp8O7
 YOctNEjpKHridSGNd0d+0s5/m6PmcXEPTU929U9VDWn0RTlqd9KeBSBqXPzLBCqk
 +98mLiaHjqspqze94YxZEtMdWHv6h1B61qFLN39siACg9Bs3bnXcVa4+J8e5ywY1
 59SIHw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g6gdn972v-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Fri, 21 Aug 2026 10:50:15 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-51c083f1818so9017131cf.0
 for <qemu-riscv@nongnu.org>; Fri, 21 Aug 2026 03:50:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787309415; x=1787914215; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=nP79f5AuOovrDB1ajsH1nmtiPD9rLwAHKHFOF2+RQ3k=;
 b=KwG5StNgR4iexvUFTyULkvX1LjdLXhTQ5OGnsLpbaG0bpF3AmPkdJ4+zxmeFoZl+e2
 EqGbFlcKKofxcCFPHHBLs9u3n647tJPU1GfwFCwuAsUDQ4KQPq+SdEB7TO7KOkBdMYZt
 BTN6J+0hMvK9RFXyuPQ5AIPcTxn4RdZdid0H/tVuKBRFOgGnGcOOSzQxLlBW1UyyTkAl
 LMSXuYUK7OotsxWZhnk7R5mIWp1IvhsOVHTwdlldJSmME95D8IENzuNqJpY9v5g2lVe4
 45z6aVweSrFMF4tRWgh2ERG+TqnUaK4RZOnK/EzlP4fc8QmrdmAal8WRwmVml2PPfc7a
 Io4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787309415; x=1787914215;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=nP79f5AuOovrDB1ajsH1nmtiPD9rLwAHKHFOF2+RQ3k=;
 b=FnceQoLx6I6BYO2mX6552vBPOgofjZKnu5C498/OObpXdpUVztAf8vYaqLBXbqAM/J
 bias7I9DkvFGya/wPE1s0Wum1TuflY5nnF/8k+DLS4+StG2eJuKtQnnhf8S4RYHw9LcL
 ZnuW/4zWNospTJpxr4elfvrGtBSsafOPzH2TccgK1anFl+bNnie7Zo4ymBQn/vp3YRIS
 DwhXENDbj2TCItvRIRGqEK9Xfjun7m0v5lsGAVLkvzThtZAhxn4qpW0KawK3bEzoArRo
 Y38BHguDrc0InsX1dUsEbNbZON6QoPAl8cY4NDKsbandUdi5VzaFMEqMK1eR/wlemJbk
 eojg==
X-Forwarded-Encrypted: i=1;
 AHgh+RrzHcAUmmvNWy57awOP/1SFDLr/K7XaAszUdeRESVszALsNx6bvL9RB9B/oj47R9OzD86yAJuud4eSM@nongnu.org
X-Gm-Message-State: AOJu0Yy5P3/ngr7Erpn63Cx8ykkwYqFmnBohd3mAw88adFg7QXfXTTwh
 MZJiFsUt+xFVNmE2cuvzbPH/vHM82Ww5TDAN/F/JrPHWwU3/PQc1K0P2l3Tp0inzVFdBP5vhfSo
 3ymURgIO3fqSC13cnZ1fzYR2EXf4NzniTAQuFrhYnoiT5n89dSz4ncnXaZQ==
X-Gm-Gg: AR+sD11wdI5SwTgYr+plIB4QdTGaT1v2If3Byh+SE8aLIURK9Nc+fZMa+f3x//yY08I
 VAZoSAUswn2dageym34A2M3UP6j1dcW7LQts4vU6IGk7qgO3VyuF11VR4E1E529xojv/SYmDqMg
 rtFS/Vgb8rPavKrBnA/i1kAMJURdsgySqRJzjipC1VK6paIzqFg9J+IajgylaF8mgcRN4zpVW6C
 Gc7BvXL89rXbJ5xDXCBx/tNxsR+e+8YHxQQP34YR8lVs9c1qYXjAbsV5V8sn6mxDX6N18ku6BL7
 PCk3w9CvB3aQ3sUd7QfhkLHzWGOyLKzBLTO6Bq5jHYuhlCO4SON6bqvnYbQLkZZY84g/gJuThge
 sgX1wesZbeDwYwLwG+7OFfiTHSg0+eW+YUl6yat0GAQ==
X-Received: by 2002:a05:622a:4d49:b0:51c:1132:c80d with SMTP id
 d75a77b69052e-52df5a024c9mr46450711cf.28.1787309414849; 
 Fri, 21 Aug 2026 03:50:14 -0700 (PDT)
X-Received: by 2002:a05:622a:4d49:b0:51c:1132:c80d with SMTP id
 d75a77b69052e-52df5a024c9mr46450391cf.28.1787309414489; 
 Fri, 21 Aug 2026 03:50:14 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-482b14c33b3sm15625877f8f.27.2026.08.21.03.50.13
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 21 Aug 2026 03:50:13 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-riscv@nongnu.org, qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Laurent Vivier <laurent@vivier.eu>, Helge Deller <deller@gmx.de>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Subject: [PATCH v3 03/15] linux-user: Replace env_cpu_const() by generic
 env_cpu() equivalent
Date: Fri, 21 Aug 2026 12:49:37 +0200
Message-ID: <20260821104950.32108-4-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260821104950.32108-1-philmd@oss.qualcomm.com>
References: <20260821104950.32108-1-philmd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIxMDA4MSBTYWx0ZWRfXxQb6Dr5jy8ZQ
 DPwvltqGTlVrFlaEHQslXrKSqQKvPbTMQxTC/gsTnEvauSiDCO8VXlDoM64qc1cUuTrvohyase9
 TPcgL/8d5D69KX0mVkXjzJIMZMyqQgXXZSSXjo0A9gm3Zq5cNmg4VlNNTZQsVipsRNtsSNOst+D
 +oyZQs4DSfAkTVE84SWZS6R2wyt+rxHPLznZ230xVuG+j0QDJwanOEKzsApYOJd+rQw0ushb1xp
 VInkA7p2tiq0BuNecwuw1gSGaIJlwEEP1yYCTDv6BpXnmTo3pTX01ij3cxNOmbTnMn94pU4KHLN
 CFKfkzSNZBMU2CWx0L6QEcVYQLeD9w9VCjkDZVcvSZY3bCryjmld0ooZpoFk2coDsHsIm3iT6s5
 DES0VJ1GoI6pFo0nWrKR/hYu26i4mA6qAZqrIL02fdfz3modXWn5t4ChaICORN5tf4Kq5WPisLn
 y7/mjN2hLcyMVYxrghA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIxMDA4MSBTYWx0ZWRfX2aCk6j+Bo4GJ
 TD7lXenrwRryXEPgdkB4mU3q3Q1H9bLDa2av4y+095gPzM0NOQIlwzXOCCKxKvv/8w0F7L8nyRn
 jlgfwgANnCUTDYPeZNcAfZjQSArx85Q=
X-Proofpoint-ORIG-GUID: xHHdl_MN9KoQedkdhTo3fixgTLORTPlL
X-Authority-Analysis: v=2.4 cv=BJyDalQG c=1 sm=1 tr=0 ts=6a882d67 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=xWu8-Agft_6X_INOG6MA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: xHHdl_MN9KoQedkdhTo3fixgTLORTPlL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-21_03,2026-08-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 bulkscore=0 clxscore=1015 impostorscore=0
 adultscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
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
index bffef677607..d67d008236f 100644
--- a/include/exec/cpu-common.h
+++ b/include/exec/cpu-common.h
@@ -102,6 +102,5 @@ static inline bool cpu_loop_exit_requested(const CPUState *cpu)
                 (CPUState *)((void *)env - sizeof(CPUState)), \
             const CPUArchState: \
                 (const CPUState *)((const void *)env - sizeof(CPUState)))
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


