Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EB47CD98C7
	for <qemu-riscv@archiver.kernel.org>; Thu, 11 Jun 2026 16:22:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wXiAv-0001mN-1o; Thu, 11 Jun 2026 12:22:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wXiAt-0001mA-7o
 for qemu-riscv@nongnu.org; Thu, 11 Jun 2026 12:22:35 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wXiAr-0006ZQ-C7
 for qemu-riscv@nongnu.org; Thu, 11 Jun 2026 12:22:34 -0400
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65BEroLK923013
 for <qemu-riscv@nongnu.org>; Thu, 11 Jun 2026 16:22:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=M5qTzV+flpGhSX5RyOdBUPL1/rjE6dooWys
 3uXVSKeA=; b=hDnhxDGt9Jr8+1GinlncO8INTLe2GvZqhUrOerUQ5tAZFDnq9ke
 vbdLwlNCDTtg3vAVw35AlnPgBg9KfisckUJUIDURss9mqkc/Ij16Atkl+F0XEaMR
 lmpzWw6rqWZI7EaqzJNHiICs+UYkmUcDVJ99cY7rmU02H4EU4p5I1U5j2PfuwNL9
 Kh/ZDEXHlG9RI2QzSPheaHTNE0OARpgJ2s45caZUJuD/cLxi0z97LN82u+qZL9gE
 AnRSIKHWbXXJf21zD0aClA6YtnknGDiClbCCxcX/V+QW7cCnP5YuGgMelkXEqKql
 0gTKnpAv4GhukYc+xtOGmsP5e3qFZrjwdlw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe71mgxg-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 11 Jun 2026 16:22:32 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-8ccd77414afso797206d6.3
 for <qemu-riscv@nongnu.org>; Thu, 11 Jun 2026 09:22:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1781194951; x=1781799751; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=M5qTzV+flpGhSX5RyOdBUPL1/rjE6dooWys3uXVSKeA=;
 b=jzephUHuIOGC1stgB1rNXFk41yWpB5d2b9jLeR82K4P9YznAujdi/e31HbGrmqAvBO
 xA0/8xko0zBNoTEIOILLubVt7yCz8Foi2d+50HQyc0kQT2/4p62JipCbJc7KUG7aAG/W
 ecGWDVmIRZTgn1H8QhQA2sr4Oc6CwnytiFp7wIQAJ8l7wEXBQWSqTBDomgd+YDEjuhY+
 yyAfF6A4AGprk61CyX54VxdoJUfKo4tn0cNDhM9xM/P6NwUlWWstX70+0x2fzp8zJsLf
 quFh73OmFk2G1LhZGkprYqu/3PS7dHM+SVFFXJRRwFQ7xczfRuvrwmq5+AFE0112ykfR
 cXFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781194951; x=1781799751;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=M5qTzV+flpGhSX5RyOdBUPL1/rjE6dooWys3uXVSKeA=;
 b=PYooIE+xGHeRtnxaY8t4TfQlGA3ljK01g/J5ZXGk0ztxqQyX3CvfXvuQ6Jk612togO
 TLFdBtXe4tNVD3Q4EaZQjJDxkmIR3qVYX44BIGeLTYprdZdla/KucVi1Suh7l+NvZzvZ
 D/ZPlulBs+Cqww3+CC8wgIvD8NyhQwIOMu4rT7OP6wpE9twojRp9nBt58B0batKlA5YX
 75FspP6vt8oQer4RWQVWRzj+LoEEhP87uQbMibLa8d+2Firnaa3PweloTaYyoRWnR/EV
 aq6RSo72gH3ilJ/w/cz/TWyoDAd79RMe7YnKJA2vPIEUVofrroV7PZUybNlBV+hHKb0l
 1ryg==
X-Gm-Message-State: AOJu0YyaJfnJ7SNOYKlJLX+MozUYucuCuwhl+I+5lSKRLeisLQIVEjmT
 cKX2BGWLN1SYu9Tw6GRpj69UfCurv0dVsBjEZALqRpH7WnH8N13sgQVhgdFP1mwjjx3bvZ+HMy2
 MqTAo7ZtvhiS54KrhwMxIkGcEa6FQvpD42MVxs2TPLzgAS8mwrWy96wKUPw==
