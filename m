Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04C0EC5AD5A
	for <qemu-riscv@archiver.kernel.org>; Mon, 10 Aug 2026 02:39:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wtFud-0006hy-7q; Sun, 09 Aug 2026 22:38:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wtFuZ-0006hF-7e
 for qemu-riscv@nongnu.org; Sun, 09 Aug 2026 22:38:48 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wtFuX-0002kz-0S
 for qemu-riscv@nongnu.org; Sun, 09 Aug 2026 22:38:47 -0400
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 679L7SsD3835239
 for <qemu-riscv@nongnu.org>; Mon, 10 Aug 2026 02:38:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 s1yY533yzyHTN39oX1JItBjyZP91Mpjs49d9m9Z0hYk=; b=mQqfaSc4FSAdvB61
 v7qymK/M0pLmoLO5FAcPlzGf6QYYsdfila9WEzGVS9UcyTLRV4/uRp+mC0J354IL
 pmY/D8wNedT0EOqwVXPlblFuhLS5d4yZdssX/3Zc4hE1SNdXuTzJpOMlLKRL0uA+
 KdL8G3GhLWIkXfbywlTkONPhGx9uqo+JrCAgDynfvhYCSsgAQ7nJpPq0QHjAJB06
 zheO+gU7iG/OM3XinGHGLpZ8IKxQO4b28SPr99t8dit3UwO/ori8DUno9zam+Qlc
 PemxzCnOLJMTM9yvaGz+k0JVj+qPn1lJHsOMW4/4zNWr4ni6MJeSTIrs72mbDaX0
 Loscbw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fwvp1m0eu-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 10 Aug 2026 02:38:43 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-52769fc3f2eso19931821cf.0
 for <qemu-riscv@nongnu.org>; Sun, 09 Aug 2026 19:38:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1786329522; x=1786934322; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=s1yY533yzyHTN39oX1JItBjyZP91Mpjs49d9m9Z0hYk=;
 b=AO4FD5uUuQn7mcfS1qfXSgrtRFHclAb9suMeFNB+FjgwpRYGnWlEpW9SCv6QOACdwq
 FNQRW/asKFYQy2RN7F58rnDzglKWekRCrTVLJdlZ4ygSQPZSImTz4GDCNFZEuDHaubYQ
 L1qeYL7d6wIsOHczV5x9KdcnusubC/BbnpHyLga0mYnfqEyEFfkJHevHzXUnmAiHyU/b
 jv29B4BmHbR3qNW1BjCz4ZeT/ThTEId4vcmjRo8BNcJ88jr0ad7XHUlJLHKpKVg8dkId
 dL4zEIlZN3eCesauE20pBxYBow8Zh8zRmzOgZ2ipRAYHfwBSvM6Srp5dPC1kiw4DC/go
 rCNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786329522; x=1786934322;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=s1yY533yzyHTN39oX1JItBjyZP91Mpjs49d9m9Z0hYk=;
 b=UVoFfrdOEkP1A+6/PMEcmsVtShFEg8bbN04W4lbkhxyYiuR+xDZRsKnXh6RjF3JJ9q
 yvHnzUG/CU84nRMLmAFvKNoiD/DfawGtUvGDajX1CofiDStxc23BZx+57OHSP1bqpNBi
 nVGBNRLuSjfaoXu2I1H8qFqSdrqSuU9EsapswXzS6e9Gj0gJItfFMTvq9OwnmiJ41kJ6
 Sz0Rn0Q7xD+lA6OSSYvzghULDtfzNh8X8VyDcV02Fz/tyZIQLLv5KjB7dRYcrXo3Z7TX
 vjRwjvjS281zBcY9bheID5c+jyicci6zYAKkH+qTSMl7HGecXLAG/KzScybecmxEmDKM
 iRCA==
X-Forwarded-Encrypted: i=1;
 AHgh+Rqtf0F8J3fbc51BKCJRPQe75pp/TP230eT/A48cifIYz9P0o8V0lAPhELbK/loTBucrvefazBLlSj4g@nongnu.org
X-Gm-Message-State: AOJu0YzVJE+6b8aBgwh/vRJsmwBt2V4wDN08hwHpMLtZbUtuMtmoknqg
 1xh0Ain9bj8I/0TYkYaLYuuRWTF/s9b7/+PLsBWoffazrfwpxQgHE8x0Soy77jG0HAsKCn9yha9
 epc5dr6busPY8PuL9WfY98qtRnTFxGb/qud0MX/k+xcMbSfLb4z8uorNqKw==
