Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3C71C44501
	for <qemu-riscv@archiver.kernel.org>; Thu, 16 Jul 2026 12:35:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wkLJg-0002gM-5u; Thu, 16 Jul 2026 08:35:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wkLJe-0002fP-JU
 for qemu-riscv@nongnu.org; Thu, 16 Jul 2026 08:35:50 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wkLJd-000736-3y
 for qemu-riscv@nongnu.org; Thu, 16 Jul 2026 08:35:50 -0400
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66GBj2Sa2731890
 for <qemu-riscv@nongnu.org>; Thu, 16 Jul 2026 12:35:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=IEmOH+y3eJI
 /+UHqBYKVlHFvW5x5P24mE84XXeY0tUk=; b=ZD4wUBgjdDQ0vyvwqjb6ewg58BY
 ZlpERv/51QA0FT/vTUHoXHPVQaYxz6NBmEWKog5biH36gXoHbD/jTL5TL1AmrsY/
 UThnwz8kFtDAIxiC+hfxacCN1INS87QDX81DxBWr2iS+XlLNzsva81S6FPrHN/d6
 CMa+ObZ7yV7mltYyOKsNClqtVHe77O/W2KurL6052/vpjlkWUVxd0GIRb133s94j
 v7grGoogECE2vs0HXn5M6nuAm6NR4qJPELGN0rNvNSA3rnh9icWvPF0EqiOR+fNS
 BbtQ8d0LFcl9AWU5w0fEFdqthZN1MJakgzrmo1NouD2VuGB2kZi59jQ8pbQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fen4wadrr-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 16 Jul 2026 12:35:46 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-8f08560ea44so62203666d6.1
 for <qemu-riscv@nongnu.org>; Thu, 16 Jul 2026 05:35:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1784205346; x=1784810146; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=IEmOH+y3eJI/+UHqBYKVlHFvW5x5P24mE84XXeY0tUk=;
 b=AI3HmYUPRHxZKM2FMOkw15uBjBArkJUE0NxkvicGCwFY+26mxJ3+LYAvAn+09B8N4n
 3gI+ipFo6JHYViIw4XUf7Swzo+0l96BiTZdMC7PW5GXC3z1wDdAin01G4vN/T5BcUCQ8
 E9Vnxdb5TYXz+cGpkCQlM7rpCzdz5mNHgeRSdWBq8w/jRDMFnZZJk2d1rYseMK8tpXyo
 sjvXMFbDSK59Edgzpj1Pu3vnzOmhGHzC8i+hELNR9G1pwI8VHFpBKPvPwOybL91DU0xN
 9Pb1rN0lLPPvuyyy9WFwVx49upMwVOMK9O0WBXH1AknaG6u+AOawB4wMZG98Gw7J4DWU
 zA+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784205346; x=1784810146;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=IEmOH+y3eJI/+UHqBYKVlHFvW5x5P24mE84XXeY0tUk=;
 b=KrzN/jg1AMd/pbPmqT2VHl1UhxsaaZjmh9YMAKq2a77dWywgFUa45Vo8Ywnu5qyDzR
 dH8j4HRqtuvnMCev5Nn6HaSYdveNk96uApnIN7FNxpAccdF8quyvQvZr2EM3NnbF7Yy/
 zwbZ/IDWmeND8lVvJ1sOzIZlHBAVK6kJsGdHnuasRk/8ngBm3o5ux5x8C6rI2MJrGhDA
 OacU+rlX+7dhfAo5icDwVBWus+yOqOTdTR5K518AV64sJzqw/sAfFaomBXkLPWhvz3ax
 JDDa8Tq+VfzQeOYy0Tw9kS4wb7ZacMyGtEXA4wnLh8RnXIPLpIrWZXsW8k/6LDQGZya1
 X0Lw==
X-Gm-Message-State: AOJu0YxkLZoz6KCg0Bw6LXyyATDum/l9FuAbHNZNDMmgtdCNOUJWznFt
 s1TmZMZGuj6rVReRlJfi9Skin0/qB4PdMl2JfzLBapiQpgrKrq1X735gwuh/tPL4A2y1ySUf+pk
 AI+9bsN44psxYXPd1U9KOzqfqpOJzKM0e+2hGxyqSsyAWgrMZ2AZzZ+2EyA==
X-Gm-Gg: AfdE7cld4nPNDw9fjEssySxQhXZAXssXT+2aCpsTgyfacmPud+L6Rn6fnHm3HJ9KYps
 VfATiB6L9EB9Z23DkAHpm+qSvAGiVHZ43IRJ/gL4zYrgPGoJcb9gtZ6W//Zme7mphTb5ZMlLOnV
 dQhupumEusYRdvy01adAQu3p5/K60P0AJ7OIFor+t28sS1XS0p6faEeEUBiIGObmlHems5kEYf4
 aKkkr7mHuRp2cGKWLiHmv072sLZ0DUmj+kA0iTFqu8MmHU4pkL9NOe/iIfmZ8DT1xaWIXb3VTfq
 SAPTWRrMQI+SL8cdzmCPt4ggxv8LXzwdmX4zmBLPV1FfJxHt66Gk0iNlGTQTkuRMznRILAx09Bm
 OoAYH2E5ZPmno96yBi1NLAjWgIpUFf/TSM2s=
