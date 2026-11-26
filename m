Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B16A5606A31E
	for <qemu-riscv@archiver.kernel.org>; Thu, 26 Nov 2026 23:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ilvs7eaH;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=h2N6mxd5
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xWj1h-0004tP-Ez; Thu, 26 Nov 2026 18:37:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xWj1f-0004pq-9m
 for qemu-riscv@nongnu.org; Thu, 26 Nov 2026 18:37:15 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xWj1d-0005m9-78
 for qemu-riscv@nongnu.org; Thu, 26 Nov 2026 18:37:14 -0500
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6AQJwEEE061172
 for <qemu-riscv@nongnu.org>; Thu, 26 Nov 2026 23:37:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 1enaKrzlv41NHzmmGDk+8izpCwCACGqfauyA3bSJ7xA=; b=Ilvs7eaH/1Hl9eU9
 lS7ZlA8qucM4WTfk16JKwRfkVmTL8FpR6kZ4Qm8n7LppZHaTC9pDQgaFgJlU7DMZ
 d2eXIzdqMY1fm/yBbNimPbraXd7l1KvI/aGW31WYLLqvd7iJzbRvWFTC1QSn1LwX
 DkzOtZ3mxFaaZuh5hcTkPEdou5sr8K0G1E9xwEZtIiTIl0svUJKzXsTgqbU4S1Ww
 yLccrHV778ahxOp1TWIKGlSpdmv03tPdzn5vdMBKHw5zAw/1kX0Y4xh7P3Xwctn5
 0V2kr64eDZIUk/EjkO0vItwGqSzFzuxD4k88Fezcj/Y0NFVHcHYekoopi0fcNbDw
 6IxQlQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6u4hrg0y-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 26 Nov 2026 23:37:01 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-91c6c1e082bso127734486d6.0
 for <qemu-riscv@nongnu.org>; Thu, 26 Nov 2026 15:37:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1795736221; x=1796341021; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=1enaKrzlv41NHzmmGDk+8izpCwCACGqfauyA3bSJ7xA=;
 b=h2N6mxd548LJLepU7sQfb9kseQCmOR7i54jIRku6ioOOOKqd80Jz6+XizABA7IUSVk
 EfD7ZwBGppbucgeaipDo0g/YwOu1WSK2X3CDETCRJoQO2avDE/m6bZlJj12Sk8c5FwmK
 uoq0k/Mzqghf4S3XIElUU2D+epgPO3qAhImskFb8QLq5eM2QgZNODU0FS1Db2TRIZWBv
 uRzPvtCYOAeSTCxLU1BJwYGohqrHsk2cwvoOVJ3ghadIkeCd4WbCslI8eCbZJ5M357w0
 sb5RNOrZNmEwRmyETHgZ0ZcKNAlDczGhwaYeTEEQsNG4jvMAais4ObO9bwKbZp/NZ8ag
 7+uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795736221; x=1796341021;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=1enaKrzlv41NHzmmGDk+8izpCwCACGqfauyA3bSJ7xA=;
 b=dDI+Jh8hzbRXEZkkdSD9ZAMMFNOg6X64E+QIqxwMl42wRJKS+LN2wvBBY/GhVNnL+K
 hg+hTwbcXE+nHYEJVW/w6ll9dKLef4m2El7T1BGG4LxRVx6gtkpTi1e2P+OjWNzpjkQF
 CclbitnR3+gNqCFU83iCyQkbXL+EzSeWRwoVmpQRK8sIo7CLjVnlJ+nw3FA+gywwncRt
 4S5dyzcWBDEDzeXb+Voh4J2aMN3DdPBRTb2EQW6Ns246wNoQAHw50J4vSHSbGIZGLFxm
 9yElf++X05YXPHlz8x1qKKBRf0NxxDq2p+2iU5fDY2YZVqLkmlyFgzrtybKt40a5rztW
 3Xvw==
