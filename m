Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB5DE606A326
	for <qemu-riscv@archiver.kernel.org>; Thu,  5 Nov 2026 12:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NQw4s0wF;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=caAEns/r
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xOwzI-0004RI-7s; Thu, 05 Nov 2026 07:54:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xOwy7-0003Ez-FZ
 for qemu-riscv@nongnu.org; Thu, 05 Nov 2026 07:53:27 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xOwy5-0005m8-Sf
 for qemu-riscv@nongnu.org; Thu, 05 Nov 2026 07:53:27 -0500
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A59tR35406642
 for <qemu-riscv@nongnu.org>; Thu, 5 Nov 2026 12:53:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 vNx0jZscZB8Ug/Xf1qxtPaJJhN0JMyd4yC5ugrqN8LY=; b=NQw4s0wFF6jWAnRB
 2fC2dUFZ6YxQvdDJX9P1jMzLIyhFL15K1Jl2vBPe8MAKzyNAoXHaiyJEB+QWgnKm
 D1N4rLSYPwHuKIXO2B98v40xOXPkqUVJ6AqFRkK42UOqEBPhefj1QLZEG9IUEKwo
 go2YSuq1kQf63kgHqxFbOBhrNEdeWjy3XTbHlg+0i+uEdwTXTA7zd14OCJ65W5Kq
 L48wZl5KGmDqidhgaO1SWOD/PxAjzw3WZ1i+QiF3U0+wjnptTSIH6WCLXnfwVmGr
 VKhda17tsMC5onZPe179hbvV1waLhfk2DThGAOyychrRDst8hoSwYEwUx5C8jzv9
 DDN97g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrm9v1m4g-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 05 Nov 2026 12:53:14 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-93f2005ce21so331519285a.3
 for <qemu-riscv@nongnu.org>; Thu, 05 Nov 2026 04:53:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1793883193; x=1794487993; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=vNx0jZscZB8Ug/Xf1qxtPaJJhN0JMyd4yC5ugrqN8LY=;
 b=caAEns/r2AkWKh8lXiZM6SztWLMdnhpIzBfQWxvEvyQY1ejusNl37ct7FPB1JDbWFs
 rHNHOj0qGb2haMSFaGANcExH4zFbX6sARA8uKWk1pXKXucyLNE5lsUBkCTnLTXlvWfRG
 GT5U9mUb8n9CKMdXPTR684NgYuD49mEhK1rZ2f6FpY4rtLP/eiVd/jXy5EaDMkLCwLei
 Dvk8n7VVyXymkE8K7IY9ZaVY79gW+vSSUeckP/Vikk3HfPAbo6BuVL1Z2xlqxw4vTvhl
 SmVT5nz3GULyRm6s9WAyRdNS43ALyRdcn1GSfEHR/XCJqnICR72kbwuQbHc2mbsZWH+j
 ITQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793883193; x=1794487993;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=vNx0jZscZB8Ug/Xf1qxtPaJJhN0JMyd4yC5ugrqN8LY=;
 b=GXS/isKpL1zJDRTZQd2NoYo4quxWupUaW8L5eJ0czPuoKQTBsAX5yk++w+abNvFWJP
 FpUxV8TQ5o67sxtiSZgbCCkGWLrbOfH9/9TNPcrcdGO7aRux5Q9x8IR7zAL7z6DR3CKS
 sRMdzCp3CGh6wSv3PTGtpXF2tZaDuTjLsQrAMJC4QhcNlvZ3Lqbn3hspIisxg4zbfyE8
 CR8Gr6WTgoJe1JfVAco15SmXY9D4js+SHDGDdeuKZryNoyOH49hBXfrV+9cdAGEJHJHk
 9Ef8niYU+rc7ZvvEsJSWyWkBrN2EuQji4MEe1Ye7crh+KGfugfDe2/Ht4CjnqjhYiNcv
 +Qsg==
X-Gm-Message-State: APuU4Z+ofZn66wvwpYNPAeHjWDjEzLZh4SGDP9az+40JOXQcZuloeWpS
 9osEWA9KY1tuJ3LaYAxjeaLAOJuvUwtEUqHopRrjv31pv1lasEec5EKrCU5YDVR3HMG57farATF
 MMIteYvpVQhuzdSLGNQwYeuIViXSm69vUFdPA/lLAVnuxS0yZKlO812jajA==
