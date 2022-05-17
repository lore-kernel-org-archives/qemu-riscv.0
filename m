Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nqkt6-0001dE-PH
	for mharc-qemu-riscv@gnu.org; Mon, 16 May 2022 20:16:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nqkt2-0001cn-49; Mon, 16 May 2022 20:16:28 -0400
Received: from mail-io1-xd36.google.com ([2607:f8b0:4864:20::d36]:41836)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nqkt0-0007E4-C0; Mon, 16 May 2022 20:16:27 -0400
Received: by mail-io1-xd36.google.com with SMTP id z26so17733216iot.8;
 Mon, 16 May 2022 17:16:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=v54+QeGFXqz8MdFssGzRwjz36B49bbmYSFy2xRl1Pw4=;
 b=qGkEtFR7RJwkFuXvBve32MhZ6h/jQFZ2/9s06jyXFe32XLACCnwXh7Iu09y0iDJtAO
 YrmiSUlKsp9HD+Vpda5PGA6QK8A08jKsKlLghqy9zuvGHoMRmPEoHI00QuPmxBfPLarm
 +lQaxtWK5Z/3i51BTeJNGp38wOrqilOAX6nf+qOBzZP3ASqnELP1O2qDqDq2jnJEQpsT
 WzfERQmonJ2DDIwJjJCTys8AkiDPa9AiTx0QoEOsVSull5WSC8+WEP7ugOeYnO0uIM7/
 l0kDgUkqWjNSOURaPRtamxL9372P3QSvxqa9EuCGsawCQO3xotj1g+UMlNVU8I4xYfYB
 9ePw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=v54+QeGFXqz8MdFssGzRwjz36B49bbmYSFy2xRl1Pw4=;
 b=i+ou8ooOsDa8iO8jdUTSfW4FGYZP+axD45oveljd1hBDJa6NuokS5eDErtLQZBS5XO
 B86f5xedBvlTnuNzTGxWpO0BdWkKLCC1rx+4wqKD8t44zotJJKZniRwe0CCtzny1PZYh
 xq9tZro4YVrAynIf5Yez+7Ev8yFOFQA+/LeWeey8+xLUXMHAy2QkLcRLtQCSIHnW8e+C
 a91ivW2/eMZXkC2cO3TvxNEYmbrA7O6Ib3PF9e9Xd9efvUXzRQhY06Floo3aexFUT28o
 SOnl9N1F01LoetjJdhLa+6ZHdGdYHLPC/DmzcuXplY+YwYMYp1nqflK4U6PdNluCYqcA
 M80g==
X-Gm-Message-State: AOAM533+E0UX2fmeRgOX5otJ6UtbVklByrqiaeMTZP3QKlF83tGvcg4g
 PI1ktyJz4NHtkZx9U7qVj/GznNnLBqtax519iC4=
X-Google-Smtp-Source: ABdhPJwECdCGzQ2rYRQxeuo3DMNBVeHoObCu1IqEa3fVImdmTn9u+t2qfSKnuAgjazKPKuVSCDoXw2aZ8kPqgv5dx98=
X-Received: by 2002:a05:6638:160d:b0:32b:d9d2:f2f2 with SMTP id
 x13-20020a056638160d00b0032bd9d2f2f2mr10396160jas.68.1652746584933; Mon, 16
 May 2022 17:16:24 -0700 (PDT)
MIME-Version: 1.0
References: <20220511144528.393530-1-apatel@ventanamicro.com>
 <20220511144528.393530-8-apatel@ventanamicro.com>
In-Reply-To: <20220511144528.393530-8-apatel@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 17 May 2022 10:15:59 +1000
Message-ID: <CAKmqyKN5U927XfL7n_8S=3ykMyHPLM_kyM9qfYV5dq_eSmoEfA@mail.gmail.com>
Subject: Re: [PATCH v2 7/8] target/riscv: Force disable extensions if priv
 spec version does not match
To: Anup Patel <apatel@ventanamicro.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d36;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd36.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Tue, 17 May 2022 00:16:28 -0000

On Thu, May 12, 2022 at 12:52 AM Anup Patel <apatel@ventanamicro.com> wrote:
>
> We should disable extensions in riscv_cpu_realize() if minimum required
> priv spec version is not satisfied. This also ensures that machines with
> priv spec v1.11 (or lower) cannot enable H, V, and various multi-letter
> extensions.
>
> Fixes: a775398be2e ("target/riscv: Add isa extenstion strings to the
> device tree")
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>

This will potentially confuse users as we just disable the extension
without telling them.

Could we not just leave this as is and let users specify the
extensions they want? Then it's up to them to specify the correct
combinations

Alistair

> ---
>  target/riscv/cpu.c | 34 ++++++++++++++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index f3b61dfd63..25a4ba3e22 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -541,6 +541,40 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
>          set_priv_version(env, priv_version);
>      }
>
> +    /* Force disable extensions if priv spec version does not match */
> +    if (env->priv_ver < PRIV_VERSION_1_12_0) {
> +        cpu->cfg.ext_h = false;
> +        cpu->cfg.ext_v = false;
> +        cpu->cfg.ext_zfh = false;
> +        cpu->cfg.ext_zfhmin = false;
> +        cpu->cfg.ext_zfinx = false;
> +        cpu->cfg.ext_zhinx = false;
> +        cpu->cfg.ext_zhinxmin = false;
> +        cpu->cfg.ext_zdinx = false;
> +        cpu->cfg.ext_zba = false;
> +        cpu->cfg.ext_zbb = false;
> +        cpu->cfg.ext_zbc = false;
> +        cpu->cfg.ext_zbkb = false;
> +        cpu->cfg.ext_zbkc = false;
> +        cpu->cfg.ext_zbkx = false;
> +        cpu->cfg.ext_zbs = false;
> +        cpu->cfg.ext_zk = false;
> +        cpu->cfg.ext_zkn = false;
> +        cpu->cfg.ext_zknd = false;
> +        cpu->cfg.ext_zkne = false;
> +        cpu->cfg.ext_zknh = false;
> +        cpu->cfg.ext_zkr = false;
> +        cpu->cfg.ext_zks = false;
> +        cpu->cfg.ext_zksed = false;
> +        cpu->cfg.ext_zksh = false;
> +        cpu->cfg.ext_zkt = false;
> +        cpu->cfg.ext_zve32f = false;
> +        cpu->cfg.ext_zve64f = false;
> +        cpu->cfg.ext_svinval = false;
> +        cpu->cfg.ext_svnapot = false;
> +        cpu->cfg.ext_svpbmt = false;
> +    }
> +
>      if (cpu->cfg.mmu) {
>          riscv_set_feature(env, RISCV_FEATURE_MMU);
>      }
> --
> 2.34.1
>
>

