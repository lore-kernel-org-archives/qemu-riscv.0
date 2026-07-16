Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB8E8C44501
	for <qemu-riscv@archiver.kernel.org>; Thu, 16 Jul 2026 12:38:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wkLJp-0002kQ-8b; Thu, 16 Jul 2026 08:36:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wkLJn-0002jm-Uz
 for qemu-riscv@nongnu.org; Thu, 16 Jul 2026 08:35:59 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wkLJm-000758-Ds
 for qemu-riscv@nongnu.org; Thu, 16 Jul 2026 08:35:59 -0400
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66GBiOFn2824036
 for <qemu-riscv@nongnu.org>; Thu, 16 Jul 2026 12:35:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=EwwBYvHtwOV
 uP6r29PDkDTpXbGkGPBuCEacn7qqfsz0=; b=TNr7l98osvHvTOMGHPYcrilC6P4
 lB2+ANSpRyT92PUI4XlBzP0gyHcVaUdFPIgWOSB7AJm0Lk5ncFHodEl6weMr1Usq
 xY+nuOP5FJRz36S0M1rzi0hHMgCEGdaEtOEvtv6SxY3UB35COwutCtCvnzG/I2J2
 jDwsnhtfgNneabRQ4hPN09z9cOPFvxDuXG62Ebo7x8bE5siF8b8Y1EIy0kUu06hn
 6iYb/4QIz1ptnygavxn4t5NYg6OmXqmy4K8IzrWs0ny6KgLgcPFPOd2c8iktLbJw
 tr09QQ84ZjDleaYE1R4WYT+fX/aZmnOD3+yf8XAU0xTeH2kCb8XlMIwID3A==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fetcf1bmx-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 16 Jul 2026 12:35:57 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-8ef18406878so116635796d6.2
 for <qemu-riscv@nongnu.org>; Thu, 16 Jul 2026 05:35:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1784205356; x=1784810156; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=EwwBYvHtwOVuP6r29PDkDTpXbGkGPBuCEacn7qqfsz0=;
 b=XUv/M7hhni9YKMWRZrtbKWoiI4Tt0rjhfV89WhEonWA9N9b2rqxJAZfX99gy4u7V0W
 8LK9JGiVAIKQfAUmZroGNJX8/yt3WRJQDh2JynSiICthAnI1dvJXGuPMDeg3AZhiETwV
 xo0GELNc5Zjk7q1M9JeOs0lcCP4U0Qla3lr10dH+6wfrkSLrI02CG0qH3k9lOdR+SDJE
 btjAtbITBPucJn9wrsGJRhXRXQb9nC54DulPabLDOHZtzQt+NA9uDnOeJWUt12iGe2/c
 0LepcABhE+fPQvXa3fTTVxItijO3aoVNoxcS5h95SfbMS8FV3QaIptkjYIR/5tVxVVav
 QyvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784205356; x=1784810156;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=EwwBYvHtwOVuP6r29PDkDTpXbGkGPBuCEacn7qqfsz0=;
 b=gFgqXa/ZmPvKANsGsGwPKKQIW4pBvOJpEYxeJuQ6cuRriFCEa8VR8DqbBbDUvYXyO/
 j/uiTobFzNZNUZiB0wdUbCXKfIUErVP3GY+fjfuOYJ6CI7fnBOfQ69UEVMkYtJ6fCNYa
 vuslYgPRBCldBqxRRlrc10qAMJ5TUbDMrvgR4zbsFUmVhSrd8q+uxMoLt+12LA5FRop5
 D+lrdgHhn4vmXSuUdqpXsqU/2IA9nB+D5g6KBbNVCnUhpJ9GIyBMoxSCaU/R9aff1M/G
 npUXypLQ3QghsJlmnHGstzn7X0b9C2O/yuj4dQp1REnJ9ISFQVrv7XrK7AMtblzmmpTc
 DTxQ==
