Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3113B606A330
	for <qemu-riscv@archiver.kernel.org>; Thu,  5 Nov 2026 12:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Z4KdT/hQ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WciO54zP
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xOwye-0003bs-UQ; Thu, 05 Nov 2026 07:54:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xOwyF-0003Nz-Fd
 for qemu-riscv@nongnu.org; Thu, 05 Nov 2026 07:53:36 -0500
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xOwyD-0005nl-UO
 for qemu-riscv@nongnu.org; Thu, 05 Nov 2026 07:53:35 -0500
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A59tkCa3532159
 for <qemu-riscv@nongnu.org>; Thu, 5 Nov 2026 12:53:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 gm6S4+bkjG/JKgOirRV4r8Y3XiPR9owHfvgX1WSZKbM=; b=Z4KdT/hQzcV5992s
 uQzf648nf1giI92jVxX+Hi9arkUKAD1708v45GcMnhU6waInwiNsWhCGKagKeCr7
 fQRTK5xAdlx9zicb7oJV7X0XLgYB1OSftI5QpnuAajhb5dEsDOSnyedM2j15LUwv
 19TL2RacsFWPWuaXyASshUJ59C5xhAzypr3bqO+8S47AUYipakpFgVO+zX8XXBja
 n0ttwbmIQJasZ+AWIhatub6UYc/bgml8Lyuexre2DHvOmMmMtabQDA+cRhjJWAv9
 lJCjlpcPQMaLgFa3l11f1BUm/WrJxJfFPwkicGwKl3IlNUOddyBsKgzBwyCzcLUV
 EKbiMA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrksq9q3a-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 05 Nov 2026 12:53:31 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-93caf7856ffso385544685a.3
 for <qemu-riscv@nongnu.org>; Thu, 05 Nov 2026 04:53:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1793883211; x=1794488011; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=gm6S4+bkjG/JKgOirRV4r8Y3XiPR9owHfvgX1WSZKbM=;
 b=WciO54zPfKmTmzhSMdEEfJcj5cgud8DwQfCKqkDhKzTOHTuZqxiTA3eNyNClJ3sZ7t
 q2ROFh6Rc/2VFPEgS09/EVcpLMRK73qjo/sFAoqBdfgzlv1Li5Ha5sXcYdEj0H7u4UtN
 rmXQ/t21ICcwnc7TvaxrkqgUplzjHvxOapaZbXJzlYvY7iIAVzBJENPHqoWf+RUSXEuE
 1UJCEMyPqxGD3lc0UMud9rrA/piCeo2F45QdcZRJZJqNOQiC8bvQwoWJVIhJtKsQbb1C
 5OaEQmEYWlkRlKNlWEyRZ1UBRNEPOYqki4EKVfbS7Nr+f+PQ7fzzWD2vy61gn6UMN6t1
 cP1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793883211; x=1794488011;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=gm6S4+bkjG/JKgOirRV4r8Y3XiPR9owHfvgX1WSZKbM=;
 b=dWYUgf3DKgAQnjCFDNeQdBxAveVYDNvGo3z2RNVN9ShYiojztwiPWEFiuCZAqVYgz3
 6grmUcS7YPfwnv5JH63qA2vFOkpwnEANahQuBZoHj1dJIdn53rTsO3/qVkMiVRxKtkNj
 OvNEqh/4/Hz06vDXRcF2Lv7OEVWs+GDy/gEAL+OOqqvGnlhYYsgqNb1U0AxtcaLzgWTK
 E2OZiH8Z6P/CQZj3/BOtHyF+MQA62dUoXLMAegq8s3s+WUP2KqN4JD2myBmA8bkzZpBN
 sEv7y4YvB9Q7wpKwF0cQ13d7XxYoJ4h0IICjaHS9CJsrMDOJwZfURaHoliA8dY75HT6W
 1WRg==
X-Gm-Message-State: APuU4Z/MA5mG59i8/rKmYJLvic90wJCB2wYMe5G6TEMZV/EYDWivkbQQ
 zU9rLq5wur2Qyg/hl0UgfylhptYgBmtC5Bdf1DLVJ63nflFC2zZe0d22HfGhO82/m+YsuYE+lyg
 vXvsxDGuYVMZIJCbU5xFi9zXrFbxD/gEt0AY1yFCN4VI6ClHnChosK6501w==
