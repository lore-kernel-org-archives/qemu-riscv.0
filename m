Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92D89C5AD5A
	for <qemu-riscv@archiver.kernel.org>; Mon, 10 Aug 2026 02:56:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wtGBI-0003wQ-1P; Sun, 09 Aug 2026 22:56:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wtGBH-0003vw-AY
 for qemu-riscv@nongnu.org; Sun, 09 Aug 2026 22:56:03 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wtGBG-0004mV-31
 for qemu-riscv@nongnu.org; Sun, 09 Aug 2026 22:56:03 -0400
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 679NlmsC236030
 for <qemu-riscv@nongnu.org>; Mon, 10 Aug 2026 02:55:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 qG24S/XyKBY5v7BM9lFvldZ/sXod0uMVB0/MWvK9u28=; b=WsWUJCIT7WE3PQce
 9LdLiLm756AkH9EFLdafAQRFxSY2RsadtsuMOtKBXEqU1Wy4FMFOpfPawKS5M0re
 kc0Ba2v5YBCa9yGiHQZNkQBvt7U5gXwjALQrauqwSeKWjNuEQmIt2a9Ft4XelcAP
 loO9bMESBicA3wGYab7vkCzIMa1yC0yfKBWmCR2DN879mm6qbIisb+DviXSR/K39
 H3ljfEQSWPKvZ4DK4fcjFCh+ak5KBJrQvAdWz8otxF4EwsA9hJZsUPK+xTfQgBNV
 VjaF09kG1QUNNGQ+aZLr6GGFVo8GweTQU5eEsrqvEapO4FnRmmejRQJd1bMlj8Gc
 7ZdBGw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fwuf7c6v7-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 10 Aug 2026 02:55:58 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-51c26012cd0so12752121cf.0
 for <qemu-riscv@nongnu.org>; Sun, 09 Aug 2026 19:55:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1786330553; x=1786935353; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=qG24S/XyKBY5v7BM9lFvldZ/sXod0uMVB0/MWvK9u28=;
 b=PDg6tqUlgWzprB0OFyJj5LJupOmdtUIBOxe6MYLo5hWlQODzob1Y8wJ7kI/AmnOswk
 36thVRQ1tKwCmgnDzi0XbCUwlwM35Y6zGybbECklmtGhEOArx3t1pIp52fs2RaNBWvL1
 NAMs5zITvRc5iBzllI2kgkE/k1zscbbtmJNknG+7W0Nz5BV6ZyBOU6U/Pc/adglsfFxv
 Y5KAJ9iwweegqO6HsYhp6GpcLvLirXUqY5MV8Qf7nWjs3O6JV6eK0el0y9ALMGBBa1BF
 5XPHQEO5a0MRDVfBjt1WsMtCs1yVyn+WC8cbK0eexIfNScBKYcilNFoXG+uvXeyBlhrj
 wAbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786330553; x=1786935353;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=qG24S/XyKBY5v7BM9lFvldZ/sXod0uMVB0/MWvK9u28=;
 b=E9WB9x2yyaxs3ORuV07/3pMwfdXwGX8FAv9yaD6+ITUxcAk3jACvOTA6It60xtoP+m
 pLPdh7PY9jKcD0ujHenCoqi+PwHjCxGjaGsgMHKeWF7ExRM3UGAhv7E/L/8iwB6u/pAz
 2JVzkiI0qJSKgibGrvLjshUBLk54ii6SagU+7LdJn0DzrIcSELXNiuh25xjEbTn5xWGe
 M+GllH0cL3iXpaL1LirOgBzSLpp/Hub/9pZph9ZgD3VaphfFC/obYzCGPEfoR9kL34QV
 nD5ED/76R0K5jv9GZWjk3qHqWOFsZaCRvrfARvzCctTzwLPHu8C2I2/DtGpCXmJPAHEQ
 wVnQ==
X-Gm-Message-State: AOJu0YyhB4phxpSovAXDZjWHUNiEspd5BKScNoR98jNLfzHZs/EoQeUX
 YguIcQ52IQSf5VSxTzIO+wnAd9wxFXQ49z5R7UnbVrIFfgnL8TOdEJ2VpMHtPwA003wB3U7Nktk
 lP5Cwc2PrH8gb79T9StlqrnOiYRbbDQoIMMfLPT1JSrtGqgGuOiwcPpbwPQ==
