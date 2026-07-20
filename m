Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F989C44520
	for <qemu-riscv@archiver.kernel.org>; Mon, 20 Jul 2026 17:42:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wls0M-0008Ji-Kl; Mon, 20 Jul 2026 13:42:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.bernardino@oss.qualcomm.com>)
 id 1wlrzW-00081M-OC
 for qemu-riscv@nongnu.org; Mon, 20 Jul 2026 13:41:25 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.bernardino@oss.qualcomm.com>)
 id 1wlrzU-0002yU-3P
 for qemu-riscv@nongnu.org; Mon, 20 Jul 2026 13:41:21 -0400
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66KH6as62962612
 for <qemu-riscv@nongnu.org>; Mon, 20 Jul 2026 17:41:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=2OJRRCmADXE
 01Dx5EKXd0WPcwnmtWnKChRhNUdIjxw0=; b=Wgzw3CPu8hPr1tu2ByO1o3S61lk
 xcTKCnraVPG6U+733od8Kwm55fkTzwRJaulcv+RXEJ54iBkilV/e1GIilFtRMTNg
 eqYJQJGf8LcUY+rWcrRWxpCX1eJ8JIsiqK9QMSLDeMUF71wMWi3RrgEzyVAnn4ke
 2kfwQ3DfEuZRDx4yKjaepnfFGzozX6eZmuKH+M/DFpivEb77o953SU/w0QKzgvMJ
 itR1MHSvhFdi13Q6/JJUckY4CDKHrWLYPM5swouHiufj81hGVVs2avdDOGsM5Mvw
 R0TeFJZS4na1hfIj8K+FMAOPLwbUtMj7UennqaQeLV8KCcNQSoHQJXXPf6w==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhh5y277u-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 20 Jul 2026 17:41:18 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id
 41be03b00d2f7-cab048cdb3eso11601001a12.0
 for <qemu-riscv@nongnu.org>; Mon, 20 Jul 2026 10:41:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1784569278; x=1785174078; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=2OJRRCmADXE01Dx5EKXd0WPcwnmtWnKChRhNUdIjxw0=;
 b=bubsj8GdDX6dGM//TTcBSzHrUVZTcSDikqzA7MPv92790t33cdxNarhYMvsGySrRX1
 y893T/SUOamE1TRD+9/HIeNFN3TwvFZ2+Xu9HOHcbGHBJ/dyu89umcqqB5QtGw335k5v
 bKXTV59ZgCULnMbkb4JxiiEEAjqdSoIrQjePFoViAIpUt0GCVcQyHX1BHYt3g4GOqFNO
 zhbD10CWQ8+iraNuLlYqy5G9XuyvoGBw++qjVnlSaeS0/AMTf6X49mMt273rBBtnG5Kt
 YJGDr6HAt4V1277PMnwQVLTtjJu3LkCYkIlj20Y4vCFPUfIfhQXsH4EOd4ECtNEUSflz
 MA5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784569278; x=1785174078;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=2OJRRCmADXE01Dx5EKXd0WPcwnmtWnKChRhNUdIjxw0=;
 b=MBcyz/rbhYxgSI8h0KEXTQgTtWu6EqjeQNVPQbshqimiGUItOf5lpxyiIsbIy8C0Ea
 60S/B0QFuF1/GzpQLQItFUuK9gnx2P7vKWC8Y6xEB6bz/bm5IBsfNbZu18emd5jZd8Mv
 GPZgJZcb41Pzdw7BagV4Uo84NoQXJz/M8dbMDBzoItcoxj0Gn1/3uaJiBuzGwCxIpNB6
 vI8Faq5XFLu2fc70p2RB1O4geclDb38/SzIdo59OtlG5EnEtA9hAAeMDpHS8SRElSGcN
 OK01nUEBG409L7TBKHxo2Q4kL+uXDu36YLSDiabdDsAHSuKppGK1CVLoLXzivqnaBzAh
 n0zw==
X-Forwarded-Encrypted: i=1;
 AHgh+RoPS1pBpI5NG/2Bclx6mTuFvbqPBn61IVKVnYXxwvQd6aFoAkwV6oc7f9bpqMttjBrXMQqdMq15qYFI@nongnu.org
