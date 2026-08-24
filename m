Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2DCCC61CE3
	for <qemu-riscv@archiver.kernel.org>; Mon, 24 Aug 2026 11:18:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wySgS-0001Z3-Mx; Mon, 24 Aug 2026 07:17:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wySgQ-0001XK-QY
 for qemu-riscv@nongnu.org; Mon, 24 Aug 2026 07:17:42 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wySgO-0005AS-W2
 for qemu-riscv@nongnu.org; Mon, 24 Aug 2026 07:17:42 -0400
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67O99VHl3575769
 for <qemu-riscv@nongnu.org>; Mon, 24 Aug 2026 11:17:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 RXSFdJhduuq/vV0dSoh2i7hiqI/DLrn0WKuxvW2l1mE=; b=OSe90LJwxG9ZWXwF
 dmjkFE2qLrIhuEzcmfuTqA6lfzImvEfhNz8/DM8oqiiGpqh8FV8cyKpo67r3OX/3
 ilf2de8tV/srIa5Hn/UsZwjIEAHogc4tCx11qc6nXi39p+Q6joVvwbng2xphoLVe
 jmG0LNECb8kpDKpu/+l6+YykEkV8dxDwjhJFJ/ipQRG9GhfW3yShaRccODVEhcTQ
 15OdA3CQzC4dSJCeLfPZUz7jVQL0v2IfRflAgmuZAZMEpvJid0xO9EhDAaFoCfDd
 soHQMQUuG9ek7x2cOcSV4slSlRLRx8D4SdRpDkRsPQ5TokGhA8s4OdR0xVvPgEyK
 XdWMYQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g88jpjcxp-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 24 Aug 2026 11:17:39 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-51a8db414c7so50831581cf.0
 for <qemu-riscv@nongnu.org>; Mon, 24 Aug 2026 04:17:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787570258; x=1788175058; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=RXSFdJhduuq/vV0dSoh2i7hiqI/DLrn0WKuxvW2l1mE=;
 b=KLGV0VOKYjoAEDZ8s8MctpquTeTDQX+SFDZUQULjaxFitfh7Us/KU2KXns6FZ/MXLZ
 rnLgMpSZ7grmvER+RQrOXpPUysuFFjjRUqB5UL6b+GAQE4Q4+0CJ/a+O8u2Tq6s8IWz5
 OQmAkZxS3iYiqMk4PjDnipL27SSMv42kc4/AGvTK/DFb16qY7uE7iwacYY/6CreQy3aY
 MVuMG3V2HkUVg87Zbo1TNnComDbXs0kYZ25gUlDhZKVL+nEGep7Px/Lkr4AUfOGOUj34
 PEyQ7/qW54Ok2+NqXxTbBq7Qjv35gXRPDrscDhXMiZbK1+gtJ7qcT2pi3nI+RYrfH0CL
 alWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787570258; x=1788175058;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=RXSFdJhduuq/vV0dSoh2i7hiqI/DLrn0WKuxvW2l1mE=;
 b=Pm54f5oA0lGerPh67p+hCoOw/6eM/KhovmGmdNcVldlTRkyDnPZSv/5Cd88HvOiEyO
 KhRqSVqthUVKyzkuiL6lVkEfAWxgQ+Tu1/KJVEP2KKj4/gLdaVuQy5vzNsLS3ojS4kYN
 Thgg9btTXYHlrdDyoqGFC5DWJ23s85sNTOpE8VqEawcE7Ru7RzGO0o8vTnAXnonJyfIY
 OG7T3IwCyLjHjkAI76AMIaTUQzqucCn62GPRs2zt0nQa5sp++v/Egnytub9s13OFZ7/e
 wf8qoX7XiCTm7GWiQICh/3AaMs3TvZ33n8nkGRA/JGVa6zltoLT8OUFpcj1s3swa9xMe
 yg9w==
X-Gm-Message-State: AFuF++mGqOmbBF0savOOlxY17GuyesckwTlfLcW65qgaPAgqAJuJDzSq
 qgLhSJYpoMRxf5jhIkZZpIOry1W2JnaoEQIZQnUqWCxCTuuQRzXmyTWGe6EKCiTxT+nwWkLMf9T
 4cmYwTU6+aBZSv8KIqJQd7hCrEHjiVraMpx/qIcSYF4W3PDUraEEvbzU10Zb4Tpa2xQ==
X-Gm-Gg: AR+sD11AbwKTzNbnN8mfxwnxMSRJmax8NTz4B65WswiYcRGGRNf97x5LcFfGLlQen0D
 aPaK0ZGiIMunvfu/vWjjRLJ0lXwwvJ22hHXJHXq8XMhuA/2RuUCP4ubNp3JTb5Fwrc0n2oioPk7
 4uN4909JD5dyqMY6dbbYvzUNX1UpPbvfOFdG+id4IvPt5sah8tG8KiLAhYfbnSnkm5CN6caIPs+
 AbCjhCG1tfGa4aEkRWLQ6Dr+CDa+A+/+hiVOPtY09OEi41vqL8AiniwE1fV53E8tQfj0D66FPZP
 zDi9PxlnBAtJ3ZzHnGWh5MtXFZLHm5Bb/iVUz54xtXUh7fS4vZ+nAgx3tMek9kxKA+4BiZnYWxW
 ZTKDm95ngsBYIA7s5bLbdPsWotRr/CGsehEV11EtVCPU2RyvsKQ==
