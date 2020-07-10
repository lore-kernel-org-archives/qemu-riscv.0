Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jtzjf-0000x2-Kq
	for mharc-qemu-riscv@gnu.org; Fri, 10 Jul 2020 16:35:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1jtzje-0000uT-3G; Fri, 10 Jul 2020 16:35:06 -0400
Received: from mail-il1-x144.google.com ([2607:f8b0:4864:20::144]:38254)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1jtzjc-0004om-FF; Fri, 10 Jul 2020 16:35:05 -0400
Received: by mail-il1-x144.google.com with SMTP id s21so6181344ilk.5;
 Fri, 10 Jul 2020 13:35:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HnWt/hZyXezbEvChdfViIOo9Shdhe49a4Ah1talr3l4=;
 b=nnAxulEmMkjY6Ol0s/3wlndPpSkluD6+Sp6yLIhgFf+iElI9H3nU5OFqHncs9TT1Ad
 SL8Z3fkKojAlPAMNMta+5vS80f5rhIIdRIhuvcu8AH2qCLV3s0brkZ9/EmjqpuQOMhJ6
 35rxICSIA0inRra61PtTECM2fYmP8HMSf3c9UTgfNwMgoDV0tMx2qp3Mqvt97pv2sns7
 nhcutk7xJvWWea+V5ecThTS1CVtfptLvcFvOAWUWXgPYK0ZKlC0pjSbV+lZK1IplIELZ
 LR5U8PqWQdirQ89BspCJrWILIiR/R2fTmXx3FpuQIJlguVzkrDqSDDDENsmRBZhH+5gX
 JEjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HnWt/hZyXezbEvChdfViIOo9Shdhe49a4Ah1talr3l4=;
 b=DTav/3Qt7jaYhEPybK0s8Ph40QR26jZAdtxsPpP6Lvj34STLxHRSiedjXLdp2qAOsn
 drsRmB9UmHD2XmHcjZKq6PJK9lzmFb4DDTLcxWmWfyBLwZXjIlq1kWbuYsv4XvpgaG3a
 0ah/u8aoSXrrEgpWX97v9US5nARSK9AHsRwv+RZpbVC4T2Kp0ttsDvU9RKk0pPOZbCu3
 fzmisysUGw9PoRuqTe6Fl5lG0Wm3rCsrxbMMODqUm5Qxp23DWNw31EXzfZi2/1vF9FZr
 pchMkF/J+vkgaUjfPPEDAKnN6Qz0zwedc0FpsuBOSf8dOVo/82t7kfmce0IKCbTDx8nO
 Z0Iw==
X-Gm-Message-State: AOAM531wTG1KyoprMODNNHDGXJ2LzbIoXvlf3f5HjrSu1ovCCBa5l92q
 IP91t5VAOGwzv7L9Xc4s11IPgVrH5bhVInVBCwc=
X-Google-Smtp-Source: ABdhPJxqpo0KmBFUFdLCF6fk25q5v2rNyvK0p9YKTAWaNoTqC2lwQzbJMmKZjeY9QmZ9F/+7TU2Nn7XcK+8fDit6Dks=
X-Received: by 2002:a92:d186:: with SMTP id z6mr56934791ilz.227.1594413302684; 
 Fri, 10 Jul 2020 13:35:02 -0700 (PDT)
MIME-Version: 1.0
References: <20200706084550.24117-1-amergnat@baylibre.com>
In-Reply-To: <20200706084550.24117-1-amergnat@baylibre.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 10 Jul 2020 13:25:09 -0700
Message-ID: <CAKmqyKMhsF+X4L2Eahn3f-f-_F6ZUeTTimKWGibYo2VxVbFSiw@mail.gmail.com>
Subject: Re: [PATCH v1] target/riscv: fix pmp implementation
To: Alexandre Mergnat <amergnat@baylibre.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 baylibre-upstreaming@groups.io, 
 nroyer@baylibre.com, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::144;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x144.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
X-List-Received-Date: Fri, 10 Jul 2020 20:35:06 -0000

On Mon, Jul 6, 2020 at 2:45 AM Alexandre Mergnat <amergnat@baylibre.com> wrote:
>
> The end address calculation for NA4 mode is wrong because the address
> used isn't shifted.
>
> That imply all NA4 setup are not applied by the PMP.

I'm not sure what you mean here, can you clarify this?

>
> The solution is to use the shifted address calculated for start address
> variable.
>
> Modifications are tested on Zephyr OS userspace test suite which works
> for other RISC-V boards (E31 and E34 core).
>
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>

Otherwise:

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/pmp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
> index 9418660f1b..2a2b9f5363 100644
> --- a/target/riscv/pmp.c
> +++ b/target/riscv/pmp.c
> @@ -171,7 +171,7 @@ static void pmp_update_rule(CPURISCVState *env, uint32_t pmp_index)
>
>      case PMP_AMATCH_NA4:
>          sa = this_addr << 2; /* shift up from [xx:0] to [xx+2:2] */
> -        ea = (this_addr + 4u) - 1u;
> +        ea = (sa + 4u) - 1u;
>          break;
>
>      case PMP_AMATCH_NAPOT:
> --
> 2.17.1
>
>

