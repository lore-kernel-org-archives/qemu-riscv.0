Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C691C5DF6D
	for <qemu-riscv@archiver.kernel.org>; Sun, 16 Aug 2026 15:09:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wvcUL-0001jx-Jp; Sun, 16 Aug 2026 11:09:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wvcU8-0001i0-Ha
 for qemu-riscv@nongnu.org; Sun, 16 Aug 2026 11:09:17 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wvcU6-0003zs-6o
 for qemu-riscv@nongnu.org; Sun, 16 Aug 2026 11:09:16 -0400
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67GDkqtA3609544
 for <qemu-riscv@nongnu.org>; Sun, 16 Aug 2026 15:09:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Jb0UemLD4VBI160vsDqlAn7wGpxKJ+kZdQfp3oLDiH8=; b=NhoBJ7dJDf5ycTCf
 xwGJG9E1XuLz+mg9u9zmFO7OLjEV8o8nvMfkJ/zsDrSJk4aAVho6/j19YEQksxSq
 gk0QJ7SQwIqSB51OovTmaaTW7Grj41G+YeTIHosM/7EGj2snSJV3bJjWp13raFyW
 IVyqwys7mMMa0Z14cO/p0WJA6dVyjCDEleIqZrD/cmVjSuKeFu8cJxaCc7DaioAq
 XKyYz00R7bWS4+31MviJz/9fOwrGVLDp9V+OcnOUVYCQzfCe7JxSWjEZCKlRtNAE
 2RrcJ1Gh4af6Wba2kFZ+5+B1opSCV/PcKCXwvj3Ioy1buNn0B+4GZ+lb+VI43/jU
 Aq4I4w==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g2ghfum85-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Sun, 16 Aug 2026 15:09:12 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-51a8b0a08d2so20494461cf.0
 for <qemu-riscv@nongnu.org>; Sun, 16 Aug 2026 08:09:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1786892951; x=1787497751; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=Jb0UemLD4VBI160vsDqlAn7wGpxKJ+kZdQfp3oLDiH8=;
 b=S7HTh9TpppK5fsN2d2ttZcKiWhO7qnpr0Les3gmtNPFOGS1NXrQAdo+uVCgJQ1MPdg
 PEJzt2NFyJt3/dIsc29s+vKR/zn70K3vOHyk8dBDnWPum9GXFQu1KVMbgBr68aPCIBz7
 1KDVSicemkC/vQKS8o5YTRrYvYJmskSmaX9sbNCsQz49krga0al4KbcEwJBZlZQHtNbg
 kPKgMjWhrDgBqOEnCZxye/AN04cBTrI6dZFVivrtsIrj1wsCrKNi+rfyIxx8t2Kf0zvo
 jaCX5jumPbyyZZp9x30NGpvW6oARoJiAB9Y1I0GWMQR5Vp+Y1aIN13dE1fG3RLadGKYz
 8bhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786892951; x=1787497751;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Jb0UemLD4VBI160vsDqlAn7wGpxKJ+kZdQfp3oLDiH8=;
 b=JH4H7fPKag20CpmZ45u/7fp+WsnQ8ZgqosZoTvdMiPvdD9iYGQz4zSgwEOQ3j3AVDu
 i7MnIDwc2PNzMi4KomN60goWMJaRG2mFd2ssLbGWTGIH9uYqZO+ooR28gzK9coh/D+Bo
 sNPS8/uS+bSnKzjVUvAsYXq6niC0yLyfzA00qLDjHHdtsI+ATbxcgHc/IKjMZCHevYQC
 I5rgiTbUGTrbnxXdsWAW/E+jmYkDK2gYW/vYey/mr/l42xu03o+mlTX9Pr/khqzzIllL
 HJMirJmhMYuX0aCwc2VYeDlms5vvQB6JGCQ/uXNDtiIbqMys10vlpNTiHxjFD/dYa4ez
 56XA==
X-Forwarded-Encrypted: i=1;
 AHgh+RogXC/3d3twi2HdWQJbwu3V6gu3kiuI1EUcKBFq8oroh80nUSamuXsJ6Ug78zpv3IcgovumiKH7/BdE@nongnu.org
X-Gm-Message-State: AOJu0YwuCe1uc4c1XB7e9IMnalEr+4fZa2IWhnZzvNAQDZgp9dEYS3kI
 aBXHsmdjZ6YCZnKUyABnt5wx6blPA6NtYgHFiyq/RFQoa7hyFZQ1ndyeUiyiuE9+CYzLH0bhcbf
 RCAcDUyYzJC2wBst14I1L/MeiAodcIorGm03l0v+n0rCTQVmTNJmWCcYhYw==