X-Received: by 2002:a05:622a:1481:b0:52b:71dd:c930 with SMTP id
 d75a77b69052e-52e09d22017mr178947241cf.38.1787570258330; 
 Mon, 24 Aug 2026 04:17:38 -0700 (PDT)
X-Received: by 2002:a05:622a:1481:b0:52b:71dd:c930 with SMTP id
 d75a77b69052e-52e09d22017mr178946741cf.38.1787570257708; 
 Mon, 24 Aug 2026 04:17:37 -0700 (PDT)
Received: from localhost.localdomain (44.170.88.92.rev.sfr.net. [92.88.170.44])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c24966f99basm1161443666b.37.2026.08.24.04.17.33
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 24 Aug 2026 04:17:36 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Laurent Vivier <laurent@vivier.eu>, Helge Deller <deller@gmx.de>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Subject: [PATCH v4 02/20] linux-user: Uncast void pointer argument as Object
 in target_cpu_free()
Date: Mon, 24 Aug 2026 13:16:51 +0200
Message-ID: <20260824111711.26297-3-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260824111711.26297-1-philmd@oss.qualcomm.com>
References: <20260824111711.26297-1-philmd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA5NCBTYWx0ZWRfX+7eyBn1Dwi0d
 nc3teCMYSiBYl4u4DMqaWJHvoyeYzV+28aU8KXgRIISmQXyrT2FRYSsVX/Xoo4ENzrVRCel75Tm
 ay+8A6eFGkHQ5fSouHQaABoc7WLSmnSwCH1fuOepfLFq9lJarj8hN+H4abeHedwTtKkjB1PWBNt
 hfCKjmrMv+g0IHkCAOKsaDXiVt7H2XCPr6N53Vt5tNyIBaig2u2lrADNSHPORGTX5vIvAK7ju6+
 5Cf3b/jvVdLcrM83FMQPJ/N9vACrU8OMH35wm/8jcEIoja3yoKvTl0xK7sOzOnIwggYV9TbEbJv
 Okr5WQnD06Arx4B1k0aaWPYqU0+qN8Q0qNDqmr7RXb8d+mPKzlNSCfHAq8tRElWjgEPptoVrGXs
 p80kyk+jqQMdi0f+EeZArAbA8l5xlVz5g2Bu+Ol+V9dZReY4/7obVDZ/41akqXc9+r796LRpucL
 PR6agQcFoJ0qlzsFpMw==
X-Proofpoint-GUID: z0QDNyOgaUfOG_AkUZx9saxlBQ-GNOcc
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA5NCBTYWx0ZWRfXyx5QMxIpJrGV
 CfkzM0PED5oZbxDo2O7UnOAU8wCpFZgPR1ccOX4GL+JTrkoFQP2lK7r33+X5PyIv77ac5hRHHip
 XUhSrTjDfMk9jWFHJ6w0ZMT8A2q3u9M=
X-Authority-Analysis: v=2.4 cv=Xey5Co55 c=1 sm=1 tr=0 ts=6a8c2853 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=s1NLoHz9uzatdv2VNqxUSg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=2RGiIWwp3e7TAFkeQGYA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: z0QDNyOgaUfOG_AkUZx9saxlBQ-GNOcc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_03,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 impostorscore=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 clxscore=1015 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
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

init_main_thread() is registered as Object::free() hook, thus
take an Object* argument. Uncast the void pointer as such.

While now cpu_env() accept any pointer type, next commit will
restrict it to CPUState* type. QOM-cast the Object to CPU type,
otherwise we will get:

  ../linux-user/i386/cpu_loop.c: In function ‘target_cpu_free’:
  include/hw/core/cpu.h:604:31: error: ‘_Generic’ selector of type ‘void’ is not compatible with any association
../linux-user/x86_64/../i386/cpu_loop.c:331:19: note: in expansion of macro ‘cpu_env’
  331 |     target_munmap(cpu_env(obj)->gdt.base,
      |                   ^~~~~~~

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/i386/cpu_loop.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/linux-user/i386/cpu_loop.c b/linux-user/i386/cpu_loop.c
index fe922fceb5a..2f733b0b477 100644
--- a/linux-user/i386/cpu_loop.c
+++ b/linux-user/i386/cpu_loop.c
@@ -326,9 +326,10 @@ void cpu_loop(CPUX86State *env)
     }
 }
 
-static void target_cpu_free(void *obj)
+static void target_cpu_free(void *ptr)
 {
-    target_munmap(cpu_env(obj)->gdt.base,
+    Object *obj = ptr;
+    target_munmap(X86_CPU(obj)->env.gdt.base,
                   sizeof(uint64_t) * TARGET_GDT_ENTRIES);
     g_free(obj);
 }
-- 
2.53.0


