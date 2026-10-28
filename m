Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C965606A31C
	for <qemu-riscv@archiver.kernel.org>; Wed, 28 Oct 2026 18:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TNMf5okF;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UYTrooWx
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xM8Kk-00053g-V8; Wed, 28 Oct 2026 14:25:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xM8Kj-000511-Am
 for qemu-riscv@nongnu.org; Wed, 28 Oct 2026 14:25:09 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xM8Kf-00031M-EE
 for qemu-riscv@nongnu.org; Wed, 28 Oct 2026 14:25:09 -0400
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69SFA0Dd966241
 for <qemu-riscv@nongnu.org>; Wed, 28 Oct 2026 18:25:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 OFFijUbU4WRlBht/kHL+q7vJa2sE2ievEjnRef8nHEE=; b=TNMf5okF8xoQeT4v
 Tb6AuJGgg4CyUUZ1zrlu2yHQTkAJepBdOvm9mvNy2EWAzkDXuwiYBwpwB2uQet8o
 zvtP6uKMwrzVuwQzOluWRJbTZq26SwFokQujEXo1L19kkuSOg525TpyWpVPgHBP8
 cw3eOeGaWDbEfhzRgStJiFp1BUbxXMTLY3D4AFPNU/RTTcrBEvhGoKOaq0HLGLCI
 xVC5ZF1+WZG6jrNowx942hPFjnEk7oHjEo3o/Q3WIcL78oZk76WDSFJiVvqr63B2
 Mg971Iut0u6g9Eo9mVmVmbdRR/XWRmAUHmlyX4G2k8i/UjRQc5jTIaKfkNCVuqCu
 R4wq+Q==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com
 [74.125.82.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkhtjhcs2-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 28 Oct 2026 18:25:00 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id
 5a478bee46e88-341eff9e381so2649668eec.1
 for <qemu-riscv@nongnu.org>; Wed, 28 Oct 2026 11:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1793211900; x=1793816700; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=OFFijUbU4WRlBht/kHL+q7vJa2sE2ievEjnRef8nHEE=;
 b=UYTrooWxMMjt6LXeaEzZ9bKGx4MA43KrhWs80UajBq6jHSEKvyYiXI6TRty8wrx+qZ
 Sv9I8xKEqKuFqyZyQUz2Xw+AJCIas/HCmZHdtrs+74WVVLjhfGjcVYag86xjml7Ow3Qn
 YM9GzlEGaBEL59FMlcCDDTgLGYB7ILnlNrIb1JwbhhNc7RSNNMjUI01DpnYkQSk2IV3c
 tL6YUbNMKWnfSFVbB1zTcUG1WSOsP7sy5gYqSXPA2sX3DtykMwWo7WSIjOoXWLb6tW2J
 617kKf5XfXcgp/Z1/BDsOLM80ymZcJOZKA1ovYwXUqkOuyUe2k5/VWBnpGJ82Ix4DPwM
 K2Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793211900; x=1793816700;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=OFFijUbU4WRlBht/kHL+q7vJa2sE2ievEjnRef8nHEE=;
 b=c8LmSSKARrSbcOCzPwGeOeKkyZdYO9SThnCzQuqtiYVf4RHXv2DQUFb4Drx10E0sY9
 KaugWKE+pnT1LuvLzw6M3xm5+QYmSs7LfICsEFtuk/CDriBtR3FhuN8U2h3YwVzgXD9/
 eft4qw0BaGNt6NKQzKO5o8rWYCa+zf8kvZfE/7nl0pBI8JmymeQLi7SwfpLXEO5U7wzu
 pTcnIQEJamTTSvux5TZ2ffUdsNE2ydTXlhkdV6wZo4TMUl+Vv5qBizUB4JS62xZ1PSsF
 RLleqJrkj1msD8XnpHNZ7G0QwILSpo9YwnPyIkaIctCJNPFxXzSRCa3E/c/eRJ/28Fb0
 NoKQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBxwJKeo76hR/Xfg23bFBYnVd8+S0Kdx+q/joV12AVryypkKf4OjNI0pNVMJG2MUXw6mcAjWmqjEZ4nf@nongnu.org
X-Gm-Message-State: AFq9FYItRxEY7DwBm0xqYWmlqrMi3nLWYRQa2hjtBpW2w86XXeOBHwzL
 ALk+mmhCKE2vxG2vhf5sOz3gw1IgSa9F/5CkrnQvp/Mmv1+EijK2mBqcTKhYMhpZ21DY3TnrKr3
 9VTsXbHdRmG0tpvNwaGRNYRdlWKo8JUhJYOnoGMXGe19e4mAT4MqlvHwBaw==
X-Gm-Gg: AYBFou0eeMJAupt56yItDOudq8ZDsA48qFYoD7pwGrrKRB3GOZciMDlVE0A9Srd3rYD
 jbD5gcxTOm4kJc6q4uHvft5K9DxdR7fCdCvFA/tMGdueWsDzgnp9hjVx12TtdivghPea9BFZY4b
 LWN+sLvT1e7cy5LxBvmvlwe8mqX//OrIQXPITomfzLFSUVYovaH7bO2g1t5ucLaA8zL/oVB3Z3l
 121uO3qhxnokIPpLlrqyRn7WTtfsyqw74C5S51oZknxuHXFhqQqV9sipx3HLQo61eVVKgX9X4JY
 O7iA74P3/PQwbMud1ge+UvX5uC3bXcmwvyNz/74wIPZohU5xaqZ6UXM/6eMsCKnRSppBWju0k1d
 5fzgvmrGVjS/TYNp/9ZruMd00xK7EQ6s45u0B1yHkPVu7lbVGdIzi9Fbk0l09Gmlf6//TWBDTrf
 nMff6QbsUoP4x+3q5IAyIrewJPLi4iT+dwX0lVTaLIkGE=
X-Received: by 2002:a05:7300:a8f:b0:368:c6b9:d3bb with SMTP id
 5a478bee46e88-36a203f18f1mr4656566eec.14.1793211899711; 
 Wed, 28 Oct 2026 11:24:59 -0700 (PDT)
X-Received: by 2002:a05:7300:a8f:b0:368:c6b9:d3bb with SMTP id
 5a478bee46e88-36a203f18f1mr4656517eec.14.1793211898967; 
 Wed, 28 Oct 2026 11:24:58 -0700 (PDT)
Received: from [192.168.1.199] (192-80-163-190.dyn.novuscom.net.
 [192.80.163.190]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-36a237bddb7sm7781276eec.3.2026.10.28.11.24.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Oct 2026 11:24:58 -0700 (PDT)
Message-ID: <bc5bad6e-fbc2-44e1-a4b4-41bdfd41d33a@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 10:24:57 -0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] accel: register CPU parent for each target
To: Yonggang Luo <luoyonggang@gmail.com>, qemu-devel@nongnu.org
Cc: Chao Liu <chao.liu@processmission.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-riscv@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Philippe Mathieu-Daude <philmd@mailo.com>, Weiwei Li <liwei1518@gmail.com>
References: <20261028063049.2530-1-luoyonggang@gmail.com>
 <20261028063049.2530-2-luoyonggang@gmail.com>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261028063049.2530-2-luoyonggang@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA3MyBTYWx0ZWRfX6ffm3wXoSCbT
 3f71fuj2L9UfnOGuznbkB+wBdFiSCYSLR+u4HsitG76xZMA4XTEBvR0O+PtI1fR6y6tfpKUreeL
 5MQrW+WPx75e+KSaVMyb1p15rmSAkC1syW7RBy1ru0KkSlfhTOAcgiM4C7ZsN7bFCEqHWKOWwya
 F1rUUVyPw7Jg7RPO2SCR3x7mJr1kEtwTzyUDBzdusKIk/jhntZoJOEua7s1YTlF5TxAx3KO1JjH
 nyWO2Df7Lav2DvkaqZnnumoWIJd3OoiBq0qsD+xM0Y6uuH+skwdG2X4mwkySaeD7IY3eW2RjOf9
 3R6Kb2DxZiWFQfK6Rg7/fxOROLXHCtso3RZhUKnY4eW4idFCBI5IGQuGh/TQgVNqsl1yx3YGIkr
 o8kS8+SXnTLjU3VjgcIhippRZPJ3LCjjMK7IdFMdLNPzgj+bBSpjHqCwf1VEqxt0LSz6j222QG8
 eHcku9pA1A2pvLy0pqA==
X-Proofpoint-GUID: X_8K2ocMPz5hEW75r6qWA0mWlnCka6XL
X-Proofpoint-ORIG-GUID: X_8K2ocMPz5hEW75r6qWA0mWlnCka6XL
X-Authority-Analysis: v=2.4 cv=LdipeTfi c=1 sm=1 tr=0 ts=6ae23dfc cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=9852oil1ID9t5xBSyQ/BEA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=pGLkceISAAAA:8 a=krN7td2c9BGyjRQewgcA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA3MyBTYWx0ZWRfX2lMEAtVkLNt6
 y4gdF6mfabS3H7wOtgogxM8t/XqKxqoK5E+ADBUrrrzfOhwxRv3bkex33ORQmVOTWm5sz2Sf7E2
 Yz7knjCiC3SGd1SxZPg9SR1Np7ffbsk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 impostorscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280073
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=pierrick.bouvier@oss.qualcomm.com;
 helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, KHOP_DYNAMIC=0.001,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/27/2026 10:30 PM, Yonggang Luo wrote:
> A multi-target binary registers one accel-$cpu_type parent per linked
> target. accel-target.c is compiled once per target and calls
> accel_register_cpu_type() with that target's target_arch and
> CPU_RESOLVING_TYPE. A bool array keyed by SysEmuTarget records which
> arch already registered. Targets that share one CPU_RESOLVING_TYPE
> reuse the parent from the earlier arch.
> 
> test-multi-target checks that each target's accel parent exists after
> QOM init.
> 
> Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
> ---
>  accel/accel-common.c           | 31 ++++++++++++++++++++++++++++---
>  accel/accel-internal.h         |  2 ++
>  accel/accel-target.c           | 21 +++++++++++++++++++++
>  accel/meson.build              |  1 +
>  tests/unit/test-multi-target.c | 22 ++++++++++++++++++++++
>  5 files changed, 74 insertions(+), 3 deletions(-)
>  create mode 100644 accel/accel-target.c
> 
> diff --git a/accel/accel-common.c b/accel/accel-common.c
> index 00a400243f0..0d04b8c5749 100644
> --- a/accel/accel-common.c
> +++ b/accel/accel-common.c
> @@ -130,9 +130,9 @@ static const TypeInfo accel_types[] = {
>  
>  DEFINE_TYPES(accel_types)
>  
> -static void register_accel_target_type(void)
> +static void register_accel_target_type(const char *cpu_type)
>  {
> -    g_autofree char *name = g_strconcat("accel-", target_cpu_type(), NULL);
> +    g_autofree char *name = g_strconcat("accel-", cpu_type, NULL);
>      const TypeInfo accel_cpu_type = {
>          .name = name,
>          .parent = TYPE_OBJECT,
> @@ -143,4 +143,29 @@ static void register_accel_target_type(void)
>      type_register_static(&accel_cpu_type);
>  }
>  
> -type_init(register_accel_target_type);
> +void accel_register_cpu_type(SysEmuTarget arch, const char *cpu_type)
> +{
> +    static bool accel_cpu_registered[SYS_EMU_TARGET__MAX];
> +    static const char *accel_cpu_types[SYS_EMU_TARGET__MAX];
> +
> +    if (accel_cpu_registered[arch]) {
> +        return;
> +    }
> +
> +    /*
> +     * Keyed by target_arch. Targets that share CPU_RESOLVING_TYPE already
> +     * have a parent from an earlier target_arch.
> +     */
> +    for (int i = 0; i < SYS_EMU_TARGET__MAX; i++) {
> +        if (accel_cpu_registered[i] &&
> +            g_str_equal(accel_cpu_types[i], cpu_type)) {
> +            accel_cpu_registered[arch] = true;
> +            accel_cpu_types[arch] = cpu_type;
> +            return;
> +        }
> +    }
> +
> +    accel_cpu_registered[arch] = true;
> +    accel_cpu_types[arch] = cpu_type;
> +    register_accel_target_type(cpu_type);
> +}

No need to do this, just move the whole type registration in
accel-target.c and type will be present at runtime for all present targets.
	
Regards,
Pierrick

