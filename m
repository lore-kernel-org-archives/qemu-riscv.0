Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17981C5DF88
	for <qemu-riscv@archiver.kernel.org>; Thu, 20 Aug 2026 20:16:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wx9BJ-00009O-GV; Thu, 20 Aug 2026 16:16:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wx9BH-0008Tu-FT
 for qemu-riscv@nongnu.org; Thu, 20 Aug 2026 16:16:07 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wx9BE-0002zY-4h
 for qemu-riscv@nongnu.org; Thu, 20 Aug 2026 16:16:07 -0400
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67KK7oc43941373
 for <qemu-riscv@nongnu.org>; Thu, 20 Aug 2026 20:15:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 26i3IaPZ18XqbWQYHKnxx6cxDLlxhS3q+ou9xT+imks=; b=fWLKLgGNFoiJyvJ+
 ctEkGo+3VRgNn3TIo5x0nVMybsK+uwn7IxSza4SJato7FmYZp6tperhdDr0B1WRT
 PRHO1OLhYKkatCdWi3vdVPlpH4BsmzM4d4uPEb4Y+I1sUpsSN20CGxJrX4DfM2tP
 8Z1rCGw3H4YYGvs/vZ/vB4krb3vb8mgSctuKGDhqhMyAelBdqOI4sXygxHLl+Ww4
 zufk0yPJfoKOc5jDrEF3ZsAkWdYhlZQ/F/6BTAaGjrSAUsnuAHtUNP7RXlfoREZc
 QbZX++AhOtvkIrSCQqBq389+T9Hsp12lGo/tVPJjEU5W8S3GzEySiCUsNjq2KlI4
 7XFGQQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5vh7ujpv-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 20 Aug 2026 20:15:52 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-51c1c7f135bso3970611cf.0
 for <qemu-riscv@nongnu.org>; Thu, 20 Aug 2026 13:15:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787256951; x=1787861751; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=26i3IaPZ18XqbWQYHKnxx6cxDLlxhS3q+ou9xT+imks=;
 b=golumtgn5j879q97eL9qTiBBQbuN3mO9QLrlgEbVtmGvhoWcushOJwB2yuzQUjwLKj
 fsJy8yFlubKscrnhNEAWje67PSaKaChiTz0cSxIRFI5PxrhbxWGuhzSzz4MPAHdLoVeu
 mRLIaQGT8X4wnmJKXEa/3hKOrBeD1MGlQ81HI0/yNQ2u96Je9CNlQXzqqhPvH9QnGxQR
 eeTo8zTtVjbd/8Ws2nkiIXr/c6XqOMP4lYUWf92XzA/SIV3F60kBFG9aCy5wsmnAIAmw
 AuY+8XyEUTax15/DPFeO+e+yEWaTtuL588BjSck2DlKU7KFgc3qaKMqkcWZvCzZy90Ar
 tX5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787256951; x=1787861751;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=26i3IaPZ18XqbWQYHKnxx6cxDLlxhS3q+ou9xT+imks=;
 b=LmmHhl2cfjyA2zn5e2yYrBetTjNBRy8/ooF0hJFcJOEHJXm4Wf/9N18GmTH2nHLa6s
 inA8dpNI+gw4pFujq6NXoaoNuDIT97AGinNdlnEFkAmJsx3xjRAt1xQfXaV2TjK+7tnf
 PCAeSiupdLMY3HyaebDKI/AMi/emo+HGQEsn7/NBuVoY+WPMUtQI/8l4OLJfRrnnmHro
 IzMTWjROKwm3cpYbRbcBY66n5ODS7dp9+XTa8kVRt9btbrp9KypI97uU06pGmxnHZXaK
 4ksSHjJkOntvCOdZLeJcbvDiLkrbyA4qn+ByTQdDNzIm1E/roCuIlxWMUUIKzr6ZTqGJ
 s+Qg==
X-Gm-Message-State: AOJu0YzFQkhXjs++PIfzVNfrwrUoiBYSrkKlXMutCSbyDwUQC/MTy0YH
 7kDRn8bRTB0Y27TxtZlXzh7aMkLwFxnL67RSBBqUh7Dr8ZLMeVW+W2t1O+6ZoRRYNRMsOA+3ynN
 Hby6Of7C1JCIkzGhKG8O73VTj9lLqc3cPai7pajdQrslJ9IXWMAm2hT74GA==
