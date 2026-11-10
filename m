Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E55B2606A994
	for <qemu-riscv@archiver.kernel.org>; Tue, 10 Nov 2026 08:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fb3B4lgV;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TBaNQWEG
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xQhJI-0007J6-Kv; Tue, 10 Nov 2026 03:34:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xQhJF-0007IW-Fb
 for qemu-riscv@nongnu.org; Tue, 10 Nov 2026 03:34:29 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xQhJD-0003Td-D8
 for qemu-riscv@nongnu.org; Tue, 10 Nov 2026 03:34:28 -0500
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6AA8W5M62833672
 for <qemu-riscv@nongnu.org>; Tue, 10 Nov 2026 08:34:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 WvKFnNuxGECYWICnGQnaOuQU6kLbGLwMo0rfmiwlQrE=; b=fb3B4lgVams6mEFS
 gW/Rb86ZDqQWjmKODLHbxhMZqJP89KDAZBHUk5Zjddcmu+bPdJL6/K/OUy1Me6y2
 PhxHyEw2MJSB83zDxd3yjEByK46LO7L0W0UjkymZqsGIP4qYNAB30AybnPAk4yu1
 IlbAticCgtxGJjOsu65CxuKP5ZFyDzEp5X3Rrva5xPU2wo4YwwL73l2JUa9QYScW
 KV9oogKtzoXs2z4HQDUUr++9wqNmes2ys2PPYcXGWr60n4OTF34COewmxTvuQTLS
 q2wijIRUbhsbOtOVd6IxXSBnfNjkRVKYQXoZydbhGBo1JSVWOy0rgFL6iiNd0r0l
 ZrwhpQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4huyufr0f9-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Tue, 10 Nov 2026 08:34:25 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-91b937ecbb4so36768526d6.2
 for <qemu-riscv@nongnu.org>; Tue, 10 Nov 2026 00:34:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1794299664; x=1794904464; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=WvKFnNuxGECYWICnGQnaOuQU6kLbGLwMo0rfmiwlQrE=;
 b=TBaNQWEGGlNTZgtfXKQMRrWE1j31sh0syPjZ4FOdyxEHotaaRs8fjjFmPyFE6hDG9c
 A6aQHrNt3aw2uDJH3NX6OnLkYcKiIS3cKzqNvBvG/rg1c9kA73ABwRQbXP8u4HZsxm0O
 ulo1ld23PsA2KzmByTnhKmQVq7IhbEHlkswqK7mvqXDcVACHxHzffu2EqJSaEAf/uo4N
 fkQTSVFog24iLLG7s2C5GYi8rtqfL4gBf6nODp7lRqdWrGzLavVEN7NZpdcshH+oD33z
 ndlCf7eCs4V31+Vl289Scz73QNYfLoEpEqUo71xhU1EBRRJ05nO5X5/OL2o8IcY4FjWN
 lOpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794299664; x=1794904464;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=WvKFnNuxGECYWICnGQnaOuQU6kLbGLwMo0rfmiwlQrE=;
 b=sNCrkoU/GoJ5p6e6xlw72oQg6qmvOBp3vpdkFG3a/j1l90i7YB98dxiBPywY7g+20p
 iRXqXqPvpxt9ZJULdD2tuMcgfRPSUsSc/4Fs+b1JpC8Sd0X9CBDHhpZKdTGHfeByKc0q
 GE9zQWdwG9t3/NF8qHPvhTz7SoEeEkYNZQ4NFGuGjgOlz1ickuedtH/dNam0+I5fzMEn
 fxaAH9W+AhejIT7FWAEI0F3/3cTft0QE80wMtrJBwSKILuhPij10jbFExZ1KjkEzwwX8
 doSOs6djqJx8lr8VKqNeV2hIOXSBG09urO/YJbOAlPYMlkuVKIS/Sm7B9W0IPMKMAsX7
 ZUMQ==
X-Forwarded-Encrypted: i=1;
 AL+hErEBYOH/VTCMChwfISIq/yhASLiYN1X6kGZN5aEh+SXgGYymVtEmzfZ8pQjzGo4TbxhvDPsQAhCUfeJy@nongnu.org
X-Gm-Message-State: APuU4Z8eCtHNKh/gF1PUFf/NZ1PnzvoI0agqUT1rmcNhBOjAnabS+/H+
 cRY68maEJcTn0vqDONHo3chNBNTMdZO7X51BmJPKyB1Z30amHc19OVIeDvhAOLi6C3k7ODFK3Y4
 oIqQKeB98Mu8tisFjKa4rz5lEGNcehynEEU1jUBbvTl5+VGY558K3d/vN4Q==