X-Gm-Message-State: AOJu0YwzgO+rR+Rgk/7peIZPDIvEVRwmruPGxQeXcoDA/IOMUyhmGHyI
 j9bgAfKAEnxrZzB7Mu/UZP5Y8aJMN6hOXgGy0NvjiEKiqLa2Hv1VCMD+3MxjXx75v6ykRz4he/v
 x0dptf1y3rGQWVYxEGtDEH71YDLvdoSU12l+WilJNnBQXkYbSudDeae8ktQ==
X-Gm-Gg: AfdE7cmezr+D6ayW1tqZ+78xAXpCXbM72YrxzG6f04OHtG94YXTpiDFV6foZq/MI7HF
 ulH47/yPQKEkLP2ENll8IAeKfaUJLWjTptWc2wEY4ebQQKaKrcuMowb2ObgfY9cmtbN2OO0Vxxb
 JbcRaQ3Wesmip5F1vmR5yvkJlXCjCe/0JJmGxL87wVKTMXSX3rejjOtUt4oTuZOmAI2DnW0ZqkT
 gfTCs1fWqc+RQFG4IXHcoYS6M/8bBZnSi0jx0N4Ywu/d1Dlr5aqbPtvwTLwOoXWHMQ2njM1S2/H
 n+RJTbLqiZrD1mQouMLDp9vygMHBfNwT3AgtXPHsQi62f50MxS/RalriUG8wmuvNmUdrecDJQVE
 I8W5TBA6jKBSjnriTSQFEvjVF4xohPzvhOznoZDt5QOWf5ePON29nzQ6qKiNNH/U=
X-Received: by 2002:a05:6a20:7487:b0:3bf:6c05:ab with SMTP id
 adf61e73a8af0-3c3ad9d632bmr16175216637.58.1784569277884; 
 Mon, 20 Jul 2026 10:41:17 -0700 (PDT)
X-Received: by 2002:a05:6a20:7487:b0:3bf:6c05:ab with SMTP id
 adf61e73a8af0-3c3ad9d632bmr16175174637.58.1784569277414; 
 Mon, 20 Jul 2026 10:41:17 -0700 (PDT)