X-Gm-Gg: Acq92OGOh+pZJEBDyTdFTOB0195sbmwj2OECxJW6qnMdvrmIoxtdt/HRw/NwFIUl/9E
 jt1O5uG7kQLk9gka6ya5T5fd7QdHAxvAjZ4UIWBRSFOdGR62pnZT6JtiqgkRJ3dgCMYjbKG4bkp
 1nALKJo1IKLq2+sUTnMfCc4Ct97yoCr2yrOsUyM8/Rv/Wfr5Mq0Wx/3C6qb56ZF5mFjLhy2u8W4
 QkBWegQ72KpurkFXaU0sl3M03FtFRcvRfn1d4uZCSOQw0m5crq5zvtq/E34YtOrWN+CRCvc2niH
 BOme5mLlvddFNqLYN/tbxRIUu/D17JkWNA+fk+tj+qVDbTA+9HMGKLL4g/1tWKvJALNBNWGO2A0
 1gpCZ29H6oM4lRBDaVrwiVmB9+1Uc7h8hEf4HZJX5vntpTdb8GJ59SC5q4IE=
X-Received: by 2002:a05:6214:20a5:b0:8cc:e6fe:c77 with SMTP id
 6a1803df08f44-8d1d8246c61mr52256396d6.7.1781194951255; 
 Thu, 11 Jun 2026 09:22:31 -0700 (PDT)
X-Received: by 2002:a05:6214:20a5:b0:8cc:e6fe:c77 with SMTP id
 6a1803df08f44-8d1d8246c61mr52255656d6.7.1781194950649; 
 Thu, 11 Jun 2026 09:22:30 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([177.170.117.62])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8d1eadaea6asm21879526d6.40.2026.06.11.09.22.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jun 2026 09:22:30 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Subject: [PATCH 0/2] target/riscv/cpu.c: satp-mode=bare changes
Date: Thu, 11 Jun 2026 13:22:21 -0300
Message-ID: <20260611162223.2361941-1-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: VgC80cqIucy61xARyOzyJGSVdkybM6fc
X-Proofpoint-GUID: VgC80cqIucy61xARyOzyJGSVdkybM6fc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDE2NCBTYWx0ZWRfX+4LLtqfESUee
 Qo7KUKWhVNruJ67eDJcPZFHiwjYREKQJkaG1sX3OZ0WvoqNkvs3KqFRjaItZNzBoDZmMU2ePHAa
 UWfEfPMe5HvDYTF1E8VJQYEMwjtWEJH04FUyN6BY5HjBwcb4pmIbZvgiW+Z1658lnQaThQQhLCq
 YovYyV9iyWTguovMPCOGfmGSW+VilzBRJuabo0pLdJdt1eHerhw40/iN9G6dUahitPJVaTOaF04
 7jk5zAPpLK5PNNVOBFGov86Dpi+4g37xndr6oHUo5o0Z2j4QyhcL36B9ozHxvX69RPxgtPIKgTs
 EufW+iNLiRNO5qzjVjxaI5OxC0oh5lumUDBz9G+kWYtCxm0i0FPwkQ1y0TY34cDH2bzIqfDFqh5
 90f8kUHn4KgIq8AKEW7oxDDM2F7YOSL5WYtkiUDa+ZfIzOpKozwHRDDTBzJ5ymfY2RNidk9cqgs
 if8EUkTa/cFKcR64Guw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDE2NCBTYWx0ZWRfX8nzQHj2r66eo
 SWc9bM6f74Ip1mngsjhwXtXlHCh0dgGHk64xqL5Z73ZxQwjx4rRU/I8drbFFXkKQZAZe4ISyTTo
 TEdVTMpBBsmceq5d7xR8xwspF2X7cIc=
X-Authority-Analysis: v=2.4 cv=Lf0MLDfi c=1 sm=1 tr=0 ts=6a2ae0c8 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=gdiugJE53z4H+vvYeRBHqw==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=BzRXYrBwBYCcU0ehAu8A:9
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_03,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 phishscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110164
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=daniel.barboza@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
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

Greetings,

Here are two mostly trivial patches related to satp-mode=bare support.

Patches based on alistair/riscv-to-apply.next.


Daniel Henrique Barboza (2):
  target/riscv/cpu.c: add 'svbare' satp-mode
  target/riscv/cpu.c: do not default to svbare for bare CPUs

 target/riscv/cpu.c | 25 +++++--------------------
 1 file changed, 5 insertions(+), 20 deletions(-)

-- 
2.43.0


