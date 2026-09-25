Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAAFDC9830E
	for <qemu-riscv@archiver.kernel.org>; Fri, 25 Sep 2026 16:45:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xA938-0001SR-0G; Fri, 25 Sep 2026 12:45:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xA92r-0001OA-QA
 for qemu-riscv@nongnu.org; Fri, 25 Sep 2026 12:45:10 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xA92p-0002il-Mi
 for qemu-riscv@nongnu.org; Fri, 25 Sep 2026 12:45:09 -0400
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68PG5LsE1759230
 for <qemu-riscv@nongnu.org>; Fri, 25 Sep 2026 16:45:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 bgJdNVPNIXz6/6vxBeeY4FT3sU03eEKOOlaTO1KM3FM=; b=Ulo28Oa/2M/OOfw9
 IIqgQg+nobn8GvTGvXdBUZkkRjKheS3R8A6tYZ9WO6YbUWHMkbF8KWknljjFQS3k
 +tRpdZTnmZwQwWDmVDLWyT20khr9XB4vlJg4O2f+Q0LUY6dp2JS6vxEdYRoFaUmQ
 hcJ6B4fq8NtKajQYoN8BHfS+kUibPAe/V6RP6/CWc7zCmlTGW69EmA/GMtjn0Azk
 OzsdbKthX2Cr4SxiqAW3wfE6U8tvsS3G9/LZYnknxHnd+/DPTWbn3rp1D0grrBXK
 UOudByywPnoIJvsmUoHgrv56826qU1/bPOPoslFXFZmoLbtIAwO22NAzM6RZZWt+
 FfFiGQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gwv5yr55b-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Fri, 25 Sep 2026 16:45:05 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-939062ecda9so207299185a.1
 for <qemu-riscv@nongnu.org>; Fri, 25 Sep 2026 09:45:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1790354704; x=1790959504; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=bgJdNVPNIXz6/6vxBeeY4FT3sU03eEKOOlaTO1KM3FM=;
 b=aBk/Z8PFvynBQtjfazW3VkaBRTtYE7cNRGbuwo+hDQWn3bd0ZIY6RLI8iSPk5ps8qw
 0pFblEAZXecbJen6HW+Q6NjSanlvZpheoemgbaCrB4PBSJ1YDjYI3iEs6zP+wBrUI3K1
 el2ZAoLH+dtETk8zb8DY8C+Vh/DjVWp+81qsKaGpm8C+s7kf7Frxdcuvrert3teLEgaK
 XACNWPXkzaa80tWdG74qYuNk+r/f9iL+kAUz+dEc1GRkXUUfxWRW0ZQPH6CB3CBc8fL4
 WlI9tn4h8jeQYsQpCZGF1n3+SRWlxHkTVV+T15gW73FDIj9TCRbGTCuX2eqTPs5BJd4R
 HLZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790354704; x=1790959504;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=bgJdNVPNIXz6/6vxBeeY4FT3sU03eEKOOlaTO1KM3FM=;
 b=y5dBkWBu0f1LhMvEGT3JN4tmVb8mfwkkZipXPiIwEZMTwQ4/XFebMRy6tKTZX7ucD1
 NJnN7VVnePnRqOypShobnO1+zjh4ecE8KUOAZSuIWPO6JMtiyo22DAHQBb+FFnM1HppY
 J9f0LGb1qWhhwCrJ02l9GeIS9mn7UelFSiCBPihyQTP7+1bzZ7dS4nSU0k97YYYSC9vn
 1o6d34IraY2qE/+zHukIhwg9BaKCLnHvIO7zwRAXtJAaxstmIC43nBEA008CuVyHARqO
 vPdwDj9bfSUCRZAKOvKjiPLDxlxkArPz+qGYEFWgv5xyeceQpO9NxPSrcN/2ya8bZ7gv
 CySw==
X-Forwarded-Encrypted: i=1;
 AKwUvBy8Sj5IZfUXXRWWeB07Cv8ti3QMCQrAh43GZCuG00QO6ygVoykpCwTzbv1Mkpn4D9r/m6Q7QLKQUlzw@nongnu.org
X-Gm-Message-State: AFuF++mpQfQCR9cVuf4u7oeHvVw0a+LVmMeuKylR/zJCV2rDUV8r6sln
 BVAl/WHEN5o7ltOxrTeNWTbVYGV9cpbI/H+0bxcaPZJUq3E9cYP3juQBDYr0HGo/4X4jHlLxO3r
 fxNf7FQfFQBaAVgs2rncde6IIGSH+piHubeSffkynfryItKMfnpKRsMetNw==
X-Gm-Gg: AYBFou0gEt38MByh4cK66CF79YNAhF7x8LGiXLzi9zRbRbNgDypASX/q1zP18RuNUDu
 AmfLrtXT5KmbBD710hGGgdaCtap5g+fonbwySjO7jj4UBfFC9pgzRmevPsXDO9Y/VHmVjrDuUsi
 GsQs1dzUcgnW1tUhvDSQ2jTmkyPvzeI34PqhsxRbyfc1URqGWSxl2du3ZIK5YORWohRmV54/UM8
 eYZVLxEfmUtDhBaCVB8cOyQwjrfMYEuHFK5XkIbMRB2OCJRyR5DCUtcTWKQjqOHslIja9Ov//VU
 UMrR1dB9E77G7a+jzzhO4C8JnYZLEwALHI8NlteNhazsNbvlvTXsY2erhjjOqdfr1OLjj945r+2
 LZJAaZ7NooHqFfcD9u19eKWfoC9SrO7riUw==
