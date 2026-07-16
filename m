Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CEBBC44514
	for <qemu-riscv@archiver.kernel.org>; Thu, 16 Jul 2026 12:36:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wkLKM-0003Jq-0v; Thu, 16 Jul 2026 08:36:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wkLKK-0003JS-RT
 for qemu-riscv@nongnu.org; Thu, 16 Jul 2026 08:36:32 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wkLKJ-00078k-8c
 for qemu-riscv@nongnu.org; Thu, 16 Jul 2026 08:36:32 -0400
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66GBjA4S2506739
 for <qemu-riscv@nongnu.org>; Thu, 16 Jul 2026 12:36:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=VdBHu7RF6Av
 1LP9UREznd7urSlOX77onQNWl0K2prdY=; b=E9Va4riY3hERmR/6G0MFn7WceeE
 rRE7Aj3XxLFm5OAU4h9G5ixtcf9Km5gVl5NrHpdvdRQbiz9iw/Hys9U0FP1tEOjw
 ggcqltaPCuGxCQVVkQZt3nXLoKvCVl4ujoQeSIE+BzDraO81nRUlYWm7sOPTYtbT
 NZMn9EHeHB34WGbxiaYBhVjgOIKlKxffhFpvNUOmF8AjMd94PN+NM+qwpUGxn+fP
 3yuosyRqq2gSQSiqPgj+rcDp3nqC+nDKt9l+m90rq1YxlVmJ34s9fMSW+cHhSX5i
 lcFPsPSI6IPyODzGcbb9DGaVyejY0Nd7lzYX/fyHfRk3cuu8LeQdl4SS96A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4feehvbsu4-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 16 Jul 2026 12:36:19 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-92e53b8a302so1036012085a.1
 for <qemu-riscv@nongnu.org>; Thu, 16 Jul 2026 05:36:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1784205377; x=1784810177; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=VdBHu7RF6Av1LP9UREznd7urSlOX77onQNWl0K2prdY=;
 b=UEA78a8VV7t5mYUcOABZeNQFLyU/Xet6XyFz2vrxjwlYqc8e6OK5VhsxV2HjcwQK7J
 SMmZjgrf9/bBZ3LGRm8wjRUTrpGYNUfq419fwFe7FMyolLRSRwogRdi7lySEH7weXyZ0
 lZ2ZSkzWoXXKBkj8iV6z0cpFyPJgRlsXHzHXa6le8whnD4XPRafQ0dfniMpqfz1jWAfi
 fFt3DaVVe8ynsDLsUBE/ZJtzPU+O+YyCGn6Xl7oXZfVHXn2hum3QmW1iqB8It2z1BN6M
 qKh40tY6BaQxTBxu0dnaj/9dg8/Bu9W9IGTYYAcfN78wvOoD+RuhAvVwvz+mIr6pldXI
 SvSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784205377; x=1784810177;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=VdBHu7RF6Av1LP9UREznd7urSlOX77onQNWl0K2prdY=;
 b=gHSPuDOfUBXtQujrTwIudbD3d5kk8g6P6dyhAGso3Zj1NNoV/lkiH860k63Wlni4zC
 wLC1LLb+PK6dUK4t2IRdE51y9m4Rs8uhneNWykntK31+Ciqr00ZcSBzD/4JT7II7IA5U
 u0P5AHqYy5cITrqbadUnEjqq83iPtqgMWzm9amcogTDzZ5h+bnxyPKsz/zL5XFMTSWxU
 dkBMn1YrzYHK0XYZ8EnYrbzt4jamCKfWvJBDwoSrFYxmVKNVFBB2MOYioDdcVgWsOF2m
 hh3Z0f3ZP2StUwIzoGy/XJLr3vXKwU3YLWGmTROqx5zpG1E2tx55Kf9ge+4ikHVlOBpV
 bwVg==
X-Gm-Message-State: AOJu0YwyAoAoNCsqNXEDgxGsIEtIOrtD1Pyxpc08eUWNTN2B7TBCWvlE
 i7+10MDQEuuOOx4QnicA0OldfDs4FkslDFkAAefC61e/vzZTonpXYutKZfSKrcn3UlyEAG/apsP
 hOMJ72cpYUyW8crH+Hs0r1LY4hIjIEGhu3Z0LaUlXgKG6NFwfnnPe19soDw==
X-Gm-Gg: AfdE7clQjKNYCkFUvT5OkD2OpFtZbSDvtYn3qf0/eCA5pfe6GIW1XPcMx/MKE23YIb6
 1ARR7zw/aQauQkh+ALIMdRkrOLXSdQxBeScDVT8+Q7Lm+fpSAbaHYRgfIOG1MOEVwvljyNPZEDi
 KKs0tkEtLjzvFhGCaS1SuoQhnR4FXMcHrWHeMaN0AdI6SWka5KzQN8wiDlOh6BlXBedhjxc4UWm
 baMd1cD2rcPnppNQYrVSVPf7XTkgmstRNucdX4jGjviOjuPnW/rkvPWG0uxeV4lPzvYxV940l3W
 uwtDorL+l8OZy3SsYoYQDqkF6268w7CHNi2X0GJaRp/3DzE18LGBDnKxGIitoa+h3pxXUBjZNS1
 Rkys3mvxKtsdjP+ORHWN7Bqk3TTSLWd6jjtM=
X-Received: by 2002:a05:620a:8903:b0:92e:4927:1ff9 with SMTP id
 af79cd13be357-9309622f306mr770336485a.40.1784205377080; 
 Thu, 16 Jul 2026 05:36:17 -0700 (PDT)
