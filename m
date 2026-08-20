Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18831C5DF81
	for <qemu-riscv@archiver.kernel.org>; Thu, 20 Aug 2026 20:17:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wx9B0-0007Qi-Ia; Thu, 20 Aug 2026 16:15:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wx9Ar-0007Bc-83
 for qemu-riscv@nongnu.org; Thu, 20 Aug 2026 16:15:42 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wx9Ao-0002jp-KU
 for qemu-riscv@nongnu.org; Thu, 20 Aug 2026 16:15:40 -0400
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67KK8MH2809117
 for <qemu-riscv@nongnu.org>; Thu, 20 Aug 2026 20:15:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 GkfJ0DUVwjpw7Jql39GIYw8AYSod2OF3xVsMsf7lww4=; b=E0GZc+gJszC2ZA8t
 6i1yAjDOHPQf7Ezv3GJdsqJsIpwjx1eLyZjONKxIWDfvmPa8lCHMJ65a7K5q0Hlx
 SGgKyPhWMuiFKJNTYcLus/xvHFDmrEBnHt1Lj3c4alc0zmIkMIDWXQaGT12rShCb
 oX54p2EXW2hGMX0FGPXzXoEpNCMsI+8r5l47FV5y1j/OC09SCy9chTfcjx8mFHPv
 7juvCV6MJkN8aFq1CPQSbCyd0J4T227Pd2o3ucY1EU72SALpDcigTXqPXGiRgZ6a
 ynEEfOhfinuJRntmXKCUS4YB6n6LwO4MoE3k72RbXHmCXoiOVpGm4JL+SmQhYQp3
 ZyYrzw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5xgcb39q-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 20 Aug 2026 20:15:27 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-52d28f8737eso3819801cf.2
 for <qemu-riscv@nongnu.org>; Thu, 20 Aug 2026 13:15:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787256926; x=1787861726; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=GkfJ0DUVwjpw7Jql39GIYw8AYSod2OF3xVsMsf7lww4=;
 b=DfVB1eRTJNuR1k1pb4YFnQ9ptJmVvqRjnhmF72uA7XWjJ3KkAwq7gBe560krTKkR+F
 FMxCLp25+dJYKYEcO7HpWG+6fZ+r6oSzudW43d/9mfBdv430cLfMBuumTQUqpO8bfoL/
 3MdU1nP1naARtJ47Yd5dTIYEXxPOroO0M6XYMGWFE7Easifjh0zpZ7MOgeKTItOQMWZg
 D1YV+3A2Y8KSN8AHu7er20R86+QJwzKlOBDW9XcqwQDnHTZc+X/RP6lcRLxK74vDQ9h2
 rHV5OV/5+tL/fwagbYapIk4/pkdfZZfDO58bsqFWUhS7bWOywEkdV3BmEENE2O/AS0wO
 xXqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787256926; x=1787861726;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=GkfJ0DUVwjpw7Jql39GIYw8AYSod2OF3xVsMsf7lww4=;
 b=AFn6RG7qAB8Pfe3ay7Rf1wZHb5O/3HsSG+d4yKXUL3LttSjMYEDEb2f4Xd5q3aMLy1
 CYKW0x7L3chgTDvfpM8H1FmCmiWk4jy195BMoP4eoydzyhbjEy3pKKwvSVLkShiYI1Y+
 GhjlzDiXoKmMku1LiW2170KOqq8dnCJ0Cr4/gLN+SXJI9OqLFe3DU6UikpY8bYSsC2EJ
 VE18QmDvOaIxgBxmGCIJGajjOUTs16W+SiQLHp+F4v9e9DL4oejhSlYxW+kFzy8yEpBe
 P06jDoSzN+vfffylfYfTi3l1I+fHByW2w6Kebrocu3OdzLkt2p5Cbd07+pRkMqKScUyQ
 cXsg==
X-Gm-Message-State: AOJu0YyWoDFcVk9cL4ZsoNeUdy/KevkEZf4gDdVEst1xDe0FZ6rlaS/g
 b/tEalybyncsKjFg7NoijQ3KaRgH1P3322xpcQk1X3IMy3vsmairTcmH/i0NLZvCmTDp6ZDGPi7
 GXa95UDDmozVVPvxuBMaN49x1DdrlS9DsVOm2/w2LQQBq6HUxZR0LRr6I6A==
X-Gm-Gg: AR+sD10L/aAs1zCNel0JOrn0JCAxqdZL4y2GxDFAp+sbJ6RXuxkyYmgMB89He17Ws1p
 40vlHJqhFrXETfDxXWT+dflwuJWolXNvjxC9VnJ5zeol8UOZHgyO+eus7XRmS4pPEqRbzCdgE7g
 WRB4hLRbC7j1tAMhFfOSgKgRE9OdKMdF3XN+Ck0Kb3h2Y93T9T+dBOosrx5lkk+cMch5pev6uUh
 5q3uJEbLZ2f3SKRHsLU6fiqKp3VMaVIdsf0Enp881Jzy++kzF5wJbFjkYqSyzfuGZmgzBXlUCHI
 tpLznW5uuV4t/dMqF+XIYhWxYVx5gqbF+/7pWwLeP5yB1eQ7hEQNN6x+OBiOlT7BrSQdeszrX/T
 8i5Awh45ESEqODSIr2cyvmunQ/dtXbjrmK7yF8GwIwg==
