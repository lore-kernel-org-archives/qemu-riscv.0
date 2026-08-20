Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ED43C5DF82
	for <qemu-riscv@archiver.kernel.org>; Thu, 20 Aug 2026 10:48:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wx0JH-0008CE-Jo; Thu, 20 Aug 2026 06:47:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wx0JF-0008BJ-TP
 for qemu-riscv@nongnu.org; Thu, 20 Aug 2026 06:47:45 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wx0JD-0005h1-QK
 for qemu-riscv@nongnu.org; Thu, 20 Aug 2026 06:47:45 -0400
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67K7LFlm2753071
 for <qemu-riscv@nongnu.org>; Thu, 20 Aug 2026 10:47:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 OesEcufEhEzMhBKLh/i/9HJMWMl2iNHPd71jd4muFYg=; b=BQr/YcSWrgqEoUB5
 GrLOCC6cDmTaUh1BsFLBE7uoUp/t8o8GovvbjiO/wnelaJ8X8jDqNTbNYdmgg+MO
 V+GHAsDml+XgPe5A4ZpbjcuW7x686WdOcVdFaSiBzDWvySk9G/sVeGO5i4XJxYkb
 +X/2pki6ukKr5OCRX6/mE834jlnXuBeZrwuIIu+bIKiMusa7vO4lkCKCG4QYC4dz
 8xrzRLJNrOc1mgQxdU2sAMuWi5HLZa67DOU8CEn2K0syfKQkLxOCywD9uTWqOAml
 m5d+xIQLh/+QC3kTpI5zfnArbmx1n/7ZVVdHEhTwWdld6fCvcw5IJfOL2B3lCRmd
 p0WUfA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5w498swr-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 20 Aug 2026 10:47:42 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-9308eafb465so431627885a.2
 for <qemu-riscv@nongnu.org>; Thu, 20 Aug 2026 03:47:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787222861; x=1787827661; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=OesEcufEhEzMhBKLh/i/9HJMWMl2iNHPd71jd4muFYg=;
 b=Y36A5kdcbSeQUU0CMOcN226VLdU3jE52sY6YOC9OTcIjPUtwJxVtvNwn3YT3O5r7Bk
 hMTLgSGQpoNQsiXwpYOG5Nd4Ff9BG2riYP9PrNF7rEVJGRi6qAuAt8bkOy9QOCx2qZi0
 V+Z7+p7nlui8e1qbsWB98m0PZLV9Q6Za8g8EwCVEmvMfG0A8WFfeG7TrRU1aFtwZOR6H
 /p3uyf8hTmop278lwPcOHXtOu0y4hNBga1llMl0wLKF26nuWk1YKiZ2TvpI5FWm67btN
 588zL80PMVsEp+NjGn/T3RkVTd0n7GfOlDgz0GcGrAdT5RKKUfiICaAVxdo7EunXtRQj
 TbKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787222861; x=1787827661;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=OesEcufEhEzMhBKLh/i/9HJMWMl2iNHPd71jd4muFYg=;
 b=DR+L4Ud6u0rl7575nHZCq6TTUrvzHAgVY/+T/Dy2FVJxtjhbfixLTqc9FsJo6WgHXI
 UUL/CxtFzwREwIGuOI6hmu7ZNfwe1cZrsD3uiFncIlJzIMZ5mL3L6Eq/DCiJ9np09dVK
 JISTXWB3LxcyfDzXwtZjBvbY5XahucdAtpRMipjUXw9daks5nZldOD2HRXZEy9PHQOtj
 8KEQxpPHsyvBxFlHm43y4gpOnvlMEqJkaLFDubrudzCxNzYPDp0tcW+52j51FpX0V/IS
 zU0yFEax4kMnH2Pze9KTOdZ5+hcgV83/8cUMeS8IrPQCp/jRNkBkFT3Qyg4f9ef2vX0M
 jj6Q==
X-Forwarded-Encrypted: i=1;
 AHgh+RqMyby5fjFBsEtNlNsYzhSz8h7QU6V+hgQ8Qcbaj5eByMBFG36zafsnWv5x8ORsGSuaOcllI8WYNboa@nongnu.org
X-Gm-Message-State: AOJu0Yw2+U1XxS+an0/hD6k7Mkw9RnBTDPs/NETCDjVkmtltgIq+6PqU
 V36IK8lTk9BTMLD6s5PAQLqHb/x/qkFvhsItMKw2/Tf2b+nlGL6PRgqOF4fU6iYrNZBTAyrZRS2
 dCEzNrTbG/BoodA33HIugsyvjR9skWZNwn64UmQcsIPKrCOYWu+qhEvBadA==
