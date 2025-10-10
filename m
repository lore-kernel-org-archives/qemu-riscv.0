Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6BF0CCA476
	for <qemu-riscv@archiver.kernel.org>; Fri, 10 Oct 2025 15:06:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1v7Eh3-0005QD-5z; Fri, 10 Oct 2025 11:06:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v7Eh0-0005Pq-LX
 for qemu-riscv@nongnu.org; Fri, 10 Oct 2025 11:06:02 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v7Egr-0003CU-PW
 for qemu-riscv@nongnu.org; Fri, 10 Oct 2025 11:06:01 -0400
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3ee130237a8so1778312f8f.0
 for <qemu-riscv@nongnu.org>; Fri, 10 Oct 2025 08:05:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760108748; x=1760713548; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Nn0zR8GqP18BMIkZcNmLNoITloyNSGQRERm8oHWHeRs=;
 b=lC6OrAK7Fb8vjegyltVXUO9x3NAd+8dNN4nyWFqrJituX4y0/i965+s0chCUaC5Yew
 iL1R6f/40RXvcjgZ8ijOwSNQVK235U3v8RXb5kXzQi4JvCS+PfRP+WTrUIxJ2uQDi5I0
 XrM1TVsG9a/mo+s+Z8FzcOTHKgcvCLVo4pRxWsxUIndJK0BrN7qcDZ1JihDuGtJ3WukX
 0wkkaHjAjfTv8fD7zPJ4FXQKvOk0Mmka1d41KC+FV0kBW1VeYLDwQtmMH7JC29NqLCpE
 F//PMqBj7dSGVxg4JE/EFWTHbud8/PNmo0nxjW7wzIESwoHQTbY6FHkKSnxXdsJ/iNCj
 q2kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760108748; x=1760713548;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Nn0zR8GqP18BMIkZcNmLNoITloyNSGQRERm8oHWHeRs=;
 b=Get8A6hptPsS2DtH1FrtiLjq/yF9tKoDRCLxe1lQ32tI8sgcTUiWq3rE4DE7I5fRxW
 j6SncCYT6y8Oqn09t6uCXQvxafiMP6URmRe1UekwUDcROXADi//vMQ05ezYBVDDlsSG/
 OkU50sQTqNK9WCSWVEzDc0v2djowTBvylXxTtl7BD0lwz1MfkoTrfFHqyV6jwMfJN7o8
 XtWrh1076hoMYZf9yoKSzjTeoyeIALK/BGzkAJSbf5257bSWkioNet22E7AEc0ii1EXU
 LbKjbyLPUh6UEXn3glc6gB6zIP0ql7O58TbWFtqbBVQbAK5yr158jb9KNWTg77QbPY9B
 u1JQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVnce2aV/p5f7c0nDDaT4QVNQXW0dCeirrd34L/Os5Z9AqgqF66LYwAQ+htN9kePjTDeBRgshENmweF@nongnu.org
X-Gm-Message-State: AOJu0YyWbiD7OmsBlw2RbP1OVGCBdm1ke6eeAGjYMxhjBG3Io5O2qo+D
 XOavYhcXaSP4sxURydjWwtu+VzAxFd8mrWBV3FShu1zXWWSKpsKP8vApgIhbeVJFKks=
X-Gm-Gg: ASbGncvV7DrsdvuGAtxyIQ4qrT4YycFcTpdzaL8fUiqTjgWMfvghY6DQED415bd3J69
 w/Wu56br6o1GAGJdQE8+tmkIS1mFuaZTxvgFFHXBjj+uHuGOk/K5QUmHNW3IfUoEO04/Ch6qdHt
 xWtVUKEWQajSZ27vWiJT/EZypKZ1vX9luhcR9k6vIjBRQD7wCnvbzi8QtD2OAQxiBPZUmCostfZ
 06GhwZmvyl+dqRQiUzstLZE9IEH56EThCDI5VxqrCx09a9HsL9bLC3lGe4scnGFsEZioM6XKLSk
 RpHWMMrxDh/SYpeZvEx8SiVvX0n180QxY6gcAqGwaGK4CrT9re3rAdF0WkVtCmy3AbRszjcz5vG
 4xfSbs5NMSStIE0YDn4mS2UHZdDX+3gRDYWW19etATe0yhecipM1xC9BlTST5z8aVBU83LuOYcj
 f2p+LwJ4mqcZUl