X-Received: by 2002:a05:622a:118d:b0:52d:9a3f:85bc with SMTP id
 d75a77b69052e-52df571351dmr9555701cf.18.1787256926133; 
 Thu, 20 Aug 2026 13:15:26 -0700 (PDT)
X-Received: by 2002:a05:622a:118d:b0:52d:9a3f:85bc with SMTP id
 d75a77b69052e-52df571351dmr9554451cf.18.1787256925371; 
 Thu, 20 Aug 2026 13:15:25 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-499b90e7e20sm3822715e9.5.2026.08.20.13.15.24
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 20 Aug 2026 13:15:24 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-s390x@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>
Subject: [PATCH v2 11/15] target/sparc: Constify CPUSPARCState for various
 cpu_*() getters
Date: Thu, 20 Aug 2026 22:13:51 +0200
Message-ID: <20260820201356.29775-12-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260820201356.29775-1-philmd@oss.qualcomm.com>
References: <20260820201356.29775-1-philmd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=GPM41ONK c=1 sm=1 tr=0 ts=6a87605f cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=20KFwNOVAAAA:8 a=tlxghdvPRZsVr19qFskA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: hMU-KUlElP-CNMhPDZv22JHU94axON4A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDE1MiBTYWx0ZWRfX65hy2r/A/lTr
 tILBNTIR9L508CLNXMH2vNY7NQoADNeVCFduFWBFZUfu+5FjzZnMvJCVIxA/FiuLts1juWjQK9C
 n98kb5DAACy2DQfUZkDesZgD+43mNDRJTTXkZhvdo6nmtkqCtOY6hpEu68kI3so/co+u5P/l4ku
 nmPtHxmfQFjSA0y6qVjuaP30DfQLegGQGS/j4o+Hmww4SDgoGz8KIzIkSBp1GEg3y5494lye/wx
 0J4fMMXsfa1TDSUZh1cpriP1rd7n80ZT+Ki6qXbFv45aHg3G8dmM1iLsK+xiLyfxHw29SqnAn+s
 r7omVHV+1ZaqBKOeu80+mGX0huJYEo5QMyH8f25SlvjMEf3wzIDgdj3pdEtz5Gx71A1jvbwyfjE
 xsyvFoKRhOWGo0NZMgerq5A2CWr3VRogwaYSJT1Adg4rnEi2wqk3+IC4ashgT27IexHMuUhNIk0
 TQmY5ndv9ESWL2iCcHg==
X-Proofpoint-GUID: hMU-KUlElP-CNMhPDZv22JHU94axON4A
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDE1MiBTYWx0ZWRfXxBH9UC1Rrv2j
 el2k6w0gyyKNAWEdAKDdMHWFt3uLnQgH2oc2g99oOKijPJo2QeX42a3wWSWNG9B+IV7oq3LXIS4
 CQWGIsE8dpoz18nM00v2eQ8egkbsxhw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-20_02,2026-08-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 spamscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 malwarescore=0 adultscore=0
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

Add the const qualifier to CPUSPARCState when
the argument is accessed without modification.

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 target/sparc/cpu.h | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/target/sparc/cpu.h b/target/sparc/cpu.h
index 5f583ed9de2..31a16c2af03 100644
--- a/target/sparc/cpu.h
+++ b/target/sparc/cpu.h
@@ -680,28 +680,28 @@ hwaddr cpu_get_phys_page_nofault(CPUSPARCState *env, target_ulong addr,
 #endif
 
 #if defined (TARGET_SPARC64)
-static inline int cpu_has_hypervisor(CPUSPARCState *env1)
+static inline int cpu_has_hypervisor(const CPUSPARCState *env1)
 {
     return env1->def.features & CPU_FEATURE_HYPV;
 }
 
-static inline int cpu_hypervisor_mode(CPUSPARCState *env1)
+static inline int cpu_hypervisor_mode(const CPUSPARCState *env1)
 {
     return cpu_has_hypervisor(env1) && (env1->hpstate & HS_PRIV);
 }
 
-static inline int cpu_supervisor_mode(CPUSPARCState *env1)
+static inline int cpu_supervisor_mode(const CPUSPARCState *env1)
 {
     return env1->pstate & PS_PRIV;
 }
 #else
-static inline int cpu_supervisor_mode(CPUSPARCState *env1)
+static inline int cpu_supervisor_mode(const CPUSPARCState *env1)
 {
     return env1->psrs;
 }
 #endif
 
-static inline int cpu_interrupts_enabled(CPUSPARCState *env1)
+static inline int cpu_interrupts_enabled(const CPUSPARCState *env1)
 {
 #if !defined (TARGET_SPARC64)
     if (env1->psret != 0)
@@ -715,7 +715,7 @@ static inline int cpu_interrupts_enabled(CPUSPARCState *env1)
     return 0;
 }
 
-static inline int cpu_pil_allowed(CPUSPARCState *env1, int pil)
+static inline int cpu_pil_allowed(const CPUSPARCState *env1, int pil)
 {
 #if !defined(TARGET_SPARC64)
     /* level 15 is non-maskable on sparc v8 */
-- 
2.53.0


