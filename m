Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79869C44515
	for <qemu-riscv@archiver.kernel.org>; Thu, 16 Jul 2026 18:07:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wkQUj-0000vW-Gk; Thu, 16 Jul 2026 14:07:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.bernardino@oss.qualcomm.com>)
 id 1wkQUh-0000v2-P4
 for qemu-riscv@nongnu.org; Thu, 16 Jul 2026 14:07:35 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.bernardino@oss.qualcomm.com>)
 id 1wkQUg-0001Vc-31
 for qemu-riscv@nongnu.org; Thu, 16 Jul 2026 14:07:35 -0400
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66GHZQqK385140
 for <qemu-riscv@nongnu.org>; Thu, 16 Jul 2026 18:07:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=2OJRRCmADXE
 01Dx5EKXd0WPcwnmtWnKChRhNUdIjxw0=; b=hxZt87zp4H4O5tQ5uRRDhIXT2A+
 yzj5TQuaSxky5nMeJBPqvxRdS2j1RSTk5O5gMW81HTX/IMZv0Czpyxvr+r7N4A6o
 tFpqrSO7Q5riVNTt3ap5QkEiJh2S4V1ATInYxqZ3Rv8CD0qmLDYFW7sY/IF2d1kx
 bwMpBu/K6OpBVKrO7s2s3qMR4n2ijDnHoepNrq3z7RI3heYm0hVE3pwD5erYFX4T
 BYZ3cy3VqWuIO0fgwKH6PjUln38E8T/MSSGQln9qKI1WY5k4TIbnC/QFCBC3Q01V
 Kp1iS2K2Sfeq4c9qyotA244b1ok0DM+X7DtYGOkIARaMQG3lTAaO1VZRlOA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ff3u6g3vf-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 16 Jul 2026 18:07:32 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id
 98e67ed59e1d1-384419c6c74so8826797a91.1
 for <qemu-riscv@nongnu.org>; Thu, 16 Jul 2026 11:07:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1784225252; x=1784830052; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=2OJRRCmADXE01Dx5EKXd0WPcwnmtWnKChRhNUdIjxw0=;
 b=G4Luz6kViRES3MlDa8rTTD+knFthPxyfLO39syt54rAVsZA6759A6jw+3EtCdZgjuy
 dTuqWVHCUv+lqlFjC1a2OWNWONlPVhP5ul0k5VWARCPqt9c/tqhGRAXwgVYCcJhZhbOq
 GZpQKwRja9QGId/w6zbWzPgR6HQfq6lQySHLOx9SSDSrgf9T92zFaW90efkZUmWWmRxy
 avqX0JlNaZJDbEgntXwIPIYm5/soyR9/EcG5/+A4enETDRm/M8/bl140wdyvKr+XLr2j
 VHyAvcxKUkbAETcMOnkvj2vvHvF2J/VvBQZVsDFXAOAYv6EtJIJzwI4UsB/8qF0c/trB
 JWsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784225252; x=1784830052;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=2OJRRCmADXE01Dx5EKXd0WPcwnmtWnKChRhNUdIjxw0=;
 b=lOrO5YcXr0GfbDZRFVna7Q3oerz8cHKFv9SUe/kzZajbCZ0yYB6wBJOgoi6GuSKqKC
 o4TjWqCwbY45Ysj4lEQgBAqTLuX3NGWfXsF8oEOLWO3NUMCmN6WL8P77Bs/GejLoMC8N
 QsCC13SSSn1cyUzawRCLmTk/kPg6aoVdRTUHaB1mr4/Bv50dZ8dclbDQyjWYSqUtqh4/
 105o7+5Qk/rcHI+u6wTSIcBs8UxvsZsVpqvDeWfTjrURaCf3nN732KJcijkeIDgL6Dh8
 Bapi6iAI2ThXvZ5DIi1tKQZ+7s23qgz6pH0kAnmQflubrc9n9aaTssIQtj4dNIs02lJN
 jwGQ==
X-Forwarded-Encrypted: i=1;
 AHgh+Rra9Ji7G41VqDIXcBVK/fzxPGeDPD5baa5ZMcEv0+RYzq1mr/4VThrTD9c+WEZFB3nMSsc7frkq8XRP@nongnu.org
X-Gm-Message-State: AOJu0YxasIWTLlC77y2QtG28zJxA2H1M3tO0cY0lw1aGEh3/qTZdhgxn
 GG3fYbqgfZQCRxRQaaV11obHVSmwR8i0/tXvg6rZVBam1UorwSv6zlkxu41YlRgbzhh1Rc+JkE5
 n23j6Bgrqg6Z0eIb7rBWfe/Pvdhh5Nqys/n/TdTUAK7g8G43CO5Ee1oWnpYi3inhMFQ==
