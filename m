Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 420F8606A31C
	for <qemu-riscv@archiver.kernel.org>; Thu, 26 Nov 2026 23:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PlfjhT/I;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=L22AZBya
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xWj3A-00017H-2l; Thu, 26 Nov 2026 18:38:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xWj36-0000kC-FI
 for qemu-riscv@nongnu.org; Thu, 26 Nov 2026 18:38:44 -0500
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xWj34-00019Z-Ia
 for qemu-riscv@nongnu.org; Thu, 26 Nov 2026 18:38:44 -0500
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6AQJwJd83990459
 for <qemu-riscv@nongnu.org>; Thu, 26 Nov 2026 23:38:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 kQiYOe2ljrnpQFopM9IZYgv5ZftHEmKXEj6HZt8HEmY=; b=PlfjhT/I9k6pHK2B
 UAzTcztrO1cU53C4Hk8c1nkihfV9ElHyCvadEA9ALD/Acl1oqoBoHLMQ3CryhoLM
 VGsnLsjtZNe/E1vICfgirl1MgIgLszo2333eg2OYhJnBWyJt51mXyz4aNIWKedGQ
 PPItomzibVDPN2/GJALi2N97QaNdzu7kFl8tD86BLr/NLICUmYKdP6s7h0Se9FeP
 E9lhyPjh9cla6vZGhww0VK0GOz+9xbYEYdE8VUuEPveRmN3nd3LzzVyhLer7E00a
 VuT5UAFDniyoIn0qFlQIl0eh/cnP94VplJWnOFU7Zoiz7+9l5zUmysObbt1exRWw
 n1IOQQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6ak042u2-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 26 Nov 2026 23:38:31 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-91256a7b7b3so107702366d6.2
 for <qemu-riscv@nongnu.org>; Thu, 26 Nov 2026 15:38:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1795736311; x=1796341111; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=kQiYOe2ljrnpQFopM9IZYgv5ZftHEmKXEj6HZt8HEmY=;
 b=L22AZByaDf1JC8X3OuHJv5AE4CwxhPTmoGLc0p0XixNi3srMXBDB6drjwteHr9nNLD
 4RNt7JRD3o1i62ziJ/7M0scvDA2vnHDw8cFea/lHEKKbs5NRDaxTOCMvYPzNI+AABLN+
 gfQ9ziXyZhPxv+QQ6y3l+Rrd8/RTddwTFgJxnnuuVmZQ2nYpRe7M7S3lqH1VxVNFiaEh
 5+1eosGMC99YoS6L9nQWoKCT6+0om54IflXH7omz3o4+wkq21LDV9Ss2X54lsR4Uu+Fd
 WKvnVNZ406m1wO9h9I/jZ11ST9HsqZUm9rbKm8QR5JO1+R9lDP3wYUwIGky/vCaC3kNA
 PxHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795736311; x=1796341111;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=kQiYOe2ljrnpQFopM9IZYgv5ZftHEmKXEj6HZt8HEmY=;
 b=VgcBQITwH/R4ddDoh5eN+GI7vvErE8fyelg5UBSwaqgTctAS0R4SxLjnivMxrbY1dF
 UAF6MdYPk1RV+W7iOErRGLp574Y9khiKquAwQFrHA2fT7YhjdJPhGAXVUEqMPWPufhrV
 xaZUWktz7pPJbRRm+vKtsHTZKmwCumDZdoNNHo5nDP7u+jnxjaMVPxQLb9LoJwhrtYwd
 yhAXfMV2+hYzrm17teGofMTUXXTrOCfKaeRzoO4DerIGUlRLJNH1fLlK2lhQr4RIJ9uH
 vkeBM0AL0F28JhUBmShBQBB1WsY4ZtmEKMgtDhS1mdKIQJSmUE8ipKNAnNiM7CV5gbCL
 g26w==
X-Forwarded-Encrypted: i=1;
 AL+hErEFXkdkodiRtaM2T0ITw+eB3yjWgVi/Lp/Ma4MmkVpNkb1qK045FvZJRMBE5OMPJZP6hmTQKTnfU1E5@nongnu.org
X-Gm-Message-State: APuU4Z/QdIsz9nlO25cECAoQm3v7/7VCnNNJocN2koXO1ux3+Spobed/
 LrISBVQw3QjM5UHOdfMIdWvpTXAP7l5Qh3TJMqe4P7e6CIGV45cnvA/dxerW7f/9HpT2izfUm/U
 o+AafzGW2k3iHjicJQbGcM2bxWNj28OaWzQDzXBuvvqV81hLdQs0RJ2fbYQ==
