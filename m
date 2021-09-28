Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mVLr6-0000bG-CF
	for mharc-qemu-riscv@gnu.org; Tue, 28 Sep 2021 18:45:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mVLr3-0000Xj-Cg; Tue, 28 Sep 2021 18:45:41 -0400
Received: from mail-il1-x132.google.com ([2607:f8b0:4864:20::132]:44942)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mVLr1-0001vZ-OB; Tue, 28 Sep 2021 18:45:41 -0400
Received: by mail-il1-x132.google.com with SMTP id b12so683635ilf.11;
 Tue, 28 Sep 2021 15:45:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gpsx6V8tygKXfEoChJ79SwAPeCyJNS/+BznR5BdDnuM=;
 b=MIQu1+nE6NfYR+6EUjptAe30vElfiqG4yFmBOT8bZUdwdVESgWhPkfOnYClydT41jz
 pNJFPBDQ8lUpfVQXPvGvhDAcx/YKpQfvQEWGWDfLkyG2IPkOsQMaEPAVgZ2/YXsiQqET
 iXElOg2FaoCKn7atLOL7+laoXig+o7HAwyuGGbpF5J7WP+D6Z3O+N4t1ZPk/xdS+LaI8
 dxFOLNd9+wXQSHr4gAgxKKWjpst8XdJV8iauGe4eLY8o0sG+P5YEScwebqJFjKsnlF/q
 CB3FinzUYR5ZmnjodzPSnXBS2HeHblEcYHjTZtodfzXQG2dfbuk4Woh4pbD0Qo4pycc9
 Io6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gpsx6V8tygKXfEoChJ79SwAPeCyJNS/+BznR5BdDnuM=;
 b=74vWvqqXmwdmLoWGCIUfAkEJaL2upk0FO0f7NH2rxFDcqZnY3silE6CNOBc0Z5Ae/2
 9e95EVkHNbaEdlRVyZziNQrsCW1OhZqGlzPk0aE8HbLZ5Ulcblx4Y8uvOvoBRn5UGKoG
 qZbAWpkCywPKnNp96vOF22TIpbUVGxDFDnvj1ebK6iOJ3EIkXnGeMSy3hTMEL53y8TW8
 8523KiAVrdvthFAiS9aYz2HzbYwt0gpEPnqBQOwLRUObP5tVEHoFPdavPq+YbSYsVeAg
 AwDCPGoL7qaWkoU2epPgz/sxRl51d3ojth00ubxOlvjcWJAqhAclDNlfdFVmqJ0ukmMd
 MXkw==
X-Gm-Message-State: AOAM533ahb/o6TyVxgpvNebk3wfN1adf7i7bFaEhDbdVRtPjSE4DwgHT
 ef7bgXglEU3nM4tjkO/0DMZYa+Owqpaefgmb+o8=
X-Google-Smtp-Source: ABdhPJztagGb3K1bk0IxrbxBzc4yxDRMg+Htn/KL52VImaKefB17JVmbPtzonlVzJrR+zHbhTPFCpi1P9hfdaM3B54M=
X-Received: by 2002:a05:6e02:1b04:: with SMTP id
 i4mr5919221ilv.221.1632869138234; 
 Tue, 28 Sep 2021 15:45:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210927072124.1564129-1-bmeng.cn@gmail.com>
In-Reply-To: <20210927072124.1564129-1-bmeng.cn@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 29 Sep 2021 08:45:12 +1000
Message-ID: <CAKmqyKPG_QPb+uDprW-C5W_ush-4j7TbAAkpB_61NGPh7P76Aw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] hw/dma: sifive_pdma: Fix Control.claim bit
 detection
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Frank Chang <frank.chang@sifive.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::132;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x132.google.com
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
X-List-Received-Date: Tue, 28 Sep 2021 22:45:42 -0000

On Mon, Sep 27, 2021 at 5:21 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> At present the codes detect whether the DMA channel is claimed by:
>
>   claimed = !!s->chan[ch].control & CONTROL_CLAIM;
>
> As ! has higher precedence over & (bitwise and), this is essentially
>
>   claimed = (!!s->chan[ch].control) & CONTROL_CLAIM;
>
> which is wrong, as any non-zero bit set in the control register will
> produce a result of a claimed channel.
>
> Fixes: de7c7988d25d ("hw/dma: sifive_pdma: reset Next* registers when Control.claim is set")
> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

>
> ---
>
> Changes in v2:
> - reword the commit message
>
>  hw/dma/sifive_pdma.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/dma/sifive_pdma.c b/hw/dma/sifive_pdma.c
> index b4fd40573a..b8ec7621f3 100644
> --- a/hw/dma/sifive_pdma.c
> +++ b/hw/dma/sifive_pdma.c
> @@ -243,7 +243,7 @@ static void sifive_pdma_write(void *opaque, hwaddr offset,
>      offset &= 0xfff;
>      switch (offset) {
>      case DMA_CONTROL:
> -        claimed = !!s->chan[ch].control & CONTROL_CLAIM;
> +        claimed = !!(s->chan[ch].control & CONTROL_CLAIM);
>
>          if (!claimed && (value & CONTROL_CLAIM)) {
>              /* reset Next* registers */
> --
> 2.25.1
>
>

