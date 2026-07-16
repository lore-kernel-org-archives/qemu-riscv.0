Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 025E0C44501
	for <qemu-riscv@archiver.kernel.org>; Thu, 16 Jul 2026 12:38:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wkLKH-0003H7-Sx; Thu, 16 Jul 2026 08:36:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wkLKG-0003FS-IB
 for qemu-riscv@nongnu.org; Thu, 16 Jul 2026 08:36:28 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wkLKE-00078F-Sd
 for qemu-riscv@nongnu.org; Thu, 16 Jul 2026 08:36:28 -0400
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66GBiP4t2824057
 for <qemu-riscv@nongnu.org>; Thu, 16 Jul 2026 12:36:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=+AcuMBz4w1X
 5F4z0wmXVYFfc0aIM6+1hAQ91Y93OF9U=; b=g4tZa1s49asBUXH9xx2tlE+NAsD
 M2xKDjNCDWhmgygJONLqnawDZf85jiyf4k1VxNbUXIuDZTXGqd67w70NHrYtpVmD
 uzHN5OqCQZWrmF4BXbKR1LcgFiwsNPjVHkFjwkQks8Qq2UQBxv/l9hteDW2hNn21
 utEzgSLIPmu0fIZJzV3PQosCJV/KtlGfvSr31e+xSDJTOAMUCUGvAfkpRxn0aiMU
 A9v/GLHf+TY9yI65MxG2L+AHa654N9RYQBurZLN/gZjzTidlba0+m+/I+r/cjwTA
 EJOO3Jy3tZkYXLF2D1xyXOxY8PFq92rb7JeT7QVZ8dUJDhEgJ7djOiZgTAA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fetcf1bpv-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 16 Jul 2026 12:36:15 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-904c1d588bbso7162436d6.0
 for <qemu-riscv@nongnu.org>; Thu, 16 Jul 2026 05:36:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1784205374; x=1784810174; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=+AcuMBz4w1X5F4z0wmXVYFfc0aIM6+1hAQ91Y93OF9U=;
 b=esoRA+LeShtJAqgIFv+yIwFUpTjpUZp6j9x8WX/rES9/ub0Nap8YPgTIFwxTnJl0hW
 sQXcHOujVfz5xVpj0EfEdxUEMghDaqgZGTuwIw1WmkWsnRhPPOtTpVjd/DnMCW+kjrEE
 jxKM9gypJBVLYFpqWTd4z5PKjw8p9RqXY3W06y+i9vHEPdvyCp5FPK3BpmDv+/LsZiAc
 qQ7ex5ABX1ZJ/weTdgYJ9DHxJuKBjsjOpqZ8jNnDZ9YSeiGAKONnYnREbbK6lf7aRFJ/
 eaLLNat1StWrBOestRfCaB8RjvgVA7h5/xnM9BFqNH1Voc/6va85AeWSGr2YXLrJ96F4
 P9jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784205374; x=1784810174;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=+AcuMBz4w1X5F4z0wmXVYFfc0aIM6+1hAQ91Y93OF9U=;
 b=TZy3T1m/cW8zXHOwgJxR8kDiv2NK3Zi7sqwgutkkTzqEiTWnhWYLCjM8wshnEU5s9M
 c1uxDvR7/w1kG5v95WXwbnNdGackuBXm6WGmwpKA2vweu1AIYDvQ2/OYOVMpIQw+o2xD
 ARVbiSKY3ZvxGpVblA+3Y20YEqmAanLu5OBNZq0XpMvXe1gE7AW2UvpG8oxfbKe47UlK
 leWthhSdEoRG2UPb5ovmJM++EFx00+RkPkwz4S1K+gMPwQCyq+JKUefUj3U9wmGaq0JS
 ou0Di3KdFHovpJ6MUTB0sLj9pxA610ZU4xf6PxWxd2fDvkprqFYdFxfiodHJZ4LO6WiG
 f/BA==
X-Gm-Message-State: AOJu0Yw+BLhY38xmRDrx7EsB2bGqny6+1MkGSBPgND9lVirwloU/Kd47
 KZGhNKmO10jNyAsKH0TL78gAeGhz3GqHPXKbCdGpYMHIMk2eiIQEaDc4Ba5J9SqRlgShexY+pJG
 tICL/O12eEetFuqN1XEvf+jqdQ7xSu9w/eP+jm8iqdq9eLliPRqcSmTcKizbkhcCWDQ==
X-Gm-Gg: AfdE7clKD462EWowyT/fwGsudGlcAo0b2/rZ/kIPY8MnLWsfNxh+yvPGyhhEsTJxIcH
 Pe8WAHjHwklMSiqhn+qjrzshDeX0++G5gEhNI/DXnBHM107En/j47V72SWd3P6TR1Ic1K7OS7Sq
 SyfgsDiaNLrCN4Ogci/W8WATwR44CGJXyIpOCtUs3wyyMBUF8pvjPBtPf0ov3ve9L9yX3gHDL8M
 29skbxCZSzut//TvMRmKQQ3fbFumYUaIMB66FltoA4QrXswnZ9DE3ZCa3hABoTABlaHvmHj25iP
 mWUi1nqrfec3t2VmIReesZ4OL0ft2+KziDwP/Pf/mjSR/1wkJIb4ZM0cxAShxmRpeejr30Bfi0m
 uZQU1XUjaNpUMRzsalWPyX5nEFhyPKeL7Amg=