X-Gm-Message-State: AOJu0YzMbIf8Ksjo+PIO2IXT2EtmQiacuqeVnI0K8+5aicFbtkmSOuVi
 2QXvxSPaE9347OQm4tCzDvmzCOdWOAmR/IM882p62ncttVLtqEifZ/0SDWjBp0Wk6v9u1/jhprt
 D5LRx6DOsUfmeSrRtjRQEBGXaTVstnrdjCA4Dfdy7+3z1fMqgAVeGIOKkrg==
X-Gm-Gg: AfdE7cmEDIEoIthEsh7jjpOwMVXQ9EHL9Qi5SXBpLwGAla9/XkAMy3jYWtF1ZA3E421
 aBDbWzulmi1Kd9SkYUSzQQoPX7bYqHLLvLAG2UARf1nBGAgDXSaeQnLiy6cxE5VlW+zi50F72D1
 uE3PZ/367a1cJfPikrODTQeE6gUu5/nl8bg9q+tv3NRpYaKRQjQlRGJpb0x/rYwRX2SvtH0P1CH
 LzLxBsOKbhsQv4i1ziBCWlRJeWxLyo4QEnvp4qIHxuKqho6fu5tz7vUjono8tEr8P+mW8bTj5+G
 kzBMTE2sl8xwQ0L2cypC5oM8DkqujE4g8gTXDs+tk21rfKopTXS8yBqDfAfP0OvWRYHR6V8zFbE
 ZIUHidsKGa1EQldacGBk+hfkdq3VG/Ohzj5Q=
X-Received: by 2002:a05:6214:310b:b0:8f2:d87e:29de with SMTP id
 6a1803df08f44-9074c7564d9mr135326746d6.27.1784205356045; 
 Thu, 16 Jul 2026 05:35:56 -0700 (PDT)
X-Received: by 2002:a05:6214:310b:b0:8f2:d87e:29de with SMTP id
 6a1803df08f44-9074c7564d9mr135326196d6.27.1784205355475; 
 Thu, 16 Jul 2026 05:35:55 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([189.79.21.40])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-902de1fdb3bsm191609316d6.23.2026.07.16.05.35.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jul 2026 05:35:54 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com,
 npiggin@gmail.com, chao.liu@processmission.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH for-11.1 05/17] target/riscv/debug: Update itrigger_enabled
 after changing privilege
Date: Thu, 16 Jul 2026 09:35:22 -0300
Message-ID: <20260716123535.3709148-6-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260716123535.3709148-1-daniel.barboza@oss.qualcomm.com>
References: <20260716123535.3709148-1-daniel.barboza@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: nNjNSnUAhGMirFQBYdVxdsy-2EmzN4ec
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDEyOSBTYWx0ZWRfX81gYnmT24utB
 /nY33puqsYOdEo1BoX2VlWvrEiu/gwaRV9a1RBAXkp1nhlcC4Jg6zc5Rzolf5mhuGrBh7nOErVX
 uIK7Ei+oNe+J57UR+4OU/w9Y+Y0FesDx/nG8DfewlZPjgynd1EeO1nJAuIl7q3ie+rjSpb21nF5
 ajhofCqL4LHQskJKjKQ56ayD5+cGgUnqJO6f8zcv1yBxVgnW956ZseUGtdo8DBVzaBAB5d792J4
 +2Fx/nD9gJjktyI8Ox9u9Wd7ClfdT4rM8/Fc0eq7HtYVSD+st32rv2T1g7dyst0fPCrS3msI1lE
 IdNPa5qGpaWxZdcm2Q42rCNr0GnyluqAJ/yNWNlLBkwYF6rvqByPtZnWKgQYlilSvLs+0WmlO5C
 0b8HUwzwErK5kI4XuvDUFJcWQXHHbxe7ADZQhuReEOdQ4MTCOoEB5jt7gwJ/hSEmuB3JnYvzcvn
 YadgSH9TUaUxxURhk4g==