X-Forwarded-Encrypted: i=1;
 AL+hErG8II/L5FL/4iCZuN1o8hNw34PepJE7yo7TATaXr8b0NVy5hGeGrvZHvYXo5+T+t9fKMhL1BMEUQzn9@nongnu.org
X-Gm-Message-State: APuU4Z9YJVezY3vsQqlo4SqDDX9ADg0yTmZGKYOysAmELelNOuXn/gEh
 td88UlFPlx8iixX1P7rwA++aun5NDWgK72bAYQ40Ka+rg0iAikob4fc8BP3FTTh2QBElxzMtiim
 6A0t6kLY5ZkciMQPcKGe/dtI8GL1xfd3gnV9mpefn5IajG9w3eIQG/i8imw==
X-Gm-Gg: AZFdTZeqnE8MCGJ46f1FXwQ3NRmqc5yRplIbiVgEau0G5jduUFMB+Ypx5DY3Ojrcn3r
 3Vux9R0tumK8SfoBqnhAyxaxYpIBx+SbmdedfohDOsL8ITtC6BdqyrqZD/s8C1BM0t2YVZbBCui
 TwZbrEchTo+kY4xeF6+4GhhwplU0bVyEMPti1H57scovraU6sKLczlkaoelzKG8nIgsEC733shp
 oBv9hik4xCaar6CGxfSVRj/s4bTB89a+hsodM5zu/y3BjnqXUzWI9fGRDHRx0vAf+7RsHxh3Gy4
 gTwEzzsRy4RNi1yxX9xgMD2v50lUmqloMkROiQ4wqTwejM+BetQnTC+OK0cG3at1qddoVX2e4NZ
 Knb0Ur7TGVJQljkA+AJyX9qczAbfIXLxduYn9G3TyYGFeA9F8F+aMXOeg16znJWHRPonBRT6+1s
 kkNzWnXeFW7p7XEg==
X-Received: by 2002:a05:620a:1a20:b0:944:4e6:85d8 with SMTP id
 af79cd13be357-949b3402288mr4151157185a.5.1795736220671; 
 Thu, 26 Nov 2026 15:37:00 -0800 (PST)
X-Received: by 2002:a05:620a:1a20:b0:944:4e6:85d8 with SMTP id
 af79cd13be357-949b3402288mr4151153985a.5.1795736220175; 
 Thu, 26 Nov 2026 15:37:00 -0800 (PST)
Received: from localhost.localdomain (pmd666.hd.free.fr. [82.67.153.177])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4ab6b9add26sm43947461f8f.44.2026.11.26.15.36.57
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 26 Nov 2026 15:36:58 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Anton Johansson <anjo@rev.ng>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Brian Cain <brian.cain@oss.qualcomm.com>
Subject: [PATCH 07/24] target/hexagon: Use 64-bit TB flags
Date: Fri, 27 Nov 2026 00:35:45 +0100
Message-ID: <20261126233604.67722-8-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261126233604.67722-1-philmd@oss.qualcomm.com>
References: <20261126233604.67722-1-philmd@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA5MyBTYWx0ZWRfXzBkjvGIwZ29D
 kCHv5QNVpqNxSzWn31g1ym+Gbf9N6e8UPNLIvsGa6vgQiPvrgv2dw+BfkhcpvsoeRbMT1KE6ncu
 dKOt/M67s1i7hPZKWtW3SezIR8jlTJI=
