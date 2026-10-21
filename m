Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2FE8606E87D
	for <qemu-riscv@archiver.kernel.org>; Wed, 21 Oct 2026 03:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pu5Ei7/1;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Fc6IX0Dr
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xJMqZ-00007U-Lb; Tue, 20 Oct 2026 23:18:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xJMpY-00058v-UL
 for qemu-riscv@nongnu.org; Tue, 20 Oct 2026 23:17:34 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xJMpU-00032m-Sg
 for qemu-riscv@nongnu.org; Tue, 20 Oct 2026 23:17:32 -0400
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69L2reR34071012
 for <qemu-riscv@nongnu.org>; Wed, 21 Oct 2026 03:17:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 sSEy/zV1vSGWM8tSEkQ09OgTFOceEnOpAw1aDiPB/jI=; b=pu5Ei7/1C355w10y
 66E22hkk1TYtqCjXOKxT/X4Mfwc3q+bx+00lQOdNPN8WsRLagSFwqaHRRe/qTmak
 ouV7kerPF4ml/ttm3H4PKj5/dEZdz0ENwNSa9Wj2FRqXcuuj/hu788OBIfjMzmUi
 GjLxHAZfPK1ujI8UXdKnSm/ZvhPly6Q8AeEOeDwtec3PLn8sHh1aN+U54aqxy0I/
 48KVsu/HW9w07UGwQ24LDPZcWi1nU+ak2jEEMgqH4BGmwlWQVVS1GZ3D//AILzKA
 gOVno8/aIYDYr8VLLfodjpmnjjO3svQ+yOzgUcv8Oq0TR5y46zX9PcyDXBShUbks
 zzyikw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hedajhrej-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 21 Oct 2026 03:17:17 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-93f26dd2165so96887585a.3
 for <qemu-riscv@nongnu.org>; Tue, 20 Oct 2026 20:17:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1792552637; x=1793157437; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=sSEy/zV1vSGWM8tSEkQ09OgTFOceEnOpAw1aDiPB/jI=;
 b=Fc6IX0Dr85uKmVdmixsxmzaRmbRQD+pdBTi+dO+xmbP5in5I9AVt7zBg21eaKSh500
 5XKFXqjgR6TCkQQoNTHjwGF8iwjEYoIfXngp/RKgiFtkJFKoTegSORbeLFsPMjjqfdep
 h5YP5LvjFGhjEH5uFT1KjmKCB6rZS5FfPQHq4av3ZJlckV91/BdaQLuibxxRmCqIl8/B
 q/hPttZ3AFLRC8YnNix8ogrWzU7hVe6mg5LVQhdD6Sqmn6P7WI6eLXf+SbdFgwQil9KF
 gpLdckll0Fm4vxYsw+9B3mFqXKaB0Q/RSZVUdOODpItoJ1sDV+An2OFCM0sQB/F41J8S
 SiXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792552637; x=1793157437;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=sSEy/zV1vSGWM8tSEkQ09OgTFOceEnOpAw1aDiPB/jI=;
 b=gPEyX0JRmf2+GKboaUjX679h4xFIHoGYyaHmwQXRHEyEeg1Gj0NHuLn0EE/BuRUnIC
 JAMqO2cNwFyFU4/fs5cFFrulEkIF3TnJMcjhF/gDTALswEmoG5tl8h4EmB9/QaEAnVDd
 +Sse66tauwZMQSCtt9FD0hgdWK/lfCnRIQicx0lQ89SZIG7j+As5k0Zk/hsYnlHTEX4f
 ehm1KVVrjOf9DRp1sBgiHw5O4cjlG/ZFSzjY3eS3j7LKb1+cKm6AEiL50dZ6YN4j5iv+
 Dbdqqk/iFgNDMPpN5v6tUlDWI92yyJSYmLjHZ1tPsz0mWHOS285lBDR01putTFDKJD1r
 nLBA==
X-Forwarded-Encrypted: i=1;
 AKwUvBzRY/XJB4yaLotS/qicBoBHoWIgjLDlOl64gCdLfo+Qa7HQGV6qwmvxVkgmtDCEiZkwRC35eHhW3KwQ@nongnu.org
X-Gm-Message-State: AFq9FYIuMK5QOlqZEHlZz6FxjtV4TqtsMierzHUao3Hd+1wWFSkIq+GZ
 X42pPI4dKAziU6vgpDGy6swtSinGXjzR4Xw7fJSylipz/NFA+2K1SJW5eF3SnOQrMDVbghsbg1C
 4u3uJ+OfE83+PTTptLTZGAM2FUZwtVZAPyclIQC9E6z4nVN8DAZlB5vmLnw==
