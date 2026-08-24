Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEDFFC5DF94
	for <qemu-riscv@archiver.kernel.org>; Mon, 24 Aug 2026 11:19:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wyShj-0003NO-K8; Mon, 24 Aug 2026 07:19:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wyShY-0002yN-5H
 for qemu-riscv@nongnu.org; Mon, 24 Aug 2026 07:18:52 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wyShV-0005O6-FE
 for qemu-riscv@nongnu.org; Mon, 24 Aug 2026 07:18:51 -0400
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67O99KU12548509
 for <qemu-riscv@nongnu.org>; Mon, 24 Aug 2026 11:18:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 FYs3uPH5Pb8hS6ZkgeHaIaSrfIoM0pZKlpLy0wB+Gps=; b=govYam+VTdPd9xnV
 MEA9jzo2DoLyRJd6GUqtX+JC99dfTX+ZFT1nWtonpzFlhYpSzs7Vj8KAD0z9f/lM
 FYF/43u2RFCEGFSxpGtNM8yxOZAVPHYDW3mIFzGXs8IoCJkxcWVUjXAzO3a8es7M
 ctwyb34YTQPndId/P21udf5YhTzjlrJ9k2zH9l91I/3vOBqGBuWukcHjWuSLy6QK
 HXUiSxfdS+fMGRaInVFe+0RD9Sc0ocuZ6rfpV3sRThUzc5u6GO8ZEUYxLaoMhzlp
 fMsn1jtxUI6FjNR/KV9SmsEC0dqqJwEm4mqJgoRUbxp3P5Ep1le4MQEFMYOla89K
 OnIKVw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g88k7jcwj-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 24 Aug 2026 11:18:37 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-51bf321d786so27628001cf.1
 for <qemu-riscv@nongnu.org>; Mon, 24 Aug 2026 04:18:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787570316; x=1788175116; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=FYs3uPH5Pb8hS6ZkgeHaIaSrfIoM0pZKlpLy0wB+Gps=;
 b=fnbTpTGnBRtgdjnRDwOlS9UeZbddYcwehXV4xofts23s7mK6BHnhl5Npe9eXNfeX6v
 Q5NNCFRoSFdOgsedymXPQ3dtZWztjKk/qroSRUOrM30EPzShXior9q4w+eAAl/EaltNJ
 c0MmzsRJvXiCsP9j9WEX26mMRiNg1yyVs5EEhIUXNI3pbsAGoCfTKWoND/N3hV94Z0IF
 xh7X8MpdOmCdh+kXl5MoHtkBBf5HytUmHdBcgjtyKY9SywVOi11/Z5zmOomcHtBNXPDt
 EXoDmT4UpvbPvrHx7kSgFreBXohrku8qgxh8YHupuU13WVx111Te+j8SqW1hKHbhLp2E
 WJKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787570316; x=1788175116;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=FYs3uPH5Pb8hS6ZkgeHaIaSrfIoM0pZKlpLy0wB+Gps=;
 b=CniR0rdXP0NCurwEDj7E7dhugFZu+iVFYapvRcW4aSxd1KyhuJOc4WPMxI6KP+DObh
 pl+j+QsUSaog0jmhRD4c7qFvo4KtGJM+iI2yPrsTzarvxzQNrRYL54MzDHmzdIaqKo7o
 LhS91yK6vtVmzgoTZQag6kZnxmvRyntmeQ2ilVPR7+HGK/kirQnTVeC68UDPdFdVe5eA
 ObnLIWdvu9CULaL6EK9sDYCX45Ucxip0NG52DtZIIkk0oAPbyfVgwWtMhZ9FSpqekbRm
 yfVBXWJStWhyLC7G5piT2Bi5MgjHrd7+HXYbG+bq4jqqndi3hQa30sVQaR4vrW1ZScwQ
 t5dg==
X-Gm-Message-State: AFuF++mvl9GE5n0LGvhubL6YXEoRU4hIwD0R56woXRxANxu5y9SEuA1f
 8Qywy9GvdZvZ2VwQjehnjEbfkMfpp7U4RPo+KMNCy98qm18d9K9M90G6d4F3Gg4W57g7jkSieRf
 8Q2mdz62Ygq9YyePD1md0Za9HsBgwoJP1E04ACjai/NNc8DxSgckBXmEAfw==
