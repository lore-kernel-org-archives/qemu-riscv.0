Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6482C5DF89
	for <qemu-riscv@archiver.kernel.org>; Fri, 21 Aug 2026 10:52:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wxMqL-0005GS-Gl; Fri, 21 Aug 2026 06:51:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wxMqF-0005C3-9r
 for qemu-riscv@nongnu.org; Fri, 21 Aug 2026 06:51:19 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wxMq7-0003Wp-Am
 for qemu-riscv@nongnu.org; Fri, 21 Aug 2026 06:51:15 -0400
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67L9M3PI2006429
 for <qemu-riscv@nongnu.org>; Fri, 21 Aug 2026 10:51:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 E4Asvl4uLwcbAodqEq9ruJYyCPOIEYw9M6JfsXTVRG0=; b=hY7b/+8NUtOuEhE2
 42vGHpAQvIVlkSu0nPHhx/QSViS3AZFXgKK/1nnntdmMxtcKtNEz+klU6J8znvx7
 Qlz2JT8dhnMvwBSQ7P46bY4iW6/3IZuklqbHEP9p0lbnsUn5epPZAA2lbeqeyORs
 zmW3Vyl/rwwVAV4bKg4AO08wJca82pw51k3OlWeu2TPfdsHr/ApjFQcvUTuESjhm
 eK8ONVD5MEp3XdQmblba2LXJlK8zrJlWQZOdi+8pnZRrJKH+oT0cZWfPtivWcKdJ
 WuHyxvHPp/7og38fx24YtHGMU2izmQHpchqJcB2o6S1muBANP7MAikvH8I1NX9gP
 W/c6XQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g6gddh668-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Fri, 21 Aug 2026 10:51:00 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-51c1a97644aso10194871cf.2
 for <qemu-riscv@nongnu.org>; Fri, 21 Aug 2026 03:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787309459; x=1787914259; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=E4Asvl4uLwcbAodqEq9ruJYyCPOIEYw9M6JfsXTVRG0=;
 b=gIjMH2vwLcHIH8E7kcr3kvV9ZfBBkfugCTuh4cZfiFbV/ltINxFJtFtxlRLgnu1DhA
 SFPAXsmB6PNQ7RWO+97HPL5zkbd8NCnhWRJVGZjvxepp9aB+eD02p9pmoDNjXu5p5Gmg
 kdV/6R43AxWs6aWCwBOHlY5djyps7gkBdMTDetbxKWM23/2vhiotyXk03gNbOiT+ZLue
 nHId+vbFU1BZJJPNemxWq/8ieBtWjVKlai5Rfp+NOteDk1Qt8/Qru+bEHkpbAtERWE2B
 58oYWErfStp5V41S3xnXaoeeyTJnLY3Knh7PHQK4bzWubHepm1qOsCnoqVKp1bgmcJET
 FIKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787309459; x=1787914259;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=E4Asvl4uLwcbAodqEq9ruJYyCPOIEYw9M6JfsXTVRG0=;
 b=iK1VGW93/AWBZ1Q5yp7JnZw7IHlHz6E3lP0mQU88RZ+y0KDefsOv/xPE11Fsb22KRY
 EhmR69JJ4MXcuQ0bRhm3NJdLuq5LhmmbFG4gdN8hf2WWZXBZlpD1br1rQ9zsSU5nSckC
 CJd9zhW+eWDdUJbvPVj1KPE0bh3KFZ+6mpSsp6+RcR6YoUStxovcOyMFjEfX0DgUNK0p
 WfWSEugyMqPXXKYyRIoj4nNrCoupuuMD6A/5LiOyH6HsVS9zl7qi/sxnnLUdOMv3ixtQ
 4Sc/OpwjU4ABIxIi1p5rKRlhEsMan5mtHFk/b96oUPGqLOAWT8bXO/uKcfsI29lDbdxT
 tFBw==
X-Forwarded-Encrypted: i=1;
 AHgh+RpWazY2MQ+ck9YlgHge9GA6N57CJBgajmLvaXYCcBziO9oQiVWmznZf7PoLoSU5e67eGFXxboIG7ULY@nongnu.org
