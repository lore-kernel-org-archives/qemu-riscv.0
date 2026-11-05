Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46673606A31B
	for <qemu-riscv@archiver.kernel.org>; Thu,  5 Nov 2026 12:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=llFc74pQ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=A+Kh/QWZ
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xOx03-0005lf-HE; Thu, 05 Nov 2026 07:55:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xOwyf-0003mP-AN
 for qemu-riscv@nongnu.org; Thu, 05 Nov 2026 07:54:02 -0500
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xOwyb-0005qs-7O
 for qemu-riscv@nongnu.org; Thu, 05 Nov 2026 07:53:59 -0500
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A59tF1C082962
 for <qemu-riscv@nongnu.org>; Thu, 5 Nov 2026 12:53:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 JH8DzDeDwo4oYATYdaoLXbb+8y3/Xbwej4F1McXNIIU=; b=llFc74pQAKHjRSoV
 zFLxGkC8Aafae/f8AqHExa0fE8HHlCNgW0hbkqc5BeAS33j/agXtiqyUxQLrS/qk
 CWQ6nWYFWcOFOE7wo7GxiPZ2xHiVwMe40sYlkF2zD2Ar6A6dgYECYEdIo3zzvzw5
 1vEhurQPkjj55M/tFH4byDGb9IBRe66xAwchfKTi3RkiZ6BY++qUGN7Tdbp/tAhb
 gjcwd6OAKeozX+Zpj9w0Y1EZS1hr+ASOkINcZVzFMsbeH5BqgHtaeP3ItkiCQ3Ju
 TZPBUrLXtUQsk09Xn1KCKaGInDEFSy3n9qCOEoeO1hhCunPP/u6wCMH/qbVa0evi
 V5E4cA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrq1p0uy5-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 05 Nov 2026 12:53:56 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-93e92aad34aso426498685a.0
 for <qemu-riscv@nongnu.org>; Thu, 05 Nov 2026 04:53:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1793883236; x=1794488036; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=JH8DzDeDwo4oYATYdaoLXbb+8y3/Xbwej4F1McXNIIU=;
 b=A+Kh/QWZoErv/DLX93ZlQVqVxBFDu0ssIHzZprOa0+ZKNu5i95ExDP2+kbTzHiXOAk
 P+Cg205PPSvs04sj4uuXNutDSEGysle6SUMKFppdNPOOkLA/e8uE/iqpK0qVLSO4qjbj
 lsGmqNNwImPkpiPpmZRU29z1c4p4lr/k+15A3MQt8svPVhCGOsCbJzp/+VvLMHRQpynF
 kXH+nWA/ABC3kjp7aFXcnc/kVsYn3L+zhtAG6UWlpjhKQLHgSX95c8yFirodBIpw3Na/
 YR6KOMhxK/lwJTmGGSIEJWUP08QeewC6vay3RgzmdSvTSKE/rqFvw7vTRn1dNWYH27pp
 Q1fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793883236; x=1794488036;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=JH8DzDeDwo4oYATYdaoLXbb+8y3/Xbwej4F1McXNIIU=;
 b=z8kcSoJGjZezh4DT5ip5Ilfzth2Sx3Ou+EN8ZtAC6/W2Zgjut716+naS/2PbNM1/C3
 nUMbtR8wWqCrdJ00Gjn/0HNsMksnUAdlbMFxc+FP4e/UdEwrY8zlGhSxTev8Yj60KddX
 04LSyfmBlVESCUX2uiyONr02sX/XVuqcf30Cxw7wZtw1AMmwo2O9H5uDrN0uv+rtD/N1
 01ZULjPqL7QmQBqjKx9kUonfo6vkzYmxKwUD/ieGlsSIR40RlS4lXlfpR6xDFy2k6K8Q
 5pWy80ddn4edLv8YDp3rwViVOmLa3TqwlF59/ZMVTUBJDXbQj9MXbq3mOU/esucpuzWc
 /sMQ==
