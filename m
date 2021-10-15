Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mbWwx-0005zi-2v
	for mharc-qemu-riscv@gnu.org; Fri, 15 Oct 2021 19:49:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mbWwv-0005yx-C6
 for qemu-riscv@nongnu.org; Fri, 15 Oct 2021 19:49:17 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:38623)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mbWwt-0002W4-Mb
 for qemu-riscv@nongnu.org; Fri, 15 Oct 2021 19:49:17 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 g13-20020a17090a3c8d00b00196286963b9so10412049pjc.3
 for <qemu-riscv@nongnu.org>; Fri, 15 Oct 2021 16:49:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=UJS91PycOFtH3sAodWkd2qZDaPDohi702vSuFUGeV98=;
 b=aTmg6s0ShYaij+GA7/U1HgXTu0ZGwsBaA7COY7kLLQqYKZ31PC1nblA0CeBHPnUhhC
 r6MfLmddGIyzEHUp7uWkWCK1DPYJdCmfel80xJlqRDIzUSnPEBFdiMk+3MegeVUkETAr
 4FBHijoH1yDudY2NBCqbjsybJlolgZGQI8BzqAYAuiOfactDaaRgQBiI9asmJ112QeXl
 XJ2knfv5FYUnKQS2hsrmbhabLDVN6swozCL1uVkMIc8h9AiU6Te+9jfBQl/zfOiGRta6
 ksZjTR7oy6FSXcTiFIWlhBn2oOs6B/xpSuJmGqRx2S63QRogBK6eCI1qtgaMPfKoKnZc
 yHzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=UJS91PycOFtH3sAodWkd2qZDaPDohi702vSuFUGeV98=;
 b=eRP+7OXwc0+NtVLrJMeVr0eSH6RYXIqJfdKE4XlqhIfVZT+CzRIEM21JUekBoj7gwJ
 ffww/kb337uO3NrFZglQO0VDtHhr6V4o/J+94qCP2HxYax+WixjNDAVhpFZpoVYEC0vc
 Iu4Kbi7oh/47VP9UQDXGq5y/313LGoLRCgBz68U3PH/YgyE+yXXAmmITLFjNxmlc2Xfi
 gxsoXHnH2OEpESqieyxhjXJ/d91B8xI1jFn8ay1dD2gn9+OzENNRNAysOo3jLLwpkiLp
 8leAntANj36JEKEcwtsm/OGcTr4yBXDz/qZDlIArhff0qcpzBra2LqVNRuzhUlAa5s4t
 dxSA==
X-Gm-Message-State: AOAM5326NGmmfm4eTVDJMoNtoY3o6uVZ3+f0tCnLk0KZ9m6KyXX+M4z9
 k9RlGPxo6/ND3YFAGfQ6gmgPmA==
X-Google-Smtp-Source: ABdhPJzoj67xhyPQYbwEcnOo548XmgvsqEsej6Ws/N3IUiVfQlgTJKLMX/f3Rp9RR/CuCf2wXPOHug==
X-Received: by 2002:a17:90b:38c6:: with SMTP id
 nn6mr7538686pjb.246.1634341754030; 
 Fri, 15 Oct 2021 16:49:14 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id v12sm5991952pjs.0.2021.10.15.16.49.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Oct 2021 16:49:13 -0700 (PDT)
Subject: Re: [PATCH v13 5/7] [RISCV_PM] Support pointer masking for RISC-V for
 i/c/f/d/a types of instructions
To: Alexey Baturo <baturo.alexey@gmail.com>
Cc: space.monkey.delivers@gmail.com, kupokupokupopo@gmail.com,
 palmer@dabbelt.com, Alistair.Francis@wdc.com, sagark@eecs.berkeley.edu,
 kbastian@mail.uni-paderborn.de, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, Bin Meng <bin.meng@windriver.com>
References: <20211015192931.227387-1-space.monkey.delivers@gmail.com>
 <20211015192931.227387-6-space.monkey.delivers@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <046b0cc0-2911-87b7-ccae-0819250dc909@linaro.org>
Date: Fri, 15 Oct 2021 16:49:11 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211015192931.227387-6-space.monkey.delivers@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, GAPPY_SUBJECT=0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 15 Oct 2021 23:49:17 -0000

On 10/15/21 12:29 PM, Alexey Baturo wrote:
> Signed-off-by: Alexey Baturo <space.monkey.delivers@gmail.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>   target/riscv/insn_trans/trans_rva.c.inc |  3 +++
>   target/riscv/insn_trans/trans_rvd.c.inc |  2 ++
>   target/riscv/insn_trans/trans_rvf.c.inc |  2 ++
>   target/riscv/insn_trans/trans_rvi.c.inc |  2 ++
>   target/riscv/translate.c                | 10 ++++++++++
>   5 files changed, 19 insertions(+)
> 
> diff --git a/target/riscv/insn_trans/trans_rva.c.inc b/target/riscv/insn_trans/trans_rva.c.inc
> index 6ea07d89b0..5bdc412191 100644
> --- a/target/riscv/insn_trans/trans_rva.c.inc
> +++ b/target/riscv/insn_trans/trans_rva.c.inc
> @@ -25,6 +25,7 @@ static bool gen_lr(DisasContext *ctx, arg_atomic *a, MemOp mop)
>       if (a->rl) {
>           tcg_gen_mb(TCG_MO_ALL | TCG_BAR_STRL);
>       }
> +    gen_pm_adjust_address(ctx, &src1, src1);
...
> +/*
> + * Temp stub: generates address adjustment for PointerMasking
> + */
> +static void gen_pm_adjust_address(DisasContext *s,
> +                                  TCGv         *dst,
> +                                  TCGv          src)
> +{
> +    tcg_gen_mov_tl(*dst, src);
> +}

I mentioned before that you would not be able to do this.
You are writing to the live cpu register, even if in this case it's a nop.

You could, for example, make the stub be

     *dst = src;

but that begs the question of why not use the return value, and have the stub be

     return src;


r~

