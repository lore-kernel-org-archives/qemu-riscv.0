Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oPyEj-0004pp-8H
	for mharc-qemu-riscv@gnu.org; Sun, 21 Aug 2022 23:36:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oPyEh-0004nG-GS; Sun, 21 Aug 2022 23:36:23 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e]:37379)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oPyEg-0001nl-1J; Sun, 21 Aug 2022 23:36:23 -0400
Received: by mail-pf1-x42e.google.com with SMTP id x15so8241043pfp.4;
 Sun, 21 Aug 2022 20:36:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=xoXmjtkZay61G5A7/m9KnKrXQf2SDXVZJkMYp9GCs6Y=;
 b=LeevP9SSQcBWjwHmvRroPe0zvEaMdtROSiXyFGVZVG4+5dOlLy1cVl9VTjsTRzmmkr
 wpGuqBQ8X6uNayADvwm0lXgy2LFiu1B47ieezaE5W74K/IaBmwA1MKBQxtCYEP96ch86
 R+LdcRtjQWOoOMdycfgmFbxERuId/oGKm9cz0Zc9TD1etvvsj7U/VINLDWAXRC/LTKIQ
 ysacwTCXpnQyKiC8CVdRD96PTlduop/A0Tpv5PCgaW0eTv8LZeWyd0WmEJzfVFOhyb3p
 DQgDffmCVcvOjDnDUfDJipL396TWgwZEjh4EqFo3IeWa2t4Pwl4gADLJa92ixwAnS5x3
 OJSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=xoXmjtkZay61G5A7/m9KnKrXQf2SDXVZJkMYp9GCs6Y=;
 b=vN4lk9Ft+Lu0l0g2TsDJAnp8bMYnofyHvIenpa3SBdrnj66PZJ5vadDjTRj7LwPgKx
 Qfo7Rt0ssRtZVFPgOotIjuYtaj6IqsXoGCa8qPJRX/2rfhR0ueA/MUVoWM/i72vInKC2
 NaWgkITTj9MZ4dlUj41wABwSqVGZ3vmwszqyo57y+/1ceNSUXpkSPi3qKUv9H9nhzCb9
 HM00i+3AB0/kuHNiTqJsLutheNFogyx+mURlCl/oQmSmZxBZ/fal4FL486+C1IiNexPm
 mYnExIOVqGoKW4m89f2qIOjmq5VfEcBaVBgxDxpxU6hC3KidzDxvVWXfcqv2ptzvPrn/
 LBrA==
X-Gm-Message-State: ACgBeo0BDGWXQovgfxwHtFs7Xv7HaQfEdbSb0T8iPrj5CgbVN+YuftqE
 ZdDrsXgEXH5kLjIlSw+g7CN3RGeqJaUzZVnd9yc=
X-Google-Smtp-Source: AA6agR6xf8Tdm5D9r1W5mfX8AYvcP/kYggwJthA/D45kVq6tuueS2YFdgY+yn0MBzzJ+lW7eBFjbmJhaqYF2G6+FD3c=
X-Received: by 2002:a05:6a00:88e:b0:52c:65a3:fdb4 with SMTP id
 q14-20020a056a00088e00b0052c65a3fdb4mr18621214pfj.83.1661139380205; Sun, 21
 Aug 2022 20:36:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220816045408.1231135-1-rpathak@ventanamicro.com>
In-Reply-To: <20220816045408.1231135-1-rpathak@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 22 Aug 2022 13:35:54 +1000
Message-ID: <CAKmqyKNJ-YjRvskBKZ1KaWmjKa0r3Ua2qomdqYKnhT01hKWfnw@mail.gmail.com>
Subject: Re: [PATCH v1] target/riscv: Add xicondops in ISA entry
To: Rahul Pathak <rpathak@ventanamicro.com>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Anup Patel <anup@brainfault.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=alistair23@gmail.com; helo=mail-pf1-x42e.google.com
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
X-List-Received-Date: Mon, 22 Aug 2022 03:36:23 -0000

On Tue, Aug 16, 2022 at 2:54 PM Rahul Pathak <rpathak@ventanamicro.com> wrote:
>
> XVentanaCondOps is Ventana custom extension. Add
> its extension entry in the ISA Ext array
>
> Signed-off-by: Rahul Pathak <rpathak@ventanamicro.com>

Thanks!

Applied to riscv-to-apply.next

Alistair

> ---
>
> This patch is based on branch riscv-to-apply.next (Alistair qemu tree)
> Based on top commit: f2a91d8b78
>
>  target/riscv/cpu.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 2498b93105..27d10bd6a6 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -104,6 +104,7 @@ static const struct isa_ext_data isa_edata_arr[] = {
>      ISA_EXT_DATA_ENTRY(svinval, true, PRIV_VERSION_1_12_0, ext_svinval),
>      ISA_EXT_DATA_ENTRY(svnapot, true, PRIV_VERSION_1_12_0, ext_svnapot),
>      ISA_EXT_DATA_ENTRY(svpbmt, true, PRIV_VERSION_1_12_0, ext_svpbmt),
> +    ISA_EXT_DATA_ENTRY(xventanacondops, true, PRIV_VERSION_1_12_0, ext_XVentanaCondOps),
>  };
>
>  static bool isa_ext_is_enabled(RISCVCPU *cpu,
> --
> 2.34.1
>
>

