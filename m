Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5AC6C5DF6A
	for <qemu-riscv@archiver.kernel.org>; Thu, 13 Aug 2026 18:21:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wua0x-0003DG-Iu; Thu, 13 Aug 2026 14:18:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wua07-0002RS-8k
 for qemu-riscv@nongnu.org; Thu, 13 Aug 2026 14:17:59 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wua03-0002AU-LY
 for qemu-riscv@nongnu.org; Thu, 13 Aug 2026 14:17:57 -0400
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67DFTkR53707340
 for <qemu-riscv@nongnu.org>; Thu, 13 Aug 2026 18:17:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 TNlVfOVc1/StZ0tejxF/DIFWBXRWATBfirtcnn7at9k=; b=dlySNfuvX1efQkMC
 9+3mRkMFFfE6WwzPlKTE6Zno7r/oRsmgukyCB24fkQ7PChBL0iHJTFY26OhOfJf6
 ZwHMipMX9OV044H3+Ocb6Zc8GPSOwREE1hNiME+RIPWCFOXsoi2yBhkdffJ+KVur
 cBbTkOH4KNQcoZ7hTLlDRywUi22ZG3a6fsUKpM3y0kWkZYr5TWR7d2iYkzq01s/y
 89lMfoBnw1WXxCpdd/NYZFx+hugi8NgRTsSdMISy5uaAYC3PVqv+6lsILh4N7ZH1
 G7K/ZcNnNSxLndzFfJcI2Yqyi467pf/3Q1WYYlaDrDZ8rbRIOTwFOEeoNg0O5cFL
 /vsbzQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g18c5k6gx-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 13 Aug 2026 18:17:43 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-51c0408254aso20250571cf.0
 for <qemu-riscv@nongnu.org>; Thu, 13 Aug 2026 11:17:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1786645063; x=1787249863; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=TNlVfOVc1/StZ0tejxF/DIFWBXRWATBfirtcnn7at9k=;
 b=PLjW1+jU8Qd3MW/zxCVbd5E5bdmXORMPpkGVIkrXH4OauczZBmuQJ+3AdO3Eo6Z1rD
 7wZGpIymsQzAmt22QO7dgFwPF4LpbVwSqbf/MkMWrQT8SeQMpYLz8TFNwrgzhEjV8IMt
 4gZ8bnpj7iS+Wg3eF4F6S21A1NVTdd64wgpYNVh3/NOM9rtXPMahibuq3+3BSNK+zoyo
 joPQN4X9kD/GacsgaIWKXnLTfhFTj4IMwwxeGmGiW71QRfrjNm5Q+XDRmbaKcFPG6Up3
 clmmuBAz4jMdXtD+Ag7mg0Uq8j2Hi3TKxRqHXT3lx56bbKIupVISumU+n3PSc+glGZ1H
 k40Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786645063; x=1787249863;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=TNlVfOVc1/StZ0tejxF/DIFWBXRWATBfirtcnn7at9k=;
 b=mkqzLSbvJhFDGRf2XB9JXYscjqmtAgl2mRfoZYza5RznsjTcYMqAAXbzvHnZS4hlTe
 ejNJTfg3VFZdVovC3ee4zX+chr7B9PovCHZnRBrePtN2PuqUcBMkAjt3/6IU4H7Ll2U1
 xKfSJPC7wx2R5xW2ohuB18zS6Ux+VNMq44wFtZ0fkqhPPfto15mn2yuAZB3403fxBJer
 HJCVextOS67vU2Q6oF01Sy3Q/Q0EfckxY9NOLLJFHgn1RB50FS0H3fNhvlbJlyxgQBjD
 JMvWUa1vGAH4BDcun/DB34Sxm/Y0ItjyjwyRwPbCnMlQOzrfMwbsFKJsHKj4JGkta5AE
 i9xQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RrvyPLe9RvwpNLtzACNZzqHZujxZcZL4xW/odNGjE6Biwn5kmQhxtngsFE4L7zYNsMwgSZLO8ofTkzP@nongnu.org
X-Gm-Message-State: AOJu0YxUPSzsmsxw97fl1IrWg29n+UVpYHgHaxQAu6jJCk4LEn4OgX2+
 tg+HaYgj7COJzAYRAfLxASZQRvaYGYnrfSEbkCQx+QEMMZ9YZtMjxBppy5qUOYkVVZKu4FUGo8d
 Dsm8b7vj4b+6dBkEAh8QtZQlNy1wAkAPO6gM4j3iw+zQDRSs2d21aR4DKwA==
X-Gm-Gg: AR+sD13ytykJBowKsAIu9tRWz/L6Ko/gldeswaBn5XRpauib5WiOVMPctDkZiC13hXz
 a2m9L7kq4ktpMfbHxRUzuky7b0dyOi3pthWzd0KD11N2eFJedf0o+ROxbsyRdPhpFiLvGwG//TU
 m6ht4p/bnnPWFisVE+PxzWZHLapU5eJPLk1HPTg8qVgu3qji4mhnnG3s7Ba7vQ1Lmwn+y9Ze7dY
 rrjdjVQ7ae/pgp+nGDydXUIempAKya5T4K+W1f1aMhG4tFcEWCrOOoKxNknN5PwpgjVbvbd7rxH
 xI9HuH/Ep/+ClL+LoaNaYY/t1b5RkkKGiCoVPc5whGCmDTb8Jh1/PDguKhNHfqRGbWZzlnpvXP5
 rJa0XaouJyTRxkG8IbzMJPUH1gpntlwh4JRKzqpiXlQ==
X-Received: by 2002:ac8:5d53:0:b0:517:c582:9161 with SMTP id
 d75a77b69052e-52d74a6f672mr72352121cf.7.1786645062894; 
 Thu, 13 Aug 2026 11:17:42 -0700 (PDT)
