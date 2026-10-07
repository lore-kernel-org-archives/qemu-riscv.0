Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A592CA6009
	for <qemu-riscv@archiver.kernel.org>; Wed,  7 Oct 2026 23:25:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xEb02-0008AH-Ep; Wed, 07 Oct 2026 19:24:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xEazt-00084V-TT
 for qemu-riscv@nongnu.org; Wed, 07 Oct 2026 19:24:31 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xEazs-0001Pl-B9
 for qemu-riscv@nongnu.org; Wed, 07 Oct 2026 19:24:29 -0400
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 697Ludmk945461
 for <qemu-riscv@nongnu.org>; Wed, 7 Oct 2026 23:24:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 sPCw/EvdFwhIRkHyh7pr3TPRAXD+Y54XtaA9bAUaGb8=; b=A0+A+1sdr4RqpJFA
 3gjU/HwBszuZDOWfJ98a1FqlBblMJXUnUiFiIdrg5lfOYJPyk9g07XIa29gCZgzs
 EQ4ZonBoCmQD0IhS7wD2ttwjq9LUbQWU8BMtprHgJ4nwIsAU5SI04yQ9iFFRtcEQ
 /nsypqVaGYRnAwGiS+JoMA/MiOabyGuu2Qw85dn9u/KTndRcQiqcn507ALbFl9M0
 mnpm4jqFN0Fqt/gbGCqOLnHNZ/9H54X7+ivdTL72svqxf367yJ6dEymWWasjP17m
 z5Z9iB2sMG5+LgAI/cfdKuANuX9D1JkmvIbcczUjZwgnSO9FYR8dEgpPSp3f+cak
 xcK9bQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe2rcae-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 07 Oct 2026 23:24:17 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-93cc0b31ecaso995487385a.1
 for <qemu-riscv@nongnu.org>; Wed, 07 Oct 2026 16:24:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1791415457; x=1792020257; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=sPCw/EvdFwhIRkHyh7pr3TPRAXD+Y54XtaA9bAUaGb8=;
 b=RAR/0fxFqlgbuIkbqq6l+qEmE3Io2jr0r1Exwaulmz29jZxivwdJAIJGZ8gsi6g2ca
 r8A+g1+QnLZgFef3muV0sT7ZOODkD/7Ej+zk0OlEU3T4l0f0tPW5lKmC1qxVjrPuVX4D
 x1hNJJUKtpwO/Gcdt2ucI3x+QCIlE4K1eDoufnTdrwwVIYG1AoYEtd393L9PsfQ1u5dn
 7/cBEjtGJDpsQcCWA+HW1sWLrUNxTMDexGOmWyZiv9H3ja0wTjBun0iwHslCSI6wiseI
 mW0UO9yYyxZSC5TnYkhREVF3bOPcZWBubemzPetSE2LHs9OKBx1HzTVNYUHpwSbPk5pB
 Xdcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791415457; x=1792020257;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=sPCw/EvdFwhIRkHyh7pr3TPRAXD+Y54XtaA9bAUaGb8=;
 b=lIdU4tm6rf3npTLngt02gD1bJC2ZxxO7LMgpcjzuKSMJbdmobc5Jz0jXsbQXGahBUj
 GpFJ8GAkuY/alS+kLUHLAfj988EaXicmlBxYiiVia07YOY07BxpnFN+yDT9yM8kKJzPt
 uTRtbz5l9TTO7ic112MYH7fseicLWof/kzvIaXc8NLd0XIknEg5HYpIEUKaCrXZ+Wbni
 6imKH62s2Sr/7uONjKr0gxQYgdKUxc2wyejNs5zJMZfRddTQBsk91GiCHPc4WlsJnBml
 jd4FKG8M1GFgtGgJ+CmJuGwRAE9z6hE7oZWqTANOLXrIDdRlNBP5E5dNjE0UyBjAQNAX
 PPeQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBz920uFZt4vrBXHYyb5jc/fGZWmAq4HoDhJqJMxVFR7BnpPtqNIwQ0WQ2MKCe0NBCgeLTze+dQW55ar@nongnu.org
X-Gm-Message-State: AFuF++nKg7SXt2A00oMtoJWndwninPFziOE95Qz22wWruLBKaXXIKCeP
 lZCdO+B8MF5ePjHAbztz1GLN76k2DfhROVLqJexPxphHjThV0p1nVSlVXZYThTuXWCVpDXDj90a
 7wXyJ+DC5VIo9DkcHRu6C2/Jevczm/78Fg9sewlL24SIS6B3Oh1aNV5xeAQ==
X-Gm-Gg: AYBFou3rB3lanNSBWaFSAOmzc3Gi5wpv7jUkMXtg3KzXJpAW8YhzjaC/76X3vqQhQif
 s677S5U1JFhk61xNuqU95XWut4HvL4RgfKyQlzBCE9m59hSh486zNiGuCk9++KBswyoOqjSkHxF
 WirosARYAyVLGCH/+CrjfYpN+7TO8odDTxpuLBXgRUwTYxQDMIwQtm77wi/0KmBKUxgXwA6/zXX
 2t2RIlh81E/ehYFrLqqbuQE+osOsxMOEm41Za8wYXso0JkvLWPRnr+howwR4+709MmRx55cLXEo
 4gzbl0jj99RZm9xkGBfY3nQzYyOxtiHP8e8VNNXehAyuXig1WPikHjbjeIiP3QMAKN2ltwwCNue
 8YN/7qMzG/v1jEU884CaAjlmHC1mlF/4c/mZOkZxi
X-Received: by 2002:a05:620a:2a08:b0:93e:980a:88b9 with SMTP id
 af79cd13be357-93e9b895493mr749889885a.72.1791415456634; 
 Wed, 07 Oct 2026 16:24:16 -0700 (PDT)
