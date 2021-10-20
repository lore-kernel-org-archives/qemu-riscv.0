Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mdDDU-00086R-Ip
	for mharc-qemu-riscv@gnu.org; Wed, 20 Oct 2021 11:09:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdDDT-000837-Bf
 for qemu-riscv@nongnu.org; Wed, 20 Oct 2021 11:09:19 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:44787)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdDDR-0005Xt-AZ
 for qemu-riscv@nongnu.org; Wed, 20 Oct 2021 11:09:19 -0400
Received: by mail-pf1-x42c.google.com with SMTP id v8so3195153pfu.11
 for <qemu-riscv@nongnu.org>; Wed, 20 Oct 2021 08:09:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=7EIWmbbyd0mwiEgyDha6EfbYdWySb88F3Yc5VSR47Ok=;
 b=SlnGHEqI3rq9rbv9/qV5ixMQwDRlhj9TKW4KRIV4U8zeYGM3IBBdhS/Praal1dvSv/
 hhlk7Q1gV1w6qS91sYGfm0fX07bt0iaPcijFQ7pkM/Rm2IjzCo/eQ3/mYJBNHan2wG6E
 fu2aBmerjk9mSW6TnOJpneTThHG7DqP0Vsi+L1SaQlDl+w9Oz7920tL0T9Bl/2Mh8R8j
 uYnKlvtfJ2JKLpSp5ggITJm1VNrOaGh4NgEixpB3MnBJvMtN3VluDFL3HccfKXtj+rjn
 I7+LbNn/VyhJADniWet7oOawzzkwy/hXjJzkUT/zuH5yXlSii6c7mEuuwkz4jKlVZzFa
 jG8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7EIWmbbyd0mwiEgyDha6EfbYdWySb88F3Yc5VSR47Ok=;
 b=yDR4Pxorex05j3iFEEKsLrqhYYU+PbzL/nOZYbTAROq65I546JjPYuyIbSnHDQkOHF
 4k75fJUuVcwWGFeBnjoX3hYTpab4dMG7xoW/qn6LkhVo5C1CwcDhRgM/f+/vBgDhVKKV
 cCtzJNHxUWUd8FoeITW2IPkj888FxzH0HqnWxRq89Y7s3W3R5MXX1lR3woVcpFFZQzaP
 tQGnhkC3gjs3pniSDVe5YAsgOn/Nnu7Bfik/84lueXI8kwjDwY07eIIv5N3NtQavv4Oc
 ohWW8fsT1W2j0m0dYNt5TImOmufiQn/YzztNCjJPXbaby0bCj5g4FDnXro4c7tQrunbA
 kilQ==
X-Gm-Message-State: AOAM532kSFJwAP8ylRUQNLgJU8irAk/xWgjLMRWMchfaNDTgnb8Q2sMZ
 gV/wBUALcVO1ECtBebZhWx9dQw==
X-Google-Smtp-Source: ABdhPJxLCrFpz3YVSk+vhQMMW5+YP4mUM1jImmpGbgcxfIuGu7ZmJX1qUbwHCHp6fQXDWkxZYSmEgw==
X-Received: by 2002:a63:fb18:: with SMTP id o24mr45321pgh.8.1634742555855;
 Wed, 20 Oct 2021 08:09:15 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id o72sm2759627pjo.50.2021.10.20.08.09.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Oct 2021 08:09:15 -0700 (PDT)
Subject: Re: [PATCH v3 08/21] target/riscv: adding accessors to the registers
 upper part
To: =?UTF-8?B?RnLDqWTDqXJpYyBQw6l0cm90?=
 <frederic.petrot@univ-grenoble-alpes.fr>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: alistair.francis@wdc.com, bin.meng@windriver.com, philmd@redhat.com,
 palmer@dabbelt.com, fabien.portas@grenoble-inp.org
References: <20211019094812.614056-1-frederic.petrot@univ-grenoble-alpes.fr>
 <20211019094812.614056-9-frederic.petrot@univ-grenoble-alpes.fr>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <9c3ade01-e5e0-a1e6-a39d-73d5cccdd0b8@linaro.org>
Date: Wed, 20 Oct 2021 08:09:13 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211019094812.614056-9-frederic.petrot@univ-grenoble-alpes.fr>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.267,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Wed, 20 Oct 2021 15:09:19 -0000

On 10/19/21 2:47 AM, Frédéric Pétrot wrote:
> +static TCGv get_gprh(DisasContext *ctx, int reg_num)
> +{
> +    if (reg_num == 0 || get_ol(ctx) < MXL_RV128) {
> +        return ctx->zero;
> +    }

So... why return anything for OL < 128?
Seems like that should be a bug.

> +static void gen_set_gprh(DisasContext *ctx, int reg_num, TCGv t)
> +{
> +    if (reg_num != 0) {
> +        if (get_ol(ctx) < MXL_RV128) {
> +            tcg_gen_sari_tl(cpu_gprh[reg_num], cpu_gpr[reg_num], 63);
> +        } else {
> +            tcg_gen_mov_tl(cpu_gprh[reg_num], t);
> +        }
> +    }

Hmm... this implies that you must set the low part first, which could be easy to mis-use. 
  Probably better to create a combined gen_set_gpr128 that takes both halves at once.

> +    /* devilish temporary code so that the patch compiles */
> +    if (get_xl_max(ctx) == MXL_RV128) {
> +        (void)get_gprh(ctx, 6);
> +        (void)dest_gprh(ctx, 6);
> +        gen_set_gprh(ctx, 6, NULL);
> +    }

I don't think it would be confusing to squash this patch into the next one, which adds the 
actual uses.


r~