X-Received: by 2002:ac8:5d53:0:b0:517:c582:9161 with SMTP id
 d75a77b69052e-52d74a6f672mr72351051cf.7.1786645062216; 
 Thu, 13 Aug 2026 11:17:42 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4998777ce49sm4934935e9.2.2026.08.13.11.17.40
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 13 Aug 2026 11:17:41 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 Alexander Graf <agraf@csgraf.de>, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org, kvm@vger.kernel.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Magnus Kulke <magnuskulke@linux.microsoft.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Zhao Liu <zhao1.liu@intel.com>
Subject: [PATCH 08/16] cpus: Slightly improve *run_on_cpu() docstrings
Date: Thu, 13 Aug 2026 20:16:31 +0200
Message-ID: <20260813181640.6537-9-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260813181640.6537-1-philmd@oss.qualcomm.com>
References: <20260813181640.6537-1-philmd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEzMDEzMiBTYWx0ZWRfXzV+EXxTZ+e1G
 W+88jLtQTecft6suw06tIMzFuW0h7IVvrxiCdgBDfduYparb49gWRWvJNgdWLRIhHKFXTXc8JyM
 /Yq0dlTIkA4ngJo43KqGAJQM+7n4khk=
X-Proofpoint-GUID: CEhSeE0QnqdjJv2NIxvMrOIZPLpPqAId
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEzMDEzMiBTYWx0ZWRfX1FRgfeLxYtQM
 WKi2okrpaxNHwIQbx5iWPld6rov0T+BtgrmcTPZgvQUluJfFbB4TfrXBa3jeC1wfzZZsJyRqZcl
 rAlvMETNBAgVMcONSiZ7lUf0HZG/NPRPhncyWrFXPGzQYbsJF+ZEOZdpJuALadEdrcgZhHEe0HJ
 TxNx3JHuUb/PPJ8y8GXG+DLPR61m8Q+9jq+nbo63I7rhp5KZKNjxul/soQlFYXnC/r5TomP1Yaw
 ZPMJuhN82OtTD5JZAuNRkLRWjSigYBQl2PUpTpWCcwLoLv6mL9bWFfnpNSqJ2bK7mjPKwED9Tpx
 g+U+Z/jca2J5fO6AMMiRfnVicly50owthGEhHE11rkJcUe1zVSEiJ9tgThCCwaYlT3+QLAiv2AS
 ZqNMZN0eTNlWvz6bjGgmMyHy+tJHhpWNabE4mzRMzwmHmabugJenYMGlOscqRPx8HkGcW8yg4Oi
 j8zRA8diU0TomAUXJcw==
X-Proofpoint-ORIG-GUID: CEhSeE0QnqdjJv2NIxvMrOIZPLpPqAId
X-Authority-Analysis: v=2.4 cv=VebH+lp9 c=1 sm=1 tr=0 ts=6a7e0a47 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=dWi2WT42hRTxaHT5buIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-13_05,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608130132
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

Be a bit more precise mentioning BQL use and blocking calls.

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 include/hw/core/cpu.h | 36 ++++++++++++++++++++----------------
 1 file changed, 20 insertions(+), 16 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 183ef9f4ef2..d610f87abd3 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -908,36 +908,40 @@ void do_run_on_cpu(CPUState *cpu, run_on_cpu_func func, run_on_cpu_data data,
                    QemuMutex *mutex);
 
 /**
- * run_on_cpu:
+ * run_on_cpu - Execute a function on a vCPU and wait for completion
  * @cpu: The vCPU to run on.
  * @func: The function to be executed.
  * @data: Data to pass to the function.
  *
- * Schedules the function @func for execution on the vCPU @cpu.
+ * Schedules the function @func for execution on the vCPU @cpu and
+ * block until it completes.
+ *
+ * Note: The caller must hold the BQL.
  */
 void run_on_cpu(CPUState *cpu, run_on_cpu_func func, run_on_cpu_data data);
 
 /**
- * async_run_on_cpu:
- * @cpu: The vCPU to run on.
- * @func: The function to be executed.
- * @data: Data to pass to the function.
- *
- * Schedules the function @func for execution on the vCPU @cpu asynchronously.
- */
-void async_run_on_cpu(CPUState *cpu, run_on_cpu_func func, run_on_cpu_data data);
-
-/**
- * async_safe_run_on_cpu:
+ * async_run_on_cpu - Queue a function for execution on a vCPU
  * @cpu: The vCPU to run on.
  * @func: The function to be executed.
  * @data: Data to pass to the function.
  *
  * Schedules the function @func for execution on the vCPU @cpu asynchronously,
- * while all other vCPUs are sleeping.
+ * then return immediately without waiting.
  *
- * Unlike run_on_cpu and async_run_on_cpu, the function is run outside the
- * BQL.
+ * Note: The vCPU will hold the BQL when executing @func.
+ */
+void async_run_on_cpu(CPUState *cpu, run_on_cpu_func func, run_on_cpu_data data);
+
+/**
+ * async_safe_run_on_cpu - Queue a function to run with other vCPUs paused
+ * @cpu: The vCPU to run on.
+ * @func: The function to be executed.
+ * @data: Data to pass to the function.
+ *
+ * Schedules the function @func for execution on the vCPU @cpu asynchronously.
+ * Unlike async_run_on_cpu(), all other vCPUs are paused while @func executes,
+ * ensuring @cpu has exclusive access to shared state.
  */
 void async_safe_run_on_cpu(CPUState *cpu, run_on_cpu_func func, run_on_cpu_data data);
 
-- 
2.53.0


