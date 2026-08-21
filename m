Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4797C5DF87
	for <qemu-riscv@archiver.kernel.org>; Fri, 21 Aug 2026 10:51:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wxMpA-00041G-VO; Fri, 21 Aug 2026 06:50:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wxMp9-0003yQ-0Q
 for qemu-riscv@nongnu.org; Fri, 21 Aug 2026 06:50:11 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wxMp7-00038I-7q
 for qemu-riscv@nongnu.org; Fri, 21 Aug 2026 06:50:10 -0400
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67L9LtXU1895335
 for <qemu-riscv@nongnu.org>; Fri, 21 Aug 2026 10:50:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Q+KDuQ2I/KnfM9bv8Lb05wGUziB13ZFXznw0mkhbS0g=; b=Nm6Nm6xlLxfo8vOz
 D3xeYJmR2voi7+et8ETXxApW6EsJ+OlznFZ7Us4xAsuveC2xDW3yKmH9eDAuSnjj
 ft1N1cp5s7epZckKpKUcuji52ZYat0ipS0jp+hBWhnHzKb+3koMJtuUSLUVZgsDj
 BNK7UX9AW0hCqmYbr+ZWtBBoX1SAZibzvPrBGAWNGSV9FAqU1FlMklkxTuDdnMgm
 0OGfAOyRVnJ/Rc4ECCP2mMN/0XGMNlBXbUfjVGCjOO6Ssv8MQpJH9zESCZjBWcpq
 y05u6FAWBDKZSXKThSk5QSyufs1FI40i1zYL177FfZ+cTY4UvXRc3m+Diipw2mUr
 BA/r9g==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g6gdn972j-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Fri, 21 Aug 2026 10:50:08 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-51c26012cd0so8621121cf.0
 for <qemu-riscv@nongnu.org>; Fri, 21 Aug 2026 03:50:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787309408; x=1787914208; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=Q+KDuQ2I/KnfM9bv8Lb05wGUziB13ZFXznw0mkhbS0g=;
 b=O9Z5EH2pmzB7YmYCaJTI97eIMEECqWl11Qbnuw1G0wCt0J38XLGOn7BNQg/5vI+138
 NwisdS4flSpCbIGZ9UevaeDMtvbkb6rI/Rrx2Ogf6hpUIOfT3J45UlKmOD/0iz8CvytY
 iH0Yzrqa0VWolwyWdmVv2R2j+N4Oao+9z5a+asAaRyg58s/K69HGU1hWxW+qzxhtGiFY
 velmukswV6obaca8HKtuz1a6PXuk/ztCI7hc2Me/tFUrswBO6DwxnJFz7aQEvqAcROPr
 e8oA1FyWqu61FU5zkQvNR+B9ImjpWXA7NsMSgAtg5TNwCuAOTfEreQM+8JHvKafn+vVV
 jrpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787309408; x=1787914208;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=Q+KDuQ2I/KnfM9bv8Lb05wGUziB13ZFXznw0mkhbS0g=;
 b=AEwW8vF0TsPB1/dlhetAQ8CoqxUZL6YKyiBr0OmD+J2+YwLLph2jp09lc62cljlwqi
 gBGSuMzqP15/kB2CzRPS8aw6uWYRq66PMdbuzoeuAgWs2SdLELWWG8C3UpUB81SJ70Ri
 tbElepMZm2Fr5cmYJxHfPa0UqMc7yqzt6XLhQe3D/m9S1MbY7qM2G6bd94/bAZ+YFoMJ
 Dl6rsGfqF8JS8dRrVUf4C/cXW5485f/OPyGwCOoLdpoePeO+1zAOvuewAnpuAhNPsMmX
 enZMzZwSoVGA90elK5uJtZaDj4lLzotLwx0kLf7I49QUd606/8MviqqjpABWewH13N9f
 nAVA==
X-Forwarded-Encrypted: i=1;
 AHgh+RrZJV3QqbQjrYZEheVffFktMMJa1HEVnrU5WmQT+7aGi1L3EpFv3u/5FhmGl1+RjzgeKh7U4jg2G+BJ@nongnu.org
