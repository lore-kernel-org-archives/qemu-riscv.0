Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pmQam-0005hW-IF
	for mharc-qemu-riscv@gnu.org; Tue, 11 Apr 2023 22:52:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pmQal-0005hK-Mr; Tue, 11 Apr 2023 22:52:15 -0400
Received: from mail-vs1-xe33.google.com ([2607:f8b0:4864:20::e33])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pmQaj-00037k-OR; Tue, 11 Apr 2023 22:52:15 -0400
Received: by mail-vs1-xe33.google.com with SMTP id y17so9140131vsd.9;
 Tue, 11 Apr 2023 19:52:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681267932; x=1683859932;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=m5KFqEsZQgqOGMIvpyY/ThMzzoT8epFpXv5Am5iSVMM=;
 b=Qad4SPkItBf5RcFuNvAmE6F5fPD4VH7BBuDJa71x724m+Z4YZdLV677CiEHD6U9Vn9
 4lRP6yC+KYqdvvLbO76svxRfi8vt2r4TY94fQZjnnbJM6Zs3hCGntIqJtneeLwxsgCgo
 O0qLf1TGIC99Uhnj82LcCPnIFT5fdSo6bUeSyy3pjC2w4gm0jVD8j7avFKVr8v6JVnmd
 BJPGNgGfe4xQ6p49/ECZ4KiJXMYD/xysk0YJNrKg0LHPshWO8XIDxsTHHmdyE9iJq3hQ
 BohL8Li0kyhThkBMfRK3+BZceXRwRFKuSKEc1YbHgvmdRGBxL+sIol34LwIWvA6jt9pk
 UCzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681267932; x=1683859932;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=m5KFqEsZQgqOGMIvpyY/ThMzzoT8epFpXv5Am5iSVMM=;
 b=1rKoQ/LdcdoSTiVp/n7M4U4oyOmraP2wq/mS0AFsQvjcVLjxrAF+qNp6aeHtc3onKf
 jwm40JuGs1B4RJgygoLfFEEL6OLV6a9P3qYyp12xoQgL2aRgUG8e19vAH3PENkf5INyQ
 BZfAOiColL6NGDEK4v613FY6ducwDt0M3Kaofh3LpYru3jVd5/4tGoUXtLeoGcDE9+bs
 arNIcOsole2IS3JZ1gs3u0k+sDA/2t77GBfw0ncTffqv7krRCWDlOYxiZBi7fR0y2Vto
 T1rsIwDAq6lEbqXbWqwArYZA93pV+Qx9POIHMRuGCbpm7H/g6Y69NjRACabUlfH3Cv08
 3qLA==
X-Gm-Message-State: AAQBX9djkKsNXcLj6X3nMOTfsVMTM00IlLJvH5HwBtwlE5DllsE3TFoL
 lDeUmS+P/afYwYdDVTMpIB7TXEgYaxxao7EE+Lg=
X-Google-Smtp-Source: AKy350Y7vBB8zU8DHR1UjZ1kLMX2BaKsm+GE5d/8YU85AdHaz2VRGSSs2EIvqdp6DkJy61nY/5IdXErz2ohunkO7BpY=
X-Received: by 2002:a67:d38e:0:b0:412:2ed6:d79b with SMTP id
 b14-20020a67d38e000000b004122ed6d79bmr8597718vsj.3.1681267932296; Tue, 11 Apr
 2023 19:52:12 -0700 (PDT)
MIME-Version: 1.0
References: <20230410033526.31708-1-liweiwei@iscas.ac.cn>
 <20230410033526.31708-2-liweiwei@iscas.ac.cn>
In-Reply-To: <20230410033526.31708-2-liweiwei@iscas.ac.cn>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 12 Apr 2023 12:51:46 +1000
Message-ID: <CAKmqyKOYdZp_XrX0EBbKy49wORY-vvvfe1-qA216erCOg1gL1g@mail.gmail.com>
Subject: Re: [PATCH 1/2] target/riscv: Add set_implicit_extensions_from_ext()
 function
To: Weiwei Li <liweiwei@iscas.ac.cn>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, palmer@dabbelt.com, 
 alistair.francis@wdc.com, bin.meng@windriver.com, dbarboza@ventanamicro.com, 
 zhiwei_liu@linux.alibaba.com, wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e33;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe33.google.com
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
X-List-Received-Date: Wed, 12 Apr 2023 02:52:15 -0000

