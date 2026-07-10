Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6FA8C44506
	for <qemu-riscv@archiver.kernel.org>; Fri, 10 Jul 2026 21:46:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wiJ3A-0002PK-8x; Fri, 10 Jul 2026 17:46:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wiJ33-0002Iv-Vb
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2026 17:46:18 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wiJ32-00043v-4a
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2026 17:46:17 -0400
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66AK3Wr51752888
 for <qemu-riscv@nongnu.org>; Fri, 10 Jul 2026 21:46:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 LU4qIQo/+FzXiuZJATdP9f/stxNyxbOIRRZc/MFDJZI=; b=okcKR4ceyee41Zg0
 RYWbvHawjrSo14+MWBXtAfYCLX2O/vW16w6nwzeXVBPpkKH1Bv8M82bCbuTZ3B6r
 5imomVDhIIcPtvWSe2s7FumjrOt6SRjLRsEoe2dA/yd34TGaRGgnJmNT+E4COcSL
 PCC0Rz5Nz8eIy4rtwK+DfOPKznS8i19w1G2Ojh3bK14zyihmbNAIuUlU7l8ZRY+J
 drIRoSa9H7LCZHmpnHxWkKfRZ2bTGfKCTcWEgoez99WwWWqB2sHKi+Nj65AIG2Mf
 +jR99L41zwJb1BDc7DxZkWRs4gVrqJ7Ttd00f9VmbXPID6ueuGWwbfqL6rlnlJ4W
 gEQVCQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fb2pc9gqn-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Fri, 10 Jul 2026 21:46:05 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-51c12e43b98so18106661cf.1
 for <qemu-riscv@nongnu.org>; Fri, 10 Jul 2026 14:46:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1783719964; x=1784324764; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=LU4qIQo/+FzXiuZJATdP9f/stxNyxbOIRRZc/MFDJZI=;
 b=injb/+ZDwTyu+qGp4YaqnnPMMTea2A+g/Wsw3LDqc+he+l082pb5mgLooqvzYP0JT1
 zboaydHN15GzoZezSmA/9UjmHgaI4GSX6YMXhnCpMcW2gedb2K3Slf8I4fpfiV4moTQT
 u5K/AyN3XAlVJ4YNq9KKVOHxMBE85Awe5MR/0SDYL9mSHwcP0hjlkqgJy8ZdMXiu9z7i
 Isu1fmy4wrT3P0eEsiAA5/YOhvL8hsaxNFT1dGzDyiVYRqZ9v6QNjD61IZHHomgoVSRN
 7SThL7ycIZ7ibgHyoxu4poL/UfwRDPcZD27EGav1WN9e1eBT4CNxjBh1e6DGsfM56qZE
 oS+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783719964; x=1784324764;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=LU4qIQo/+FzXiuZJATdP9f/stxNyxbOIRRZc/MFDJZI=;
 b=Sd1UlmDodRT32r9NmAtUAwV0zlXT0iFIqP5AKsLH0GiRdrM2EMpUS/A5vr8wGgg0CV
 ggaqvYikqK/J8RxpZMQGqwyN0HFYPC4TvcDQhB4vKF3LWkyAu0YQey7hw9KgYtU1uInE
 lKnP8e6SburEE8iF+0l46j3E9nh2IZK5GMno2BRS9JGUeloubbehK87OWsgg3zeWWwov
 rk8cBXpeyEWyPdDFPoEYHjFKaZVRGp4yyCfrTLR8oHubTK5cKJZ2jJvZW/FR3/i1DkR9
 HvfzuqpJxqhC4QLsL019h3WoLCkHBCiDWI09ph6sWMeb7VVXRW3Hi5SDHX+Q6X1oNKt4
 8Jdg==
X-Forwarded-Encrypted: i=1;
 AHgh+RoqYb86L5Cg3hs/fk7hgCee6H7AzYUPsmtvY43tVh2u8S96xsXq6wfqSsD8zaZ3LeIuDLQPV79O9JrO@nongnu.org
X-Gm-Message-State: AOJu0YySrO3WfMyhy9dkIm4XxdoZ00/yUEQlX4M576JZdEgN9OeDrUNX
 UOvPvR5Ycl4W0pV/eSNzcCMPcDIIBr9EAqnjTBp890R5fnpemrsDS5F/S6cagAn63EfQGlZeTJ8
 9i37g2jDl+sknD3E0lOoICkFlvxmC7iqq2ldIVbXYAkv9zHFbwkIY/rTWfQ==
