Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nqm9f-00021F-16
	for mharc-qemu-riscv@gnu.org; Mon, 16 May 2022 21:37:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nqm9d-000213-RR; Mon, 16 May 2022 21:37:41 -0400
Received: from mail-io1-xd33.google.com ([2607:f8b0:4864:20::d33]:33591)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nqm9c-0002q5-59; Mon, 16 May 2022 21:37:41 -0400
Received: by mail-io1-xd33.google.com with SMTP id q203so2065663iod.0;
 Mon, 16 May 2022 18:37:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8TB8Hj0hGAdAqKA3z5QShRoLyv4zVK8nKauleqioUAY=;
 b=iDsPtYNwhfVOHWUQuJ1n7D/QR+hdM3++Z5Zk7A66wVPgeEnqyfT7R4YPfZhCU33zoL
 sUtmg2L3OFtIbuvx1Abs432j6MiNMIKKcRijwsmC1MYaJrHXigbHZ3orcVSPOBcXN4ON
 OQx1DY0fG6rSxj9oRGYSB5KXW8luF3VsNUPz+MQnxFx8/XgB40L2q2Ybp/SeXNRC4AGk
 W17kOTzJgF4F7gmJRE4IpJqUIAVrE2r3kq0kNsOz+w7Bs6WfMPhVUORNIxkj9u/6KYFh
 a8ooqhtqsdN2seMlYI0bM3GSnQHFMsRe/g8fO44S7E43nXnkXsAgGG1iIu+IR7eTE0hR
 +fNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8TB8Hj0hGAdAqKA3z5QShRoLyv4zVK8nKauleqioUAY=;
 b=gfnokMOIRnV0Kal0WIv3kWn/7l7H1m8s+C4l8pJDRiPxsBiu/7G0xDmG5Z/CxlR4sZ
 vJUgonRVJwfKx7Ra+8RGWXjdLATLCL/301Tz0LH9NchLmBg2FtGJQ57rKwbJphOqW4TL
 jhPe+xnTJYtGmwGza9CZEJv77EmFomGp4yxFQW4173G1g8BLvOJH66if4G43nYgVyzWe
 pNraf1KLXYL3SMfry1TAbfjr4niEcQoTtnhMr1aXM/25UDNOCOb1phAglwJ1qpb5REGE
 +NBNchTMTE7Y8J+cPJRb6qKJGq0ktCqQCsCfxAlqEbS/am2zzRq4NrSp2iuIuylwMmgG
 JJ7A==
X-Gm-Message-State: AOAM533hDvnQwe6SjjsHEVMwf8ZO2sUnTtbEcR7NTNboyRA3lCknicM8
 bpkpbmkHyjldZtXkqT3EDY60V96QSFzvBw5xha0=
X-Google-Smtp-Source: ABdhPJwlfsBuvRmGVSl+HqxUyNvMpl++TfYHTFYTa2R37UkpxjU4WX02nZ7KGkX/nuQdVKVu1qc/8y1VYJuIIFhSkuw=
X-Received: by 2002:a05:6638:dc7:b0:32b:a483:16b8 with SMTP id
 m7-20020a0566380dc700b0032ba48316b8mr10748976jaj.66.1652751458290; Mon, 16
 May 2022 18:37:38 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1652435138.git.research_trasio@irq.a4lg.com>
 <cover.1652583332.git.research_trasio@irq.a4lg.com>
 <c3145fa37a529484cf3047c8cb9841e9effad4b0.1652583332.git.research_trasio@irq.a4lg.com>
In-Reply-To: <c3145fa37a529484cf3047c8cb9841e9effad4b0.1652583332.git.research_trasio@irq.a4lg.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 17 May 2022 11:37:11 +1000
Message-ID: <CAKmqyKPTNJv14TV-wBgF9sRepqwCWDHOFG2yiPYZ6BMvbHhguA@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] target/riscv: Move/refactor ISA extension checks
To: Tsukasa OI <research_trasio@irq.a4lg.com>
Cc: Frank Chang <frank.chang@sifive.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d33;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd33.google.com
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
X-List-Received-Date: Tue, 17 May 2022 01:37:42 -0000

On Sun, May 15, 2022 at 12:56 PM Tsukasa OI
<research_trasio@irq.a4lg.com> wrote:
>
> We should separate "check" and "configure" steps as possible.
> This commit separates both steps except vector/Zfinx-related checks.
>
> Signed-off-by: Tsukasa OI <research_trasio@irq.a4lg.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c | 31 ++++++++++++++++---------------
>  1 file changed, 16 insertions(+), 15 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index f910a41407..5ab246bf63 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -630,14 +630,27 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
>              return;
>          }
>
> +        if ((cpu->cfg.ext_zve32f || cpu->cfg.ext_zve64f) && !cpu->cfg.ext_f) {
> +            error_setg(errp, "Zve32f/Zve64f extensions require F extension");
> +            return;
> +        }
> +
> +        /* Set the ISA extensions, checks should have happened above */
>          if (cpu->cfg.ext_zdinx || cpu->cfg.ext_zhinx ||
>              cpu->cfg.ext_zhinxmin) {
>              cpu->cfg.ext_zfinx = true;
>          }
>
> -        if (cpu->cfg.ext_zfinx && !cpu->cfg.ext_icsr) {
> -            error_setg(errp, "Zfinx extension requires Zicsr");
> -            return;
> +        if (cpu->cfg.ext_zfinx) {
> +            if (!cpu->cfg.ext_icsr) {
> +                error_setg(errp, "Zfinx extension requires Zicsr");
> +                return;
> +            }
> +            if (cpu->cfg.ext_f) {
> +                error_setg(errp,
> +                    "Zfinx cannot be supported together with F extension");
> +                return;
> +            }
>          }
>
>          if (cpu->cfg.ext_zk) {
> @@ -663,7 +676,6 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
>              cpu->cfg.ext_zksh = true;
>          }
>
> -        /* Set the ISA extensions, checks should have happened above */
>          if (cpu->cfg.ext_i) {
>              ext |= RVI;
>          }
> @@ -734,20 +746,9 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
>              }
>              set_vext_version(env, vext_version);
>          }
> -        if ((cpu->cfg.ext_zve32f || cpu->cfg.ext_zve64f) && !cpu->cfg.ext_f) {
> -            error_setg(errp, "Zve32f/Zve64f extension depends upon RVF.");
> -            return;
> -        }
>          if (cpu->cfg.ext_j) {
>              ext |= RVJ;
>          }
> -        if (cpu->cfg.ext_zfinx && ((ext & (RVF | RVD)) || cpu->cfg.ext_zfh ||
> -                                   cpu->cfg.ext_zfhmin)) {
> -            error_setg(errp,
> -                    "'Zfinx' cannot be supported together with 'F', 'D', 'Zfh',"
> -                    " 'Zfhmin'");
> -            return;
> -        }
>
>          set_misa(env, env->misa_mxl, ext);
>      }
> --
> 2.34.1
>