X-Gm-Gg: AR+sD12TDVpP0QJKhlx0IcPxSSE7M5GWAD1wLu0JLXJebLvk+GVTRfTxi331Wku7Uu+
 3V0sb8S/Rv7VTacFQXYG93Olwmbm4Y60N+XLuJVOQ22L0yvOz0cJZXvH6MFAZgkxq22oDmVYWYh
 31A7G+sevHHxTCuYggAGrv3Kh6sDMcIKivjEH7ZkEBMAHV10X88p4CdKCa9Tr1JYiPjF3vtkQL+
 DZTtwekLvH57tUrf2eyqhD0b6GCG6Y6CQcesx+OiVyuHrjOogPA1j2/fDOIczSmxSuKCiwUoUxC
 w2osmqvC7uVVPuQyk3H5Z0+0pI4LzjwpSyebEL3p4ceMOIH0NyIjvkCtkeK+o8ex+pflWoAaaFT
 3g9IqTFyWKY0tqKmg+2Mtbrggmrw6xXrpQtagiR62LA==
X-Received: by 2002:a05:620a:4156:b0:937:1225:ec49 with SMTP id
 af79cd13be357-9371e21fb02mr1001486985a.18.1787222861380; 
 Thu, 20 Aug 2026 03:47:41 -0700 (PDT)
X-Received: by 2002:a05:620a:4156:b0:937:1225:ec49 with SMTP id
 af79cd13be357-9371e21fb02mr1001480585a.18.1787222860319; 
 Thu, 20 Aug 2026 03:47:40 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-499a9e784b3sm117748025e9.3.2026.08.20.03.47.39
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 20 Aug 2026 03:47:39 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Michael Rolnik <mrolnik@gmail.com>
Subject: [PATCH 01/13] target/avr: Constify CPUAVRState for some cpu_*()
 getters
Date: Thu, 20 Aug 2026 12:47:17 +0200
Message-ID: <20260820104730.25462-2-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260820104730.25462-1-philmd@oss.qualcomm.com>
References: <20260820104730.25462-1-philmd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDA3OSBTYWx0ZWRfXzyoT+b1CAuFq
 ErkFwEDsa6OVVxHcYBtpLKzkoHWFknuK7TLVynR2vj2cU6Hb3UoM6WBv2zoOwjpFrfFEata7JCN
 4XUIuMYMojAPKZwPy32BT45D4l3lHaQ=
X-Authority-Analysis: v=2.4 cv=YP+vDxGx c=1 sm=1 tr=0 ts=6a86db4e cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=064F3_fa85QpgnnSfTgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: 3QT2Wxa4QSVK2HDiCazm8eUnUkPhrIWw
X-Proofpoint-GUID: 3QT2Wxa4QSVK2HDiCazm8eUnUkPhrIWw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDA3OSBTYWx0ZWRfX9Dwpcdd+607Y
 /JdMDzrXK97hI1f6N43q0hpKE+ZTR9kDHCgHhRIuM86BFC9q231DPRbnFTTbyfQjrpKvres5ftr
 5si/JqjeDkZnH7PvZk+4gK1edieuYA8OT97a1ZeK5bRef0L96Kd/1B1HKrcFvJ1y/QDZP7GyYgy
 B2/ZChmTeNFVoznRkbAndM88Jn1495yIpUTfjcrhz96hwBB6LW3UgfrnvBjmkSLTEkhB0UbuVKM
 9BJUIiuTWluA9uO1X0zWRA/BgcwpuZ3+Ehc+DsL1cpBfTATdl0da+Euipz0v7zofKk91bAUFmbI
 EoNwjnrK95sAE3VWKYXzxsEmkElzVocKBadAuNgvxQnMo2Jv7ne7YeMpcHTvbkotlpBWTBfv923
 7kQ+kKhgwPTWDy552aWbTzE9NsDzRAS2UnP9UIJWBimKxO6emyS42daUyiIqWdXToso5N4I26xn
 T/DYZ8xvopLzjDXOiNQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_06,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 bulkscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608200079
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

Add the const qualifier to CPUAVRState when the
argument is accessed without modification.

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 target/avr/cpu.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/avr/cpu.h b/target/avr/cpu.h
index a818db753b2..1e4e839bd83 100644
--- a/target/avr/cpu.h
+++ b/target/avr/cpu.h
@@ -183,7 +183,7 @@ int avr_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
 int avr_print_insn(bfd_vma addr, disassemble_info *info);
 vaddr avr_cpu_gdb_adjust_breakpoint(CPUState *cpu, vaddr addr);
 
-static inline int avr_feature(CPUAVRState *env, AVRFeature feature)
+static inline int avr_feature(const CPUAVRState *env, AVRFeature feature)
 {
     return (env->features & (1U << feature)) != 0;
 }
@@ -204,12 +204,12 @@ enum {
     TB_FLAGS_SKIP = 2,
 };
 
-static inline int cpu_interrupts_enabled(CPUAVRState *env)
+static inline int cpu_interrupts_enabled(const CPUAVRState *env)
 {
     return env->sregI != 0;
 }
 
-static inline uint8_t cpu_get_sreg(CPUAVRState *env)
+static inline uint8_t cpu_get_sreg(const CPUAVRState *env)
 {
     return (env->sregC) << 0
          | (env->sregZ) << 1
-- 
2.53.0