X-Gm-Message-State: AOJu0Ywlcy4gko6JlVvaDn2GPVz/M++zWxrxKzLW4jJW6lD6t41SPCq9
 QLRGNi/jC3yFLjuffPbmccf2EDcG2SZHfiv/JIP0a5xUWAJNUnSUwd+P5tL1WaVALE5sMRH4t9c
 TiXXZYkKYc0nZbjZWm5oiXVYi/vy4i8cXYvRlZOM/FDgPcM+51QvEyz/XnA==
X-Gm-Gg: AR+sD11x1RqM0GAXK1SrTZyvO2RS2o2//wsgISqXlzdwTv531cgjBuCJR/xK4wErFuA
 chBtpXbb8yGIoBAy0yOyl4JeuCW+Pr8EEoMLyC9tI7azOHYTddIjxEcaHwVed1ZOJ/BVJ/31itn
 YiPI5z8bzve/xL7/7m0tAq+4NM/3V148PHwv+sFg5DTpduSnAxWVThCGgCwbVlkweL21JCHX+b7
 fjhJS72Fp9LUy8zyg+VW4intJfSjiOm7mjtFLVnaytehIHIvwRxVXehGUXOTlyStZXuv8ImN7SQ
 +MptencR57VWXlSzSGhftiKAGpxoq5VQmFfzTnZDMl4iSTeri4lGugD9i175u/U7f2S2QE39GqN
 feg9k72cMEaxuae+whgyRpSbDIYkQKV1flHZ9uYV++g==
X-Received: by 2002:ac8:5805:0:b0:51c:f3:34d9 with SMTP id
 d75a77b69052e-52df5a31cd5mr44284521cf.27.1787309459638; 
 Fri, 21 Aug 2026 03:50:59 -0700 (PDT)
X-Received: by 2002:ac8:5805:0:b0:51c:f3:34d9 with SMTP id
 d75a77b69052e-52df5a31cd5mr44284091cf.27.1787309459167; 
 Fri, 21 Aug 2026 03:50:59 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-499b9af84b6sm13655535e9.1.2026.08.21.03.50.57
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 21 Aug 2026 03:50:58 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-riscv@nongnu.org, qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <arikalo@gmail.com>
Subject: [PATCH v3 09/15] target/mips: Constify CPUMIPSState for various
 cpu_*() getters
Date: Fri, 21 Aug 2026 12:49:43 +0200
Message-ID: <20260821104950.32108-10-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260821104950.32108-1-philmd@oss.qualcomm.com>
References: <20260821104950.32108-1-philmd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIxMDA4MSBTYWx0ZWRfX8JRI36GVPHO5
 fKOsLbVxhhm9MrqEGVF7whCKOU1vtRISN50CIkb1s4Sb/D0WmewFFeNExIAfxuBUnWdDX91aTJd
 3eokxirGA8AxjVxzd15M2DLycFmiFjQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIxMDA4MSBTYWx0ZWRfXz3B1ejbDpUUh
 WDVE+tpnG5OxfHP05ujJQAWg+1Hvmnp7xrj5GCqLgOZuI3pQkLibX9B4aa9FTw+6utHDTe6RGNL
 1U9dBi1FZ4WDr2XKUKV8k7IwNWB7pWtpZxd8OeT3uyFyS0qenF8KxSJHqQ/yvEgIqyZ4z2Oewmi
 LyYzzdinTEuOQNuTlvQVgMnutTIXhczitXY1rCXRnJd/g+p3EVKQlbosj2xQpMA035D1n9ixMjV
 AI8b67ZtTI2FvD5h2GUaecucBgmirJjR+EYiYEIEgKfYQBY0CRviQ6xuL2uith1kmn6CnJYFnys
 DAjQLsz3GNeXh7ebI7K0GKs2RoTQQJakA1KjowX38BFAGrYqiJRW12ckezEPQfMmXrwliMKApiV
 +ZafTM2sD9s77Fmy7Kx1o46OELQ/Zm0s8lGKpWCUGQqIWKg2ZVVUmD/c3StwybY5EdRxSNiKt9B
 Vxzc7AVUp0yoeYDyMOA==
