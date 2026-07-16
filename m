Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BED2C44514
	for <qemu-riscv@archiver.kernel.org>; Thu, 16 Jul 2026 12:37:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wkLKF-0003Co-KO; Thu, 16 Jul 2026 08:36:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wkLKE-00037Z-De
 for qemu-riscv@nongnu.org; Thu, 16 Jul 2026 08:36:26 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wkLKC-00077v-1q
 for qemu-riscv@nongnu.org; Thu, 16 Jul 2026 08:36:26 -0400
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66GBiQN42824100
 for <qemu-riscv@nongnu.org>; Thu, 16 Jul 2026 12:36:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=xkIcgkaglkv
 u8MJa4e71VTaUgHHqAhF1ueh5GEJz5a8=; b=V1h2XD0EHd8b7I6fPjEWK/oaDZx
 kUw33P0sdob/nz2dcK2Rb6JzMrAlosW5m5/vqaBShHUTT0g05rPRXAkHtn643w6f
 r+8F9MEZwk1fGJKBtHunEHwayGmWQBPzx1idufj7FwygWmglucXqGGvwlnUyLDGz
 tPIjnU7oT9edCRQLye8qG0FUmScIAHzUvuX/t13VT4p30Chsqijs5N38ZDWhkewU
 Pchn7kwg0GUgJ6qdqmTBft4pqx97NJFyjLoJJhJFNbFvMk1eGE3j031wP2pOXcPr
 O3WBOvMWSx+NaRMlAmH9CgK/1f+Jub0t6vy/EUncqafT2WrkjwTR75bZ5CQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fetcf1bpj-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 16 Jul 2026 12:36:12 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-8fdace20927so36933086d6.2
 for <qemu-riscv@nongnu.org>; Thu, 16 Jul 2026 05:36:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1784205372; x=1784810172; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=xkIcgkaglkvu8MJa4e71VTaUgHHqAhF1ueh5GEJz5a8=;
 b=QzJl4tJu4mp2vIa/5qlrRD/mtm8+2gMDtz/8NSdmgo2xH3ZAvgSCGlq+kGtchUJCyg
 MPBfxjvJOnvaarcUHVQD5BAtAZMcj+Kfjmsm9j+GiQoy78bbxP2uHQKa0MoW82dY2Yjp
 vMLAUs7tioS/c3f3E0lFWX9PraOZBaS4+8ZpJw6Ypxh0MUU7ikaWqC42uf59Kd6jJzMP
 H9aEQX+D06iDImhg3OYSkh1D5Amz1qJ6R8tLb9Qr8Ow7VhW9HXWUkOcoPaDjmkRy1s7c
 yCgjUr4pfAXXlUmyT3b5Hqx5e797y7RsCznjb+BtN1n1b8T20KqtHldmZlCTnt+jyxks
 RSlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784205372; x=1784810172;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=xkIcgkaglkvu8MJa4e71VTaUgHHqAhF1ueh5GEJz5a8=;
 b=Lrwqs+p1xn4oWWu2b1LxQGxvcPOMSLsv7D+Gi5CUSZ2SP8P+24W+MnrttBCQ+V/vRX
 6ncl6BAVAtaLDoo1Ww50S8Eokm/KlI83ksFE5jbBb/eoVYE3tcpoDOimKqu3FX23XR1D
 ZsXCt441P4s+cFmU/GyHoWz/WOg8Q6sEUnzcAdXQwCtJkOhNhBtXTV/+wkBDw0oJIAzA
 MfZmuLVeBV0rwriL42vxvegsWxa30q2MgGfJIzV3rt5AmHQMA2MKvf0Db5tFjCgYEDVZ
 SYbNHGuFarKOgbsIuUAOrCU8laTLjMK4i24BfxChN3NJbC7YuK216zr6cagFbr2pqLSK
 jgmA==
X-Gm-Message-State: AOJu0Yw0/7JMPRMuHFpIyuVwi8uIHB6/7LnLlY5wtjNExZ1F71FYBOJC
 EqlnYO+RamjWHziUBDCat5WjE1wCW6PAg+Kcfu5lT4stA0vfZZYbpTlu9feKCLqbzn4WS7wvQT9
 Txe4S45fjrF5Q2XH4QTEFiqEDTmh5mDjkVFkd9BGKYiIddfJ1p7HVkYscsg==
X-Gm-Gg: AfdE7clgUYbf8njZMa22VJBcnDhEmf32mrGtOouPeTwF2CV+L+MHQAndfc49FwfPdUO
 +dGXd9vBbb5WWpAKcw2rOAd1XS+J/8gchF/8D7+TwsJvsuDWaFXvXddzoTYeYf04KxOrvud0Zpw
 2TqntUrhzFoMMJLtOpG6Xl0aidEcPyvASAA9iILZPJbQhj8AHodnFf/igIQqJkOddF1IuZZnjHv
 oTrCEv2/zFrTn550/F9AoIm2Gop0rszuyvjSCiSPcuuOHhyPTE+nuxQoSlWCx+0Q8Z0CYtyO3mC
 ZG+l3NycpflUq3yAPPEn5CJXIPIyilip/ovxxD8YLCtu1lPjdMjNBxb7xxmBjaqJf3ou9vK4BOK
 0arYAYNRLJ3TnMf5Hs3cPd0fSdCT3xUtgHN0=
