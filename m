Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mmXNC-0000Zt-PP
	for mharc-qemu-riscv@gnu.org; Mon, 15 Nov 2021 03:29:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mmXNB-0000ZZ-GB
 for qemu-riscv@nongnu.org; Mon, 15 Nov 2021 03:29:53 -0500
Received: from [2a00:1450:4864:20::42f] (port=39875
 helo=mail-wr1-x42f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mmXN9-0002df-Nz
 for qemu-riscv@nongnu.org; Mon, 15 Nov 2021 03:29:52 -0500
Received: by mail-wr1-x42f.google.com with SMTP id d27so28991716wrb.6
 for <qemu-riscv@nongnu.org>; Mon, 15 Nov 2021 00:29:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=6CvrUbwSk0+PNWc4am1FCO1GwHppsO6l+E19tPCcZQI=;
 b=Hh+yRkO5aoazr/y0hqcPF/pQ2HnRwFAkKnMeghuOJ8KOwN8n8LqTpR2xDMncoyd3pt
 BsqVe/cS7u0eUgXNocIUh08xdKSqK7M7xFu/psHTgUa2BukpqUFou6m44VuikAILh/d8
 SeHhxBHBxgeJqZ8I1O2CrCvlOaN+6wAbgbZCSHynu4ExNdUarBU77f5kYo1eoEwwyYYW
 KNXTz6DawFBkXJHy9PnxaIXj9OzS2fAxgyueAZvR3ywCxtavm4dZIgTlOUZrD01rZUdF
 iJvz7HwTfDf4abC/WsjS3Mzij9Ck/jEmYlK8FmTLNNcgTY/De4QjYbPBbDTJQbfiClXq
 tc0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6CvrUbwSk0+PNWc4am1FCO1GwHppsO6l+E19tPCcZQI=;
 b=nKCEsx6I5ea3JPqIv0B3ln9ACQmKKO5KOFvd6rR8vAjIv7XiHH+2PSVc+WhW8o/55N
 Aa6MhlaHneMXwQUAXVVuYWqLVBB3GIeJweu/YsxKPZ6G3jGsd+5Tsunelg8v1ibXzTLL
 dKz7X333EfZQ69nlCMzkC9k5gra0lSD7vcD7TfK0ZliVEYaPlYBUtu8a4dBv4Yk9a/KM
 LgDJAMWsS1QpZgEXRbPxtVYRuekOlK+DKa/Dogf7onRIzocVVo4UyQdqnZ4PdJPelve3
 Ah5/kGL4v4iTollo+Vgc7dLoLEgBArF5gfb2fCHZZKKoiWHXfsh7ZE2JDQRtJijIOEGm
 PvDA==
X-Gm-Message-State: AOAM530JEM5HDADBn3+8vxZeoAxmwo1Q3E1K0p9AEIU3zGWXeW6HAS0O
 aA9Us0ePkQSdcC4wUSyKHNrNMA==
X-Google-Smtp-Source: ABdhPJz30Ona9NDT0z6oF1Dup0ii9F2Eap7huBn+vF8UvlCH5EvXwjH2Y3tmuLaxSB3lHEKY/8bQeg==
X-Received: by 2002:a5d:4b41:: with SMTP id w1mr43390615wrs.437.1636964989682; 
 Mon, 15 Nov 2021 00:29:49 -0800 (PST)
Received: from [192.168.8.105] (137.red-176-80-46.dynamicip.rima-tde.net.
 [176.80.46.137])
 by smtp.gmail.com with ESMTPSA id x4sm18245630wmi.3.2021.11.15.00.29.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Nov 2021 00:29:49 -0800 (PST)
Subject: Re: [PATCH v5 09/18] target/riscv: accessors to registers upper part
 and 128-bit load/store
To: =?UTF-8?B?RnLDqWTDqXJpYyBQw6l0cm90?=
 <frederic.petrot@univ-grenoble-alpes.fr>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: alistair.francis@wdc.com, bin.meng@windriver.com, philmd@redhat.com,
 palmer@dabbelt.com, fabien.portas@grenoble-inp.org
References: <20211112145902.205131-1-frederic.petrot@univ-grenoble-alpes.fr>
 <20211112145902.205131-10-frederic.petrot@univ-grenoble-alpes.fr>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e3ab42c2-3c29-76bd-65e6-5c5b748b743b@linaro.org>
Date: Mon, 15 Nov 2021 09:29:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211112145902.205131-10-frederic.petrot@univ-grenoble-alpes.fr>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.278,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 15 Nov 2021 08:29:53 -0000

On 11/12/21 3:58 PM, Frédéric Pétrot wrote:
> +/* Compute only 64-bit addresses to use the address translation mechanism */
> +static bool gen_load_i128(DisasContext *ctx, arg_lb *a, MemOp memop)
> +{
> +    TCGv src1l = get_gpr(ctx, a->rs1, EXT_NONE);
> +    TCGv destl = dest_gpr(ctx, a->rd);
> +    TCGv desth = dest_gprh(ctx, a->rd);
> +    TCGv addrl = tcg_temp_new();
> +
> +    tcg_gen_addi_tl(addrl, src1l, a->imm);
> +
> +    if (memop != MO_TEUO) {

It is perhaps clearer as (memop & MO_SIZE) <= MO_64.

> +        tcg_gen_qemu_ld_tl(memop & MO_BSWAP ? desth : destl, addrl,
> +                           ctx->mem_idx, MO_TEUQ);

This isn't correct.  MO_BSWAP is related to the host, not the guest.

You want

	(memop & MO_BSWAP) == MO_LE ? destl : desth

Are there any big-endian RISC-V though?


> +static bool gen_store_i128(DisasContext *ctx, arg_sb *a, MemOp memop)
> +{
> +    TCGv src1l = get_gpr(ctx, a->rs1, EXT_NONE);
> +    TCGv src2l = get_gpr(ctx, a->rs2, EXT_NONE);
> +    TCGv src2h = get_gprh(ctx, a->rs2);
> +    TCGv addrl = tcg_temp_new();
> +
> +    tcg_gen_addi_tl(addrl, src1l, a->imm);
> +
> +    if (memop != MO_TEUO) {
> +        tcg_gen_qemu_st_tl(src2l, addrl, ctx->mem_idx, memop);
> +    } else {
> +        tcg_gen_qemu_st_tl(memop & MO_BSWAP ? src2h : src2l, addrl,
> +            ctx->mem_idx, MO_TEUQ);

Likewise.


r~