X-Authority-Analysis: v=2.4 cv=f8R4wuyM c=1 sm=1 tr=0 ts=6a58d02d cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=sHJf4AwOIoU3qjeHFPlg6Q==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=iX2v3MgVREIc0uGqDXMA:9 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: nNjNSnUAhGMirFQBYdVxdsy-2EmzN4ec
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDEyOSBTYWx0ZWRfX1c5rlYVJsSuH
 mTH65cYnd6vO2gH3cf1ANLCm9eccgpyqh8HHo4/mzBSTJygWdVMuUuEuJbva2DvneJl8Ekk5S9I
 I51Ld68L8cuGeQc0X+wgLGVJqtkuPJQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_04,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 priorityscore=1501 bulkscore=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160129
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=daniel.barboza@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
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

From: Nicholas Piggin <npiggin@gmail.com>

The !icount_enabled() path should update itrigger_enabled after changing
privilege, which can change whether or not an icount trigger is enabled.

Fixes: b2d7a7c7e4 ("target/riscv: Implement privilege mode filtering for cycle/instret")
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
---
 target/riscv/tcg/cpu_helper.c | 7 +++++++
 target/riscv/tcg/debug.c      | 7 +++++++
 target/riscv/tcg/debug.h      | 3 +++
 3 files changed, 17 insertions(+)

diff --git a/target/riscv/tcg/cpu_helper.c b/target/riscv/tcg/cpu_helper.c
index 07d9222652..6c18526c49 100644
--- a/target/riscv/tcg/cpu_helper.c
+++ b/target/riscv/tcg/cpu_helper.c
@@ -844,9 +844,12 @@ void riscv_ctr_add_entry(CPURISCVState *env, uint64_t src, uint64_t dst,
 void riscv_cpu_set_mode(CPURISCVState *env, privilege_mode_t newpriv,
                         bool virt_en)
 {
+    bool change = false;
+
     g_assert(newpriv <= PRV_M && newpriv != PRV_RESERVED);
 
     if (newpriv != env->priv || env->virt_enabled != virt_en) {
+        change = true;
         if (icount_enabled()) {
             riscv_itrigger_update_priv(env);
         }
@@ -889,6 +892,10 @@ void riscv_cpu_set_mode(CPURISCVState *env, privilege_mode_t newpriv,
             riscv_cpu_update_mip(env, 0, 0);
         }
     }
+
+    if (change) {
+        riscv_cpu_debug_change_priv(env);
+    }
 }
 
 /*
diff --git a/target/riscv/tcg/debug.c b/target/riscv/tcg/debug.c
index 3c777694e5..a0222e178b 100644
--- a/target/riscv/tcg/debug.c
+++ b/target/riscv/tcg/debug.c
@@ -1121,6 +1121,13 @@ void riscv_trigger_unrealize(CPURISCVState *env)
     g_free(env->itrigger_timer);
 }
 
+void riscv_cpu_debug_change_priv(CPURISCVState *env)
+{
+    if (!icount_enabled()) {
+        env->itrigger_enabled = riscv_itrigger_enabled(env);
+    }
+}
+
 void riscv_trigger_reset_hold(CPURISCVState *env)
 {
     target_ulong tdata1 = build_tdata1(env, TRIGGER_TYPE_AD_MATCH, 0, 0);
diff --git a/target/riscv/tcg/debug.h b/target/riscv/tcg/debug.h
index a25d099b37..88d34ecac9 100644
--- a/target/riscv/tcg/debug.h
+++ b/target/riscv/tcg/debug.h
@@ -153,4 +153,7 @@ void riscv_trigger_reset_hold(CPURISCVState *env);
 
 bool riscv_itrigger_enabled(CPURISCVState *env);
 void riscv_itrigger_update_priv(CPURISCVState *env);
+
+void riscv_cpu_debug_change_priv(CPURISCVState *env);
+
 #endif /* RISCV_DEBUG_H */
-- 
2.43.0


