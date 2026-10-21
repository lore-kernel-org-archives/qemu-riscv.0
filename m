Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8089C606E87D
	for <qemu-riscv@archiver.kernel.org>; Wed, 21 Oct 2026 03:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=j4/PpTVl;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PR2eSRla
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xJMo5-0003ka-1G; Tue, 20 Oct 2026 23:16:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xJMnr-0003Em-96
 for qemu-riscv@nongnu.org; Tue, 20 Oct 2026 23:15:48 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xJMnn-0002gF-S5
 for qemu-riscv@nongnu.org; Tue, 20 Oct 2026 23:15:46 -0400
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69L2EuEs3469263
 for <qemu-riscv@nongnu.org>; Wed, 21 Oct 2026 03:15:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 eM11e5ZliPQWh5X7FYojwl2XSBT/xIrvqwUdAV/Mepc=; b=j4/PpTVloVsroJNp
 1oJptMlWFU5YoNx6D4uIxWGfRC9CzVrA/VbIDFW+tBYNJ6TvLE295oBlXxlsNu36
 7TIlwWBd+4a4A40Ny9QovfDcTQSfSfM/kPcUc6Oo3htJYhGHK190rYVdRXP5//2N
 8BSvrbWUoFVPuN8yLx0+rm/zE5Iboui3z2R4HPzMCkfEKaDNr8bM2tC1HuOUBvUE
 /f4Z4j6NBm8mZ5hptbrSbVo4X00JprEQMpia/lsx5KdXcqAt4gHtkRtAVo4qpd+Z
 0E/9bZeHasRuHSNPHFSBXb5vWXhPfu2+XhdplapFoOqnxDFAi/57T7MwqiATT4Zb
 ZQhxDA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4he7h2ba6q-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 21 Oct 2026 03:15:21 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-93f2373e9b4so34406385a.1
 for <qemu-riscv@nongnu.org>; Tue, 20 Oct 2026 20:15:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1792552521; x=1793157321; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=eM11e5ZliPQWh5X7FYojwl2XSBT/xIrvqwUdAV/Mepc=;
 b=PR2eSRlaR4GC03Z53r/EaQw/W77GiY9DbN5J2GnTfJTnP1XgQEzjIvS27k6hcrFmdg
 UHAeAbymQukBRb31c0d4N+UWApDyAb9oBHK41CGQc/bQnnut+2V+DVE+bEbnrXPqikFd
 7BMjTZZPyGxnYY4LKpo6MNR+APh7uRuO4Syj4kpi3JOeo3CF/WLhOKUAm+eHiFSt9ylt
 HsyT9cyunhdrwq+FZpSsaIv5EFw/wUt6RCeWESWo3QHG4SzL2f6pq0M1gBhvKeCg2/df
 NfbFezIm/O4i51gFUgLAFI2eOQimXmZs1XYSOHIKl0JbLwxxOfq6h1yaEadI49ujeKQ/
 bCHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792552521; x=1793157321;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=eM11e5ZliPQWh5X7FYojwl2XSBT/xIrvqwUdAV/Mepc=;
 b=acmhRXyJMEJHmUhbdSXPvqlbosmW5M/CxOs8HMrozG4NJ5Yvlww3ebnzkVZ5OYYjl9
 whbkdp/9H6kDF5NwS9Q4Fap49I3TWZrds8Efkh4cFQpjfU5ep8Ye4dpRTaj4WMa2sKPx
 l7xVc7ZwUESckuK4egBAAm4rLMH82+g2wJFDY7xJOHkTuRekkZ6xZaDRmZhb7lKGgPVu
 X/Mrk3kB4tSoxGjur631C9XQ407tZsIKyLUSF8I0ZSCMdMOcoYB/jKuH3Raom/WdCjGe
 mQlPHW7HhSOB9HRwOF3LSGHdGSlSsm3PDT3MO6NJVDmbBLdWneIrjr1k8WA8OkqxsqUR
 aSVA==
X-Forwarded-Encrypted: i=1;
 AKwUvBxd68S0LEiTtodwqMQ5kXCko+WGKFwhutVeritlDqP1trETC4LDNyTWhLeCh3zu0mEz/+xpk1bNAmrY@nongnu.org
