Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1paQGf-0000Z9-8b
	for mharc-qemu-riscv@gnu.org; Thu, 09 Mar 2023 19:05:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1paQGc-0000MS-Ak; Thu, 09 Mar 2023 19:05:51 -0500
Received: from mail-ua1-x92f.google.com ([2607:f8b0:4864:20::92f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1paQGZ-0001Fe-I0; Thu, 09 Mar 2023 19:05:49 -0500
Received: by mail-ua1-x92f.google.com with SMTP id l24so2392063uac.12;
 Thu, 09 Mar 2023 16:05:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678406746;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wfWBwN4fvgZySkRNZaXY8NIsltpoyQATuC4cKHfHw4c=;
 b=VzdtmMsQOHzzd/gqF4a7bf7Qu8KK6kHcOIr5bEShRO6cacKPvVmJEFe5d1T+7Uav2D
 4CpBIb0CYGrCPd5Mq1Ac4mamO7hL5obSLn1ydeDiEiX0dIviVtum70Hpeve+yai1ouIK
 xUWnE3Dti2Jt28oQkqVJUVrM52PJuNLcNeJG4YwecLBCuog3o4szPOdW+GbtkVXJodFv
 CcPE2MS0YIeAxrkfCY/j8lBOFrOX86dI6dm5lZoJeC6/A/t+3PwkaIkmSK8o8CPcL4Yy
 TVgVDs9K73D9kOd19ZQ6TYcjQQ+rUQVEGKrxSIhfk0u7mGoibyfFICinFduyvDwoZROM
 k1FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678406746;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wfWBwN4fvgZySkRNZaXY8NIsltpoyQATuC4cKHfHw4c=;
 b=MRvrw2gUdvJAT9pSagZ6aSw66hq/BsawauGisKfSRYY6S9CxfcrRsyaIil+w0vZqIh
 La96I0dF8AcuhOySARgLWYRJMjg5lSoz8OC/WYBU1sVJTBkroTa9Wqoknvrg55v6CNtq
 4455oMGCqMu3F/LgNKlsiFDKDjvAVJUHdPHjZhAr+NOI1CdF/wjs60b06XQcc/jDciTv
 tDQwLuf/zyVqoZBUa/wiCK0KT28DaasdSqQbyYhXruRlIUf9dC0mH47wXy/CYuLhQUXn
 zQBbLwyV/y2Z8OZPzzAa4LIzhcqZGCsnJmT3lQQvt3azw/8Yhf7SEV9KQOYojQUu0RNt
 88xg==
X-Gm-Message-State: AO0yUKXBXSZOOF4XT0Re/fPdf7Q05InoHFcrumn9by8hl6hz2g1SXWjo
 mCPHzEfwvuJ/wti7huRNPcGVqczgTC2YPwME/bM=
X-Google-Smtp-Source: AK7set/phmQ7eE+dAu2DmbxauZQkX2BmDpj+v/UjF5Wxn3BO33OdZvAtDR/gsK8R4rZjJnnu/TF1keV99sUjKMWi7sM=
X-Received: by 2002:a1f:9817:0:b0:400:ea69:7082 with SMTP id
 a23-20020a1f9817000000b00400ea697082mr14723613vke.0.1678406746071; Thu, 09
 Mar 2023 16:05:46 -0800 (PST)
MIME-Version: 1.0
References: <20230305094231.1616-1-jim.shu@sifive.com>
In-Reply-To: <20230305094231.1616-1-jim.shu@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 10 Mar 2023 10:05:20 +1000
Message-ID: <CAKmqyKOG-E9u5xUs=mRyMROkkn-kj1rKWH2E=yf4HYNvnXCZsQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] target/riscv: Expose "virt" register for GDB for reads
To: Jim Shu <jim.shu@sifive.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
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
X-List-Received-Date: Fri, 10 Mar 2023 00:05:51 -0000

On Sun, Mar 5, 2023 at 7:43=E2=80=AFPM Jim Shu <jim.shu@sifive.com> wrote:
>
> This patch enables a debugger to read current virtualization mode via
> virtual "virt" register. After it, we could get full current privilege
> mode via both "priv" and "virt" register.
>
> Extend previous commit ab9056ff9bdb3f95db6e7a666d10522d289f14ec to
> support H-extension.
>
> Signed-off-by: Jim Shu <jim.shu@sifive.com>
> Reviewed-by: Frank Chang <frank.chang@sifive.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  gdb-xml/riscv-32bit-virtual.xml |  1 +
>  gdb-xml/riscv-64bit-virtual.xml |  1 +
>  target/riscv/gdbstub.c          | 12 ++++++++----
>  3 files changed, 10 insertions(+), 4 deletions(-)
>
> diff --git a/gdb-xml/riscv-32bit-virtual.xml b/gdb-xml/riscv-32bit-virtua=
l.xml
> index 905f1c555d..d44b6ca2dc 100644
> --- a/gdb-xml/riscv-32bit-virtual.xml
> +++ b/gdb-xml/riscv-32bit-virtual.xml
> @@ -8,4 +8,5 @@
>  <!DOCTYPE feature SYSTEM "gdb-target.dtd">
>  <feature name=3D"org.gnu.gdb.riscv.virtual">
>    <reg name=3D"priv" bitsize=3D"32"/>
> +  <reg name=3D"virt" bitsize=3D"32"/>
>  </feature>
> diff --git a/gdb-xml/riscv-64bit-virtual.xml b/gdb-xml/riscv-64bit-virtua=
l.xml
> index 62d86c237b..7c9b63d5b6 100644
> --- a/gdb-xml/riscv-64bit-virtual.xml
> +++ b/gdb-xml/riscv-64bit-virtual.xml
> @@ -8,4 +8,5 @@
>  <!DOCTYPE feature SYSTEM "gdb-target.dtd">
>  <feature name=3D"org.gnu.gdb.riscv.virtual">
>    <reg name=3D"priv" bitsize=3D"64"/>
> +  <reg name=3D"virt" bitsize=3D"64"/>
>  </feature>
> diff --git a/target/riscv/gdbstub.c b/target/riscv/gdbstub.c
> index 6048541606..1755fd9d51 100644
> --- a/target/riscv/gdbstub.c
> +++ b/target/riscv/gdbstub.c
> @@ -187,13 +187,17 @@ static int riscv_gdb_set_csr(CPURISCVState *env, ui=
nt8_t *mem_buf, int n)
>
>  static int riscv_gdb_get_virtual(CPURISCVState *cs, GByteArray *buf, int=
 n)
>  {
> -    if (n =3D=3D 0) {
>  #ifdef CONFIG_USER_ONLY
> +    if (n >=3D 0 && n <=3D 1) {
>          return gdb_get_regl(buf, 0);
> +    }
>  #else
> +    if (n =3D=3D 0) {
>          return gdb_get_regl(buf, cs->priv);
> -#endif
> +    } else if (n =3D=3D 1) {
> +        return gdb_get_regl(buf, riscv_cpu_virt_enabled(cs));
>      }
> +#endif
>      return 0;
>  }
>
> @@ -328,13 +332,13 @@ void riscv_cpu_register_gdb_regs_for_features(CPUSt=
ate *cs)
>      case MXL_RV32:
>          gdb_register_coprocessor(cs, riscv_gdb_get_virtual,
>                                   riscv_gdb_set_virtual,
> -                                 1, "riscv-32bit-virtual.xml", 0);
> +                                 2, "riscv-32bit-virtual.xml", 0);
>          break;
>      case MXL_RV64:
>      case MXL_RV128:
>          gdb_register_coprocessor(cs, riscv_gdb_get_virtual,
>                                   riscv_gdb_set_virtual,
> -                                 1, "riscv-64bit-virtual.xml", 0);
> +                                 2, "riscv-64bit-virtual.xml", 0);
>          break;
>      default:
>          g_assert_not_reached();
> --
> 2.17.1
>
>

