Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 600FBC5AD55
	for <qemu-riscv@archiver.kernel.org>; Mon, 10 Aug 2026 02:50:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wtG67-0001wZ-0M; Sun, 09 Aug 2026 22:50:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wtG65-0001wJ-6F
 for qemu-riscv@nongnu.org; Sun, 09 Aug 2026 22:50:41 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wtG63-0004IH-PT
 for qemu-riscv@nongnu.org; Sun, 09 Aug 2026 22:50:40 -0400
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 679L6grq3498180
 for <qemu-riscv@nongnu.org>; Mon, 10 Aug 2026 02:50:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 C6xF23wMtECyPlsnD3UlBE4sXpoxGuyNvv6jP8X2eaQ=; b=kfxh7UD0GeHHHWje
 3YgfOuBVBuvLOjtL9MobY0IAJxz3bK39REvvxva3N4cQOajZDZoVboZGu1UxHOhY
 SztBQzaAWfF/EQ9/fXuu3Zd8tx08ejBjA/PDg6k7/+mlM0DRGKxuyVzFZhvLwuLp
 rh0OXGlbuDTXLqoU6vqZ8ftN+U0VFHUxPCxcfg8uycBIVrQCdc/RQ+JRJOisOVLi
 PZexp/dJO22ViEQu+Zj9AGlyarm0V4UWxbUCaWR/LeoFb+8EJeDJxVw9H9Ghm8qn
 Psk1GLMAqIhbwhLZ4PQEquR0Q25ScjL4FsZUUZ2eW2JlZMbGnVzHrtQ7kQmPA7eO
 VStTEA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fwvu8m2t3-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 10 Aug 2026 02:50:37 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-51c1d7886cdso28694831cf.1
 for <qemu-riscv@nongnu.org>; Sun, 09 Aug 2026 19:50:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1786330237; x=1786935037; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=C6xF23wMtECyPlsnD3UlBE4sXpoxGuyNvv6jP8X2eaQ=;
 b=f2p2Lhhwe4K0Us3Z7VMKxh90AHDHLoAoKXQ4dcQkRoj1GmoRCJ3ufKDrbKdt5jfMMM
 KApGr+SSii7/p+8HKcK3+4Mdd0aZH0C1MbCL3KNY+5fMNxg16MGzbObzIFSaMyeGWGqs
 TpCitOIlElWUDkl48mKPIbQlwM4Oja8Jwn8JtO2TZCrvO0sU1oJMA/+HH8b68W32tx2G
 dLdp1K7CIbfu//DZom3TElcASzI/ovqsF1CVcxzhHynfM4G1UNXogIn0NmJEduclhUwv
 miQtfpXzPa+zdTLE8elUbZihwxB80d+PKt9y3BduT2E2D2wwEay1e4r6e3dd9oNdVcR+
 salQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786330237; x=1786935037;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=C6xF23wMtECyPlsnD3UlBE4sXpoxGuyNvv6jP8X2eaQ=;
 b=Krfzvxx7yvGgxNzrGbAx+6om2I2MDrzy8rcaaASiglxgPJCyFEUvawrCOfLknR8mYV
 FkoNSJa4mf3/e/l88dt0GZJhaw9y9tzgGAfh8wV3p8s/vQGOW5qwueJQhuPm0wBn9cXv
 1qJ1s1fJ3760VLrapcbphSJezvSyOBMZxgplClvxzkyAVzMrktJhtYRBs9iUqlZfSZr2
 yFA+MYXYvCJrmgESflGo0uVo3lQbMhpndm0OzAt6Av4H1d3NoJPwxiGxDQR0QuuCRIs5
 8R+wIkvPmYGoa044FIZMPB7EbX+j8mHxPlmgI3bOKFKrtGm9GDKBF8okujxaD0j0sDjU
 JSbA==
X-Forwarded-Encrypted: i=1;
 AHgh+RqeICm2yEZmGp1JJ8AwTAXItx1/jYic/gTWp6XQorWuSbDEcmljTDTGbwk0/wRSEBejsM75fNAcx6mb@nongnu.org
X-Gm-Message-State: AOJu0Yz5HgM0B/PC9nZdyUQzmvOo3DDFqlAvGpq+9FVuZux5L2c0bErT
 Yp+h/xJAsbSTD3ZwVrNfPuyAizFeMw39t6C+IT4f5+vjMW6VSW7cs3al2t7jikRP4YpfzgEY6td
 GEYgvHqHTV0hnGtXRsew0aI34sQjkxVpke8AMsCwRXVf4bSXUV6DvQehzjg==
