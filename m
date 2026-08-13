Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91AB1C5B572
	for <qemu-riscv@archiver.kernel.org>; Thu, 13 Aug 2026 18:20:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wuZze-0002DC-NB; Thu, 13 Aug 2026 14:17:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wuZzZ-00029D-NO
 for qemu-riscv@nongnu.org; Thu, 13 Aug 2026 14:17:27 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wuZzX-00027n-Ck
 for qemu-riscv@nongnu.org; Thu, 13 Aug 2026 14:17:25 -0400
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67DFTLlt2778285
 for <qemu-riscv@nongnu.org>; Thu, 13 Aug 2026 18:17:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 pBblWYEu3w/qqK9BTavVOzUlUmt3HTlRxSdIPsShG/4=; b=WI1UgVggeB3fo8UY
 OksCgZXZKBBXCdAFPg+/lf2DY/8samU/TVsE26g52tngSb5+7ZscGo+eHrwLLxtJ
 zkefDwJCn4cQjALIW1QYwMS0/5sMoGpuOaJkuKl4QR2cqYUI3KAvaDHS3Ch5h6e4
 GSQzrVoYcxzSH+xnokvAjjwDqK6HDTTm+hnhCQt0Z8fyv44xRd8/3MnebzUW/4cx
 4bAqk87QQWbJUUjZLea1NhxpFzVRKRkrx2rEU5H73gQKC/khXqBWgOiCO05EmlqM
 l/kF+E9QgdlWmYvfOrd0FOGZ3bB6QxvrI3uno8criy6uKS3eCmrAySarwHx+juxB
 h4jy5Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g1cb5j2ns-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 13 Aug 2026 18:17:21 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-92e820609d9so17780085a.2
 for <qemu-riscv@nongnu.org>; Thu, 13 Aug 2026 11:17:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1786645041; x=1787249841; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=pBblWYEu3w/qqK9BTavVOzUlUmt3HTlRxSdIPsShG/4=;
 b=icXct97X2VM8KM6h844rdVNPoGnmOXdk7Q/UtHhjQguijxJq2tAy7xSLnxD/7qTCdg
 gqAnL7+EvbfH/WAxxV6ZOt3p/gCgjbHltrO0xv4PzyxHWR2gm+ESkhr39BndRqSSWYxn
 A1KfoNXuq/hsf+b05FafVK8VCOGFrf90qtla5K1TdAlygVlU7Kh4KOG8M90VvP+g4+5i
 kwxL6RJP/0if+4MiITNHfQkl4Ca1o9duSeDPjukbGNqVklolqw2t1CWr1ZSA35c9yD/H
 8506Lc/dkHa97nUPs0J89p+Pc4lPSOhZOQjCsiCJ4lh8Dk1tOuI+6OdJyH1q3Od7iLaz
 veLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786645041; x=1787249841;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=pBblWYEu3w/qqK9BTavVOzUlUmt3HTlRxSdIPsShG/4=;
 b=ZdvpC4EpSXTTLFN3sGXXgi8s/LDLxKsR9zZUzlueord6VBvcAypoNaJi2sPKs3bpDH
 67RzHR8yJrsu3P7vzVhZ65Cx4K/4VGtvWZhYYKP0m6ebjOo09L/6cVbf8azg9DcrHGyz
 tl87ylp1MkcwfU3G2BFUamO74ZGAaFGgLVxeIsHeNGn7kFp08xKxSOBghkXAgVc7tLk0
 //jUWrgG09W6FQd6NsbjA7M1+uDb7l/3GayLLXXUehp6AWUbCZ09vlRD+erHukOtKXl0
 Ior1l419Dsu9YffYfiQkxzwSncSWVkeJI7Y28H+zj32VkEVswTNd65lg+ba+4DwuYEA7
 997A==
X-Forwarded-Encrypted: i=1;
 AHgh+Rp3vGaQbA3uBGUOJLyHIGRdq/Jpdef0Ev9I8xm6leCEBaCZU9ch/T/g0x30RgkfB4Iad+EmfxtAtF3M@nongnu.org
X-Gm-Message-State: AOJu0YyjcxcUbug5RUrHdIVGIlkb6nH3mUXqcB8mY8mQgUaL2sCy+0jP
 yFSqlICAiJiOsGQDrvX70feEcUGbPEaoVlUQ3rXW95LqTyrI6rRtwbzwPo6UJLDd4nh9nJVqW/5
 h0ol+xwr4P3gdaAR1+P5kK8aI14hiKWLFWWEOzYPcfs9QXgYm/ihEwUTPsA==
