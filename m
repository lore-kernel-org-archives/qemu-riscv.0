Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD5D1CDB466
	for <qemu-riscv@archiver.kernel.org>; Mon, 22 Jun 2026 19:34:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wbkNH-0000Og-TQ; Mon, 22 Jun 2026 15:32:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wbkNG-0000O4-AF
 for qemu-riscv@nongnu.org; Mon, 22 Jun 2026 15:32:02 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wbkNE-0001kS-NX
 for qemu-riscv@nongnu.org; Mon, 22 Jun 2026 15:32:02 -0400
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65MFVj5Z1082157
 for <qemu-riscv@nongnu.org>; Mon, 22 Jun 2026 19:31:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 t4FW760/dwatMRdPf5Z+Kiei6+Rz9q8sXcA9tVx5ZWo=; b=IUIxQuiyYjd+lRb3
 H0IrpJsRpsj9pt+5/lYRRo0yT+kGXPSxi/deB6knldGIUS7vjFiNtlfXDR55B7Jd
 qQ0jvakA01/AI9+ABpIFEfN4vsRnXDHVZCcFKK9Mdm7R+QsUwYUVsNbKI4IaoBce
 +QYaJ28tdTPV+HQddirGyd0WsdLeQ9+wZC7lZ6OoWKgOMpdkVFr9bpSrhcEf0z59
 tGcM9xhLwWy4J+cY8V28FoQhIjui35V1GBKAiWiZV1cIya9WqbyaMoNMEvBRxwap
 ImqgDPtvUBDjCMe4ppNLEuLksJXVbn7ikCjSccibjwCHYxtJBpKMDu8OMiYrKQ0L
 qAD7RQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ey2yja2ed-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 22 Jun 2026 19:31:57 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-920aa2e130eso718066185a.3
 for <qemu-riscv@nongnu.org>; Mon, 22 Jun 2026 12:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1782156716; x=1782761516; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=t4FW760/dwatMRdPf5Z+Kiei6+Rz9q8sXcA9tVx5ZWo=;
 b=hVmtKH82XCL8qRC8P3dcosu3pXlDzR3zPNwo469Vgc+0hBWl2L5E+FN6HUFTxUA0bl
 h+Trd76GNvc18icoAjicsl0NmeUs39fh2ANymsiOCckIed+EPg/vJ/gaKhDlRWh8Iu5l
 jUX2qDwGtkju5Nu+pia+CdN2OePhk0aDvT6x6P9FtMlujfCAOWIQp5baqS2df1E76bm4
 RIGqf5bim1ATOAstmxvOojigvs0TVCMUI8zzvUNIviur5VUxs0bceXVx8Lj84C+x6IEl
 HfvREk7uLu3VIF0tAw8GbT9cgjl9Dmc56wJ3AtpyzktXeeK7MPDi6ffUYj1e/X8Yj+a2
 ynuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782156716; x=1782761516;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=t4FW760/dwatMRdPf5Z+Kiei6+Rz9q8sXcA9tVx5ZWo=;
 b=pbOLk/PD8VSXYRWAzt45t+WQ5BFcuSvKUjCcNOD7ZCpzOT2aaszpYAWdJkpqoveRRC
 6CBdJgjk8vw5Us0IfDxEFFTj4MkCZClp5tiHZD8Bzr8DvViSo4k8wshSNE+BntQaL5dM
 gawUt85j6qDP5klj6AN99gA21R/3bGZSUI/0jujCjGy5H180zQu7/90ACBji9cAO3in3
 nMRnfk1uauNvVangGr8JiHk8IfR5hRz++Y+p7XPgUYZp950t6qaq5OlvQqtjTjRM0rEr
 od6I0ATQccHhcXtgsEPEA2jcesss8fDprLkOnDAudIyM+FBRYzAc3nMHLiltClDFh3UT
 la3w==
X-Gm-Message-State: AOJu0YzIBnoilBKQJCwDkdb8VA1qqXoGFDUp8Nnqhb981BkEUYIVMO7s
 GRsQfaJ4Y+e8jaBmYPvQGsh6S8sWDDOSg33XxcODRGm+6QDq30kcoBcWAx4bP2VjOrqvlhSsF7O
 OepHg69H2Tz0hGE+Z6JFO5HJaTNE9zKBsdzrtKgZ1lPV+NMYqa0sJqoDZsw==
