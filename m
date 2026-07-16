Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0840BC4450A
	for <qemu-riscv@archiver.kernel.org>; Thu, 16 Jul 2026 12:39:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wkLKD-00030B-5c; Thu, 16 Jul 2026 08:36:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wkLK8-0002pZ-Ab
 for qemu-riscv@nongnu.org; Thu, 16 Jul 2026 08:36:21 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wkLK6-00076z-RO
 for qemu-riscv@nongnu.org; Thu, 16 Jul 2026 08:36:20 -0400
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66GBibhw3747325
 for <qemu-riscv@nongnu.org>; Thu, 16 Jul 2026 12:36:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=YUymcoiGygr
 awRPU79MPQT/fYxfZNvdtdM4e1c052sk=; b=bFkyTK3RHIqHaC/2OgcdluKC+6O
 aXVg+w5N992toTIrFT5oeqW7JKQW9G09WeIv8nYCPG8AgFJqsYom1Kn7tOUYJji3
 W3hXKc9+ACeHF9V1aR9sWG/TPlVVSsytAOdqGnceir1CajyIrWeLMJwvPn+0XVuj
 eNzXkklpZPEDh3dBVApYT0uuoR87EiMv34xD8RtEhcXLXoxXPiKxHwOKrqHKcZrk
 zQ0kE030Qza5JGLms6tCQVAxduqzQX4d95WauNAl7aFcILHITkejqBYwcH249cEJ
 ZeGOHWycbJ/slHFGKj4+clSflFGMTj9Mz++ngjlPj4FtB6JBEm2BvILHpag==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4feq3pj567-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 16 Jul 2026 12:36:07 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-8eeba1d9e47so87356686d6.2
 for <qemu-riscv@nongnu.org>; Thu, 16 Jul 2026 05:36:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1784205366; x=1784810166; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=YUymcoiGygrawRPU79MPQT/fYxfZNvdtdM4e1c052sk=;
 b=Q1Ay7JqczVeRDNOvOTyIgnTHwbiKKuP3VG3T0WVpp8az7/icTFI+bOayEO5GBTRWau
 6tjqCMOBNPDZ1k/yDzUFuIBPvl5Sqf5V+LR2jfW2QDHlu5SxqfAkOus1B2pHj4ApZXoU
 pX5h/RskZcPtvf3aoN7+0R29ujEgadWkBqRlVPUSlvnaZs1P3JUWT5koMial7yhb1R6Q
 dySrPu0XQzY8Cv3KtjZiHZFjORgEWstyrHjDr0MV/qGEtigC5y/+LPImFkPC53QTO9dM
 IeljhNeGUd3L0tTu7BgXG/9Wgkb5XjhSo0HxDYFor/rVcwhC49HPndk+lIYIWcLXSu/b
 uCOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784205366; x=1784810166;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=YUymcoiGygrawRPU79MPQT/fYxfZNvdtdM4e1c052sk=;
 b=RELgWdJf9BxAy+d7K3MF0gqmXz4QVkp63kP/sKZikp3aEho4K1yNNqPCpqbS6W/4oQ
 rfebzfaEET+OqDUxnOhePhtiVfLCkyvWt0ihoWpZVJDFp2e+9w1r47KXKwrfy+4CfX7v
 9ZK4iEn3dWJFCDm+Od4YzrpJczJNVCfw0CkSzRpupdUbrsloNq1NdWnsVKYWtCk/40rL
 9sOd6SqxVDTC7l/v1YpEcJg5pGLEWg8uZalanV8aaHqkUPGaF4h1OxKpD44ir04eGgVd
 lgQwNU+xVE/DdHeQLmH2e5Lz+ekfKuHlplqje1Idboe3Zyn8gcm7eSPMoQO+uXwvr5B9
 cnhw==
X-Gm-Message-State: AOJu0Yz+SWN/OowrwfhHdEoOhtshXERWrEg69nqXgE92wyyYqvVQYe8+
 c4IC7fW933h6F7rIdD/fCZ/lbO4JgR2NVUH1M5WpseITLuAbGRVGCkYVGmUABXpt5vjTJIZE75P
 Lp0mKCEVCr0mY9skOd1nxbmaCXvYycEBKxA/7KSr201+4eohEg2fRHjVGsQ==
X-Gm-Gg: AfdE7ck9bukGAwyG2PK2oPrSeXYGgZSZQ34qAJU7nVzui/Pu9+oi8shVWivCGs62j9s
 9FSwX0WxS0aPoXzDmfSyxPKzzG6DIT+jaMwuOOTkWLvBa7fOO3qOwU3I0TYuCB0xaJSOvgAX15X
 ftZeOEPr1tAGffq6Edic1eJ1M4Ycj/p3hq2qlEXpApRg9qEwQTCb6DvkAFpvPQDXElYyURH7W53
 JrFRs1OV+OZXnr6hki1GPmdHbqBCflPj9J/K4LpJdUN/iFmepw8BEEcjhGQPezOF6VsjZuY9loA
 sq39N6qPK+a5FUTx6Uxy8a8berO14GYFS7wVYknpnK7/KmGIim5vSeR+dx6KcWGeKmP8eDOmRJl
 CzzwoYLukd4DOdB0SpKgqt3laeR5O2s1lRA0=
