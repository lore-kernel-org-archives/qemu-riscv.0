Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E8C2CD98F2
	for <qemu-riscv@archiver.kernel.org>; Mon, 22 Jun 2026 21:16:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wblzx-00047i-5f; Mon, 22 Jun 2026 17:16:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wblzj-00044m-3w
 for qemu-riscv@nongnu.org; Mon, 22 Jun 2026 17:15:51 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wblzZ-00050K-Hj
 for qemu-riscv@nongnu.org; Mon, 22 Jun 2026 17:15:42 -0400
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65MJaJjV2101811
 for <qemu-riscv@nongnu.org>; Mon, 22 Jun 2026 21:15:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 A02WoZRBBy5BpPYahhF3806Ygv8MdlUYnsBVJgoIAEc=; b=DlxyRZt1gHtc4rdx
 0DzbFLr8J/w4Gkx/rqg70TUH3Ra17hXFl4nIlVVPw/FRXi8bToOZZnaZhKqljUiH
 T3GTXlXDPWKKN4+78wreWqzSLB0IC3gApV3Ioil1jRGyuX3riOq62jDqsePDOFhU
 ntPtvWggK+StdGBKdk9DguCZQNj3Whu5efGrILqCe9ogqoLRSPg8n7k2cudfkhOZ
 hf31+PLwfrCjQDvis3uo05WC8jJKGjzM6u6a+6L/iflks5t2T3XQBGSaIlwrQzC8
 1ao/OBbD8fNSOirzDyLaSDmrj2/BrOTrlt3RbLfJVbaTv6r9Z4zvtrEfwdQw/IDR
 2pEWlA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ey3eba80u-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 22 Jun 2026 21:15:40 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-8de3b53cba9so74816576d6.2
 for <qemu-riscv@nongnu.org>; Mon, 22 Jun 2026 14:15:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1782162939; x=1782767739; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=A02WoZRBBy5BpPYahhF3806Ygv8MdlUYnsBVJgoIAEc=;
 b=B5YqXqjm9hulW090oy8E5OxDIJiEn5i3eIzR7KKxNwHLH4woGV7sGJKDigAwYt+UXN
 wdfTOY5sGvFzvyGb6h8CcF07yEnLDy3a1bolsBjxb+D6i/Y3NXixYPhdaV79dBzlAGOD
 zMQOmSR7loOBwlrPEOKVhjYzWG4eGW3mryNzJfh+OiI3kJllPCa4tXDxHf+1kO/LWVmc
 QrG4L8GYL5+DIjpuQJd8Xg+jKrBu8EfNcxj4AYZXFFT6sD1zr21s7n+eAgs2VYx+CWNw
 AI+n8uS2RHPNvrbnb532rbAEHdqgGEX/qdb/xchii1YHpbbjl2HsOQk7gs9r3NaA3UtY
 5x9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782162939; x=1782767739;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=A02WoZRBBy5BpPYahhF3806Ygv8MdlUYnsBVJgoIAEc=;
 b=NdPM3B3zUDd21Lw2FQZrY3UOnjI4pqHGjrE5SgDnwJdCYjCm7hliL1FgeJlFhmU8bt
 KMJcyDLJcc2IQ+KPLEG+22UOUjmilq7kmLdyP4LWSpGpl6FFfxL5Euu8VJApMazpzRVu
 ct0C5cLC9AApu+IEAfvMaARtp5bXianZIoYbi24f44inXHwLysri8sfNfuUq4poez+Pe
 tqLQnMDa+czJvGHvui9YAlUFKvthq6L1jo56WfQDmtTJZs6jEiC8kckI+U055hlQ1t5M
 OPv87PzXDW65BVT0ljUbdGkGBqUSkD58vjyWwKrghOWmZpYm8HnfTm5AxEgzhdLTRDgb
 uJDQ==
X-Gm-Message-State: AOJu0YxE3mvFkSc4lp4ZylYy5Ix+bl8dOgB56z6+k3st7lelj9D1x6on
 N0G3Lmwikoz5ElajLISHF2NOfvXziKS+gGeowWl3VLPBIkDRmqiyY/2WptMAMjlNSG5w1xsHbJM
 TjtQu7QPzWluH05/bW0fj5jfr8RFqyokuViu9UXxp6I+7gSH8kZidl/N83w==
X-Gm-Gg: AfdE7ckQYLIhyKLZMBAx5g6fw8lEPk9T2uAomHlNKvqmDcNkXYlskzPZ23GikqEQ1iR
 s7QNKgbMKN+9yD4NG5jZPyP2dUbPU7IG0WcIFWhB7aAZP2eJgomuL/5fpuuEcEEBW2ddyo3B+Qc
 SdaSZcntNLyj5dLWzwu6MZLlqry2vr/ArBSLOK5RrTRsAE9xVkL/ndkwZ1vNa4+QDnT96iM/ohE
 kYKmRjuuG8eGmi5u8GYByf5oTh2+XtUgpj8/VgBvHzdhdBtae5acpw8YUqwUcn2Xp+9AGUyY7mB
 TEtAghVRI3q9yXh6jLySxBPA3OadKmDNTXjGhg/BskuS8rFy57AmvV2HpGszaNxor+KlM9CY1rq
 oZZMsm8QuZmqw01c0wQhOi0MYHNmou5XW1iECb2LZ94/t0WI43dHepUWjOWZMeQ==