X-Proofpoint-GUID: 4qjCn8-mo2TrvncogptlI0tfaKl15HIe
X-Proofpoint-ORIG-GUID: 4qjCn8-mo2TrvncogptlI0tfaKl15HIe
X-Authority-Analysis: v=2.4 cv=M9fYuCws c=1 sm=1 tr=0 ts=6b08c29d cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=nz36NW0qrpeEijYxj/H2Ew==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=TANYxuC8gaNbnFs6tTIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA5MyBTYWx0ZWRfX7dkTZJ9Qhc8G
 JEpQEYyD0/+O0UXB8xIRAokE/x6UklZ4wixXEW5IbuTbA5Y1U2GftDONSwQvW2dcpp1Ro7JCNYb
 Mz3cIAXbggNDQEcdcqSJ3sa1AclMG7nTKwLlMwdX+LTC4sM8wkg9vvpZYTiEmSptf0q4u0LS28q
 mCm+pSGpE6Mn9yECDqAAOOfQ/ynLvLnARgQvITzi9BqiykeBU2KMvrG08uB9Ro6rctf9z35M/7W
 If5dLc9As0r3Lmot13mK7vz6pQtNa1nSKXv4EqryTbaqgze/W8NPJEEd+LkvvQT3/2jVPyi4Wye
 8HWYvq+nPiMH9HYlJu/y3Vq6EsgWrzMzL1fCVfgnWI7FRRkLm4b87LboGNiX6TVaFuZjIXTYd6g
 CPafHFRWB4z0NVYWQ5zt9oxjKx9MYZmZnbCgsZyqUQnc8Iuk45gsfnhAF8O4ArAKPgtYUQYRrzj
 maJ051cY6zIIa0Eglnw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_05,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260093
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
 target/hexagon/cpu.c       | 16 ++++++++--------
 target/hexagon/translate.c | 14 +++++++-------
 2 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/target/hexagon/cpu.c b/target/hexagon/cpu.c
