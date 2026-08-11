Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AE47C5B56A
	for <qemu-riscv@archiver.kernel.org>; Tue, 11 Aug 2026 18:35:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wtrJ4-0006zY-0Q; Tue, 11 Aug 2026 14:34:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wtrJ1-0006yu-V3
 for qemu-riscv@nongnu.org; Tue, 11 Aug 2026 14:34:31 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wtrJ0-0002S3-G5
 for qemu-riscv@nongnu.org; Tue, 11 Aug 2026 14:34:31 -0400
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67BGNq891490789
 for <qemu-riscv@nongnu.org>; Tue, 11 Aug 2026 18:34:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 yx5DrvqoVG7WzFuC4QcI2wBJN4WlDhAJMkg2Y1RviQU=; b=Bs/fYvUYJ4ogkZtE
 wkqQrJJOcv5GO7HBEKrp3uVlGoEJmSmTfrnXawG5qvg2EnlmUVnG9w02PGM9pIH7
 E2tYKKqNVlIS5S5fam1glsvs/fM85wPw5rjYQIVgzcrzgS0YQEf0FRlvCEjuWkIM
 bzYJA35x/HHMHneRFGUASfhf3Bq8RcF+YizVVYWcTen3qQnUZ1wr+83lJe8vgFTc
 EqpiKd7CdWAMk/cV1T+UQbRioOiC6sA0FCTDLTRKFTBK6MIb5NFUcXFuzgX5Lev4
 +Btx/JjCYBNp4QcPzCinCDcfC/euDCAZvP3x0IzpkGjt1ZsK92xWwTYwErmucEPF
 pZt3og==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g049eshu8-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Tue, 11 Aug 2026 18:34:29 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-51c1d30035dso2090731cf.2
 for <qemu-riscv@nongnu.org>; Tue, 11 Aug 2026 11:34:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1786473268; x=1787078068; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=yx5DrvqoVG7WzFuC4QcI2wBJN4WlDhAJMkg2Y1RviQU=;
 b=GVH5A87E7PNFHYXUJOYuk43rWTsv6CvcTwebEuoRmk7FeRvDDCsG7VcL40y7G8D8mc
 KelL9gprO0g+Aww4HF4FN+VIY+ulP+7/Vo6ncsyn5packpKqjS0IYOlzD2cMPGtNha4s
 FcYpM4VckvqMQxE8forNzrqts/YBQMEi3EOBkusG9yZ8Ycy60q8zEGZM4R0nu7OQcifM
 xJw8XozaDqLpE1/H/NHK1mUCCWgtMTqQBH5NPqmID0JY4g15rvjD9gPfXRMuODh7flmv
 AvvfKWsenw493hyi8mwVkvfu89NtoQ9gAzk/EoIPwmGjlqWw5t4KlXeT/97USmqAxMyp
 ua2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786473268; x=1787078068;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=yx5DrvqoVG7WzFuC4QcI2wBJN4WlDhAJMkg2Y1RviQU=;
 b=mUAHCJFPjEIoq7tBP1IXwFiQB/kD8vcuSoY/7bivAQyPQTXE5cF4p0V1El4PFCDu6H
 BJCeaZEhYMTRz0WjGC6EB/w4XByuEbSiCxTQQSjb+X5a5GF+qTKs6mi5xSle6SZeHBjx
 r+b3CmsHJfU3s5phv2RpfPV0pp8vpQrVu2mvNxDQ17wzQUc33w7knX1l+/g5e+M/GrFe
 ms6cbciXt3dZ5UJeA0S6WiMk/cVZrqEiPfO9E5poQGqUhswtufyY+HuxOCPWtN+VADjW
 F5buyHPX79MdnybYxrxjIdPjucrYcMKctHFLShCMejw/MZqI3B6O6yNmnpN8YQA9Kc0b
 vjRw==
X-Forwarded-Encrypted: i=1;
 AHgh+RrhMLyx+2CQlDBgIdTpR9Hr3qc84dvnjP6mQ3hMITJ4eksEiaHr8ZzVXgZuCNpPDB0i9ic8bxw86JXd@nongnu.org
X-Gm-Message-State: AOJu0Yy4OQd7GtxhsdhufuNgzStzHDlKV6iwLfE7TyiPv5wY8tkmzErz
 gh7s00ftNh6K9yv4mlxp1N5RWd/4q6Nlwke+dTnMPIcXeUDmuu5F8N8qyeY1G9VCX6HOn4n5LYW
 KDKLaIkEfx56nU0NRf/KK9PGfRv35Djv5uOK59vq7w4HBtIYfVG4m7Ox+mA==
