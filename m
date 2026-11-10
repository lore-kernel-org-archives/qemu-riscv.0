Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7F31606A321
	for <qemu-riscv@archiver.kernel.org>; Tue, 10 Nov 2026 11:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RxKSBkd1;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BMOkKh9q
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xQk7n-0005ep-FH; Tue, 10 Nov 2026 06:34:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xQk7f-0005e0-Pv
 for qemu-riscv@nongnu.org; Tue, 10 Nov 2026 06:34:44 -0500
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xQk7e-0007jd-0u
 for qemu-riscv@nongnu.org; Tue, 10 Nov 2026 06:34:43 -0500
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6AABAG9W3839673
 for <qemu-riscv@nongnu.org>; Tue, 10 Nov 2026 11:34:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 TgHZblypIERhYEErQCwRIe9P8fu+5SvHL+danBkCkOw=; b=RxKSBkd1EaezWpZA
 z+ds4jDen6nR4OrYmpXxI8qu3J/hpqt+w/r7+R84acILfVlcgY7RANGjYIP/Mdxi
 PDsQEqHLHY9SdWLvfMEbY2cMMmDyCOb7Uy/NpdZm7Xd/4umuPIkcaw8M/89lolJP
 mJRiIA/Mr9yaYrUYY6e7lIlmMxFyR6MqtzrAgUkd9vLD8P2yYgG5f/GBvRP3HTNk
 2FJwgagMXa54fvsBjg1RVhkQ179ATq5tpgyIyKFH1yB3xLUBfoDpCGVZgHwPFxTq
 aLiIfZJI9y++b0SEprkhERgu8TpUgSRBSzMRSavMBiKpRFAeaUgcV+O/bABumqNI
 Nr8EMg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4humjg380n-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Tue, 10 Nov 2026 11:34:40 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-93f559420f3so212025885a.0
 for <qemu-riscv@nongnu.org>; Tue, 10 Nov 2026 03:34:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1794310480; x=1794915280; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=TgHZblypIERhYEErQCwRIe9P8fu+5SvHL+danBkCkOw=;
 b=BMOkKh9qGyI6jbodHE9hOJcX4BrRuR1Vzm9vl7oYH/rd+h1CdL89SkgkX8xhJH/pzA
 9niMPr+IGyYOsMe5tm8TpiP8Jq0irtGgEzIp4LnUG3TrnzgHROyWnr/QAN95jMvxnH3n
 +ns30ARVv8YpHf2LGoUCR4WrGOnR3ittE2GUss8PdLeKSFobCAempoWqgXBh6Jrsq+zJ
 /yGZs7ScBT0uNDM+F6WArNVcPXB2HcqURYMzmZtuFKIod6ILgJKQ0TAPvycmD+P/+25i
 a1Ee0b1A9W4c7eEnq21ymLt5aEDLZJB7e7ls01R0WLimAknz1epu3AVrM5GT2NXr4siG
 hWLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794310480; x=1794915280;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=TgHZblypIERhYEErQCwRIe9P8fu+5SvHL+danBkCkOw=;
 b=FUJQ7S24J+pOIQ4pcgvNtx/0A9xkKsHNdpNDSHmox8LpLycE4/Hf+L9f7ke1leTfZv
 v1iFAyG86afrzZ6ZGs1i8lVMCAK6iUKPa+aOaY1ByZ+QqEBNvXNQRzDccduDOza+aooU
 VWWLx1bB4VUrTDyhntfMVNtLrM0PAZP7Gjk4hT45OYuehDII5PSjgrZKMnOZL14WBiJC
 5imXpUnuqAMOFQNP/V6Xm99sdslDKSLZq7RCzXkbzWw4pPV9ki2+K7z0c5UQOySPDrjn
 0T0RFel8nqiF1J2W9aqWrETJOrB5o9J9U4W3d/XtnhgPvUBZuglC0Y/y2yEnf85EcjtB
 BnHQ==
X-Forwarded-Encrypted: i=1;
 AL+hErEw3KIPvQv2diHjP/uFDmHeLWM1g/Y5eLLrUu7i87PKU+z/0XPijwkvH30eExXsx0O1WlfbB3rIlAEd@nongnu.org
X-Gm-Message-State: APuU4Z8xoAhibAByPIv8486GFO2UnHt9frWP6RJC27N7bEBw2ZAhtH+O
 XfIiT+MqrhOk9LFcveMfs7HtNj5LANz4UJ1oZlX+z80zhgk7+T6V0dEK3HbIq7FmoXR6+JUaeSQ
 RmpIxcCnkAQyaebd6NBS6drvRdyS9RqGxhAsnNmltgYk7lxYscZmTUTLmig==