X-Google-Smtp-Source: AGHT+IElAYqLkkLd+2OyA1l6T9c1VqvgzMY9oaJGkhizEv0M3tE6cw7ONXIpeVQzzr4wbZ7tL7xgzw==
X-Received: by 2002:a05:6000:1a8b:b0:425:8bd1:fbb4 with SMTP id
 ffacd0b85a97d-4266e7df95cmr8024279f8f.50.1760108748202; 
 Fri, 10 Oct 2025 08:05:48 -0700 (PDT)
Received: from [192.168.69.221] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-426ce5e83e1sm4717821f8f.51.2025.10.10.08.05.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Oct 2025 08:05:47 -0700 (PDT)
Message-ID: <39bc0cef-cda7-43f7-8d9c-870599a6e91d@linaro.org>
Date: Fri, 10 Oct 2025 17:05:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 09/18] target/riscv: accessors to registers upper part
 and 128-bit load/store
Content-Language: en-US
To: =?UTF-8?B?RnLDqWTDqXJpYyBQw6l0cm90?=
 <frederic.petrot@univ-grenoble-alpes.fr>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: bin.meng@windriver.com, richard.henderson@linaro.org, palmer@dabbelt.com, 
 fabien.portas@grenoble-inp.org, alistair.francis@wdc.com
References: <20220106210108.138226-1-frederic.petrot@univ-grenoble-alpes.fr>
 <20220106210108.138226-10-frederic.petrot@univ-grenoble-alpes.fr>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20220106210108.138226-10-frederic.petrot@univ-grenoble-alpes.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Hi Frédéric,

(old patch merged as commit a2f827ff4f44)

On 6/1/22 22:00, Frédéric Pétrot wrote:
> Get function to retrieve the 64 top bits of a register, stored in the gprh
> field of the cpu state. Set function that writes the 128-bit value at once.
> The access to the gprh field can not be protected at compile time to make
> sure it is accessed only in the 128-bit version of the processor because we
> have no way to indicate that the misa_mxl_max field is const.
> 
> The 128-bit ISA adds ldu, lq and sq. We provide support for these
> instructions. Note that (a) we compute only 64-bit addresses to actually
> access memory, cowardly utilizing the existing address translation mechanism
> of QEMU, and (b) we assume for now little-endian memory accesses.
> 
> Signed-off-by: Frédéric Pétrot <frederic.petrot@univ-grenoble-alpes.fr>
> Co-authored-by: Fabien Portas <fabien.portas@grenoble-inp.org>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>   target/riscv/insn16.decode              |  27 ++++++-
>   target/riscv/insn32.decode              |   5 ++
>   target/riscv/translate.c                |  41 ++++++++++
>   target/riscv/insn_trans/trans_rvi.c.inc | 100 ++++++++++++++++++++++--
>   4 files changed, 163 insertions(+), 10 deletions(-)


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
> +    if ((memop & MO_SIZE) <= MO_64) {
> +        tcg_gen_qemu_ld_tl(destl, addrl, ctx->mem_idx, memop);
> +        if (memop & MO_SIGN) {
> +            tcg_gen_sari_tl(desth, destl, 63);
> +        } else {
> +            tcg_gen_movi_tl(desth, 0);
> +        }
> +    } else {
> +        /* assume little-endian memory access for now */
> +        tcg_gen_qemu_ld_tl(destl, addrl, ctx->mem_idx, MO_TEUQ);
> +        tcg_gen_addi_tl(addrl, addrl, 8);
> +        tcg_gen_qemu_ld_tl(desth, addrl, ctx->mem_idx, MO_TEUQ);

I am confused by this "assume little-endian access" comment, since
you set the MO_TE flag (target endianness). I suppose you added the
comment since the @memop argument is ignored in this code path.
Maybe you want 'MO_LEUQ' here instead, to select little endianness?

> +    }
> +
> +    gen_set_gpr128(ctx, a->rd, destl, desth);
> +
> +    tcg_temp_free(addrl);
> +    return true;
> +}
> +
> +static bool gen_load(DisasContext *ctx, arg_lb *a, MemOp memop)
> +{
> +    if (get_xl(ctx) == MXL_RV128) {
> +        return gen_load_i128(ctx, a, memop);
> +    } else {
> +        return gen_load_tl(ctx, a, memop);
> +    }
> +}


