Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75BA0CA6019
	for <qemu-riscv@archiver.kernel.org>; Fri,  9 Oct 2026 10:06:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xF7Ua-0006YR-5N; Fri, 09 Oct 2026 06:06:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xF7UX-0006Xf-UF
 for qemu-riscv@nongnu.org; Fri, 09 Oct 2026 06:06:17 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xF7UV-00065U-Ar
 for qemu-riscv@nongnu.org; Fri, 09 Oct 2026 06:06:17 -0400
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6998KOSp3977816
 for <qemu-riscv@nongnu.org>; Fri, 9 Oct 2026 10:06:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 zXkaIX4q6dftwSI42CBrnmVy8Iuj6kVRFoPUDzbZk1s=; b=DNgOoF0eVimpIvmX
 DMx0dRRRWMwc/VKi8xnDWpuoXimDsxMNTC+C9LFtb0vb4NQ9eRG4hMs3S2VdD3AY
 W4/YTqcHKd0afKgCaF77Kji4uOJpXBMuIL6gEmWhYl0f9IOLGLCX7j8+dwXOgmnS
 1pg58lGxw0XkitMUUKO7FLd0FIuPl27KrSW46u0N4wBNfBG5uWaFwUMtTiyajSee
 sby6oacLX9bh94TM7o5n7NV7ulEQuXQ5Etj5I0yEatZ9p/NHZ6cUVTYN7qmRmPHC
 5pijjSPhwuPVtzTWx+eE1OhlE9Q/ampxB6Nou+dRqEpWm+WuqK/SoeQh9uzUd8fq
 MuzXsA==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com
 [209.85.221.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6ev5bady-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Fri, 09 Oct 2026 10:06:12 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id
 71dfb90a1353d-5e24d542d40so5841858e0c.3
 for <qemu-riscv@nongnu.org>; Fri, 09 Oct 2026 03:06:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1791540371; x=1792145171; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=zXkaIX4q6dftwSI42CBrnmVy8Iuj6kVRFoPUDzbZk1s=;
 b=hvDWY3BZtC/gPlJcBW0KWVLHImg7y14HslGtGKzNebe6oriNTWh3Yg+rOQzwnEBBJ6
 I0PK1buDeXqrsdhT7m62/04Jhcdbzkx/o3UWVtNNy64US/V6MI9TzK7p9geEf2j9XsOr
 CNqi5f4GpYj7FNjVCUTDFQVHroB0mHag4Eafi75uNGG7Xkim7QRvjf5r9xD3J8gO8qsS
 rzpDE8Uxw+nzdIYOemgiijikXq2V8poLGTUis9KPTBySivVKeIyJ89//GCRC+EQ2h4Pk
 1Xo7YRtsIAMZp+KBGQT7KPSIkQc4cYIZ29ax7QMYSzRV8b87lbkmA94tBBThh3oA5bXr
 bbDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791540371; x=1792145171;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=zXkaIX4q6dftwSI42CBrnmVy8Iuj6kVRFoPUDzbZk1s=;
 b=Ag2CorS42L4S5c6k2+MLCrIFZ6d9IgD3UTPsI3JyjfWBMjhLm68b3mTqb31Ph0n8TI
 Yrc8P4R73FR/JthRbKFSZ/52m+aP3vwDQdJKG4X/c9y/6ET4pqRaqraq3u4pnK48zqCL
 IlKYNG0Q6Sfa424C5PpHP2O2yJn3ILMIJKqGNqtEqkwFeLoKHhXrW19chDNOugruE0jx
 PrKF8d8wtXSaQLXHv5nhU6okAg8hwjldudsqOaAo+rfbi4cBB96Y9Sjj/hXzl0AI+INU
 88C7wezUyPHWpsTtvc6eY9ex1ZFqa1tDUpUWDHxzS6deE60ZOlrki3KflMmoqI86/kXT
 1rKw==
X-Forwarded-Encrypted: i=1;
 AKwUvBxj6Ec8FpGYa/CXanCtRxWeOG4ge/8R4IjIhhxAB3j2Qr7vAG2TzCrGsTCN3AlepAkQNv7Q9yQQh/c1@nongnu.org
X-Gm-Message-State: AFq9FYIdxmxukQXZV/Mk0PxdCBT1sg0o3yb6M+98gvjHA3ChnoPtI+Q7
 rU3zBdtDVUhGhvntLajIgtDB5NQqv2KoFUPX15WCr7VeW0t9tVHlRU7Xx++SM+g2qQMWai55C+3
 2qwoRcjmgGa8dnCHZwCjqki5e4hzZBvO/TPmcO+WzwaGCXsU0FTkCjPcK1Q==
X-Gm-Gg: AYBFou1DTTg5X+QFvt+f2marJ42An/DsDVf0YmfY3vAjTCT8YdLknv+u5vyzHMYbLbx
 pCiQxZHk/qMDg70aLfQD1z3zVrW2McJb5d3avzoBTWFgTOgZkwL8nZPvsTp4DB9AsNwJeYd3mqy
 oTueb3yxVawcHERoFnVhJu2i+q15E+kQ2PVJmzvo2PqR5Z/ULce/AmrM0wM49Ts50/g0uk+kI0i
 0K4TBfTB35AfyywNFWStEE495TpVZeSCaWjUwrrvwXQx/pWKmcthwnFrmntpoN55My1KfAlHmIn
 pQGKYPr8/hs2ACzGQINQCMi0tUYRtiq2hd6xmmb02gJtJj60VEMgCs1T1jkYWAkdrxqLVAaWZHW
 Jt9j/iczjplTt//lS+lpmS9EPqSCKZLvFuQ==
X-Received: by 2002:a05:6122:f05:b0:5cd:a394:eed7 with SMTP id
 71dfb90a1353d-5e91f4cbf31mr438079e0c.18.1791540370775; 
 Fri, 09 Oct 2026 03:06:10 -0700 (PDT)
X-Received: by 2002:a05:6122:f05:b0:5cd:a394:eed7 with SMTP id
 71dfb90a1353d-5e91f4cbf31mr438052e0c.18.1791540370247; 
 Fri, 09 Oct 2026 03:06:10 -0700 (PDT)
Received: from [192.168.68.107] ([187.10.234.20])
 by smtp.gmail.com with ESMTPSA id
 71dfb90a1353d-5e91cab57c8sm1318540e0c.5.2026.10.09.03.06.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Oct 2026 03:06:08 -0700 (PDT)
Message-ID: <8820b952-4e2d-4e2b-8246-ef8f0120471d@oss.qualcomm.com>
Date: Fri, 9 Oct 2026 07:06:02 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/10] target/riscv: Factor riscv_gdb_get_reg_mxl() out
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-riscv@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Anton Johansson <anjo@rev.ng>, qemu-ppc@nongnu.org,
 Yonggang Luo <luoyonggang@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li
 <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>