X-Gm-Gg: AYBFou3nVx7Lm82I1+BKUVJCqjXkkIVE+/e2SU4iq6A1EWPu7BJ6dRnUiJLLQGTz0rd
 hTsMM40fEi2CGOFpmIEvfogPislCgaZ1JZN3pjXXujLTErgAu2hvt48qlAZWyYc0eXKb35M2CX4
 oquaPRb0A2r2f/0CrmqyFiMlypn0xArmPHiUBNM0vxTuUWjFw+HnEPE7wgHnVjnjm1m25YH9fJ7
 /baxCGWsGRRhh+5Ip21tg+JGDFK3QveghnZVOp8vjIP1JKYl4nysawUT5ZrX9+KVJd4LPtpoFen
 ts6tiU+VgYt2xLX3/embaNKgc1yUbnczymV7JUYSHqOKKG+qRGlFcwyGOm7bC50UzREjavEZZnk
 yxDYuL6lxm3e/SQYCJZg3s8JO4BrwVDeliGxXUKyxLi201cuGr3bjc3gW1FytIXGOzmWtTnX/DS
 eAY2UXeifk
X-Received: by 2002:a05:620a:4623:b0:93e:7944:b874 with SMTP id
 af79cd13be357-9479f2e85d6mr369137185a.33.1794310479935; 
 Tue, 10 Nov 2026 03:34:39 -0800 (PST)
X-Received: by 2002:a05:620a:4623:b0:93e:7944:b874 with SMTP id
 af79cd13be357-9479f2e85d6mr369134085a.33.1794310479488; 
 Tue, 10 Nov 2026 03:34:39 -0800 (PST)
Received: from [192.168.15.13] ([191.205.127.185])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-9479e7aa897sm201888485a.29.2026.11.10.03.34.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Nov 2026 03:34:38 -0800 (PST)
Message-ID: <73ad77b3-1583-4b2f-91d5-5ac756b02ce6@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 08:34:36 -0300
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] target/riscv: fix exception PC for WFI
To: fangyu.yu@linux.alibaba.com, palmer@dabbelt.com, alistair.francis@wdc.com, 
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com,
 chao.liu@processmission.com
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, guoren@kernel.org
References: <20261109135633.64867-1-fangyu.yu@linux.alibaba.com>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261109135633.64867-1-fangyu.yu@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA0NSBTYWx0ZWRfXxvargpZhefq+
 A5kDcSRSzuw0JchU7PMrn63T1rN5hbr9EmYAO7qso+gUrGRi92HT8G38DqaPYOp9veo2Uo2B5iS
 HATRbE2YKQ1UYlIn7AkZh6Au5UC5kdQY3cefCscP3/lHThzsplnkM+Xj1GkZfale7El2H50HTOP
 Q2ihRtxCaBkdqdTC4ec4mSVNOsqR8lH2NVwyqCQeUREEL6185/NOfKdVzhH8QYuvQsvrjZQGuY2
 AxJF/0Ffkcr4AUtCFyhmjNUl3tmD01PBOQZOQdXB7fV6UlzeU36gIP3XLWjFjShQW13Xf57bFQa
 ZpKCrmCBYAX33j84lxf5Dp90rfQPDZ7RkL3zvwoZfnmiBn0dX1VXpxCsyVpAPo515GiQyrTXqYd
 +gV52eXMNBnpW2JMqXxm57405m63e0ip5k8MMLE6ter9QK+oOpv4YxgGYDTtTuXBwKP+TeBgnRI
 mv6kk/Vrc9Y/H1SakTQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA0NSBTYWx0ZWRfXyGAiFvcyd1Hr
 KdxGMvRvqiahlDo1HaFQlgp8LxktQk/GtfJyb6XltktTVVieabi692VvtczyW2FFrkSb15nly0/
 qzo9+bdCcMrd4jKv0p7ADahk/r2sOeg=