X-Gm-Gg: AZFdTZdCK54oWtmnGq+bFHgFVb+O+fD473anPGxFgG8D9ItNxA2ufZdTUV7PdBJXX/D
 z1gLJ8VeoV2ts15qfSFZyGqjU6Q33374Q2/Otn0MuBU6JWizULFOovMSgUeswATMW3QzP+sHsjQ
 zAXmfbAWJEWeQ3xseDX1IC5HngaAnzzyOre7rSGXbIkffFsbaHIG3Qcsc582kQV+EbrAmGCay2z
 NHQb+x21Bpt5cTdLQyJWNM3dTG2kKrOmAff7DN5GQhs56umV+/luuLGF01A6j5fGPY804Kvx0JG
 Fvgx+J0Jl8KR1+FQXGwBHNzh8J0uPEXjodoI8nmmOGmCbkbsdiuJ9Wmf4RGRBfI6Elvq87P0J3h
 rHqsvo5Ua3GL1cRqCRz7Co4MrIeTVi+teoR8S2FnTR+Z+zYYlPrg1EmHAD0tnt/+MqcfiA8xU7s
 t6uikjdeWIFcrOew==
X-Received: by 2002:a05:620a:6892:b0:947:7691:7316 with SMTP id
 af79cd13be357-949bab3d3bemr3929337785a.81.1795736310805; 
 Thu, 26 Nov 2026 15:38:30 -0800 (PST)
X-Received: by 2002:a05:620a:6892:b0:947:7691:7316 with SMTP id
 af79cd13be357-949bab3d3bemr3929335585a.81.1795736310383; 
 Thu, 26 Nov 2026 15:38:30 -0800 (PST)
Received: from localhost.localdomain (pmd666.hd.free.fr. [82.67.153.177])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb8538b2c5sm629921625e9.5.2026.11.26.15.38.28
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 26 Nov 2026 15:38:29 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Anton Johansson <anjo@rev.ng>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Yoshinori Sato <yoshinori.sato@nifty.com>
Subject: [PATCH 18/24] target/rx: Use 64-bit TB flags
Date: Fri, 27 Nov 2026 00:35:56 +0100
Message-ID: <20261126233604.67722-19-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261126233604.67722-1-philmd@oss.qualcomm.com>
References: <20261126233604.67722-1-philmd@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=T4oZ3PKQ c=1 sm=1 tr=0 ts=6b08c2f7 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=nz36NW0qrpeEijYxj/H2Ew==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=xyxvAluZajSoLEIRtJ4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: klf74NikbTjQyL9HSNmMT341j8Tri1JE
X-Proofpoint-GUID: klf74NikbTjQyL9HSNmMT341j8Tri1JE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA5MyBTYWx0ZWRfXzxHcO0TWcFo5
 +ukSxd/A1FtaXK1t0mzDa0G12grpjf1WI1NQCBwVwPmrdO1EHrv1j9JEFUygJF0P48VO2xJ4B+U
 DZdikoEyEFHFV16OMWamzWucVXd8l+iO6CmSfrCavBLmItO9gAyHZiutlUIhhYY2Oo6XMPVWmdQ
 xBdRs8ne1vfJ3uZSPbnBZwh3XI7MmDFdjanmCFvyikH0QR+KI940bz667daV2HK02BjQyHuVPdY
 TM2iFMOjq+8WSpZ2nDb+0EADs6o1oI6W4YR+UiGBJQAnsTwuRNLrFtdgAEbOAoGIMfDEx48tAqy
 7DRfPM312s2FOQ6guSHQ7gbUWE4KMQbndfKseB36r/nxCm7PAmZp+h02Okf29jTcN/iVtP+FnUB
 +KxPyo7VyqJvs6g+fKeMo+F6Ude69KBvR5IvEm/LfZUhyL279maY9/adL+iydar6VWGArmxJDFD
 /x9U6l3F1f1e4ToHFTQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA5MyBTYWx0ZWRfX1r+po/IGh9Kv
 YwZ6gk4fK0fSPS6hOrJeF74PfIF8TBWSJZd7eDUGsBF7x9EjjNsi93BUMIZrfg+TRZj50GKGXLH
 ygABKdl04ARleS/KiEgjpYjLdOQM+9A=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_05,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 suspectscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 impostorscore=0 adultscore=0
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
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 target/rx/cpu.c       |  6 +++---
 target/rx/translate.c | 16 ++++++++--------
 2 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/target/rx/cpu.c b/target/rx/cpu.c
