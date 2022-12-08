Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p38LS-0007AL-Bs
	for mharc-qemu-riscv@gnu.org; Wed, 07 Dec 2022 23:17:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1p38LM-00079k-5H; Wed, 07 Dec 2022 23:17:09 -0500
Received: from mail-vs1-xe29.google.com ([2607:f8b0:4864:20::e29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1p38LD-0006aW-9i; Wed, 07 Dec 2022 23:17:05 -0500
Received: by mail-vs1-xe29.google.com with SMTP id q128so394194vsa.13;
 Wed, 07 Dec 2022 20:16:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=AZNhtBZRjveedD4xJkNVcq2nk+AeKZz9V3HT4Z8/by0=;
 b=nt74wQurAkdPbweCfmbiAL8p3ZrU8PSwcjBfHGPhDMibmFUfh4XA5nTKkPXngb+0/A
 uq7sPbkJ2IE86scKGrzYeNZk5pGQ+qi5GE8uVkzJ0sOxFs/qgEIjNQIbgHvxystIHB0J
 LTuI6pNeVUthEqdQ7OiwnnQQTSe4xfnHXsO3ZK+1qjRu4D2yZyVG0/BzBLXMUSLIUwqF
 7XJitRjYcG76e1EjGzNYzKoJQcgxoMBqdHjJ5Rg4bjeMoeIDRvS8+PFvng00pjCfFncf
 IzLYRfjii9zR/6zjCdzFAzw+xs69SGUyVDQM50r1EOCLK2toQ4vS4ZpaaCrhjhbVUskB
 dpAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=AZNhtBZRjveedD4xJkNVcq2nk+AeKZz9V3HT4Z8/by0=;
 b=WviI4NgqRiEgT4XuHoqi6vUlebzS9g1psbuHvypR6rKeaqRCBVVStKB9zDmgKOPV+j
 TPRdlwh+qypxu7/G1GkCowdZW8dIE7pPPlDAEJeYuVGOyAQ4x2d2MnAcDQJM4w8r5WNv
 eTxlhkSawXeuKuvWImybvrzXCaH5Tfmdvsmo5x/cpP06ANE08veXSY9kNC7Iqw5mzSfE
 az7z7UXFwmJK0fClMRPOI4c/ehY3P+mHXE3XA90sgOxYBmdsfHuyQyL7EgN6e/CKdQMQ
 kawhZ11SGZjiVFBufC4pTh2oXauJcnrYpZGLgbqny9j5lDNgKjNKTCBZ95m5yRXjbaeR
 ndQw==
X-Gm-Message-State: ANoB5pmzH+lU1ixtXqLDEYLF82CdOOh00yf9qFvZGYcIofB+gMmlowMW
 D8QMd3K7zwQZYBGtTT0TTqLiFbHDfxbBZqicVvn1R43kTxY=
X-Google-Smtp-Source: AA0mqf6nzDtUv3Wf3l1xfeG+yn0aiGlyM/elvpYibgOqZZnxNjter82FaozQcUNjAuIx1vvO0K4LHj+G7t9iMxvYCA8=
X-Received: by 2002:a67:c519:0:b0:3b1:2b83:1861 with SMTP id
 e25-20020a67c519000000b003b12b831861mr10283946vsk.10.1670473010423; Wed, 07
 Dec 2022 20:16:50 -0800 (PST)
MIME-Version: 1.0
References: <20221207090037.281452-1-bmeng@tinylab.org>
In-Reply-To: <20221207090037.281452-1-bmeng@tinylab.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 8 Dec 2022 14:16:24 +1000
Message-ID: <CAKmqyKPmxVQUmonnatU-xdnWF517fR0TLBYwoQmY=NnGRCnfyg@mail.gmail.com>
Subject: Re: [PATCH 1/2] target/riscv: Simplify helper_sret() a little bit
To: Bin Meng <bmeng@tinylab.org>
Cc: qemu-devel@nongnu.org, Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e29;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe29.google.com
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
X-List-Received-Date: Thu, 08 Dec 2022 04:17:12 -0000

On Wed, Dec 7, 2022 at 7:05 PM Bin Meng <bmeng@tinylab.org> wrote:
>
> There are 2 paths in helper_sret() and the same mstatus update codes
> are replicated. Extract the common parts to simplify it a little bit.
>
> Signed-off-by: Bin Meng <bmeng@tinylab.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>
>  target/riscv/op_helper.c | 20 ++++++--------------
>  1 file changed, 6 insertions(+), 14 deletions(-)
>
> diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
> index d7af7f056b..a047d38152 100644
> --- a/target/riscv/op_helper.c
> +++ b/target/riscv/op_helper.c
> @@ -149,21 +149,21 @@ target_ulong helper_sret(CPURISCVState *env)
>      }
>
>      mstatus = env->mstatus;
> +    prev_priv = get_field(mstatus, MSTATUS_SPP);
> +    mstatus = set_field(mstatus, MSTATUS_SIE,
> +                        get_field(mstatus, MSTATUS_SPIE));
> +    mstatus = set_field(mstatus, MSTATUS_SPIE, 1);
> +    mstatus = set_field(mstatus, MSTATUS_SPP, PRV_U);
> +    env->mstatus = mstatus;
>
>      if (riscv_has_ext(env, RVH) && !riscv_cpu_virt_enabled(env)) {
>          /* We support Hypervisor extensions and virtulisation is disabled */
>          target_ulong hstatus = env->hstatus;
>
> -        prev_priv = get_field(mstatus, MSTATUS_SPP);
>          prev_virt = get_field(hstatus, HSTATUS_SPV);
>
>          hstatus = set_field(hstatus, HSTATUS_SPV, 0);
> -        mstatus = set_field(mstatus, MSTATUS_SPP, 0);
> -        mstatus = set_field(mstatus, SSTATUS_SIE,
> -                            get_field(mstatus, SSTATUS_SPIE));
> -        mstatus = set_field(mstatus, SSTATUS_SPIE, 1);
>
> -        env->mstatus = mstatus;
>          env->hstatus = hstatus;
>
>          if (prev_virt) {
> @@ -171,14 +171,6 @@ target_ulong helper_sret(CPURISCVState *env)
>          }
>
>          riscv_cpu_set_virt_enabled(env, prev_virt);
> -    } else {
> -        prev_priv = get_field(mstatus, MSTATUS_SPP);
> -
> -        mstatus = set_field(mstatus, MSTATUS_SIE,
> -                            get_field(mstatus, MSTATUS_SPIE));
> -        mstatus = set_field(mstatus, MSTATUS_SPIE, 1);
> -        mstatus = set_field(mstatus, MSTATUS_SPP, PRV_U);
> -        env->mstatus = mstatus;
>      }
>
>      riscv_cpu_set_mode(env, prev_priv);
> --
> 2.34.1
>
>