References: <20261007232326.66240-1-philmd@oss.qualcomm.com>
 <20261007232326.66240-8-philmd@oss.qualcomm.com>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261007232326.66240-8-philmd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDA0MCBTYWx0ZWRfX/YEGczHhUwRz
 wRk3aJPTPmScqCvqllyp6SRQl8/hzhygZYyjYZjiTj0Rs4pUN+slojqqKtvNDVpmMnewRcabctn
 w9V37NyajmZTc4rI84NedB6BWEmCaWE=
X-Authority-Analysis: v=2.4 cv=MMT1C8Zl c=1 sm=1 tr=0 ts=6ac8bc94 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=jbqyKmyYbxlRs/MVMa3Ccg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=Gsz6G80eyQvzjCU96h4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-GUID: QcwG7v9ng13nVFHzh8Tq_o1c_9-u_-Tm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDA0MCBTYWx0ZWRfX5tNt9R5lSyNO
 SxXohfrxZpinlkpshKPwaNAimtVAiURuBRTalbWaT9U9++g+EHSScqGe/jxxaGbMpROYaoLUWOF
 PECL50ol9yqd8kAdj+m+aqPbi7cBihEIQxuVFsPKzSnLgsSG0r4Tjfvz/GLi82Vxyez/wjos3DR
 d5tD9IqEC7PKAoUGYzIfiVPLoYN+sAfhSLp2D7FztjeRIOEHr8t0XqqgSsJ0rWBu4xAY1W2IcNs
 KuwoiLwmG21Qa3dPZWnnl/7my6shzcMGs3Xzxyd7AkyQ9mY/wga99sFB69/iWLZLFw6myZ80tHO
 Br3C69GgF4W85w1sdtM8mXfdRThL5U6Nks01CMxucfuOpkO3Rp7k2Gh4ZuFToNg+W6i6fHLP4eu
 p5HEBx08rfvuvjsm0fOhjFRmDozEoWJg45xSWp1Z9G7LBg0YZaYgZTTfkATG2ZzkNlS6ZYnqVKk
 bdJj9nPNpnTkP8rHW5Q==
