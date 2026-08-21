Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C994C5DF7D
	for <qemu-riscv@archiver.kernel.org>; Fri, 21 Aug 2026 10:52:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wxMq5-00052w-3u; Fri, 21 Aug 2026 06:51:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wxMq2-0004v9-V5
 for qemu-riscv@nongnu.org; Fri, 21 Aug 2026 06:51:07 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wxMpz-0003Ux-Sb
 for qemu-riscv@nongnu.org; Fri, 21 Aug 2026 06:51:06 -0400
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67L9M5DB1896282
 for <qemu-riscv@nongnu.org>; Fri, 21 Aug 2026 10:50:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 VWq345a0G0XUYPJ8u6+lPJrThsdxHTF0ZV2AIgn58Tc=; b=Ho+SvkvhekCxRhmg
 K4iembLFfevuzGs5WIJgWTAyY4VAKnD9SC1zCbHR7+iuaMFpnBVr3Q6A0BpsaPPB
 V9slCB9KgLUHvHia6RzJnLW0LB4cN7/hQACmoHTGHT4HNlZLsfkPpL/xH/fiKabJ
 NgkgDWe6zQYaf4OP/KHHzzmPZui+1Wp2ctuf5zIZGasoRe6KLsgzm1VwzbcKTbb2
 w526eOtEVUOpaPhAO8s6ucDeVmh9jPZThXypmVszSVyPKIhi6XxTHVatCVWCsen4
 pzvMXkvV5PSzIXXlojAoFe+4bHSNK8/2n6hSPndRRPYkJRG3xceCqTNZj7THBMfs
 WonaUg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g6gdn975d-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Fri, 21 Aug 2026 10:50:52 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-526da7e3c9dso8282091cf.1
 for <qemu-riscv@nongnu.org>; Fri, 21 Aug 2026 03:50:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787309452; x=1787914252; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=VWq345a0G0XUYPJ8u6+lPJrThsdxHTF0ZV2AIgn58Tc=;
 b=EA9TwTkSdRLU9K6C3eAQ1H1hit2K9i3a2iCFKpBppy+hksmrmhYEh8TZ8RTxk7PRd6
 Cdd4q96I4BoaxgocPwcmrFXZbRnLHFuOb84ig26r3g0X8iwwWMeZNNEs7LGTRLG9Pebq
 VhFy1zRb8GSr35FvSk7Lor63NECFEvn1apthSKYbqU1WNeeHGMuVbUcpXyeSNB1EWMZV
 xjQVuEOdU2Dc/qizIIOjAmiu1u+hoc/QzSpAJ7uegSABLN/S8KNrC4/WhNE3InY7lZ4o
 DVIStfm+rHXauA9HcZRWm+cwe0eS2Ja2RlZbNuXu8NiO3IVFv21dp9gKUOAGangumRUv
 wvXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787309452; x=1787914252;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=VWq345a0G0XUYPJ8u6+lPJrThsdxHTF0ZV2AIgn58Tc=;
 b=mamb1x3GF3YVA83IzDWhIapGPXAW20SQbrPfOnUXp2DAL/0gXdwnlEUAldeiq24EZc
 dH8vlpX2PrzjXi3XR5GS08yBzH0QEIoAaLxB7Xr/Ib19baVj/O0yE/3jkEruV4APRAVK
 05+kheWYsjt3YKFEsx+BcgM58v2BcWNVWPud8BBU9IcW5UqAvERVZjHXNdfCZpgnC0cp
 tKT6RbnE/jpe7NTz19dMUolmO34EOS8o37jw/PkgClb6+JuZvLVFb+2aX9EHHoRfUkTt
 ZP3XLSvncCHEV1N/I7oXKbhWtW1Qwy//whz/gws7cQKgDEZm41WF+ziQES2dXZhPavEi
 w1WQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RpCSEJYvDCX6InaPR2+RJdzuVjR6m+JxV9OybufWnW2uysmlImcY3K1hSo7+NIAMq8UbbJu+76PhmVd@nongnu.org
