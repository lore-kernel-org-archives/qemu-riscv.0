Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9D68C5DF7D
	for <qemu-riscv@archiver.kernel.org>; Fri, 21 Aug 2026 10:51:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wxMpi-0004RL-Vq; Fri, 21 Aug 2026 06:50:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wxMpf-0004Pc-CX
 for qemu-riscv@nongnu.org; Fri, 21 Aug 2026 06:50:43 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wxMpd-0003P5-Gg
 for qemu-riscv@nongnu.org; Fri, 21 Aug 2026 06:50:43 -0400
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67L9MGl82325341
 for <qemu-riscv@nongnu.org>; Fri, 21 Aug 2026 10:50:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 mEq07J79FZAVrGE5OPh7byVYhPMuxRT7e37T72un2JY=; b=CYeqsNFMTEsFzDKp
 wjmQfbx6g+S94umHeOXG0HNgFNNxaWooqbkuO0EH06YaccqNL0RR2DTRYtd5IpnO
 g6m92JBedg2pWvtzRYyT3jD/9lDHQtCLw9BmBz5JYLMbTPByxAOE3ohFo97nLSic
 o6qlm1GcdzfT3ARvnUCHQnfxLpm643XKKg0uIsPKZR/dB0muTvpWpwV0KZTEGHvM
 D/4JH6pHh+9EK0FP7TJIaPeajOUl/bJ7DLwfPdMXxHGO6aPvSNCqiyAGe9M8Lh2Y
 15s07bckP43tdoRuHJGXQWmrTUrIS3Fke0Gx0OM0ird76KUyELIMAlQF1MOoP+c4
 Gf92QA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g6gdf15h0-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Fri, 21 Aug 2026 10:50:30 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-5276aa86d00so8660761cf.2
 for <qemu-riscv@nongnu.org>; Fri, 21 Aug 2026 03:50:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787309430; x=1787914230; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=mEq07J79FZAVrGE5OPh7byVYhPMuxRT7e37T72un2JY=;
 b=TCN5snuSsODGAnKEAFXczpx++aKTAmu83EFzpkXraUHQSBXpH2gsGWGJHNBRFcUy1K
 fClrDfjedLjgimwMrNIlmh2GmZJWC5BWa+C9OwE2gxTFzQVIbek278ZAbSW/G74R0iMc
 kcYCFHBbl1b2+zG5c7O4tNGqVybJIcC8wEFYWA3JXANUqSAJqbp+AxOPh8x9gDylJzCy
 1hnDA0cKJzlbrkIXJoQWx+0wC10GyYcRmXBtTVLXKM9ElqFfOz5kqO+8Iwny3aikm9vb
 dRMfAA468sMbLkjrz5LPtPnaVfkTX/I3VVbLh2asccnjOFb3Z+eDXCnDLWMc+cPObgiJ
 0FOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787309430; x=1787914230;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=mEq07J79FZAVrGE5OPh7byVYhPMuxRT7e37T72un2JY=;
 b=etTYoX6riBlQLjzE4xkIhD+6CPo1y3ZBz1F8EDS5rhwJ+4mBJTw5DQNkeyw2EOycbz
 lFlZCXhZ/tiAMkLCM4WE0CwwLzRW3KedoNY3S6z1REmmvXAeON8th3vqZV8geM++qDkQ
 KEJhZ0rlbrLmG7+YzUBQaGAho5tbkrKprFIT9ddOE/nflcrORaG9ZyOgevVBKJMpLMMl
 XjQ5i7HtXnFyGohhQ9aOvHugAiUL+jRReFnbGJNFg1C3QVOt14Ptdp5I68zcUwQWiFxC
 Uy79xuJrRTPrlhildjU5yChLpY/BE0oAinyhgLr6bkubdVVzCqZP9bcUunGBjZ21xv+0
 b08w==
X-Forwarded-Encrypted: i=1;
 AHgh+RqbXw1pxiRb6lXpp4GqXzJRDqO9cs2HZZg4vh/3S/w4iNvYttcNGuo2/F0xlhJe1q9D5efwH1PbvRb1@nongnu.org
X-Gm-Message-State: AOJu0YwahuypTX8q5++Wav9Dl7UZttuV9eQDItN926ZIy/DoYX3tMlwr
 IhRys52zsms55Qb3RtPFhfyVQT3SLd1acjxNmxfJjtAh/LT3kQf3G4unIAWqM4aJdzVg1TX8m10
 X3BihRsD/DrZ1c3H68QEknoe2QGB/AMusBRnBNLg64AE+t7dVq4IxDPUL7g==
