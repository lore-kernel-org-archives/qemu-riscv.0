Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4180CC04A6A
	for <qemu-riscv@archiver.kernel.org>; Tue,  8 Aug 2023 16:57:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qTQ0z-0002aZ-W8; Tue, 08 Aug 2023 12:57:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1qTQ0e-0002WU-OF; Tue, 08 Aug 2023 12:56:41 -0400
Received: from mail-oo1-xc2e.google.com ([2607:f8b0:4864:20::c2e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1qTQ0d-000098-7B; Tue, 08 Aug 2023 12:56:40 -0400
Received: by mail-oo1-xc2e.google.com with SMTP id
 006d021491bc7-56d0f4180bbso3969280eaf.1; 
 Tue, 08 Aug 2023 09:56:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691513796; x=1692118596;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=RIp1xjusZjxIGj+gLwY29HItiBkrkrOG/kUK/4zPIRw=;
 b=W2ZoEz9dxyWKa45KdDT0xef0T1kUrE5hghR7Y3JddsReAa1Hj0rgZVHFyXXP73ZTVR
 +JgukFOl+vnQFfxZ4uLGHO6GXyJf8BCDirkhECXePZDkdnyV04ApgSJA9XVJzIupmnUw
 blcUmGoR2Atz8Jb0qArLqrLbtlI/T5dROP/vDXy/8XNPC7a1jYlTYZ2I3DzzPKyZfZ5k
 Ikq5JkCA4ru+W4J47aOSv8UFoSOmABxsFQpkGd4qRmlRfCxi0bvZTG757xvP+g9mZxs8
 YzdaHRm9hLOhy7k9Vv4G8UiHISaBq2GPogzxL6AyPQ54hl5r6vFBR1H6BL7QoVmXancq
 5Q0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691513796; x=1692118596;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RIp1xjusZjxIGj+gLwY29HItiBkrkrOG/kUK/4zPIRw=;
 b=cof1wm/A+4/2Y2P/9553kCw+9oTmV3N69DJ866GH5C3lfFvxBqbvnp8kmeKiyF8nsi
 yYuKS+BvTZsg+Nf4/zqZQWyjh6lH2BXjj0AaX0Ku5KUUPjvKU+1bfScocfNCllVO76cx
 IEAVGgWGcyO9eFP0BSLokOvxoA0DTk/BRMkPv7oTZhuaNU2r1/TqwTBDvh2coFCL7TEo
 YJm23KvGmaJW8O3R4cYlxi1rz761ciGeq5frvgy7Ipznec3o4nXGz7PAq97o+qhE/7BH
 3wzV3f2ZCXBPPmA+rwMdsYoE83kUjwe2tFGYoO06mdokH76Mk9rIdG8oV6T/nsjdJUkp
 YWzA==
X-Gm-Message-State: AOJu0YwvK7Lm4fwPThlv2Qe7zprcc3ndt3t1Zpb0U59qVrI0QLOb3NtY
 z0zjK9ouSU9Ssz+MDXFkgng=
X-Google-Smtp-Source: AGHT+IGpn5fnzB2MjNKoCbbJbRRyP/PWXcuMNbQcxxI06k+KpTg1Un4t6YW+Ru5dZFvCfiMpVwOAJA==
X-Received: by 2002:a4a:ea39:0:b0:566:ec2f:36d0 with SMTP id
 y25-20020a4aea39000000b00566ec2f36d0mr429449ood.2.1691513796365; 
 Tue, 08 Aug 2023 09:56:36 -0700 (PDT)
Received: from [192.168.68.108] (189-69-160-189.dial-up.telesp.net.br.
 [189.69.160.189]) by smtp.gmail.com with ESMTPSA id
 w63-20020a4a5d42000000b00569478f2d83sm1391283ooa.23.2023.08.08.09.56.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Aug 2023 09:56:36 -0700 (PDT)
Message-ID: <5d2b3e5d-6dea-1cf2-02e3-cfa4b987c88a@gmail.com>
Date: Tue, 8 Aug 2023 13:56:32 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 11/24] tcg/ppc: Use the Set Boolean Extension
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org
References: <20230808031143.50925-1-richard.henderson@linaro.org>
 <20230808031143.50925-12-richard.henderson@linaro.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20230808031143.50925-12-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2e;
 envelope-from=danielhb413@gmail.com; helo=mail-oo1-xc2e.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-4.14,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=ham autolearn_force=no
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



On 8/8/23 00:11, Richard Henderson wrote:
> The SETBC family of instructions requires exactly two insns for
> all comparisions, saving 0-3 insns per (neg)setcond.

Nice.

> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---


Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>

>   tcg/ppc/tcg-target.c.inc | 22 ++++++++++++++++++++++
>   1 file changed, 22 insertions(+)
> 
> diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc
> index 10448aa0e6..090f11e71c 100644
> --- a/tcg/ppc/tcg-target.c.inc
> +++ b/tcg/ppc/tcg-target.c.inc
> @@ -447,6 +447,11 @@ static bool tcg_target_const_match(int64_t val, TCGType type, int ct)
>   #define TW     XO31( 4)
>   #define TRAP   (TW | TO(31))
>   
> +#define SETBC    XO31(384)  /* v3.10 */
> +#define SETBCR   XO31(416)  /* v3.10 */
> +#define SETNBC   XO31(448)  /* v3.10 */
> +#define SETNBCR  XO31(480)  /* v3.10 */
> +
>   #define NOP    ORI  /* ori 0,0,0 */
>   
>   #define LVX        XO31(103)
> @@ -1624,6 +1629,23 @@ static void tcg_out_setcond(TCGContext *s, TCGType type, TCGCond cond,
>           arg2 = (uint32_t)arg2;
>       }
>   
> +    /* With SETBC/SETBCR, we can always implement with 2 insns. */
> +    if (have_isa_3_10) {
> +        tcg_insn_unit bi, opc;
> +
> +        tcg_out_cmp(s, cond, arg1, arg2, const_arg2, 7, type);
> +
> +        /* Re-use tcg_to_bc for BI and BO_COND_{TRUE,FALSE}. */
> +        bi = tcg_to_bc[cond] & (0x1f << 16);
> +        if (tcg_to_bc[cond] & BO(8)) {
> +            opc = neg ? SETNBC : SETBC;
> +        } else {
> +            opc = neg ? SETNBCR : SETBCR;
> +        }
> +        tcg_out32(s, opc | RT(arg0) | bi);
> +        return;
> +    }
> +
>       /* Handle common and trivial cases before handling anything else.  */
>       if (arg2 == 0) {
>           switch (cond) {