index c35a98f7cefa..dba253bda9b1 100644
--- a/target/rx/cpu.c
+++ b/target/rx/cpu.c
@@ -47,10 +47,10 @@ static vaddr rx_cpu_get_pc(CPUState *cs)
 static TCGTBCPUState rx_get_tb_cpu_state(CPUState *cs)
 {
     CPURXState *env = cpu_env(cs);
-    uint32_t flags = 0;
+    uint64_t flags = 0;
 
-    flags = FIELD_DP32(flags, PSW, PM, env->psw_pm);
-    flags = FIELD_DP32(flags, PSW, U, env->psw_u);
+    flags = FIELD_DP64(flags, PSW, PM, env->psw_pm);
+    flags = FIELD_DP64(flags, PSW, U, env->psw_u);
 
     return (TCGTBCPUState){ .pc = env->pc, .flags = flags };
 }
diff --git a/target/rx/translate.c b/target/rx/translate.c
index 1bacc7adf929..69547c83cc05 100644
--- a/target/rx/translate.c
+++ b/target/rx/translate.c
@@ -36,7 +36,7 @@ typedef struct DisasContext {
     DisasContextBase base;
     CPURXState *env;
     uint32_t pc;
-    uint32_t tb_flags;
+    uint64_t tb_flags;
 } DisasContext;
 
 typedef struct DisasCompare {
@@ -243,7 +243,7 @@ static TCGv_i32 rx_load_source(DisasContext *ctx, TCGv_i32 mem,
 /* Processor mode check */
 static int is_privileged(DisasContext *ctx, int is_exception)
 {
-    if (FIELD_EX32(ctx->tb_flags, PSW, PM)) {
+    if (FIELD_EX64(ctx->tb_flags, PSW, PM)) {
         if (is_exception) {
             gen_helper_raise_privilege_violation(tcg_env);
         }
@@ -332,7 +332,7 @@ static void move_from_cr(DisasContext *ctx, TCGv_i32 ret, int cr, uint32_t pc)
         tcg_gen_movi_i32(ret, pc);
         break;
     case 2:     /* USP */
-        if (FIELD_EX32(ctx->tb_flags, PSW, U)) {
+        if (FIELD_EX64(ctx->tb_flags, PSW, U)) {
             tcg_gen_mov_i32(ret, cpu_sp);
         } else {
             tcg_gen_mov_i32(ret, cpu_usp);
@@ -348,7 +348,7 @@ static void move_from_cr(DisasContext *ctx, TCGv_i32 ret, int cr, uint32_t pc)
         tcg_gen_mov_i32(ret, cpu_bpc);
         break;
     case 10:    /* ISP */
-        if (FIELD_EX32(ctx->tb_flags, PSW, U)) {
+        if (FIELD_EX64(ctx->tb_flags, PSW, U)) {
             tcg_gen_mov_i32(ret, cpu_isp);
         } else {
             tcg_gen_mov_i32(ret, cpu_sp);
@@ -386,7 +386,7 @@ static void move_to_cr(DisasContext *ctx, TCGv_i32 val, int cr)
         break;
     /* case 1: to PC not supported */
     case 2:     /* USP */
-        if (FIELD_EX32(ctx->tb_flags, PSW, U)) {
+        if (FIELD_EX64(ctx->tb_flags, PSW, U)) {
             tcg_gen_mov_i32(cpu_sp, val);
         } else {
             tcg_gen_mov_i32(cpu_usp, val);
@@ -402,7 +402,7 @@ static void move_to_cr(DisasContext *ctx, TCGv_i32 val, int cr)
         tcg_gen_mov_i32(cpu_bpc, val);
         break;
     case 10:    /* ISP */
-        if (FIELD_EX32(ctx->tb_flags, PSW, U)) {
+        if (FIELD_EX64(ctx->tb_flags, PSW, U)) {
             tcg_gen_mov_i32(cpu_isp, val);
         } else {
             tcg_gen_mov_i32(cpu_sp, val);
@@ -2080,8 +2080,8 @@ static void clrsetpsw(DisasContext *ctx, int cb, int val)
             ctx->base.is_jmp = DISAS_UPDATE;
             break;
         case PSW_U:
-            if (FIELD_EX32(ctx->tb_flags, PSW, U) != val) {
-                ctx->tb_flags = FIELD_DP32(ctx->tb_flags, PSW, U, val);
+            if (FIELD_EX64(ctx->tb_flags, PSW, U) != val) {
+                ctx->tb_flags = FIELD_DP64(ctx->tb_flags, PSW, U, val);
                 tcg_gen_movi_i32(cpu_psw_u, val);
                 tcg_gen_mov_i32(val ? cpu_isp : cpu_usp, cpu_sp);
                 tcg_gen_mov_i32(cpu_sp, val ? cpu_usp : cpu_isp);
-- 
2.55.0


