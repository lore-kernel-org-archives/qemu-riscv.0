Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB04D606A320
	for <qemu-riscv@archiver.kernel.org>; Wed, 11 Nov 2026 00:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nHbOFEut;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=U1fKEzy9
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xQvsw-0008N9-Oj; Tue, 10 Nov 2026 19:08:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xQvsu-0008ID-BL
 for qemu-riscv@nongnu.org; Tue, 10 Nov 2026 19:08:16 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xQvsr-00046E-TO
 for qemu-riscv@nongnu.org; Tue, 10 Nov 2026 19:08:16 -0500
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6AAML53r1449784
 for <qemu-riscv@nongnu.org>; Wed, 11 Nov 2026 00:08:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 +XOo+KfXyNDAzvJ/Dmaqv8dqYczcmyv8pWQrY1+9uGg=; b=nHbOFEuttB0tLNK8
 xZZlRC12SpRs6Fq7ONeXLSyxcCVIaoSzju+0kvOMRJAZm5o1dBAAYI+DQYYKdTVi
 K7c0P7qzoIhdC8l1HNqr5fYMjio9aRbiftSz0Q/NCGGr87yY0P8omfQzKgP7exez
 iZNoNqkHU7QZ9C9HdSwCDr5lS3N3eS+jTvIuFR3dS2UiY/d3DnCeaTQmq+7O6mwq
 KjIc2HKiChrqiDSSaAScUNrLY7EI1GNrIfk+i+UFYYYvXO1SvBQ2flbs/5C+rBkG
 fMd8MOYV90G7rNsAa2XAJJ3lY9wVIgZedqyRUNhMXXzOQQsmCfladg5OC46xvBP/
 qFY4WA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4huyvwkfx4-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 11 Nov 2026 00:08:11 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-93909014c85so556988085a.0
 for <qemu-riscv@nongnu.org>; Tue, 10 Nov 2026 16:08:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1794355691; x=1794960491; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=+XOo+KfXyNDAzvJ/Dmaqv8dqYczcmyv8pWQrY1+9uGg=;
 b=U1fKEzy92FysQWtWsi132SkngR6OCz51xe4hjzepZccPrIYVcpxRkQqTFhjMQ3YIuj
 nMgw6Mc281KaucoPpFR+WFR0QV2lUBy/4+iOA3GrlOehJ4vNqDvqqBO2x0wDtOpxb/T3
 tj2zwlcuLErjElzhYrKzGxccd3HPYcOnsgWgl8zde1YICya3MYiRhQF1jlcv/n4muP0Q
 KY7mI/9NyEBw7IkWR8nBHUMTHX3wUyKJG2uAfeflYtbXqToh7yG2bQdIZhZ0sJOymdd5
 9Bwilo10peDmQnCHc5ys6S0Q5ZP/By+3PRO9XsaKqL4Wv7lHL19qeIr/NId3PFUIIys1
 Mw6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794355691; x=1794960491;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=+XOo+KfXyNDAzvJ/Dmaqv8dqYczcmyv8pWQrY1+9uGg=;
 b=k+F12px9FvB4ZzSFiThN/egyt3kRfnN+ikCwfAj5tvnyqp9pi5/0XO/uaVWuGNNBQ0
 0pP/G3jE49fCLBafPPCHPa3965jAs7banqivZJWc2c6yNEs01ExdyPGHhV7FBhJwh+GD
 27oH2ioqJ6DvBWzNjVcpbg/exReHYS56avgSETLHYwBJfa9PoyQUusXkgSFmAEtMn3mR
 y2bpM8kv5YSRaXvf134ZBdE9FmGG8dlQkwqIO1IydQ14QJ72xjBdJGfxWPgVcSeqtQ2/
 R8rVT3myDuj9dJQbwpYRxZcbeem20MLZpZW7RZjmgFSWInvlwoj5ptXllutdMvD9CFMZ
 aA5g==
X-Forwarded-Encrypted: i=1;
 AL+hErG+y96Dr+Dk/6wTpYAcBmnY9D1XtqxyLqYCjzeX8Nyh9F9AyuKGeOIjxD98e0Q7/+2OVdw+0YPPTQuu@nongnu.org
X-Gm-Message-State: APuU4Z9m50Q2U+shrrljQMvpBw//UX/itvgJBJwXYo+QkrdMjbdxgXWd
 ltNtR5oG3if49qpYVYgNjhAw8hosIEDVSVEc56+TkOIx3fMP3Qb4htlhpi2ZKUGj1JCLyZ3V63r
 axkbK0lDXbEoHHL78VGSbTS18FdWt132Xd1ixGRumSElct/RIrJJghQzycQ==
