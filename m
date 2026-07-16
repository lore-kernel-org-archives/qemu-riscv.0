Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C001DC44501
	for <qemu-riscv@archiver.kernel.org>; Thu, 16 Jul 2026 12:39:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wkLKV-0003Uu-AO; Thu, 16 Jul 2026 08:36:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wkLKT-0003TM-NT
 for qemu-riscv@nongnu.org; Thu, 16 Jul 2026 08:36:41 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wkLKS-0007A8-1M
 for qemu-riscv@nongnu.org; Thu, 16 Jul 2026 08:36:41 -0400
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66GBiXBr2475194
 for <qemu-riscv@nongnu.org>; Thu, 16 Jul 2026 12:36:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=dPPGQjovsqg
 pjPBK0Rf/v7XTwgXHKuSKILoSOOXro+A=; b=B3FaverrMXDEmjbHk4MOUkPT6Mu
 xHzigXtJbVQjyAkkPUVeCnVjEKtAScY9wXb5aO6aMOMjb2VrPV6W8BI26TWhYita
 GacelI2oC7sR+kHsKTCJoUEmoqNqgUPqtq2c6brWeH8+D9uGfanh8Fn3MQ71IOtS
 Bml6Rs+rSpk4hYp3T/meuoEyUM67Arz32XqnV0DawChKGuM+BRfwP0eaj6jUaUHU
 segOB8WMCbl5c5nUa7STABE/5FDj1KPLEwg9VIUMpruBXsb7Umrhz7NKtZSk7P0q
 FIwiqZggbsCDU4bTmrRZgpRju5Q7wEUew+dHQ6kjzy3MMC98+mS7khMlkgA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fetb7schb-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 16 Jul 2026 12:36:28 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-8eeba1d9e47so87361006d6.2
 for <qemu-riscv@nongnu.org>; Thu, 16 Jul 2026 05:36:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1784205387; x=1784810187; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=dPPGQjovsqgpjPBK0Rf/v7XTwgXHKuSKILoSOOXro+A=;
 b=YHya3NQQhs+97LPQwcltMABOAoTv8Gat9hAZitmMjAyYUydwRfGUY6u/1beI4NRi51
 bdcMge/t9Sc8EYUbH/3WvEP2ENGaLe9wKtwRiauL0xMQivWxE8XgI410yON7upLZwkP0
 o1zhS2h20GTCvvJpQNcBfekYHw0HdDGYhERRrNMkSuprAgyTTv5ANsCZs8slo5y0aa71
 OkeuAiaz9QF9036lFuC/yAQVkYqecNDvJSZ/I7oOJAKK8ayfUgJ8hbK2e+QBZy0Jm3NS
 SL5W/AvsRS5XOdRz2KnCXBYXyVY/hTdRnlJ3LVfUuzDYAFmjyzMockSYOEuNVY4dS9pL
 ZALQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784205387; x=1784810187;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=dPPGQjovsqgpjPBK0Rf/v7XTwgXHKuSKILoSOOXro+A=;
 b=R7R79l/WZjck3FVEhorgn0AMOAPQ8/RWWVejYOqTuagmLzUA4Y225iuB95nOCA1odz
 7eG7pSgj63cuY4yljvZSp/0JQPOKbw9t1EZHM4FZ6vsepPyUaNPnVzfLPDIK6si/0NSi
 ndSUTftV7v9kjnxTgn7eeiVFrYOxi6491Z0j4JHKG6JwLKAbHhkdatn0AQHsAEh3tyxK
 ACh6OJx5DYL1uWSH7IROrkZlZI2zjgcZXh0uY6uZyeIr5W32yoCd9DDLWYAKRSGzs7KY
 /K6uNgU8bzJ8OOKTjRtOhO3eUgVZ7f3U3XRYUrHQQaEt6PwATe6eqve0R1sz+I99tmSb
 UMyg==
X-Gm-Message-State: AOJu0YyR7PtjitRwPrL4VMc3TXY+Pk0qsSLbSLL2Rw6NDMdWZzN+6g+2
 NUDnh7rvB/oogkmOJ7M2tDUCVlPiXaZOZPJSUiB8iupEtnzAmVQ1CO+pbAhASr99//Qhh2B7LqG
 fJRP1bysPKdrOJ/8w5IuKPJIwFsYjUdAsjaZiQaBoX3KYLSo/fSRczI6E1w==
X-Gm-Gg: AfdE7cmsYTLDHWk3/WVUjNDGj9h0OCmJr2BC1fSL6/8/59CJDxE+r2XmZMlKghzJRVA
 Rgk0v3kz681xCtXYUoRMM3gzGu4UUI+tMsNWhQoGGnA+x+xvEbK1kY0LMkVsCyBQChBGRm8agcF
 3GM4lzVMn5C5OEFKeWAqkgUj8W8aFaPapS1QrsAgfkGsLYNJO3hQUuU4n49O1H1aX/Tj8Nn24Ew
 X8m6pLIq1yN1TzggBHQYd7u3fLx76k260Ym0t1Hxydp3vyF+7mpU5qmdZyG7BcVfr4b8Njhr6Xf
 Vi3F6Mh25LLggOb7efZue9vy1NvmmGCyJBPfFwfXPE4mQKTH5vUqwRPNxcxGkXzHMd41KhMu2WX
 q4Ir2TiShAz2iHwq1LCOrVyQNNhV3rihXIKc=