X-Gm-Gg: AfdE7cnFmgAgZgy1cDi3EIMNGVOg6nsjGGeOjic1LoYHoxmJgIgb1GKW8UhlXJznAvi
 Z13QNvZpqqOWcrNDx2WEcK6wbpagFPy3Vz4bT/2FJ3uz8etQAesmfXiW06Xv4xBlm9ya6HpSmcy
 dKGkNrzg3pJgbwAv5Ps647PIXBLjwV2NEf5DKh5/1eC7npaCjyO7xb+6ACXg+CeqLDidcPTTKZn
 uJ9p9X9m9QbUKERpS1PdxXcg4ZcY4Lp9Fyrc7yCF4PXIrsuY5E09l4y145yVS1FJenIFIXq1GRB
 3t3lIhkf1H+XcDbkJZ+cjWdKSRJuLVMxi4WeCBwpmfi9LpXvrS2xJe7hRuGSX90TVTpTXp9KEGl
 ncZWhrT+PFTZEAWxancsCYFmiycT+8L64YI4ug+OlQ2E5aQ==
X-Received: by 2002:a05:620a:630a:20b0:925:b3cf:5c9c with SMTP id
 af79cd13be357-925b3cf5d64mr260882685a.24.1782156716514; 
 Mon, 22 Jun 2026 12:31:56 -0700 (PDT)
X-Received: by 2002:a05:620a:630a:20b0:925:b3cf:5c9c with SMTP id
 af79cd13be357-925b3cf5d64mr260880185a.24.1782156715977; 
 Mon, 22 Jun 2026 12:31:55 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([189.79.21.40])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-926004ab49csm61489585a.34.2026.06.22.12.31.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jun 2026 12:31:55 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com,
 philmd@oss.qualcomm.com, pierrick.bouvier@oss.qualcomm.com,
 Zephyr Li <fritchleybohrer@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH 01/24] target/riscv: Remove unused tcg/tcg.h include
Date: Mon, 22 Jun 2026 16:31:17 -0300
Message-ID: <20260622193141.1449724-2-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260622193141.1449724-1-daniel.barboza@oss.qualcomm.com>
References: <20260622193141.1449724-1-daniel.barboza@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 7T5cppe3ANAIu65GNq4JreRV_7emji2C
X-Proofpoint-GUID: 7T5cppe3ANAIu65GNq4JreRV_7emji2C
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDE4OSBTYWx0ZWRfX+RtPB4edLerr
 tOkYeH9LLBp3xG9E9T9L4uAc1B9BRi79cfYLBwtz3leS87N5VhT8K6zKhLER0Cn6femG+FD0zgG
 /oJ/uXuHCS4N1v1uE59ictlk2QoFYLQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDE4OSBTYWx0ZWRfX8i5utuRrrvcv
 Oe0Y9izYljsky1EjhU6HqhQ8EkAV5mZp/VYFER801ktzkFYGPsUS+ElAdV++HeR+Wv9kjtS5xID
 6ZS/s2/9mcxTFey5bcXrRr8mD+qMgiD4yifeCuYNK3Mj14FUX7SBOdhNkr7D0Yo4o+ez/G4lv9W
 RxHgfioBvzqWBsO7GAfUWA+wHPJ8fC5Idh6N6o8r70cFI3cMZCfdgWN4uULC/DRv/DT8iawcB6K
 lFrtgGZwfDHPnAQURQO0o/3hlf3HdL6OO0CzJiZFOxrRWA7D/SmkaQqvkp3JKtO4ZNGzIBuU9th
 3KSL9O9gd39bD9KcLRhp3gcHaq2/BYzVohv39XYlyKPm5cAk7eKkrbBK/UBYOHz+hlfj3f+94rm
 edeJGEBEpCNhWdIA7nls3uI8GSLqvtomCKQeKdyHsKv7hAAIh0yrarCXE7S9MKORlBe0s3hqvJv
 XfYcLDUzDEB0VQDx3AA==
X-Authority-Analysis: v=2.4 cv=YLSvDxGx c=1 sm=1 tr=0 ts=6a398dad cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=sHJf4AwOIoU3qjeHFPlg6Q==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=JF9118EUAAAA:8 a=beEPI9FAKrdLFu6WGxcA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=xVlTc564ipvMDusKsbsT:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_03,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 clxscore=1015 phishscore=0
 adultscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606220189
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

From: Zephyr Li <fritchleybohrer@gmail.com>

Signed-off-by: Zephyr Li <fritchleybohrer@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
---
 target/riscv/cpu.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index bff3ed5de1..4e96bbeb60 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -38,7 +38,6 @@
 #include "system/tcg.h"
 #include "kvm/kvm_riscv.h"
 #include "tcg/tcg-cpu.h"
-#include "tcg/tcg.h"
 #if !defined(CONFIG_USER_ONLY)
 #include "target/riscv/debug.h"
 #endif
-- 
2.43.0