X-Gm-Gg: AR+sD10yDTgUQ1KxtgRKhvcmFxSbFWWEaD0LNuHerqoebbwQ4K0l8Af/foPgYk8i7LR
 s3X25XMqbZ0Lq1OiEXV9HxDIG5WY4NTMGbcjE2OpP1wfNjWizJUBJMQkOgp0F39+Zochkq78/Gq
 5+NQpss+/RhcdBmQ08IpSPBun0b4FCIbuuZqJXiSjUVti1mjSJjclzgOFJCTj9Pc5oMsDzBIdC3
 3sCVy8oJo8ioK1YIcuhEv9NNpoEvvcTaZoEoSgIFJI2Dpj2ODnptEYR3ONZWe1BYWG5qSM9nQLq
 3up0l8guJJ2qsfmJTlWHbhXXfDEHr3DNTVBC4FHdKw4o/O5nYRv5IMy0SlaTasaqKc5drVn6xvB
 8bARJwGm2mBk0A+LHiAinwf86zJSdCqphWdo=
X-Received: by 2002:a05:622a:6815:10b0:52d:2e0a:8ca0 with SMTP id
 d75a77b69052e-52d2e0a8d4cmr76268581cf.36.1786330237319; 
 Sun, 09 Aug 2026 19:50:37 -0700 (PDT)
X-Received: by 2002:a05:622a:6815:10b0:52d:2e0a:8ca0 with SMTP id
 d75a77b69052e-52d2e0a8d4cmr76268421cf.36.1786330236968; 
 Sun, 09 Aug 2026 19:50:36 -0700 (PDT)
Received: from [192.168.69.229] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4995c69c8ffsm197214915e9.2.2026.08.09.19.50.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 09 Aug 2026 19:50:35 -0700 (PDT)
Message-ID: <ea434114-130b-4412-90fd-2e199e8d8d76@oss.qualcomm.com>
Date: Mon, 10 Aug 2026 04:50:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/9] target/loongarch: Enable disassembly via capstone
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: 17746591750@163.com, laurent@vivier.eu, philmd@mailo.com,
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
References: <20260809013343.664966-1-richard.henderson@linaro.org>
 <20260809013343.664966-7-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260809013343.664966-7-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: q0tBTfQin6kpQOhaAKGe5G5BznAP6kf2
X-Authority-Analysis: v=2.4 cv=M8p97Sws c=1 sm=1 tr=0 ts=6a793c7d cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=1tSEMpTH9XP_W59IOagA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=F4whdlzREtsA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: q0tBTfQin6kpQOhaAKGe5G5BznAP6kf2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDAyMiBTYWx0ZWRfX9JUPQVemIG5t
 AfIctGRRrjsdb3rzzvf+WRYiP0mNQi4aLO9+YUD0l5wBJKroZGDxtDAu15DuKTnwkTW4Z80NgNO
 zl3xTkK6hoKuZGKfk8xT9qeUItg4DI6BcZzE9yxIdwaTE+/avCr2jeEm67oSdH8C+Q0TZmIxYFZ
 /SM8QKfuzcSBt2mRM2XprY2HDkV+uNuvNFF/p0P78SNDfoy5dbfMAcCO46FYcao3zwUg17IN7PU
 C+JIHgK4URcmSV8T4rrDkGLQtt3hR2ZYUpzxDh6XiskV1c7iQQEweyFYH6JFzOMG9aO2WnbUPOe
 m0krrtPck5Qr/pcyzGBl075jMDiMAE1EasHeD36NdwwDOlXxLHyDYPYEDXI134UXA+C5zpavRgx
 ikLeqsHGvUZ7nXTvyXp8yOOhc+w32STr1Tmd17YCyAlNXmcYPS0ACzW3i5/HH0jHYX4dvo2iqlE
 N3i/QhIzAFf2OIQep9g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDAyMiBTYWx0ZWRfXwt2iK+jSLpdK
 uY0jN8OufZqamBpkXZumwz/fGpE7GNmZKY+tHK5KCuMzzdx4ZqTd/IO1u8wE+nhRmXjieS9zItS
 vlHY7kbjo/xZI9wcROZv/ZfrZu05WNA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-09_07,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 impostorscore=0 adultscore=0 bulkscore=0 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608100022
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

On 9/8/26 03:33, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   include/disas/capstone.h | 6 ++++++
>   target/loongarch/cpu.c   | 8 ++++++++
>   2 files changed, 14 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