X-Gm-Gg: AfdE7cl3ruMgMoJWpXu/zlDfhRL5xUFYopShCaeLz5l4RmPj8MHNPzUVthygO5EXdEa
 aaiJ/CRJGq4O9WgftHWkSxPgmElLpCk+PU7oX+9kD1l+8y03o43KFiMJazKkxJ8crgE6WJmjj17
 iZRmuL62ee11duOQTQ9NBUJB/PMA8BRE4mSg5/Xf7v4jM4FtUmtIL8adZUkw/hK88k5uqIFYfoH
 ktaFIXxvnpiwDOMHaclPkCYwmyCfSUhLdIs2dTjMzXyWVKyDYcsM4KyJANWgI1LUlNdd86zR8SJ
 6SX1LhgP4dUCw8wJ5dD4bZiKSJwqRGSnYvKCB3hijYk3HVa1ZqYVWUrMX9m/c/opPTIpKkKBT9G
 7cUM88LcIR2izQpugETiGW0NSj8kkIMU=
X-Received: by 2002:a05:622a:1f19:b0:517:71d2:37d2 with SMTP id
 d75a77b69052e-51cbed6d58bmr8436831cf.0.1783719964445; 
 Fri, 10 Jul 2026 14:46:04 -0700 (PDT)
X-Received: by 2002:a05:622a:1f19:b0:517:71d2:37d2 with SMTP id
 d75a77b69052e-51cbed6d58bmr8436601cf.0.1783719963955; 
 Fri, 10 Jul 2026 14:46:03 -0700 (PDT)
Received: from [192.168.69.219] ([88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493eb6ccdbbsm172404615e9.3.2026.07.10.14.46.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Jul 2026 14:46:03 -0700 (PDT)
Message-ID: <111e1ab9-dd7b-459e-836a-ecefc7ff0b74@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 23:45:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/51] qemu/typedefs: Declare CPUBreakpoint and
 CPUWatchpoint globally
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com
References: <20260710205401.836304-1-richard.henderson@linaro.org>
 <20260710205401.836304-5-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260710205401.836304-5-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDIxOCBTYWx0ZWRfX1UrYWPlg2X7Q
 iCfE7bzik96AuP9WDDX0sdaY8nsEl608SoJ8V6owkiRkwnCZh9+SJCS5ANOTcRpzkpYzOjtI/Nq
 94eorc6jK7Rt+b3wOZD4AWbDLWvqPYUD23S4OJ+xrcd3SobOSlp0ZdAvaaWs9vnWahJMui1B7ut
 wzWwCew7WCp5usSsBjz12z8PMj/HiBLCVQNb0WIWkNDC/jepSSfr9x4qfkjWVtp8snZKZEW8AJI
 30VBkXeqefQP2ZfGDSC7VzNnIOZNVVCI2mgrl73unH87G4udz0JpsuJFXf/yL+LBNCeQsWsTzb4
 eXnfGFmMQQIXiN8UfMe3dbSqI0xVUu5Mp83tvfuiHcz3SWiIIT4ucee3f64IhdXyoTibgPgayDU
 V8ZIFrcWnmaOm6YBi0g3jV3CkwkbVOCoKvvmdMirb24MfsY8/uADkfPMTxQespkvwcbJxj3UNRn
 Ke2Kqs2ExGaiNMVEWGQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDIxOCBTYWx0ZWRfX0D3fjHJLPbry
 5eJ3ZJBL0DKFlRs4XEof1E/lR6QxqoQzRJOp+0xbpDKKh26SPp19U1WnMAQDQPVqpMxdSXSJkjZ
 +Y6Zdls17b9pgr6fT0bbrZm6+sv8Fsg=
X-Proofpoint-ORIG-GUID: cZF9DsC6Z7R6piFtyXxvj0Y-DiFG127_
X-Authority-Analysis: v=2.4 cv=J9SaKgnS c=1 sm=1 tr=0 ts=6a51681d cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=1tSEMpTH9XP_W59IOagA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: cZF9DsC6Z7R6piFtyXxvj0Y-DiFG127_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_06,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 malwarescore=0 spamscore=0 adultscore=0
 clxscore=1015 suspectscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607100218
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

On 10/7/26 22:53, Richard Henderson wrote:
> Adjust all uses of 'struct' in the uses of this type.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   include/exec/breakpoint.h | 8 ++++----
>   include/hw/core/cpu.h     | 2 --
>   include/qemu/typedefs.h   | 2 ++
>   target/arm/cpu.h          | 4 ++--
>   target/i386/cpu.h         | 4 ++--
>   target/ppc/cpu.h          | 4 ++--
>   target/riscv/cpu.h        | 4 ++--
>   target/xtensa/cpu.h       | 4 ++--
>   target/riscv/debug.c      | 4 ++--
>   9 files changed, 18 insertions(+), 18 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

