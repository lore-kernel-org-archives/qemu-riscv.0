Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCEDAC4450A
	for <qemu-riscv@archiver.kernel.org>; Thu, 16 Jul 2026 12:37:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wkLKS-0003PZ-Ab; Thu, 16 Jul 2026 08:36:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wkLKQ-0003Nh-OH
 for qemu-riscv@nongnu.org; Thu, 16 Jul 2026 08:36:38 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wkLKP-00079c-6s
 for qemu-riscv@nongnu.org; Thu, 16 Jul 2026 08:36:38 -0400
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66GBjBT12506769
 for <qemu-riscv@nongnu.org>; Thu, 16 Jul 2026 12:36:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=okbMDKMeqAP
 EFxDbR29tMvQwjGlM6BhP1NQoNvRrf8M=; b=iGU+LY2SyjOaa4wUCiiNrVsgr7J
 dErb6HkIo0JRfIb6uBQNIjN6xz46Tq6XNAOkTUF5AU4C3BJVQARAPplOiFBX0mEd
 vyNVNggmvesqB8WQXaHbaYZ+g7evw9HZ2YrWN0dRK/Y5A5U8zleJobRdF/nKneoh
 NpulgBG129bnS58zF7Dd8rdLIw03Vq0P4GYEsdLagviDi/DSxvaKm6AgLaL548t8
 dzpSUjvWaUvW2Uw02CQ1DwWgkDK14cpQNE0CmDTF8DB2ZSozFmQWKiPCDTnHw8/9
 4RObPlSsyGj8r7fa85QNJaUtCY1mM/LFfQ7o8W61D38RmXgIXb8vHzdf1qg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4feehvbsus-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 16 Jul 2026 12:36:25 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-8f113592bf3so61685686d6.2
 for <qemu-riscv@nongnu.org>; Thu, 16 Jul 2026 05:36:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1784205385; x=1784810185; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=okbMDKMeqAPEFxDbR29tMvQwjGlM6BhP1NQoNvRrf8M=;
 b=agR0hNp2iFVZYkO+i8Mxn0/pcUaVHvyYazhHyxAMnbJv9Mat2J6qmP59FD6GWNJH6p
 y9f/u+p6zKvnNlEizAZAr8O7KHu4khoO14QOYv3aT59unog8GNQDDP0ijltZ6PMuVcPf
 4Dq+j8HPkQt3PS+ArtKjELTtTJjBm6wjvQMKktrv/ZIhuSxWdvF83GRE4EBkleX288a7
 zmTj954cp2pHX2SX7qJyIM55ne7XqSQy1VAMLgoX7HUqPRhUIvzS4sfYOPy/q6UkKlT7
 Y2CNZQaMBgOKWYQHAAhrhkoDGl49q4qExIDRglHVfHDuLiAi/HQuv1uspcNyT+//gxUs
 BNqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784205385; x=1784810185;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=okbMDKMeqAPEFxDbR29tMvQwjGlM6BhP1NQoNvRrf8M=;
 b=sWZhCF8yHJLUD94d9lMoUhVPW2SUbxsHGO9ASLnziZUWcYU1+MtUJQGkvfY6vVfMe2
 PoeWmh4rWgdd27Ic1u9qaNvCSmc5zMIe9qyqneVwCRmpOCv0Gjh2CNjszlQudBf7CGew
 y7Oq75x0dNizO+03mamKvAkmiYFrk9D9dLnN2LUF8vHkcd2BoQsKtSxk6w+94RA2FqDx
 QZuRqI157QZO6xUtZX3aB/D9d3GoMnaY79/XrCTITFm44dk/bc6bXvE1YPBPrgqIjvUI
 VaXydOnuQ5WVueyYHdqqhhsvkMCf9FLlfI7ztKN3BgswZDwzSz7Lf1P0BhsN2q/jgehY
 VcEw==
X-Gm-Message-State: AOJu0YyJqFYhCzyPjVibOkWedeMWJML+NGPPsFBZTGUEg+GwTI2nPgPK
 sPe3I7czApMrxc1h7uxn4/1jyDN0fkJxeTZqjY5ZRNhr/RnTUb+1xIX/3wAUZbJDiSPTmpQfX6C
 a+H98BJN8x/iWAmWCZac9UapMJs53E4nK0qaSrpl2RwDetAF9rqZjIBwLhw==
X-Gm-Gg: AfdE7cmnPLlWOAYyMVpRtcZTrGbfQwMxJOKH2fEqChB8NFFMfr782whuLX2l+pqOwmX
 YU7bcglHpnxys1h/Lm/ikb6T/uniA2DJ5una3/dUsggwzTYavMUc+/bkB1lRCKc9rhbvPFqxetd
 b5CR605uvEfCRcaBST5ylg882OpjyyQolh22ddyjlBXu9/E+vy+8etXNzz4YvCivgEEwmi4Noaw
 ArG3ZFAHMLNKUSv8JAJWVjMjXDG5NOJfCalZgO+H3JF0ESzezjggsgiAUPp2t911TA+SisfwBE6
 V59xBtcvFIbIP8ZBljqCXVTLo3KDbFn8cehofhUHGJLQ1rMq28e+TzTR+YldDaP0sf7LlWLZfVt
 /+Yw5gyqBdy50WLuvaO9bcFzVWs6ORKBwIlQ=