X-Gm-Gg: AYBFou2Skau4htoyCAtTAF2K7ckje3fRelCqfFctvWtrG7YBXLIx6Mk/8vTeSJvdDcN
 AlyBDuILgOd0Ez4u7HdmxQU9JE5CF4yfhzSYRkp8izxRoWr/S3V5AuWnE/P64ONnj2zUkGIIGMs
 s0QZDF6bGMOfQYUrPefUpttOdXM9z+CY5aOr2LRSZLGF9OMdtQ89GRYyj+veeh5jmOCA5Ly31Rx
 gpQ/8apI2tfxkCmcBCW9DqOjlPsR/i2DuLj6ilPON8eWa9B7gmdyJ9dekqluBZPZuaTY45MDIPi
 r8VxK8subqZbjnOEhmipERnQdq/98ApJLkeYyMOsfiGE6DiYo0ECjIEc+S+dThCEJZUZ93JPgy+
 yGYGw8iuPhxmiTupM+819EPFQuYDu4khKn+XcPh8r9ZANRFgKFS9Sx/AjfnV9axM6nIIMeAXNhF
 itz9d/8lVCsQ==
X-Received: by 2002:a05:620a:808d:b0:93e:fc4e:c48b with SMTP id
 af79cd13be357-947b0079a99mr107961985a.61.1794355690693; 
 Tue, 10 Nov 2026 16:08:10 -0800 (PST)
X-Received: by 2002:a05:620a:808d:b0:93e:fc4e:c48b with SMTP id
 af79cd13be357-947b0079a99mr107958985a.61.1794355690147; 
 Tue, 10 Nov 2026 16:08:10 -0800 (PST)
Received: from [192.168.68.105] ([152.234.124.231])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-9479e734698sm353695685a.13.2026.11.10.16.08.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Nov 2026 16:08:09 -0800 (PST)
Message-ID: <13ff4658-bf39-4b80-8818-957adb3f4f68@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 21:08:05 -0300
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] target/riscv: change mstatus bits for read-only if S
 ou U unsupported
To: "Christian S. Lima" <christianslima@proton.me>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li
 <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
References: <20261110232614.83050-1-christianslima@proton.me>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261110232614.83050-1-christianslima@proton.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: wuO-ZSWYzrukSc6nf3WvmHaBB9H2HVxk
X-Proofpoint-ORIG-GUID: wuO-ZSWYzrukSc6nf3WvmHaBB9H2HVxk
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDAwMCBTYWx0ZWRfX5UBO/Gs9FjaA
 sFHOxliqj5jDN9oD0XENEDijnabXEqfWjBZOqnGnFuA0/mvn+SS5aUJ3i6znrfneo9vy5NT9jFP
 Qnp2+yYCvGlEO7ygvrnWYnckiA9Jo4A=
X-Authority-Analysis: v=2.4 cv=NNpAaE6g c=1 sm=1 tr=0 ts=6af3b1eb cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=8elE1k/PHQNyZ14TNTodlQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=p0WdMEafAAAA:8 a=EUspDBNiAAAA:8 a=KPDRrMschBuxgPRWLJUA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDAwMCBTYWx0ZWRfX+r4kJiTBxDEv
 U0oW1kckCkQvsN2mlzwNrrHI3f7/STGgUBKfDCfY3P4nizt/ksxG1Na+EGi44ZkKTNpQNCEHSjI
 QeAHxAPzCqEz7YOnzUSHVvD1VYYQg3AAOorQb+d4YtImW09iezTBk9UZlm59/vU5DfAJ2nSLzF2
 fof3UgY02E+ALKlJxtMooEkYIGNNHohhGrngUfQPHF6ih4CceotATBTIu5E+R21378fSnF1PLhr
 Dsex98VfgY3cbu1BQozrwII7aHm5TALTj04GdPDptnOAqqI8rLNTu8vIywkrOFkS8IFGHZjkLX2
 RC5NQ1RnS8NFP6+jBjD/UhhjWestFPo+q9VJofdd3BnqsTqU7NdMzXtbWPdtu1KLcy+prTWtC5s
 jJBX+OjVjOvF44Z+0Ao5FrzqgyAG0bsnwEaV0VhtjwRxqUMPMucJRJH63KRUDSEHw+VccUQxsJ3
 eJKTGBQyG7kPSEnIy1Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_07,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 adultscore=0 phishscore=0 priorityscore=1501
 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110000
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-22.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 11/10/2026 8:26 PM, Christian S. Lima wrote:
> The risc v privileged architecture says that mstatus.SXL, UXL, TSR,
> TVM and MPVR should be read-only when S-mode or U-mode are not
> present.
> 
> changes in v2:
> - Don't change bits in target/riscv/cpu_bits.h
> - Add checks to S-Mode in the mstatus.SXL and U-mode mstatus.UXL in
> the target/riscv/cpu.c file that were suggested by Daniel in the
> review [1]
> 
> Link to v1: https://lore.kernel.org/qemu-riscv/20261104223049.86286-1-christianslima@proton.me/
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/4456
> 
> [1] https://lore.kernel.org/qemu-riscv/20261104223049.86286-1-christianslima@proton.me/T/#mddbb34a3ea837e3c707131a2e354c63c989ab029
> 
> Suugested-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
> Signed-off-by: Christian S. Lima <christianslima@proton.me>
> ---

Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>