X-Gm-Gg: AR+sD11U/6+16I34bE9Hh0lZ4rT3RRU6Z0oBFb0AK54g4e6v1nfQSSi+7gHsUQZCKUs
 O9eZQKhRNmAOfPm8S+AEuUaRM8tYMvqIiKXPXg3+0xVmVQEZX36v9lVpwyRRzFlD50bhhWmqofx
 paXmYkmQ7/iGrqSBJBmRXVuraf+UtxhMHzTJ/bgeIxl4XWzN+gYUET1aJ86UzfIalMKUWX2twFH
 ub1NPPerGoQcIENmKuyOn6pMVJHslzIr7STgiq60lC9Quxq8rehPxcBIbnb/Zyrz1xM1qig7V1E
 5UWOVU5yTJVoSppHXlAF2UGVLKrPxGFMci/vTbC1eZHRB4SH0CG7hKo7V8yXYDWzD4ES3AMQAid
 GLQo59h66DCZyDChX0eLXdRjJlOWk9AdFxMg=
X-Received: by 2002:a05:622a:345:b0:51b:fc67:c73c with SMTP id
 d75a77b69052e-52ce5ff3246mr396495991cf.16.1786330553197; 
 Sun, 09 Aug 2026 19:55:53 -0700 (PDT)
X-Received: by 2002:a05:622a:345:b0:51b:fc67:c73c with SMTP id
 d75a77b69052e-52ce5ff3246mr396495861cf.16.1786330552780; 
 Sun, 09 Aug 2026 19:55:52 -0700 (PDT)
Received: from [192.168.69.229] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4995c69c8ffsm197491205e9.2.2026.08.09.19.55.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 09 Aug 2026 19:55:52 -0700 (PDT)
Message-ID: <a56e6ac7-e3c2-49c7-8a72-e14302389193@oss.qualcomm.com>
Date: Mon, 10 Aug 2026 04:55:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 16/56] disas/riscv: Drop useless const in structures
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org
References: <20260809223545.730664-1-richard.henderson@linaro.org>
 <20260809223545.730664-17-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260809223545.730664-17-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDAyMyBTYWx0ZWRfXwuHz/OoyvOdl
 jPUkQUsySzwTkVFHJs7nh4ubV0pP1uD/fq3NETcdxej44ijZAptAJcz1LqXEPBJLNBygqiYOyZh
 Dwm7mmhAmmrT1+E/KkRwcjYbkXZz2cM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDAyMyBTYWx0ZWRfX1ccP6RudQhn9
 +fryfOItTEolOcIXqZ5FV47ZQ0hC3PhaTzWE7l3+217KvADIUS3kK3LAcxI3LLmh22mlHyM0Bu5
 6uq20vsQgpN8KQyoHsd7in30MHPMe4Mnc8bH4duuL2WYXBRkQ8jErvAkT5CT9XHbM/esXU+N6UH
 cm4ZCiREwYVI3gve9nUX4IZqlDB6sRRY6q4EbFFWifunMyY77T4H74XOQfZH2efqxX15znsNp/P
 rG8mugJZsa0VwEokl34HAEj7A4O+yjIDjXDJgKA/RCkZj+7XQALud+2rRejUybe6AFvO0y6NeWA
 JrDMKSrERCxau9PboQHeWby1tYXVGw6TUiunzCfx8troFu//o8wtCMLkza+sjjjWgnBCI66XEi9
 S+wBW+11LuU6we91tVY4AN5yOvKEmwi3lq8do5+ndOM3q1yZuIHwbveJP0FYA/m57xHdZfC6oIg
 SrmpTVv9+bYZ++N/meA==
X-Authority-Analysis: v=2.4 cv=ecENubEH c=1 sm=1 tr=0 ts=6a793dbe cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=1tSEMpTH9XP_W59IOagA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: LCLdcJAIwjTOwdcOMI4_NUiSnSOOMa7R
X-Proofpoint-GUID: LCLdcJAIwjTOwdcOMI4_NUiSnSOOMa7R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-09_07,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 spamscore=0 impostorscore=0
 suspectscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100023
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
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On 10/8/26 00:35, Richard Henderson wrote:
> Individual fields should not be const, only full structures.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   disas/riscv.h | 16 ++++++++--------
>   1 file changed, 8 insertions(+), 8 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

