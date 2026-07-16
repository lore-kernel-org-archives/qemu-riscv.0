Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75CACC4450A
	for <qemu-riscv@archiver.kernel.org>; Thu, 16 Jul 2026 12:38:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wkLJq-0002ke-Ma; Thu, 16 Jul 2026 08:36:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wkLJp-0002kR-J4
 for qemu-riscv@nongnu.org; Thu, 16 Jul 2026 08:36:01 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wkLJo-00075S-6k
 for qemu-riscv@nongnu.org; Thu, 16 Jul 2026 08:36:01 -0400
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66GBiKVM2637006
 for <qemu-riscv@nongnu.org>; Thu, 16 Jul 2026 12:35:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=3U5w+q5/RVe
 U3CUxIewmMLTwjtkYf3sNkyjj9YwHRGs=; b=QLOAUfh+xpVPFVG8M4ZgunnVvnH
 DKmuYayXGcYEzH4Vau2T2kXrA6pXD5K/LzoWv/aBFnXmUgwTmrgO8OXxrqp+OnuO
 KNhGEgp/z3+g+uq3I6UPK4qskwXRXw/r9bhjqbnYD80Ewu2eturV11AXFrMHEGxs
 wTTWrf0DraZgzu/xUpV8TnL+2V3hl1hkCrEN992+IgKGSI6wBjlg/GMU6YnAJvcL
 sEw9WYcLD+dIzkVSI/uZVjmhI0bjN9R6387ilQI0S1ftMCsEBo2a7+LFflOdNBfm
 crU88kP/BV+guE+SAQbzbBJ7KQ4bRB5u0jxuHZTDixyI5snMwh+AvsfAb5A==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4feuex13cc-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 16 Jul 2026 12:35:59 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-8e9489f62bfso136530456d6.2
 for <qemu-riscv@nongnu.org>; Thu, 16 Jul 2026 05:35:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1784205359; x=1784810159; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=3U5w+q5/RVeU3CUxIewmMLTwjtkYf3sNkyjj9YwHRGs=;
 b=I4VPa3GAbsY5NkoLmiNeuOR0zO8nldm8rvy//AT0VO8hreCZ9CoJhEqo4yKhkUiXmQ
 Zu9wWxgF1GsUyVsffokcn1mdLeGgsOhJX6jOGKgOaH8NSKPHuWshW4GdAXsu/iT0xz7G
 G5U/EXnYEJuJ9X+f4hxC3FcQENQPTOfD/1HgLUUClWyOGbZoF4HNSXUJLUbTjsdLh1jW
 FmjcdeMd6KSDboUNBuED+A9AJw9XFaOjeCJ712dR3b0bfSzmHJQaG+teq9hjGcT+0JxL
 XAPITnHIcs7Ql57hi/bX3jX5J9IDc5yFKQBvsSevx+3DxRIT/7OP8+a+RWHW1i1f2Wkg
 zQXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784205359; x=1784810159;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=3U5w+q5/RVeU3CUxIewmMLTwjtkYf3sNkyjj9YwHRGs=;
 b=KU1DJ9Id46aPrPJM9qniJNwxYP4Knog2rwFAAw6nuS4MvTxIUuGuSpMPXEPEhB2vd5
 2bQJotK8op6yPy2/Tv7GoSW9umDrC3PrG9aIRXOrCKqbLnq85QE9nmycviLs7iN6IZPM
 0bvjA4YtXKc6rCGswh4VXrl5cyn8Alux0kAKPCVVpg+4VWUq7acZUSbptbWH3cpextj8
 7vmhZ6/+5EtjqphG/NxNGV2OOZXOs/j/JwXnrq22U0odCsn/l9rTEE/hlPb8MSxAtcJK
 81F7HyqvESrMWKLfbn2jgcD8JVz4JOG8VzTSSaGx+r1PGyTKqud5Cy8IwSgeTie2cMpn
 vu3A==
X-Gm-Message-State: AOJu0Yy1YPKQSA8car5Q1hy7vRQvX1TiWk1Hty1i9KK/0arlA3hFkdFz
 3d3TCPTLnVRbArogfr9BO3nbnao/kbIS+I47KLa4gZ7OcyntgWhtAu/h2qSp+R//rLgtF5WDwzf
 GwEpYwj5Jh1c6QRXMkVXs2yr3MsD9kfjC7irScT2V+h9fcUKK2Zh4cqA4WHVrFy6DRQ==
