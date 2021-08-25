Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mIm66-0007Wo-NF
	for mharc-qemu-riscv@gnu.org; Wed, 25 Aug 2021 02:09:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mIm65-0007UH-5T; Wed, 25 Aug 2021 02:09:13 -0400
Received: from mail-io1-xd2c.google.com ([2607:f8b0:4864:20::d2c]:41540)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mIm60-0005Qv-Tw; Wed, 25 Aug 2021 02:09:12 -0400
Received: by mail-io1-xd2c.google.com with SMTP id j18so29331803ioj.8;
 Tue, 24 Aug 2021 23:09:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yolgKs8h4ahNBcX6EN6NRUrcqzziTEr1CXk8W+qKYog=;
 b=YX3unLNJCbRKUiyI5ImQ7srFqYTDh9dhJjY1hda8olq0WFklSwQ37tDx1BWmC5tGzw
 aIu1X/8CG7dEj55F0qkC8iNLbZwTO8/w9jn+6DfHUZM6vj8YrBHfhZnxTEYxvPiDBluT
 v8hWysTQBdCjDOINtlmViBUmfB9pCva+bu7mcy7O8UG4osRGEdwYlemoZRqgGfGarFUY
 qkzKtvHVdMgtX/H4MbnD2htjdrppa+1i70vKI/wAdTR/ymg4m4a+Jnrdj1qE1++HKJkI
 JHflhe2VSgGp1BKYFN/k/5U7b53CO3zyslMAdhSljBg8ypnvyLSFQ9tzo2Der6o8IxvS
 /x2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yolgKs8h4ahNBcX6EN6NRUrcqzziTEr1CXk8W+qKYog=;
 b=tcrYUpOgb9R8zkfKV5FYesHxSF4/fKHhF16IkTsgRvTZVhQ0TFVZPEtZQ5BUWH/Wjh
 pA/ZQHT9KYE/0GGMqp7GohIKO7DcVvFssPoROIUsW3qqg5AyLCtMWUb9dzwoaW+Jt/0E
 Le4ou/ivplQlwhaFORkMjYOSFs2HZXt1EbaUqN4X8l1IKHAMa33APVQOGXuA6UuoP+D7
 wgnukjqaZBQ9ptN77ureP1zvDRmTNeXaExi4cmwPKCmDiT1J0mSevzvDQOWV63x5J1Zm
 XHAMdSGmbT0v1Rc28+G6/2NooijyWDG4NxJdjA4MKo3KaZYMwmiv5gvOzuWGuqWTGVsQ
 /WBQ==
X-Gm-Message-State: AOAM533J072PevA5qQnYhzEHSaW5pl/RkedET95OM263x+cyUoAuxGLS
 r1Zj1vwR9zPZqecPeATLh6p4mDTrYKDFw7xtHG4=
X-Google-Smtp-Source: ABdhPJyScTI2KZ+ynaAvaHxfbyGzom+WzQwkesP/xsDV6i10s/oRWpeUR2xarQ9whcM/qeddIW1U7+JQOHKlPcq1yHU=
X-Received: by 2002:a05:6638:3048:: with SMTP id
 u8mr37641015jak.91.1629871747416; 
 Tue, 24 Aug 2021 23:09:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210823195529.560295-1-richard.henderson@linaro.org>
 <20210823195529.560295-17-richard.henderson@linaro.org>
In-Reply-To: <20210823195529.560295-17-richard.henderson@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 25 Aug 2021 16:08:41 +1000
Message-ID: <CAKmqyKP=4OzTEg-rQowoVjg8gG8wdBN_17rOU2wexQmaBQn1wA@mail.gmail.com>
Subject: Re: [PATCH v5 16/24] target/riscv: Fix rmw_sip, rmw_vsip, rmw_hsip vs
 write-only operation
To: Richard Henderson <richard.henderson@linaro.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2c;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2c.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Wed, 25 Aug 2021 06:09:13 -0000

On Tue, Aug 24, 2021 at 6:03 AM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> We distinguish write-only by passing ret_value as NULL.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/csr.c | 23 +++++++++++++++--------
>  1 file changed, 15 insertions(+), 8 deletions(-)
>
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 9a4ed18ac5..d900f96dc1 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -937,9 +937,12 @@ static RISCVException rmw_vsip(CPURISCVState *env, int csrno,
>      /* Shift the S bits to their VS bit location in mip */
>      int ret = rmw_mip(env, 0, ret_value, new_value << 1,
>                        (write_mask << 1) & vsip_writable_mask & env->hideleg);
> -    *ret_value &= VS_MODE_INTERRUPTS;
> -    /* Shift the VS bits to their S bit location in vsip */
> -    *ret_value >>= 1;
> +
> +    if (ret_value) {
> +        *ret_value &= VS_MODE_INTERRUPTS;
> +        /* Shift the VS bits to their S bit location in vsip */
> +        *ret_value >>= 1;
> +    }
>      return ret;
>  }
>
> @@ -956,7 +959,9 @@ static RISCVException rmw_sip(CPURISCVState *env, int csrno,
>                        write_mask & env->mideleg & sip_writable_mask);
>      }
>
> -    *ret_value &= env->mideleg;
> +    if (ret_value) {
> +        *ret_value &= env->mideleg;
> +    }
>      return ret;
>  }
>
> @@ -1072,8 +1077,9 @@ static RISCVException rmw_hvip(CPURISCVState *env, int csrno,
>      int ret = rmw_mip(env, 0, ret_value, new_value,
>                        write_mask & hvip_writable_mask);
>
> -    *ret_value &= hvip_writable_mask;
> -
> +    if (ret_value) {
> +        *ret_value &= hvip_writable_mask;
> +    }
>      return ret;
>  }
>
> @@ -1084,8 +1090,9 @@ static RISCVException rmw_hip(CPURISCVState *env, int csrno,
>      int ret = rmw_mip(env, 0, ret_value, new_value,
>                        write_mask & hip_writable_mask);
>
> -    *ret_value &= hip_writable_mask;
> -
> +    if (ret_value) {
> +        *ret_value &= hip_writable_mask;
> +    }
>      return ret;
>  }
>
> --
> 2.25.1
>
>

