Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mo35s-0003fl-CA
	for mharc-qemu-riscv@gnu.org; Fri, 19 Nov 2021 07:34:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mo35r-0003cM-4J; Fri, 19 Nov 2021 07:34:15 -0500
Received: from [2607:f8b0:4864:20::134] (port=38544
 helo=mail-il1-x134.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mo35o-0002HK-4o; Fri, 19 Nov 2021 07:34:14 -0500
Received: by mail-il1-x134.google.com with SMTP id j21so4508133ila.5;
 Fri, 19 Nov 2021 04:34:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=e9HQIZ5tw2eucYU0ROWkDDcQl7cKhahjAwNpjWACvNg=;
 b=fwP6zNZYaN4hV8rzA+mnufiBhoutt1bxOlIIhGVCerL44Htrwh1rfqsGCEr/fOT3Ka
 fY6y1tLccgyTeFOVb0ixJWNjR0lRw1IEQ5wRh64sK1cR4smkCZfHd2vEudHYJaQG48Cc
 TnrMxVJvM+yrTSvGzRnfjqRk58FFVIc1RgBYUe7/mn5Z+52FwLBgjhc6oCIJBiZ4sWaa
 rXZJ+kUtdUhSSpymqQVE9X91wZG26ThW6z3q39K4SSqpkKYr+Zts9MXyYcv9FXkwvX1c
 EwPWDTY10L4uiKhod/YPWERvI0iZYJIWqGU3bnOkffvNCuvsXjfivzaSlNAMafrvw2VZ
 DY4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=e9HQIZ5tw2eucYU0ROWkDDcQl7cKhahjAwNpjWACvNg=;
 b=SucA9PTiZVBAKXs8lclT8GYWY6uTPpLyerSJo3rGh/UcYhv1WcIu5oOyhaX4T3NqCP
 JLAxeQvZ9dPzLSQrka/mvMvcANgK2nV8lCGzOYG1qMiWK3nTUhtjHfUCu8nGOSnY68cF
 v9nkt8ZkGdW2rO2hys47K64cXFhQ+WF1d/oM437rONllTUP1UglItJ7HZ/nBC/zvkbhp
 3LsYOqAbLjccVeVy+pWURI9TUhPt0dw+q1kQEQfAidlB9ayChHovRZe+R0EqSzmUHDr/
 b12E/N6xqPRGGZ0d+DTYB9mMh40YQgdDH8v4DFeH1VwhqhJ1A4o4T7kPrJ3UdUyYoIHD
 /6hg==
X-Gm-Message-State: AOAM530ek1DNWQFQ+af2KrP0p72nGrrvHPGwZ5ELsi6jDB15M7DvEpEU
 5c0aJMbbMZZES2g/L/jgo89WYVOM9om+/IahsXo=
X-Google-Smtp-Source: ABdhPJwTzdCPGYO+696qCQIkA8ucU7iwsB9OxpGIUEvWkLbM7nXIgVDIbXTqZGwdFUTAwVc4IW2SV4pSlrgzf3do9yE=
X-Received: by 2002:a05:6e02:1bec:: with SMTP id
 y12mr4200825ilv.74.1637325250790; 
 Fri, 19 Nov 2021 04:34:10 -0800 (PST)
MIME-Version: 1.0
References: <20211111155149.58172-1-zhiwei_liu@c-sky.com>
 <20211111155149.58172-16-zhiwei_liu@c-sky.com>
In-Reply-To: <20211111155149.58172-16-zhiwei_liu@c-sky.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 19 Nov 2021 22:33:44 +1000
Message-ID: <CAKmqyKNkJ9WONjBfhb-PNbovvtbRQ3PBm1nUzfFrhWOo8DXXLw@mail.gmail.com>
Subject: Re: [PATCH v4 15/20] target/riscv: Remove VILL field in VTYPE
To: LIU Zhiwei <zhiwei_liu@c-sky.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Bin Meng <bin.meng@windriver.com>, Alistair Francis <Alistair.Francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::134
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::134;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x134.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Fri, 19 Nov 2021 12:34:15 -0000

On Fri, Nov 12, 2021 at 2:09 AM LIU Zhiwei <zhiwei_liu@c-sky.com> wrote:
>
> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
> Acked-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.h | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index b48c7c346c..5f35217f7d 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -106,7 +106,6 @@ FIELD(VTYPE, VLMUL, 0, 2)
>  FIELD(VTYPE, VSEW, 2, 3)
>  FIELD(VTYPE, VEDIV, 5, 2)
>  FIELD(VTYPE, RESERVED, 7, sizeof(target_ulong) * 8 - 8)
> -FIELD(VTYPE, VILL, sizeof(target_ulong) * 8 - 1, 1)
>
>  struct CPURISCVState {
>      target_ulong gpr[32];
> --
> 2.25.1
>
>

