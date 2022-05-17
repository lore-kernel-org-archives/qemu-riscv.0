Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nqlSG-0004Eu-09
	for mharc-qemu-riscv@gnu.org; Mon, 16 May 2022 20:52:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nqlSF-0004Eh-3A; Mon, 16 May 2022 20:52:51 -0400
Received: from mail-il1-x131.google.com ([2607:f8b0:4864:20::131]:35672)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nqlSD-0004Pc-FY; Mon, 16 May 2022 20:52:50 -0400
Received: by mail-il1-x131.google.com with SMTP id 3so11672625ily.2;
 Mon, 16 May 2022 17:52:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oWv2XitJrQYgMdXdm2OJMC4PQ5iC2Kmnl8XZiIRYvgM=;
 b=i6csR9HRru6yjcJS8Xx9FSStPPLgeVqp0uoWkcNHGMbuJKp0cmGwLDTAOyfVyC9B1B
 +yPFftNB9tM1jfNi04BlLJvoKo29wNoxn2H8ddYYwylg0Oe1H0Ouu0G/wK9mrZ3ne+B4
 Y5EFzSe/qQzyFsuxCH3v0+iyv7DIrwTH4Xl0JzkdHtJlgOcFIQMYf9ZiRM8u12hLO32V
 VJO7vQwD+TtqPlfngHWdfxbvxtcH9vkSODo2YkqYZYOukGwyz1s6uBrIwfw2VuZng0oo
 svtR1y95Ywyrk37UsS/1f8ngiK9aoEqVuROuFqwK9+hz1cTmC6+yfsbzk/CnQCS7LKSy
 33ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oWv2XitJrQYgMdXdm2OJMC4PQ5iC2Kmnl8XZiIRYvgM=;
 b=N6rGniVz3OvYHwOKsOsIYdmN4sY5jMIrC8aALStfZwUHnKPBYqLLXNK2+VwDQ63o34
 +97iqItZtn4ByERBhov2syqlE/A/cKLSvvVVOcOSFYh7xBk73F4caN9Hha6g4zvuSfjA
 z91pqV29/Hvt6SrloNSbl9br7AdYrznWyiZsAeC26/G4pj8BZafVGpbJ4qWYQQNLu3E2
 MUUcOk61egKAhfgJ0jfaCZCQHdFjZuXeVS7MGSTiET9QzhH/L9D/Npgb8JTGllVUdXUY
 Xy5B7sn1/4JSdjbWq5vhPhlFPt9rg2ZHS7jLvpT1z53MDg5B6IICveYXjxnF1Oq731C2
 OOAw==
X-Gm-Message-State: AOAM533Z/pfdUm3aqgsgc2NPBvxW/ukEyO9P9iKi7mkZBRTdCxnsUmnW
 3wsh4v5c1jAqUQKOWSl7+ZEVTMhXRLDbHXvKfjg=
X-Google-Smtp-Source: ABdhPJymYuOilXoBS+e5SVHjHf9xnmhYiB3iz2CxrTbjGSGWdY6xMKV+7YglnULzze0t80B8B1vjXzU0t5nvikIYwVs=
X-Received: by 2002:a05:6e02:1986:b0:2cf:908d:3d0a with SMTP id
 g6-20020a056e02198600b002cf908d3d0amr10509628ilf.113.1652748768036; Mon, 16
 May 2022 17:52:48 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1652435138.git.research_trasio@irq.a4lg.com>
 <cover.1652583332.git.research_trasio@irq.a4lg.com>
 <00e7b1c6060dab32ac7d49813b1ca84d3eb63298.1652583332.git.research_trasio@irq.a4lg.com>
In-Reply-To: <00e7b1c6060dab32ac7d49813b1ca84d3eb63298.1652583332.git.research_trasio@irq.a4lg.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 17 May 2022 10:52:21 +1000
Message-ID: <CAKmqyKPUZ5gH=XSJ_C=7uU8DnNgo31qor_sn5x15c9ZBrF-2zw@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] target/riscv: FP extension requirements
To: Tsukasa OI <research_trasio@irq.a4lg.com>
Cc: Frank Chang <frank.chang@sifive.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::131;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x131.google.com
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
X-List-Received-Date: Tue, 17 May 2022 00:52:51 -0000

On Sun, May 15, 2022 at 12:56 PM Tsukasa OI
<research_trasio@irq.a4lg.com> wrote:
>
> QEMU allowed inconsistent configurations that made floating point
> arithmetic effectively unusable.
>
> This commit adds certain checks for consistent FP arithmetic:
>
> -   F requires Zicsr
> -   Zfinx requires Zicsr
> -   Zfh/Zfhmin require F
> -   D requires F
> -   V requires D
>
> Because F/D/Zicsr are enabled by default (and an error will not occur unless
> we manually disable one or more of prerequisites), this commit just enforces
> the user to give consistent combinations.
>
> Signed-off-by: Tsukasa OI <research_trasio@irq.a4lg.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 0854ca9103..f910a41407 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -610,11 +610,36 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
>              cpu->cfg.ext_ifencei = true;
>          }
>
> +        if (cpu->cfg.ext_f && !cpu->cfg.ext_icsr) {
> +            error_setg(errp, "F extension requires Zicsr");
> +            return;
> +        }
> +
> +        if ((cpu->cfg.ext_zfh || cpu->cfg.ext_zfhmin) && !cpu->cfg.ext_f) {
> +            error_setg(errp, "Zfh/Zfhmin extensions require F extension");
> +            return;
> +        }
> +
> +        if (cpu->cfg.ext_d && !cpu->cfg.ext_f) {
> +            error_setg(errp, "D extension requires F extension");
> +            return;
> +        }
> +
> +        if (cpu->cfg.ext_v && !cpu->cfg.ext_d) {
> +            error_setg(errp, "V extension requires D extension");
> +            return;
> +        }
> +
>          if (cpu->cfg.ext_zdinx || cpu->cfg.ext_zhinx ||
>              cpu->cfg.ext_zhinxmin) {
>              cpu->cfg.ext_zfinx = true;
>          }
>
> +        if (cpu->cfg.ext_zfinx && !cpu->cfg.ext_icsr) {
> +            error_setg(errp, "Zfinx extension requires Zicsr");
> +            return;
> +        }
> +
>          if (cpu->cfg.ext_zk) {
>              cpu->cfg.ext_zkn = true;
>              cpu->cfg.ext_zkr = true;
> --
> 2.34.1
>