X-Gm-Gg: AR+sD122ZZjPFDQ2X0PsVjeZueUvNa2IfbkSQigR0h1eYjtLX37R1x5/QhovGYXOCcY
 VAOMebnhpSt91EVKaVRHX5MV7V+cKPM+3N0oRzU1pSMk7OpxtEUik4n+w0GzySmxsQ3TrHFfpZH
 pwzDFC2rflIQIUhGT9hVc9UHjJaMit+N4Iie4x3UtnFUbAcvPrTwJN9Qdq0SkjVSCF1uNuKpW0W
 9o2AVSANisVmxlb6Rq5W59psR6g61w5OW+XK/phS5qTKoA8aYVR5oHobvyWsiCOobXGh3FOlD5r
 kVAepUfj8lsWBdMKpUzs/40S2DFiMeB4cTql0P7bGofvrzJEQiAHUupJo7SD2wwmiLwEDdOFY4v
 TiMMS5qIbri55srFBwOKVm2XEJSO5+4jqMv4=
X-Received: by 2002:ac8:6f09:0:b0:52d:7b2a:938 with SMTP id
 d75a77b69052e-52d85382d28mr222701271cf.6.1786892951236; 
 Sun, 16 Aug 2026 08:09:11 -0700 (PDT)
X-Received: by 2002:ac8:6f09:0:b0:52d:7b2a:938 with SMTP id
 d75a77b69052e-52d85382d28mr222700391cf.6.1786892950763; 
 Sun, 16 Aug 2026 08:09:10 -0700 (PDT)
Received: from [192.168.69.229] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4999610e381sm74432945e9.9.2026.08.16.08.09.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 16 Aug 2026 08:09:10 -0700 (PDT)
Message-ID: <9ab471ab-db11-4da0-ac68-bedfe5a7012b@oss.qualcomm.com>
Date: Sun, 16 Aug 2026 17:09:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 14/18] target/riscv: Return bool from pmp_is_in_range
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-riscv@nongnu.org
References: <20260815203730.1468365-1-richard.henderson@linaro.org>
 <20260815203730.1468365-15-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260815203730.1468365-15-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE2MDEyMSBTYWx0ZWRfX8WXIZfWmvZOU
 hn9tyhKW6akDYIWFGdngc9yAAoJG4FuTSShJrNAsK1wG6JQ3zVVGHB2/LUjouWSVHBG9TqBSDxz
 JNQcR+gJGHenaRsVyKt3K6Kf8GLC93g=
X-Proofpoint-ORIG-GUID: P9W5KXPfwhRontvyPaaz5KWit2ozt9Wq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE2MDEyMSBTYWx0ZWRfX3qJo9HcLvDrV
 S8H9Fl9y7oHquPdkxPAOzMYhxClDZywbXd/sCmriClXl6HkfsY734u+1Divv7jHu3W0cIEnxgP9
 YFCFz3BC878+Qo8sQ8d7RwoX3C2iQ+4JIt29VTUBlox+HK8zm/nzWVKesbWMV48TXZ7UU40ETIn
 sOcr7MUyDuMJgIoZt1GVZWvKgUjWOp8dgxlD8x4/mmTglPdbuYesLRSkujpSRW4z8ZvUF4RUbj9
 WegfLKEc2Smnfr7UhlisSenr2HYhB0Ygf8kk4wRExSm5YXwIemar9ISlD1KOmlAZKsQC5Kt6HU6
 U+SajqpP3qs24J8eobIzXlcIkfU+mukjfjDxDs/9BG9k+sO9NSNTlWl3NZNygsVNzBQ/8Qu3hyY
 Ldh91jQh2A6NBl0mP7TAhEe/04Tq+22HxIj9ErQgRGdVzIk0qI0wt6KfU3byEZ4AJUw7B2IlCNV
 FDc/+IwCi1DBnc4kKwQ==
X-Authority-Analysis: v=2.4 cv=TMJ1jVla c=1 sm=1 tr=0 ts=6a81d298 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=1tSEMpTH9XP_W59IOagA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=F4whdlzREtsA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: P9W5KXPfwhRontvyPaaz5KWit2ozt9Wq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-16_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 phishscore=0 clxscore=1015 bulkscore=0
 spamscore=0 suspectscore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608160121
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

On 15/8/26 22:37, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/riscv/tcg/pmp.c | 21 ++++++---------------
>   1 file changed, 6 insertions(+), 15 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