X-Received: by 2002:a05:6214:8110:b0:907:4850:d191 with SMTP id
 6a1803df08f44-9074850d6e8mr130114866d6.49.1784205345701; 
 Thu, 16 Jul 2026 05:35:45 -0700 (PDT)
X-Received: by 2002:a05:6214:8110:b0:907:4850:d191 with SMTP id
 6a1803df08f44-9074850d6e8mr130114476d6.49.1784205345092; 
 Thu, 16 Jul 2026 05:35:45 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([189.79.21.40])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-902de1fdb3bsm191609316d6.23.2026.07.16.05.35.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jul 2026 05:35:44 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com,
 npiggin@gmail.com, chao.liu@processmission.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH for-11.1 01/17] target/riscv/debug: Check only mcontrol
 triggers for break/watchpoint matching
Date: Thu, 16 Jul 2026 09:35:18 -0300
Message-ID: <20260716123535.3709148-2-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260716123535.3709148-1-daniel.barboza@oss.qualcomm.com>
References: <20260716123535.3709148-1-daniel.barboza@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=PsejqQM3 c=1 sm=1 tr=0 ts=6a58d022 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=sHJf4AwOIoU3qjeHFPlg6Q==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=uJK--5DT46cJm71gjCUA:9 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: kb3UiojMziPEss0bS_L_s3mMhbOHstbg
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDEyOSBTYWx0ZWRfX8msWC+sOVDHT
 GVVp4IHGVtEtJ5mJ5SmGMC5nsLFBl7rq3tqH+OYR3kgO21p1H0Zkbf59uClspMXNrkd72/Rqh9G
 UG0FMHAsGO4LBku6mqrE7B/507L09Xc=
X-Proofpoint-ORIG-GUID: kb3UiojMziPEss0bS_L_s3mMhbOHstbg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDEyOSBTYWx0ZWRfX0QYqCkzODypc
 DmyTdoAYQqbHmIOkown9ad9YiC3Zsh9fdPnnxAHz+bNHcJ/et7KRL5YOir6jlBeG5dd42Prr4RO
 ybDm4Y/D/STzdknsquNsoC1oYq1h9URGmg/ILqEBUq2FrXO8jTYRqXetoGqfn+tCqF4Or6h8qma
 Vi5BcgmiCTo6j57IQwqAMSwTzzzU0L/ylxw7ptw/gsV5UDPZQpaYtyJxjoRKsfcfPvcbbnWxK1g
 p4kwChrJhOdfD9kKv0kjK54vDrv0mP2k77IYS7VLtv9Zx5mw5SwT4YplGc1QqWKjnegTo/Ot3pw
 m0lPAFAsTx1avmB19l0UO0Mmj9CkQiXBbXI3vHoyvPz6p2NrlSeiKmJ40kEtfPN9gJ9Sv1j1wih
 eANOaHXIVHYmONn2CHw2M4bzGT2A2HJ1LO0MSJEwKYVIj7ou0+giBzLznJPVqc0cylXf7LqAYQz
 5Xngs3Ptoe47txrXbCg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_04,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 suspectscore=0 spamscore=0 phishscore=0
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

trigger_common_match() has some warning log messages in it for
unsupported triggers. Don't call it in BP/WP checking except for
mcontrol/mcontrol6 triggers applicable to BP/WPs.

Fixes: b5f6379d13 ("target/riscv: debug: Implement debug related TCGCPUOps")
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Reviewed-by: Chao Liu <chao.liu.zevorn@gmail.com>
---
 target/riscv/tcg/debug.c | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/target/riscv/tcg/debug.c b/target/riscv/tcg/debug.c
index 3c0fe70101..3ee598b86c 100644
--- a/target/riscv/tcg/debug.c
+++ b/target/riscv/tcg/debug.c
@@ -954,6 +954,14 @@ bool riscv_cpu_debug_check_breakpoint(CPUState *cs)
         for (i = 0; i < env->num_triggers; i++) {
             trigger_type = get_trigger_type(env, i);
 
+            switch (trigger_type) {
+            case TRIGGER_TYPE_AD_MATCH:
+            case TRIGGER_TYPE_AD_MATCH6:
+                break;
+            default:
+                continue; /* No other types match breakpoint */
+            }
+
             if (!trigger_common_match(env, trigger_type, i)) {
                 continue;
             }
@@ -978,8 +986,7 @@ bool riscv_cpu_debug_check_breakpoint(CPUState *cs)
                 }
                 break;
             default:
-                /* other trigger types are not supported or irrelevant */
-                break;
+                g_assert_not_reached();
             }
         }
     }
@@ -1000,6 +1007,14 @@ bool riscv_cpu_debug_check_watchpoint(CPUState *cs, CPUWatchpoint *wp)
     for (i = 0; i < env->num_triggers; i++) {
         trigger_type = get_trigger_type(env, i);
 
+        switch (trigger_type) {
+        case TRIGGER_TYPE_AD_MATCH:
+        case TRIGGER_TYPE_AD_MATCH6:
+            break;
+        default:
+            continue; /* No other types match watchpoint */
+        }
+
         if (!trigger_common_match(env, trigger_type, i)) {
             continue;
         }
@@ -1038,8 +1053,7 @@ bool riscv_cpu_debug_check_watchpoint(CPUState *cs, CPUWatchpoint *wp)
             }
             break;
         default:
-            /* other trigger types are not supported */
-            break;
+            g_assert_not_reached();
         }
     }
 
-- 
2.43.0