X-Gm-Message-State: AOJu0Yxyq1o/2M08YpMZHqweuC3LqgqBiMyAKiP64nHPW3vuwJS7a8od
 XlN64mh9019h+Xn9dIphxpVwgwotuMxMXOCaGkQCE0pe+GILc97OMMAhfI6MfDpXraDwpbyTCbK
 nCeF7YDJUgA9nYn7tk2O/0Q2GawxNPAYNh5qjmbGrl0r+5EDJeogFCGo62A==
X-Gm-Gg: AR+sD12f5XAwsLJlGFlcRO8dKxDVnoX7rSokodBEQnQP1aPGuyq4KJuOhXTE/W50HGq
 9x5cxS5ufd2woDCAr54GErzU5ColfJYg0w9OP+0SMaX/OMkf2nHFoypmratqn5SmOYa/9AorwN/
 Xuod4YzjZswWZr2Vyt3Me91nZqNhmdjZ7vTZWqt7f3vgg5rKcWGx6o7ug5cqhXbGG63BWrdnBAG
 OD0UVkMDgyJw/up29CcMMRJJ+1h6N4zRUcY/qwEuU4nlbEQRRFs5Tt+MgGHFMhY+9/JUL8qmXYj
 fXFu6VBOQsSiD36vqCv6aUmuyJq0AUELUjhfnFk+qS3PklduMst7/B+sjdpxB6tylSUF3nbuOcX
 gP0uJUvVtE+iCEWRh7yaTMB0jjln74N9QcRqyfJpfPg==
X-Received: by 2002:ac8:6543:0:b0:51c:1117:c7c with SMTP id
 d75a77b69052e-52df59aa4b2mr44702231cf.25.1787309407691; 
 Fri, 21 Aug 2026 03:50:07 -0700 (PDT)
X-Received: by 2002:ac8:6543:0:b0:51c:1117:c7c with SMTP id
 d75a77b69052e-52df59aa4b2mr44701901cf.25.1787309407283; 
 Fri, 21 Aug 2026 03:50:07 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-482b14cf0a3sm16136022f8f.32.2026.08.21.03.50.06
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 21 Aug 2026 03:50:06 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-riscv@nongnu.org, qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Zhao Liu <zhao1.liu@intel.com>
Subject: [PATCH v3 02/15] cpus: Add const-qualified CPU environment accessors
Date: Fri, 21 Aug 2026 12:49:36 +0200
Message-ID: <20260821104950.32108-3-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260821104950.32108-1-philmd@oss.qualcomm.com>
References: <20260821104950.32108-1-philmd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIxMDA4MSBTYWx0ZWRfX39Moro95fNZ2
 uhOKl9kN//tsO0PmXjwwPvez/Ky2sIrOmcQGjQDif6dBmfmQFDg9LSrmULv88DKVg3cVfwL06hm
 zncW68VKHsB79NTwSjwGBxJIo3LAyTrMvzFxxE117RmbvV3PTmOqnUG4bB9iNugqgpIS3U0ikMT
 IsZNJuD/5uMX+ciiqzzbeAnWADhE8T67Sll3Ki+YHzFvFBCAsWbEd9Qyaqa1elOdyf7mD+GGHlN
 vTzpbglsb0XEmiMMLVZhBmTVj6e6K2Oiekm47Osi31JN2vV+OYOFsLxnZL0NwESBNdO4v4Ro+vs
 ahYDlprJSWn3dhgk0o+nANpFNtAWHTePjGhPPRz4YB6wNm3e3uX7toJfd1FGUZjsv+fJHN0tAkg
 vYIeC97jSWiEqvJ9+CZUNCKKQkMeIlvunGwwQbN/8rlAOadEDfm2gMd8hNl6ww8DNk3J6ihpdk8
 dHs22v8u7K63bSYDrnw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIxMDA4MSBTYWx0ZWRfX5TN0pOzRVZVR
 ml6MVpsL/9pxfzcjxdPSmOf1XMMs8ypPNHg/335Z9zuY+uvr4fs6CRh+at5+SCZcK4/21TjC7FM
 Rk2KWbCmjPeQEpnsw0InTOjV5r/DHuA=
