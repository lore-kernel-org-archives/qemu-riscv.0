Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oLtsN-0003Wx-4I
	for mharc-qemu-riscv@gnu.org; Wed, 10 Aug 2022 18:08:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oLtsK-0003Ur-RY; Wed, 10 Aug 2022 18:08:29 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:38785)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oLtsI-0004Ou-Lv; Wed, 10 Aug 2022 18:08:28 -0400
Received: by mail-pl1-x62c.google.com with SMTP id o3so15434012ple.5;
 Wed, 10 Aug 2022 15:08:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=k/2YRcOxoi7I5nTaW7eja2OJWCdB8DcDvqCblDu3WJU=;
 b=LQKHhC9QGYQGIl3fxItvOadxgPkyR5cTG1S8e7lL8GMRzLC78TrGS3naIOqsZ/nJHk
 b8deJg82N3wr7YP+h9st1Dhri6xhyGwvXvckyDoeAHL+vGKYlSkG/t+5bGXh5xrZjj+1
 HMT4Yhu3x9PJF08D92D4eZqCCTfDgSxPdFMH9Eu7yTRUU/zA/pec9Hyl+m7Bown6cV/3
 MNIejkMJFXXEYTHNSAjs9c4BwSfGGXpL7CdxUOwGcKM/g0rByZZFiYrEy/FqHL6/diL/
 GXwHspkJ6PMUBmlHdSIMWzjYpiG5CiRFrUKlNpuPVazgECDg+M/Q3kFzKao+M6g+DkGx
 V6ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=k/2YRcOxoi7I5nTaW7eja2OJWCdB8DcDvqCblDu3WJU=;
 b=LDydIEIkDfXhv6crYdX9lYJABjB6rJpvZleRAE1AYTmxEDHuacYBNTH5XIB/Ak+4Xh
 qFrKyjRVnp1/rEfrzO1bVeiIPCvwIae1NAhN4miXDbHXWrn8qph92iS5r4MGTBzLFpi9
 pdXEdlKg1bAy0zO4GVWqAX0E3gCmqdnMFR7I3b81agjzI9w0mi0B7ZOdSSonYKquPR9Z
 m+IIBsKd/zJjZ1s5L+B/9tDnlgHXNvZAvrlxbcmpy3MtdXur6TZuHajgiEfqOA5nHtV2
 Duwm6JXvj7LiaRRJqUI8R9/UzGGSII+TBTM4j9X6rPeCY1XVIagTRX8Uqy9aqDNt/TLE
 j2MA==
X-Gm-Message-State: ACgBeo0UfjydbQ4dpfsUQwDLGnYiL6rHa55Pc1g/P1DWDEG4yFpgAp02
 WnoIM1GM1nVNTkhyM3TI3knjvAXn0+NB+0rn9rY=
X-Google-Smtp-Source: AA6agR56XLUR2WL5tfZj38dFuTVI43m6NOFt2TKLqPq6pz5pmWOTQg9e40NW2v5BlWzPcKvUXe2Lo5yO0aQaLKWMhvI=
X-Received: by 2002:a17:90b:3b49:b0:1f4:df09:d671 with SMTP id
 ot9-20020a17090b3b4900b001f4df09d671mr5682711pjb.129.1660169304503; Wed, 10
 Aug 2022 15:08:24 -0700 (PDT)
MIME-Version: 1.0
References: <20220809185639.750345-1-qemu@ben.fluff.org>
 <20220809185639.750345-6-qemu@ben.fluff.org>
In-Reply-To: <20220809185639.750345-6-qemu@ben.fluff.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 11 Aug 2022 08:07:58 +1000
Message-ID: <CAKmqyKMzNmNzPCngGEvrkq_oewipRo9KvAax=+n=nT4wXJswUA@mail.gmail.com>
Subject: Re: [PATCH v4 5/6] hw/mips: use qemu_fdt_setprop_strings()
To: Ben Dooks <qemu@ben.fluff.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=alistair23@gmail.com; helo=mail-pl1-x62c.google.com
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
X-List-Received-Date: Wed, 10 Aug 2022 22:08:30 -0000

On Wed, Aug 10, 2022 at 4:58 AM Ben Dooks <qemu@ben.fluff.org> wrote:
>
> Change to using qemu_fdt_setprop_strings() helper in hw/mips.
>
> Signed-off-by: Ben Dooks <qemu@ben.fluff.org>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/mips/boston.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
>
> diff --git a/hw/mips/boston.c b/hw/mips/boston.c
> index d2ab9da1a0..759f6daafe 100644
> --- a/hw/mips/boston.c
> +++ b/hw/mips/boston.c
> @@ -515,9 +515,6 @@ static const void *create_fdt(BostonState *s,
>      MachineState *mc = s->mach;
>      uint32_t platreg_ph, gic_ph, clk_ph;
>      char *name, *gic_name, *platreg_name, *stdout_name;
> -    static const char * const syscon_compat[2] = {
> -        "img,boston-platform-regs", "syscon"
> -    };
>
>      fdt = create_device_tree(dt_size);
>      if (!fdt) {
> @@ -608,9 +605,8 @@ static const void *create_fdt(BostonState *s,
>      platreg_name = g_strdup_printf("/soc/system-controller@%" HWADDR_PRIx,
>                                     memmap[BOSTON_PLATREG].base);
>      qemu_fdt_add_subnode(fdt, platreg_name);
> -    qemu_fdt_setprop_string_array(fdt, platreg_name, "compatible",
> -                                 (char **)&syscon_compat,
> -                                 ARRAY_SIZE(syscon_compat));
> +    qemu_fdt_setprop_strings(fdt, platreg_name, "compatible",
> +                             "img,boston-platform-regs", "syscon");
>      qemu_fdt_setprop_cells(fdt, platreg_name, "reg",
>                             memmap[BOSTON_PLATREG].base,
>                             memmap[BOSTON_PLATREG].size);
> --
> 2.35.1
>
>

