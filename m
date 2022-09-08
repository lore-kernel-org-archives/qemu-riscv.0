Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oWDjZ-0001dd-78
	for mharc-qemu-riscv@gnu.org; Thu, 08 Sep 2022 05:22:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oWDjY-0001Yx-58; Thu, 08 Sep 2022 05:22:04 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:35545)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oWDjU-0001CY-20; Thu, 08 Sep 2022 05:22:03 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 m10-20020a17090a730a00b001fa986fd8eeso1778217pjk.0; 
 Thu, 08 Sep 2022 02:21:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=iY4W3XvZA2T/Z8FmOnSsSixDAwf9KPY/nN37rDX+Ojs=;
 b=gyBvaW2PYu11OT2+aqpozErilNaEsEqUDZhhu+iCsGoKhl5Zvi/ft4e1br8s/UIZe+
 5d/KYFLr4gnXxlMKg5kg16ChBtXflm70oEZwilQ7Kes16BCYKtMrCRuaWmBWSdg7FQA2
 ViPjKgbVwFZ8B9UCbSnLi2uNjwZPOOz5svKEC+CeEAPNLqrxDCkDN/leNfDUS/Ye/2W4
 VWbyIqOWGzpEAHQMZb9ej1F2DlQr6DwSODm7TVsUV/0tc4MRwjNFdOluEz/C8yd9ftYN
 AYhS7TaIL7hAD71kiKvvvZih0FTTQ9n/yYBA5iCFYgNldOAekyZLZO+x1GyJdm4im2A6
 qwFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=iY4W3XvZA2T/Z8FmOnSsSixDAwf9KPY/nN37rDX+Ojs=;
 b=LCvAhvOhz0z7VqPBgSyRzk7J0bnEiZthTwLAzISqzqew31yN7tJHk5V2xp45iPG+G+
 gwEVA5dEMD5zQokSIyGBYScxRzU8ffvTvw2w1V7VkJGYfWVcqKMdL6a36dgMJyZPUf73
 Yqm44RT+QpFpkGjjCkJ86bxqD4DV55xDrCWIuyfkhosMp2qLQNxH8DrYViu0zS2vbP8Y
 ccOd4QicL4v17HPmYeKXaNtZ9ELRouvdUGrmx2oMFNwZruyDOayU0VrfZmFCMcQlCVqA
 wNKrIPTES3ci4d2J9XEjUPHBYs523hbr2Bbi4L0c9U1YrFfDv2xy0pYsI1x6K+XIWOsK
 mwEw==
X-Gm-Message-State: ACgBeo1rDIuZjrQ//5RmZVAWQHSxfsGmFgDGbcKIvM2MpcwRvVzWENvX
 a2qFFuRqMJLK1PAeKfy/rdw7rE//R60+tJjI3Rk=
X-Google-Smtp-Source: AA6agR6+3bs0cOaJiTTuqRMRP0JoV7tyJ7mfKvIGe/QydioWAL8bq92WJXHlPufkBOKfEVuqCfh6fbTCCfZ53vY77M0=
X-Received: by 2002:a17:90a:474b:b0:1fd:62c3:62ef with SMTP id
 y11-20020a17090a474b00b001fd62c362efmr3228849pjg.8.1662628918436; Thu, 08 Sep
 2022 02:21:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220824145255.400040-1-rpathak@ventanamicro.com>
In-Reply-To: <20220824145255.400040-1-rpathak@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 8 Sep 2022 11:21:31 +0200
Message-ID: <CAKmqyKO13Vxhczae33na2P+GQM-fNdU5H-BJvCtMaqtuKNtDNQ@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: Remove sideleg and sedeleg
To: Rahul Pathak <rpathak@ventanamicro.com>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Rahul Pathak <rpathakmailbox@gmail.com>, 
 Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=alistair23@gmail.com; helo=mail-pj1-x102f.google.com
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
X-List-Received-Date: Thu, 08 Sep 2022 09:22:04 -0000

On Wed, Aug 24, 2022 at 4:54 PM Rahul Pathak <rpathak@ventanamicro.com> wrote:
>
> sideleg and sedeleg csrs are not part of riscv isa spec
> anymore, these csrs were part of N extension which
> is removed from the riscv isa specification.
>
> These commits removed all traces of these csrs from
> riscv spec (https://github.com/riscv/riscv-isa-manual) -
>
> commit f8d27f805b65 ("Remove or downgrade more references to N extension (#674)")
> commit b6cade07034d ("Remove N extension chapter for now")
>
> Signed-off-by: Rahul Pathak <rpathak@ventanamicro.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  disas/riscv.c           | 2 --
>  target/riscv/cpu_bits.h | 2 --
>  2 files changed, 4 deletions(-)
>
> diff --git a/disas/riscv.c b/disas/riscv.c
> index 7af6afc8fa..a709d66167 100644
> --- a/disas/riscv.c
> +++ b/disas/riscv.c
> @@ -1304,8 +1304,6 @@ static const char *csr_name(int csrno)
>      case 0x0043: return "utval";
>      case 0x0044: return "uip";
>      case 0x0100: return "sstatus";
> -    case 0x0102: return "sedeleg";
> -    case 0x0103: return "sideleg";
>      case 0x0104: return "sie";
>      case 0x0105: return "stvec";
>      case 0x0106: return "scounteren";
> diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
> index 6be5a9e9f0..7251121218 100644
> --- a/target/riscv/cpu_bits.h
> +++ b/target/riscv/cpu_bits.h
> @@ -190,8 +190,6 @@
>
>  /* Supervisor Trap Setup */
>  #define CSR_SSTATUS         0x100
> -#define CSR_SEDELEG         0x102
> -#define CSR_SIDELEG         0x103
>  #define CSR_SIE             0x104
>  #define CSR_STVEC           0x105
>  #define CSR_SCOUNTEREN      0x106
> --
> 2.34.1
>
>

