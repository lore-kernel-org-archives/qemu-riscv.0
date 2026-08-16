Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22067C5DF6D
	for <qemu-riscv@archiver.kernel.org>; Sun, 16 Aug 2026 17:09:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wveM5-00023I-7J; Sun, 16 Aug 2026 13:09:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wveM0-00022s-Lj
 for qemu-riscv@nongnu.org; Sun, 16 Aug 2026 13:09:01 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wveLz-0003pB-0D
 for qemu-riscv@nongnu.org; Sun, 16 Aug 2026 13:09:00 -0400
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67GDl0Ob3448764
 for <qemu-riscv@nongnu.org>; Sun, 16 Aug 2026 17:08:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 P471K91sSjLLshmItQyYGmAoYtVybZk/mKncMzbt4Sc=; b=C4EOZBfrTjS5+E1y
 +EMJ+gh20gvqwtWSOzpwu21AlS+ZtnF+gp06j75Z+l5kgYWTjmPFmK1rxbN/IsUa
 fmVFuOGPSPI+fvXIyL2Z/23aDBDH66/7n2EGwbexE4cI4lu5zTrzzxySFelpM7ic
 mpPTKdP0eXsGyHbaogXpOClx+R4RUINBrs1cY1GKXrXjWXmTk7XC/uEMeh9viRIG
 pnoUdgqrgZ4mHKhz+XwZpCcsi4hdrscbdYLwUG81gn5hTSjtMVu10IjFKx/l7Bee
 RWtN/u29pWg30Wn3oJuHdezpCrtrREVRSmgxL+uKywBiQbEGkS/lbfnnEZ/aZoTu
 YZfJvg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g2ghk3wcs-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Sun, 16 Aug 2026 17:08:56 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-934979ee9f1so329793685a.2
 for <qemu-riscv@nongnu.org>; Sun, 16 Aug 2026 10:08:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1786900134; x=1787504934; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=P471K91sSjLLshmItQyYGmAoYtVybZk/mKncMzbt4Sc=;
 b=YfD2LharAJwQhzimbWRMNj8WeQKeqy4BNCrbfSiOMrQb078mwWftdCAbEWXYPVbsO1
 vTj4DpJ0EkjGae/t21eQSdCD28a0Ev8WXQP0H6cGDTuuxG2x5peHrNXgAK0XOqsTyeJB
 VUNsnNvhOj579P1hAKA7QRLxGKUTvPJg7QuKdtFjAJP5AaTVDOzTwVtfntLLeFUesCW1
 sOdhk/qFFRzCY9EkZvBlfrhBjdRHT6UbJ9JKyV5x85YlzmWiBjvRV0xqScwF619IAKim
 0s8r22U+kGntayUPbdTlO9nE4J3Blo1qrlwsaCk0714/cVFSNxPiyTCQu454cJIX7VGF
 w5ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786900134; x=1787504934;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=P471K91sSjLLshmItQyYGmAoYtVybZk/mKncMzbt4Sc=;
 b=aim/8mgoP6C+QSdOPg/WlwvHmjJu4lwX/btn27v23BI9cVHek3t6NHU+HBa5irF33E
 BG5mF/zyeXaz30dsw55dSP78v8sDlT0X1N9XqQ3HDtjp/oNhtnghf1vl6S+FftVOqH/+
 WP0C8PE6E3fW9X2UWSUQbBKA82y+ZcfWtWr917omra3IV0dQddx7dVT+ZV3j8sn314uk
 uerMalwSpM1jU2Ab/YBseY8s2FrWekCsTdfy5dpMZEtb45MzApEDQbs0I+JF5P/7Zq9Z
 4PbDiQpAvwa2ojBDJEew78yotYr8ntAV7BOWfoahdSlzop5Q0X0aEvZHuGdEzRlYroLj
 7tpQ==
X-Forwarded-Encrypted: i=1;
 AHgh+Rok8yDbd7CMlv5x0ybwuaiqUTwZloYMYVhk5U6Gq3964PPjbzXb7r7rF3nLL8ARp3nr7pAjzTL6W7B/@nongnu.org