On Mon, Apr 10, 2023 at 1:36=E2=80=AFPM Weiwei Li <liweiwei@iscas.ac.cn> wr=
ote:
>
> Move multi-letter extensions that may implicitly enabled from misa.EXT
> alone to prepare for following separation of implicitly enabled and
> explicitly enabled extensions.
>
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c | 56 +++++++++++++++++++++++++---------------------
>  1 file changed, 31 insertions(+), 25 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index cb68916fce..abb65d41b1 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -809,6 +809,35 @@ static void riscv_cpu_disas_set_info(CPUState *s, di=
sassemble_info *info)
>      }
>  }
>
> +static void set_implicit_extensions_from_ext(RISCVCPU *cpu)
> +{
> +
> +    /* The V vector extension depends on the Zve64d extension */
> +    if (cpu->cfg.ext_v) {
> +        cpu->cfg.ext_zve64d =3D true;
> +    }
> +
> +    /* The Zve64d extension depends on the Zve64f extension */
> +    if (cpu->cfg.ext_zve64d) {
> +        cpu->cfg.ext_zve64f =3D true;
> +    }
> +
> +    /* The Zve64f extension depends on the Zve32f extension */
> +    if (cpu->cfg.ext_zve64f) {
> +        cpu->cfg.ext_zve32f =3D true;
> +    }
> +
> +    if (cpu->cfg.ext_c) {
> +        cpu->cfg.ext_zca =3D true;
> +        if (cpu->cfg.ext_f && cpu->env.misa_mxl_max =3D=3D MXL_RV32) {
> +            cpu->cfg.ext_zcf =3D true;
> +        }
> +        if (cpu->cfg.ext_d) {
> +            cpu->cfg.ext_zcd =3D true;
> +        }
> +    }
> +}
> +
>  /*
>   * Check consistency between chosen extensions while setting
>   * cpu->cfg accordingly, doing a set_misa() in the end.
> @@ -833,6 +862,8 @@ static void riscv_cpu_validate_set_extensions(RISCVCP=
U *cpu, Error **errp)
>          cpu->cfg.ext_ifencei =3D true;
>      }
>
> +    set_implicit_extensions_from_ext(cpu);
> +
>      if (cpu->cfg.ext_i && cpu->cfg.ext_e) {
>          error_setg(errp,
>                     "I and E extensions are incompatible");
> @@ -886,21 +917,6 @@ static void riscv_cpu_validate_set_extensions(RISCVC=
PU *cpu, Error **errp)
>          return;
>      }
>
> -    /* The V vector extension depends on the Zve64d extension */
> -    if (cpu->cfg.ext_v) {
> -        cpu->cfg.ext_zve64d =3D true;
> -    }
> -
> -    /* The Zve64d extension depends on the Zve64f extension */
> -    if (cpu->cfg.ext_zve64d) {
> -        cpu->cfg.ext_zve64f =3D true;
> -    }
> -
> -    /* The Zve64f extension depends on the Zve32f extension */
> -    if (cpu->cfg.ext_zve64f) {
> -        cpu->cfg.ext_zve32f =3D true;
> -    }
> -
>      if (cpu->cfg.ext_zve64d && !cpu->cfg.ext_d) {
>          error_setg(errp, "Zve64d/V extensions require D extension");
>          return;
> @@ -956,16 +972,6 @@ static void riscv_cpu_validate_set_extensions(RISCVC=
PU *cpu, Error **errp)
>          }
>      }
>
> -    if (cpu->cfg.ext_c) {
> -        cpu->cfg.ext_zca =3D true;
> -        if (cpu->cfg.ext_f && env->misa_mxl_max =3D=3D MXL_RV32) {
> -            cpu->cfg.ext_zcf =3D true;
> -        }
> -        if (cpu->cfg.ext_d) {
> -            cpu->cfg.ext_zcd =3D true;
> -        }
> -    }
> -
>      if (env->misa_mxl_max !=3D MXL_RV32 && cpu->cfg.ext_zcf) {
>          error_setg(errp, "Zcf extension is only relevant to RV32");
>          return;
> --
> 2.25.1
>
>