X-Gm-Gg: AYBFou0l9iT/eiW2/UY8hMfTNmxpw5Wu8cxP5O2OBdsWbojPS0C/ST3I4HmYssfPLUT
 gfqo27e4aiOW2uI46G8TqFXaKTYAYdKnhwq7+k/U07BJozFoGmlg58DbeROrw0ZeJG2QrdZtgEY
 3eoXUd3Zb7OGtH3LjWR7IryIM2kAqKJCvyymfqdAyP98TjBXgx+xQhPyTJ0f9SwkCo2Z45G8mhG
 wBuEJevycJlqnHrq7WbVJmFDg3VjXbSU1DSz8adUVfvRNqU44HwL1tU4Jq+8QNj2gP+Ev4+xVkm
 sDtD2tK2nR13IayC2vdiVZhTnCbuhOyXjr51eoP6Eq0UI3wOIIEORjbqBaXozNpR5Bjxif3Fu/o
 nNnYPsU0KkwLe1hwZo1U/6zCVJJegTCaIWBC8hpfuqU8GiJDWzSXO2JlZ9GYLglPkNmjPU1az/+
 f+FaaX7flLVYZKM/T7bXY2eEywFuOi7g==
X-Received: by 2002:a05:620a:3181:b0:944:907:8f64 with SMTP id
 af79cd13be357-9442174703bmr3151287485a.67.1793883193376; 
 Thu, 05 Nov 2026 04:53:13 -0800 (PST)
X-Received: by 2002:a05:620a:3181:b0:944:907:8f64 with SMTP id
 af79cd13be357-9442174703bmr3151284385a.67.1793883192857; 
 Thu, 05 Nov 2026 04:53:12 -0800 (PST)
Received: from localhost.localdomain (104.171.88.92.rev.sfr.net.
 [92.88.171.104]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c4d0e140005sm176780966b.5.2026.11.05.04.53.10
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 05 Nov 2026 04:53:12 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Subject: [PATCH v2 06/17] hw/usb/hcd-ohci: Replace deprecated sprintf() with
 snprintf()
Date: Thu,  5 Nov 2026 13:51:51 +0100
Message-ID: <20261105125203.40320-7-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261105125203.40320-1-philmd@oss.qualcomm.com>
References: <20261105125203.40320-1-philmd@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA1MSBTYWx0ZWRfX2PiifYUx6Gb9
 slDTwW4SSqCc6gJWt552iGBft3yLo9Vj4QuPOvfBjeejAoNzM03S2Jj1ASD0VVh4f2sq5sCt9iR
 efegYMCgpYll4UpLyoYwr0YIKAyv0Ig=
X-Authority-Analysis: v=2.4 cv=KrHYSmWN c=1 sm=1 tr=0 ts=6aec7c3a cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=pBdeej1U2jlWEHTh2vTwjw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=gRCD0AujNZxhkLCY9qcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=zZCYzV9kfG8A:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA1MSBTYWx0ZWRfX0aqENUvV8uvr
 E7dcV3D273GWJYo65GefngRrncbbwvoH4iXyVN6z/1l1Lggy/0Cq3woCIko4gawbnofpvOcuM8r
 8/7Xn5AFmcG1ZkQmkGa3Omw1N51ZBjjqkdqP1MElAd8Ivw3IpBWPf3Lbh5GGFpjeLlHsFUY1g9D
 XY17WGsqT162wR2XpXEQ5wkErU2lKwqVVDbWuo44KmdPXUjfmFHeYKee8K7cuDjNndGhZyOJFTG
 umlvU+YNWUN93NVDAYtDJAJkxvGvTukbM4MMBLVu6RJT6Ve1NweFxMQs2ZRMg1CpedMqObQssOd
 1bqI9x9M4jf0TE8WNjXBTtexbc2rEu9MuApB/E+bTjv/d8rOyi+7gg0TpD+VRjzTu7ITdQM2ZwN
 FK7Eb44ZotrSFdtUmlKUma4lcyHUcgslpDkpzD0LLl+J4djv+grk3ChxL1+R2cVa+Wf2xa+3eVV
 NRU6ASWq4BBFId9Moxw==
X-Proofpoint-GUID: 7QufGX69mkzdUjZEp8fotOxDJ4rNwAQ_
X-Proofpoint-ORIG-GUID: 7QufGX69mkzdUjZEp8fotOxDJ4rNwAQ_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 bulkscore=0 suspectscore=0
 spamscore=0 phishscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050051
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

Replace sprintf() by safer snprintf() to avoid when using
Apple clang 17.0.0 on macOS ARM64:

  ../hw/usb/hcd-ohci.c:875:14: warning: 'sprintf' is deprecated [-Wdeprecated-declarations]

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 hw/usb/hcd-ohci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/usb/hcd-ohci.c b/hw/usb/hcd-ohci.c
index 4d38150a8458..d9fcee6c0b4b 100644
--- a/hw/usb/hcd-ohci.c
+++ b/hw/usb/hcd-ohci.c
@@ -872,7 +872,7 @@ static void ohci_td_pkt(const char *msg, const uint8_t *buf, size_t len)
             break;
         }
 
-        p += sprintf(p, " %.2x", buf[i]);
+        p += snprintf(p, tmp + sizeof(tmp) - p, " %.2x", buf[i]);
     }
 }
 
-- 
2.55.0