X-Gm-Gg: AYBFou1mlS0mopR6+Z2pFOSeskszBIkQ8yQgNyUddEVo0CC1fDgUGl6qCu43yBYAZrY
 SS1F2ur+/L+Os0SDp4pcSx6Lnl+ggxLdU6vDNyz+gNYRQ2boiWzjCZLseYcOdTaKcdfobg1SVu5
 mMFg8ur7eisdYV+cfjSZZetxTnugivO29dCxFyaEF3Ai1SkYPSJMlzzOWjz6PqB183tp6eR4860
 RJWi5466lQKf3spMg/AEp9mAvqTtRsXM5oP51/Y5p+Q8bIs9RMtih760OaYJKAOiFpCbcAgnyNN
 6h66iF3mFe/pLNSDIhEnrYkOXpkkgyVoaZ01iEbyjYiF76U9TepAOwCXUYZrnbxPPYuvOHQ9HON
 w39vHF1/ZeHhC0u+TqbFRjE0ycw2o0D4A7fD1qTPLKJeWz59R/iJ3/iOiGUDNuhw5rO6HuiI5bH
 tipl0naA3fyDGmIEec3C+C/TpNnk8BHw==
X-Received: by 2002:a05:620a:1a22:b0:93f:2d10:ea44 with SMTP id
 af79cd13be357-944217ef451mr3142288285a.52.1793883210987; 
 Thu, 05 Nov 2026 04:53:30 -0800 (PST)
X-Received: by 2002:a05:620a:1a22:b0:93f:2d10:ea44 with SMTP id
 af79cd13be357-944217ef451mr3142285085a.52.1793883210406; 
 Thu, 05 Nov 2026 04:53:30 -0800 (PST)
Received: from localhost.localdomain (104.171.88.92.rev.sfr.net.
 [92.88.171.104]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6b5719cd68dsm991882a12.37.2026.11.05.04.53.27
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 05 Nov 2026 04:53:28 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Alex Williamson <alex@shazbot.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
Subject: [PATCH v2 08/17] hw/vfio/pci: Replace deprecated sprintf() with
 g_strdup_printf()
Date: Thu,  5 Nov 2026 13:51:53 +0100
Message-ID: <20261105125203.40320-9-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261105125203.40320-1-philmd@oss.qualcomm.com>
References: <20261105125203.40320-1-philmd@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA1MSBTYWx0ZWRfX3Ih24b6bH6rF
 wSfsRtuAPWDozhHTUe2tn6STqJijdyTVwxwmbSHzy83VSa5DKAccEmYecSMn2uFk4yUBqExOYqP
 mALHNURjVIvz1PKm4WpoZI04p9D0u3ZpLfXa+bvHqbsL1LbnvIQjEYNRXby+FbOwwJEYrL+e06I
 pLHcF73zKfHFCW9ZcS2XRa04BiTT3+Sz5Q1gOWWFCYMPlCedd2u1Z99L+4dThLopXNjKSvFjpCa
 bLgTigpKcsYu/K9+1PGg65tGb/1tZk0GVCIteGqrkdsRnzMsrocqRp4A0i0m0yxBuJMvCRj7i+A
 y37WWWR58oORjX7B2Soxzr2UXQdrIgNOL1arsn8VyDOmmNGv+S1o4eCj9BXE44Xn7pZ6X4y3DwP
 aqSjHrNgNd/wKYzIfifwUii1YOfHKka+//BfgN8l/UBC3YWB4O194U/S46i2COb8yQROwhzD/1Y
 R8wcE+AokFT8Ws+MWTg==
X-Proofpoint-ORIG-GUID: pL30aCtq0oJk_GWPatbZ80NQKF_uAjUP
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA1MSBTYWx0ZWRfXwR/enbvelD2v
 GytfYXhelPTAUrDGGPUqNenTkU/Ub/PqVaigaqRltyz//NIJMLAYzDM0SCeVtF9d9MvHAcBupEY
 2pe3xUVfzZp6fHRmZzy2QlnlSK/6byg=
X-Authority-Analysis: v=2.4 cv=CIe/zhrD c=1 sm=1 tr=0 ts=6aec7c4b cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=pBdeej1U2jlWEHTh2vTwjw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=MIjEIQyjxCZpfGQf5MEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: pL30aCtq0oJk_GWPatbZ80NQKF_uAjUP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 bulkscore=0 suspectscore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050051
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

Replace sprintf() by safer g_strdup_printf() to format the
host address, silencing -Wdeprecated-declarations produced
by Apple clang 17.0.0.

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 hw/vfio/pci.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index 0da2e143b88a..eea96240b7c9 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -2857,10 +2857,9 @@ void vfio_pci_post_reset(VFIOPCIDevice *vdev)
 
 bool vfio_pci_host_match(PCIHostDeviceAddress *addr, const char *name)
 {
-    char tmp[36];
-
-    sprintf(tmp, "%04x:%02x:%02x.%1x", addr->domain,
-            addr->bus, addr->slot, addr->function);
+    g_autofree char *tmp = g_strdup_printf("%04x:%02x:%02x.%1x",
+                                           addr->domain, addr->bus, addr->slot,
+                                           addr->function);
 
     return (strcmp(tmp, name) == 0);
 }
-- 
2.55.0


