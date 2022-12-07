Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p2lwb-0008Vo-7P
	for mharc-qemu-riscv@gnu.org; Tue, 06 Dec 2022 23:22:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1p2lwa-0008VM-0f; Tue, 06 Dec 2022 23:22:04 -0500
Received: from mail-vk1-xa33.google.com ([2607:f8b0:4864:20::a33])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1p2lwY-0006Zs-Ck; Tue, 06 Dec 2022 23:22:03 -0500
Received: by mail-vk1-xa33.google.com with SMTP id z23so3783350vkb.12;
 Tue, 06 Dec 2022 20:22:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=07XrxAiyg6L+9CUELaq+hl4+YueFnIJYVu+SNnXyZO8=;
 b=EsGZ4/1gsG214cXAUi0iTS1LPQ0uWCjjbhby1hHCskkKOWZHwJn3srX1u1qaSi2u+z
 IhOQXBZxFgU3uRe40EmvdTm/MFj9v4RNkVuaO+yeObJQhwqq7ETMx5Hw481I822Wgjpl
 4SVz6RW0ioPs8f6bSKgRIRCM5WKYzGT5575xzgJ6elfE+1IfopRaqsRaPt4tdOoiyrqq
 Pe9gQoChmShAPXoiT5Ub1b9ibU2LkYcQ/F499uPWkHUJfwlrvf0PzHusR2AJ2GPbmMqm
 KcnCdqD8ZqeBu5GOIcT5rrlTPjq9R8nvhxfldF3yWLikrCOexFwLYG3J/tz4g8yDHd1j
 QY6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=07XrxAiyg6L+9CUELaq+hl4+YueFnIJYVu+SNnXyZO8=;
 b=oVd+E1SHR82yL/AQU8n6ZAnKrsto/Yd5d8jzF7zyNVFMzLMr+yy023jRfE/tif585T
 0cm/qKL7LqjDdnYXbGP5v0wsutnKkCjWlbknw3Lgzhn3H1p0sgtPDbEruo7P8pV7ngEj
 TWdQRPY2m791oEHGBWHFEBcnJnrN65gDkHl5VMzocGe36HxPuxf98i40rfKN2I9ZsNQA
 bzztdUy37+2auWcKAftKXD9qdYFeJo7xz0SAATVAXL5s2JtoLHhUcBQa6bgwLmoUk0H8
 JfxFdh+yXgheNlExvpkcCknGVayU55z/dIFLd3xW3hOxpJaStCwph7s4+trkZGz8hWvF
 ijMg==
X-Gm-Message-State: ANoB5pm7wYbXBwzphfW5RIvs0Ein7nUuusCjPsXl0PYXH2AYzlps+anf
 i0WJwxmUWguAsLH2nJWQURhWEG4AggMVexM2ky8=
X-Google-Smtp-Source: AA0mqf5pgTrOWiYh7TgNKZw+lja0q1jh8JO9TjOanTwfgH7MjKUhBVqnYALNS5rhTqGGlkDO6O9dJueQ6zDkhHDMWpU=
X-Received: by 2002:a1f:3846:0:b0:3bc:c843:c7b5 with SMTP id
 f67-20020a1f3846000000b003bcc843c7b5mr26232152vka.30.1670386920654; Tue, 06
 Dec 2022 20:22:00 -0800 (PST)
MIME-Version: 1.0
References: <20221201140811.142123-1-bmeng@tinylab.org>
 <20221201140811.142123-7-bmeng@tinylab.org>
In-Reply-To: <20221201140811.142123-7-bmeng@tinylab.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 7 Dec 2022 14:21:34 +1000
Message-ID: <CAKmqyKOw4Vc_4adPamCte+zFG0QVG6=1tf0YmdsdkScCgL4U=g@mail.gmail.com>
Subject: Re: [PATCH 07/15] hw/intc: sifive_plic: Improve robustness of the
 PLIC config parser
To: Bin Meng <bmeng@tinylab.org>
Cc: Alistair Francis <Alistair.Francis@wdc.com>, qemu-devel@nongnu.org, 
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::a33;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa33.google.com
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
X-List-Received-Date: Wed, 07 Dec 2022 04:22:04 -0000

On Fri, Dec 2, 2022 at 12:15 AM Bin Meng <bmeng@tinylab.org> wrote:
>
> At present the PLIC config parser can only handle legal config string
> like "MS,MS". However if a config string like ",MS,MS,,MS,MS,," is
> given the parser won't get the correct configuration.
>
> This commit improves the config parser to make it more robust.
>
> Signed-off-by: Bin Meng <bmeng@tinylab.org>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>
>  hw/intc/sifive_plic.c | 24 ++++++++++++++++--------
>  1 file changed, 16 insertions(+), 8 deletions(-)
>
> diff --git a/hw/intc/sifive_plic.c b/hw/intc/sifive_plic.c
> index 3f6ffb1d70..5fd9a53569 100644
> --- a/hw/intc/sifive_plic.c
> +++ b/hw/intc/sifive_plic.c
> @@ -290,7 +290,7 @@ static void sifive_plic_reset(DeviceState *dev)
>   */
>  static void parse_hart_config(SiFivePLICState *plic)
>  {
> -    int addrid, hartid, modes;
> +    int addrid, hartid, modes, m;
>      const char *p;
>      char c;
>
> @@ -299,11 +299,13 @@ static void parse_hart_config(SiFivePLICState *plic)
>      p = plic->hart_config;
>      while ((c = *p++)) {
>          if (c == ',') {
> -            addrid += ctpop8(modes);
> -            modes = 0;
> -            hartid++;
> +            if (modes) {
> +                addrid += ctpop8(modes);
> +                hartid++;
> +                modes = 0;
> +            }
>          } else {
> -            int m = 1 << char_to_mode(c);
> +            m = 1 << char_to_mode(c);
>              if (modes == (modes | m)) {
>                  error_report("plic: duplicate mode '%c' in config: %s",
>                               c, plic->hart_config);
> @@ -314,8 +316,9 @@ static void parse_hart_config(SiFivePLICState *plic)
>      }
>      if (modes) {
>          addrid += ctpop8(modes);
> +        hartid++;
> +        modes = 0;
>      }
> -    hartid++;
>
>      plic->num_addrs = addrid;
>      plic->num_harts = hartid;
> @@ -326,11 +329,16 @@ static void parse_hart_config(SiFivePLICState *plic)
>      p = plic->hart_config;
>      while ((c = *p++)) {
>          if (c == ',') {
> -            hartid++;
> +            if (modes) {
> +                hartid++;
> +                modes = 0;
> +            }
>          } else {
> +            m = char_to_mode(c);
>              plic->addr_config[addrid].addrid = addrid;
>              plic->addr_config[addrid].hartid = hartid;
> -            plic->addr_config[addrid].mode = char_to_mode(c);
> +            plic->addr_config[addrid].mode = m;
> +            modes |= (1 << m);
>              addrid++;
>          }
>      }
> --
> 2.34.1
>
>