X-Gm-Message-State: APuU4Z+Px2kw8IJU/0nmHVNSoWdpVTqS9QnKnC5p7qe5G8xOs+plTplh
 1/XjWZs4Y0tOkwogUF9MHrftaG+3sauuVfhY61+0reTzAhsRF/9zQ8OpzRojm2CLDj4F+euuJ6p
 neVartuapO1Dc6IeEogZzdtW2rARIk0heEO8XMy4zWHTBGiIWLrK43aW1ng==
X-Gm-Gg: AYBFou37PdeNhPLN3ySXD09QqN/faPG7Ej19RhtE3Fgvm5KU5vaWtwJ0aVDyGMfpSMN
 Lo30XTT8/t8XW9fphfNhfBigkc7MK3CEmcvnftdP9Zoq68qONANqsJoKGt8fgoEhKqmJYNFajJR
 qSZApaXvcf+o329aJOaoGjkUvbGN37ET8wf8n3TmVMomIwe9PD7ks41iM/mMZooqqHqwgdvD6Qn
 sCDqB30MjGkAcq3NpwGvsjrHkvmCC88ikpFS5cQ80CJgkDYL8KY1XkJ9Rixq4iR95J5vKxd7ttb
 n1EbXZGbhC8J4oM73HIeba0K8yrp5C75i+p9nstH2sh3dOYczmhLt1pk6ZboSzk+hPLaP40UYtY
 XkTg9VrUrHdQloG3ooSOco/QQ70GW+NYz8cbuJiUFXqsmrZ5gE0i6Z/beyBl3Q5k6XlBrwevVfz
 /gguxhPW4UT3vDvZNzI2ytIIddrtJ1+w==
X-Received: by 2002:a05:620a:4724:b0:93e:c12c:43fa with SMTP id
 af79cd13be357-9442171c8a4mr3144907385a.71.1793883235542; 
 Thu, 05 Nov 2026 04:53:55 -0800 (PST)
X-Received: by 2002:a05:620a:4724:b0:93e:c12c:43fa with SMTP id
 af79cd13be357-9442171c8a4mr3144905085a.71.1793883235019; 
 Thu, 05 Nov 2026 04:53:55 -0800 (PST)