X-Gm-Message-State: AOJu0YzHbYQ2D1oTXb8TSXczDQcQ6qm+STna+vYaNvqC6siSOcKrWXi2
 PsYBuCnoYc1dN7/h2KY8XtOdWqOny9epD732BCGhsYylEsuboMUHrlikHQ31Baj0wt6vqoLKv9X
 4RRtMbrYA1Sk+Eb8j2upDR09v9S3sJTEX4cM+SijI+xSPwdBiCNaj5LLVaw==
X-Gm-Gg: AR+sD112ANpeG1L7HDQiNci3TS7VqezT9IBmz1QRN26hLoXWa1UM8rdHOFEcRZ6t1nG
 PFK/lsJqFJA/+ZwRkGV47onVJmWzgdcRlcmtichmMZgJgLESkjHq2frP0E8adIhjqDA6ym1nPtT
 621ES5al/uBUjnWtdikgYhssRi3pkKAqrTYV0zge9Ron0OrrFfuaD+l9uTTjd1q0Dzrssmgeef5
 +hqHK3x1//UEYAD/xosmllhGkhIxfx+k1Bh3AYnrzG4vB1+GBLeMq0m71SXpFLh+B5BX0MKBpJq
 ovFIJZcbgXL/tI9AGThXJHpa/9FLn7FZWSLRrApeKcNmmstZZolEFkgDz2S7C9xYtm+RdJBbx/O
 o4vepXar6SOM+KCTAsfJlIOA=
X-Received: by 2002:a05:622a:c6:b0:51c:1e2f:1281 with SMTP id
 d75a77b69052e-52d854f1871mr212658301cf.42.1786900134153; 
 Sun, 16 Aug 2026 10:08:54 -0700 (PDT)
X-Received: by 2002:a05:622a:c6:b0:51c:1e2f:1281 with SMTP id
 d75a77b69052e-52d854f1871mr212657691cf.42.1786900133685; 
 Sun, 16 Aug 2026 10:08:53 -0700 (PDT)
Received: from [10.111.141.238] ([212.136.9.21])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4998780397dsm96599925e9.3.2026.08.16.10.08.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 16 Aug 2026 10:08:52 -0700 (PDT)
Message-ID: <0f89046e-6889-42a4-a967-0bfaaab869db@oss.qualcomm.com>
Date: Sun, 16 Aug 2026 19:08:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/1] target/riscv: Add Zihintpause support
To: qemu-devel@nongnu.org, "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>
Cc: Dao Lu <daolu@rivosinc.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Heiko Stuebner <heiko@sntech.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Anton Johansson <anjo@rev.ng>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
References: <20220725034728.2620750-1-daolu@rivosinc.com>
 <20220725034728.2620750-2-daolu@rivosinc.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20220725034728.2620750-2-daolu@rivosinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE2MDEzOCBTYWx0ZWRfX7as2vaYeQJ2S
 SUsQuqrPnhFlTv9pl8FjfT3x3N5auJgFooHcBVZ8cJnopsilLWRnFXrvo54prWUOqb3b98GCbv/
 4IvRyxaWAjR1nqPoXOTBSSMsQYFdxtQ=
