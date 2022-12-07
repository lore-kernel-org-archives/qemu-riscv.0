Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p2m6D-00030b-OW
	for mharc-qemu-riscv@gnu.org; Tue, 06 Dec 2022 23:32:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1p2m63-0002tx-SQ; Tue, 06 Dec 2022 23:31:59 -0500
Received: from mail-vk1-xa34.google.com ([2607:f8b0:4864:20::a34])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1p2m5z-0005NR-Gh; Tue, 06 Dec 2022 23:31:48 -0500
Received: by mail-vk1-xa34.google.com with SMTP id o5so5445034vkn.7;
 Tue, 06 Dec 2022 20:31:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Sme55OwCecG8q78kMdFz74nNhAWiLwvh5VxRVS5lOuc=;
 b=J66iqjIy4rlYRunZA3R7HWnehA0S36bKzev5WRkvBQYXFqA0B3YuT/Epmr6Q7JeJRh
 apSpQAeb03PNKL+aI8T/cbibtpesCmk/yoF2+kHLhMaOS3wOD65HDasT24Ly6E7rtko6
 iuBBD22llGThw2Q301Z0xfGDIAvi6on0y/a/I6XMWVokNQ621GHVl1mPMGpjol0Hr93s
 +jHS/BgR0d6ZY2iPt7DVCU8s6wgcNLy88bpFIl1qeaMgv/TJQ/xhN3YF1ouJC3qFDo3O
 fskLYRv+hknpsEANlToGhL7b1Eki7/MecfsbSh2WfO29a3C11p3o0+U/ZNlfhHuvvh33
 mD5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Sme55OwCecG8q78kMdFz74nNhAWiLwvh5VxRVS5lOuc=;
 b=JeWkAMtbooX2duNmjmrwWduadusLzJc8c1dZlLh5ZHpfsYxDXEmgcp+RYUF042Tx+m
 WVXnnNRy1N/qFsoj+BOT5Z2eLNtpCx9wW8dYbONwlR2W8QjbAndaMmkSLcGC0DN+ZZEe
 F9CLNLqPdjofFXtRFB46dkrrvqotSJAFkJKihCZo2ZURduOSuF/goBCOHuXnFHw99z3c
 p3L5+TlFHEKm/883gi5B95B7TyElwOSjc5GoblMYR8xS9Yjlp10QO6H8gKAKXql7iI62
 q0MvTgUBgEv85yQhDX5xfNbKvQAFdpdUlayb+0yUr9bgL/Hk1NFQdbnCsZTMsCoPtLFs
 c8bQ==
X-Gm-Message-State: ANoB5pmbiwVpvkiVFHIDHDsAUMM8I5vxWII91/qaPI72vLi1FZw5SYpu
 gLHDhf+ZPt8ruphA34K9w/lp69RCjzCscs1VNbo=
X-Google-Smtp-Source: AA0mqf79mAMq2mK9KckIQ+uvBzOI+xV+TSz7cGHAmfaIemGzAjE+OVx6YnENKuk/bCTRTyH0DKsXqhwKxQz4O61aOA4=
X-Received: by 2002:a1f:3846:0:b0:3bc:c843:c7b5 with SMTP id
 f67-20020a1f3846000000b003bcc843c7b5mr26241383vka.30.1670387506056; Tue, 06
 Dec 2022 20:31:46 -0800 (PST)
MIME-Version: 1.0
References: <20221201140811.142123-1-bmeng@tinylab.org>
 <20221201140811.142123-10-bmeng@tinylab.org>
In-Reply-To: <20221201140811.142123-10-bmeng@tinylab.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 7 Dec 2022 14:31:19 +1000
Message-ID: <CAKmqyKNM1Ng=ud0MyWQPhY_jQ+0qgJ4zSX5WraHhgXKSfUutAQ@mail.gmail.com>
Subject: Re: [PATCH 10/15] hw/riscv: sifive_e: Fix the number of interrupt
 sources of PLIC
To: Bin Meng <bmeng@tinylab.org>
Cc: Alistair Francis <Alistair.Francis@wdc.com>, qemu-devel@nongnu.org, 
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::a34;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa34.google.com
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
X-List-Received-Date: Wed, 07 Dec 2022 04:32:00 -0000

On Fri, Dec 2, 2022 at 12:12 AM Bin Meng <bmeng@tinylab.org> wrote:
>
> Per chapter 10 in Freedom E310 manuals [1][2][3], E310 G002 and G003
> supports 52 interrupt sources while G000 supports 51 interrupt sources.
>
> We use the value of G002 and G003, so it is 53 (including source 0).
>
> [1] G000 manual:
> https://sifive.cdn.prismic.io/sifive/4faf3e34-4a42-4c2f-be9e-c77baa4928c7_fe310-g000-manual-v3p2.pdf
>
> [2] G002 manual:
> https://sifive.cdn.prismic.io/sifive/034760b5-ac6a-4b1c-911c-f4148bb2c4a5_fe310-g002-v1p5.pdf
>
> [3] G003 manual:
> https://sifive.cdn.prismic.io/sifive/3af39c59-6498-471e-9dab-5355a0d539eb_fe310-g003-manual.pdf
>
> Fixes: eb637edb1241 ("SiFive Freedom E Series RISC-V Machine")
> Signed-off-by: Bin Meng <bmeng@tinylab.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>
>  include/hw/riscv/sifive_e.h | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/include/hw/riscv/sifive_e.h b/include/hw/riscv/sifive_e.h
> index d738745925..9e58247fd8 100644
> --- a/include/hw/riscv/sifive_e.h
> +++ b/include/hw/riscv/sifive_e.h
> @@ -82,7 +82,12 @@ enum {
>  };
>
>  #define SIFIVE_E_PLIC_HART_CONFIG "M"
> -#define SIFIVE_E_PLIC_NUM_SOURCES 127
> +/*
> + * Freedom E310 G002 and G003 supports 52 interrupt sources while
> + * Freedom E310 G000 supports 51 interrupt sources. We use the value
> + * of G002 and G003, so it is 53 (including interrupt source 0).
> + */
> +#define SIFIVE_E_PLIC_NUM_SOURCES 53
>  #define SIFIVE_E_PLIC_NUM_PRIORITIES 7
>  #define SIFIVE_E_PLIC_PRIORITY_BASE 0x04
>  #define SIFIVE_E_PLIC_PENDING_BASE 0x1000
> --
> 2.34.1
>
>