X-Gm-Gg: AYBFou1Bx7FA7DCvS9+KZqotN8qDL9lAJyoQyehTdqJHlzXCAnXPgPCHMGrkQ8dB+fA
 Ik1LCdUXEh4IuS5ZE3u5vMG7o18qeoYwGYvywnIbcLr+FhI0nCD6iWpXU8wxJFOmJIy1pMVMCoW
 qnxOkqlwZa3kv+GRT+h27IAkYYJSMRphlwbWuziNCsJ2UmVeVca0ShccLJ9Sld2JgobwHe6sfXV
 oINpdQnl/CqddFnFg4QeZ4e0dmcrQhZGSVQ44AI9AMYnv3rl/tqTVusksyDySV+BLhhUdt0sC0k
 Bi8ZBW6HgukKU1tbErUBTa6ZRpB6tO6Gl3VTmEJ75JyjydZWIeLl4tO9s7IFicRvK7Ls6z4Xt3z
 2oSIYnPZ1J0gLXxOcLe/Ryc47N5qOC7mbumnzjKlp
X-Received: by 2002:a05:620a:6844:b0:939:3a81:326 with SMTP id
 af79cd13be357-93f57f4ba2cmr207356985a.37.1792552636997; 
 Tue, 20 Oct 2026 20:17:16 -0700 (PDT)
X-Received: by 2002:a05:620a:6844:b0:939:3a81:326 with SMTP id
 af79cd13be357-93f57f4ba2cmr207354685a.37.1792552636577; 
 Tue, 20 Oct 2026 20:17:16 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e254efb2csm2565210f8f.2.2026.10.20.20.17.15
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 20 Oct 2026 20:17:15 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
 qemu-s390x@nongnu.org, Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Subject: [PATCH v2 24/33] target/rx: Define exception vector constants
Date: Wed, 21 Oct 2026 05:13:57 +0200
Message-ID: <20261021031407.24862-25-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261021031407.24862-1-philmd@oss.qualcomm.com>
References: <20261021031407.24862-1-philmd@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAxMiBTYWx0ZWRfXz1JUvUTGsx8N
 Vq8H58fEAtX9himLuJO4865BQ2jBaF+zvgBjjg6QPuj7wpIEum++qL2Qct4ErLQR86porshKU8C
 7CY+YO48cjtWxBgYpumbOT1Gzeo+s8kHMDOmztIxXDN39D7fk6N0r24C7suE2z95WNr2MXKdgbx
 BzrZqfVyyYsSE80soSzQ3KwxMh1NyOs5HgBeRQ4VpR6esecZQHj9+OqCAO+UAPFm0QvwUQ6qnWG
 Zp8ru52QUMLNjVJVpWkZbqYJgyRR8QmswgXjclGsae5PcZdhELsxcMnRxbv6oCyl6ukw88rD1v2
 v8/jQ6qeLjdJ2LOyonvSG4PhuUL4yyH5SQCu4DJh7uMPrZURMKKZSyqvfBASm7pUWP3q8UcwGK3
 ie3V45nBLG/RwRTKGBH7rpW0+Inml+DJcLCps+Qn6NiNmWpjVyd/xMVfrhDYEzKWpvi6u+yjKjf
 xhtYwBSc4/DuSTNl+Mg==
X-Proofpoint-GUID: I-fXybutoRDODlUHRCaL7QqVa72kUN13
X-Proofpoint-ORIG-GUID: I-fXybutoRDODlUHRCaL7QqVa72kUN13
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAxMiBTYWx0ZWRfX0QwXZ8sNZOEt
 9zLjPyciPJ/eXm+zpiAMIRpENIqJINkVKoiGo4Ets5ITF8EZWvU+Qb7gRZP8P6mExTAtIpudSSh
 dQXwYZns7XBJ1GJ7Fd86PHlbbDy/Syg=
X-Authority-Analysis: v=2.4 cv=HrTjiETS c=1 sm=1 tr=0 ts=6ad82ebd cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=YEB5RgzmAAAA:8
 a=BYMmWKsKsDm6Gxpir0kA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 impostorscore=0 suspectscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210012
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
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

From: Yonggang Luo <luoyonggang@gmail.com>

Name RX exception vectors and trap ranges, and use the
definitions throughout exception handling and exception
raising.

Assert that exception indexes remain within the defined
range before accessing their vector tables.

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
Co-developed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Yoshinori Sato <yoshinori.sato@nifty.com>
---
 target/rx/cpu.h       | 13 +++++++++++++
 target/rx/helper.c    | 21 +++++++++++----------
 target/rx/op_helper.c | 10 +++++-----
 target/rx/translate.c |  2 +-
 4 files changed, 30 insertions(+), 16 deletions(-)

diff --git a/target/rx/cpu.h b/target/rx/cpu.h
index 64ba48a7329..0d9f4898a26 100644
--- a/target/rx/cpu.h
+++ b/target/rx/cpu.h
@@ -71,6 +71,19 @@ enum {
     NUM_REGS = 16,
 };
 