X-Gm-Gg: AR+sD11IWeKwl3rEHhoQRltOmrHuKtGnjhgPV30m0IOWz/logVwSG1GX3ioA6kKmPaa
 6okOzDEYjB41WgvgOC49/eS3cj45lCUdTEhvJH13s+aEKow81MKLbzU6tNM9W7f7M2UfW4tbEcr
 DQ4SG7PsGbOk9gkAm/JlQqz3+i01ji6yJq0PGjHbY5VcS36qSyImYqdQgVVFG3oDJVs9FYq0H7I
 ozaiGvpOD+cOLgiyumRhsRq2Qse0wzM6tylIcGK55DSIRMhzVSiU2OLQ9WeFdt2dsU9DZIliobo
 zBEMBafwNaeU8bZJ3naTflnWvx0HUq2AHNXA9SnFszSWinE9mPBrqIYeObVwJbX4A89+4EGl+XJ
 fqHuZr0v1Eqo37akARGjBDQSOGHI0no1GoGAw1f+GPQ==
X-Received: by 2002:a05:622a:1a82:b0:51a:bec0:1040 with SMTP id
 d75a77b69052e-52d73c107c8mr83566101cf.12.1786645040744; 
 Thu, 13 Aug 2026 11:17:20 -0700 (PDT)
X-Received: by 2002:a05:622a:1a82:b0:51a:bec0:1040 with SMTP id
 d75a77b69052e-52d73c107c8mr83565161cf.12.1786645039982; 
 Thu, 13 Aug 2026 11:17:19 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49982165351sm77726135e9.10.2026.08.13.11.17.18
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 13 Aug 2026 11:17:19 -0700 (PDT)
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
Subject: [PATCH 05/16] cpus: Improve cpu_pause() docstring
Date: Thu, 13 Aug 2026 20:16:28 +0200
Message-ID: <20260813181640.6537-6-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260813181640.6537-1-philmd@oss.qualcomm.com>
References: <20260813181640.6537-1-philmd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: OfbtOzgVZcPg7MEdCVHVGQKgaNwoVJ2V
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEzMDEzMiBTYWx0ZWRfX+TvJbjWNErsy
 o7YjGq9zjQOQu0ZQWvHr+KEP+fMrud/GpJv2wvi6KLKl+s0bkzJ7yG7pEfegw1i9v+as+8RTgx/
 qjFCnw7yIowL/82cobC4YamR7AGA7ZY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEzMDEzMiBTYWx0ZWRfX7Ggw2i3zw2xd
 U6YB5Lf6oO4d+iylbia9BSCOGdV/hqt75fdW3r0VUsG2KIO1PYywmDV/rOr5jFxaZYzKEttGtCg
 tMNMeQ3JXY6nLVtZyZNkXO6sFLTVZ8ddZZL9BixwkKkaL1+oZ+HiX8rCJMqpF8/gsayrHPTDMcC
 5gteVnhfsUvXYubt6Musi88mxa4ozzC9CWUg/KvCU58UkUXJMSvfvV8ELynkKLiav5y+VYDcBKi
 ldlP5AXuU5dBviQ6Ft2YkPjow+bJeeiYkNrsBbCT8PjCXblQa0L5ZC7tZ8n+h63EydkfapbWO0j
 4iz8JFC5OfQUmEZSAZYhGuozI7v6N3GhgvggU8387KCItVF5PRmeCRjzU72J5NVT5SdLEQqo/oQ
 4znUTiN8mVDQupWgTUIIsPLeTsJ3v9KczbiLLNg4SCoSpw8X2SrsA8FsN9IhSStfTdjElefW+P2
 6tjhNsjrk4SStpWTDSg==
X-Authority-Analysis: v=2.4 cv=GoNyPE1C c=1 sm=1 tr=0 ts=6a7e0a31 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=TUGipdnbivDJOOLMS8gA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=ZXulRonScM0A:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: OfbtOzgVZcPg7MEdCVHVGQKgaNwoVJ2V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-13_05,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 adultscore=0 bulkscore=0
 impostorscore=0 phishscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608130132
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

Mention cpu_pause() might not be immediately fullfilled: when the
requested vCPU is not the current one, the request is asynchroneous.

Mention the method goes in pair with cpu_resume().

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 include/hw/core/cpu.h | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 81af7b9ee1a..f1ac492714e 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -1045,10 +1045,13 @@ void cpu_reset_interrupt(CPUState *cpu, int mask);
 void cpu_exit(CPUState *cpu);
 
 /**
- * cpu_pause:
+ * cpu_pause - Request the CPU to pause execution
  * @cpu: The CPU to pause.
  *
- * Pauses CPU, i.e. puts CPU into stopped state.
+ * If @cpu is the current thread, immediately pause its execution;
+ * otherwise asynchronously request it to pause.
+ *
+ * Note: Use cpu_resume() to restart execution.
  */
 void cpu_pause(CPUState *cpu);
 
-- 
2.53.0