X-Gm-Gg: AYBFou2KH8CvDVfnhaswE39KYJgck4jobLeBHE5vROib7/pJQBF5bUezRatT+GFrerA
 sJ3m82ilJl8YilWXt+z8NDp3YcNHDN0sfuE21z/qeA3xO99YBjs8sTZtVxRCF+z6bo15Hw+Ncbq
 z0cVckhZVTh6b4HxgjVSS5hKzpmadfOImGSSnXrbuLgE419HuxpWWtOejL/PoqOjL6laJx7sA08
 P1U0UhK59Egn8lccKyhYXIFi2QmnVTsUkaEr/dQcOcqs0lA9wajW2XxjGcTL3wbQCXvmVFKvgNY
 D2vnLdvvY+vdkKzYMOuiG1ZdvOE9gaLBST68sjSfFwVfBhjq3CZfZqJ+86zWkUIwQHT5zeLDNDk
 rIqUYiq5c0gRZz8Oj9Z3yLtsfF+6x1VgCuIC8K+7fVEn4zISYL4n7M15Vk3zIJG8U6u4jAmd0D2
 IXw+tDnrU=
X-Received: by 2002:a05:620a:461f:b0:93e:c12c:f11e with SMTP id
 af79cd13be357-9479f368dbcmr324035485a.74.1794299664395; 
 Tue, 10 Nov 2026 00:34:24 -0800 (PST)
X-Received: by 2002:a05:620a:461f:b0:93e:c12c:f11e with SMTP id
 af79cd13be357-9479f368dbcmr324033185a.74.1794299663936; 
 Tue, 10 Nov 2026 00:34:23 -0800 (PST)
Received: from [192.168.69.234] (pmd666.hd.free.fr. [82.67.153.177])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4ba022fbf75sm40657905e9.0.2026.11.10.00.34.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Nov 2026 00:34:23 -0800 (PST)
Message-ID: <9a8eefaa-1916-443c-b729-ccd4ddf699c1@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 09:34:21 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] target/riscv: fix exception PC for WFI
Content-Language: en-US
To: fangyu.yu@linux.alibaba.com, palmer@dabbelt.com, alistair.francis@wdc.com, 
 liwei1518@gmail.com, daniel.barboza@oss.qualcomm.com,
 zhiwei_liu@linux.alibaba.com, chao.liu@processmission.com
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, guoren@kernel.org
References: <20261109135633.64867-1-fangyu.yu@linux.alibaba.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20261109135633.64867-1-fangyu.yu@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Uyts444QlpgUKxmDuYZTh-340lrZlMax
X-Authority-Analysis: v=2.4 cv=S6lMU4sP c=1 sm=1 tr=0 ts=6af2d711 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=nz36NW0qrpeEijYxj/H2Ew==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=SRrdq9N9AAAA:8 a=62DLBdEc8tAOVxE0NIIA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: Uyts444QlpgUKxmDuYZTh-340lrZlMax
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAzMyBTYWx0ZWRfXzAIZJKKF2gU/
 fbVBQr9m9xMi5gn/Y8lo/22XcOELb8bNqYVwMJhYsoaxvWd1sMblEDHN72HI/COGiBVpMQ4zS9U
 LigrWPKBu7G1492T9QuhfVSVigWECRM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAzMyBTYWx0ZWRfX1TCY8Xv/zSD/
 iARRDDWoyMsnlxalB1OrHJQwrZfk6xEN2vN/3pKdJlFCuvUSMzic8/fTk0D8m4Sv2F6IqZDTmpJ
 s9UaafCeGtEMOvO8ysP7fQzdv9A3rdp9Xv2P+2McPQ3M5n2JK8/ijQYUJjNMSXU9YuXto5CJLCZ
 vJSzrTwhGE0rOwtXSvDpYBtz+xThoQ7z0iUnIw5rgO3UtqsTFNULWd5uSarIyFHA3p4sJ1tyc5H
 IZiHtYJHYMqSaVB92vJ9kpJdskS3cOVe4esuFJR5lPQPurBQu+gZLR945zCjSAfuyX6BOHmYV7k
 fZLBpMbNi8vh2eZhyV8/D7wsu+GJCvgeRRbzX3TH2x1Ae0TYUxGYVzg4VPZb24vGjov852z2Idx
 KjmqiGNd2K5pvnmZsWHMgKcVN7ofN4dMl0eLngLYJVzkqNlJsb/mBDEck+Mw6rCayGi1t7XCX+B
 B/FRrSpFRUgZKKWZQiQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 clxscore=1015 malwarescore=0 bulkscore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611100033
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
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

Hi,

On 9/11/26 14:56, fangyu.yu@linux.alibaba.com wrote:
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

While I'm still not convinced by the fix, 'advance_pc' might
be clearer than 'insn_len'; also we have helper to set $PC:

             riscv_cpu_set_pc(env->pc + advance_pc)

>           if (riscv_cpu_cfg(env)->ext_sdext && !env->debug_mode &&
>               (env->dcsr & DCSR_STEP)) {
>               return;