X-Gm-Gg: AfdE7cnEeHTQQN34C5WE0zZq88MpgtigQla51lS9CidnPfMwMtIFEvMewXgEmGaOK58
 B5UV5Xm9TRPVMTtrGtbA8D/DaMdVscN+Om32PV5HytDXVRL1UYb/k/V1owZGeBlYXeJKXrhSb2y
 YfpgKhG182dIFwYSyacn+yk5VW6b0r0OSUXaNgb7LSE+pLLXkxCLK63xfJARjNMnR/vNgSNhV21
 p5sdE3yvEcJxnGtPzpY+aH5OG10ZP5HAK1crzTcRnDGztD5Hz41EpqJliFpUy+id+ynctA1iHmt
 7am4hb24y3WWbkx4Cbvq4v39MwYQrDJufzrI7BkRBdNe9xtL6G5QcuIVZOWGXgnZKdc6o1oatf8
 l5+LcSU6gFzTVEHglrBIXUU7d6xrE2Xj/EAA=
X-Received: by 2002:a0c:f405:0:b0:8e9:f5de:d5be with SMTP id
 6a1803df08f44-90758e355f7mr72517156d6.53.1784205358662; 
 Thu, 16 Jul 2026 05:35:58 -0700 (PDT)
X-Received: by 2002:a0c:f405:0:b0:8e9:f5de:d5be with SMTP id
 6a1803df08f44-90758e355f7mr72516786d6.53.1784205358139; 
 Thu, 16 Jul 2026 05:35:58 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([189.79.21.40])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-902de1fdb3bsm191609316d6.23.2026.07.16.05.35.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jul 2026 05:35:57 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com,
 npiggin@gmail.com, chao.liu@processmission.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH for-11.1 06/17] target/riscv/debug: Implement
 get_trigger_action for icount type trigger
Date: Thu, 16 Jul 2026 09:35:23 -0300
Message-ID: <20260716123535.3709148-7-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260716123535.3709148-1-daniel.barboza@oss.qualcomm.com>
References: <20260716123535.3709148-1-daniel.barboza@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=JeeMa0KV c=1 sm=1 tr=0 ts=6a58d02f cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=sHJf4AwOIoU3qjeHFPlg6Q==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=xP8YGnA5bjBj5bUqXB0A:9 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: SXFzcu8H-yT_4nr67kEaK-XiF3rjxSLC
X-Proofpoint-GUID: SXFzcu8H-yT_4nr67kEaK-XiF3rjxSLC
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDEyOSBTYWx0ZWRfX8fxu+TVbwHdI
 BY/5Me+9CFU31lGZuXzI21oADVAUIQGy2m8fPM6lmHGvNBivt3BuX3PKLU9kTfostCUsZ8fndDv
 5coNdiV6uRFONByubWag6NWam2K8rLY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDEyOSBTYWx0ZWRfX6ITHWdpDjKRV
 oWtzAc22C/88MueJZYKaDQxe7OwWjxXc4MWs5TEtW2DXomk08CaqEr3kPTZxgkE8djXmvs6sYLQ
 dvyV4dvR48PxefX5t5VYnN0VVN5OabrlUeV71EECgd4iFPJ7i65EwHyA3IEv+SpfVxGGIynyUH+
 XaIMOhYUQ9gQD7FSrLAs9J8SIQWs7zlUP1NnCRWWr5oeqa97W783d6P2RrkV9c+JRt605PievQH
 WsrX9dK5lvCbY9UjSdzFicJgheG0tIg43lUwavOqUPit103WKPt2IqAx30QIifJc3kP4LpiNW1b
 /0HWokeRbTage9akJ3LdYyzW7B+E/feNWc9LQSZMgRtq8D9klGRwEBEV2OOZEmamrz2pALdEl0Y
 UMilU6mwR0Nrh49DGz9NZIAcxjzVtz1f4yesCU7XzFjUIG5zmT6LVDRoLtLljksNbYYCaLYtQCV
 OvVfAHAOBzvAX2Itkpw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_04,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160129
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=daniel.barboza@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
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

ITRIGGER_ACTION has been present for awhile but get_trigger_action isn't
implementing it.

Fixes: d1c111411e ("target/riscv: debug: Create common trigger actions function")
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
---
 target/riscv/tcg/debug.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/riscv/tcg/debug.c b/target/riscv/tcg/debug.c
index a0222e178b..6aba7e9e12 100644
--- a/target/riscv/tcg/debug.c
+++ b/target/riscv/tcg/debug.c
@@ -112,6 +112,8 @@ static trigger_action_t get_trigger_action(CPURISCVState *env,
         action = (tdata1 & TYPE6_ACTION) >> 12;
         break;
     case TRIGGER_TYPE_INST_CNT:
+        action = (tdata1 & ITRIGGER_ACTION);
+        break;
     case TRIGGER_TYPE_INT:
     case TRIGGER_TYPE_EXCP:
     case TRIGGER_TYPE_EXT_SRC:
-- 
2.43.0


