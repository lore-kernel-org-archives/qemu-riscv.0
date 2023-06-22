Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C028EB64D8
	for <qemu-riscv@archiver.kernel.org>; Thu, 22 Jun 2023 17:31:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qCO8j-00052L-I6; Thu, 22 Jun 2023 13:30:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qCO8h-00051Z-I5
 for qemu-riscv@nongnu.org; Thu, 22 Jun 2023 13:30:35 -0400
Received: from mail-oa1-x2d.google.com ([2001:4860:4864:20::2d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qCO8f-0004Ok-RW
 for qemu-riscv@nongnu.org; Thu, 22 Jun 2023 13:30:35 -0400
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-1aa291b3fc7so4369987fac.1
 for <qemu-riscv@nongnu.org>; Thu, 22 Jun 2023 10:30:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1687455032; x=1690047032;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+K9i5UeQRlo9zQpucK2unPpZOkcmFzTinHURf1fIF9s=;
 b=l2DHKGY+ZJ/11jvqHkFG4L5DI5UmesbOglO/3uXM7mJcCmrD+r3G6KZRIUTZSryut3
 PvTuB/PvnNwW7Fbio7QLtHu9n/5GAChCAKHzDxmTPmFJMamurN0nA5QSIkXu5qk57Nz1
 m7KTJy9SHPeOMRO6zZHf+tJRMn+sWVf13Jb0wNU9SgQXb8ITLdEbQtbjj26QQru0QZ8M
 +FNnaIOU+zHtCgFRmS1N98uvu5NVMDnn4EDnMzz6R2iyn1odEYmZX5dSawYH54XbdUoG
 /GaH9RYuBoVZXx+WXQQza5Iv1bOUBelqSI6iH3tbSKxA7xu+fBt9BeXaQXVQCU9B0Z1E
 wJUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687455032; x=1690047032;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+K9i5UeQRlo9zQpucK2unPpZOkcmFzTinHURf1fIF9s=;
 b=ARdqqlVbxWl7zFxRp9XsHG0Lm9oZ2rC0gWECkTH2idYNSAMxibC0C0BLx+eKS0IrbQ
 Dg6zXyINiHn7lx1JR2KtkGwOWFDfZzedU9V2g80xC1dlmQL+dtUMZXueX3MQJm+U5Qbb
 dQxNWL/Lb5V2aeUy1yaU6ojO+0qQWFB4vqL4xATm4U22rXMWMnzN19/UOmcAJph2REPj
 gDRYpCosF+EkmfPBMkPz0IUpkuhxpRZg8BdQby4Myi1aNnFtYNh1+ae9Syf3xIuy/2wS
 5qeUS9wB5X1pA12fWvgofgE6fmkZGCjoJR0/VOyuyObv0y2w+X8S2u9ll7iID9NOwask
 yehQ==
X-Gm-Message-State: AC+VfDwcq6epziX+TQuLfwLiTFn7EpB39jOVpv94DTLymrJsXe76249c
 TI6J4oa1mfx0nrjp2dIJMhvEMQ==
X-Google-Smtp-Source: ACHHUZ5Fop/0AyX3uSz8ZllfeDTFNuWLooy4pAmagLC8LNNmsnqqLvNfkUm3nYOm8THFhXfTApXQgA==
X-Received: by 2002:a05:6870:44c1:b0:19f:214b:b852 with SMTP id
 t1-20020a05687044c100b0019f214bb852mr14450156oai.56.1687455032189; 
 Thu, 22 Jun 2023 10:30:32 -0700 (PDT)
Received: from [192.168.68.108] (201-69-66-110.dial-up.telesp.net.br.
 [201.69.66.110]) by smtp.gmail.com with ESMTPSA id
 pn2-20020a0568704d0200b001a695700c69sm4404871oab.37.2023.06.22.10.30.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Jun 2023 10:30:31 -0700 (PDT)
Message-ID: <684ca7f1-c4f4-70f8-b92d-34b0d3336646@ventanamicro.com>
Date: Thu, 22 Jun 2023 14:30:28 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v4 08/17] tcg: Fix temporary variable in tcg_gen_gvec_andcs
Content-Language: en-US
To: Max Chou <max.chou@sifive.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
References: <20230622161646.32005-1-max.chou@sifive.com>
 <20230622161646.32005-9-max.chou@sifive.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230622161646.32005-9-max.chou@sifive.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::2d;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x2d.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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



On 6/22/23 13:16, Max Chou wrote:
> The 5th parameter of tcg_gen_gvec_2s should be replaces by the temporary

s/replaces/replaced


> tmp variable in the tcg_gen_gvec_andcs function.
> 
> Signed-off-by: Max Chou <max.chou@sifive.com>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   tcg/tcg-op-gvec.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tcg/tcg-op-gvec.c b/tcg/tcg-op-gvec.c
> index 95a588d6d2..a062239804 100644
> --- a/tcg/tcg-op-gvec.c
> +++ b/tcg/tcg-op-gvec.c
> @@ -2774,7 +2774,7 @@ void tcg_gen_gvec_andcs(unsigned vece, uint32_t dofs, uint32_t aofs,
>   
>       TCGv_i64 tmp = tcg_temp_ebb_new_i64();
>       tcg_gen_dup_i64(vece, tmp, c);
> -    tcg_gen_gvec_2s(dofs, aofs, oprsz, maxsz, c, &g);
> +    tcg_gen_gvec_2s(dofs, aofs, oprsz, maxsz, tmp, &g);
>       tcg_temp_free_i64(tmp);
>   }
>   

