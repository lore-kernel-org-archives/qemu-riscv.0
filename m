Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2A72606A31C
	for <qemu-riscv@archiver.kernel.org>; Mon, 16 Nov 2026 23:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZJ/uhJ4z;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Tb50RvJn
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xT61b-0001Hs-Vf; Mon, 16 Nov 2026 18:22:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xT61R-0001Dw-Qq
 for qemu-riscv@nongnu.org; Mon, 16 Nov 2026 18:22:02 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xT61P-0007cN-PO
 for qemu-riscv@nongnu.org; Mon, 16 Nov 2026 18:22:01 -0500
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6AGJfQEh2729093
 for <qemu-riscv@nongnu.org>; Mon, 16 Nov 2026 23:21:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=zcVQ+1xGBkN
 T2unnO9wlOyFRWjaoVI5nv/jKGoY7E5g=; b=ZJ/uhJ4znbveLWOCTPO2jwO2cGF
 sq3+0AfIIvYtypIIFpZOfaSMozLVgpeJBjCCYOwYGB5iZT9lVeKG/v7M+SNgked7
 CixEOFmCgm4V74iwDq0rBpfp0xowAWDhzwQcoRdyfORdRGeHmBmyZooQwcWiJpai
 jNZ3mdl8L7K921xEc+y3MkZmqf92oqEpCft5zIF7JWghWSvDDvdb0Gi3eNwBkGNz
 KrdV9Xq8csh1ZG2smkJKa14VM+98AQch70BJpiC4E7KZZM/F2f4lWo46CqDCyeFY
 QVS3gr0l0qDKR0O9T2UC1Ntbj7IKES3It1GfFtyBJJQ97EG4hzt7w5tPpyQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j07regukm-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 16 Nov 2026 23:21:58 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id
 41be03b00d2f7-cd5fd34fee0so2333443a12.3
 for <qemu-riscv@nongnu.org>; Mon, 16 Nov 2026 15:21:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1794871318; x=1795476118; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=zcVQ+1xGBkNT2unnO9wlOyFRWjaoVI5nv/jKGoY7E5g=;
 b=Tb50RvJn1VRnPxyav2sxeL2cWCJf/kW+L9+23nANYoiI3cvV6tRVHoQmV6HWCQ1xkQ
 R3B0C0sW6E54ND709mNHO6BDpUVbpWnDawgEmurNvJ+mNVdQpo3kVa1xja4HqOxIYBHJ
 FuKxAn5b76/Go7AgB64S0aQTZXrwoOEBcw8z/KliPfvHliiKj9WcmD0MRF8FERbKNf1T
 m0Cb3m75QVKqQfRrX4vhUHynKY/QoTWTvwhZaSB1yM+mCmomcMVvkjiaBvt17jnPuwsq
 uisp5m2Qo1dvSxoStFilIKrjat5ALvsdO81lOV2I3OTqxcvBzKRKdOy5At5oNTYXzgoK
 WjjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794871318; x=1795476118;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=zcVQ+1xGBkNT2unnO9wlOyFRWjaoVI5nv/jKGoY7E5g=;
 b=p5+MwQ004jknKH1jqaZOPR8YKJUhu1QPr1gidWqgSAqXJj3Zems7ewKOdRh5BrunJG
 R6BXgX3r3U1wUryissgdtBok1mByAYwNFLjW6bDkY40fQYxOMlnFwSWWI0xlSG7FOQMZ
 TlgbJm5jVsTjOhc2AdofoXDFx+YmdPDNm2mffFLl/+5PtQN+/Q/7v2jN2K8TxME2Kwmd
 vz1/W8R2zgY+OaI8O0HHgOf4kagSIlMy6YLUkIoIkfng9T1WLldH4Y/LZG4TD6LPvlf4
 769UKsrmPOxbbx64KDLQ/o/Y1pEkRAU/+dYSYpRBQZsomBGT7Rnrh2scx5nN06Sno/vS
 2Nzw==
X-Forwarded-Encrypted: i=1;
 AL+hErEoFEI3s/ZZLrd1bDHjqHG42RL0EU2N3llj7SZaBfxJeVPp4o8lzRFC15g2F4InA0euYAFw3LXmUUMq@nongnu.org
X-Gm-Message-State: APuU4Z9PBl9XBw6IQ9VX1ujh3LqWQ19o1P4TVXPdttFQfcEjMnvM3St1
 r4sO8Ihdia4YF3wzZAkv7ROLz0jEmv4EtCXulk+z0TaR3GxiETksCM0YlQ2UyvwQyQjbxmP3Iz5
 bUzzTsFw73OhwFZBXnfYWgMYEpJSJQJ0MCBuCa4eQf8XVUDhHL+LkhC/b8w==
