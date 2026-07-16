Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAB2AC44501
	for <qemu-riscv@archiver.kernel.org>; Thu, 16 Jul 2026 12:36:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wkLJw-0002mJ-W1; Thu, 16 Jul 2026 08:36:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wkLJv-0002m2-NV
 for qemu-riscv@nongnu.org; Thu, 16 Jul 2026 08:36:07 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wkLJu-00076T-4S
 for qemu-riscv@nongnu.org; Thu, 16 Jul 2026 08:36:07 -0400
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66GBiocu2355519
 for <qemu-riscv@nongnu.org>; Thu, 16 Jul 2026 12:36:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=oWst/VlSzeH
 r78zJf/0h46yr/Sd81639ox7uwOej8hA=; b=kTYHKCzh1W2v5iFacA02CUouU7m
 r9AWEDB4mZJbh+iDmZC9tKH1Fk4FljbAVVVJfJ1cZq8mQ/FeiEG+zjei4TwqqJXB
 PIB6lf2X+3LxG0tXEc7xBMc/5ddP4WGuxfJbOPaKr5g3S5dKSL08BLFd7HYEpGsj
 R7fWjQeCa7gkWit3/hky2rAQdgxxwv+kK92+W6bNSg4fJ6H4kFJvaayI+k3mdMOs
 5pSwUvo1QNewb19J7iw52DEknh6FGincPt/JWhKeX4i9lB5LzO4XAezLnAgWDZR0
 jxB/AWIJlbJiIIIVu/P1yZ9OOLVragL5s+F3wmgV2lNfQOP/wBs6GzivaRA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fed064c6t-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 16 Jul 2026 12:36:04 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-8ef8249f871so108846066d6.0
 for <qemu-riscv@nongnu.org>; Thu, 16 Jul 2026 05:36:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1784205364; x=1784810164; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=oWst/VlSzeHr78zJf/0h46yr/Sd81639ox7uwOej8hA=;
 b=Icw+8VxntFcBDjgQ2xaYHUy18LPzXjTjWgYr2LYPdxiyDcLqpX6/prb+geFeSNXPJ/
 +Qegq2KYYGAYKVAnPevtSTrePWXvVtb1WSQZF8V6llqhLcKJRR1nAY+J/eaqUorffes+
 UGo7xdxbeKzSnH6elNjEgUjBBobn1gwO+WU2DJGzM5gyNUkafAmfHu+SWlDp8vtXr7HD
 ekzgYcLw3SCvrDJ6tHhS1Si3lvLh7/5n+pDzrxpNzndsm0TplDqi27t0f+GN4udohAKS
 Xl6vmWRJN381mBBLC4agcSgNgxxfn+a/WsrKeEsjCStMMm+qp0U0/tvMB/VoPeoBTx0A
 p2TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784205364; x=1784810164;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=oWst/VlSzeHr78zJf/0h46yr/Sd81639ox7uwOej8hA=;
 b=HjDQHLfgx7kt3Ag+2flKO+PBWahyjyZVnuNQpvvBla+02VOxpcgE00O2cpsTgfCFJh
 14Atfis0TK2o7voxkPsSivL3xRte85zhbRE3oRZQUhi8DE8Wn3ZQ+BEjKIFjHX5YB6Ef
 FN75X6ZwUGU8A+E5w0NSzXSWFt/N5O06oJ1cdCiybeMNAcea6YcSIXBGLs3BnouOIF0Q
 +mb64/27t7mTatR2jIX6nky9kRjFKCauKbWqIJJK+CsOFEGZDbcPlH1ibS3h3NIvyN+T
 YRBEHKCjm5gdLi0lAiHC6A0agSWqB2Bw0y5mF/jf5TKEv2qSWj6Hgccr1x+1xCQ93T3W
 fIvA==
X-Gm-Message-State: AOJu0Yz9B1q33W2txMeYR2iR+5JDrENQ0qu1kKTkrw9Kb2MqtzQ3xXXr
 DMgHVK6shn+aBtXu9faYL8usA4yw94NAXDfWtgA26z/dMvOxT384y8TDEMR26I5kVl5+VZysjn1
 zw/8uaraUMOqimOrUw+Fcf/QsZ/6/X8L3POwlVX+4k6m4n2lTyQWF4Zxmtw==
