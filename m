Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mD1gq-0001yi-WF
	for mharc-qemu-riscv@gnu.org; Mon, 09 Aug 2021 05:35:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mD1gp-0001vk-Gh; Mon, 09 Aug 2021 05:35:23 -0400
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e]:36803)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mD1go-0000lp-2d; Mon, 09 Aug 2021 05:35:23 -0400
Received: by mail-yb1-xb2e.google.com with SMTP id j77so28275792ybj.3;
 Mon, 09 Aug 2021 02:35:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wKl2exgYIC0znOGtls2ytj+e9m40/uDVxtoaJhfA+5Y=;
 b=uREuab4kOD9YSB6Uo6jYhdWRjgJB1l9P/egm6o5n/nAlfBFtdeMc2Fxd8OH0H4Zlok
 TcmFM/Eacu/Tp7ceaa21Glk5WadnQA9dNAPOJepe6LjIz3lQ+xj35rx5abWZ1DhO3Axa
 zNe4vA3QzJc0EalobmEizThGtonpEG0ZHu62CBEEhk3UmAcT57KK7lnTz7SRdhLzTDtZ
 ND7TvubNvW4CO9Bf/bLf5IGw/YAsbV2XOjMtXsyvCA0OcepPu/rcyk7M3tRna2j2QOid
 UrXKGPe9x83sQtlzU0OWQbo1EvXKc3ZINjKasqQTPdGAD5qgDNVh2/u4GnBcFh55GwjG
 Bs3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wKl2exgYIC0znOGtls2ytj+e9m40/uDVxtoaJhfA+5Y=;
 b=VIaQQ/JBz+gypxN4f8qZdkg+yFVZagjYWs3KZ8xE1oS+hCoxmcgNYWdhlq+yYhTQVk
 AryP3nS3q7DiiICNoDFcQ8M2SAgGI7d+DM7y6Y3kBOiu+wC0Ol1yqWspi1cYhKV+z1U0
 uolNfZVAS+/rYKAG9pI/ZlFng+sITKoKdC4zPb0d9dB/RbJsnHVxdq/wFSouNH7QM35v
 oeaNFX9OFJUPK7gRyzM/zfVYuaaAjpenB9HowIkWlFGYjup+XfxAlqTKE4AOyzX1UMtT
 OjlmV8VaQay4t3Z3M/vxAwoF82ZB+GFAHAnudkahZ90ZeZJfmdvRCV+QCyTcWPuf1V04
 I+Mw==
X-Gm-Message-State: AOAM533VbgT9lZQQNdVafXSfwpTUsaSbmIm5yTsWxEoeDkT4RYMw1592
 lCDsOtbyqncP267wY+GnCr+sWl7UC5P2oQ0GWiA=
X-Google-Smtp-Source: ABdhPJx7Uz+tztreb6vQxrqSW83itwSOmG6bEc85x6NtYXtp0Kfzs7IcrJ6e8WrScresVQ5JSv6LR93U/RSpYBE4QWI=
X-Received: by 2002:a5b:304:: with SMTP id j4mr29588374ybp.314.1628501720256; 
 Mon, 09 Aug 2021 02:35:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210809070727.9245-1-zhiwei_liu@c-sky.com>
In-Reply-To: <20210809070727.9245-1-zhiwei_liu@c-sky.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 9 Aug 2021 17:35:08 +0800
Message-ID: <CAEUhbmXNPE8cmor-V8Vpza79Vt=hgKsP1OE_zeJupAaaF0UdqA@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: Add User CSRs read-only check
To: LIU Zhiwei <zhiwei_liu@c-sky.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2e;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Mon, 09 Aug 2021 09:35:23 -0000

On Mon, Aug 9, 2021 at 3:09 PM LIU Zhiwei <zhiwei_liu@c-sky.com> wrote:
>

nits: please write something in the commit message

> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
> ---
>  target/riscv/csr.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 9a4ed18ac5..ea62d9e653 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -1422,11 +1422,11 @@ RISCVException riscv_csrrw(CPURISCVState *env, int csrno,
>      RISCVException ret;
>      target_ulong old_value;
>      RISCVCPU *cpu = env_archcpu(env);
> +    int read_only = get_field(csrno, 0xC00) == 3;
>
>      /* check privileges and return -1 if check fails */
>  #if !defined(CONFIG_USER_ONLY)
>      int effective_priv = env->priv;
> -    int read_only = get_field(csrno, 0xC00) == 3;
>
>      if (riscv_has_ext(env, RVH) &&
>          env->priv == PRV_S &&
> @@ -1443,6 +1443,10 @@ RISCVException riscv_csrrw(CPURISCVState *env, int csrno,
>          (!env->debugger && (effective_priv < get_field(csrno, 0x300)))) {
>          return RISCV_EXCP_ILLEGAL_INST;
>      }
> +#else
> +    if (write_mask && read_only) {

This can be merged by the !CONFIG_USER_ONLY case.

> +        return -RISCV_EXCP_ILLEGAL_INST;
> +    }
>  #endif
>
>      /* ensure the CSR extension is enabled. */

Regards,
Bin