+#define RX_EXCP_TRAP_COUNT          0x100
+
+enum {
+    RX_EXCP_PRIVILEGE_VIOLATION     = 20,
+    RX_EXCP_ACCESS                  = 21,
+    RX_EXCP_ILLEGAL_INSTRUCTION     = 23,
+    RX_EXCP_FPU                     = 25,
+    RX_EXCP_NMI                     = 30,
+    RX_EXCP_TRAP_BASE               = 0x100, /* Up to RX_EXCP_TRAP_COUNT */
+};
+
+#define RX_EXCP_COUNT   (RX_EXCP_TRAP_BASE + RX_EXCP_TRAP_COUNT)
+
 typedef struct CPUArchState {
     /* CPU registers */
     uint32_t regs[NUM_REGS];    /* general registers */
diff --git a/target/rx/helper.c b/target/rx/helper.c
index 0f99279bbaa..bc76dd28ab3 100644
--- a/target/rx/helper.c
+++ b/target/rx/helper.c
@@ -86,13 +86,14 @@ void rx_cpu_do_interrupt(CPUState *cs)
         env->isp -= 4;
         cpu_stl_le_data(env, env->isp, env->pc);
 
-        if (vec < 0x100) {
-            env->pc = cpu_ldl_le_data(env, 0xffffff80 + vec * 4);
-        } else {
+        assert(vec < RX_EXCP_COUNT);
+        if (vec >= RX_EXCP_TRAP_BASE) {
             env->pc = cpu_ldl_le_data(env, env->intb + (vec & 0xff) * 4);
+        } else {
+            env->pc = cpu_ldl_le_data(env, 0xffffff80 + vec * 4);
         }
 
-        if (vec == 30) {
+        if (vec == RX_EXCP_NMI) {
             /* Non-maskable interrupt */
             qemu_plugin_vcpu_interrupt_cb(cs, last_pc);
         } else {
@@ -100,22 +101,22 @@ void rx_cpu_do_interrupt(CPUState *cs)
         }
 
         switch (vec) {
-        case 20:
+        case RX_EXCP_PRIVILEGE_VIOLATION:
             expname = "privilege violation";
             break;
-        case 21:
+        case RX_EXCP_ACCESS:
             expname = "access exception";
             break;
-        case 23:
+        case RX_EXCP_ILLEGAL_INSTRUCTION:
             expname = "illegal instruction";
             break;
-        case 25:
+        case RX_EXCP_FPU:
             expname = "fpu exception";
             break;
-        case 30:
+        case RX_EXCP_NMI:
             expname = "non-maskable interrupt";
             break;
-        case 0x100 ... 0x1ff:
+        case RX_EXCP_TRAP_BASE ... RX_EXCP_TRAP_BASE + RX_EXCP_TRAP_COUNT - 1:
             expname = "unconditional trap";
         }
         qemu_log_mask(CPU_LOG_INT, "exception 0x%02x [%s] raised\n",
diff --git a/target/rx/op_helper.c b/target/rx/op_helper.c
index fb1fa4ffa69..06841088ac0 100644
--- a/target/rx/op_helper.c
+++ b/target/rx/op_helper.c
@@ -115,7 +115,7 @@ static void update_fpsw(CPURXState *env, float32 ret, uintptr_t retaddr)
         enable = FIELD_EX32(env->fpsw, FPSW, ENABLE);
         enable |= 1 << 5; /* CE always enabled */
         if (cause & enable) {
-            raise_exception(env, 21, retaddr);
+            raise_exception(env, RX_EXCP_ACCESS, retaddr);
         }
     }
 }
@@ -432,17 +432,17 @@ void raise_exception(CPURXState *env, int index,
 
 G_NORETURN void helper_raise_privilege_violation(CPURXState *env)
 {
-    raise_exception(env, 20, GETPC());
+    raise_exception(env, RX_EXCP_PRIVILEGE_VIOLATION, GETPC());
 }
 
 G_NORETURN void helper_raise_access_fault(CPURXState *env)
 {
-    raise_exception(env, 21, GETPC());
+    raise_exception(env, RX_EXCP_ACCESS, GETPC());
 }
 
 G_NORETURN void helper_raise_illegal_instruction(CPURXState *env)
 {
-    raise_exception(env, 23, GETPC());
+    raise_exception(env, RX_EXCP_ILLEGAL_INSTRUCTION, GETPC());
 }
 
 G_NORETURN void helper_wait(CPURXState *env)
@@ -457,5 +457,5 @@ G_NORETURN void helper_wait(CPURXState *env)
 
 G_NORETURN void helper_trap(CPURXState *env, uint32_t vec)
 {
-    raise_exception(env, 0x100 + vec, 0);
+    raise_exception(env, RX_EXCP_TRAP_BASE + vec, 0);
 }
diff --git a/target/rx/translate.c b/target/rx/translate.c
index 0672c5c5653..a350f6b4d26 100644
--- a/target/rx/translate.c
+++ b/target/rx/translate.c
@@ -2187,7 +2187,7 @@ static bool trans_BRK(DisasContext *ctx, arg_BRK *a)
 /* int #imm */
 static bool trans_INT(DisasContext *ctx, arg_INT *a)
 {
-    tcg_debug_assert(a->imm < 0x100);
+    tcg_debug_assert(a->imm < RX_EXCP_TRAP_COUNT);
     return do_trap(ctx, a->imm);
 }
 
-- 
2.55.0


