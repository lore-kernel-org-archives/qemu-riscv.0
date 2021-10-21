Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mdSdc-0006yH-9J
	for mharc-qemu-riscv@gnu.org; Thu, 21 Oct 2021 03:37:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mdSdZ-0006ub-Ux; Thu, 21 Oct 2021 03:37:18 -0400
Received: from mail-qk1-x72b.google.com ([2607:f8b0:4864:20::72b]:46730)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mdSdY-0006KR-06; Thu, 21 Oct 2021 03:37:17 -0400
Received: by mail-qk1-x72b.google.com with SMTP id h20so6296446qko.13;
 Thu, 21 Oct 2021 00:37:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Xf2/WvkPjJew3MhIBjJB+/CTy6dwZ2FgQsTjqgRVdrc=;
 b=UkIPPyGyV7rc0YSafjTikbK9BByvaYG1S4Hv02RvoZbV19vcKC9iP4EkRU55ibwyY0
 chKHHni+mzrSPbdHNsw8Ayf4SMuCTSBuTKZLcs4QTHVR7JImR9eU4e2GkitNvQ9Eh7Mh
 uKmf1UHmlo4+2oGG8w/uHIvVkLH+z3lq4nUmTyQ+n89GH1gkBxofTAOxCG9bQprDQrcQ
 8hgFe/nHjqtCJALwZd5DGORxeyf4SUWEeqe6FrwZAvFvBmOAOaA8SPFjQwsaw+6olM+9
 KdwWKTWt0Hi8v9xeJnMGGSyBI6jyQjNf45ixYD7x2blNfw3jhWvlHk2fWLLCl4ThcorD
 RUIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Xf2/WvkPjJew3MhIBjJB+/CTy6dwZ2FgQsTjqgRVdrc=;
 b=ICq5ZhfQso0xg4Gz8cmuLSboKyUtlc44Feu8Z7C0pm9M8VcZCEL39k5aH1FKP+x5cW
 iSQIrelDH+xYCDSuGONq6Z9lKo6yfWAuXYAhT2rZCMfdRZzPAs1Ux2HT8RCZqFLa+ssT
 QTgkOjQQNMnZsG3RAEDKMRZaFuSZwatRSl6NajvF39G/gBe2A1eGwkbjNbTfTTV1MJKn
 9zzUvp3m6aNXoQhAeTgfcsVhzo7isf6F31OItHJ7i91/ylDp9Lqw8YfgvwiULj/iAzEW
 oUMjn1Uq83ZkwE4UVgHeH9F0KsQnm4rggt26jlDb7Zi4QkLi8AQZuyXQfNS9yiXOOuh6
 VPOQ==
X-Gm-Message-State: AOAM533+LGE/rw6lfTPIAHd13wn6hSr/eYP5nurDpfnpfBWtNS1cySU+
 A7YKd6Ls+G2ug58Yt97DRGxCixB05+3gDHUS0yE=
X-Google-Smtp-Source: ABdhPJwZLJ+f2K6EuTac+ND5Zr8l1MNYfGBKPsQWjewObh3FMcN9CIjRpJl/BQTx1ziAA9V8Sl3zD+xfhafEPFa65x8=
X-Received: by 2002:a25:3843:: with SMTP id f64mr4197668yba.313.1634801834932; 
 Thu, 21 Oct 2021 00:37:14 -0700 (PDT)
MIME-Version: 1.0
References: <18b1b681b0f8dd2461e819d1217bf0b530812680.1634524691.git.alistair.francis@wdc.com>
 <8fdf384ca71009a6c3f4e684dc88940c5cd3f284.1634524691.git.alistair.francis@wdc.com>
In-Reply-To: <8fdf384ca71009a6c3f4e684dc88940c5cd3f284.1634524691.git.alistair.francis@wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 21 Oct 2021 15:37:03 +0800
Message-ID: <CAEUhbmXez21dQicgRtydMTxv0P6V5eVubca1t_yZq_JC8LhgEw@mail.gmail.com>
Subject: Re: [PATCH v1 6/9] hw/intc: sifive_plic: Add a reset function
To: Alistair Francis <alistair.francis@opensource.wdc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Alistair Francis <alistair23@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::72b;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qk1-x72b.google.com
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
X-List-Received-Date: Thu, 21 Oct 2021 07:37:18 -0000

On Mon, Oct 18, 2021 at 10:40 AM Alistair Francis
<alistair.francis@opensource.wdc.com> wrote:
>
> From: Alistair Francis <alistair.francis@wdc.com>
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  hw/intc/sifive_plic.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>
> diff --git a/hw/intc/sifive_plic.c b/hw/intc/sifive_plic.c
> index 877e76877c..5444368ad4 100644
> --- a/hw/intc/sifive_plic.c
> +++ b/hw/intc/sifive_plic.c
> @@ -355,6 +355,18 @@ static const MemoryRegionOps sifive_plic_ops = {
>      }
>  };
>
> +static void sifive_plic_reset(DeviceState *dev)
> +{
> +    SiFivePLICState *s = SIFIVE_PLIC(dev);
> +
> +    memset(s->claimed, 0, sizeof(uint32_t) * s->bitfield_words);

This line should be removed.

> +    memset(s->source_priority, 0, sizeof(uint32_t) * s->num_sources);
> +    memset(s->target_priority, 0, sizeof(uint32_t) * s->num_addrs);
> +    memset(s->pending, 0, sizeof(uint32_t) * s->bitfield_words);
> +    memset(s->claimed, 0, sizeof(uint32_t) * s->bitfield_words);
> +    memset(s->enable, 0, sizeof(uint32_t) * s->num_enables);
> +}
> +
>  /*
>   * parse PLIC hart/mode address offset config
>   *
> @@ -501,6 +513,7 @@ static void sifive_plic_class_init(ObjectClass *klass, void *data)
>  {
>      DeviceClass *dc = DEVICE_CLASS(klass);
>
> +    dc->reset = sifive_plic_reset;
>      device_class_set_props(dc, sifive_plic_properties);
>      dc->realize = sifive_plic_realize;
>      dc->vmsd = &vmstate_sifive_plic;

Regards,
Bin

