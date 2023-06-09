Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D60FC7EE29
	for <qemu-riscv@archiver.kernel.org>; Fri,  9 Jun 2023 17:58:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q7gNB-0002NI-QX; Fri, 09 Jun 2023 13:58:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1q7gNB-0002Mv-3P
 for qemu-riscv@nongnu.org; Fri, 09 Jun 2023 13:58:05 -0400
Received: from mail-oa1-x32.google.com ([2001:4860:4864:20::32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1q7gN9-000605-LC
 for qemu-riscv@nongnu.org; Fri, 09 Jun 2023 13:58:04 -0400
Received: by mail-oa1-x32.google.com with SMTP id
 586e51a60fabf-1a28817f70bso941696fac.2
 for <qemu-riscv@nongnu.org>; Fri, 09 Jun 2023 10:58:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1686333481; x=1688925481;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=cN7JsMcDTtQtI7Z85TZGF6udkdobuui4PE3jfQX2J2Q=;
 b=czwhcHc2zYATZq+NGS2lgcgQ725srp5tkd/ff/ZW9baucNqlI6fR0imCgIq3i4xANb
 o1DhOkHmKUX1IiXvbZdegMcVIIgoMycoMC6LluoFnik+j0YlK7NkL80EyfIq/Kuvdrjm
 8+Hhlvnej9uMxmECSiiax+uxhHSuzDA0VO/hiysFlU7GnPg0VR2tF9K89zAvw/bcy3fV
 NVuEok36stWM4RCIZ3xIuGr9FaOWPXR36ypydF+lHtXQP70/89lcZzq7lnVvlWqQaS0C
 A0CdbiQ+9Yya4q8Yj48Ez/YNVFSLEO9nTNwhQ2035Z3jpqNXyxKhcGdAf6V3uzRxUlRf
 k9Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686333481; x=1688925481;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cN7JsMcDTtQtI7Z85TZGF6udkdobuui4PE3jfQX2J2Q=;
 b=bgrnEUwhxPaiA3QnQ7gbDx28gZ7OaTeQPffNSeXVJdVo1E86Eos1z+LtCSLRPGO5fU
 K4SZUrlksa31insW43sdcyWtpIfks9CSquOGY+GIjTYJDJiP/gkDFAvdFgVzs1UnYnV7
 b/82WF20vNLjrZt5RRvzXpqFrzWbxtuoNhI3hIBRDCCt046c/T48mWv7i+BXDwZ644y2
 QQvE5o/FvJxsDuhMXll6yxO+7RBn54qpXqil8iKBEtHvg2i1+nEdKEupFTn1HWLDoaNf
 F/xJvTlqaSqDvNFlSNwByDE9HnHjPcEBhgJ1t4BXWMVmXPTiV70nEoyvGjNbsL1CfQMI
 WYnw==
X-Gm-Message-State: AC+VfDw/2UNV1AQ5VATs20WNYTNR4HW0Cx1YBHW1XD5Mv4zkhOUARgIT
 +V97tVQYAtrc/BHWAs3+ZyJ6qA==
X-Google-Smtp-Source: ACHHUZ7lz0jP89dT9gx1+ruhQhfFTxSFFVCjT6ZKwE0cqlAmNv/VY7WfFIQSNSSUtkhocHJditvPgw==
X-Received: by 2002:a05:6871:555:b0:177:809e:ead3 with SMTP id
 t21-20020a056871055500b00177809eead3mr1786540oal.41.1686333481168; 
 Fri, 09 Jun 2023 10:58:01 -0700 (PDT)
Received: from [192.168.68.107] ([177.170.117.52])
 by smtp.gmail.com with ESMTPSA id
 k12-20020a056820016c00b005559f182cd6sm1010892ood.12.2023.06.09.10.57.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Jun 2023 10:58:00 -0700 (PDT)
Message-ID: <514651c0-3477-17f9-7401-e7cbfcd4eaa0@ventanamicro.com>
Date: Fri, 9 Jun 2023 14:57:55 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] target/riscv/vector_helper.c: clean up reference of MTYPE
Content-Language: en-US
To: Xiao Wang <xiao.w.wang@intel.com>, qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>
References: <20230608053517.4102648-1-xiao.w.wang@intel.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230608053517.4102648-1-xiao.w.wang@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::32;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x32.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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



On 6/8/23 02:35, Xiao Wang wrote:
> There's no code using MTYPE, which was a concept used in older vector
> implementation.
> 
> Signed-off-by: Xiao Wang <xiao.w.wang@intel.com>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   target/riscv/vector_helper.c | 6 +-----
>   1 file changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
> index f261e726c2..1e06e7447c 100644
> --- a/target/riscv/vector_helper.c
> +++ b/target/riscv/vector_helper.c
> @@ -378,7 +378,7 @@ vext_ldst_us(void *vd, target_ulong base, CPURISCVState *env, uint32_t desc,
>   
>   /*
>    * masked unit-stride load and store operation will be a special case of
> - * stride, stride = NF * sizeof (MTYPE)
> + * stride, stride = NF * sizeof (ETYPE)
>    */
>   
>   #define GEN_VEXT_LD_US(NAME, ETYPE, LOAD_FN)                            \
> @@ -650,10 +650,6 @@ GEN_VEXT_LDFF(vle64ff_v, int64_t, lde_d)
>   #define DO_MAX(N, M)  ((N) >= (M) ? (N) : (M))
>   #define DO_MIN(N, M)  ((N) >= (M) ? (M) : (N))
>   
> -/* Unsigned min/max */
> -#define DO_MAXU(N, M) DO_MAX((UMTYPE)N, (UMTYPE)M)
> -#define DO_MINU(N, M) DO_MIN((UMTYPE)N, (UMTYPE)M)
> -
>   /*
>    * load and store whole register instructions
>    */