X-Received: by 2002:ad4:5fcf:0:b0:8f0:12e8:f453 with SMTP id
 6a1803df08f44-9074c814f62mr112472136d6.33.1784205387338; 
 Thu, 16 Jul 2026 05:36:27 -0700 (PDT)
X-Received: by 2002:ad4:5fcf:0:b0:8f0:12e8:f453 with SMTP id
 6a1803df08f44-9074c814f62mr112471746d6.33.1784205386876; 
 Thu, 16 Jul 2026 05:36:26 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([189.79.21.40])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-902de1fdb3bsm191609316d6.23.2026.07.16.05.36.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jul 2026 05:36:26 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com,
 npiggin@gmail.com, chao.liu@processmission.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH for-11.1 17/17] target/riscv/debug: Fix minor comment typos
Date: Thu, 16 Jul 2026 09:35:34 -0300
Message-ID: <20260716123535.3709148-18-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260716123535.3709148-1-daniel.barboza@oss.qualcomm.com>
References: <20260716123535.3709148-1-daniel.barboza@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDEyOSBTYWx0ZWRfX43rwNglOQEb0
 kxyb1FXPGh0EVQlLXqVNO9arVKpUYlejjoHSlXcihDZ6fCeIcK3oHDNS2Nw62kcVacKsoQOmZqH
 W7ByjxHxuHUTVsHyeUCgn4pT9Sp75n4=
X-Authority-Analysis: v=2.4 cv=dM2WXuZb c=1 sm=1 tr=0 ts=6a58d04c cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=sHJf4AwOIoU3qjeHFPlg6Q==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=oPyd9XVBMgBqf3_3PDkA:9 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDEyOSBTYWx0ZWRfX/zvyD5uplNQW
 XOOFAfSHCdjzPP3isAdBhdRevJYzD3GCwleStpoSgTOxpwIa+2V6r3GwaFOBgqK4zYBWCGH2cI7
 cY+RHFib2NWrM7dxiYuAblbyWmQYy+Godc6AXr/k4uOPcvKK4PFgf1Qf/1p+ZEuZ6TikgGt7N0H
 4BZckQqOlVlm0JP6VNMYRG9vL9t0T+4ZB+1Oq9mROxPiA7l02O8FqvTI94x0lmJFbYPD7KSA6yY
 LYTMcje1ddF1fIZEYcWdQdkxs/JPoWfPyF14zVAsK20mAboNafjEQ4QWWwoGiAABhGWVracjL1A
 sDQlXQB692YEqfwoAz6Rh3XCrPzJIVYYNVWvuCkoogHJaIuV0QNm3HyMg79FuxQhKOjTdYkEIMD
 H8JsSyXFxUsG2jB1CscJ7ytTiQZ4t7BaCiGOQpMkrhg0MAflARWG/Gs0iP2DeJaowlm80LmDySB
 ckzws9rz/FB63Xv8T9w==
X-Proofpoint-ORIG-GUID: 38bDN1P3UEQpCWXLtXHccYHV2W99siyA
X-Proofpoint-GUID: 38bDN1P3UEQpCWXLtXHccYHV2W99siyA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_04,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 adultscore=0 spamscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607160129
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

Fixes: a42bd00166 ("target/riscv: debug: Determine the trigger type from tdata1.type")
Fixes: d1c111411e ("target/riscv: debug: Create common trigger actions function")
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
---
 target/riscv/tcg/debug.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/riscv/tcg/debug.c b/target/riscv/tcg/debug.c
index 50e5a85caf..27c2e0da25 100644
--- a/target/riscv/tcg/debug.c
+++ b/target/riscv/tcg/debug.c
@@ -122,7 +122,7 @@ static trigger_action_t get_trigger_action(CPURISCVState *env,
         break;
     case TRIGGER_TYPE_NO_EXIST:
     case TRIGGER_TYPE_UNAVAIL:
-        qemu_log_mask(LOG_GUEST_ERROR, "trigger type: %d does not exit\n",
+        qemu_log_mask(LOG_GUEST_ERROR, "trigger type: %d does not exist\n",
                       trigger_type);
         break;
     default:
@@ -944,7 +944,7 @@ void tdata_csr_write(CPURISCVState *env, int tdata_index, target_ulong val)
                       trigger_type);
         break;
     case TRIGGER_TYPE_NO_EXIST:
-        qemu_log_mask(LOG_GUEST_ERROR, "trigger type: %d does not exit\n",
+        qemu_log_mask(LOG_GUEST_ERROR, "trigger type: %d does not exist\n",
                       trigger_type);
         break;
     default:
-- 
2.43.0