X-Gm-Gg: AfdE7cmeP51nu66lK7lDhh0T8Nb1Lm56Yc/VlT2fThBjtaArpYmRj404fi6fp1R5tSN
 1SKDm3fw8R++XMIHWJNhEd0NeOVcTlo5QzPfnvahSWBTqhbfLWY26xfAIW4uzfL1cK7CRcyxBDg
 KCY2t/3xInF8YRxXcoxE99vU3e1tX85baZ74KlF8d0/+FmFM5PHUHHK875DUfc1SjHr2njEvPUl
 ud/S2AgYj5jhX0j/HvPu8b0NRliszdDwV8NRAY+DuqAqiPbv4CKzJkvuQdAGowiNMjqQGQ0YGZ0
 aHnkUN9X9rVb0IPmIx3ISkpwOC8xeZ/M3aVLhDWg62u6Pbra3pZU+FUoAm55GeSiAFhCM6Tg3VV
 15XR0RoCb6UFMqnxpn72erUcErYILrplZUKo=
X-Received: by 2002:a05:6214:3d88:b0:8f3:9d85:405b with SMTP id
 6a1803df08f44-90758ceb518mr84581006d6.16.1784205363723; 
 Thu, 16 Jul 2026 05:36:03 -0700 (PDT)
X-Received: by 2002:a05:6214:3d88:b0:8f3:9d85:405b with SMTP id
 6a1803df08f44-90758ceb518mr84580406d6.16.1784205363212; 
 Thu, 16 Jul 2026 05:36:03 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([189.79.21.40])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-902de1fdb3bsm191609316d6.23.2026.07.16.05.36.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jul 2026 05:36:02 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com,
 npiggin@gmail.com, chao.liu@processmission.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH for-11.1 08/17] target/riscv/debug: Implement icount trigger
 textra matching
Date: Thu, 16 Jul 2026 09:35:25 -0300
Message-ID: <20260716123535.3709148-9-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260716123535.3709148-1-daniel.barboza@oss.qualcomm.com>
References: <20260716123535.3709148-1-daniel.barboza@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDEyOSBTYWx0ZWRfXxgn8VHLqne8z
 gLrjC0tRdX7+9E0ql4AnN8obzG4i2Yice5X7z24vDY/YZGf+MQWnWCCY+/QrdyQ9Jtzv3hanPb5
 ngICqSB8yc9I96OzVxGDIuiyLmMR7nM=
X-Proofpoint-GUID: MSZq1bX3QjsHYnv_jNgLasmO5C57XDLH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDEyOSBTYWx0ZWRfX5XExfZIqPf+3
 WpKgeMMjGKmbm6LluEcXggnHBs93ES1edN1F09E6m5ynHXoQQ7PNNtxJER16fO6Kbyschhgctx+
 +PrAQAmw8nuOz39lUWZesAAEVsAXCqMO0xCrlpzm+wSKNl91DA4apqA606tUM/BmxtR3/O3cHoD
 9oCX7WKtzyfTCFH3ukHb1984f6eBYqZilR/kAP3xICXr3qQjmGKcYtjyDHP2iwebzSNhAUEdfKW
 WoV4Vj+C87G3diX9MJ+MrTKEmlRKeka1UbliQogcP2ZA6xz2y1DfCxS5S83vSSSZ8uUE/WcspZ6
 2J4wZ6kYL6veR5ZO84xw+UKoa8VF3MREoNyP8GRRO3Xe7mHZtgcjqNtghmdeGi4nZ+JriawudBk
 cDWuvPDA3PBL2PIiNoLf/uoifH4jvGJLtoCwiYiCczv615GH+mBPksaSG7Llq+mtbX1mVvK6pGE
 Qn4v2ZyWS0SXPw/zO1w==
X-Authority-Analysis: v=2.4 cv=Xb25Co55 c=1 sm=1 tr=0 ts=6a58d034 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=sHJf4AwOIoU3qjeHFPlg6Q==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=8BcSXCmn-LG7ayDxeBYA:9 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: MSZq1bX3QjsHYnv_jNgLasmO5C57XDLH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_04,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 impostorscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 phishscore=0
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

icount triggers are subject to textra checks, per spec.

Fixes: 2c9d747121 ("target/riscv: Add itrigger support when icount is not enabled")
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
---
 target/riscv/tcg/debug.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/riscv/tcg/debug.c b/target/riscv/tcg/debug.c
index 3edbb591ca..74f1739697 100644
--- a/target/riscv/tcg/debug.c
+++ b/target/riscv/tcg/debug.c
@@ -677,11 +677,12 @@ static bool check_itrigger_priv(CPURISCVState *env, int index)
 bool riscv_itrigger_enabled(CPURISCVState *env)
 {
     int count;
+
     for (int i = 0; i < env->num_triggers; i++) {
         if (get_trigger_type(env, i) != TRIGGER_TYPE_INST_CNT) {
             continue;
         }
-        if (!check_itrigger_priv(env, i)) {
+        if (!trigger_common_match(env, TRIGGER_TYPE_INST_CNT, i)) {
             continue;
         }
         count = itrigger_get_count(env, i);
-- 
2.43.0