X-Gm-Gg: AR+sD10HPbyi5w1W3blV6EjyWusS3wtEqgKlcwKYy+oqbEs6+b+hI4EVbuCXaxevrkd
 tFWOQ9oW1ZrjYjeXcX0ZIlZ36HnYfYCISAWkj/vasabkHMMLLRbwPH8NKm8vYy5tX2SdtmYcaYC
 HT/q1afHgtlFb/u+7tcX14NzHxo241P4/dKRkeleV+6qzec2V9cL2YcN2hnJ3ClTfSsDMlqiJuD
 6lw3OA5v92hBJMrcJ140awyqn+u2bcKgpsUGwVDi91ERLa1S+PYhubXHfaDFl8k5aamoXaWgdR4
 YrmAFA8C9arEMuMNdZ5cvgzlp1Lv1MAgg4zQejvgWZIXnMUVA/lKnzo2O8/ppeXN7CuJLD2OVrT
 BqNUcrbyCY2Pztl3PPpMW+91tRcv99dHn6mlmMLdC5w==
X-Received: by 2002:a05:622a:1353:b0:52d:6c36:db32 with SMTP id
 d75a77b69052e-52df5ba9d3dmr34679761cf.41.1787309429934; 
 Fri, 21 Aug 2026 03:50:29 -0700 (PDT)
X-Received: by 2002:a05:622a:1353:b0:52d:6c36:db32 with SMTP id
 d75a77b69052e-52df5ba9d3dmr34679551cf.41.1787309429541; 
 Fri, 21 Aug 2026 03:50:29 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-499b9b81486sm12994635e9.4.2026.08.21.03.50.27
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 21 Aug 2026 03:50:28 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-riscv@nongnu.org, qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Michael Rolnik <mrolnik@gmail.com>
Subject: [PATCH v3 05/15] target/avr: Constify CPUAVRState for some cpu_*()
 getters
Date: Fri, 21 Aug 2026 12:49:39 +0200
Message-ID: <20260821104950.32108-6-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260821104950.32108-1-philmd@oss.qualcomm.com>
References: <20260821104950.32108-1-philmd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=CsqPtH4D c=1 sm=1 tr=0 ts=6a882d76 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=20KFwNOVAAAA:8 a=064F3_fa85QpgnnSfTgA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIxMDA4MSBTYWx0ZWRfX/4u1yXjJlnk7
 slHakkJraNeFsLRfgD9MoMZiv5bb0ki21oh+oS0R9AaAlQhu1VV2f6WfjjnkmNjBz1hwL+Z6zWb
 9dOP85hkskcDYznjtPT56nYfAeOqiConhU0Ztnc34F9Z2j98dJs5OiWTwldWHBtRR2UsZA9w8WU
 gN56TbN5/eWiyqwrVr88jQx7NecfP/Cn0ZLS90A1MZJRpOx3acgBHztthpy0whgXrV5oMuEObQC
 JOChADJhkNnxiYDq0RozHOMrmpneMij0olZ2wGqqfhwzprbofGlQ5Pp/XKEHX+OA9NtUDYzybpg
 RQMeXdCDqt4E/VtDQ74t5dPbC4zF7skkJOMBcuyGvTHhYdLEtnk75lL5zmv0jvpNCbzE1QuWD3F
 vkET6xR/Hbs7Jwc9IphBUJ7M6+ipVwui7gZAYLWNuPjiwyFZFLz3I8wlPaXLeesucy1AT+sVPzB
 ybZ+QRAkmJXTbWL4+tw==
X-Proofpoint-ORIG-GUID: _gUDqSrBpI_XA35CcKbWnHsonQXS9UT8
X-Proofpoint-GUID: _gUDqSrBpI_XA35CcKbWnHsonQXS9UT8
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIxMDA4MSBTYWx0ZWRfXxFyjYMGZxTSc
 oa35YVEhhcZx8Zr6hE17CVzuJxMQ/8/gkhUKgvSM7JU8ORGkgQVs1cADxRVjex9wofGH75fK26b
 gLlhS8yZWv9CRHCMhv4Mj9RyUQQwF6I=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-21_03,2026-08-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 malwarescore=0 clxscore=1015 adultscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608210081
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

Add the const qualifier to CPUAVRState when the
argument is accessed without modification.

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
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


