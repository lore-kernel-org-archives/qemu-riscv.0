Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B619ACD4F54
	for <qemu-riscv@archiver.kernel.org>; Thu, 28 May 2026 19:35:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wSgVK-0001BR-CH; Thu, 28 May 2026 15:34:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wSgVI-0001AU-FE
 for qemu-riscv@nongnu.org; Thu, 28 May 2026 15:34:52 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wSgVG-00048x-UN
 for qemu-riscv@nongnu.org; Thu, 28 May 2026 15:34:52 -0400
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 64SHENw61469570
 for <qemu-riscv@nongnu.org>; Thu, 28 May 2026 19:34:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 1/I4u5xzTdL/Xg8iJLQXX5JeYjnoJH3C01m6gStYZ5c=; b=gvE83P4ZpB1LI+z0
 bTw+gHsU7c0XPxnN4yIRKpP1tg5hQtq2CzwBixRBc6Ky9KAbIT3nHdHl2orvNxB7
 ObBXmgZNloiGvV+IsvVbGEHKXo5D2JPIhPfIZ9zWyxG/d3NlMdymwRsGfer/5pI1
 LN1FfpPJBi4PaV8s469O1hFEYiYJJX9rxHOmYq7byzr0QRgdHKTVbJbw4JtRgirI
 gOBeTM83UAKSLXIflATkFvNJy9QQIwlo57ebNyHe82dKpsBNRQBG2/m3rNq+YASi
 AtmbdlYKI7jXR9t6tp9nlrkxFqsPK50vO+51D6iRHeIc4QXl4TmxN/ZItnzgEQBz
 b5d5Ng==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com
 [74.125.82.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eesxa8mnx-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 28 May 2026 19:34:49 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id
 5a478bee46e88-304d8e9563eso2758732eec.0
 for <qemu-riscv@nongnu.org>; Thu, 28 May 2026 12:34:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1779996888; x=1780601688; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1/I4u5xzTdL/Xg8iJLQXX5JeYjnoJH3C01m6gStYZ5c=;
 b=GNT5SBaA7c+zcd94xWGJRZUKgeHT+x20JZOMmjbs/fdp4SRXK4srSWyNQx0ROe4Aag
 W92VrF9CUhMe4rSGHMDDv39D4RrDbzcNPiMMErOnQPq3X5xtgSDKa0St55GRaOXRx37b
 AEygSygu9DKk0+5JyEx0k53bSFZhprd1nen9kdc1GgoJzpIGh7V63WTz7TuoX/ATNJnE
 7lfVYhaYT9+h9BAj4vaUVpABAkEokSdo9xPsYHPlIMLka3j9fEX8ZnIJ2eIxgwUqyQc0
 IAEF/VYdFOiKesBt+6/7QQYLa77h+fPa4sfCWhJyROtbUbaxrfmh2bdbxaDC7zjQAVii
 UdUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779996888; x=1780601688;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1/I4u5xzTdL/Xg8iJLQXX5JeYjnoJH3C01m6gStYZ5c=;
 b=NFNahfQqqBdMDt5w+rVP3bKpqhy9cZa98ckrEovIQ7h3NsUWgZXs/FfWo72r0vwZpE
 DCxrW1g626DKiXVgckuz1DIL+ZXVK2qt5cG1RHfLNrXo4+mR6ZWN17HNCj/7t6exy9D8
 drwprRGrtgnm4nmShMM30T1ZOKoO6RYIeHjRH4PFW6Rg7KTzrAGuT05p+84cP+RYawA0
 ofQdy+531DKflJR5MiqUrt6KUGzv4lRzw7WvfZq4fzNFQba7gtQpTqjHB8kHS8I7QQDT
 HJ3vppxFPPxNJwcCNZXXJlvX61UVrVO1fgS4glVsWtpXYNWTEyetDqquQVHvZpWD+0wW
 oXFQ==
X-Gm-Message-State: AOJu0Yyn3e00TiI3SLfE6+GPACcurWjRZ5EPQCi5dbs1N0zJpYFp5s6p
 /AhDOOkuDn/u9ZqC27j5ggW/gr3jgkomzxXjC4O+gUoZmG+WAz62QPL9M+g3ZykC2Ty+L84Lzkl
 eTkvDNZ+kEkSW5Eh2d+LsrypXfLX6TlVf9Vr1HoOVK8iMhZxl9VFXpUwM8g==
X-Gm-Gg: Acq92OHIFaZPNCf0MM8ef01XS5YeY2QerveiwmaOY/PXGXhp+YbMXjAV6N1g/fcPWiD
 F5wIsiKgOcCEf7D+JPsUzzyIZJ75LQYG/9EMxir/6ZRXK8EecaDBrXhHLF8T0rl1ohLDaYn5NC0
 O+4Wg7CtgfJ6Jr7DKf7vzzEKpcz2gigxgrx+MAktx3XMg5EC1wzfCx3DPxC0AaZNK78nSSpAynn
 xu/uSzO0iqRa6h8a+oeBwzFn/aNs9BO5hrkA0CD8ZKduBVnvsjd7Fm73PfsQXlEXuD9TE9BxhBk
 Cr43PeqAtviwkgTQVJNohNXTrYJOXs5Mn5scqUcvSqT989Keaj10RILgrTri6Q0RvDn7W5ANLTF
 BhihQROTulcK599/7a8K3jh0IktbwluUBvmrnWZP7nXdzOweDTSaKOWB6/SsXMfdur6rbEFYdOv
 YDuwt5CvQP70+40v6SKoFufV90
X-Received: by 2002:a05:7300:fd8a:b0:304:d32e:65e5 with SMTP id
 5a478bee46e88-304e8f652c3mr181091eec.8.1779996888414; 
 Thu, 28 May 2026 12:34:48 -0700 (PDT)
X-Received: by 2002:a05:7300:fd8a:b0:304:d32e:65e5 with SMTP id
 5a478bee46e88-304e8f652c3mr181074eec.8.1779996887894; 
 Thu, 28 May 2026 12:34:47 -0700 (PDT)
Received: from [192.168.1.170] (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-304e94e54besm147866eec.4.2026.05.28.12.34.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 May 2026 12:34:47 -0700 (PDT)
Message-ID: <aebe9798-232e-4aa9-829b-2b850cdbc818@oss.qualcomm.com>
Date: Thu, 28 May 2026 12:34:46 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 12/12] tests/functional: Add RISC-V endianness test
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Djordje Todorovic <Djordje.Todorovic@htecgroup.com>,
 Anton Johansson <anjo@rev.ng>, Weiwei Li <liwei1518@gmail.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu.zevorn@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Christoph Muellner <christoph.muellner@vrull.eu>,
 Thomas Huth <thuth@redhat.com>
References: <20260527201348.29511-1-philmd@linaro.org>
 <20260527201348.29511-13-philmd@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260527201348.29511-13-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 7Ku18jHkLMvJ4TuUbXg6Qy_uX7AApKRI
X-Proofpoint-ORIG-GUID: 7Ku18jHkLMvJ4TuUbXg6Qy_uX7AApKRI
X-Authority-Analysis: v=2.4 cv=ZdIt8MVA c=1 sm=1 tr=0 ts=6a1898d9 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=iLqgmErQAxjCjdq5jj1Aqg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=ALku5c8DAAAA:8 a=20KFwNOVAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=WaUXwePNmJxjUM3X3IgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22 a=Skunnq644UPbuD6fT1yj:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI4MDE5NyBTYWx0ZWRfX3KLk7z4twBc2
 gN391n4khBIJGCWc6YbJBDtUex4oNNNSs38BbsqfEGJzIFRNa6F5ooBLln0pfXp2Auxtjgwy4uL
 RttmHBWLEyPufszc8DydX4av88QX/kU+wwbv8+ZdzSbaPqVduARxvwOeZ8ZHReZHKWAzbUNSEvR
 33/iTJt+uVYIoUMhF0uyyc4q9e3vrzdZNh66uODj06bfU5CtmOi74g+RdJV8KbhkxaV0BUZI10h
 EgPdkZ2m4n8iHfW95lGjwUFDWvbmfeoQ7Kkd5hbT1X/8jTtaLt4rBY82RNBu/Bs7Z3qnHJmNrAq
 JRPB5EZz+r/RBedj1X3Ku7C2+G2OT1sjKlRFNd5qNC79CZ68X6RMRqmf4MH3M6rOtEax1iMF7g9
 cSJep1EX9AiXVw8nL84NoNyHDF18zdU3weMZMWBz8Ue6cWKn3B7/JYPLJ7hLDJ0BAvJXH3fa4tm
 bx6nr9rVJ5RMKik/x7A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-28_05,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605280197
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=pierrick.bouvier@oss.qualcomm.com;
 helo=mx0a-0031df01.pphosted.com
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

On 5/27/2026 1:13 PM, Philippe Mathieu-Daudé wrote:
> From: Djordje Todorovic <Djordje.Todorovic@htecgroup.com>
> 
> Add functional test for the RISC-V 'big-endian' CPU property.
> 
> Signed-off-by: Djordje Todorovic <djordje.todorovic@htecgroup.com>
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>  tests/functional/riscv64/meson.build        |  1 +
>  tests/functional/riscv64/test_endianness.py | 57 +++++++++++++++++++++
>  2 files changed, 58 insertions(+)
>  create mode 100644 tests/functional/riscv64/test_endianness.py
> 

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>