X-Received: by 2002:a05:6214:2388:b0:8f1:77b7:9bdc with SMTP id
 6a1803df08f44-90768de19eamr24188596d6.1.1784205374289; 
 Thu, 16 Jul 2026 05:36:14 -0700 (PDT)
X-Received: by 2002:a05:6214:2388:b0:8f1:77b7:9bdc with SMTP id
 6a1803df08f44-90768de19eamr24188036d6.1.1784205373646; 
 Thu, 16 Jul 2026 05:36:13 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([189.79.21.40])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-902de1fdb3bsm191609316d6.23.2026.07.16.05.36.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jul 2026 05:36:13 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com,
 npiggin@gmail.com, chao.liu@processmission.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH for-11.1 12/17] target/riscv/debug: Remove breakpoints on reset
Date: Thu, 16 Jul 2026 09:35:29 -0300
Message-ID: <20260716123535.3709148-13-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260716123535.3709148-1-daniel.barboza@oss.qualcomm.com>
References: <20260716123535.3709148-1-daniel.barboza@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: wEPRy7KmPyZPO8ctfWR5n93moTJWkM0U
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDEyOSBTYWx0ZWRfX28pUAzltE0rb
 imh+6cjsN+IEj/EgVLNRIsuK84QNQZWJ2VCE9U1FUrqFhaa24EgC+W+mXVga76P96o5m1Om/Cem
 3CF6g45oN6+NET34JbosmUBuEMFWEiF76HGEsSQN5Bi0pcIMm3IIR1hVvkEYRD/8jbo15jKbi09
 XALB+CcV80X5m0wMwWDl/CbjedU+iCnzIaKU0yg/v5WHdl6DudWvb3RxnBQvDPZlNqsS2gbA0BA
 f8ujBF6Kdowk0d2lvwO3sgMS+BQr5dBFhXFTQw22kFTgHoXfRkxsnU0JJDxylsOsev3jjm9b3XR
 mbFNHTHcorZyxjJpX/cAqN+FfPspwHbh2xAPA1gmfH+drIeWJMRFUlMxxjOdMoZWCYd6ntJ3rIa
 fsEu72Tijua2y3gsAbSC3iU+OyzLV3ZLNH7UmjbPL8/ajupPWMgJG5riin9XBkyycwcxZebJvMc
 Ny5E4ELKA9UgrnBJ+WA==
X-Authority-Analysis: v=2.4 cv=f8R4wuyM c=1 sm=1 tr=0 ts=6a58d03f cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=sHJf4AwOIoU3qjeHFPlg6Q==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=o2zggslVeTk9FJBUniEA:9 a=gZLHJPz4sbkA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: wEPRy7KmPyZPO8ctfWR5n93moTJWkM0U
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDEyOSBTYWx0ZWRfX667p3q8oo0Co
 m9UH/YsfwR7ujNwOOVuzuRDsr1WNX8HMtBogYvAoCGfEJ0mb0B6D/FXtcNq8rFqYntm9AMsUEFS
 N3a2ykRVovV0Cnql5EPXeIgfc6OJYfs=
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

Remove TCG breakpoints/watchpoints when the CPU is reset.
Currently they get lost.

Fixes: b6092544fc ("target/riscv: csr: Hook debug CSR read/write")
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
---
 target/riscv/tcg/debug.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/target/riscv/tcg/debug.c b/target/riscv/tcg/debug.c
index 7ecbe01fb2..6cdf89c638 100644
--- a/target/riscv/tcg/debug.c
+++ b/target/riscv/tcg/debug.c
@@ -1162,6 +1162,19 @@ void riscv_trigger_reset_hold(CPURISCVState *env)
 
     /* init to type 2 triggers */
     for (i = 0; i < env->num_triggers; i++) {
+        int trigger_type = get_trigger_type(env, i);
+
+        switch (trigger_type) {
+        case TRIGGER_TYPE_AD_MATCH:
+            type2_breakpoint_remove(env, i);
+            break;
+        case TRIGGER_TYPE_AD_MATCH6:
+            type6_breakpoint_remove(env, i);
+            break;
+        default:
+            break;
+        }
+
         /*
          * type = TRIGGER_TYPE_AD_MATCH
          * dmode = 0 (both debug and M-mode can write tdata)
@@ -1178,8 +1191,6 @@ void riscv_trigger_reset_hold(CPURISCVState *env)
         env->tdata1[i] = tdata1;
         env->tdata2[i] = 0;
         env->tdata3[i] = 0;
-        env->cpu_breakpoint[i] = NULL;
-        env->cpu_watchpoint[i] = NULL;
         timer_del(env->itrigger_timer[i]);
     }
 
-- 
2.43.0