X-Gm-Gg: AR+sD10Ho/MubGob9iFQDWJYksKLEWxZ3s/2iXHtndfssfJO+9NnTd9TyWnY7THKYDz
 4wWy24Q1+uzM16ecYdd0zQ3n2zMvntgTDH7Tw9yFnBBIfdd8BvuIM6FfisbX2BeqUBwUIirrM2q
 /OUkJFQXiDcqPRPgQc+RzGS1Qa149ubTU4eth7T48wDByZfGbe29GjpUETHkfTirs1gn7ajZ6Oc
 F4ppqBI7ibecDDJ9/2P6bn9kWbkHye2nBw5CNL4vxVCMMqBbtz8Ur/xFqwcZdjhC4VZeOvZ3BQa
 wVkmxJzRw/hRtFfiOxSj6+WJeWUlKpLGYbFVHBvaSdm48uTI2B4gHR3QOI1UrwWLOYYYJHNiSSs
 HGeWkgz6sSbHfIcAJhtakD/VvO2J2O9cw6IQUn8RMFxvydtal3g==
X-Received: by 2002:a05:622a:244e:b0:528:3216:b802 with SMTP id
 d75a77b69052e-52df5740d84mr248409671cf.15.1787570316052; 
 Mon, 24 Aug 2026 04:18:36 -0700 (PDT)
X-Received: by 2002:a05:622a:244e:b0:528:3216:b802 with SMTP id
 d75a77b69052e-52df5740d84mr248409211cf.15.1787570315621; 
 Mon, 24 Aug 2026 04:18:35 -0700 (PDT)
Received: from localhost.localdomain (44.170.88.92.rev.sfr.net. [92.88.170.44])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c2496296a46sm1339004066b.21.2026.08.24.04.18.32
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 24 Aug 2026 04:18:34 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Brian Cain <brian.cain@oss.qualcomm.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Subject: [PATCH v4 08/20] target/hexagon: Constify CPUHexagonState in
 hexagon_thread_is_enabled()
Date: Mon, 24 Aug 2026 13:16:57 +0200
Message-ID: <20260824111711.26297-9-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260824111711.26297-1-philmd@oss.qualcomm.com>
References: <20260824111711.26297-1-philmd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=b4iCJNGx c=1 sm=1 tr=0 ts=6a8c288d cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=s1NLoHz9uzatdv2VNqxUSg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=20KFwNOVAAAA:8 a=XxrlQHdRtCO5bKJNttYA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA5NCBTYWx0ZWRfX2oYDgbgeT773
 ZSsKw3rf1WCLTReZqAilPYklX4l08V1wSUX0gu4R1KbQQ3QaOPY9oFRRm/64FIJD9aeeKB4H2BQ
 qWjp9ZNhsWWfPTD/4P9MKIi4D67IS3M=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA5NCBTYWx0ZWRfX69luG9KTiCJk
 WC/JkC+aiIrUSxejI8Y3uwDuG7LLGqiRkG7ObuRQpuG2SIkdTwQs4s5YJnDUCi6OBTX5xUu6LlD
 mHmQMvQzmrTetHpq7PktENgojbiflZH8HCgzs08thsGbztfZt9oSAWL2aeUydGBWySOYR2rUrNm
 g573XJAS9ekkpSizpAANxMNFNfBnrrmqwCFSbAhVkghk4oFiPLpPMT93qM3hdYoPS47TPBQQ62S
 WzJOiKwc6PM8Ka9fsGRz8ktGyvCCj7ldFGHJXAmFccHSZrO5RbHq1Ml0lNn8jfaPaj8DTHfxNu3
 DZnd9GX2uQK8itV+RKffH9JUKp5rHC3uKQxX1WaK+AoPvLJIMlIDhalKy0TFbKQ1pZiCiukd95r
 PWwy6Y+vBpeHutBqGHNU0LR42IrBHY/9pvyQGcahGFKkEgw3woBb2nh63Nrrargz5tLwwP0lsN3
 RPTT2G9FwLDJAcXVNqw==
