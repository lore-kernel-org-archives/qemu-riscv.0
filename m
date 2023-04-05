Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pjuZK-00045b-4t
	for mharc-qemu-riscv@gnu.org; Wed, 05 Apr 2023 00:16:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pjuZH-00045D-RT; Wed, 05 Apr 2023 00:16:20 -0400
Received: from mail-vs1-xe2b.google.com ([2607:f8b0:4864:20::e2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pjuZF-0008Bd-W2; Wed, 05 Apr 2023 00:16:19 -0400
Received: by mail-vs1-xe2b.google.com with SMTP id c1so30372109vsk.2;
 Tue, 04 Apr 2023 21:16:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680668176;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Dg8Ima0IQVAwgXe6CQkrlYZ/6k1yhmtjP5Ys0pi4GpE=;
 b=Px9MIW8uj8/V9fsDEgryVXM27Pv/bzc+n4PgMoxgpVtRuzZOv5VYPCUBvfqxGv5QDj
 KwfLkpP8FkhucZzgsDmuXxGgoxmEoHhLjeNMwwggRooeElbyhJUYutNUvq3pLTEWLbp+
 Kjzd4VubZ4tVNBAtQNvVIGCOg2HFGGMinT2s+BH71nNzEiapt4WNAW96SBHMxoNC/tOv
 GjaeylhXDvbVJ0lil/sMJR1uqzRQ3hHVilvgu5Jt01RaRkWTpZR3bF1BPWnVJ/p/iwNb
 pvtMmqRTbFSs+Xrm9RAPybmLU/+uDaSXw1s8dIFuY9/aetp7esKzmHxnJ3mnMp78F/+c
 6wMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680668176;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Dg8Ima0IQVAwgXe6CQkrlYZ/6k1yhmtjP5Ys0pi4GpE=;
 b=UWuc9gXh0l1rocgdJGg+Mx4bsQoe0RjUw6jcVa7XRH+WLYwN6A1EzFdNPgMKidWV0Y
 3f7pv06ilZTbF0Hh3O8HMBcXpsAMvdduvGtYlh6duN/rkzxC1m44SpEICDedJiyQr/0Z
 Wotuq8H3lv5EdAq+QQnq2E60jg9b+BVDwOkj8Ke6+Rh4pO7f+EmjtZTAZ84ZZDgA0cPT
 0WcRNsZZ7NPJG5pQFOiDBLlD05h1Cb/pw54Zmt6of4NaAf3/GI9imK18/5uO3W/stG9O
 EJT3us3FGu9NHw26J4dw0zazS6FdpieuHTcRTI7gdPhwud7tlYbHzFBcvKV9Ifxl6XvV
 sw+A==
X-Gm-Message-State: AAQBX9fxU3af7YP3zAXdfVBUAYr506ahp1GI+2/bNpn3Qk5cIUlp3QIS
 yl8lhZdlOZZ5YqIKyl+ui4ucTyIqvOhSvn1uVM7ih16B4eA=
X-Google-Smtp-Source: AKy350ZdsbuHQlARr8sD0sUN+TU00ECxNWmtMa15FVoD4PA7uIx7cpfUqbn0nRGYh/cV44CXXORFKuRK/jDv5IB+//k=
X-Received: by 2002:a67:d60c:0:b0:425:969d:3709 with SMTP id
 n12-20020a67d60c000000b00425969d3709mr3651001vsj.3.1680668176323; Tue, 04 Apr
 2023 21:16:16 -0700 (PDT)
MIME-Version: 1.0
References: <20230307081403.61950-1-liweiwei@iscas.ac.cn>
 <20230307081403.61950-11-liweiwei@iscas.ac.cn>
In-Reply-To: <20230307081403.61950-11-liweiwei@iscas.ac.cn>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 5 Apr 2023 14:15:50 +1000
Message-ID: <CAKmqyKN5SezGPa2RpuFU2g16DR5MfR6k8BDRRsJyGZy4sdOAzw@mail.gmail.com>
Subject: Re: [PATCH v12 10/10] target/riscv: Add support for Zce
To: Weiwei Li <liweiwei@iscas.ac.cn>
Cc: richard.henderson@linaro.org, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, qemu-riscv@nongnu.org, qemu-devel@nongnu.org, 
 wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
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
X-List-Received-Date: Wed, 05 Apr 2023 04:16:20 -0000

On Tue, Mar 7, 2023 at 6:16=E2=80=AFPM Weiwei Li <liweiwei@iscas.ac.cn> wro=
te:
>
> Add and expose property for Zce:
> * Specifying Zce without F includes Zca, Zcb, Zcmp, Zcmt.
> * Specifying Zce with F includes Zca, Zcb, Zcmp, Zcmt and Zcf.
>
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c | 12 ++++++++++++
>  target/riscv/cpu.h |  1 +
>  2 files changed, 13 insertions(+)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index d17ae942bd..3502d1e749 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -91,6 +91,7 @@ static const struct isa_ext_data isa_edata_arr[] =3D {
>      ISA_EXT_DATA_ENTRY(zcb, true, PRIV_VERSION_1_12_0, ext_zcb),
>      ISA_EXT_DATA_ENTRY(zcf, true, PRIV_VERSION_1_12_0, ext_zcf),
>      ISA_EXT_DATA_ENTRY(zcd, true, PRIV_VERSION_1_12_0, ext_zcd),
> +    ISA_EXT_DATA_ENTRY(zce, true, PRIV_VERSION_1_12_0, ext_zce),
>      ISA_EXT_DATA_ENTRY(zcmp, true, PRIV_VERSION_1_12_0, ext_zcmp),
>      ISA_EXT_DATA_ENTRY(zcmt, true, PRIV_VERSION_1_12_0, ext_zcmt),
>      ISA_EXT_DATA_ENTRY(zba, true, PRIV_VERSION_1_12_0, ext_zba),
> @@ -945,6 +946,16 @@ static void riscv_cpu_validate_set_extensions(RISCVC=
PU *cpu, Error **errp)
>          }
>      }
>
> +    if (cpu->cfg.ext_zce) {
> +        cpu->cfg.ext_zca =3D true;
> +        cpu->cfg.ext_zcb =3D true;
> +        cpu->cfg.ext_zcmp =3D true;
> +        cpu->cfg.ext_zcmt =3D true;
> +        if (cpu->cfg.ext_f && env->misa_mxl_max =3D=3D MXL_RV32) {
> +            cpu->cfg.ext_zcf =3D true;
> +        }
> +    }
> +
>      if (cpu->cfg.ext_c) {
>          cpu->cfg.ext_zca =3D true;
>          if (cpu->cfg.ext_f && env->misa_mxl_max =3D=3D MXL_RV32) {
> @@ -1501,6 +1512,7 @@ static Property riscv_cpu_extensions[] =3D {
>      DEFINE_PROP_BOOL("x-zca", RISCVCPU, cfg.ext_zca, false),
>      DEFINE_PROP_BOOL("x-zcb", RISCVCPU, cfg.ext_zcb, false),
>      DEFINE_PROP_BOOL("x-zcd", RISCVCPU, cfg.ext_zcd, false),
> +    DEFINE_PROP_BOOL("x-zce", RISCVCPU, cfg.ext_zce, false),
>      DEFINE_PROP_BOOL("x-zcf", RISCVCPU, cfg.ext_zcf, false),
>      DEFINE_PROP_BOOL("x-zcmp", RISCVCPU, cfg.ext_zcmp, false),
>      DEFINE_PROP_BOOL("x-zcmt", RISCVCPU, cfg.ext_zcmt, false),
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 351d5e3e79..9b76885166 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -443,6 +443,7 @@ struct RISCVCPUConfig {
>      bool ext_zca;
>      bool ext_zcb;
>      bool ext_zcd;
> +    bool ext_zce;
>      bool ext_zcf;
>      bool ext_zcmp;
>      bool ext_zcmt;
> --
> 2.25.1
>
>