>   target/riscv/cpu.c     | 12 ++++++++++--
>   target/riscv/tcg/csr.c | 17 ++++++++++++-----
>   2 files changed, 22 insertions(+), 7 deletions(-)
> 
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 15c27f4ce4..50bdfbe025 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -997,8 +997,16 @@ static void riscv_cpu_reset_hold(Object *obj, ResetType type)
>            * The reset status of SXL/UXL is undefined, but mstatus is WARL
>            * and we must ensure that the value after init is valid for read.
>            */
> -        env->mstatus = set_field(env->mstatus, MSTATUS64_SXL, env->misa_mxl);
> -        env->mstatus = set_field(env->mstatus, MSTATUS64_UXL, env->misa_mxl);
> +        if (riscv_has_ext(env, RVS)) {
> +            env->mstatus = set_field(env->mstatus,
> +                                     MSTATUS64_SXL, env->misa_mxl);
> +        }
> +
> +        if (riscv_has_ext(env, RVU)) {
> +            env->mstatus = set_field(env->mstatus,
> +                                     MSTATUS64_UXL, env->misa_mxl);
> +        }
> +
>           if (riscv_has_ext(env, RVH)) {
>               env->vsstatus = set_field(env->vsstatus,
>                                         MSTATUS64_SXL, env->misa_mxl);
> diff --git a/target/riscv/tcg/csr.c b/target/riscv/tcg/csr.c
> index af444e3e6f..24eda54bac 100644
> --- a/target/riscv/tcg/csr.c
> +++ b/target/riscv/tcg/csr.c
> @@ -2081,18 +2081,25 @@ static RISCVException write_mstatus(CPURISCVState *env, int csrno,
>           tlb_flush(env_cpu(env));
>       }
>       mask = MSTATUS_SIE | MSTATUS_SPIE | MSTATUS_MIE | MSTATUS_MPIE |
> -        MSTATUS_SPP | MSTATUS_MPRV | MSTATUS_SUM |
> -        MSTATUS_MPP | MSTATUS_MXR | MSTATUS_TVM | MSTATUS_TSR |
> -        MSTATUS_TW;
> +        MSTATUS_SPP | MSTATUS_SUM | MSTATUS_MPP | MSTATUS_MXR | MSTATUS_TW;
>   
>       if (riscv_has_ext(env, RVF)) {
>           mask |= MSTATUS_FS;
>       }
>   
> +    if (riscv_has_ext(env, RVS) || riscv_has_ext(env, RVU)) {
> +        mask |= MSTATUS_MPRV;
> +    }
> +
>       if (riscv_cpu_cfg(env)->ext_zve32x) {
>           mask |= MSTATUS_VS;
>       }
>   
> +    if (riscv_has_ext(env, RVS)) {
> +        mask |= MSTATUS_TSR;
> +        mask |= MSTATUS_TVM;
> +    }
> +
>       if (riscv_env_smode_dbltrp_enabled(env, env->virt_enabled)) {
>           mask |= MSTATUS_SDT;
>           if ((val & MSTATUS_SDT) != 0) {
> @@ -2111,12 +2118,12 @@ static RISCVException write_mstatus(CPURISCVState *env, int csrno,
>           if (riscv_has_ext(env, RVH)) {
>               mask |= MSTATUS_MPV | MSTATUS_GVA;
>           }
> -        if ((val & MSTATUS64_SXL) != 0) {
> +        if (riscv_has_ext(env, RVS) && (val & MSTATUS64_SXL) != 0) {
>               mask |= MSTATUS64_SXL;
>               val = riscv_write_uxl(env, val, MSTATUS64_SXL);
>           }
>   
> -        if ((val & MSTATUS64_UXL) != 0) {
> +        if (riscv_has_ext(env, RVU) && (val & MSTATUS64_UXL) != 0) {
>               mask |= MSTATUS64_UXL;
>               val = riscv_write_uxl(env, val, MSTATUS64_UXL);
>           }