X-Received: by 2002:ad4:5aa3:0:b0:8f3:6c2:222 with SMTP id
 6a1803df08f44-903fec4e811mr252348366d6.14.1784205371690; 
 Thu, 16 Jul 2026 05:36:11 -0700 (PDT)
X-Received: by 2002:ad4:5aa3:0:b0:8f3:6c2:222 with SMTP id
 6a1803df08f44-903fec4e811mr252347736d6.14.1784205370990; 
 Thu, 16 Jul 2026 05:36:10 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([189.79.21.40])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-902de1fdb3bsm191609316d6.23.2026.07.16.05.36.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jul 2026 05:36:10 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com,
 npiggin@gmail.com, chao.liu@processmission.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH for-11.1 11/17] target/riscv/debug: Put mcontrol load/store
 match address into tval
Date: Thu, 16 Jul 2026 09:35:28 -0300
Message-ID: <20260716123535.3709148-12-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260716123535.3709148-1-daniel.barboza@oss.qualcomm.com>
References: <20260716123535.3709148-1-daniel.barboza@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: afsMp_xvEvrd5I2TTMqp1JxC4xYxst-G
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDEyOSBTYWx0ZWRfX61mPioL9kVOg
 Nc99u4ubLk14F4kFYZxxG4s4k44AUFquvhvHekmrhxqkt7ebUsNMI94jelccSpHAwGd5DmCohW0
 XKxucPp2TWWYTF8Ndcnzvvvj755VU9DqzaVA/AatkX25ZkOUBlYvRpXqGKcq8gE38svOYHsioJD
 pUsF9X2b6EdmwxN0YIY9aKdZ2zg977ArguxvK1eJSAEg6JcPskUeZ4en0rgLNItsQU4W2CtoRLV
 F2cd0TFU/w2UD25YsYfModXR7JR8yOLDRRbXGW6gk6KxYtludcxCbtaTeOM3Sx834CmjosPV63z
 cQPBO3FiqnshNYu+kuh779i9+hu3stVZkA1hi1THVwdYBWWRgxKJ/np90x050set4vALySIyzOl
 XRAwA/vY9hyL4DRx+xRxMVamvFyjknMssqI4MWPr0t21SAmnD2O5G0O9NqFeK+3EsTef+KLFdTA
 FRLmCs0IEmlDarv0d/w==
X-Authority-Analysis: v=2.4 cv=f8R4wuyM c=1 sm=1 tr=0 ts=6a58d03c cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=sHJf4AwOIoU3qjeHFPlg6Q==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=1fLd1apDblQkEOP04rUA:9 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: afsMp_xvEvrd5I2TTMqp1JxC4xYxst-G
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDEyOSBTYWx0ZWRfX2LqhHhXxi734
 gdVPiH443ZikmH3k4ZzlFfs8p9oVeGoWXdH9Nd7EPBsywkvv/j6KxOUcrmN3SXWgZ5NNgad7fh+
 DnycV51UzbPmQ93xIOaH5fipb/0xwfQ=
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

When an mc/mc6 trigger triggers on a load/store and raises a breakpoint
exception, put the matching memory address into tval, as is already
done for exec addresses matching.

Tval for breakpoint exceptions is optional in the spec, but it seems
more consistent to implement it for load/store if exec is implemented.

Fixes: a42bd00166 ("target/riscv: debug: Determine the trigger type from tdata1.type")
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
---
 target/riscv/tcg/debug.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/riscv/tcg/debug.c b/target/riscv/tcg/debug.c
index f671ae67f8..7ecbe01fb2 100644
--- a/target/riscv/tcg/debug.c
+++ b/target/riscv/tcg/debug.c
@@ -1077,6 +1077,7 @@ bool riscv_cpu_debug_check_watchpoint(CPUState *cs, CPUWatchpoint *wp)
 
             if ((wp->flags & flags) && (wp->vaddr == addr)) {
                 if (do_trigger_action(env, i)) {
+                    env->badaddr = wp->vaddr;
                     return true;
                 }
             }
@@ -1095,6 +1096,7 @@ bool riscv_cpu_debug_check_watchpoint(CPUState *cs, CPUWatchpoint *wp)
 
             if ((wp->flags & flags) && (wp->vaddr == addr)) {
                 if (do_trigger_action(env, i)) {
+                    env->badaddr = wp->vaddr;
                     return true;
                 }
             }
-- 
2.43.0