X-Gm-Message-State: AOJu0Ywo+dhc/OVu24V6npaKRGCdIwzGKzjAN6BUI5jt8yYCAMXP52cT
 lTJwc+/8l28AF2KAbjnuUC4PaoX5xANzgbxPlrByPoJMEMTTHwB5NCstZhdSflSmszegCRxXDRq
 baliOclpeHlXta9uHJhwn2eZlzSigcKfdXMDB4mimcKpVkyI5SN213YiCIw==
X-Gm-Gg: AR+sD1088R8x0oSpz4971FQvl6+3Mq8VxFZEETDiGCSpBVBLzs0IflRryynoH32PDX+
 biyk2u1iWkDwbZ9UotGpoGUOksU6stQCt2byUt10XIlZCpUxkwdD2NYWpVcwiAueli6zLUbUKwp
 rQIK67l+vep24znhuMw65ZNdPOJleYtk+uwUI+lnz/Gi39EHvYtDrjbj2lVecE0Bh1T63l/u159
 QI9X4cM2JWu7EuACkhDL9DiZ4SW0zt2BXTW7eC5baU1cSEQwBW64vApjwH4XlVXSvyGI1ZbwJCm
 WgVJyLy5+cNnXgm31cBbPdlFMqpaQy8yF1JUb/HDgQhP0pDp/HNOQOIcFLr7dGC6ayXo4EgwMCL
 Yx1dVHN/8v2uxwy26zRLO8jNobCysOdUFo5Q8cXGFRg==
X-Received: by 2002:ac8:6546:0:b0:51b:f857:cf82 with SMTP id
 d75a77b69052e-52df5694797mr50222991cf.8.1787309452197; 
 Fri, 21 Aug 2026 03:50:52 -0700 (PDT)
X-Received: by 2002:ac8:6546:0:b0:51b:f857:cf82 with SMTP id
 d75a77b69052e-52df5694797mr50222521cf.8.1787309451781; 
 Fri, 21 Aug 2026 03:50:51 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-499b90e7fdbsm23197365e9.6.2026.08.21.03.50.49
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 21 Aug 2026 03:50:50 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-riscv@nongnu.org, qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Song Gao <17746591750@163.com>, Bibo Mao <maobibo@loongson.cn>,
 Xianglai Li <lixianglai@loongson.cn>
Subject: [PATCH v3 08/15] target/loongarch: Constify CPULoongArchState for
 various cpu_*() getters
Date: Fri, 21 Aug 2026 12:49:42 +0200
Message-ID: <20260821104950.32108-9-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260821104950.32108-1-philmd@oss.qualcomm.com>
References: <20260821104950.32108-1-philmd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIxMDA4MSBTYWx0ZWRfX4X2DZIXBEyKP
 aoZ5Qov8in5Jm0SklS/10+R9zgXuD18ch2QSt/edYrsn2z/cOc0ERs/YVMx+0Uob/u0mzVA3V55
 SxfXWay7PpQpLGk9Olena2kuGCw6mNULJjZK+3U2CBJo40DkDXDvZMQbuwfYt4ZmyOmctqTEgrj
 iAlZ7gdkfOs0960qB28+QkBdWxaNebU+sXtKYhueRx5gXCKd0Ar6Q4nkrUyIl7dTgxg81G2uKOU
 yZPtLRZlux6vZVdQdT7wS7T8I2rdAwmIJEwkrL+36V/VbMdDjsaIlVi2WwyGhLEj59Abm86GRBt
 vOexaxT+vf3lbWkz09+bU59SMz36zwyrpgDHDjPOQAs3OS4GnU2qOV3YHKpSqa6K7eqnk5RfNX7
 7YinMDoAp5xSmyfDZVm/opnC8wj2fUyBOT2dW1G5hmXHM0CukAfFjPbWyHToGwbJq5+TdphAGUi
 XsWzbsZVhB4WjhmRxYw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIxMDA4MSBTYWx0ZWRfX+J1a+MtkIvr3
 /jV1LvRlKutl22vmOrRavyGimMzYT+bKL0yjpAqYwsarGnxtPXC/v9oJpQb93g0/chbUot0pCHx
 zZXgH3DUdi6Hk8XvdglpajgiR8SRm0Q=
