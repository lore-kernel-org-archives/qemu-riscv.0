Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82359C44500
	for <qemu-riscv@archiver.kernel.org>; Fri,  3 Jul 2026 10:44:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wfbNq-0005yX-LN; Fri, 03 Jul 2026 06:44:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wfbNn-0005yA-Ka
 for qemu-riscv@nongnu.org; Fri, 03 Jul 2026 06:44:31 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wfbNm-0006lE-3S
 for qemu-riscv@nongnu.org; Fri, 03 Jul 2026 06:44:31 -0400
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6635rfCk2994864
 for <qemu-riscv@nongnu.org>; Fri, 3 Jul 2026 10:44:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 EoptIEfXdRo5LJJfWXdH2s7nSRvlNiYy8UXZroeRxGs=; b=DtMH3R0fu+EYWG+4
 vQoJ9WmKfxQni8jkxWbl7+J44FS/4Va3+tenGq8c7/6SSf8QUtCnrbMn3jpR9jd6
 HKeRWO6Y6zGrr02WLBP5q4MoEZjWr8Tgx/VWaELW16/EM9/lNctSDR93GAcOMGUc
 jl5CPLHqm6irWy+6kJyjZNU51oguwr6g/NYw5xJlA9qwugLkTOL3gm+MFpVv7hEX
 kGEEZUCHIZfBrsn/3lIt4m3QA/dm3STN/zj75IKpGFvFiNMFcYIahLW510j4t8xS
 RtSRwyzwWoUAFx7XX3bNcptKzWWteZi/ZhqQ5GXiZiFOq05l5PdEHNCw6lX007iS
 JCCwUw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f648n1xcm-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Fri, 03 Jul 2026 10:44:28 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-92e623b0e95so41869085a.3
 for <qemu-riscv@nongnu.org>; Fri, 03 Jul 2026 03:44:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1783075468; x=1783680268; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=EoptIEfXdRo5LJJfWXdH2s7nSRvlNiYy8UXZroeRxGs=;
 b=DEZLP5QKrF1Rf8n4tCA0nuWXWsEVKK+UjqJrGFshDLiL0QiHcDEa6IJhSNQeAlztu9
 8vHJLzathcSCCwzc6ZwFpa276pYpoReYnPqOYxrB943ucI4drCs5/HpHmkRJgBsK/avJ
 wpWftciLAm/rBhSFVA5OS+rCm19IVO8Bz1sHP+eDDb1WzaxoQcoJTsrC8F7gFasQivm1
 bmQZSSgLc2d5xIWTASz3Mt+VZndcnR0qfXZaon0URLp0xQYjhSJp8gGvotAlmCFS4bwf
 W3shXdc1cSUy20xThui5kAXUEkOoZ7Oc1kzgPDiFodp3YBU9Wdx1xViV/+1mkVjbNdXn
 cjOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783075468; x=1783680268;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EoptIEfXdRo5LJJfWXdH2s7nSRvlNiYy8UXZroeRxGs=;
 b=Iw2CjujDU6o7bzKtFD2vs6rsG3H8zQhBCoPaFLheYbA5y1UWBP2qlvniHwkuEJZrXo
 uj0OLlwTBimuPlSjCTasQjV2Oc9ntU/FBpYuO6Ipsi1Ked0Hy8s4Uw3rzMVWx6YGzt+1
 olkwCr8/M5K0wAoFvDA00tyV36Q4C79nOEWKiYrWP0lXZ0PqtEMEnnDTMSxrT1kd5sTR
 oQiVSbcmBdEBLtxrT3gBsFwmeICNzmpu4gaWv4ilajYfsIDjoEj7coIYX2KZj+746qni
 djY3HgjFdoRrEnpCCLdjcxzY2aeo6fQyKJ+H7tMu/ZKPFQDQgpiWkuImlcKXc7ML28kH
 K19g==
X-Gm-Message-State: AOJu0YxUBsYCXCBJZQXpSa5iqDcaUn/uYZCKVOPutY4hnoVdSU/tBmD6
 ts1tpSyhnO2RXSe0/pTZCQBk1qbL6TRm7a1B6cPPTUAtkXAQlPqJ/aFR9BGa9cJ3cyEc2blvZAy
 P/UsQPfiLEwFomcR0xMmEFfBNANNm0J3TIZ3ux5CKGMwjOIr8En9CScXG8Q==
X-Gm-Gg: AfdE7cmuEAItxCnc//HxJz5rqvgQlhJWGTt61zhsMIk5Max15Z455cUzR0Y+RW93TQR
 mljHz42jO2RGPMbDipVE2aZECEFi5iL0GBwL7Iq2Nhn/PW8TUZKOK74/3HOOwlZRReYVviNxhgs
 2M5YI5VMYGpxhOwxToYYmmdYyGZCVKraNcmPG9kKEKm4ORja5zzJe4zWoxEGM7sOvZlrWFUw/of
 O5oKk1C2I8gKqdS8XFMIjjEvxLEA6GbkExqB7bmtT1iQDxAjng2GXH0iTRnQUeosLPyfmKWagNL
 +njJsPD21MYlOYfIzTXhy39whJiQ6i/e1uz9VRh/gXPbx26OKFelP1ESPh09WQl+l1qkdmzz3X0
 oj0aAMpQUClZV1z1UPaZ8PZ2+pXe2WPva/2pCtAIzgFk2ddvSpaJJNYRyvVds5A==
