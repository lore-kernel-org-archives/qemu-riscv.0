Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1paTuU-0000B1-BW
	for mharc-qemu-riscv@gnu.org; Thu, 09 Mar 2023 22:59:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1paTuS-0000Ab-Uk; Thu, 09 Mar 2023 22:59:13 -0500
Received: from mail-ua1-x92e.google.com ([2607:f8b0:4864:20::92e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1paTuR-0001ni-Do; Thu, 09 Mar 2023 22:59:12 -0500
Received: by mail-ua1-x92e.google.com with SMTP id x1so2678985uav.9;
 Thu, 09 Mar 2023 19:59:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678420750;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ce5Emz7Kx4FfBs4paLCODWnbHCptHGBkaFDAaQ79X+U=;
 b=JY5KRNdtUtB8D7cChNmlrBdqkDw5vxYQLf5iIGsF/o+dA2DddKF1F1UeBG782uYOR0
 U9UpEd67NQkSvX5Ztc1smQ+YK9m+A3fm2uD1fEYm8gqKSnhwu+6Ol6sPNsPAhcs2OD/F
 QvdZua3K9svDJipakxTqVlpWLfrVo8CSRXSL+8kQKQweXOmIM3OZdc4MdGWJ1WCpwYZI
 4cA5s4OZKoXOzHRgL1WrQyq/I2Eo6MmD+h4XmAXudl9AAm6EfNoZlGq+ztZ6qJuf4fHQ
 2anpbyRlV/oA/TwJ5aHKoMvmXTY3ZwEx/2XoR+FeIrNbO7MWK4SLbQGVddQm8v279Y/0
 5NrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678420750;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ce5Emz7Kx4FfBs4paLCODWnbHCptHGBkaFDAaQ79X+U=;
 b=tP05P9Ajh7nTw8BRa+DAi/QthVCtfhR69x4wb81/YsLDT6XIZwxZfoMvDvPytoLr6v
 CA1fIIuGkzIzBkEKFpG2Oyz2BPCPbwIpDlJjiHeOw3eYksI3+6tXdR//PcvIF2uJMS8P
 tqQRRv2gftu9VN/1bhDZo02jEW4JHojjsOyTXy0XQP/UCeOINQWBmpW+ixnMzsaz0ipc
 Sq9BEw7cP65rb6db+bJ7ycwowjA+epdpTQsM0MV/B+xAExzHN4UKmBFJwxkEXjJP+i89
 3PHkL/mcABkAQXi7keVXjFyIQbLx3H+QmVcAL3I1WO3AmI4KahE/xO72SiD4WlmhvSjR
 ljkg==
X-Gm-Message-State: AO0yUKVncvCYIjrceK1lWUbJgBBKWGl/TndTeiqPZ3/pdG3baJOUXq4Z
 VcqbxjAFpuXRU29mPD8DVu3Jq7rCHBJs+juPZ+o=
X-Google-Smtp-Source: AK7set/RZXdVIM9pNeI2sdgaS2qe86wzBaHYLKH/QtNRvnxuYcJCk0T4YfxCLK4PYELIes7coTwOBz1nLXVzk1MOTJM=
X-Received: by 2002:a1f:6d42:0:b0:401:b9fd:7053 with SMTP id
 i63-20020a1f6d42000000b00401b9fd7053mr15756642vkc.2.1678420749974; Thu, 09
 Mar 2023 19:59:09 -0800 (PST)
MIME-Version: 1.0
References: <20230305094231.1616-1-jim.shu@sifive.com>
 <20230305094231.1616-2-jim.shu@sifive.com>
In-Reply-To: <20230305094231.1616-2-jim.shu@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 10 Mar 2023 13:58:43 +1000
Message-ID: <CAKmqyKPm=EUrKn7DGobMG1ax1KtGv3Kf1fxAqDB961Mfa8Sb8w@mail.gmail.com>
Subject: Re: [PATCH 2/2] target/riscv: Make the "virt" register writable by GDB
To: Jim Shu <jim.shu@sifive.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::92e;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x92e.google.com
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
X-List-Received-Date: Fri, 10 Mar 2023 03:59:13 -0000

On Sun, Mar 5, 2023 at 7:43=E2=80=AFPM Jim Shu <jim.shu@sifive.com> wrote:
>
> This patch also enables debugger to set current privilege mode to
> VU/VS-mode.
>
> Extend previous commit 81d2929c41d32af138f3562f5a7b309f6eac7ca7 to
> support H-extension.

I'm not sure we want this. What is the use case for this?

Changing the virt mode on the fly like this is likely to break lots of
software. Should we really allow users to do this?

Alistair

>
> Signed-off-by: Jim Shu <jim.shu@sifive.com>
> Reviewed-by: Frank Chang <frank.chang@sifive.com>
> ---
>  target/riscv/gdbstub.c | 18 ++++++++++++++++--
>  1 file changed, 16 insertions(+), 2 deletions(-)
>
> diff --git a/target/riscv/gdbstub.c b/target/riscv/gdbstub.c
> index 1755fd9d51..a7f234beaf 100644
> --- a/target/riscv/gdbstub.c
> +++ b/target/riscv/gdbstub.c
> @@ -203,15 +203,29 @@ static int riscv_gdb_get_virtual(CPURISCVState *cs,=
 GByteArray *buf, int n)
>
>  static int riscv_gdb_set_virtual(CPURISCVState *cs, uint8_t *mem_buf, in=
t n)
>  {
> +#ifdef CONFIG_USER_ONLY
> +    if (n >=3D 0 && n <=3D 1) {
> +        return sizeof(target_ulong);
> +    }
> +#else
> +    bool virt;
> +
>      if (n =3D=3D 0) {
> -#ifndef CONFIG_USER_ONLY
>          cs->priv =3D ldtul_p(mem_buf) & 0x3;
>          if (cs->priv =3D=3D PRV_H) {
>              cs->priv =3D PRV_S;
>          }
> -#endif
> +        return sizeof(target_ulong);
> +    } else if (n =3D=3D 1) {
> +        virt =3D ldtul_p(mem_buf) & 0x1;
> +        if ((cs->priv =3D=3D PRV_M) && (virt =3D=3D true)) {
> +            /* M-mode only supports V=3D0. */
> +            virt =3D false;
> +        }
> +        riscv_cpu_set_virt_enabled(cs, virt);
>          return sizeof(target_ulong);
>      }
> +#endif
>      return 0;
>  }
>
> --
> 2.17.1
>
>