X-Gm-Gg: AZFdTZcUXSnaAkcg/Y9iznL+JD2bd//cH3wxxTvDUaZZyMsiAGI1tfoB60aIuk3Uz/L
 frJSOiNSPAYt946gR4T13/zJQ34gZMrFoqNWc8ixGfX5/5qXzoTuND/lgWmK8lD5wBW+nQ96gxw
 DRlLEi9QrgChMm7+YzKiDV2hjV8pAa3mkajf6k7zU+BVMqWW7n4JO1hQUjQwqzbYRkT72iWBxi+
 v1OEHHXVUGtU4XPhgSmk/eIPr+KnypJRqoQKP3dCp6IVQoVRO9qABOkTtMVeHm33F9wa35rKSgZ
 jSanlok3tk9XgqDUzQJkwRpLOTWMGeR9CC/yTv7f6jBdHwGel2dYmfQaE3Fr4VEukTVSGQBA/Dh
 mpTrQu0wwC5MTqLP3l0y8JvX5ppMJ5CrRLsvWZaYgdJe/GYQy1z6a00mU8SB52v6ZVLHVqQRNAk
 04SRht/yTRYuLVqBTKpvbHTADWiYDftw0zlf0Z
X-Received: by 2002:a17:90b:4a88:b0:3b0:a7b5:c037 with SMTP id
 98e67ed59e1d1-3b1b07fecf9mr11375126a91.1.1794871317749; 
 Mon, 16 Nov 2026 15:21:57 -0800 (PST)
X-Received: by 2002:a17:90b:4a88:b0:3b0:a7b5:c037 with SMTP id
 98e67ed59e1d1-3b1b07fecf9mr11375114a91.1.1794871317297; 
 Mon, 16 Nov 2026 15:21:57 -0800 (PST)
Received: from pc.taild8403c.ts.net (192-80-163-190.dyn.novuscom.net.
 [192.80.163.190]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3b3abe77179sm1059550a91.11.2026.11.16.15.21.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2026 15:21:56 -0800 (PST)
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: Weiwei Li <liwei1518@gmail.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org,
 Chao Liu <chao.liu@processmission.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH 2/2] tests/tcg: detect redundant exe_name/test_name
Date: Mon, 16 Nov 2026 16:21:40 -0700
Message-ID: <20261116232140.2758664-3-pierrick.bouvier@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261116232140.2758664-1-pierrick.bouvier@oss.qualcomm.com>
References: <20261116232140.2758664-1-pierrick.bouvier@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA5MyBTYWx0ZWRfX5YjCccHR8o38
 1txY1sVK21+kcNdMB7yLLJqRLrfJ9g4FHorpg64KGYfty5NtMy5BmucrEZyufF7P73wAq7ZIF4m
 vUYMXBZgfXYn8f5qVOc3cCcee5/rJfE=
X-Proofpoint-ORIG-GUID: i91LFetjfZg4qqhY3_QFyU1GQuIPEGJg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA5MyBTYWx0ZWRfX7Fx2BeVb7RVK
 3xV5Cda+gdB1Dztr67UjywkKnug/X7ktYuATKUCyhggl3eSVh2kGgI+vBxFPSrIJOswtHGtm4HH
 gGQKnaQuFa+XFC6RAHm5Fvw3x0umCSQPmMQn6yCvg29yysx3R++FCxd05xCxw9AaWsdPUyfpche
 fujRGjvx0fuKzCGt1H8MQdn/NL2gZIZeKuYFlSi9FhQqCUWlMGNOgtyV5yiV9k8hhwsxtFua5e6
 ST5Q6atjPBoqmub/3wShKtaBS1LlaJu1i8xs2bfCUwz+UAPYEp9r1Zxp4mU3ITmHO2yCUSq2/A2
 Io5wythwTPCGoD+Ew+Rp8yxfLkYz3XN198EOKZguzMBl3z3odibUsN7BvyyXw8Z1i8OWURuQOrQ
 xLfhXLnVXyqbGp51TuG+2zZZ+R8txXhVzbMUhQF3wm8yPHj2E2p9bhAE2e5NuJVca0TjlHCnfKE
 9cmnFDT+X/1hLMVjc8g==
X-Proofpoint-GUID: i91LFetjfZg4qqhY3_QFyU1GQuIPEGJg
X-Authority-Analysis: v=2.4 cv=R9uWitRX c=1 sm=1 tr=0 ts=6afb9016 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=9852oil1ID9t5xBSyQ/BEA==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=aTqnNb6tLVYCh14j0hEA:9 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_06,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 adultscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160093
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=pierrick.bouvier@oss.qualcomm.com;
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

With this, we make sure it's not possible to add redundant information
for test definition.

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
---
 tests/tcg/meson.build | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/tests/tcg/meson.build b/tests/tcg/meson.build
index b61ddf80514..01c0aaf9685 100644
--- a/tests/tcg/meson.build
+++ b/tests/tcg/meson.build
@@ -356,11 +356,19 @@ foreach target, plan: tcg_tests
       file = files(src)
       exe_name = fs.stem(src)
       if 'exe_name' in setup
+        if exe_name == setup['exe_name']
+          error('test ' + exe_name +
+                ' has "exe_name" that matches default one, please remove it')
+        endif
         exe_name = setup['exe_name']
       endif
 
       test_name = exe_name
       if 'test_name' in setup
+        if test_name == setup['test_name']
+          error('test ' + test_name +
+                ' has "test_name" that matches default one, please remove it')
+        endif
         test_name = setup['test_name']
       endif
       if 'gdb_test' in setup
-- 
2.47.3