Received: from hu-mathbern-lv.qualcomm.com (Global_NAT1.qualcomm.com.
 [129.46.96.20]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-3142a1dde81sm66281257eec.21.2026.07.20.10.41.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jul 2026 10:41:17 -0700 (PDT)
From: Matheus Tavares Bernardino <matheus.bernardino@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: brian.cain@oss.qualcomm.com, pierrick.bouvier@oss.qualcomm.com,
 marco.liebel@oss.qualcomm.com, philmd@oss.qualcomm.com, ale@rev.ng,
 anjo@rev.ng, Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org
Subject: [PATCH v3 06/13] semihosting: add callback to set error
Date: Mon, 20 Jul 2026 10:41:02 -0700
Message-Id: <a130a83d7a1cf8dc4c3ee11dbdaddf8e8ec0c6c2.1784568922.git.matheus.bernardino@oss.qualcomm.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <cover.1784568922.git.matheus.bernardino@oss.qualcomm.com>
References: <cover.1784568922.git.matheus.bernardino@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDE5MyBTYWx0ZWRfX29q0cqZLOHtj
 RZew7Y9OnlTJ+ORgxBye790vW3cJYsu4Q8PYTSmUj1lYClg1PBb7VHXPUcbshj1xN/nfSdI+/FT
 SbB+pbGBwN/NXTnifMkCBG65T2ZAJ8o=
X-Proofpoint-GUID: oOPjCjLQo-m6kPnyy5T8BmEJTWrkFAMj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDE5MyBTYWx0ZWRfX7vkt8Tqr7qhL
 woSO4oRsuvIGzSeTheK0F8r6cjP7q/YWPnQBZl5pbOUkSECVIj6OHJbrKo4MZxZiydLRieFT/G1
 tphG13RF0I5rbYxV1uje8loLNKXIqGG4f34A6O6cdHsF6rhdV7pi/Xw9dEIK0uWNRzh3x17Fgjx
 lQQ8pakeqQijpHh4RPajqXm1x1UKfJXrlkAdcOEADEsje1GnAfEaNjToraBhCMQTkHXGkU+8vel
 n5bkNUGGoAvYVPfh7iRjV0jYb/8NcsSuIky7y1iNQ1s72BbkzXTkr5DHFSw/my1ci5dlPdOzZyP
 2P4CCkwmSRff6IF52F7Fhjhc3hEl8FzcqryGZJSVVKvNFEBzK0f511Jz9xFzmHMSjQB4lyfa6oR
 VsXZ/C0+rfMHIgm747OQ5gGVD6zdhy96hAn9g/cHnUQHh5EGmndvPI/S7CJUPRYagP2HkyNL+nf
 otWTyfEoB2AqMlVOS4g==
X-Proofpoint-ORIG-GUID: oOPjCjLQo-m6kPnyy5T8BmEJTWrkFAMj
X-Authority-Analysis: v=2.4 cv=f/x4wuyM c=1 sm=1 tr=0 ts=6a5e5dbe cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=8ndNYmkutmpv_8xOvXsA:9 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_04,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 malwarescore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200193
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=matheus.bernardino@oss.qualcomm.com;
 helo=mx0a-0031df01.pphosted.com
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

This is currently unused by existing semihosting targets, but it will be
used by hexagon in the following commit.

Signed-off-by: Brian Cain <brian.cain@oss.qualcomm.com>
Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Signed-off-by: Matheus Tavares Bernardino <matheus.bernardino@oss.qualcomm.com>
---
 include/semihosting/common-semi.h | 1 +
 semihosting/arm-compat-semi.c     | 1 +
 target/arm/common-semi-target.c   | 4 ++++
 target/riscv/common-semi-target.c | 4 ++++
 4 files changed, 10 insertions(+)

diff --git a/include/semihosting/common-semi.h b/include/semihosting/common-semi.h
index aa511a46f42..a11905ef4ef 100644
--- a/include/semihosting/common-semi.h
+++ b/include/semihosting/common-semi.h
@@ -37,6 +37,7 @@
 void do_common_semihosting(CPUState *cs);
 uint64_t common_semi_arg(CPUState *cs, int argno);
 void common_semi_set_ret(CPUState *cs, uint64_t ret);
+void common_semi_set_err(CPUState *cs, int err);
 bool is_64bit_semihosting(CPUArchState *env);
 bool common_semi_sys_exit_is_extended(CPUState *cs);
 uint64_t common_semi_stack_bottom(CPUState *cs);
diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
index 5e5f181b908..c54753f696f 100644
--- a/semihosting/arm-compat-semi.c
+++ b/semihosting/arm-compat-semi.c
@@ -237,6 +237,7 @@ static void common_semi_cb(CPUState *cs, uint64_t ret, int err)
         ts->swi_errno = err;
 #else
         syscall_err = err;
+        common_semi_set_err(cs, err);
 #endif
     }
     common_semi_set_ret(cs, ret);
diff --git a/target/arm/common-semi-target.c b/target/arm/common-semi-target.c
index 2b77ce9c17b..38d52deb3d6 100644
--- a/target/arm/common-semi-target.c
+++ b/target/arm/common-semi-target.c
@@ -34,6 +34,10 @@ void common_semi_set_ret(CPUState *cs, uint64_t ret)
     }
 }
 
+void common_semi_set_err(CPUState *cs, int err)
+{
+}
+
 bool common_semi_sys_exit_is_extended(CPUState *cs)
 {
     return is_a64(cpu_env(cs));
diff --git a/target/riscv/common-semi-target.c b/target/riscv/common-semi-target.c
index aeaeb88d536..38a00e160c3 100644
--- a/target/riscv/common-semi-target.c
+++ b/target/riscv/common-semi-target.c
@@ -26,6 +26,10 @@ void common_semi_set_ret(CPUState *cs, uint64_t ret)
     env->gpr[xA0] = ret;
 }
 
+void common_semi_set_err(CPUState *cs, int err)
+{
+}
+
 bool is_64bit_semihosting(CPUArchState *env)
 {
     return riscv_cpu_mxl(env) != MXL_RV32;
-- 
2.37.2