X-Received: by 2002:a05:620a:2a08:b0:93e:980a:88b9 with SMTP id
 af79cd13be357-93e9b895493mr749887285a.72.1791415456175; 
 Wed, 07 Oct 2026 16:24:16 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a1814ce9a0sm78762415e9.3.2026.10.07.16.24.14
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 07 Oct 2026 16:24:15 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-riscv@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Anton Johansson <anjo@rev.ng>, qemu-ppc@nongnu.org,
 Yonggang Luo <luoyonggang@gmail.com>, Chinmay Rath <rathc@linux.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>, Glenn Miles <milesg@linux.ibm.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>
Subject: [PATCH 06/10] target/ppc/gdbstub: Replace gdb_get_regl() by
 ppc_env_is_64bit()
Date: Thu,  8 Oct 2026 01:23:21 +0200
Message-ID: <20261007232326.66240-7-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261007232326.66240-1-philmd@oss.qualcomm.com>
References: <20261007232326.66240-1-philmd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=AbMkjHXG c=1 sm=1 tr=0 ts=6ac6d4a1 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=ECGyvcmLiFpczC5RLToA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: JwlzJMX-ZTc14fuX_nH3YIMxsgZ2Fus4
X-Proofpoint-ORIG-GUID: JwlzJMX-ZTc14fuX_nH3YIMxsgZ2Fus4
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDA5MyBTYWx0ZWRfX+6Xy8nvpL6qX
 u2yOTVT8zEHTh4P4bsDaHln6/gd4U/A5L6NfTg8StpCRCXiuPfh5rwtA47duS7TRuiVBuGem+6W
 5T3glOX680NRGbLUNYf9AKfupQnfALo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDA5MyBTYWx0ZWRfX6C9J31SMDGMx
 ZEmN3GWrk3Zh39MVLckONWGeDrvTs8Gj0v6pl0XlZOLEvCAe17KzPwl6PqP5zZFd7C8O0udUxA9
 fjDOA+NvDaXUn9xg4zlyP6Ccp06FjcGZhp5Tkzuh3wvHdbERO5eJf9zpAZYjt6DBOag9XwZdlCH
 S7qoLGj+SYN6X8XNFXSOVpSQtnUcNgSmQfOq7V4GOB+aKTPiBmhUxu/JIi+NJkVSJVNwjGSzfpF
 0hzqB0gadU42xcfpxzHlbnQrmZaQK0LehAEygHSwPw2mvNiTG5b6lsqTQ+S1bjnkx5KlAb3PHKw
 0R4ie2Ti9j3Rs8HM+FpaAluHBf9kMbl8VklNCx4013MbVR8NKPsKXRxXDfQnq8H98H8VtO/Ye4A
 PpufL1dffnWKzC7kL7++Dlhf2JDavH9ICebU8sEPZYtPRIHe9eepmjO61+G/h1ZZpcWZ2uVqCIW
 duydUTL3yo9A4wetH0Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_07,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0 spamscore=0
 impostorscore=0 malwarescore=0 adultscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610070093
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

Inline the deprecated gdb_get_regl() as ppc_gdb_get_regl(),
replacing the target_long_bits() check by a ppc_env_is_64bit()
one.

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 target/ppc/gdbstub.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/target/ppc/gdbstub.c b/target/ppc/gdbstub.c
index ee02be63ce8..0071c2b3bab 100644
--- a/target/ppc/gdbstub.c
+++ b/target/ppc/gdbstub.c
@@ -53,6 +53,13 @@ static unsigned ppc_gdb_register_len(const CPUPPCState *env, int n)
     }
 }
 
+static inline int ppc_gdb_get_regl(const CPUPPCState *env,
+                                   GByteArray *buf, uint64_t val)
+{
+    return ppc_env_is_64bit(env) ? gdb_get_reg64(buf, val)
+                                 : gdb_get_reg32(buf, val);
+}
+
 /*
  * We need to present the registers to gdb in the "current" memory
  * ordering.  For user-only mode we get this for free;
@@ -98,14 +105,14 @@ int ppc_cpu_gdb_read_register(CPUState *cs, GByteArray *buf, int n)
 
     if (n < 32) {
         /* gprs */
-        gdb_get_regl(buf, env->gpr[n]);
+        ppc_gdb_get_regl(env, buf, env->gpr[n]);
     } else {
         switch (n) {
         case 64:
-            gdb_get_regl(buf, env->nip);
+            ppc_gdb_get_regl(env, buf, env->nip);
             break;
         case 65:
-            gdb_get_regl(buf, env->msr);
+            ppc_gdb_get_regl(env, buf, env->msr);
             break;
         case 66:
             {
@@ -114,10 +121,10 @@ int ppc_cpu_gdb_read_register(CPUState *cs, GByteArray *buf, int n)
                 break;
             }
         case 67:
-            gdb_get_regl(buf, env->lr);
+            ppc_gdb_get_regl(env, buf, env->lr);
             break;
         case 68:
-            gdb_get_regl(buf, env->ctr);
+            ppc_gdb_get_regl(env, buf, env->ctr);
             break;
         case 69:
             gdb_get_reg32(buf, cpu_read_xer(env));
@@ -281,7 +288,7 @@ static int gdb_get_spr_reg(CPUState *cs, GByteArray *buf, int n)
     default:
         val = env->spr[reg];
     }
-    gdb_get_regl(buf, val);
+    ppc_gdb_get_regl(env, buf, val);
 
     ppc_maybe_bswap_register(env, gdb_get_reg_ptr(buf, len), len);
     return len;
-- 
2.55.0