X-Received: by 2002:a05:6214:4598:b0:8ef:e857:c9d6 with SMTP id
 6a1803df08f44-9074c728839mr136151076d6.22.1784205366415; 
 Thu, 16 Jul 2026 05:36:06 -0700 (PDT)
X-Received: by 2002:a05:6214:4598:b0:8ef:e857:c9d6 with SMTP id
 6a1803df08f44-9074c728839mr136150346d6.22.1784205365796; 
 Thu, 16 Jul 2026 05:36:05 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([189.79.21.40])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-902de1fdb3bsm191609316d6.23.2026.07.16.05.36.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jul 2026 05:36:05 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com,
 npiggin@gmail.com, chao.liu@processmission.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH for-11.1 09/17] target/riscv/debug: Maintain itrigger_enabled
 in helper_itrigger_match()
Date: Thu, 16 Jul 2026 09:35:26 -0300
Message-ID: <20260716123535.3709148-10-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260716123535.3709148-1-daniel.barboza@oss.qualcomm.com>
References: <20260716123535.3709148-1-daniel.barboza@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: S09og3sxWWY_Y6MzkGm0qORw4YKi5RIV
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDEyOSBTYWx0ZWRfX8TvPF+gJnAHS
 EU8KQa8/nqBEN1L2WYInRGVqUu0AY1I3y1dp0nByvhYdRGKh3F5LnOqbnKEceLRPb2+yw86rBni
 EoUIPoNYi5aIb9lEZxUDaj6oC5aynwY=
X-Proofpoint-GUID: S09og3sxWWY_Y6MzkGm0qORw4YKi5RIV
X-Authority-Analysis: v=2.4 cv=PN8/P/qC c=1 sm=1 tr=0 ts=6a58d037 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=sHJf4AwOIoU3qjeHFPlg6Q==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=oNqV0Gv4MAO2-P9rc6IA:9 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDEyOSBTYWx0ZWRfXztIp3zBPu6AS
 lIcOKpCvnm6PCEM48vJjGS8zjerWNzs5Q4SUmLws3z5ZDHaE44nWYbXjffSzPBIZwxjLSMQbyKs
 Nhn0Bp7ADU6IlATuLJ0lbQi98zx1aRJgwaupQ4tGgh1ZgCN90wOEoSXaLAL4jsM5zS7cbcVEHEK
 olpt6gQZEyQ1TT9Q5lUgsvoJtleNTLL+CMS1mLsmifaP4cTDcbPwHdjaKdmpFD+I/7yXJXBn0BN
 YorBuSY4Ob5Ho29iozjU60DgBuHFo5a3fav227sRVyRM855HAhORTSgrF8PHOVSM6GQJ+IY1WY0
 AGmQtZ9hBV+gxDi1WdYRrORIgS6912Zxq4MeXMfVNdrfrxXq7LGENbvf0it9+0Z7sq1ecQPpQ/b
 jsubipRMGa7AhZfn8NvEe2blHoWgZnyIETztNdwkLVIePE0XJtNiXs6m4kzBqTT3GRLc305+q+l
 zq83SWwagPaZ2DgUehQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_04,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 clxscore=1015 suspectscore=0 spamscore=0
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

helper_itrigger_match() iterates over all triggers so it can maintain
itrigger_enabled rather than calling riscv_itrigger_enabled() which
becomes O(N^2) where N is the number of icount triggers.

Fixes: 2c9d747121 ("target/riscv: Add itrigger support when icount is not enabled")
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
---
 target/riscv/tcg/debug.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/target/riscv/tcg/debug.c b/target/riscv/tcg/debug.c
index 74f1739697..d98e737763 100644
--- a/target/riscv/tcg/debug.c
+++ b/target/riscv/tcg/debug.c
@@ -695,9 +695,18 @@ bool riscv_itrigger_enabled(CPURISCVState *env)
     return false;
 }
 
+/*
+ * This is called by TCG when an instruction completes.
+ * TCG runs in single-step mode when itrigger_enabled = true, so
+ * it can call after each insn.
+ */
 void helper_itrigger_match(CPURISCVState *env)
 {
     int count;
+    bool enabled = false;
+
+    g_assert(env->itrigger_enabled);
+
     for (int i = 0; i < env->num_triggers; i++) {
         if (get_trigger_type(env, i) != TRIGGER_TYPE_INST_CNT) {
             continue;
@@ -711,10 +720,12 @@ void helper_itrigger_match(CPURISCVState *env)
         }
         itrigger_set_count(env, i, count--);
         if (!count) {
-            env->itrigger_enabled = riscv_itrigger_enabled(env);
             do_trigger_action(env, i);
+        } else {
+            enabled = true;
         }
     }
+    env->itrigger_enabled = enabled;
 }
 
 static void riscv_itrigger_update_count(CPURISCVState *env)
-- 
2.43.0


