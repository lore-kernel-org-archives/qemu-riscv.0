Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mCtj9-0001yX-RC
	for mharc-qemu-riscv@gnu.org; Sun, 08 Aug 2021 21:05:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mCtj1-0001x8-BQ; Sun, 08 Aug 2021 21:05:07 -0400
Received: from mail-il1-x131.google.com ([2607:f8b0:4864:20::131]:37601)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mCtj0-0006dG-1c; Sun, 08 Aug 2021 21:05:07 -0400
Received: by mail-il1-x131.google.com with SMTP id f8so9681662ilr.4;
 Sun, 08 Aug 2021 18:05:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YBOWwCIYShnZW0nVMlMs76lRibVThBc7InTIpWaTdP0=;
 b=jppbyiDvSBsv5rxGkfkvkpoxYRmFG5u1WWje0b+8KTy1xa/Nfx+d3l7TKmqI4h9PMR
 xHysZRlFORtqdyE7y4ct9/SAH6uAEkSdsJ8Di/YRc0Mhc2kmdfCXkvXvlDTe3I7RPh8u
 s85GtAfUDrKzLWlBD76HoDt55ZD8wW9SmomjapG499WH/HUk/YxNMEgZrScuB32OxaIn
 eyM2iyLl3yyYnfyBALrMylKpKbNGki56TaCAz7qr/tN2t4O2wP5/omnSVb/VkEl2aUP9
 sbIjq5JyC591jUweLyrMYH9rmdu9/3lqkNg27vCk3ow7UbW7K3LxLiSwusuKzS3+01lG
 eETg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YBOWwCIYShnZW0nVMlMs76lRibVThBc7InTIpWaTdP0=;
 b=mcZy+Z8KcWSWza7kHQvIp5LGAeEiHw/CvGE/IMgcf678NKda/hq5psq7mXnqcrimhf
 inSkLEfjH+XDa8AkUR53zUKiR8ZaQ3bfkReSYUER6aDCh519iPZUE6E8oTnVpZ/i3L3P
 5OdmsR4zMYB3NQPXlpWkoCl+9arbyfBWNRB+Y19pQV9uzNqjSYGVE0S2TiDUoZYeeVUR
 M52QUcSrqzlIs1TDITpqQpYTtbl8eNJgPfv83khZqSdftsDqTrihWYPp9dukkQqdbWTA
 IXqah0mpyAT9hZsJA+6uMx/iVTKJy3UVD+OVBZGCKlvAOPYxY1TG0cjJR1U7JTmcdcox
 CJCg==
X-Gm-Message-State: AOAM532tHqPqbhq5Wjb73kxif17yNhDxFdPQS9JFIG1NP5oAwAHq/uGp
 +DNCh9aznlg282yEzzvTntWLDSJ5tjkqThp/6Fc=
X-Google-Smtp-Source: ABdhPJzZbnDnPS2A0QoErx73IvADLKPhzEGq5EVip3nFN7XYl1rPoJfm+xYGDmmcmCyb2J/U+d+f+A+7YAckGMnK1ew=
X-Received: by 2002:a05:6e02:12c9:: with SMTP id
 i9mr346673ilm.131.1628471104645; 
 Sun, 08 Aug 2021 18:05:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210807141025.31808-1-bmeng.cn@gmail.com>
In-Reply-To: <20210807141025.31808-1-bmeng.cn@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 9 Aug 2021 11:04:38 +1000
Message-ID: <CAKmqyKPNE4+BJTau9_JhQsS8z2rsxzRbTjt3HGdnA-aD4irdoA@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: Correct a comment in riscv_csrrw()
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::131;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x131.google.com
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
X-List-Received-Date: Mon, 09 Aug 2021 01:05:09 -0000

On Sun, Aug 8, 2021 at 12:10 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> When privilege check fails, RISCV_EXCP_ILLEGAL_INST is returned,
> not -1 (RISCV_EXCP_NONE).
>
> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>

Thanks!

Applied to riscv-to-apply.next

Alistair

> ---
>
>  target/riscv/csr.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 9a4ed18ac5..e747fbe0e9 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -1423,7 +1423,7 @@ RISCVException riscv_csrrw(CPURISCVState *env, int csrno,
>      target_ulong old_value;
>      RISCVCPU *cpu = env_archcpu(env);
>
> -    /* check privileges and return -1 if check fails */
> +    /* check privileges and return RISCV_EXCP_ILLEGAL_INST if check fails */
>  #if !defined(CONFIG_USER_ONLY)
>      int effective_priv = env->priv;
>      int read_only = get_field(csrno, 0xC00) == 3;
> --
> 2.25.1
>
>