X-Authority-Analysis: v=2.4 cv=ApHeGu9P c=1 sm=1 tr=0 ts=6a882d94 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=20KFwNOVAAAA:8 a=OdUTIDwS7iTBxe5GiEQA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: BoiSvXA39HgLJcpskw8I3dhyh82N6-Y8
X-Proofpoint-ORIG-GUID: BoiSvXA39HgLJcpskw8I3dhyh82N6-Y8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-21_03,2026-08-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 adultscore=0 phishscore=0 suspectscore=0 malwarescore=0
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

Add the const qualifier to CPUMIPSState when
the argument is accessed without modification.

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 target/mips/cpu.h      |  6 +++---
 target/mips/internal.h | 10 +++++-----
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/target/mips/cpu.h b/target/mips/cpu.h
index 319147a948c..6404b342a5d 100644
--- a/target/mips/cpu.h
+++ b/target/mips/cpu.h
@@ -1372,19 +1372,19 @@ static inline bool ase_3d_available(const CPUMIPSState *env)
 }
 
 /* Check presence of MSA implementation */
-static inline bool ase_msa_available(CPUMIPSState *env)
+static inline bool ase_msa_available(const CPUMIPSState *env)
 {
     return env->CP0_Config3 & (1 << CP0C3_MSAP);
 }
 
 /* Check presence of Loongson CSR instructions */
-static inline bool ase_lcsr_available(CPUMIPSState *env)
+static inline bool ase_lcsr_available(const CPUMIPSState *env)
 {
     return env->lcsr_cpucfg2 & (1 << CPUCFG2_LCSRP);
 }
 
 /* Check presence of multi-threading ASE implementation */
-static inline bool ase_mt_available(CPUMIPSState *env)
+static inline bool ase_mt_available(const CPUMIPSState *env)
 {
     return env->CP0_Config3 & (1 << CP0C3_MT);
 }
diff --git a/target/mips/internal.h b/target/mips/internal.h
index c5c286872eb..7dba22300b1 100644
--- a/target/mips/internal.h
+++ b/target/mips/internal.h
@@ -165,7 +165,7 @@ void cpu_mips_store_cause(CPUMIPSState *env, target_ulong val);
 
 extern const VMStateDescription vmstate_mips_cpu;
 
-static inline bool cpu_mips_hw_interrupts_enabled(CPUMIPSState *env)
+static inline bool cpu_mips_hw_interrupts_enabled(const CPUMIPSState *env)
 {
     return (env->CP0_Status & (1 << CP0St_IE)) &&
         !(env->CP0_Status & (1 << CP0St_EXL)) &&
@@ -180,7 +180,7 @@ static inline bool cpu_mips_hw_interrupts_enabled(CPUMIPSState *env)
 }
 
 /* Check if there is pending and not masked out interrupt */
-static inline bool cpu_mips_hw_interrupts_pending(CPUMIPSState *env)
+static inline bool cpu_mips_hw_interrupts_pending(const CPUMIPSState *env)
 {
     int32_t pending;
     int32_t status;
@@ -247,9 +247,9 @@ static inline void restore_pamask(CPUMIPSState *env)
     }
 }
 
-static inline int mips_vpe_active(CPUMIPSState *env)
+static inline int mips_vpe_active(const CPUMIPSState *env)
 {
-    MIPSCPU *cpu = env_archcpu(env);
+    const MIPSCPU *cpu = env_archcpu(env);
     int active = 1;
 
     /* Check that the VPE is enabled.  */
@@ -281,7 +281,7 @@ static inline int mips_vpe_active(CPUMIPSState *env)
     return active;
 }
 
-static inline int mips_vp_active(CPUMIPSState *env)
+static inline int mips_vp_active(const CPUMIPSState *env)
 {
     CPUState *cs;
 
-- 
2.53.0


