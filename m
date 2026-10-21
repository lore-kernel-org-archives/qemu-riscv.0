Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B82B606A31A
	for <qemu-riscv@archiver.kernel.org>; Wed, 21 Oct 2026 03:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=c+GnN2+z;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FDGIrh4/
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xJMpz-0006ml-Di; Tue, 20 Oct 2026 23:17:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xJMov-0004gc-Oc
 for qemu-riscv@nongnu.org; Tue, 20 Oct 2026 23:16:57 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xJMot-0002wl-A2
 for qemu-riscv@nongnu.org; Tue, 20 Oct 2026 23:16:53 -0400
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69L2FPQA2394187
 for <qemu-riscv@nongnu.org>; Wed, 21 Oct 2026 03:16:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 SXkn645Lr/ajES8wPsLn5pszC1HGjQSvfYfwjciavtk=; b=c+GnN2+zoCwIrT2D
 f+mx1wn4qRNnEvYMXwoIdCtrl2Z72xfQ8XHI+iYEVap1vwU+TfjhMHMYDOMYJCL5
 4fXK5SxbsTdK4Om9yYLmFv3N3rG06QC3+tCRAqeKi62FrRd0oxYAH8O+xDjkzfJm
 mR07KtGHPXqQPjhkYYl5wU9XQS3WbY68kbsGc22HeNCBq5iNNjvKmSnIyZnXIUOP
 yUYTsXDa/dSoGkcoml4sMH3ulK5kx5OiPEDt1SMWXtl4nFa9Hvnvb6DyOPgj98Yx
 kCzU0x1SJDhx/g9r8mY13ifYQNB3+rLCFKeiA+a8WJgcARz+8D/oLi3CpZ4HmfJp
 oGWkUw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heeb99gty-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 21 Oct 2026 03:16:40 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-93e92aad34aso62500485a.0
 for <qemu-riscv@nongnu.org>; Tue, 20 Oct 2026 20:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1792552600; x=1793157400; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=SXkn645Lr/ajES8wPsLn5pszC1HGjQSvfYfwjciavtk=;
 b=FDGIrh4/1Weun8osnD3ElQDsj4wR+GcRTGjThprch+tayBsS1d21TTov9tAhulDgDt
 LLO3AdSPaGmD8XbRPhIIWvpoXao/3wOzP2eYggj9i41io7Hyv1oJ6s08Pf2L+Vv3vAti
 /oThRWAMM9hLxB/7aFPa6jPDRVGzs7XH2kceJH7sEoVS0g0Iq+Z81bOTjf44fRhPSnaz
 vKc9jGiAWJp73qoFckn3a8CRfuk2tLdbq6iOMjwHohJf1YB33s4PIg5j4byh+GIWA447
 dl5a36HhMvLGiWps6TIFffXxh2CDX/6bRxBtg8+RjBvhXFtcXwgqz2xyPZhxEn7yG0Ow
 do+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792552600; x=1793157400;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=SXkn645Lr/ajES8wPsLn5pszC1HGjQSvfYfwjciavtk=;
 b=z52YMBTCLVyG5f9Jvr1ih5Ya1W0aiQ9IJ8gsVAdbRqDeFQjow8PwdXDNrrq6B7xHuX
 aS/QNOSqO26nVQYCkusaoojhaKjn8RUxFrFIdQ5vRWPExASjwOXMNpOQHd1ze83K/Ngt
 vecOzt6svUb/pOdKK0I3rKgO3hk53pJ1TI0YYKjW0tpA29GWP+ar+8QdOqixCI4eXKsY
 PAPzoefKC0BNDH1HJQtSHZI00DpDNOHky+qsugS5UTkhu7HQRg1IBw2htRdivVm5p6hm
 h2msESvcZ4Ddmgh1Ch5QX45ANgsBuFl21IX5XtHIOZO99BDNsankAZJe9kZc51+w3JwJ
 UAiw==
X-Forwarded-Encrypted: i=1;
 AKwUvBwKl5CG2gbRKS+oajQb/PbNDvFI0h/satQe5XxHy084n2LiOAMnP3zM2eHG61KfQiYs/QHCzXbwiBya@nongnu.org
X-Gm-Message-State: AFq9FYIA0wAx0Jta/D8Ea3LrdKaxwaAEToKcRfTBOcNKcYc0k0uSp0gm
 6M2/9FW/S7T7OYXwhO4zGqUrv0XHUve/nHcUunIVC0X3xuMFDFtqTshWZyfzrOYCu3d4UY9nbpl
 DI0zwGSw/CsM5rXXjqrFzPq+afl2DtKdv9QtQlGeh11mlQBlaX3lbSBFkeQ==