X-Received: by 2002:a05:620a:8389:b0:939:f8e9:5e19 with SMTP id
 af79cd13be357-93c43c2f3ecmr558820485a.1.1790354704375; 
 Fri, 25 Sep 2026 09:45:04 -0700 (PDT)
X-Received: by 2002:a05:620a:8389:b0:939:f8e9:5e19 with SMTP id
 af79cd13be357-93c43c2f3ecmr558815285a.1.1790354703938; 
 Fri, 25 Sep 2026 09:45:03 -0700 (PDT)
Received: from [192.168.68.102] ([177.94.15.187])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-93c44421508sm223090785a.0.2026.09.25.09.45.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Sep 2026 09:45:03 -0700 (PDT)
Message-ID: <ba8f5a00-1da4-4f09-a45f-6666ae0d73fe@oss.qualcomm.com>
Date: Fri, 25 Sep 2026 13:45:00 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 13/14] target/riscv: Clear virtualization mode on reset
To: TANG Tiancheng <lyndra@linux.alibaba.com>, qemu-devel@nongnu.org
Cc: Zephyr Li <fritchleybohrer@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>, qemu-riscv@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
References: <20260910-riscv-pmu-correctness-v2-0-5da5159a0c64@linux.alibaba.com>
 <20260910-riscv-pmu-correctness-v2-13-5da5159a0c64@linux.alibaba.com>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260910-riscv-pmu-correctness-v2-13-5da5159a0c64@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA2NiBTYWx0ZWRfXwH5dIGPJiaJE
 Aog/oNbn/e5MrZGh5UK6+D0KIV0JhTB3RIyqeJid8X1uGOjvszbbDN/Jog+M+vEOEechdubMRjk
 tXQa5SixpZfi05le8+WJ9fSUitd3S6l86p4jno9xWiqGNhL0J0M6490Ew0xWjliHvdwSw6S6YQr
 OMCdjrPGCZN0cUtF0ehv7C6w8nEzPtk1jTndFoQoRytV3QZH6A4Cd8u91cdUPOo+DSu2PvqLbCS
 zkyn8XbSvkY0YnVMJAGgLz/vE/M19c615MBEB1Ixgqb+JPw74doJCaBpKuqasi6u11biOmb+XYr
 MI2JE5iGLAV5lHsibNi/wAfTSpKDxZ7EDc3tZnQeGMAin7awRDkfiCHiwB4jPFqczCHWan+6k+m
 SgJuFwKmxoXyb2hzUYoOli7vwniXOXx0JLKt+Kg4ZNPcDojYA0Nhi0QXOb17SAUP98b6GHyt/4l
 gkfOQPbGT4wK+vCtl1Q==
X-Proofpoint-ORIG-GUID: -pAwDLOkdkiNhlcFaCSljeiTlfxxvYrD
X-Authority-Analysis: v=2.4 cv=EoRHPicA c=1 sm=1 tr=0 ts=6ab6a511 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=0kFmPUMe/4ewoYCJjrGTNA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=SRrdq9N9AAAA:8 a=EUspDBNiAAAA:8 a=qWS3GbcsPDoVOp1RmmoA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA2NiBTYWx0ZWRfXx9HNxaIowDCP
 MVNKSiq9dyqiv6mOHZiVLOv/Ub4tRpYGqSyjHnU55GbL8kj03TsvibfMcC5R1pGv5FUPTpAadeo
 pkrHpwihorl2qY3xCs52ve8+Y9gdkt4=
X-Proofpoint-GUID: -pAwDLOkdkiNhlcFaCSljeiTlfxxvYrD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 impostorscore=0
 adultscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250066
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=daniel.barboza@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
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



On 9/10/2026 11:39 AM, TANG Tiancheng wrote:
> Reset enters M-mode without clearing virt_enabled, leaving an invalid
> M-mode, V=1 state after a reset from virtual mode. Clear virt_enabled
> alongside the privilege reset.
> 

This one is quite old.

Fixes: dc5bd18fa5 ("RISC-V CPU Core Definition")



> Signed-off-by: TANG Tiancheng <lyndra@linux.alibaba.com>
> ---

Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>



>   target/riscv/cpu.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 5fff9d745e9b36d9cbd30f166ec91b5165e5f497..f60d7cca1e2f0008b09b1055c5cdeed3ec4ad1d3 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -980,6 +980,7 @@ static void riscv_cpu_reset_hold(Object *obj, ResetType type)
>   #ifndef CONFIG_USER_ONLY
>       env->misa_mxl = mcc->def->misa_mxl_max;
>       env->priv = PRV_M;
> +    env->virt_enabled = false;
>       env->mstatus &= ~(MSTATUS_MIE | MSTATUS_MPRV);
>       if (env->misa_mxl > MXL_RV32) {
>           /*
> 


