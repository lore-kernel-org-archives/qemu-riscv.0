Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jqOAK-0005KA-GE
	for mharc-qemu-riscv@gnu.org; Tue, 30 Jun 2020 17:51:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jqOAI-0005Jv-BO
 for qemu-riscv@nongnu.org; Tue, 30 Jun 2020 17:51:42 -0400
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:42714)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jqOAG-0006CK-Mk
 for qemu-riscv@nongnu.org; Tue, 30 Jun 2020 17:51:42 -0400
Received: by mail-pf1-x441.google.com with SMTP id x3so4475300pfo.9
 for <qemu-riscv@nongnu.org>; Tue, 30 Jun 2020 14:51:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=1BqupEbN28P4bm3ZpuxQUWzbq9AhUg448YYrGECG1r0=;
 b=uESyiMUQZBgbriZB2EtwcFkhEbeOI1IEya63w5rII2qyfRGuVUvdY6C2holhBb8mUF
 EtUJJ2IGW2f1/MndxDDHBPhxp7EqYskyNk93WgHJBJisaTx8N3fRUxAHCKOlj4S6my4I
 8qX317STsMlAKrb9hSkPsVB15BR6dIH+Kn4nwKknVknjmAHwJ6pNDAF+jo5Q/vuB+97m
 MfPHXCq28XKvCa9etXnU8j5mT5AxmWnuJUVvVagdfdRkiLRsyPewgpH8dL8pV/RMYFoY
 9ddYepaTdCmvXpfywu8DtLnDhY0uBZp8+X3rX0194Ka8ErzefJc5nCBMjHX+P/dHmByb
 Vqbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1BqupEbN28P4bm3ZpuxQUWzbq9AhUg448YYrGECG1r0=;
 b=O6GvLUXXHHTaEKUXQu9neCXLyBNxZioPDyTv6VVoDjvpF4jNZUyJIEJjpr0RLAA8Jx
 M+IGD+Mw9E9oHvndJpYUhTnE7edOFxiqSnTufcMGVbqs/jCTbRZ1ANJdMELd+oPHtACe
 yCTnGnqos1gCBsiPwYP4kpEUAOKs/7OodO0F8W6n4az1vSyJ3SRxuwn+w30Ye/CjXCrp
 83yryyPyHjjlN4kyDEcKfmUc90CzmYU65ieCagOLqQd2cp72pXEVdwq43+7fKKhxEGvV
 Eqm/hK9wLNXR3wJxgX2+X9RYf4nr8KH8PDfNNKVF67gtoTcSZJSJphhfV3qOjs+oVwVH
 U9MA==
X-Gm-Message-State: AOAM532euxYqbQxQ2r3oNPuW71LTItW1SpCYEqzHQaSSnbGeSS/hbQF/
 M3TVZ75eWtehT9XXG/jQej1+ZQ==
X-Google-Smtp-Source: ABdhPJzohh8iAnEaN/GCsu9rckp+ZmH/F40Ab7WnK4kqcWbNKdKfvGUEKctLbxBTONNjxK/HGjE06g==
X-Received: by 2002:a65:6883:: with SMTP id e3mr16911778pgt.5.1593553898982;
 Tue, 30 Jun 2020 14:51:38 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id x23sm3293717pfn.4.2020.06.30.14.51.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Jun 2020 14:51:38 -0700 (PDT)
Subject: Re: [PATCH v1 3/3] target/riscv: Regen floating point rounding mode
 in dynamic mode
To: Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: palmer@dabbelt.com, alistair23@gmail.com
References: <cover.1593547870.git.alistair.francis@wdc.com>
 <ea4f280e6f77e734c8e555e3c98d10085ce9f5b6.1593547870.git.alistair.francis@wdc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <cd66f31b-2c07-da29-c14c-5f1079e016e3@linaro.org>
Date: Tue, 30 Jun 2020 14:51:36 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <ea4f280e6f77e734c8e555e3c98d10085ce9f5b6.1593547870.git.alistair.francis@wdc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::441;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x441.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 30 Jun 2020 21:51:42 -0000

On 6/30/20 1:12 PM, Alistair Francis wrote:
> When a guest specificies the the rounding mode should be dynamic 0b111
> then we want to re-caclulate the rounding mode on each instruction. The
> gen_helper_set_rounding_mode() function will correctly check the
> rounding mode and handle a dynamic rounding, we just need to make sure
> it's always called if dynamic rounding is selected.
> 
> Fixes: 1885350 ("RISCV dynamic rounding mode is not behaving correctly")
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  target/riscv/translate.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index ce71ca7a92..a39eba679a 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -490,7 +490,7 @@ static void gen_set_rm(DisasContext *ctx, int rm)
>  {
>      TCGv_i32 t0;
>  
> -    if (ctx->frm == rm) {
> +    if (ctx->frm == rm && rm != 7) {
>          return;

This should not be necessary.

It was my understanding that after the set to the csr, that we would end the
TB.  That's certainly what I see in RISCV_OP_CSR_POST.

The next TB will begin wiht ctx->frm = -1, so we will reset the rounding mode
with 7.  It would be good to understand what's really going on here.


r~