X-Gm-Gg: AfdE7cnH8mlI3TfQgj13dbRBpOMH4IORZtm/Kp+29nqbcT25fNpstpVH7OgSm/H8dp4
 YxBDktLRFZW0d20NfVwIr9ka9LFa6oa/wzH50gAl/rkARID8YVKWhPF28AmieqY+g9EWM3kp8nW
 3vnZSkcboy95rjwzp7yif+Bv2GrvzIqUTMaMJv80PNYeRG0jaHYL0JRyqLkIVcbPpHhekXRVf18
 ERgy/EZvofFBDZe0hdiKpmytxuTpsA5AHeMZPoMXeoVixxtlPqcQ6PUQAId9rWldrludBEZcLAz
 qmiwAK2pd3xvkYPryHfuCcnpZvPt2rKCzuPf6kpLn5k2BrrPfDPVeNSZmT3aeU8U+Jo4bR73Bv/
 SfufGsik7/D9yv7GZHR7Df+ZM9Am+AqWMJIGjLWzogNctSPlSBrFUYE35F8mY+Rg=
X-Received: by 2002:a17:90b:2808:b0:38d:e5d0:9bd with SMTP id
 98e67ed59e1d1-38e2a0780c5mr8148928a91.26.1784225251796; 
 Thu, 16 Jul 2026 11:07:31 -0700 (PDT)
X-Received: by 2002:a17:90b:2808:b0:38d:e5d0:9bd with SMTP id
 98e67ed59e1d1-38e2a0780c5mr8148883a91.26.1784225251323; 
 Thu, 16 Jul 2026 11:07:31 -0700 (PDT)
Received: from hu-mathbern-lv.qualcomm.com (Global_NAT1.qualcomm.com.
 [129.46.96.20]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-3140e5326c0sm17131184eec.11.2026.07.16.11.07.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jul 2026 11:07:30 -0700 (PDT)
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
Subject: [PATCH v2 07/14] semihosting: add callback to set error
Date: Thu, 16 Jul 2026 11:06:51 -0700
Message-Id: <a08d1e274e722c7072740838fbb596c8dfb67b10.1784225209.git.matheus.bernardino@oss.qualcomm.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <cover.1784225209.git.matheus.bernardino@oss.qualcomm.com>
References: <cover.1784225209.git.matheus.bernardino@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDE4NSBTYWx0ZWRfX1AXmSGpprqph
 TvnfwlTV43MXCAcn3lx6rS9XVkhJ0SBJBmyqni7+oS50TmwhKshmNNASbWn4tk702qx+vtjKfWv
 m9ms7ybw+Ia1dmgaJqAZf+xSG91X9d45faFLDuOBuGJzIsl/mzQmgnlCnOfoEKoAiKU1ihAd8tH
 kufAX07obRdcYJk9Hfl6VrTHdhi/8UqYnNIirNL0tozP6QXQB/1nf6qWuKhX6PiK40Oa3R2ZhHZ
 UCw/eZ7ZmgowkHtnLyQoK9LoekQHVmyvgwGEUXoSqpp5ZCvW2wZdAozhkliWarq+g/R/jUqSQzd
 2j0IIEVfySSZQJxawOXGkvmQkvW1xsxw1lYEe3EwBm6sCluAARNw0YwNbCHR68/KblXmcqo6cHp
 w9xM2ohsfmMBmZxaYGSwBWQRy8QjO6ti/fcVZg/D0frZaBAqE7RZ8OOGRcW7C5ynAEEF2GrPls3
 qWEv8NOLTkG93bGtXjw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDE4NSBTYWx0ZWRfXwprG/9Q+IFZx
 oKWzOehHhOcmYtWyOor3sNiyq/XG65pcOgUIuaBfbtb7IQIUxRLcGCN/iR0CoAksOipKGhVBe00
 TsZhkjXEb4qrzUiop12Qh+I92xCiaJ4=
X-Authority-Analysis: v=2.4 cv=DYMnbPtW c=1 sm=1 tr=0 ts=6a591de4 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=8ndNYmkutmpv_8xOvXsA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: 3C8oMQO4QExtReNURigzBrpH7iUH6ddX
X-Proofpoint-ORIG-GUID: 3C8oMQO4QExtReNURigzBrpH7iUH6ddX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_06,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 adultscore=0 priorityscore=1501 spamscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160185
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=matheus.bernardino@oss.qualcomm.com;
 helo=mx0a-0031df01.pphosted.com
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