X-Gm-Gg: AR+sD11vT+urMOcPpkfA/b6dWLWHBwHQ75y30ODLFHlQc+0DQwi98onVwRt7wnAJJ7n
 7VKrwzhc2spjO31v8cH45vn9eX1rziwadlImxvyKNi7Fw7tvleUCvxxbSRfRG+PU7/irUkkszo+
 oPZ9w+yBOmsZ2zcX8mbf+Z91M8p8Xwl4+X0XF99VSTJBuF37Wfc4rgTokCzlV0rYdY0AR7U1zes
 DZcXvyARw3C+0vBbtYuaMg1/J6DPBGf1d+tKbbiSB2kbXyuywpqNB/nyAYkBS4FtrOrwGvmNdMz
 cXJ0oZj85VYVYB2m1Lasif7M9IgoHLeKpmm+It/0N0FCpvRI+kzlsqi/bPV18dABQ65rsLj/Lov
 cCl+xgPtrczzCg2FPQCTXsUB+WJYTXbe7gWY3k2IYGw==
X-Received: by 2002:a05:622a:2611:b0:527:69dd:5413 with SMTP id
 d75a77b69052e-52d584ac3d2mr48841681cf.5.1786473268460; 
 Tue, 11 Aug 2026 11:34:28 -0700 (PDT)
X-Received: by 2002:a05:622a:2611:b0:527:69dd:5413 with SMTP id
 d75a77b69052e-52d584ac3d2mr48841211cf.5.1786473267917; 
 Tue, 11 Aug 2026 11:34:27 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4997aac6e85sm10692135e9.14.2026.08.11.11.34.26
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 11 Aug 2026 11:34:27 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 qemu-arm@nongnu.org, qemu-s390x@nongnu.org, kvm@vger.kernel.org,
 qemu-riscv@nongnu.org
Subject: [PATCH 2/8] hw/cpu: Include missing 'qemu/accel.h' header
Date: Tue, 11 Aug 2026 20:34:04 +0200
Message-ID: <20260811183410.22428-3-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260811183410.22428-1-philmd@oss.qualcomm.com>
References: <20260811183410.22428-1-philmd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDE1NSBTYWx0ZWRfX7uFSjXKokXvU
 WTH/VBiM+z6e1AXxSCRnb0bhwk2EsLbT/mQIFDXMoEqqwg31U8xdPs23E6HdXqwG6jORcrOboRT
 J0ZHrzL/f4waWpUKDACz6qWDdFUyPPo=
X-Authority-Analysis: v=2.4 cv=DoFmPm/+ c=1 sm=1 tr=0 ts=6a7b6b35 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=z_YzvCJ9eykze7sI9H8A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: IZWZ4U5K2p4hPSD5UY259QH-vyeLZNKa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDE1NSBTYWx0ZWRfX2Ij1ObGiaQRO
 FXyQA6cZnsTxeJ5iTXG/FupBuf/Zu3BUV8OMdYFW0SQnAbRwm1b0eHECOKg07psovLQqLcgGVCf
 hDHregQxPFnAKEzHQ5JgMO9RtijtZsto7sgWg19c5GtI9rbVRGsAnIKXOPjYCQuWDT/DQUx8CPe
 E67/IJQ35XoeY5Dj92qURrLYTk3lv9/MDJKnlZKcDDPYeXH+3fyYyOtbAQX1L/EYci8EDq8YLYf
 MhETymXYmAqCkNtoIQyGQ1GwaFg7C0NG/4J0uyD4dqfhHxItQKYphfM9/sXKye2B8LV+VyXlTkb
 MeP3RwXd4H3NWs4iBQQ3tXQarWKOSFO0N5IEwNWgWdO0RDhwXB2a0PKYREsYWpfAZPDHmjpD1sy
 o+eQAEb4KO7j9GsHy3H9tUm5JGWRs5lXYr4XiusQTbCm3EuMlamRbcriNAbGUQWjKmTSZZof546
 HYsrfUZV9juCc/HhY5Q==
X-Proofpoint-GUID: IZWZ4U5K2p4hPSD5UY259QH-vyeLZNKa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-11_04,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 priorityscore=1501 phishscore=0 suspectscore=0
 clxscore=1015 bulkscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608110155
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
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

From: Philippe Mathieu-Daudé <philmd@linaro.org>

cpu_common_realize() calls accel_cpu_common_realize(),
itself declared in "qemu/accel.h". Include the latter,
otherwise we get when refactoring unrelated headers:

  hw/core/cpu-common.c:233:10: error: implicit declaration of function ‘accel_cpu_common_realize’
    233 |     if (!accel_cpu_common_realize(cpu, errp)) {
        |          ^~~~~~~~~~~~~~~~~~~~~~~~

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 hw/core/cpu-common.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/core/cpu-common.c b/hw/core/cpu-common.c
index e314f916f84..8c9ff25e04a 100644
--- a/hw/core/cpu-common.c
+++ b/hw/core/cpu-common.c
@@ -23,6 +23,7 @@
 #include "qapi/error.h"
 #include "hw/core/cpu.h"
 #include "system/hw_accel.h"
+#include "qemu/accel.h"
 #include "qemu/log.h"
 #include "qemu/main-loop.h"
 #include "qemu/lockcnt.h"
-- 
2.53.0