X-Proofpoint-ORIG-GUID: QcwG7v9ng13nVFHzh8Tq_o1c_9-u_-Tm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_03,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 clxscore=1015 spamscore=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610090040
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=daniel.barboza@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
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



On 10/7/2026 8:23 PM, Philippe Mathieu-Daudé wrote:
> Move the MXL-based selection of the register width out of
> riscv_cpu_gdb_read_register() into a helper, so it can be
> reused by the following patch.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
> ---

Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>

>   target/riscv/gdbstub.c | 29 ++++++++++++++++++-----------
>   1 file changed, 18 insertions(+), 11 deletions(-)
> 
> diff --git a/target/riscv/gdbstub.c b/target/riscv/gdbstub.c
> index 9abbf5bcdf0..b3c11db5397 100644
> --- a/target/riscv/gdbstub.c
> +++ b/target/riscv/gdbstub.c
> @@ -54,9 +54,25 @@ static uint64_t ldn(CPURISCVState *env, uint8_t *mem_buf, size_t regsz)
>       return (mo_endian_env(env) == MO_LE ? ldn_le_p : ldn_be_p)(mem_buf, regsz);
>   }
>   
> -int riscv_cpu_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n)
> +static int riscv_gdb_get_reg_mxl(CPUState *cs,
> +                                 GByteArray *buf, uint64_t val)
>   {
>       RISCVCPUClass *mcc = RISCV_CPU_GET_CLASS(cs);
> +
> +    switch (mcc->def->misa_mxl_max) {
> +    case MXL_RV32:
> +        return gdb_get_reg32(buf, val);
> +    case MXL_RV64:
> +    case MXL_RV128:
> +        return gdb_get_reg64(buf, val);
> +    default:
> +        g_assert_not_reached();
> +    }
> +    return 0;
> +}
> +
> +int riscv_cpu_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n)
> +{
>       RISCVCPU *cpu = RISCV_CPU(cs);
>       CPURISCVState *env = &cpu->env;
>       uint64_t tmp;
> @@ -69,16 +85,7 @@ int riscv_cpu_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n)
>           return 0;
>       }
>   
> -    switch (mcc->def->misa_mxl_max) {
> -    case MXL_RV32:
> -        return gdb_get_reg32(mem_buf, tmp);
> -    case MXL_RV64:
> -    case MXL_RV128:
> -        return gdb_get_reg64(mem_buf, tmp);
> -    default:
> -        g_assert_not_reached();
> -    }
> -    return 0;
> +    return riscv_gdb_get_reg_mxl(cs, mem_buf, tmp);
>   }
>   
>   int riscv_cpu_gdb_write_register(CPUState *cs, uint8_t *mem_buf, int n)