X-Gm-Message-State: AFq9FYLkdpxtjzaYOVzKMjR4/qJ1tY4AqUodjTLSYiAs7t2Owps4qm+X
 K9K8ZIMy4j1SKozQ8nPbSvHalxSwYHgF5LQMt7dXVmAjUPsywMgLwW7EulwpU68Wz2hP+ujXRNH
 NqfTXi6RZ1fGI6nx3wkjjiskBCSRVgsjDhRLv/YeSS5pZ081ypDmUwp5v/g==
X-Gm-Gg: AYBFou39oiQ7+3U984PKbkZNucIyTyRoF91EHNw5QTzRhxLTJ7nBtThUcKt8+AzAsHc
 nIR0IUxnjdTqCh19t+ogrcDjk1bS8fxSvsl17DV9o9QNckw66Hylwx/8/cQBUnrws4JQKiz9Wq+
 7nAX8/XaTNxsVyh0M9GyaSbTet5Y5Rvss2yM/YJbTh/PrE/iiNEnR4ESd17XyocMzh+uv8a02nd
 5ZwVI66ykoZoSy4pb2GKDiJpJpsSAsmtgbcjJk8YjxgDvXEAXq4negAM+cqgtjDOJVSgmuCxmxA
 +yIhGeFZmhCAbo8nIncvGXo1o9IrUtjAERVqsqFbgzuw6ihSTqILi3FECNsS5brPTGOYYpuraX9
 fq9pPsPPb2EMLSS09y4rLmHOLXsV19LkIh7Q0WsVH
X-Received: by 2002:a05:620a:46a2:b0:93a:9ef5:d370 with SMTP id
 af79cd13be357-93f57ebdd8bmr230307185a.1.1792552520849; 
 Tue, 20 Oct 2026 20:15:20 -0700 (PDT)
X-Received: by 2002:a05:620a:46a2:b0:93a:9ef5:d370 with SMTP id
 af79cd13be357-93f57ebdd8bmr230304885a.1.1792552520358; 
 Tue, 20 Oct 2026 20:15:20 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a1fb96bc7dsm44738385e9.15.2026.10.20.20.15.19
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 20 Oct 2026 20:15:19 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
 qemu-s390x@nongnu.org, Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Subject: [PATCH v2 09/33] target/hppa: Register CPUClass::exception_name()
 handler
