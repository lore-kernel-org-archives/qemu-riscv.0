Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pm6mV-0002RM-Ep
	for mharc-qemu-riscv@gnu.org; Tue, 11 Apr 2023 01:43:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pm6mI-0002QX-PY; Tue, 11 Apr 2023 01:42:51 -0400
Received: from mail-ua1-x92f.google.com ([2607:f8b0:4864:20::92f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pm6mH-0000nV-6t; Tue, 11 Apr 2023 01:42:50 -0400
Received: by mail-ua1-x92f.google.com with SMTP id bh10so6167183uab.13;
 Mon, 10 Apr 2023 22:42:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1681191767; x=1683783767;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7TyaYOH7aMB44BJbABbbWxOylU+gGDQEbXCz4pSktxc=;
 b=R0ydtgRWyjvjw3UUOBho+Bv/wyqT0vatkFU1iq6bN/1xH9FCOnVj5IztCHBqBwdL6y
 TclF09Z3ADAUHrl2cdeUURhXtmdQNkDzi2g6sSvX2+IJw6JjqlQ2n8lZrCtthXommB5M
 wmYzsllMfGLz502p6s9pDSdFElmI/hfIVdAIdLiU42W6gWpRUN3a5q1xl/8aIPXMzdmu
 48rlhWCR8olCZCaXSl1gIclQFH9N9WM8+LsmtH1LEL2H/XsosEWo9dVojg8VsZOKFdyJ
 pCQ16FMTmrVNAfniYppfyl30Xf7k3+xrYKGpGzdKAAUaRQe/FjoBO+PHzMaKS4vJT18l
 xSFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681191767; x=1683783767;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7TyaYOH7aMB44BJbABbbWxOylU+gGDQEbXCz4pSktxc=;
 b=ijqo4DfUR6y3DxhjaI1J13pSj1N+rrUu6E2p8l68Hq31JTSKVu37NK7x+XzN2xnZAH
 rVEM9qpG0dGa1BiX5MY0qTuxVhPP7JzQkLSXwwk+aApDqukaWLAOAVW8i8vt+zHl/z9S
 f10AcQhg3tYH3I3+Fh7KS5vW7wy6i6kTzuv3Az+8SRPXM8peyHrNy8N+ZCP0QlVPNWMg
 TCMCuLlqUBrIFbYZudGWg/KTUkCsNQ3GyyoqEsvHjndCDI/2XFCUkUUdkDzuZpAKLl5n
 5F2ybRVkh1P1L8cpT4b1kbDOb+Oe74p0fFWuQL2SZSMK9WYQTfZ6GqfS7H0w+vK1B/+b
 7oRg==
X-Gm-Message-State: AAQBX9dmZQQkRRWtbffm1RgOUTqXfAxHzSmaSKobGP9vC3k52+I2jV4v
 Crulm22IFS/mnaSrojd87uYrLPSmQZpGByNzJ14=
X-Google-Smtp-Source: AKy350akpk4/fKqOx8XrYHj8rpXsV3r9GRpYW2CcMeg964Mhk/PXdvII1jflCI1ZqGkB4+JxdXCBXumOrChwqce5KyE=
X-Received: by 2002:ab0:6cec:0:b0:764:64c1:9142 with SMTP id
 l12-20020ab06cec000000b0076464c19142mr7174405uai.0.1681191766957; Mon, 10 Apr
 2023 22:42:46 -0700 (PDT)
MIME-Version: 1.0
References: <20230408135908.25269-1-liweiwei@iscas.ac.cn>
In-Reply-To: <20230408135908.25269-1-liweiwei@iscas.ac.cn>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 11 Apr 2023 15:42:20 +1000
Message-ID: <CAKmqyKMWin85jX=r3QOcVMnqwqt3E8dSTfAjVXt9mwPLPHhhrw@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: Use check for relationship between
 Zdinx/Zhinx{min} and Zfinx
To: Weiwei Li <liweiwei@iscas.ac.cn>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, palmer@dabbelt.com, 
 alistair.francis@wdc.com, bin.meng@windriver.com, dbarboza@ventanamicro.com, 
 zhiwei_liu@linux.alibaba.com, wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::92f;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x92f.google.com
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
X-List-Received-Date: Tue, 11 Apr 2023 05:42:51 -0000

On Sun, Apr 9, 2023 at 12:00=E2=80=AFAM Weiwei Li <liweiwei@iscas.ac.cn> wr=
ote:
>
> Zdinx/Zhinx{min} require Zfinx. And require relationship is usually done
> by check currently.
>
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 1a5099382c..35bee8ff42 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -930,8 +930,9 @@ static void riscv_cpu_validate_set_extensions(RISCVCP=
U *cpu, Error **errp)
>          cpu->cfg.ext_zhinxmin =3D true;
>      }
>
> -    if (cpu->cfg.ext_zdinx || cpu->cfg.ext_zhinxmin) {
> -        cpu->cfg.ext_zfinx =3D true;
> +    if ((cpu->cfg.ext_zdinx || cpu->cfg.ext_zhinxmin) && !cpu->cfg.ext_z=
finx) {
> +        error_setg(errp, "Zdinx/Zhinx/Zhinxmin extensions require Zfinx"=
);
> +        return;
>      }
>
>      if (cpu->cfg.ext_zfinx) {
> --
> 2.25.1
>
>