X-Received: by 2002:a05:620a:8903:b0:92e:4927:1ff9 with SMTP id
 af79cd13be357-9309622f306mr770331185a.40.1784205376458; 
 Thu, 16 Jul 2026 05:36:16 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([189.79.21.40])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-902de1fdb3bsm191609316d6.23.2026.07.16.05.36.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jul 2026 05:36:15 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com,
 npiggin@gmail.com, chao.liu@processmission.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH for-11.1 13/17] target/riscv/debug: Fix migration post_load
 icount_enabled() test
Date: Thu, 16 Jul 2026 09:35:30 -0300
Message-ID: <20260716123535.3709148-14-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260716123535.3709148-1-daniel.barboza@oss.qualcomm.com>
References: <20260716123535.3709148-1-daniel.barboza@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=ZpDd7d7G c=1 sm=1 tr=0 ts=6a58d043 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=sHJf4AwOIoU3qjeHFPlg6Q==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=bMkCNzlFxodDL1lM-IsA:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDEyOSBTYWx0ZWRfX2P3kNDOlAR3G
 b6oyrmg7U9ARXxvZR0a2Mtg20ZDbVhZVg5qxn4UIMQX4YilY/R/mxNU34W/I9lYwrBiSSzDLVdK
 6/FlZq1Fp+fMlH5ctvwCFHu2umzdqOdjyMqQ4zKDTLXqibJkdZ3nI0Rwk5aaWdpVp3XI719XbeD
 RPWTKh5b/+0IS18RBJ2CtsGBxME7afUCwhzKvTvsETVymBvWcSxuo1ENceSdGXL76xLUVLjuctQ
 NaF/V94iV2pXSbAN8VccjediPyt9YZ4fJenPU+xf8kJqqKlhF7Wm9h+OQEmAXgXkee+chZz9gYv
 Yk6vofgnEoQmsZJ2bmqMUnXVmsShzL7CcCrnJTH9UvLh+dIcxLEU+R0M9v4FNwooIDrE/0nXocD
 pelITIF5RRWNt0qsx7O21Rs6L1DQ1ukN8cDixZYw4cRTpPoett4LF9H/fP6hJYS4psuhr6QB4cA
 +UFlYRQXZsbdMNdazRg==
X-Proofpoint-GUID: ARYABPBe4tB0KgJ20UWZs9VJEZEUGjuv
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDEyOSBTYWx0ZWRfXz5FBsleGZsMj
 ond3QajzUIH/iU2hxgzSRDdiNupRn0IQN07BDyhAnHVOktMEkZR0OzJkZnNNaYCi+gixMgrcLWB
 9xqkWJg29qM/On2W2s2OCQmB3azO/fA=
X-Proofpoint-ORIG-GUID: ARYABPBe4tB0KgJ20UWZs9VJEZEUGjuv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_04,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 phishscore=0 adultscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
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

From: Nicholas Piggin <npiggin@gmail.com>

itrigger_enabled is relevant to the !icount_enabled() path, the test in
debug_post_load() is inverted.

While we're at it, move debug CPU post_load details into debug.c since
there's no need for machine.c to know internals of how debug.c maintains
debug state.

Fixes: 577f028694 ("target/riscv: Add itrigger_enabled field to CPURISCVState")
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
---
 target/riscv/machine.c   | 13 ++++++++-----
 target/riscv/tcg/debug.c |  9 ++++++++-
 target/riscv/tcg/debug.h |  2 +-
 3 files changed, 17 insertions(+), 7 deletions(-)

diff --git a/target/riscv/machine.c b/target/riscv/machine.c
index 0ab613a298..82d2e11eb3 100644
--- a/target/riscv/machine.c
+++ b/target/riscv/machine.c
@@ -228,18 +228,21 @@ static bool debug_needed(void *opaque)
 {
     RISCVCPU *cpu = opaque;
 
-    return cpu->cfg.debug;
+    if (kvm_enabled()) {
+        return false;
+    }
+
+    return tcg_enabled() && cpu->cfg.debug;
 }
 
 static int debug_post_load(void *opaque, int version_id)
 {
+#ifdef CONFIG_TCG
     RISCVCPU *cpu = opaque;
     CPURISCVState *env = &cpu->env;
 
-    if (icount_enabled()) {
-        env->itrigger_enabled = riscv_itrigger_enabled(env);
-    }
-
+    riscv_cpu_debug_post_load(env);
+#endif
     return 0;
 }
 
diff --git a/target/riscv/tcg/debug.c b/target/riscv/tcg/debug.c
index 6cdf89c638..56f9ceb042 100644
--- a/target/riscv/tcg/debug.c
+++ b/target/riscv/tcg/debug.c
@@ -675,7 +675,7 @@ static bool check_itrigger_priv(CPURISCVState *env, int index)
     return icount_priv_match(env, index);
 }
 
-bool riscv_itrigger_enabled(CPURISCVState *env)
+static bool riscv_itrigger_enabled(CPURISCVState *env)
 {
     int count;
 
@@ -1155,6 +1155,13 @@ void riscv_cpu_debug_change_priv(CPURISCVState *env)
     }
 }
 
+void riscv_cpu_debug_post_load(CPURISCVState *env)
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
index 88d34ecac9..6246bedff3 100644
--- a/target/riscv/tcg/debug.h
+++ b/target/riscv/tcg/debug.h
@@ -151,9 +151,9 @@ void riscv_trigger_realize(CPURISCVState *env);
 void riscv_trigger_unrealize(CPURISCVState *env);
 void riscv_trigger_reset_hold(CPURISCVState *env);
 
-bool riscv_itrigger_enabled(CPURISCVState *env);
 void riscv_itrigger_update_priv(CPURISCVState *env);
 
 void riscv_cpu_debug_change_priv(CPURISCVState *env);
+void riscv_cpu_debug_post_load(CPURISCVState *env);
 
 #endif /* RISCV_DEBUG_H */
-- 
2.43.0