X-Proofpoint-ORIG-GUID: O_qrH18wBfrbgzuf-EZt62G8yHru82Qd
X-Proofpoint-GUID: O_qrH18wBfrbgzuf-EZt62G8yHru82Qd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_03,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608240094
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
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

@env argument is accessed without modification in
hexagon_thread_is_enabled(), qualify it as const.

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Brian Cain <brian.cain@oss.qualcomm.com>
---
 target/hexagon/cpu.h        | 2 +-
 target/hexagon/cpu_helper.h | 4 ++--
 target/hexagon/cpu.c        | 4 ++--
 target/hexagon/cpu_helper.c | 6 +++---
 4 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/target/hexagon/cpu.h b/target/hexagon/cpu.h
index c50fbb3f72a..e4f120eda17 100644
--- a/target/hexagon/cpu.h
+++ b/target/hexagon/cpu.h
@@ -216,7 +216,7 @@ G_NORETURN void hexagon_raise_exception_err(CPUHexagonState *env,
  * @return true if the @a thread_env hardware thread is
  * not stopped.
  */
-bool hexagon_thread_is_enabled(CPUHexagonState *thread_env);
+bool hexagon_thread_is_enabled(const CPUHexagonState *thread_env);
 uint32_t hexagon_greg_read(CPUHexagonState *env, uint32_t reg);
 void hexagon_cpu_soft_reset(CPUHexagonState *env);
 #endif
diff --git a/target/hexagon/cpu_helper.h b/target/hexagon/cpu_helper.h
index d1767503156..a669091a89d 100644
--- a/target/hexagon/cpu_helper.h
+++ b/target/hexagon/cpu_helper.h
@@ -9,8 +9,8 @@
 
 uint32_t hexagon_get_pmu_counter(CPUHexagonState *cur_env, int index);
 void hexagon_modify_ssr(CPUHexagonState *env, uint32_t new, uint32_t old);
-int get_cpu_mode(CPUHexagonState *env);
-int get_exe_mode(CPUHexagonState *env);
+int get_cpu_mode(const CPUHexagonState *env);
+int get_exe_mode(const CPUHexagonState *env);
 void clear_wait_mode(CPUHexagonState *env);
 void hexagon_ssr_set_cause(CPUHexagonState *env, uint32_t cause);
 void hexagon_start_threads(CPUHexagonState *env, uint32_t mask);
diff --git a/target/hexagon/cpu.c b/target/hexagon/cpu.c
index 9765716b516..4cc6bd67c28 100644
--- a/target/hexagon/cpu.c
+++ b/target/hexagon/cpu.c
@@ -345,9 +345,9 @@ static void hexagon_cpu_synchronize_from_tb(CPUState *cs,
 }
 
 #ifndef CONFIG_USER_ONLY
-bool hexagon_thread_is_enabled(CPUHexagonState *env)
+bool hexagon_thread_is_enabled(const CPUHexagonState *env)
 {
-    HexagonCPU *cpu = env_archcpu(env);
+    const HexagonCPU *cpu = env_archcpu(env);
     uint32_t modectl;
     uint32_t thread_enabled_mask;
     bool E_bit;
diff --git a/target/hexagon/cpu_helper.c b/target/hexagon/cpu_helper.c
index 64c5746c6d9..610e29a0503 100644
--- a/target/hexagon/cpu_helper.c
+++ b/target/hexagon/cpu_helper.c
@@ -212,9 +212,9 @@ void hexagon_ssr_set_cause(CPUHexagonState *env, uint32_t cause)
 }
 
 
-int get_exe_mode(CPUHexagonState *env)
+int get_exe_mode(const CPUHexagonState *env)
 {
-    HexagonCPU *cpu;
+    const HexagonCPU *cpu;
     uint32_t modectl, thread_enabled_mask, thread_wait_mask;
     uint32_t isdbst, debugmode;
     bool E_bit, W_bit, D_bit;
@@ -384,7 +384,7 @@ static int sys_in_user_mode_ssr(uint32_t ssr)
     return 0;
 }
 
-int get_cpu_mode(CPUHexagonState *env)
+int get_cpu_mode(const CPUHexagonState *env)
 {
     uint32_t ssr = env->t_sreg[HEX_SREG_SSR];
 
-- 
2.53.0