Date: Wed, 21 Oct 2026 05:13:42 +0200
Message-ID: <20261021031407.24862-10-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261021031407.24862-1-philmd@oss.qualcomm.com>
References: <20261021031407.24862-1-philmd@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: fGWseDv2AhAKgACrXUOMgA-ccAMKnDq-
X-Proofpoint-ORIG-GUID: fGWseDv2AhAKgACrXUOMgA-ccAMKnDq-
X-Authority-Analysis: v=2.4 cv=EuJHPicA c=1 sm=1 tr=0 ts=6ad82e49 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=TU1vJ8DaLJqu0uKs2-8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAxMiBTYWx0ZWRfXwVBJBILVJ6Ae
 hDu3RMCv+1nv/xA+lpWV5IlbwS9fjZD3Zl35ffJ8AA5krvxZZ7HgT9Ke3IugB1pWSdrrBGs58kD
 pYhr2jtU636gQIvN4HhIzHYydDs/AZ0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAxMiBTYWx0ZWRfXxEOS4VDyl/QW
 FL4C/vEZCRD6X0DRYHyZ7tL9aYI6xNO1AfearKU/OhPFx3gGYgnV2qIJ85zVsXT+rzFC2g5TQ5B
 BKn1VUvwu1dvMEeHmfsQKKXvrpvMjnSKCH24Jti1+9WRY8OyIHtjAfUsCpnm/n7alZyRjczARH3
 CsGlxv9zqlUvWUuZKteNg8U4CK2YxlQgvEmadkQi+oRXIFpFLqJmJKoqHgvEvyozLz7jJLyiOtz
 560nVnXp9k6FNDrZRojGVJy7sizUceNtCJLNU1O5NCSsRtf4tM4IQy3pQdnEuHKyKOWvAGI7QKw
 rKdhFVT1MG4BfmM94NBnq5izBt5b59cg5XE0jF/Vep7FMjbcHy3MfvdAx2kkMKz7rNUIa43u/P0
 zgBhUIVerSRqSx9wj4nBlhuMeZbQXzv1ikO11zN4oksKV5n3MKzHwzIpZMnxFNCn/IyOiX1iAdQ
 F+AtFp3lsUz10BlJkVA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 clxscore=1015 spamscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210012
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -2
X-Spam_score: -0.3
X-Spam_bar: /
X-Spam_report: (-0.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Factor hppa_exception_name() out of hppa_cpu_do_interrupt()
and register it as the CPUClass::exception_name() handler,
so the common exception logging can resolve HPPA exception
codes to names.

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
---
 target/hppa/cpu.h        |  2 +
 target/hppa/cpu.c        |  1 +
 target/hppa/int_helper.c | 88 ++++++++++++++++++++--------------------
 3 files changed, 46 insertions(+), 45 deletions(-)

diff --git a/target/hppa/cpu.h b/target/hppa/cpu.h
index f453444d7f9..3914b3285c5 100644
--- a/target/hppa/cpu.h
+++ b/target/hppa/cpu.h
@@ -98,6 +98,8 @@
 /* Emulated hardware TOC button */
 #define EXCP_TOC                 32 /* TOC = Transfer of control (NMI) */
 
+const char *hppa_exception_name(int excp);
+
 #define CPU_INTERRUPT_NMI       CPU_INTERRUPT_TGT_EXT_3         /* TOC */
 
 /* Taken from Linux kernel: arch/parisc/include/asm/psw.h */
diff --git a/target/hppa/cpu.c b/target/hppa/cpu.c
index 07b49e51326..81eef6a2fc7 100644
--- a/target/hppa/cpu.c
+++ b/target/hppa/cpu.c
@@ -305,6 +305,7 @@ static void hppa_cpu_class_init(ObjectClass *oc, const void *data)
                                        &acc->parent_phases);
 
     cc->class_by_name = hppa_cpu_class_by_name;
+    cc->exception_name = hppa_exception_name;
     cc->dump_state = hppa_cpu_dump_state;
     cc->set_pc = hppa_cpu_set_pc;
     cc->get_pc = hppa_cpu_get_pc;
diff --git a/target/hppa/int_helper.c b/target/hppa/int_helper.c
index 3e87b9a0011..e4297461d55 100644
--- a/target/hppa/int_helper.c
+++ b/target/hppa/int_helper.c
@@ -90,6 +90,46 @@ void HELPER(write_eirr)(CPUHPPAState *env, target_ulong val)
     bql_unlock();
 }
 
