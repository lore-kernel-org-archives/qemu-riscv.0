Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pm8mb-0005EW-Cc
	for mharc-qemu-riscv@gnu.org; Tue, 11 Apr 2023 03:51:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pm8mZ-0005EC-OP; Tue, 11 Apr 2023 03:51:15 -0400
Received: from mail-vs1-xe2b.google.com ([2607:f8b0:4864:20::e2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pm8mY-0007nC-8m; Tue, 11 Apr 2023 03:51:15 -0400
Received: by mail-vs1-xe2b.google.com with SMTP id b17so6693929vsj.7;
 Tue, 11 Apr 2023 00:51:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1681199472; x=1683791472;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jIqnHpgULzJwTs7LwwMAfyeJsHIWn/by5wY/tN7YpOg=;
 b=ba9W/AT4hwBy6FaWW9Y6B9KqjaSRzlf9j2D80YdWaw/j1JOgzYobN6di/s6QBhpT/g
 ZOHcLTwxUng/XdI7RxdAwCRZLdFDgzboQ7zzlPCP10RkZSDrLiI8vZWLkaOKyf/cOTuL
 pvx3aACh++DkIuQwNwQJQNUZnWNz/U7cp73yW8ll298JcJPg9BOTuLJvL9yj4yK4r97v
 IfFvtWFOHpbpiE4bnvcIuOZVb55bB8yBq7qcuQ+wiPOsVsTzIUrz/TfffI1kVm+QOn8c
 6xAfA4tDYbuJ/rV6Ts+nPe49qkNBBcbXdRUHf93UGvVSwWqteIh7WNECJMJPOOhMSDZ2
 YRKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681199472; x=1683791472;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jIqnHpgULzJwTs7LwwMAfyeJsHIWn/by5wY/tN7YpOg=;
 b=WJR6CpiTAQYYqqW8Ay7PTAZbXEnKUOxcobHgiVu6eEDT7j//uNv7tyygnVk2TLcYL1
 QmAhnwqewceD3XYGHCaDvEZBzZTZmTOh0RAfnb5P4ZpI44vSBR6fQmUskgOQB7MmxPxD
 SQcjFiLElcCj9WAEC0KXAtaUhvkVWb2n/p92S88PZZuE/N+J01yb9xisCX7HMVUk3jus
 WZMleHnnqt7/qG5FH0TPQsDljfZq1yKOmcQhnzOMlrI3MLjrOWdY2lKv9miBOAIpsUD+
 Gx6DDGVRwUkUkkBLJqY7jGmH9EY6d4Dqyc8f7ZkwuSpxl2Y/d1eljEv7fJpvPyZBIeRe
 3ekA==
X-Gm-Message-State: AAQBX9e/O2LqHOU8D1emSpDknT0R3tTR8lqhJAjvZOu91UxSkghYE7bX
 Xms6802hxLKVpbVXnuBJ9oih9o0sgZmnWfl5qVs=
X-Google-Smtp-Source: AKy350bjcu8z4ly6jBQJh3hXhC8gpsh4sCc53fUxRovGAot465BkW6gRH4nFwMAJDHlTeSiOlh1scfivSge120m1xm4=
X-Received: by 2002:a67:ca06:0:b0:422:1654:7737 with SMTP id
 z6-20020a67ca06000000b0042216547737mr1323083vsk.3.1681199472322; Tue, 11 Apr
 2023 00:51:12 -0700 (PDT)
MIME-Version: 1.0
References: <20230408135908.25269-1-liweiwei@iscas.ac.cn>
In-Reply-To: <20230408135908.25269-1-liweiwei@iscas.ac.cn>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 11 Apr 2023 17:50:46 +1000
Message-ID: <CAKmqyKNy8VWeivKmc8ky3q4Obz4YjzUotHgyg8vZ_wgDRX9ftw@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: Use check for relationship between
 Zdinx/Zhinx{min} and Zfinx
To: Weiwei Li <liweiwei@iscas.ac.cn>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, palmer@dabbelt.com, 
 alistair.francis@wdc.com, bin.meng@windriver.com, dbarboza@ventanamicro.com, 
 zhiwei_liu@linux.alibaba.com, wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2b;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe2b.google.com
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
X-List-Received-Date: Tue, 11 Apr 2023 07:51:16 -0000

On Sun, Apr 9, 2023 at 12:00=E2=80=AFAM Weiwei Li <liweiwei@iscas.ac.cn> wr=
ote:
>
> Zdinx/Zhinx{min} require Zfinx. And require relationship is usually done
> by check currently.
>
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>

Thanks!

Applied to riscv-to-apply.next

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