X-Gm-Gg: AR+sD11M7ulvhrbWaxnzSxq/krITT2ceQr5H8md3EBUi6ax3Ijasa2ZkKUxpz6F3RJi
 gC8dBZ6qkOusoGS7UmU20SLwokxWBrSC0q0igAPC8NEscQpV45NyD7k63k8TVkKAFp802UYKlxt
 QCt0MdRoVZ+uJa//aVryzwpD0PBWyKnm1/hY0qAVvXylNuMQklENfZPUdCHLwR8SO8VjtsaVgf/
 FEauNu/YX4sw4ev4USEZSOaGkxceBSFCs0coKm3xeh2QXFmNnRQDTygulyNuCTAGrFsaZIfMDqn
 xUnFCuE9xQymCAJ+Vwq3lO4tT1pFH3Tih/7t1ZrGOSF7SU9w3Uw4ZLkNWk38vOehIViiFWxp4qJ
 dCWJb5zpc6XfoctMhu9FzAiSwqymgOw9bDtSdH19Arg==
X-Received: by 2002:a05:622a:2516:b0:51c:2685:2964 with SMTP id
 d75a77b69052e-52df5a3491amr10589031cf.43.1787256950672; 
 Thu, 20 Aug 2026 13:15:50 -0700 (PDT)
X-Received: by 2002:a05:622a:2516:b0:51c:2685:2964 with SMTP id
 d75a77b69052e-52df5a3491amr10588591cf.43.1787256950254; 
 Thu, 20 Aug 2026 13:15:50 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-482b1441753sm16957417f8f.5.2026.08.20.13.15.47
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 20 Aug 2026 13:15:48 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-s390x@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Laurent Vivier <laurent@vivier.eu>, Helge Deller <deller@gmx.de>
Subject: [PATCH v2 14/15] linux-user: Replace env_cpu_const() by generic
 env_cpu() equivalent
Date: Thu, 20 Aug 2026 22:13:54 +0200
Message-ID: <20260820201356.29775-15-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260820201356.29775-1-philmd@oss.qualcomm.com>
References: <20260820201356.29775-1-philmd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDE1MiBTYWx0ZWRfX55BnU0h9DBRV
 aMeXpZHvhVTJTjy1LYPiIYV/2fbzGDhUaNSygQdLfb5gSc3HrwzYZW7OPysm35JR36EmWNyn1uR
 65HW0MSfupNIDV3PJROvNrT+EI/IMi2ZV8NogOOMDnPuiBinwPC3c6j3yADXbyYkgrbV41+NoxO
 zN0tx45Ee2Lizo7koajNVN8Vyj9Ncb8BOBDcts+rGmKuhtQzaNM/WYO9bJo2tGEJkncPGqVQNoL
 n/MM0/cYyQtrC7iAvYk77JuG+AJozSuz6X3jyZROadjHnU3xDJSicCGozIcyO+DJ59TzJI03ZnE
 TFsBAI1JMlaad3UA6MDvJ7qMEKJyaxo5n+yA0Pv6rzyfGdNKYsT8yCuju746ehhUJJr2iIX7IRb
 ZZ3MA1AkHhIZ+tR3hmTLaIfDpTZa/pubcjU8JDP1/2NCLZWj80onuU4Jm8irGcmaE+gkOY1iKvk
 5A1iGqzwPpGS52+Jx/A==
X-Proofpoint-ORIG-GUID: nWnxyJF6q_IGECptmwnDzFSDDF80DZx2
X-Authority-Analysis: v=2.4 cv=Y7fIdBeN c=1 sm=1 tr=0 ts=6a876078 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=OXD_3DllCHOcwck3pM8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDE1MiBTYWx0ZWRfX8rQUh7Qxj2av
 cTo/gFlEZH1KnrLh+/jxWFM8tCO+HgvTyOd2Z0cayU8ArpZ8l5htwRfRYWL+S5wWv5nsHs4Txb4
 3Tlfk309gX/UVpmF/A8EFbtqU5/lvcM=
X-Proofpoint-GUID: nWnxyJF6q_IGECptmwnDzFSDDF80DZx2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-20_02,2026-08-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608200152
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

Use the generic env_cpu() macro introduced in the previous
commit and remove the few env_cpu_const() uses.

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
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