Received: from localhost.localdomain (104.171.88.92.rev.sfr.net.
 [92.88.171.104]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c4d0e4657d0sm168195566b.48.2026.11.05.04.53.53
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 05 Nov 2026 04:53:54 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Jiri Pirko <jiri@resnulli.us>, Jason Wang <jasowangio@gmail.com>
Subject: [PATCH v2 11/17] hw/net/rocker: Replace deprecated sprintf() with
 snprintf()
Date: Thu,  5 Nov 2026 13:51:56 +0100
Message-ID: <20261105125203.40320-12-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261105125203.40320-1-philmd@oss.qualcomm.com>
References: <20261105125203.40320-1-philmd@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=AaYkjHXG c=1 sm=1 tr=0 ts=6aec7c64 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=pBdeej1U2jlWEHTh2vTwjw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=f-zRNqtaeIehAayABMQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA1MSBTYWx0ZWRfX0i8HKh3wflsh
 3+xnRd0+3/atcsR8VyQm15M+KhQFitkr+IcgMWdqENIegYUFzMaykx2goGwaFUGSB2nM/Qg5U7w
 jJzoSjnSk5cDjaRjJDODY4srnxbdglTWz7FnJYCRTu5H+oYwqg/402C2ju9YxvCs5pGNpoSfchB
 k0dpfjpQSrMUgNa4DXhjapWDobFIZA+gJcjW0g8SvkuVG+UuWrnwgKkDszdJosBfk5t/rVQ6CBx
 vSsB2i6j+nT6uJttI1go8zYc+1hoMS3NgUFXNIToHVT2YlGxHAwrgpqiuECFcT+rxrRwS7eLiwh
 7YmXtINrwGre0Pt60YGQwwsucM9UwIi+ZZsixGc8zPG2/hXdHV0pQofWp5eNKcDDr/Z+b4mNVw4
 PE1wW1qWJsPMipph0h+UTl4WOazeCyCWp29ReIj2C1n1tVv8sRfg4Yq6c0wAuupeAXxfrdOhcvD
 CdUqcl5d6BSy8UEXUIw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA1MSBTYWx0ZWRfXx2PPEyjWVlxG
 ixnw3N/CijgGI6QPxQCZEAY1mCJG6TZMK81xJ7Pd+nUc3TSOi3DQKzuZJ2BZHRJpTtaVc8iS2o4
 3gNMYcqyTd9eiYYi7ZcD0tAVK7Aropo=
X-Proofpoint-ORIG-GUID: O0nMgPnKKXWYNnCwftofzy-dj0O_imC4
X-Proofpoint-GUID: O0nMgPnKKXWYNnCwftofzy-dj0O_imC4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 suspectscore=0 spamscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050051
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
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

Replace sprintf() by safer snprintf() to format debug
register, silencing -Wdeprecated-declarations produced
by Apple clang 17.0.0.

Use pstrcpy() when no formatting is needed.

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 hw/net/rocker/rocker.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/hw/net/rocker/rocker.c b/hw/net/rocker/rocker.c
index 910dce901b67..aaf447641c86 100644
--- a/hw/net/rocker/rocker.c
+++ b/hw/net/rocker/rocker.c
@@ -910,40 +910,40 @@ static const char *rocker_reg_name(void *opaque, hwaddr addr)
 
         switch (index) {
         case 0:
-            sprintf(ring_name, "cmd");
+            pstrcpy(ring_name, sizeof(ring_name), "cmd");
             break;
         case 1:
-            sprintf(ring_name, "event");
+            pstrcpy(ring_name, sizeof(ring_name), "event");
             break;
         default:
-            sprintf(ring_name, "%s-%d", index % 2 ? "rx" : "tx",
-                    (index - 2) / 2);
+            snprintf(ring_name, sizeof(ring_name), "%s-%d",
+                     index % 2 ? "rx" : "tx", (index - 2) / 2);
         }
 
         switch (offset) {
         case ROCKER_DMA_DESC_ADDR_OFFSET:
-            sprintf(buf, "Ring[%s] ADDR", ring_name);
+            snprintf(buf, sizeof(buf), "Ring[%s] ADDR", ring_name);
             return buf;
         case ROCKER_DMA_DESC_ADDR_OFFSET+4:
-            sprintf(buf, "Ring[%s] ADDR+4", ring_name);
+            snprintf(buf, sizeof(buf), "Ring[%s] ADDR+4", ring_name);
             return buf;
         case ROCKER_DMA_DESC_SIZE_OFFSET:
-            sprintf(buf, "Ring[%s] SIZE", ring_name);
+            snprintf(buf, sizeof(buf), "Ring[%s] SIZE", ring_name);
             return buf;
         case ROCKER_DMA_DESC_HEAD_OFFSET:
-            sprintf(buf, "Ring[%s] HEAD", ring_name);
+            snprintf(buf, sizeof(buf), "Ring[%s] HEAD", ring_name);
             return buf;
         case ROCKER_DMA_DESC_TAIL_OFFSET:
-            sprintf(buf, "Ring[%s] TAIL", ring_name);
+            snprintf(buf, sizeof(buf), "Ring[%s] TAIL", ring_name);
             return buf;
         case ROCKER_DMA_DESC_CTRL_OFFSET:
-            sprintf(buf, "Ring[%s] CTRL", ring_name);
+            snprintf(buf, sizeof(buf), "Ring[%s] CTRL", ring_name);
             return buf;
         case ROCKER_DMA_DESC_CREDITS_OFFSET:
-            sprintf(buf, "Ring[%s] CREDITS", ring_name);
+            snprintf(buf, sizeof(buf), "Ring[%s] CREDITS", ring_name);
             return buf;
         default:
-            sprintf(buf, "Ring[%s] ???", ring_name);
+            snprintf(buf, sizeof(buf), "Ring[%s] ???", ring_name);
             return buf;
         }
     } else {
-- 
2.55.0