X-Gm-Gg: AR+sD11188Nmvmy3mL+1S1++VX4vr0NEeBLlgwbTRiEF2KM+ecUdvuwheIOp7ii2Isx
 tbD5FZ0WK8+ZKxsoPMLO3OmS0DxMAAsnY9u3iNtyHJ+4Sg3jZJg9kRy5a234bmuJhgUnDIHJtDb
 tab+f6oJoE9JApPNYI8OAGxEtuGBIFO3gy27Ku7XLKFcMckLkdBSy1Dx8osW62V0JgWUiloa39S
 R5zvfbNR15hR88mK19tBbWDNIdlkQH3kgFnJeql5ZbrhTH+2s6PXmQzrQdLf5Z2KB5UR6S3s9L5
 EATkYb56qYVWy+JR4bzQ6CbdOFHq5LJNIKv3S6VAC5fc1MKMIqMlBellRP0+DKArg3YQb9dCvDV
 QtqSlHtN1it82hI9rxmw6gjx0aVdGLq++vF0=
X-Received: by 2002:a05:622a:88:b0:51c:1529:2c0 with SMTP id
 d75a77b69052e-52ce620aa60mr347625001cf.43.1786329522424; 
 Sun, 09 Aug 2026 19:38:42 -0700 (PDT)
X-Received: by 2002:a05:622a:88:b0:51c:1529:2c0 with SMTP id
 d75a77b69052e-52ce620aa60mr347624801cf.43.1786329522076; 
 Sun, 09 Aug 2026 19:38:42 -0700 (PDT)
Received: from [192.168.69.229] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-480021506cbsm30467105f8f.14.2026.08.09.19.38.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 09 Aug 2026 19:38:41 -0700 (PDT)
Message-ID: <035d2d29-9493-41ef-b028-c08d22aca30a@oss.qualcomm.com>
Date: Mon, 10 Aug 2026 04:38:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/9] target/tricore: Enable disassembly via capstone
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: 17746591750@163.com, laurent@vivier.eu, philmd@mailo.com,
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
References: <20260809013343.664966-1-richard.henderson@linaro.org>
 <20260809013343.664966-6-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260809013343.664966-6-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDAyMSBTYWx0ZWRfX1l8tjuOl8jz6
 yVS73Wr073i+fgBQEtnITA4y8v6q7pncocXJKruR/KYV7tkgdfrk4LOgi4TvosyKOZ8h0e0XUgo
 m36IxNySbE20eVhhS9X92tWn6A3wpqMu0Dv25V3yv0ffPlwjJJqmP5bwUOMR3zJEUNKtz/XM03U
 bqCIEGVTGE5Sb8UpPvZ+SmmIlbYPhoDTL4XobhMGPpgTlkVIaM3lQpRld7wmf4NkizPSmMgxDHX
 21JUiXWULKM3XBh2x5R2/6mEvZE9czI9hBKIdoyw9WpM+v39k52PMmcpOXZmjVSpFf1wdtj5+Uc
 JqVSZSB6UqACanrKQHHSQ4kvK1/qXt8qYw+bzHp+DuoMZhsSJWipZOFDFmpE3hoeJvGOgdIQquD
 ZpANiXpEz0KVyzCBU6DLrXcwRrhO4ZjkoXL3wIwqvxPLxmeLuUaiApartgEj+28eon8zJidW0Wv
 vAwxadOElBgU4IbFJrg==
X-Proofpoint-GUID: H9cFblL1-hxefUcGKPROsmWe3Eh1T78k
X-Proofpoint-ORIG-GUID: H9cFblL1-hxefUcGKPROsmWe3Eh1T78k
X-Authority-Analysis: v=2.4 cv=ebgNubEH c=1 sm=1 tr=0 ts=6a7939b3 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=1tSEMpTH9XP_W59IOagA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDAyMSBTYWx0ZWRfX3b9XFaX6RzcP
 +o0fL3QGpi4c0pFBqzpOymhZG4apyTNPUUcyYv1HSYDJJS1vamsfyrwf+MfEy35ErFtPX+XizYF
 nKOudvTZnhK2k0nvfjb/TzJO0vlinMQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-09_07,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1015 adultscore=0 phishscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100021
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

On 9/8/26 03:33, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   include/disas/capstone.h | 11 +++++++++++
>   target/tricore/cpu.c     | 31 +++++++++++++++++++++++++++++++
>   2 files changed, 42 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

