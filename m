Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kpa2e-0005Cj-Qa
	for mharc-qemu-riscv@gnu.org; Wed, 16 Dec 2020 11:52:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpa2d-00057p-0O
 for qemu-riscv@nongnu.org; Wed, 16 Dec 2020 11:52:43 -0500
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:54281)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpa2Z-0002vE-Au
 for qemu-riscv@nongnu.org; Wed, 16 Dec 2020 11:52:41 -0500
Received: by mail-pj1-x102d.google.com with SMTP id f14so1799624pju.4
 for <qemu-riscv@nongnu.org>; Wed, 16 Dec 2020 08:52:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=O96YMA9+rIQFixqhIxkmC15YbXNyWcSLrfZtwsY9UDg=;
 b=DlxFfv4rMP+xU8GD6k5li/c+STw20lWXcXAJgTpUOKE1p5xJ/F0xgRjw4sVToXlexI
 4koIzrozL6xdIXID78UwWAIiomVfZXSuACHFXuS5chA8qmdggL2MbBYlhPoQOtbfdUXL
 oi0923X6g2kwYo/DEoi4IJiq3nsnI4CK8uC1xo8hlG84F6mD4K2BDfRKznhBhKRP15rM
 NMeKqREsdhUKPxmh0iXzWDv4AyYma3XeTTKhG1C1Cyi43IBEBjgJCRe1fdgle72gqPiK
 wYXkpKQsLNRHO00p0BZ0qJtAkuhlz+wzvIRhshwCcOeK3x0G6cxbljXC3ZQBbXMRVjpj
 iGng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=O96YMA9+rIQFixqhIxkmC15YbXNyWcSLrfZtwsY9UDg=;
 b=fQsGwltyMv8lfeZRwZAjx3A8p5COhGsvuQI9Cf68raLa8TOEODUZ/q9wBzTyFggIio
 lhhDt1LQ/wDy92Rl8kYo2RTuzWv86m9YnpKrD6YBgbU7VhSOXqimveEW0vVtzMKxmp7s
 GFWd89y+Z8vHKA0dwuVL/EjfDYBS2WqeYaC22pj0PXZMgEdJeprSoOmPlM5L9ufWibXC
 gLmyWnEit8UWAMrZl93YeKqRe3b4zzdpZ8ZJrqdyFBEKc6G/So9z4jd3285Wt+tdNcmq
 j5RZklrjjgkO5eha2FvarhWCUkNAzU+Orct/ZGoWqD1zFsUtz2Sl8Pmmx1XBW0UoHRZF
 JNeg==
X-Gm-Message-State: AOAM530yeBQsfenjAMLD3VuB/VFxA08EcTU/PmJanENsL86qkM/XN2ZT
 KIV6lBvJ9tj+rR637HDYcDM5vw==
X-Google-Smtp-Source: ABdhPJwDVxsyN4C/uvzFcyZ4vCHbif7IQst2zPOko6RdumJrYWOqCr2XA9utCc9Ze92iPPGUfhFoxQ==
X-Received: by 2002:a17:902:7205:b029:db:d2d5:fe79 with SMTP id
 ba5-20020a1709027205b02900dbd2d5fe79mr2741287plb.30.1608137556699; 
 Wed, 16 Dec 2020 08:52:36 -0800 (PST)
Received: from [192.168.71.34] ([172.58.27.195])
 by smtp.gmail.com with ESMTPSA id j17sm2887398pfh.183.2020.12.16.08.52.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Dec 2020 08:52:36 -0800 (PST)
Subject: Re: [RFC v2 11/15] target/riscv: rvb: generalized reverse
To: frank.chang@sifive.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Kito Cheng <kito.cheng@sifive.com>
References: <20201216020150.3157-1-frank.chang@sifive.com>
 <20201216020150.3157-12-frank.chang@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <678c7e2d-45b8-9363-664f-7f7e9164bfdf@linaro.org>
Date: Wed, 16 Dec 2020 10:52:28 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201216020150.3157-12-frank.chang@sifive.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
X-List-Received-Date: Wed, 16 Dec 2020 16:52:43 -0000

On 12/15/20 8:01 PM, frank.chang@sifive.com wrote:
> +target_ulong HELPER(grevw)(target_ulong rs1, target_ulong rs2)
> +{
> +    return do_grev(rs1, rs2, 32);
> +}
> +
> +#endif
> +
> diff --git a/target/riscv/helper.h b/target/riscv/helper.h

Stray whitespace at the end of the file.
checkpatch or git should have complained about this.

> +static bool gen_grevi(DisasContext *ctx, arg_grevi *a)
> +{
> +    TCGv source1 = tcg_temp_new();
> +    TCGv source2;
> +
> +    gen_get_gpr(source1, a->rs1);
> +
> +    if (a->shamt == (TARGET_LONG_BITS - 8)) {
> +        /* rev8, byte swaps */
> +#ifdef TARGET_RISCV32
> +        tcg_gen_bswap32_tl(source1, source1);
> +#else
> +        tcg_gen_bswap64_tl(source1, source1);
> +#endif

I should add a tcg_gen_bswap_tl define so that this ifdef is not necessary.
For the to-do list...

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