X-Proofpoint-GUID: Q1rk5bFa_wACskK0JAiAr-Xg8Ub2dKsS
X-Authority-Analysis: v=2.4 cv=B6gsQ+tM c=1 sm=1 tr=0 ts=6af30150 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=yT90tAku5HHnT5ynma8WtQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=SRrdq9N9AAAA:8 a=yfSvMqx2kF0fgbsvQeYA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: Q1rk5bFa_wACskK0JAiAr-Xg8Ub2dKsS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 spamscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611100045
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=daniel.barboza@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
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
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 11/9/2026 10:56 AM, fangyu.yu@linux.alibaba.com wrote:
> From: Fangyu Yu <fangyu.yu@linux.alibaba.com>
> 
> trans_wfi() advances env->pc before calling helper_wfi(), which may
> raise illegal or virtual-instruction exceptions through GETPC().
> With CF_PCREL, restoring the instruction PC uses env->pc's page base.
> If the next instruction is in a different page, the exception PC is
> restored one page too high. This affects both a WFI ending exactly at
> a page boundary and one crossing it.
> 
> Keep env->pc pointing at WFI while helper_wfi() can raise an exception,
> and pass the instruction length to the helper. Advance env->pc only on
> the normal single-step or halt paths.
> 
> Fixes: 356c13f94dbf ("target/riscv: Enable PC-relative translation")
> Signed-off-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
> ---
>   target/riscv/helper.h                              | 2 +-
>   target/riscv/tcg/insn_trans/trans_privileged.c.inc | 4 ++--
>   target/riscv/tcg/op_helper.c                       | 6 +++++-
>   3 files changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/target/riscv/helper.h b/target/riscv/helper.h
> index 1cffcad580..b36e3532aa 100644
> --- a/target/riscv/helper.h
> +++ b/target/riscv/helper.h
> @@ -135,7 +135,7 @@ DEF_HELPER_1(mret, tl, env)
>   DEF_HELPER_1(dret, tl, env)
>   DEF_HELPER_1(mnret, tl, env)
>   DEF_HELPER_1(ctr_clear, void, env)
> -DEF_HELPER_1(wfi, void, env)
> +DEF_HELPER_2(wfi, void, env, i32)
>   DEF_HELPER_1(wrs_nto, void, env)
>   DEF_HELPER_1(tlb_flush, void, env)
>   DEF_HELPER_1(tlb_flush_all, void, env)
> diff --git a/target/riscv/tcg/insn_trans/trans_privileged.c.inc b/target/riscv/tcg/insn_trans/trans_privileged.c.inc
> index e22df6fbe7..3ca55b9842 100644
> --- a/target/riscv/tcg/insn_trans/trans_privileged.c.inc
> +++ b/target/riscv/tcg/insn_trans/trans_privileged.c.inc
> @@ -167,8 +167,8 @@ static bool trans_wfi(DisasContext *ctx, arg_wfi *a)
>   {
>   #ifndef CONFIG_USER_ONLY
>       decode_save_opc(ctx, 0);
> -    gen_update_pc(ctx, ctx->cur_insn_len);
> -    gen_helper_wfi(tcg_env);
> +    gen_update_pc(ctx, 0);

Please add a comment before this gen_update_pc() call explaining that env->pc
is deliberately left on the WFI until the exception checks pass.  I know this is
explained in the commit msg, but in this case it's way too easy for someone else to
read this code. assume that this gen_update_pc() isn't intended and then try to
advance PC back again.


LGTM otherwise.  Thanks,
Daniel

> +    gen_helper_wfi(tcg_env, tcg_constant_i32(ctx->cur_insn_len));
>       ctx->base.is_jmp = DISAS_NORETURN;
>       return true;
>   #else
> diff --git a/target/riscv/tcg/op_helper.c b/target/riscv/tcg/op_helper.c
> index f9c79fe6b9..3f71258858 100644
> --- a/target/riscv/tcg/op_helper.c
> +++ b/target/riscv/tcg/op_helper.c
> @@ -625,7 +625,7 @@ void HELPER(ctr_clear)(CPURISCVState *env)
>       riscv_ctr_clear(env);
>   }
>   
> -void HELPER(wfi)(CPURISCVState *env)
> +void HELPER(wfi)(CPURISCVState *env, uint32_t insn_len)
>   {
>       CPUState *cs = env_cpu(env);
>       bool rvs = riscv_has_ext(env, RVS);
> @@ -639,6 +639,10 @@ void HELPER(wfi)(CPURISCVState *env)
>                  (prv_u || (prv_s && get_field(env->hstatus, HSTATUS_VTW)))) {
>           riscv_raise_exception(env, RISCV_EXCP_VIRT_INSTRUCTION_FAULT, GETPC());
>       } else {
> +        env->pc += insn_len;
> +        if (env->xl == MXL_RV32) {
> +            env->pc = (int32_t)env->pc;
> +        }
>           if (riscv_cpu_cfg(env)->ext_sdext && !env->debug_mode &&
>               (env->dcsr & DCSR_STEP)) {
>               return;


