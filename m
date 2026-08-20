Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C12BC5DF81
	for <qemu-riscv@archiver.kernel.org>; Thu, 20 Aug 2026 20:15:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wx99a-0005QA-7k; Thu, 20 Aug 2026 16:14:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wx99Y-0005Nn-Ip
 for qemu-riscv@nongnu.org; Thu, 20 Aug 2026 16:14:20 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wx99V-0001y9-V0
 for qemu-riscv@nongnu.org; Thu, 20 Aug 2026 16:14:20 -0400
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67KK8S394032343
 for <qemu-riscv@nongnu.org>; Thu, 20 Aug 2026 20:14:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 iDP7SSBBed9OilMDhZqOv3xXCrS8V81wrx791E5ihCQ=; b=LMlsqdZRVHLB0wQT
 Zce0HAPHEDYXSvHRmYBkCDR2i22PnNg0SFZTrVdkLfxBbXU7xfmYw6O8lZdYgR72
 LA8cQa028DeUjj+8ADOAEIL3/4QuzhshS8HLdcsXcr54hjSPRd4UY9qIA0P2K0gd
 gjY+4KrsO+vrnzK9mgdHdsP3A8PAO+pP4cNPTTobxqCkkgBkM+PCBS8hoa0AgSZj
 1uOffPkwxnXW672aUy10M0bazcKfNn0XBLmA+g4vI06jSXfEW8q75uVXmvHfJbzq
 +wnmi+QrtccQDDsBALFLzTWBGWf06guPX3ByZ+ZzTA/gte5/v2zjNWjHJpYJJms4
 VFlvfg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5xbvb3ke-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 20 Aug 2026 20:14:08 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-51c19493ac2so2142741cf.1
 for <qemu-riscv@nongnu.org>; Thu, 20 Aug 2026 13:14:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787256848; x=1787861648; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=iDP7SSBBed9OilMDhZqOv3xXCrS8V81wrx791E5ihCQ=;
 b=Ckozgvq4NsaPcaqCyGoX6FFcfWgx08ybdbi7uQU9XcuLoeJmmc2XLbobrO0WSroEYQ
 yvutxVhI9Nc3cDV5BhQKjifi3ismGMHrxrW7e8jwWlcv8TvRZn4kmyVW32QjvNLfOY3n
 eVGcsjoqA8mrNCInVf61/fjDyagatT3loOgUgAE/oYjGZLWuGCA4VSGs7Hu4cPPLNm3E
 dweuPjesa0v5ULNtKIBInOlH5YcpBscmINWpGF044E+yj1ELgRNK5NzVoRtVRaJ+p3Qj
 8cZGzL9Ils2M8Hoibp01cGEIgc4f+MQhBed8GnKDOh775m+d/2NfQitRmvVoWRl05YWx
 xIJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787256848; x=1787861648;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=iDP7SSBBed9OilMDhZqOv3xXCrS8V81wrx791E5ihCQ=;
 b=KJN3BYHiNRGes+OR1DUpjmNriNBvaZ1TJzuB3g8denRyk+vbLUhdMdHaw2klIciR9o
 yHskQA7APWR1KhxVyG4TkeJlTaCEF6xnG/r9EVccJH6VJ6ItdmUauzJRVWCVjalZ0PfU
 L2fMXLoroFRnciPcXc82I2IY0lsE9P55rb6lDJuiR1kq0QuNDvJ4KzkiER4/6dKcmoDd
 i3Swp0R7vpsh0oqN6Ct8iI6ueXH047RoOWnPne+DECdE9qpdWCphfL+AjV7h9cu4daB0
 CukFQx7//HLI66OC6Dt1k4R8KUTNi7Pk5DZfjDyZH8DE04REmR7k3SrOBUgGqS6xQp/I
 45dA==
X-Gm-Message-State: AOJu0YwkXl0sPE0lf9ebpVFOr5Yy0AgyKYNOtqSdm8IEfPRxQWWSFJPl
 qTevsE1FogPnn6QB/E2Xd76POox9JVfdUJSvzRvXnvfW6BO84W5auPtWHbPzNsW7+QfClo4JnNK
 DyqnhQbqlM+Yg9Y16teWtFUKC59p+TVxvZe8ueOU7FXYtaCZh3PL0+qjEMA==
