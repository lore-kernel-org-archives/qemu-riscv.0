Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oB8aQ-0004ui-4c
	for mharc-qemu-riscv@gnu.org; Tue, 12 Jul 2022 01:37:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oB8aP-0004uV-8f; Tue, 12 Jul 2022 01:37:29 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:35559)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oB8aN-0006r6-KC; Tue, 12 Jul 2022 01:37:28 -0400
Received: by mail-pf1-x432.google.com with SMTP id x184so6597376pfx.2;
 Mon, 11 Jul 2022 22:37:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=u3dRUI5Uc3csoy0U0HXbJw6qLQeCyDml2Iwd14WYkiw=;
 b=f4i9zNj59Pa+vTc+tql0gJyVsV89YWjddTN6qCANCrfef+zvBHXno9nTkrBK1UQVOz
 dhpyjoGAUI9uRsBqH3mvQ7npkYUhPWT7iYhaijccxwWyvVjXfSsInc8F8GsEHfgURV1C
 HHn7pB53UezdAZojr4gheFrdBlx8bM3WcMDK420+vRUOBLAmyJwS8Overz/YBUMoIonh
 KdR1szWHMP+ZgrMl1qgdD9JOXgRTmcoO1bzGNG8jd0eyZR6yS73z7GISB+BJOBIVVcGl
 k0EbqRsddowRBZsu51NH/VQAx+DucXv5jbaxs34rk6AuXRrxy8jNyAXGGiWbtX6Pkqai
 75Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=u3dRUI5Uc3csoy0U0HXbJw6qLQeCyDml2Iwd14WYkiw=;
 b=DGz76H4af6qO8l3iwZdCX8oAKvAEG3RYOnQa8biYoAqhIMofODfPE8HI5fr04jSg+q
 22KDEnHjAfsP5C1VmNoRkPEpn+Ia5VzGTRr+2t1hfqTJf8EGS/pwMapICNk7XyxzpYV3
 9PgepnFAF3f/Nmq9AYDWTTdXK1GRAyD0B/qWfxeXDiW76jhjlsqC3EbNWd/gYMcpeQhF
 FyFGeOt2G+aiz1JEzAXWeh29VZSr2CE5ZYJtH0RIx2N0KVhAUadbird+MBO2nQM4vZqK
 QbpNjOAufOl1nHtCRUMw5d8QbEqRtAmHQSIdKSepR9KdMWLi0791yZsd87Sc5WeTHIR4
 IrtA==
X-Gm-Message-State: AJIora/q9gzHsOV0KOU01JDu3LTxOcRaP653vkVzfyrwFxWWBDSi1MPJ
 W6EU33sY/MCRLAJAIavvY49IMNo3NxwkEBg67Ko=
X-Google-Smtp-Source: AGRyM1u84bOkMvDqMZ+iSp7QMdtrdEep6VOFHD39i0lpnbLPbkHkiujRsf8rbG240oP4+f5M3cDwbuQCnBQpwB2xP6c=
X-Received: by 2002:a63:1c4c:0:b0:412:6eef:f91a with SMTP id
 c12-20020a631c4c000000b004126eeff91amr18807635pgm.361.1657604245787; Mon, 11
 Jul 2022 22:37:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220710101546.3907-1-liweiwei@iscas.ac.cn>
In-Reply-To: <20220710101546.3907-1-liweiwei@iscas.ac.cn>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 12 Jul 2022 15:36:59 +1000
Message-ID: <CAKmqyKNe8_2S70McaZRY2y+BUSqXVn+AB8GYq8WmsLRbznBVTw@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: move zmmul out of the experimental
 properties
To: Weiwei Li <liweiwei@iscas.ac.cn>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 wangjunqiang <wangjunqiang@iscas.ac.cn>, 
 =?UTF-8?B?V2VpIFd1ICjlkLTkvJ8p?= <lazyparser@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=alistair23@gmail.com; helo=mail-pf1-x432.google.com
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
X-List-Received-Date: Tue, 12 Jul 2022 05:37:29 -0000

On Sun, Jul 10, 2022 at 8:16 PM Weiwei Li <liweiwei@iscas.ac.cn> wrote:
>
> - Zmmul is ratified and is now version 1.0
>
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>

Thanks!

Applied to riscv-to-apply.next

Alistair

> ---
>  target/riscv/cpu.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 1bb3973806..6301871fdf 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -924,12 +924,13 @@ static Property riscv_cpu_extensions[] = {
>      DEFINE_PROP_BOOL("zhinx", RISCVCPU, cfg.ext_zhinx, false),
>      DEFINE_PROP_BOOL("zhinxmin", RISCVCPU, cfg.ext_zhinxmin, false),
>
> +    DEFINE_PROP_BOOL("zmmul", RISCVCPU, cfg.ext_zmmul, false),
> +
>      /* Vendor-specific custom extensions */
>      DEFINE_PROP_BOOL("xventanacondops", RISCVCPU, cfg.ext_XVentanaCondOps, false),
>
>      /* These are experimental so mark with 'x-' */
>      DEFINE_PROP_BOOL("x-j", RISCVCPU, cfg.ext_j, false),
> -    DEFINE_PROP_BOOL("x-zmmul", RISCVCPU, cfg.ext_zmmul, false),
>      /* ePMP 0.9.3 */
>      DEFINE_PROP_BOOL("x-epmp", RISCVCPU, cfg.epmp, false),
>      DEFINE_PROP_BOOL("x-aia", RISCVCPU, cfg.aia, false),
> --
> 2.17.1
>
>

