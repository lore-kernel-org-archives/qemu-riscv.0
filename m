Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A87A3606A31C
	for <qemu-riscv@archiver.kernel.org>; Thu, 26 Nov 2026 23:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=J5VIM+mm;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=e+vFrzaL
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xWj2O-0005rz-4G; Thu, 26 Nov 2026 18:38:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xWj1v-0005Ny-8f
 for qemu-riscv@nongnu.org; Thu, 26 Nov 2026 18:37:33 -0500
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xWj1t-0006uv-G2
 for qemu-riscv@nongnu.org; Thu, 26 Nov 2026 18:37:30 -0500
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6AQJw6HL781851
 for <qemu-riscv@nongnu.org>; Thu, 26 Nov 2026 23:37:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 K+1rYPMLMIU1uLFcv/qtFlOmnLx9HwEmB05o3PG19RM=; b=J5VIM+mmkANxLXhN
 fI5+3lgWROGG6/JjeP17XbvAA0TpEawXnsZvIEeppfg/ucA182LQlOb7F7RT0f9x
 N7KsiFTiCBsgkY0ld+Co2AZGWZKrrnZjyqaw2eC0BsE7OHhrJssvwT+v/jNKL2Dh
 219fYNU4QywwpGsaV2oXPC5Pz83qIR4zZixGy103ZYfYRU2vMyb5Uh6ULnzi/rxK
 Phs+Ds+Yp4oVdaQ5KZDU1Sc49O61gN3SZv+7yYaFSuNFN1q3GEP2ZrevouJMxx9N
 8YEv9Z+B/54EwY5IyZ08tyc3Klu73yREvi9qZk5yFZ414cQAZyuUt4rPGtUV+elb
 1B62Ew==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6hm82m72-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 26 Nov 2026 23:37:18 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-94961ed97d6so1245799385a.1
 for <qemu-riscv@nongnu.org>; Thu, 26 Nov 2026 15:37:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1795736237; x=1796341037; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=K+1rYPMLMIU1uLFcv/qtFlOmnLx9HwEmB05o3PG19RM=;
 b=e+vFrzaLmYa5K6VDlMZFKCBXpyRNEbeOthrF1rI8v1WTglioiMqPche+oPjPF8jAAg
 nE1xnpPMFO9g7av+N9pjVlHPYxydNQ5GEft/vzHSFFGGUOFUvhUqHPbUPYOPYEv4PYaT
 Snr9H/6FwbZSxpaI5jIW8Xgk9B/Rekrmm7mCrp8I9uU8VZivQ3q3eYk48lqiSEGfDTd5
 D79Bqf6bXb3HUU5PC+dysw63GV+v+S82HdyQYZhC3hXep9xZsjS7s7g4nRXrWchLe1eq
 hfXNzEQ6zqCKy8EpcvSBGuYPgmHMqHsz+0lp4a/kwPEIHHH78yzc/ejYAfSN8zk0o+lR
 HfMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795736237; x=1796341037;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=K+1rYPMLMIU1uLFcv/qtFlOmnLx9HwEmB05o3PG19RM=;
 b=s5OTygTbhTyO1/sUKVoWCk+XE7gvXy1+icymSeBYroDGfoyPnZ7rcMzJ62xB/JDxOG
 OQBSUOxqKr6kUkLidhngUKjCH2aTo/2edqYx6wzRkDTog7WAW1Bf/8pnYy6uQ0SSzKHV
 quHFGLmJczpY5ML/e9D/QnmJJhHvdmYrCJiFtDRYThrmyAPYAzxQJqmnRNAe0Zc600/H
 9uX9UYx6nV1akEAY8uAIBlRnUS/ofae5VZSZirMEnW/ad35um0sUp89Czscbrn9oyVCJ
 4NbsCTRguG4g5bcuX30ZqGeJ0BjTk27eVsEUQHDvpvu1RtmAbw/p+ikJJ3tZPUUKhxSv
 V1wQ==
X-Forwarded-Encrypted: i=1;
 AL+hErHvh+mES3MySiWNwWTPjACwWV2zLOmqrWRzfMQUJCdwMGUqYJDtJ1whmOV+C0yHrJpO1gPtIjQaxiLT@nongnu.org
X-Gm-Message-State: APuU4Z+VtgaCue24UvaJHNk6s2GEwn/IeVRlZnn5LtzlAPt7SaC7dtZ0
 0JuBVStl0QxluDo+mTM3AiQQpSMQ/HBxj/o9fxooJSsW4n14fQkouDz3hg7gpvc1BkdT1eVpuLm
 gA8vAXebJgX2iZpzhJ+JxaXC4syrLeSkVfqn+Jk5IWb33j+r7W9bCAa8GWw==
X-Gm-Gg: AZFdTZc2IeN5oBfjXF4DXIWRvlb9MjzImx8BrVc8rV+2ANaHYcy9J+Ca6DY1kY2J7Kd
 6e4he8yiXTrsSlsMeSe7gSdyMwWm8tiQxl4ZUFycSzRac0E5p7f32ktTshUAYpf3ZDklGlffKeZ
 Y6awiyIhkZGcuq9Rt5kr8mbGkuCNJw62ndqM1FrZHIon/Gi5zsq5C3HI2dJyZ9VGp24TCYtZsPO
 fEuciohCn5gt3f3vi8vPElbnPpjs/aJEiRVkq5ZQC0vHQBYncNRFRj8efKp84pK8QHOrB1kYdUN
 b/997VMxHI3tmTR//6gDDOCIWFNAUynbQJq3moI2LAYkZ/LJ7KV4PVwB2HGlRWPxNLmJtL7UnaB
 I0clLt6L8kCBDZlqwak5zWP1jQHlwJTYei4LX/MOxSbwgxltvZoCOi+EIjkGK1H8YWzviJ6wMjC
 zFiYhjbdZwd3/acw==
