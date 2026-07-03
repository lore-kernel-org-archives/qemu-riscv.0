Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90EACC43602
	for <qemu-riscv@archiver.kernel.org>; Fri,  3 Jul 2026 18:08:42 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wfiJ4-0003pN-Mf; Fri, 03 Jul 2026 14:08:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wfiI2-0001s8-L4
 for qemu-riscv@nongnu.org; Fri, 03 Jul 2026 14:07:04 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wfiI0-0002Ok-HE
 for qemu-riscv@nongnu.org; Fri, 03 Jul 2026 14:07:01 -0400
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 663HiUKC695777
 for <qemu-riscv@nongnu.org>; Fri, 3 Jul 2026 18:06:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 XVUwFoknsiYrMoar4G5eS0wpUatVac9inU7Zqu+Xy/8=; b=WUk7FwBi+usBquTX
 9NO2+yVVb28fvl+6tXG8I07FTPsTEOmOcOQrt97X7xNURlY+OUO63BsstwS36KGE
 ZJHVafQm2ZJB+4UzaSkpU2LYRURcT1Y1zqr56LVMEiU2rNFgr1uZNhMX9oh8apZ4
 XDid+/YhQ0RRm3AxTC6WMvj6Ce8jyRJafwXKxZuJzVlt1zlwYkzD1Z2NJ6fF0pdk
 B5TROgv2nGR96+83NvgUqs70G2mAHtM0hg5JJeATmLKP6hAYDuTePcdlHwcrkoQ0
 FBI2zL7WaBiMHrLa7SxxHAys5KCGnEAbNyMcZ5b7xfRCEn0FHc4wQ1h1JLkgd8Rk
 PqqoSg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6a849uy8-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Fri, 03 Jul 2026 18:06:49 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-8f000e221d7so7014446d6.0
 for <qemu-riscv@nongnu.org>; Fri, 03 Jul 2026 11:06:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1783102008; x=1783706808; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=XVUwFoknsiYrMoar4G5eS0wpUatVac9inU7Zqu+Xy/8=;
 b=FXABhHojE1dT2HR4UU7rOjtsDR5cu4BysiYuK8gD0snUKzm8BA1gjH+N7JpoRWuLWi
 Z49NoRSyF6Jx37S5ukD7WBIs+TeNrAqIrOujkrqLmeastuklZkXpwak3TZHCDrjysPOf
 1fUAlyLSFtZr/9lh2u4RV9NYO23017Ozbbaei4XyOYWyuK1lAaYqv0KX81GadY5hjY9C
 6Nd7R0Ig8h+JWbWA1r5k+EAfdjg/Kne5amCS69KtBcULM64tmbtq+HGK2E3H2mDoajYg
 51lVB3uL7/4kiEKtOqhusdEg3GOpfXKRgLw4XuOfD4eH2Dif1/FUcSPKgMejjjK+ZECz
 389w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783102008; x=1783706808;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=XVUwFoknsiYrMoar4G5eS0wpUatVac9inU7Zqu+Xy/8=;
 b=b6G2B+B2LR5dIjyDq0q4T7WCchuZi9Styg7oWJYtw0Kv8ZfbhS/IX4BCk0D6k4N7/7
 2k2M7AfLgJBjXDujwtce+wmNjYcoZI50IQJCe2AqPlKpdq0AtoZPoHcEPHmz14SPe6j4
 jHf8UoEq+qsfkzgkDK7k57lcYMGhDSwvT/SD4+PwT4O5XAFUsYY9mHpt/7sbNyodUXH2
 CUa23XBaY4ANRv4EepxbgqOI88fGLM2WIq7fpB6OYIn7emIwoFvrN2B1JfoXSAW6Mp+J
 iOV/TF1YeGkvMg/iywEfbaC/BJf4h9i+jCIIdAG7eHJfzQn3fhjq3XdieQWoiAu4Q+7z
 kj0w==
X-Gm-Message-State: AOJu0Yz36I4YaG0mlnDZRrJUsk+uWjTQIKLPPT1diVI0SJ30yKTYELWu
 D3arGbkSh1+MkCFcCZxJ8+3iIcbru4bTIZnq6llXvVpIJRb6UOesliw37/sxjRlrlhbBTp96Vb5
 BJVzzQLd1WmPa2PfMyinNB41jUuCx6zspiq7vsCsKKOsoGf2V9J3KdBd2yQ==
X-Gm-Gg: AfdE7ckDt1mr3nhn9Stp/PKpT6Uvd7SQsUIWPnunUhZUCx4ALXMEnlfnxLRAbYOsMXY
 o1OdkywXNN2sn8pc2zwfdresuy8OEG88k/1hj42x2JxHgbvQyM7Bt2lsc+zEWL8k+i0MoqoypT/
 UgJSGXYxIYFML7H7EzqpL+dQCJBqNy1tH4WMFykvWflisThQ8WUAYqD3/oRKzTAx/oh1/3kADhF
 5M9ZUJELBjz8Lppk4TMAF0jE8999KR0V1CRj6XsXDDuJKpQ4qyG/svLLoXOfQapL/MFKRUZ8gXU
 YEGfau0k/p3sgKXLDt7izL7kbxBZJd2AUS2eA0eNSs4xjSwPWiryjOuDplqXeZmL1PNMuRqwHQt
 0ZkFxBF8bUTDP3EeKuYiWhHnws74zwcAU7rfygBtLBfpfuw==