X-Gm-Gg: AYBFou0apWqqyVZGeLNYX0Zz9m0iTb7D73FeW2qQPNEACzWGokKpBkuslgdNOz7oEdu
 3AtWqwqNoivNAJifC/VitxGe1FZlsjzzWu2uL4/bbc87yt0oZ2pHS99wNQ1zwiK7KiloNEgwwxU
 KajyFDz+HC8+BbQ9VxC8uqgzd6uA0yey/ZI9sbe4amlMbblPiPBrZ0Uq3vsA9ZLJ+hEbK9M22mS
 Md7TXsksb8nzsGzFCtfWBPhUqWb4EshttDmxcYGu+z/BKHMkl7WHJBXlQkeWZNIaTle9dMkurBC
 9zeMnlys9XmXKlvUNTgl1I5bSMzbI7zXHfV7y5Qie4BUw2s6s4+A201XKi++tnOWcgt2WOoABt8
 a+6XMxugLO+VhFe9dQezIDutp6oJ1EBwW358+EgGX
X-Received: by 2002:a05:620a:40c3:b0:93e:c12c:43fa with SMTP id
 af79cd13be357-93f57f74c51mr222446085a.71.1792552599723; 
 Tue, 20 Oct 2026 20:16:39 -0700 (PDT)
X-Received: by 2002:a05:620a:40c3:b0:93e:c12c:43fa with SMTP id
 af79cd13be357-93f57f74c51mr222444285a.71.1792552599253; 
 Tue, 20 Oct 2026 20:16:39 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a1fcd25edasm20923305e9.3.2026.10.20.20.16.37
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 20 Oct 2026 20:16:38 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
 qemu-s390x@nongnu.org, Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Subject: [PATCH v2 19/33] target/ppc: Dump EBB exceptions names
Date: Wed, 21 Oct 2026 05:13:52 +0200
Message-ID: <20261021031407.24862-20-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261021031407.24862-1-philmd@oss.qualcomm.com>
References: <20261021031407.24862-1-philmd@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAxMiBTYWx0ZWRfX2uYHofLHyKnT
 hDguGttx9m0xSExl7JeQTUd958TuW3FNRPz5ObmJ6EcQuwXURzXyOEFZQc/nc96tLe2D9+I3Gb9
 xxXM6qXLJC9OSud13693RhWNt5m8DwA=
X-Proofpoint-GUID: MaNxzsXIxVl-TjwPkBfIxbY8pNjwvEaK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAxMiBTYWx0ZWRfXx2xF5oUzxn76
 FA5SKsBuihj2bGA4frteysyA6og6LAXteLSmrp4IWy5gh06L0lBqmrB9MH+QqfzBUu0ZPNem+Z7
 oH/Vh2ZfpJnhN/GQ8U73rxZ1Gx3v956A0ImFfd1BF3q1ovMLIfDLa3L/0Fyt/HGqHezAwtfHIjm
 Yo8TsyK3bYqX0PHl+f7F2zEMClwskvQ565KloQzoa9DnwzOwslnsX+zEUxQT7xiQ8k/1yual7b7
 xw+Zblcw8GTCGOnxaLj78Sa3+/1x49oHrSbYFX7fyKSSbBglV3b8ycmOPTiuIsqAXsOyWJe0HXr
 8TNr74UDE46Y3q4sTOf01Uv7PbYXElQ0YG3kEy3R2QgF6bWWTFOmyQJxVS2i1JJLaMNZVOy0dlo
 KPVRjJ0WNfeLc8tBkFS0mBp+rS42xXWY307EloqLCICK3vlGjIB/8PcBPTJCMk19vQJnm+qFX0u
 vWkMB4B5DYSn2LtFMWQ==
X-Authority-Analysis: v=2.4 cv=R42WitRX c=1 sm=1 tr=0 ts=6ad82e98 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=69wJf7TsAAAA:8 a=EUspDBNiAAAA:8 a=kkiHJ-TBn4Ncjf4pFXQA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=Fg1AiH1G6rFz08G2ETeA:22
X-Proofpoint-ORIG-GUID: MaNxzsXIxVl-TjwPkBfIxbY8pNjwvEaK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0 spamscore=0
 malwarescore=0 adultscore=0 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210012
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -2
X-Spam_score: -0.3
X-Spam_bar: /
X-Spam_report: (-0.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

POWERPC_EXCP_PERFM_EBB and POWERPC_EXCP_EXTERNAL_EBB are
raised on POWER8+ and logged by powerpc_excp() with '-d int',
reaching g_assert_not_reached().

Cc: qemu-stable@nongnu.org
Fixes: cb76bbc43fd ("target/ppc: add PPC_INTERRUPT_EBB and EBB exceptions")
Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 target/ppc/excp_helper.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index 6d05b865058..895127fb2e6 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -100,6 +100,8 @@ static const char *powerpc_excp_name(int excp)
     case POWERPC_EXCP_SDOOR_HV: return "SDOOR_HV";
     case POWERPC_EXCP_HVIRT:    return "HVIRT";
     case POWERPC_EXCP_SYSCALL_VECTORED: return "SYSCALL_VECTORED";
+    case POWERPC_EXCP_PERFM_EBB: return "PERFM_EBB";
+    case POWERPC_EXCP_EXTERNAL_EBB: return "EXTERNAL_EBB";
     default:
         g_assert_not_reached();
     }
-- 
2.55.0