index 3575b31d1961..3d401cec7929 100644
--- a/target/hexagon/cpu.c
+++ b/target/hexagon/cpu.c
@@ -370,13 +370,13 @@ static TCGTBCPUState hexagon_get_tb_cpu_state(CPUState *cs)
 {
     CPUHexagonState *env = cpu_env(cs);
     vaddr pc = env->gpr[HEX_REG_PC];
-    uint32_t hex_flags = 0;
+    uint64_t hex_flags = 0;
 #ifndef CONFIG_USER_ONLY
     HexagonCPU *cpu;
 #endif
 
     if (pc == env->gpr[HEX_REG_SA0]) {
-        hex_flags = FIELD_DP32(hex_flags, TB_FLAGS, IS_TIGHT_LOOP, 1);
+        hex_flags = FIELD_DP64(hex_flags, TB_FLAGS, IS_TIGHT_LOOP, 1);
     }
     if (pc & PCALIGN_MASK) {
         env->cause_code = HEX_CAUSE_PC_NOT_ALIGNED;
@@ -385,22 +385,22 @@ static TCGTBCPUState hexagon_get_tb_cpu_state(CPUState *cs)
 
 #ifndef CONFIG_USER_ONLY
     cpu = env_archcpu(env);
-    hex_flags = FIELD_DP32(hex_flags, TB_FLAGS, MMU_INDEX,
+    hex_flags = FIELD_DP64(hex_flags, TB_FLAGS, MMU_INDEX,
                            cpu_mmu_index(env_cpu(env), false));
-    hex_flags = FIELD_DP32(hex_flags, TB_FLAGS, HVX_COPROC_ENABLED,
+    hex_flags = FIELD_DP64(hex_flags, TB_FLAGS, HVX_COPROC_ENABLED,
                            cpu->hvx_ctx[0] &&
                            GET_SSR_FIELD(SSR_XE, env->t_sreg[HEX_SREG_SSR]));
-    hex_flags = FIELD_DP32(hex_flags, TB_FLAGS, CPU_MODE,
+    hex_flags = FIELD_DP64(hex_flags, TB_FLAGS, CPU_MODE,
                            get_cpu_mode(env));
     /* Single-step applies only to user and guest mode packets */
-    hex_flags = FIELD_DP32(hex_flags, TB_FLAGS, SS_ACTIVE,
+    hex_flags = FIELD_DP64(hex_flags, TB_FLAGS, SS_ACTIVE,
                            GET_SSR_FIELD(SSR_SS, env->t_sreg[HEX_SREG_SSR]) &&
                            get_cpu_mode(env) != HEX_CPU_MODE_MONITOR);
-    hex_flags = FIELD_DP32(hex_flags, TB_FLAGS, HMX_COPROC_ENABLED,
+    hex_flags = FIELD_DP64(hex_flags, TB_FLAGS, HMX_COPROC_ENABLED,
                            cpu->hmx &&
                            GET_SSR_FIELD(SSR_XE2, env->t_sreg[HEX_SREG_SSR]));
 #else
-    hex_flags = FIELD_DP32(hex_flags, TB_FLAGS, MMU_INDEX, MMU_USER_IDX);
+    hex_flags = FIELD_DP64(hex_flags, TB_FLAGS, MMU_INDEX, MMU_USER_IDX);
 #endif
 
     return (TCGTBCPUState){ .pc = pc, .flags = hex_flags };
diff --git a/target/hexagon/translate.c b/target/hexagon/translate.c
index 11b3917b96c6..f08dc8ef161f 100644
--- a/target/hexagon/translate.c
+++ b/target/hexagon/translate.c
@@ -1570,9 +1570,9 @@ static void hexagon_tr_init_disas_context(DisasContextBase *dcbase,
 {
     DisasContext *ctx = container_of(dcbase, DisasContext, base);
     HexagonCPU *hex_cpu = env_archcpu(cpu_env(cs));
-    uint32_t hex_flags = dcbase->tb->flags;
+    uint64_t hex_flags = dcbase->tb->flags;
 
-    ctx->mem_idx = FIELD_EX32(hex_flags, TB_FLAGS, MMU_INDEX);
+    ctx->mem_idx = FIELD_EX64(hex_flags, TB_FLAGS, MMU_INDEX);
     ctx->num_packets = 0;
     ctx->num_insns = 0;
     ctx->num_hvx_insns = 0;
@@ -1582,23 +1582,23 @@ static void hexagon_tr_init_disas_context(DisasContextBase *dcbase,
     ctx->hlx_check_emitted = false;
 #endif
     ctx->branch_cond = TCG_COND_NEVER;
-    ctx->is_tight_loop = FIELD_EX32(hex_flags, TB_FLAGS, IS_TIGHT_LOOP);
+    ctx->is_tight_loop = FIELD_EX64(hex_flags, TB_FLAGS, IS_TIGHT_LOOP);
     ctx->short_circuit = hex_cpu->cfg.short_circuit;
     ctx->hex_def = HEXAGON_CPU_GET_CLASS(hex_cpu)->hex_def;
     ctx->ieee_fp_extension = hex_cpu->cfg.ieee_fp_extension;
 #ifndef CONFIG_USER_ONLY
     ctx->hvx_coproc_enabled =
-        FIELD_EX32(hex_flags, TB_FLAGS, HVX_COPROC_ENABLED);
+        FIELD_EX64(hex_flags, TB_FLAGS, HVX_COPROC_ENABLED);
     ctx->hvx_check_emitted = false;
-    ctx->cpu_mode = FIELD_EX32(hex_flags, TB_FLAGS, CPU_MODE);
-    ctx->ss_active = FIELD_EX32(hex_flags, TB_FLAGS, SS_ACTIVE);
+    ctx->cpu_mode = FIELD_EX64(hex_flags, TB_FLAGS, CPU_MODE);
+    ctx->ss_active = FIELD_EX64(hex_flags, TB_FLAGS, SS_ACTIVE);
     if (ctx->ss_active) {
         /* Step one packet, and let endloop0 branch within the packet */
         ctx->base.max_insns = 1;
         ctx->is_tight_loop = false;
     }
     ctx->hmx_coproc_enabled =
-        FIELD_EX32(hex_flags, TB_FLAGS, HMX_COPROC_ENABLED);
+        FIELD_EX64(hex_flags, TB_FLAGS, HMX_COPROC_ENABLED);
     ctx->hmx_check_emitted = false;
 #endif
 }
-- 
2.55.0


