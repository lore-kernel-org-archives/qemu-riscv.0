Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mf5Kd-0000zJ-6L
	for mharc-qemu-riscv@gnu.org; Mon, 25 Oct 2021 15:08:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mf5Kb-0000xB-Uo
 for qemu-riscv@nongnu.org; Mon, 25 Oct 2021 15:08:25 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:33387)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mf5KT-000714-Jz
 for qemu-riscv@nongnu.org; Mon, 25 Oct 2021 15:08:25 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 x1-20020a17090a530100b001a1efa4ebe6so548974pjh.0
 for <qemu-riscv@nongnu.org>; Mon, 25 Oct 2021 12:08:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=qzVvPDSjO0tWUJf3zgSIG0T25/fXkT07nkJW6Y7xnPg=;
 b=dMmMIXK6AWSd+aHxQSSDFzH3Op6c7Hj/2fT1liTim+oGw9z/19CG0A6Ai/aJ9M645O
 HgvZtnnE8KPhY1P5rFVGllshjsAEO/R9whzqRVGiCQ36wXN9GJuxlwy+5ZLsb4wOcKN7
 UJHSkupYYd/JKTTkewbZoCWGCFrTOU+VGyY3DjMeiWjed9F/F3ve7Txn8ypYFbUgkXY8
 YXlfGid9uMPOJM9nBdOfXV5zOmyk8QPcaN6neoiUL4vAFzZPFGC+RIOLmCeSc0cSfn+V
 UXr+TYOjflZ50oqAFL1IcbX5IW3sXfQ4d5VnfBN1d2SlrkRyfA5sG4aAu4w2VMJ1yLYC
 i2XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qzVvPDSjO0tWUJf3zgSIG0T25/fXkT07nkJW6Y7xnPg=;
 b=772oyEeqVxi2J2D19+TDYaU+DYpjI87VyADcsgQymSKG8fhtVZdkklLll3kx5kBAjd
 CZTd4zfOkN7KzGc8hmClRGDUVcCmo5ixgvsXfKAS1tO26ITJmL96fNzUY3KqLXuJBRNv
 i+fdJRSGx6pXzX6r003eQzpT4CN18HxR2+MorXsT3wPd+T97qRstlELzHdApDVoCstpT
 wJdX+VNK42DOL/0GI0eIYNQ8rx6HyrLHS2kymMtfGt8eHawwFKObNRw4X7eCDj3OH6ZC
 1n8fdH5ZjDJ8ya63kx+cVMGaXeg/3VLnJibFMReUEqGwpiCw+aVi9kuz8Y+m0VckDHyN
 j9dw==
X-Gm-Message-State: AOAM530lY5KMD0H9ECnpXNoLvrFa2n/MAcG4vTLE+4NMYjysSHbTZUQ7
 kPyROJeiEYQNkjFzxrvlKElOGQ==
X-Google-Smtp-Source: ABdhPJy52mErFRvbM2ZBLblSMVXEvbP9jmfC/9b+iAnQpymjpNRugWJ9WZbAWqgPBbFLuv55/7NpZw==
X-Received: by 2002:a17:902:f687:b0:140:4098:1e12 with SMTP id
 l7-20020a170902f68700b0014040981e12mr12031701plg.81.1635188895933; 
 Mon, 25 Oct 2021 12:08:15 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id qe7sm16478027pjb.1.2021.10.25.12.08.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Oct 2021 12:08:15 -0700 (PDT)
Subject: Re: [PATCH v4 04/17] target/riscv: separation of bitwise logic and
 aritmetic helpers
To: =?UTF-8?B?RnLDqWTDqXJpYyBQw6l0cm90?=
 <frederic.petrot@univ-grenoble-alpes.fr>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: alistair.francis@wdc.com, bin.meng@windriver.com, philmd@redhat.com,
 palmer@dabbelt.com, fabien.portas@grenoble-inp.org
References: <20211025122818.168890-1-frederic.petrot@univ-grenoble-alpes.fr>
 <20211025122818.168890-5-frederic.petrot@univ-grenoble-alpes.fr>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d037dd9f-8410-8e0f-7547-f00c5b0ac6e0@linaro.org>
Date: Mon, 25 Oct 2021 12:08:14 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211025122818.168890-5-frederic.petrot@univ-grenoble-alpes.fr>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.846,
 RCVD_IN_DNSWL_NONE=-0.0001, T_SPF_HELO_TEMPERROR=0.01,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Mon, 25 Oct 2021 19:08:26 -0000

On 10/25/21 5:28 AM, Frédéric Pétrot wrote:
> Introduction of a gen_logic function for bitwise logic to implement
> instructions in which not propagation of information occurs between bits and
> use of this function on the bitwise instructions.
> 
> Signed-off-by: Frédéric Pétrot <frederic.petrot@univ-grenoble-alpes.fr>
> Co-authored-by: Fabien Portas <fabien.portas@grenoble-inp.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/riscv/translate.c                | 27 +++++++++++++++++++++++++
>   target/riscv/insn_trans/trans_rvb.c.inc |  6 +++---
>   target/riscv/insn_trans/trans_rvi.c.inc | 12 +++++------
>   3 files changed, 36 insertions(+), 9 deletions(-)
> 
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index e10c8769b3..5c7971b189 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -376,6 +376,33 @@ static int ex_rvc_shifti(DisasContext *ctx, int imm)
>   /* Include the auto-generated decoder for 32 bit insn */
>   #include "decode-insn32.c.inc"
>   
> +static bool gen_logic_imm_fn(DisasContext *ctx, arg_i *a,
> +                             void (*func)(TCGv, TCGv, target_long))
> +{
> +    TCGv dest = dest_gpr(ctx, a->rd);
> +    TCGv src1 = get_gpr(ctx, a->rs1, EXT_NONE);
> +
> +    func(dest, src1, a->imm);
> +
> +    gen_set_gpr(ctx, a->rd, dest);
> +
> +    return true;
> +}
> +
> +static bool gen_logic(DisasContext *ctx, arg_r *a, DisasExtend ext,
> +                      void (*func)(TCGv, TCGv, TCGv))
> +{
> +    TCGv dest = dest_gpr(ctx, a->rd);
> +    TCGv src1 = get_gpr(ctx, a->rs1, ext);
> +    TCGv src2 = get_gpr(ctx, a->rs2, ext);
> +
> +    func(dest, src1, src2);
> +
> +    gen_set_gpr(ctx, a->rd, dest);
> +
> +    return true;
> +}

I had asked for you to remove the DisasExtend argument, and you only did one of the two 
functions.

r~

