Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1EBCC001DE
	for <qemu-riscv@archiver.kernel.org>; Mon, 31 Jul 2023 18:48:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qQXwX-0002CW-4Z; Mon, 31 Jul 2023 14:48:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qQXwU-0002Bg-W8
 for qemu-riscv@nongnu.org; Mon, 31 Jul 2023 14:48:31 -0400
Received: from mail-oa1-x30.google.com ([2001:4860:4864:20::30])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qQXwT-0002j2-Al
 for qemu-riscv@nongnu.org; Mon, 31 Jul 2023 14:48:30 -0400
Received: by mail-oa1-x30.google.com with SMTP id
 586e51a60fabf-1bb5dac1df4so3758288fac.3
 for <qemu-riscv@nongnu.org>; Mon, 31 Jul 2023 11:48:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1690829308; x=1691434108;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=SvPrRVTBCmMPqHaPwP2cHwS4NSGT1eJLx/p7OHNbLXw=;
 b=Mb0g7PtujBzN7IoemtQ1PsT8Pew/0cqNZgZY85zw3ojqyHuT/GvmTjen3sTiGGXFym
 3dJy+V33kyEj6MnnO1lgEFtrOfJoxw4ITMSIdknX371lnaBg7VNt7YDEID0marQFym2r
 6RPLiX+jld1bLaGIvknCNb4XbRrOoI4wPdE40JJTSXfuuTp/q/Yix+t4XvsnKImlqbAN
 NyFx07sed836PVggFjE0WAKjIVIQItQCa5dUinJ5jNo+ve6ndmbaY2gxOj8zTYrHBWyn
 9vviV7gIPKEiGfV7Wy+kXBN+pX2B2YzDA4Y7w9izGFLLxw37O9IMxVjtlj7f+gNTBlER
 snFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690829308; x=1691434108;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SvPrRVTBCmMPqHaPwP2cHwS4NSGT1eJLx/p7OHNbLXw=;
 b=brcoZgdpymCJx9OVsQlk3VZBxaLCitVYkgsOUDIfwdWgikjE1Lg1f3CzLtaSOGUG6T
 ClFbiQ3wfCp5Y9yy62fCXpz9zrMZmdcE4PCaa13Vu/BPP1l3WAhOZle9X6xMWMoO2UsZ
 O/s4+vtanL4z9IXZCmNW/lT4cCA9gYh7gbgBymbA6/ksFD2ZTLopnLXE/vr8n66BMRn0
 EJvZzUo4BczUQZTaP9J7nX82wqpvBGeJ/u2nS8t51xlMF2P7D/VBqONBQnXMxa3PK+ir
 8ToPPqn1heb7Nva69pgzjrf4aly1SWPUIPoMgCGoWHhJIjA5cdO9pupRgrRwKAda1UjB
 QoYg==
X-Gm-Message-State: ABy/qLY6eY2ESX2PHyiBp6nssd4SAattckxJa/8TF/wCZ5axlzgfw+OX
 jqzmxdBBGk8GCATb2C7lWCrY/6R8GGxmozV0EBNk4Q==
X-Google-Smtp-Source: APBJJlG0uHKf38UPFab4ykaFrtgESz6coxFqDlmq1Iy4Ht/M+fh1VI0mD+sx86fbtcB/asBjIssdSw==
X-Received: by 2002:a05:6870:fb86:b0:1bb:adde:45b8 with SMTP id
 kv6-20020a056870fb8600b001bbadde45b8mr10013631oab.33.1690829307893; 
 Mon, 31 Jul 2023 11:48:27 -0700 (PDT)
Received: from [192.168.68.108] (201-69-66-110.dial-up.telesp.net.br.
 [201.69.66.110]) by smtp.gmail.com with ESMTPSA id
 u22-20020a056870951600b001bbeef974aesm3896382oal.20.2023.07.31.11.48.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Jul 2023 11:48:27 -0700 (PDT)
Message-ID: <02b8f4e3-0506-5863-3339-1c80c7f94c25@ventanamicro.com>
Date: Mon, 31 Jul 2023 15:48:23 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2] target/riscv: don't read write-only CSR
Content-Language: en-US
To: Nikita Shubin <nikita.shubin@maquefel.me>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Cc: Nikita Shubin <n.shubin@yadro.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
References: <20230727081726.12650-1-nikita.shubin@maquefel.me>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230727081726.12650-1-nikita.shubin@maquefel.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::30;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x30.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.101,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Patch looks correct IMHO. I have a few cosmetic suggestions:

On 7/27/23 05:17, Nikita Shubin wrote:
> From: Nikita Shubin <n.shubin@yadro.com>
> 
> In case of write-only CSR don't return illegal inst error when CSR is
> written and lacks read op.


It's worth citing the ISA bits you put down below in the commit msg.

It would also be nice to explain why checking for 'ret_value != NULL' is the
right fix. In this case, both trans_csrrw() and trans_csrrwi() will check if
rd=x0 and, in this case, will redirect to do_csrw(). do_csrw() will call
riscv_csrrw_do64(), via helper_csrw(), with ret_val = NULL.

And ...

> 
> Signed-off-by: Nikita Shubin <n.shubin@yadro.com>
> ---
> Changelog:
> - fixed uninitialized old_value
> 
> Anyway it not might be a good idea to read CSR when we are not asked
> for, during CSRRW or CSRRWI:
> 
> "For CSRRWI, if rd=x0, then the instruction shall not read the CSR and
> shall not cause any of the side effects that might occur on a CSR read."
> 
> May be i am missing something of course.
> ---
>   target/riscv/csr.c | 21 ++++++++++++---------
>   1 file changed, 12 insertions(+), 9 deletions(-)
> 
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index ea7585329e..3f0b3277e4 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -3908,21 +3908,24 @@ static RISCVException riscv_csrrw_do64(CPURISCVState *env, int csrno,
>                                          target_ulong write_mask)
>   {
>       RISCVException ret;
> -    target_ulong old_value;
> +    target_ulong old_value = 0;
>   
>       /* execute combined read/write operation if it exists */
>       if (csr_ops[csrno].op) {
>           return csr_ops[csrno].op(env, csrno, ret_value, new_value, write_mask);
>       }
>   
> -    /* if no accessor exists then return failure */
> -    if (!csr_ops[csrno].read) {
> -        return RISCV_EXCP_ILLEGAL_INST;
> -    }
> -    /* read old value */
> -    ret = csr_ops[csrno].read(env, csrno, &old_value);
> -    if (ret != RISCV_EXCP_NONE) {
> -        return ret;
> +    /* don't read if ret_value==NULL */

I would add in this comment that ret_value == NULL means that rd=x0 and we're coming
from helper_csrw() and we can't throw side effects caused by CSR reads.


Thanks,

Daniel

> +    if (ret_value) {
> +        /* if no accessor exists then return failure */
> +        if (!csr_ops[csrno].read) {
> +            return RISCV_EXCP_ILLEGAL_INST;
> +        }
> +        /* read old value */
> +        ret = csr_ops[csrno].read(env, csrno, &old_value);
> +        if (ret != RISCV_EXCP_NONE) {
> +            return ret;
> +        }
>       }
>   
>       /* write value if writable and write mask set, otherwise drop writes */