X-Received: by 2002:a05:620a:1992:b0:915:a457:bf94 with SMTP id
 af79cd13be357-9209244fa90mr2516280185a.48.1782162939512; 
 Mon, 22 Jun 2026 14:15:39 -0700 (PDT)
X-Received: by 2002:a05:620a:1992:b0:915:a457:bf94 with SMTP id
 af79cd13be357-9209244fa90mr2516274885a.48.1782162939106; 
 Mon, 22 Jun 2026 14:15:39 -0700 (PDT)
Received: from [192.168.69.212] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4666712cceesm28555516f8f.35.2026.06.22.14.15.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Jun 2026 14:15:38 -0700 (PDT)
Message-ID: <91281e84-b24d-4a3d-a62b-54f586d918ce@oss.qualcomm.com>
Date: Mon, 22 Jun 2026 23:15:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 18/24] hw/riscv/riscv_hart.c isolate tcg only bits
Content-Language: en-US
To: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com,
 pierrick.bouvier@oss.qualcomm.com, Palmer Dabbelt <palmer@dabbelt.com>
References: <20260622193141.1449724-1-daniel.barboza@oss.qualcomm.com>
 <20260622193141.1449724-19-daniel.barboza@oss.qualcomm.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260622193141.1449724-19-daniel.barboza@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDIwNSBTYWx0ZWRfX5Qo7+WydHziI
 c+NJg+Ej1sKF0AmNna92UOHSaN96tvKsbOlj+m9UjRV5Xwal7VuJk7IJASan27hY24Hf6iLwAFl
 h8/+/QNTBoBUhBDH6ywtfu/9DF4akks=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDIwNSBTYWx0ZWRfX5Qh+ca6cXbIJ
 tKcsCCN7jed3SzjzV24BAzpoFQObNShFWbGam1kcYBIPj4NRFKcZ2EifcWUY+TJX2H0nF1ZARKQ
 0/HncZaa32f8rqyEb4Wkb4nrna8C03dCx8d367fsX1ztZf9jadLfeN9O4jNNaE+ofS1m7BOs8JH
 Elamiu6+sLGOVB3nlr4k/VMcnuM5DT4J/UGagahre9hxnYzzUbaDtPvLMJRh8JIRaeS+MG9gvQW
 doZU7duq/6+Z95Hkdw5WMI2ZTcb7SnK2QU5++q6Exh+j7UIUMg7nXstgLfOuvLl81+m4PJIqJmq
 pLxcLQuMdUVGDQ06I0bbKFDubYGFpp1JnMdGikJfcxql2NVPaSZ7VojmATtO/RIML8Gswyk6dBb
 lO5Kl/MMd3mCvXd3u/N1kPIPo7aE2Shp6mhGb53z3cOI2XQw66ke7XoHHhC+ggkvfYh9cJS/1FE
 WA4WRc5aSnFND2zSfBg==
X-Authority-Analysis: v=2.4 cv=ILIyzAvG c=1 sm=1 tr=0 ts=6a39a5fc cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=y1tcS9OrmSz08jv1SDAA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: Rj21rKvdI2JB47SYdVCs8p5GMdrcCYK3
X-Proofpoint-ORIG-GUID: Rj21rKvdI2JB47SYdVCs8p5GMdrcCYK3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_04,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0
 suspectscore=0 malwarescore=0 spamscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606220205
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

On 22/6/26 21:31, Daniel Henrique Barboza wrote:
> riscv_cpu_register_csr_qtest_callback(), vcsr_call() and
> csr_qtest_callback() are all TCG only and are not available in
> --disable-tcg builds.
> 
> Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
> ---
>   hw/riscv/riscv_hart.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/riscv/riscv_hart.c b/hw/riscv/riscv_hart.c
> index d1c7188369..28925aee59 100644
> --- a/hw/riscv/riscv_hart.c
> +++ b/hw/riscv/riscv_hart.c
> @@ -61,7 +61,7 @@ static void riscv_harts_cpu_reset(void *opaque)
>       cpu_reset(CPU(cpu));
>   }
>   
> -#ifndef CONFIG_USER_ONLY
> +#if defined(CONFIG_TCG) && !defined(CONFIG_USER_ONLY)
>   static void csr_call(char *cmd, uint64_t cpu_num, int csrno, uint64_t *val)
>   {
>       RISCVCPU *cpu = RISCV_CPU(cpu_by_arch_id(cpu_num));
> @@ -151,7 +151,7 @@ static void riscv_harts_realize(DeviceState *dev, Error **errp)
>   
>       s->harts = g_new0(RISCVCPU, s->num_harts);
>   
> -#ifndef CONFIG_USER_ONLY
> +#if defined(CONFIG_TCG) && !defined(CONFIG_USER_ONLY)

Pre-existing, if (qtest_enabled())?

>       riscv_cpu_register_csr_qtest_callback();
>   #endif
>   