X-Received: by 2002:a05:620a:372b:b0:949:70c5:c0ce with SMTP id
 af79cd13be357-949b35ac8e0mr4173812685a.19.1795736237573; 
 Thu, 26 Nov 2026 15:37:17 -0800 (PST)
X-Received: by 2002:a05:620a:372b:b0:949:70c5:c0ce with SMTP id
 af79cd13be357-949b35ac8e0mr4173810485a.19.1795736237132; 
 Thu, 26 Nov 2026 15:37:17 -0800 (PST)
Received: from localhost.localdomain (pmd666.hd.free.fr. [82.67.153.177])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4ab6bb989b3sm43372266f8f.51.2026.11.26.15.37.14
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 26 Nov 2026 15:37:15 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Anton Johansson <anjo@rev.ng>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH 09/24] target/i386: Use 64-bit TB flags
Date: Fri, 27 Nov 2026 00:35:47 +0100
Message-ID: <20261126233604.67722-10-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261126233604.67722-1-philmd@oss.qualcomm.com>
References: <20261126233604.67722-1-philmd@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: H_TbRJwhPBdvwSR9aAXiF4zvJAe_KUWJ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA5MyBTYWx0ZWRfX2YeWZ9J7ahD+
 MKYp3AfgMX9qsSQNfV65faksStgyCAuIIjpejOnIuZQz9DWmpZOW9pzUYYCi1XsuEVJ+RNHvymJ
 zTLq+z662PIqvbFboEZjq/BZnyMSvXo=
X-Proofpoint-GUID: H_TbRJwhPBdvwSR9aAXiF4zvJAe_KUWJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA5MyBTYWx0ZWRfX/26g2qhNyRJA
 ej1fPbIc5YgoSJ4ZKH9R9VHxgykburZireYmWEbn3a8EWs0H6NmUXzWO/VTMJkqnQ0DJ4lzIBtH
 ZXiGZlwGKQ0FO+16YaAzOSP+3G9G1tv9fCYvda1qgf+3YEh5Nb8HZWDuNc1TbMqk7Mdu+ThqlXh
 hOAG7jI0bSZuMvcdHOkwm4UYYf2OlukSh9+bctcfEjMp8nGiSBxbcpAj8Pn0AZnEKjcjVtZeGkF
 3/a/eLFlGN7aNCy1kSBA3vW5v0UtLQ4Q1crLEDSFQPb4eTXEI4Oo3weh5Z4Fudd3QqZvsxzBpxU
 kBVat3Lf0wAu4xpXglHSxnc+VTiCvX3HW3anKBkK77LwUyN5o4AlsRGelIxaXmOLJN8MIMprylm
 qoDYxoJGA3EJBqecxKQCqX6mF8Ia1u0Wk0NFf8THMpNZneJ+OtzBEZhj1qQMuefd53QY4G7y6ZK
 Nl/xazJruAlX6Qi/1Dg==
X-Authority-Analysis: v=2.4 cv=O/usLx9W c=1 sm=1 tr=0 ts=6b08c2ae cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=nz36NW0qrpeEijYxj/H2Ew==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=7CWSldxV8w5ZVOrNXgYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_05,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 bulkscore=0 adultscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260093
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

TranslationBlock::flags and TCGTBCPUState::flags are now
64-bit, use matching types for the values derived from them.

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 target/i386/tcg/tcg-cpu.c   | 3 ++-
 target/i386/tcg/translate.c | 4 ++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/target/i386/tcg/tcg-cpu.c b/target/i386/tcg/tcg-cpu.c
index 167ff7695ae6..bdfd08107d6a 100644
--- a/target/i386/tcg/tcg-cpu.c
+++ b/target/i386/tcg/tcg-cpu.c
@@ -53,7 +53,8 @@ static void x86_cpu_exec_exit(CPUState *cs)
 static TCGTBCPUState x86_get_tb_cpu_state(CPUState *cs)
 {
     CPUX86State *env = cpu_env(cs);
-    uint32_t flags, cs_base;
+    uint64_t flags;
+    uint32_t cs_base;
     vaddr pc;
 
     flags = env->hflags |
diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 719771032ff5..af98125cd718 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -122,7 +122,7 @@ typedef struct DisasContext {
 
     CCOp cc_op;  /* current CC operation */
     int mem_index; /* select memory access functions */
-    uint32_t flags; /* all execution flags */
+    uint64_t flags; /* all execution flags */
     int cpuid_features;
     int cpuid_ext_features;
     int cpuid_ext2_features;
@@ -3535,7 +3535,7 @@ static void i386_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cpu)
 {
     DisasContext *dc = container_of(dcbase, DisasContext, base);
     CPUX86State *env = cpu_env(cpu);
-    uint32_t flags = dc->base.tb->flags;
+    uint64_t flags = dc->base.tb->flags;
     uint32_t cflags = tb_cflags(dc->base.tb);
     int cpl = (flags >> HF_CPL_SHIFT) & 3;
     int iopl = (flags >> IOPL_SHIFT) & 3;
-- 
2.55.0