X-Proofpoint-ORIG-GUID: M1Vsq0ljXxHlJl9arDjOCqICfyNAb50t
X-Authority-Analysis: v=2.4 cv=BJyDalQG c=1 sm=1 tr=0 ts=6a882d60 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=20KFwNOVAAAA:8 a=x16qC-9I3E3lrIGWYX0A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: M1Vsq0ljXxHlJl9arDjOCqICfyNAb50t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-21_03,2026-08-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 bulkscore=0 clxscore=1015 impostorscore=0
 adultscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608210081
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=0.001, SPF_HELO_NONE=0.001,
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

From: Philippe Mathieu-Daudé <philmd@linaro.org>

Use _Generic() controlling-expression to add the const-qualified
variants of cpu_env(), env_cpu() and env_archcpu(). This allows to
safely access CPU architecture state when it should not be modified.

Alias env_cpu_const() which is still used.

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
Following checkpatch.pl errors ignored:

  ERROR: spaces required around that ':' (ctx:VxE)
  #46: FILE: include/exec/cpu-common.h:89:
  +            CPUArchState: \
                           ^
  ERROR: spaces required around that ':' (ctx:VxE)
  #62: FILE: include/exec/cpu-common.h:101:
  +            CPUArchState: \
                           ^
  ERROR: spaces required around that ':' (ctx:VxE)
  #90: FILE: include/hw/core/cpu.h:605:
  +        CPUState: \
                   ^
  total: 3 errors, 0 warnings, 64 lines checked
---
 include/exec/cpu-common.h | 30 +++++++++++-------------------
 include/hw/core/cpu.h     | 17 ++++++++++++-----
 2 files changed, 23 insertions(+), 24 deletions(-)

diff --git a/include/exec/cpu-common.h b/include/exec/cpu-common.h
index 6594f7fa1be..bffef677607 100644
--- a/include/exec/cpu-common.h
+++ b/include/exec/cpu-common.h
@@ -85,21 +85,11 @@ static inline bool cpu_loop_exit_requested(const CPUState *cpu)
  *
  * Return the ArchCPU associated with the environment.
  */
-static inline ArchCPU *env_archcpu(CPUArchState *env)
-{
-    return (void *)env - sizeof(CPUState);
-}
-
-/**
- * env_cpu_const(env)
- * @env: The architecture environment
- *
- * Return the CPUState associated with the environment.
- */
-static inline const CPUState *env_cpu_const(const CPUArchState *env)
-{
-    return (void *)env - sizeof(CPUState);
-}
+#define env_archcpu(env) _Generic(*(env), \
+            CPUArchState: \
+                (ArchCPU *)((void *)env - sizeof(CPUState)), \
+            const CPUArchState: \
+                (const ArchCPU *)((const void *)env - sizeof(CPUState)))
 
 /**
  * env_cpu(env)
@@ -107,9 +97,11 @@ static inline const CPUState *env_cpu_const(const CPUArchState *env)
  *
  * Return the CPUState associated with the environment.
  */
-static inline CPUState *env_cpu(CPUArchState *env)
-{
-    return (CPUState *)env_cpu_const(env);
-}
+#define env_cpu(env) _Generic(*(env), \
+            CPUArchState: \
+                (CPUState *)((void *)env - sizeof(CPUState)), \
+            const CPUArchState: \
+                (const CPUState *)((const void *)env - sizeof(CPUState)))
+#define env_cpu_const(cpu) env_cpu(cpu)
 
 #endif /* CPU_COMMON_H */
diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 81af7b9ee1a..0b5bb81b35d 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -594,11 +594,18 @@ struct CPUState {
 QEMU_BUILD_BUG_ON(offsetof(CPUState, neg) !=
                   sizeof(CPUState) - sizeof(CPUNegativeOffsetState));
 
-static inline CPUArchState *cpu_env(CPUState *cpu)
-{
-    /* We validate that CPUArchState follows CPUState in cpu-target.c */
-    return (CPUArchState *)(cpu + 1);
-}
+/**
+ * cpu_env(cpu)
+ * @cpu: The vCPU
+ *
+ * Return the CPUArchState associated with the CPU.
+ */
+#define cpu_env(cpu) _Generic(*(cpu), \
+        /* We validate that CPUArchState follows CPUState in cpu-target.c */ \
+        CPUState: \
+            (CPUArchState *)(cpu + 1), \
+        const CPUState: \
+            (const CPUArchState *)(cpu + 1))
 
 #ifdef CONFIG_TCG
 /*
-- 
2.53.0


