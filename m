Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1o1Stl-0000Ma-G0
	for mharc-qemu-riscv@gnu.org; Wed, 15 Jun 2022 09:17:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1o1Stb-0000JQ-AO; Wed, 15 Jun 2022 09:17:19 -0400
Received: from mail-qv1-xf30.google.com ([2607:f8b0:4864:20::f30]:33572)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1o1StY-0001IY-Gi; Wed, 15 Jun 2022 09:17:18 -0400
Received: by mail-qv1-xf30.google.com with SMTP id 89so8810927qvc.0;
 Wed, 15 Jun 2022 06:17:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vTN1HO9i4ODCv88NfrlGPhYgsqbgQVYH1nOAKzfqJmY=;
 b=nt+wYLESHCEeuWIQ2nfepqoHFh6KXXKgmJApMUbjmUHC9c3ahlqnvJlG0Q3H1m5XkR
 kTcBBdl7R2EdCdU8vYeFMoZrLY/iXD11lk0z2msoUNYPRcdXwjJq356aojvbJapJ+WWP
 JOup7mpqCZ3JDPrgsfEodFq9lwxKqGYeWGSODO00E+lLrYCqrrVN/G1zH/0qfcH5fIqX
 oKYzrXLB52C4qk8jdtixv4O8P0NEEZYdkfIfZUh/NJ9OhSRvVPV9klHJa2KY8EN3PIyf
 IHOh0Z/rERYIa4LPFr8X8DNpUE7CSZgF4pRcSl//1fjwO/2ue9KwAqC+m94h0vCSyAxa
 RYCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vTN1HO9i4ODCv88NfrlGPhYgsqbgQVYH1nOAKzfqJmY=;
 b=WJ4TONF6uewFRz96n3oT5GyLk8PHlN+ufXrZJ/hM1k9WkORkv1sYAc5pHC4UIgtQqB
 QmXcIk4NSOsaX5Xlhzi1kNFdEKo/8n6UtdHZb4qG/KbZh92GLaLjIG7XxwUJ+ImF7/61
 ziFeBpstKTv/FE6jrvTQ4Q/ypeJnHe5uyCMEpsXeOteh9Q49YDmA1uoQn/GrqQTXm7H+
 jURjYNOBRYIYUcmVIyCA8GQZUpGWk1s5y7kJh0DxG6st6YyjqLJvggb4FY7nFE1f5qgk
 aPPOZEIwBwv+LcX8E8eMOgOms4bVbchzvzZdiuPbeyLyFQuF4PbHRmR2iO6h+bdkFp6o
 F1fA==
X-Gm-Message-State: AJIora+GBln+sMZ+SGcm20XVxDtqA03w1nV31UHa/URWkksCyLGhgEr5
 pMgNg4EhcGsGD1SQ/MBMwZTjXzrpXivuJw9v7Yc=
X-Google-Smtp-Source: AGRyM1sz/KiXf3VkSY0ILqTpHUmu5BJ+Ct5o6TE5TC6nw8+X5gPbBB7k0KIE2b+8EPj+C79TSgqao/vM6xUnl/O6Jkk=
X-Received: by 2002:a05:6214:5c1:b0:46e:38cc:2bb2 with SMTP id
 t1-20020a05621405c100b0046e38cc2bb2mr7898203qvz.12.1655299034964; Wed, 15 Jun
 2022 06:17:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220610051328.7078-1-frank.chang@sifive.com>
 <20220610051328.7078-9-frank.chang@sifive.com>
In-Reply-To: <20220610051328.7078-9-frank.chang@sifive.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 15 Jun 2022 21:17:03 +0800
Message-ID: <CAEUhbmXfe3uNxhfvnarGX7z9L8c8XvD3UJBbxbV9_=hY31Ah4Q@mail.gmail.com>
Subject: Re: [PATCH 8/9] target/riscv: debug: Return 0 if previous value
 written to tselect >= number of triggers
To: Frank Chang <frank.chang@sifive.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::f30;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qv1-xf30.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 15 Jun 2022 13:17:23 -0000

On Fri, Jun 10, 2022 at 1:24 PM <frank.chang@sifive.com> wrote:
>
> From: Frank Chang <frank.chang@sifive.com>
>
> If the value written to tselect is greater than or equal to the number
> of supported triggers, then the following reads of tselect would return
> value 0.

Where is this behavior documented?

>
> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> ---
>  target/riscv/cpu.h   | 1 +
>  target/riscv/debug.c | 6 ++++++
>  2 files changed, 7 insertions(+)
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index bac5f00722..c7ee3f80e6 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -289,6 +289,7 @@ struct CPUArchState {
>
>      /* trigger module */
>      target_ulong trigger_cur;
> +    target_ulong trigger_prev;
>      target_ulong tdata1[RV_MAX_TRIGGERS];
>      target_ulong tdata2[RV_MAX_TRIGGERS];
>      target_ulong tdata3[RV_MAX_TRIGGERS];
> diff --git a/target/riscv/debug.c b/target/riscv/debug.c
> index ce9ff15d75..83b72fa1b9 100644
> --- a/target/riscv/debug.c
> +++ b/target/riscv/debug.c
> @@ -158,6 +158,10 @@ bool tdata_available(CPURISCVState *env, int tdata_index)
>
>  target_ulong tselect_csr_read(CPURISCVState *env)
>  {
> +    if (env->trigger_prev >= RV_MAX_TRIGGERS) {
> +        return 0;
> +    }
> +
>      return env->trigger_cur;
>  }
>
> @@ -166,6 +170,8 @@ void tselect_csr_write(CPURISCVState *env, target_ulong val)
>      if (val < RV_MAX_TRIGGERS) {
>          env->trigger_cur = val;
>      }
> +
> +    env->trigger_prev = val;
>  }
>
>  static target_ulong tdata1_validate(CPURISCVState *env, target_ulong val,
> --

The spec mentions "implementations which have 2^n triggers only need
to implement n bits of tselect", so in QEMU we can always implement
2^n triggers and have tselect implement just n bit.

In such way, writing tselect can be: env->trigger_cur = val &
(RV_MAX_TRIGGERS - 1).

and I believe you can squash this patch into patch 4 "target/riscv:
debug: Restrict the range of tselect value can be written" because in
patch 4 you changed the actual tselect range while the original
implementation allowed all bits to be set.

Regards,
Bin