X-Received: by 2002:a05:620a:4016:b0:915:8f76:7ffa with SMTP id
 af79cd13be357-92e782c6315mr1194923585a.45.1783075467780; 
 Fri, 03 Jul 2026 03:44:27 -0700 (PDT)
X-Received: by 2002:a05:620a:4016:b0:915:8f76:7ffa with SMTP id
 af79cd13be357-92e782c6315mr1194919685a.45.1783075467262; 
 Fri, 03 Jul 2026 03:44:27 -0700 (PDT)
Received: from [192.168.69.212] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-477ddf0f433sm20334083f8f.32.2026.07.03.03.44.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Jul 2026 03:44:26 -0700 (PDT)
Message-ID: <374abf50-4593-4888-bb9c-2ef731b6d7a8@oss.qualcomm.com>
Date: Fri, 3 Jul 2026 12:44:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 06/24] target/riscv: move pmu.h to tcg subdir
Content-Language: en-US
To: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com,
 Palmer Dabbelt <palmer@dabbelt.com>, Joel Stanley <joel@jms.id.au>,
 Nicholas Piggin <npiggin@gmail.com>,
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
 Michael Ellerman <mpe@kernel.org>,
 Portia Stephens <portias@oss.tenstorrent.com>
References: <20260702135128.1188021-1-daniel.barboza@oss.qualcomm.com>
 <20260702135128.1188021-7-daniel.barboza@oss.qualcomm.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260702135128.1188021-7-daniel.barboza@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDEwNCBTYWx0ZWRfXyAF9ABmGPNR+
 M5cZEQmdSbc3k2FOjfCKQDQsYGLrTsYfMYBoKjjLzHBHLEaJvNGJBKZOu9ZdglFceGWEdBsHKf5
 bJRYrRnj0h3JoXzKYjRrdpyRJJhsvA0=
X-Proofpoint-ORIG-GUID: egI9t49ZOC5zpIZz1E0m0ZBz1C5uk1pQ
X-Authority-Analysis: v=2.4 cv=O4wJeh9W c=1 sm=1 tr=0 ts=6a47928c cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=JF9118EUAAAA:8 a=LfsA7Cq2GQzuzbZ-N0YA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=xVlTc564ipvMDusKsbsT:22
X-Proofpoint-GUID: egI9t49ZOC5zpIZz1E0m0ZBz1C5uk1pQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDEwNCBTYWx0ZWRfX5a2ifm5Wmpho
 SGwYm2xAiMzRojHLuqiGLuX6XMnkhQwnqNbsfe3iXLsduWdz0uU6BStN6+WkuR/Ek5VtZpLlXsV
 kfFfPXo0CT2KKFaWjGOKrs82aBxrirBzBJRmKCJYd3nUIv2B5Yg/aMnp03wFBbv7oBySAgBEnPS
 2dWpU6iv8Cv+YkCgFWcFLpmYkvC3Xm28sjX8L93CVBtI+s4nBZDg6PrzUGW4qWcW4js4mLn6RE2
 O5ZTmoCo0mzdCeAqeZRUJ8I+zxNCrDbVekM71itAWf5ja5UBypfcwMT7j2wd+VKbG6TaMEIU6YH
 x1ewLdvuFg6QuZqIl1HW4OPJSVUvBiyUM9Eq7jhSdN0i0CF32kG3fo4vchlKHHZ+/qyWZFBb1JX
 rVEKcbQiXQCzw3ElhmnlnPPC1BHXXUGDHBXEp6+sat2RmtmBTDOYhNPcs7yddMHWL5a31t5oXef
 KABE1i+keopGXAjT54A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0
 suspectscore=0 malwarescore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030104
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

On 2/7/26 15:51, Daniel Henrique Barboza wrote:
> riscv_pmu_generate_fdt_node() can be moved to fdt_common.c since it has
> no PMU TCG internals.
> 
> With this change we can remove pmu.h from 'virt.c', which is now
> becoming a tcg header since we're moving it to the tcg subdir.
> 
> Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>   hw/riscv/fdt-common.c         | 52 +++++++++++++++++++++++++++++++++++
>   hw/riscv/tt_atlantis.c        |  1 -
>   hw/riscv/virt.c               |  1 -
>   include/hw/riscv/fdt-common.h |  1 +
>   target/riscv/tcg/pmu.c        | 52 -----------------------------------
>   target/riscv/{ => tcg}/pmu.h  |  1 -
>   6 files changed, 53 insertions(+), 55 deletions(-)
>   rename target/riscv/{ => tcg}/pmu.h (95%)

Preferrably before patch #2 "target/riscv: move TCG only files to tcg
subdir" if not too much trouble:
Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>