+const char *hppa_exception_name(int excp)
+{
+    static const char * const excp_names[] = {
+        [EXCP_HPMC]          = "high priority machine check",
+        [EXCP_POWER_FAIL]    = "power fail interrupt",
+        [EXCP_RC]            = "recovery counter trap",
+        [EXCP_EXT_INTERRUPT] = "external interrupt",
+        [EXCP_LPMC]          = "low priority machine check",
+        [EXCP_ITLB_MISS]     = "instruction tlb miss fault",
+        [EXCP_IMP]           = "instruction memory protection trap",
+        [EXCP_ILL]           = "illegal instruction trap",
+        [EXCP_BREAK]         = "break instruction trap",
+        [EXCP_PRIV_OPR]      = "privileged operation trap",
+        [EXCP_PRIV_REG]      = "privileged register trap",
+        [EXCP_OVERFLOW]      = "overflow trap",
+        [EXCP_COND]          = "conditional trap",
+        [EXCP_ASSIST]        = "assist exception trap",
+        [EXCP_DTLB_MISS]     = "data tlb miss fault",
+        [EXCP_NA_ITLB_MISS]  = "non-access instruction tlb miss",
+        [EXCP_NA_DTLB_MISS]  = "non-access data tlb miss",
+        [EXCP_DMP]           = "data memory protection trap",
+        [EXCP_DMB]           = "data memory break trap",
+        [EXCP_TLB_DIRTY]     = "tlb dirty bit trap",
+        [EXCP_PAGE_REF]      = "page reference trap",
+        [EXCP_ASSIST_EMU]    = "assist emulation trap",
+        [EXCP_HPT]           = "high-privilege transfer trap",
+        [EXCP_LPT]           = "low-privilege transfer trap",
+        [EXCP_TB]            = "taken branch trap",
+        [EXCP_DMAR]          = "data memory access rights trap",
+        [EXCP_DMPI]          = "data memory protection id trap",
+        [EXCP_UNALIGN]       = "unaligned data reference trap",
+        [EXCP_PER_INTERRUPT] = "performance monitor interrupt",
+        [EXCP_SYSCALL]       = "syscall",
+        [EXCP_SYSCALL_LWS]   = "syscall-lws",
+        [EXCP_TOC]           = "TOC (transfer of control)",
+    };
+
+    return ARRAY_ELEM_OR_NULL(excp_names, excp) ?: "unknown";
+}
+
 void hppa_cpu_do_interrupt(CPUState *cs)
 {
     HPPACPU *cpu = HPPA_CPU(cs);
@@ -235,53 +275,11 @@ void hppa_cpu_do_interrupt(CPUState *cs)
     }
 
     if (qemu_loglevel_mask(CPU_LOG_INT)) {
-        static const char * const names[] = {
-            [EXCP_HPMC]          = "high priority machine check",
-            [EXCP_POWER_FAIL]    = "power fail interrupt",
-            [EXCP_RC]            = "recovery counter trap",
-            [EXCP_EXT_INTERRUPT] = "external interrupt",
-            [EXCP_LPMC]          = "low priority machine check",
-            [EXCP_ITLB_MISS]     = "instruction tlb miss fault",
-            [EXCP_IMP]           = "instruction memory protection trap",
-            [EXCP_ILL]           = "illegal instruction trap",
-            [EXCP_BREAK]         = "break instruction trap",
-            [EXCP_PRIV_OPR]      = "privileged operation trap",
-            [EXCP_PRIV_REG]      = "privileged register trap",
-            [EXCP_OVERFLOW]      = "overflow trap",
-            [EXCP_COND]          = "conditional trap",
-            [EXCP_ASSIST]        = "assist exception trap",
-            [EXCP_DTLB_MISS]     = "data tlb miss fault",
-            [EXCP_NA_ITLB_MISS]  = "non-access instruction tlb miss",
-            [EXCP_NA_DTLB_MISS]  = "non-access data tlb miss",
-            [EXCP_DMP]           = "data memory protection trap",
-            [EXCP_DMB]           = "data memory break trap",
-            [EXCP_TLB_DIRTY]     = "tlb dirty bit trap",
-            [EXCP_PAGE_REF]      = "page reference trap",
-            [EXCP_ASSIST_EMU]    = "assist emulation trap",
-            [EXCP_HPT]           = "high-privilege transfer trap",
-            [EXCP_LPT]           = "low-privilege transfer trap",
-            [EXCP_TB]            = "taken branch trap",
-            [EXCP_DMAR]          = "data memory access rights trap",
-            [EXCP_DMPI]          = "data memory protection id trap",
-            [EXCP_UNALIGN]       = "unaligned data reference trap",
-            [EXCP_PER_INTERRUPT] = "performance monitor interrupt",
-            [EXCP_SYSCALL]       = "syscall",
-            [EXCP_SYSCALL_LWS]   = "syscall-lws",
-            [EXCP_TOC]           = "TOC (transfer of control)",
-        };
-
         FILE *logfile = qemu_log_trylock();
         if (logfile) {
-            const char *name = NULL;
-
-            if (i >= 0 && i < ARRAY_SIZE(names)) {
-                name = names[i];
-            }
-            if (name) {
-                fprintf(logfile, "INT: cpu %d %s\n", cs->cpu_index, name);
-            } else {
-                fprintf(logfile, "INT: cpu %d unknown %d\n", cs->cpu_index, i);
-            }
+            const char *name = hppa_exception_name(i);
+            fprintf(logfile, "INT: cpu %d excp %d (%s)\n",
+                             cs->cpu_index, i, name);
             hppa_cpu_dump_state(cs, logfile, 0);
             qemu_log_unlock(logfile);
         }
-- 
2.55.0


