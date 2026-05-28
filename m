Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE9CACD4F54
	for <qemu-riscv@archiver.kernel.org>; Thu, 28 May 2026 19:30:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wSgR8-0007p3-1g; Thu, 28 May 2026 15:30:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wSgR5-0007iP-Qf
 for qemu-riscv@nongnu.org; Thu, 28 May 2026 15:30:32 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wSgR3-000388-9f
 for qemu-riscv@nongnu.org; Thu, 28 May 2026 15:30:31 -0400
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 64SHGq1p4031446
 for <qemu-riscv@nongnu.org>; Thu, 28 May 2026 19:30:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 QHnYx7RBLCZ8bxave509p7z3rUJ3TSaIHz1MpL9C2mE=; b=Xpyi7E9RV4/WN4jM
 2iKFEEq5kBbVPe+g2z3OA2HTIi5vEm9bNk2im/YI58/yWpVqOsiSAYnV2mjkgES9
 BukYZoFmM4dJb4oZ6R7ec5zoPqeeGmT3YndrlSOP1h0ls56iIRGJWuOcG23m6d5H
 VZlycyAhEGOX7IM1Ad4kOx15SGbJWxpx8jdgh2zw7urZDKbF5x8UvxpczfN9O9Lr
 dpJsLwAfy8DLjUU6AhX84BllZHQeWEjthPEFyz15rpOIvCbS5twRLEAs68misFU8
 mXZ41GRqFaBigBc3OjSVXHZjT/lQQA/v8QRGtIxAm/ZxNbmb92WDjnWQWTPYEFtm
 c1lvRg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com
 [74.125.82.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ee7y4vcs1-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 28 May 2026 19:30:27 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id
 5a478bee46e88-3041ab826ddso13359035eec.0
 for <qemu-riscv@nongnu.org>; Thu, 28 May 2026 12:30:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1779996627; x=1780601427; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QHnYx7RBLCZ8bxave509p7z3rUJ3TSaIHz1MpL9C2mE=;
 b=SQH+Jr+j3wsrlIjeEmsCat9oEiMPLu3Lp/3xqKgmBcwW7qZILNcEvTE9bU30h0b8Zv
 s+471iasEHWQgvRpwPaFLYv5oye5tIGlsCscw5jdcQtZHLB5mEheIN80N8ODP36a0Tlt
 O3mDYxP+2WBArnquoWdlHQqnZLS3/WxL3n6xV4cJHghK8GxVYWa+PWEy6axFvzjCi0vw
 9JEIO4NfKDQSY4mkHG1f5P+vVukgji2OqE+SdE6wbzaEWErUQxuRCANKlndVA8EHHcxl
 LzmuGixguhw7AKJ31YsLrgd8FBpLL9ADbU985uTZnJngrCLusL1MQ3im28Lgwwucx7Pu
 8l6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779996627; x=1780601427;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QHnYx7RBLCZ8bxave509p7z3rUJ3TSaIHz1MpL9C2mE=;
 b=k8zGTTnfFTAOPnj4I/nCkI5Auydk311tqwJrn5NyD+shHBiLNXur3WU8S4P1t6O8eb
 OtvFVgSbMmwoXS1ZYt2qKBKgwkjSZH63vu4xj5QR/LVmP0aUgvBhf00DZM4jK/fpx7xH
 BKqW9F3bEvTgCkFZWP+8QIwVwkQmyC3zI6zTmV5wxVM8ezx2ZuKJNqAXarl7/Wfud8+d
 nkqaeWd+XdnaKtJSB5gn9IzeSo3vKPP1YtNXME8XuBS8bDIjFvgRPfN5UBK2IjMolD5e
 drrxvvV1uCFI3y6VhsWV8gKCee+i3xt0As3l2eMG22Ar4cGuV/suitBOtTFfQMcw3RFA
 k62g==
X-Gm-Message-State: AOJu0Yyz8NJ51+fjnn+kbtkp7n1D/8I6lvmKDBQbL1MGX4hnosiPNwdH
 AeyHhkyXSR2VPAq1RnwNKF33QGRPgI9/EdGaq/j2+uwYtt7hg0rbLJz//CPK6+B6RgrNmKkXu3u
 gCqpNCCFXoDOnyUyJK8XtSbeSBdR4RMeKC807Eoh6ST+304M+5nxT6od4Yw==
X-Gm-Gg: Acq92OFe37CydLKqlBekFv07AW6tAMVam1VAx2wTnGUcAoWP6vfctvQ69oHyTQq0FVp
 gcQD1xAiIWUInZVkGi2OpDqCdxhLyD1Kku+3ggFxk/lt8Df4SzM+3Dbaol/k+f9lSSDK0mvOUYq
 DetZpk8WKLeXqiXv6RBdAPLxNO5Qt4VFTndpVQfLzHVHWTFUvgh0oqMEIiWQZ44NaiSYbmOZ/P8
 Q24SepqR5RAdU84MK7x2CoQIDLXihSlB+xnWkD5NUysN2ThJjVfnhf8ejLW2W6xS0jTNouKlcCx
 eQFSzLf3O0ERDTWoZnOYPNLB4qZpbbrq4Yo2SXcohk/yqGP3VvqGO3WvutZ0FtHCAQbc/Enery9
 BS+LEvtSjgIXwsiWa9RHfajVyBqWRJFT+DgYLMlO6RlXu86+ieXFClTs/QF4h/uli+Y4ahaGnCC
 gJEm2pH/zvnFO31Yf4trhTKDSW
X-Received: by 2002:a05:7300:724f:b0:304:13f3:e461 with SMTP id
 5a478bee46e88-304e8af003cmr222931eec.3.1779996626276; 
 Thu, 28 May 2026 12:30:26 -0700 (PDT)
X-Received: by 2002:a05:7300:724f:b0:304:13f3:e461 with SMTP id
 5a478bee46e88-304e8af003cmr222881eec.3.1779996625575; 
 Thu, 28 May 2026 12:30:25 -0700 (PDT)
Received: from [192.168.1.170] (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-304e99788fcsm107920eec.27.2026.05.28.12.30.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 May 2026 12:30:25 -0700 (PDT)
Message-ID: <e7825459-289f-46cb-8a94-141622984355@oss.qualcomm.com>
Date: Thu, 28 May 2026 12:30:23 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 09/12] target/riscv: Add big-endian CPU configuration
 field and reset logic
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Djordje Todorovic <Djordje.Todorovic@htecgroup.com>,
 Anton Johansson <anjo@rev.ng>, Weiwei Li <liwei1518@gmail.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu.zevorn@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Christoph Muellner <christoph.muellner@vrull.eu>
References: <20260527201348.29511-1-philmd@linaro.org>
 <20260527201348.29511-10-philmd@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260527201348.29511-10-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI4MDE5NiBTYWx0ZWRfX3OdzMp7j7ACk
 AkEhB3pFEJuOJIf2iP1f/KYfmDEn0GfG1Z2VfwKqju8K8mrdz0Li8xFGhtoB4SD46eBE9bNS6Xv
 TWScVKDOftaQ1gOv2JY+0+Ak25YB/jibxJepafG9g2s+kYReOxJ1F4AcBMk/Fr6VREyE3iepFK1
 UC6iAqY4LeInHuw/9EvStUqo+l3qxOgErfy+48gbjpzKmmxYGwvUNlnZxYPSO1FtxXFPqozMH9E
 arWTN2t2/kyPlORX9PRH9HTmBPnWlZPXFXVamwuAh3goYejE6yTk81R/EuMVGyJDhiJwammH8PR
 PWb6SVe5Wd8Ctq1rzMnD0N53m2Su+bvkTfhjMEhAMxSHCjo2fyK8iyKQlZbvQg8d3L+8ZEUtMvi
 j/g9g6Tjl2GTr0m5uqMIo22tNn4IAMJDnQGb9E5ctxwZTlORm1MAdP+Rc9SjMajrf86ozc2v5gl
 fb6UZBWxw6Atz6uwtdw==
X-Authority-Analysis: v=2.4 cv=feidDUQF c=1 sm=1 tr=0 ts=6a1897d3 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=iLqgmErQAxjCjdq5jj1Aqg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=ALku5c8DAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=dGBZsZF6k0oMOTNdbjoA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22
 a=Skunnq644UPbuD6fT1yj:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: XfL7x1-pmor--ffUmOHOlTZ7zFMbzeE_
X-Proofpoint-ORIG-GUID: XfL7x1-pmor--ffUmOHOlTZ7zFMbzeE_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-28_05,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 bulkscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605280196
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=pierrick.bouvier@oss.qualcomm.com;
 helo=mx0b-0031df01.pphosted.com
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
> Add a big_endian field to RISCVCPUConfig and wire it into the CPU
> reset path. When cfg.big_endian is set, riscv_cpu_reset_hold()
> writes 1 into the MSTATUS MBE/SBE/UBE fields using set_field();
> otherwise it writes 0. This makes the reset value deterministic on
> both cold and warm reset.
> 
> This models fixed-endian harts, not mixed-endian implementations where
> the guest can toggle MBE/SBE/UBE at runtime. The MBE/SBE/UBE bits are
> not included in the writable mask of any mstatus/mstatush/sstatus CSR
> write path (unchanged by this series), so the value chosen at reset is
> effectively hardwired per section 3.1.6.5 of the RISC-V Privileged
> Specification.
> 
> The user-facing property and documentation are added in a later patch,
> once the full endianness support is in place.
> 
> Signed-off-by: Djordje Todorovic <djordje.todorovic@htecgroup.com>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>  target/riscv/cpu_cfg_fields.h.inc | 1 +
>  target/riscv/cpu.c                | 7 +++++++
>  2 files changed, 8 insertions(+)
> 

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>