X-Gm-Gg: AR+sD11Yxi9oGM7j+78ZCAsXmzGv6W5qtJ6u9MM6J9VUH6DjGEyy29wfxq1iKqgyApC
 HsW2sImqdmN5y6iGfU9eNVaI+Y855Ws2f62Y+mc73Z7u4izMupMzXhuhKTEXdzBQjcfKyZqx3tW
 MxaX7u0NeoNwiDRgeqgqFyBonpHRoHCB1AWXxtnK6wyjORXiLIDSamE7p8YkwUsSIBXXJe+Jhc0
 6ynOb+ABEIRcAXWNuSLgleUBd84YUowy6yVuJnuIp3sMkd5+JqiZr2+lyUAofHVpwLuC/IGGN/M
 WP/i/w8OkuJggYwT4CW0siaIl11t3jhOLCKFI0YJ8MU8/viJM2Nyv0dTF4ddaeKNd2TUELS6QSi
 m/Hd+OaY6k4bhhca4RnOcMTyO+dhpkA7IQwqXAdBklw==
X-Received: by 2002:ac8:6f14:0:b0:51c:b98a:2448 with SMTP id
 d75a77b69052e-52df56f9741mr10809501cf.9.1787256847852; 
 Thu, 20 Aug 2026 13:14:07 -0700 (PDT)
X-Received: by 2002:ac8:6f14:0:b0:51c:b98a:2448 with SMTP id
 d75a77b69052e-52df56f9741mr10809231cf.9.1787256847450; 
 Thu, 20 Aug 2026 13:14:07 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-482b14b8038sm13531554f8f.20.2026.08.20.13.14.05
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 20 Aug 2026 13:14:06 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-s390x@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Subject: [PATCH v2 01/15] target/tricore: Document architectural interrupts as
 not implemented
Date: Thu, 20 Aug 2026 22:13:41 +0200
Message-ID: <20260820201356.29775-2-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260820201356.29775-1-philmd@oss.qualcomm.com>
References: <20260820201356.29775-1-philmd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=AMKAkK6n c=1 sm=1 tr=0 ts=6a876010 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=Cu_OB6cER5A0ZMY7a4UA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDE1MiBTYWx0ZWRfXyhqXWB27Mnr9
 Lvhv/QwXK9ni755MvHfUfooeA5AA/TegnQuaCDJKDaZShVvCYm1v7DuZKVay4m4fZDJu8/5OWNC
 8FJKf2GQa7/9o2axCGxNDuE9eIT5M4UVvsAfc14mYBZbgxtgPzZPlcR2BjYcA0tNfpudyZpAtjJ
 2sS9iEOWlNgSloQOCxLt8QzrllKT/8nsgmZM7U4fm+iy2jaOfOEZPj3UEyKA/6g15wh1hQg211j
 pU8ttoGxsCjbTpuReZbcsc8ql0CX1bFQxNXX7sv8guihbzC4F+cC6nYhfIC0f75o3OM34VfGgFQ
 J9ENDdnAQ42QS44IDvVyszLFP88QEu4jy1+Ptm9gfFim4oa/lYH/sVVmWItBz/zAhYUGnMBf63d
 /mTYX2r8NPVR2uPNcgvEKWlGXjs93iwtdO5P/7qRqPqlP4R/alvaSsgQzyx3iMe/m/PwvyiLUJc
 mjwqIC2WQ6uXTQ+u3Fw==
X-Proofpoint-GUID: SGs9bKVqkvuk1voM7RddE1nuqJ7IhsWA
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDE1MiBTYWx0ZWRfXz1hOOL7f9D0v
 pdCeYJWjpT9fmck6AUcekG+j0aciT841d48pn/UYUmaKSUomzYEO3VPRr91v4LftxsfOxK1jJrN
 iZVc4+C5aT7HPyvbhpshcWcnpjvAgTw=
X-Proofpoint-ORIG-GUID: SGs9bKVqkvuk1voM7RddE1nuqJ7IhsWA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-20_02,2026-08-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 adultscore=0 suspectscore=0 malwarescore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608200152
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=0.001, SPF_HELO_NONE=0.001,
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

As mentioned in commit de680286b52 ("accel/tcg: Make
cpu_exec_interrupt hook mandatory"):

 > Tricore doesn't currently implement the architectural
 > interrupt handling.

Add a comment to help understanding why this SysemuCPUOps
has_work() handler is simply always returning %true.

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/tricore/cpu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/tricore/cpu.c b/target/tricore/cpu.c
index 6d448727005..82b56c3cd56 100644
--- a/target/tricore/cpu.c
+++ b/target/tricore/cpu.c
@@ -113,6 +113,7 @@ static void tricore_cpu_reset_hold(Object *obj, ResetType type)
 
 static bool tricore_cpu_has_work(CPUState *cs)
 {
+    /* Interrupts are not implemented */
     return true;
 }
 
-- 
2.53.0