X-Received: by 2002:a05:6214:4005:b0:8f0:b50f:dcf with SMTP id
 6a1803df08f44-90400b8b7cfmr257176166d6.7.1784205384669; 
 Thu, 16 Jul 2026 05:36:24 -0700 (PDT)
X-Received: by 2002:a05:6214:4005:b0:8f0:b50f:dcf with SMTP id
 6a1803df08f44-90400b8b7cfmr257175666d6.7.1784205384189; 
 Thu, 16 Jul 2026 05:36:24 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([189.79.21.40])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-902de1fdb3bsm191609316d6.23.2026.07.16.05.36.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jul 2026 05:36:23 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com,
 npiggin@gmail.com, chao.liu@processmission.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH for-11.1 16/17] target/riscv/debug: Reset trigger type to
 unavailable
Date: Thu, 16 Jul 2026 09:35:33 -0300
Message-ID: <20260716123535.3709148-17-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260716123535.3709148-1-daniel.barboza@oss.qualcomm.com>
References: <20260716123535.3709148-1-daniel.barboza@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=ZpDd7d7G c=1 sm=1 tr=0 ts=6a58d049 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=sHJf4AwOIoU3qjeHFPlg6Q==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=YoUxN3H5ZC8bLvEMz08A:9 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDEyOSBTYWx0ZWRfX6MvzVIvsK8eT
 H4+7eE+le2UdjNOG3jGZYlh+CtoK7vpcE2Q9ohoV6/cOBj1JL9xMoBIaqP805unGNUiSJ7MkBqJ
 JQ5jvEmEd4Hk3o0VeCrvolmm3x9TJDyCEruIkrpfCMd/ahpM/dBrTaR08OTDlqGRCDSxXq3TAoP
 cZ9GEU2VvL0MTyC4f4G7O3dEEh2edrVsUU1B7HwzgGDNkVskxh7FI6kfuRV+GOeAS1IcfFIkY/Z
 A2hzj3MprydlwjEFMDbaHNR8lK4mBeRVvOTb1sE3KGPqjCNIIQa/pd5dUhD/NIvs3TkdQtGUbDQ
 e5rSCrna8nWc+vHTaV4F8mj6bxnDXnTLnZ8KwvbvW3j2PBOg9zsvup+6gAe+M6t6ZBNb+6L+Z2E
 4ZJeiQOTyhlIu+kKD6wInUFLgdLMAUDnz8u6y6LAgd1FCukXiRHawcIHucsHhfgqfuzcJWfXWJU
 WKI/dsgRng3E79qI+eg==
X-Proofpoint-GUID: Nor45mV9on7ArCr5-Ygc9UFGS3brOXFx
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDEyOSBTYWx0ZWRfX1M29xONvCwlW
 +Pt1UxV4vZ4I0sWw5TRaAhTveeVOX0Sy6kkb11MAnBPxUK1hAM766TnA9Jri5azkjeQruvNWm7+
 qaYjtLZCa3bmg1YMCnRI2dbT0HSg3dU=
X-Proofpoint-ORIG-GUID: Nor45mV9on7ArCr5-Ygc9UFGS3brOXFx
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

Reset triggers to type 15 (unavailable). The reset value for tdata1 type
field is implementation specific, legal values are permitted.
Unavailable is a legal value, and some implementations may not support
type2 triggers so use that instead.

Fixes: b6092544fc ("target/riscv: csr: Hook debug CSR read/write")
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
---
 target/riscv/tcg/debug.c | 17 ++---------------
 1 file changed, 2 insertions(+), 15 deletions(-)

diff --git a/target/riscv/tcg/debug.c b/target/riscv/tcg/debug.c
index 9089d2ab78..50e5a85caf 100644
--- a/target/riscv/tcg/debug.c
+++ b/target/riscv/tcg/debug.c
@@ -1183,10 +1183,10 @@ void riscv_cpu_debug_post_load(CPURISCVState *env)
 
 void riscv_trigger_reset_hold(CPURISCVState *env)
 {
-    target_ulong tdata1 = build_tdata1(env, TRIGGER_TYPE_AD_MATCH, 0, 0);
+    target_ulong tdata1 = build_tdata1(env, TRIGGER_TYPE_UNAVAIL, 0, 0);
     int i;
 
-    /* init to type 2 triggers */
+    /* Init to type 15 (unavailable) triggers */
     for (i = 0; i < env->num_triggers; i++) {
         int trigger_type = get_trigger_type(env, i);
 
@@ -1201,19 +1201,6 @@ void riscv_trigger_reset_hold(CPURISCVState *env)
             break;
         }
 
-        /*
-         * type = TRIGGER_TYPE_AD_MATCH
-         * dmode = 0 (both debug and M-mode can write tdata)
-         * maskmax = 0 (unimplemented, always 0)
-         * sizehi = 0 (match against any size, RV64 only)
-         * hit = 0 (unimplemented, always 0)
-         * select = 0 (always 0, perform match on address)
-         * timing = 0 (always 0, trigger before instruction)
-         * sizelo = 0 (match against any size)
-         * action = 0 (always 0, raise a breakpoint exception)
-         * chain = 0 (unimplemented, always 0)
-         * match = 0 (always 0, when any compare value equals tdata2)
-         */
         env->tdata1[i] = tdata1;
         env->tdata2[i] = 0;
         env->tdata3[i] = 0;
-- 
2.43.0