X-Received: by 2002:a05:622a:114f:b0:51b:fde5:1409 with SMTP id
 d75a77b69052e-51c4c24155dmr9179481cf.10.1783102007889; 
 Fri, 03 Jul 2026 11:06:47 -0700 (PDT)
X-Received: by 2002:a05:622a:114f:b0:51b:fde5:1409 with SMTP id
 d75a77b69052e-51c4c24155dmr9178971cf.10.1783102007468; 
 Fri, 03 Jul 2026 11:06:47 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([189.79.21.40])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-51c41d2d688sm22560081cf.17.2026.07.03.11.06.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jul 2026 11:06:46 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH v4 21/24] target/riscv/tcg: remove unused
 riscv_cpu_get_geilen()
Date: Fri,  3 Jul 2026 15:05:33 -0300
Message-ID: <20260703180538.3346781-22-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260703180538.3346781-1-daniel.barboza@oss.qualcomm.com>
References: <20260703180538.3346781-1-daniel.barboza@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: DH2Puum-qPGVx7XwBeuMoSRHbIK9ISJY
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDE4MSBTYWx0ZWRfXxv1BhgHEtFeE
 lKBrRb/K7auDVkqaBwZ5L1v7IUCKQyVsxwvp9YdxMSL14FRib5daSHkslDZlPKmmGGkA4ozU6KX
 KvcB7HYeiQDHfC1bjhKBhILQUPmgQeA=
X-Authority-Analysis: v=2.4 cv=a6QAM0SF c=1 sm=1 tr=0 ts=6a47fa39 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=sHJf4AwOIoU3qjeHFPlg6Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=JF9118EUAAAA:8 a=jGktlri6GTd5LI-DgqAA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22 a=xVlTc564ipvMDusKsbsT:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDE4MSBTYWx0ZWRfX0uqvytZw/cqU
 XtyyWCWIpCct9IOmhp21GF8Gux9dwRjg65BOsacu0rU60JkksMg2CiZ94Z3Cnk5SjUIL6z4RK8z
 NX/S8QA2eI0wqKqB9z7AioP+CteAAdeotvLGY5otFqZRQmljJjV3G48ahx+KvWUb4ADiiJNToTq
 x8AUGiwFAH+9DvFAxPjjoVB0MOYcmB3k6t3y2toe6zTQMMjxh556L9D9/jyLxa5HEJ8yTpabu0n
 0RAfO5lEG/5W9Q7gQLq1Xkfw6U7VUZBorBRucB/ZlCk44Sv/0YK1FJCrYbbpL/KCJxT3D31N2i8
 zYf9f+rDvyfWfOPyukr9NLN55Y/Gj63xNvP4xww0MAkOY/alzcMJLF/oZtnZx4AeqXGukOBgQz4
 IC8x6mcmZP7hXRpFrcpTAa1ayAo91dclMVyiy9dMz+s4HcjgGBWvhPtDrsJRtCJUjaeW0KWFjXo
 SNksEdE45veGkrV5oKQ==
X-Proofpoint-ORIG-GUID: DH2Puum-qPGVx7XwBeuMoSRHbIK9ISJY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_03,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030181
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

No one uses it.

Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 target/riscv/cpu.h            | 1 -
 target/riscv/tcg/cpu_helper.c | 9 ---------
 2 files changed, 10 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index d6c5d6c1db..7618110412 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -646,7 +646,6 @@ int riscv_cpu_pending_to_irq(CPURISCVState *env,
 
 
 bool riscv_cpu_fp_enabled(CPURISCVState *env);
-uint8_t riscv_cpu_get_geilen(CPURISCVState *env);
 void riscv_cpu_set_geilen(CPURISCVState *env, uint8_t geilen);
 bool riscv_cpu_vector_enabled(CPURISCVState *env);
 void riscv_cpu_set_virt_enabled(CPURISCVState *env, bool enable);
diff --git a/target/riscv/tcg/cpu_helper.c b/target/riscv/tcg/cpu_helper.c
index 7a1ea53ae7..6b39152ee2 100644
--- a/target/riscv/tcg/cpu_helper.c
+++ b/target/riscv/tcg/cpu_helper.c
@@ -526,15 +526,6 @@ void riscv_cpu_swap_hypervisor_regs(CPURISCVState *env)
     }
 }
 
-uint8_t riscv_cpu_get_geilen(CPURISCVState *env)
-{
-    if (!riscv_has_ext(env, RVH)) {
-        return 0;
-    }
-
-    return env->geilen;
-}
-
 void riscv_cpu_set_geilen(CPURISCVState *env, uint8_t geilen)
 {
     if (!riscv_has_ext(env, RVH)) {
-- 
2.43.0