X-Proofpoint-ORIG-GUID: iBjMDr3VA_3lYOigCVbbM38rdKbTivXc
X-Authority-Analysis: v=2.4 cv=BJyDalQG c=1 sm=1 tr=0 ts=6a882d8c cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=20KFwNOVAAAA:8 a=WMCVsHtyMyZApbVNAjAA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: iBjMDr3VA_3lYOigCVbbM38rdKbTivXc
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

Add the const qualifier to CPULoongArchStatCPUMIPSStatee when
the argument is accessed without modification.

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 target/loongarch/cpu.h       | 6 +++---
 target/loongarch/internals.h | 2 +-
 target/loongarch/cpu.c       | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/target/loongarch/cpu.h b/target/loongarch/cpu.h
index 97db3b453fe..ad8e7497279 100644
--- a/target/loongarch/cpu.h
+++ b/target/loongarch/cpu.h
@@ -486,7 +486,7 @@ struct LoongArchCPUClass {
 #define MMU_USER_IDX     MMU_PLV_USER
 #define MMU_DA_IDX       4
 
-static inline CPUSysState *env_sys(CPULoongArchState *env)
+static inline CPUSysState *env_sys(const CPULoongArchState *env)
 {
     return env->sys_state;
 }
@@ -496,12 +496,12 @@ static inline void set_sys_state(CPULoongArchState *env, CPUSysState *sys)
     env->sys_state = sys;
 }
 
-static inline bool is_la64(CPULoongArchState *env)
+static inline bool is_la64(const CPULoongArchState *env)
 {
     return FIELD_EX32(env->cpucfg[1], CPUCFG1, ARCH) == CPUCFG1_ARCH_LA64;
 }
 
-static inline bool is_va32(CPULoongArchState *env)
+static inline bool is_va32(const CPULoongArchState *env)
 {
     /* VA32 if !LA64 or VA32L[1-3] */
     bool va32 = !is_la64(env);
diff --git a/target/loongarch/internals.h b/target/loongarch/internals.h
index 50f0fe2e9be..d6f31161e85 100644
--- a/target/loongarch/internals.h
+++ b/target/loongarch/internals.h
@@ -38,7 +38,7 @@ uint64_t cpu_loongarch_get_constant_timer_counter(LoongArchCPU *cpu);
 uint64_t cpu_loongarch_get_constant_timer_ticks(LoongArchCPU *cpu);
 void cpu_loongarch_store_constant_timer_config(LoongArchCPU *cpu,
                                                uint64_t value);
-bool cpu_loongarch_hw_interrupts_pending(CPULoongArchState *env);
+bool cpu_loongarch_hw_interrupts_pending(const CPULoongArchState *env);
 #endif /* !CONFIG_USER_ONLY */
 
 uint64_t read_fcc(CPULoongArchState *env);
diff --git a/target/loongarch/cpu.c b/target/loongarch/cpu.c
index d9c1e871027..2dbe2203b20 100644
--- a/target/loongarch/cpu.c
+++ b/target/loongarch/cpu.c
@@ -82,7 +82,7 @@ void loongarch_cpu_set_irq(void *opaque, int irq, int level)
 }
 
 /* Check if there is pending and not masked out interrupt */
-bool cpu_loongarch_hw_interrupts_pending(CPULoongArchState *env)
+bool cpu_loongarch_hw_interrupts_pending(const CPULoongArchState *env)
 {
     uint32_t pending;
     uint32_t status;
-- 
2.53.0