X-Proofpoint-GUID: i8KBiGtBYLb5Iz22x0V_oFehgNN7OY9R
X-Authority-Analysis: v=2.4 cv=f+14wuyM c=1 sm=1 tr=0 ts=6a81eea8 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=/bviTfK1dmy+WGcHzWQ0gg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=JF9118EUAAAA:8 a=h0uksLzaAAAA:8 a=mHwnvXAwzdtxKzu_xlgA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=xVlTc564ipvMDusKsbsT:22 a=MSi_79tMYmZZG2gvAgS0:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE2MDEzOCBTYWx0ZWRfXw/PSn1D1EC2Q
 Wli1CboYfOtc3uMRoOpc9DsIVy/uTR4zVWzoNP4pXhEOLuuEImTpe5QXb/s62zQILBT2r3oyBKe
 6dNQ1DNsrLWqzPjXaZGzXqqR1Dw/X0L5Es8gWG4DgaoArOC7yT6dvrnomebVph/64YPLKMtSr6k
 FrJZpNbz7rttAGCRdnwPH/JCBOcg+aGaCydQXjVXlEKMrD5Jpk/LyWudrI29eG2nt0nvyWDoPnn
 xRjS7XnE5yztqMYFb38xJw0Khng9//pBZFVPfJJM7W7CEM4OMt6BAmtA0cKzpQaDljU3HJmKbkx
 ctWwSDnybnETChgzzeAIjEqZ1lUSp6o8lr/kmUl359LTpI+Np4HU2SO3gXLRMUavgA1CNxJKiiw
 L4qaKvHf1tqAeEbSbdme00HN716PXbDPVc42tnNEhIhFPNg0EDQchc+B9tuxC7Z/un4JpljH+0M
 MAOY4+TVEI9tqiyv4Zg==
X-Proofpoint-ORIG-GUID: i8KBiGtBYLb5Iz22x0V_oFehgNN7OY9R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-16_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 bulkscore=0 phishscore=0
 malwarescore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608160138
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

(now committed as 4696f0ab5c436ed53567ce6baec67c921d9b70ae)

On 2022-07-25 5:47, Dao Lu wrote:
> Added support for RISC-V PAUSE instruction from Zihintpause extension,
> enabled by default.
> 
> Tested-by: Heiko Stuebner <heiko@sntech.de>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> Signed-off-by: Dao Lu <daolu@rivosinc.com>
> ---
>   target/riscv/cpu.c                      |  2 ++
>   target/riscv/cpu.h                      |  1 +
>   target/riscv/insn32.decode              |  7 ++++++-
>   target/riscv/insn_trans/trans_rvi.c.inc | 16 ++++++++++++++++
>   4 files changed, 25 insertions(+), 1 deletion(-)


> diff --git a/target/riscv/insn_trans/trans_rvi.c.inc b/target/riscv/insn_trans/trans_rvi.c.inc
> index ca8e3d1ea1..c49dbec0eb 100644
> --- a/target/riscv/insn_trans/trans_rvi.c.inc
> +++ b/target/riscv/insn_trans/trans_rvi.c.inc
> @@ -792,6 +792,22 @@ static bool trans_srad(DisasContext *ctx, arg_srad *a)
>       return gen_shift(ctx, a, EXT_SIGN, tcg_gen_sar_tl, NULL);
>   }
>   
> +static bool trans_pause(DisasContext *ctx, arg_pause *a)
> +{
> +    if (!ctx->cfg_ptr->ext_zihintpause) {
> +        return false;
> +    }
> +
> +    /*
> +     * PAUSE is a no-op in QEMU,
> +     * end the TB and return to main loop
> +     */
> +    gen_set_pc_imm(ctx, ctx->pc_succ_insn);
> +    tcg_gen_exit_tb(NULL, 0);

Looking at this because I'm auditing the overall exception scheduling.

This is a clever way to quickly return the inner vcpu dispatch loop,
but doing so we can not reach the outter loop to yield to another vcpu,
so I wonder if we shouldn't use EXCP_YIELD here. The problem has be
unnoticed because most of us use MTTCG (the default) where EXCP_YIELD
is irrelevant, but I expect this to be problematic on single threaded
round robin TCG (although not reproduced). I noticed that when working
on the hybrid accelerator project -- which is not merged yet -- where
we use MTTCG and EXCP_YIELD is returned by hw accelerators. I'm happy
using this simpler helper, but since this is a big logical change and
I'm not familiar with RISCV I'm am not certain:

   +void helper_pause(CPURISCVState *env)
   +{
   +    CPUState *cs = env_cpu(env);
   +
   +    cs->exception_index = EXCP_YIELD;
   +    cpu_loop_exit(cs);
   +}

> +    ctx->base.is_jmp = DISAS_NORETURN;
> +
> +    return true;
> +}
>   
>   static bool trans_fence(DisasContext *ctx, arg_fence *a)
>   {


