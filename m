Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1noMFw-00064x-9c
	for mharc-qemu-riscv@gnu.org; Tue, 10 May 2022 05:34:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1noMFt-0005yo-L7; Tue, 10 May 2022 05:34:09 -0400
Received: from mail-io1-xd34.google.com ([2607:f8b0:4864:20::d34]:38468)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1noMFs-0001t1-2r; Tue, 10 May 2022 05:34:09 -0400
Received: by mail-io1-xd34.google.com with SMTP id z18so17935566iob.5;
 Tue, 10 May 2022 02:34:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rRv4THwPAHPKrWHTuP3akanXtGedN/VRDUyOwpW+oF0=;
 b=jufuYPsN75JgnVgAQnfKc1cSfpNKmYDRZ5eLGmamJDnjyy0v3mrgnAJhoshVxWA2Q2
 kNch7XPAd3RUDItZyiu/sfJU6IsQNEl8q3LTFvXI5NGn0o5mVyndTxo+fylvze9rCVJv
 JsxjX5EZZbSF39bxU/FyIqFFjkgaoD0X/HuKckLwr+hNrA5ZvPEkN9uah+LR1yBpeRtk
 Bi5C46wSRxpC6aZInvqRisxJRX3lN254FSp7fj7ia9+sHXmVTcK8+n4hc6zTJjIzIxtz
 RoZFMS7O30tjnC/1YAS4zNdpULwOa4PgGzQ3cTXpF/AVJMD2Gb5BYgnfAt2UEhIoGCEv
 xwKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rRv4THwPAHPKrWHTuP3akanXtGedN/VRDUyOwpW+oF0=;
 b=JnB8DxRTS8iE3+achNmLZZBfBgM9aJdvMXnyy3UYCvUFZt1Z6GTgiPo0j42El9tuIq
 bg/Xgb9istoca/H03eRslfTv/07l04Y0XByCG2+T+Pr49YP7n8qEHUDDAcUmUgSSTYEo
 gc4jPp5cIiCqMTa/qbyWTMWB/DWzDE3yMATc9Mzti2bxa4t4DKZTc9xeIZ2FVUGgKNiZ
 UfjrrpWpgvtji/Lrpe4KkiNgQUxmU9de9n/hIabJF8lg2iiavwBDOQblKjsjsQZDBgZx
 OOZvxqriVUBsoJFfu9pXg8Q+DeW4r6khPYFeUrLKK+1E2owC6MWr+40FNiE8BkehAcDs
 fNlA==
X-Gm-Message-State: AOAM530udPfZ/IlrWZ1n1P/Z5ab8sSv22/H6SDw1Rrg/fkqf6uUhmfrE
 RHUJSc5wjAVPJ9DQcZ138kf2AO+AQaxJPa9XWb0=
X-Google-Smtp-Source: ABdhPJw/zHuONEm7LUiu94IR0BoKDR0F6YubIjbcXIWTO9eZHwILcJpTbgRoj3G60FPQ2OgUDuztz10bp69JCUuOh/A=
X-Received: by 2002:a02:6f56:0:b0:32a:ff25:1fe3 with SMTP id
 b22-20020a026f56000000b0032aff251fe3mr9847565jae.21.1652175246734; Tue, 10
 May 2022 02:34:06 -0700 (PDT)
MIME-Version: 1.0
References: <165156202959.27941.9731161369415852149-0@git.sr.ht>
 <165156202959.27941.9731161369415852149-8@git.sr.ht>
In-Reply-To: <165156202959.27941.9731161369415852149-8@git.sr.ht>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 10 May 2022 11:33:40 +0200
Message-ID: <CAKmqyKNoZEQBqvhBfaC7g3OWBBD6SwytZFiVWiJR0CJy1__dHA@mail.gmail.com>
Subject: Re: [PATCH qemu v14 08/15] target/riscv: rvv: Add tail agnostic for
 vector integer comparison instructions
To: "~eopxd" <yueh.ting.chen@gmail.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Frank Chang <frank.chang@sifive.com>, 
 WeiWei Li <liweiwei@iscas.ac.cn>, eop Chen <eop.chen@sifive.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d34;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd34.google.com
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
X-List-Received-Date: Tue, 10 May 2022 09:34:10 -0000

On Tue, May 3, 2022 at 9:40 AM ~eopxd <eopxd@git.sr.ht> wrote:
>
> From: eopXD <eop.chen@sifive.com>
>
> Compares write mask registers, and so always operate under a tail-
> agnostic policy.
>
> Signed-off-by: eop Chen <eop.chen@sifive.com>
> Reviewed-by: Frank Chang <frank.chang@sifive.com>
> Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/vector_helper.c | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>
> diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
> index c1ae2ea2f1..ddaf364573 100644
> --- a/target/riscv/vector_helper.c
> +++ b/target/riscv/vector_helper.c
> @@ -1373,6 +1373,8 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, void *vs2,   \
>  {                                                             \
>      uint32_t vm = vext_vm(desc);                              \
>      uint32_t vl = env->vl;                                    \
> +    uint32_t total_elems = env_archcpu(env)->cfg.vlen;        \
> +    uint32_t vta_all_1s = vext_vta_all_1s(desc);              \
>      uint32_t i;                                               \
>                                                                \
>      for (i = env->vstart; i < vl; i++) {                      \
> @@ -1384,6 +1386,13 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, void *vs2,   \
>          vext_set_elem_mask(vd, i, DO_OP(s2, s1));             \
>      }                                                         \
>      env->vstart = 0;                                          \
> +    /* mask destination register are always tail-agnostic */  \
> +    /* set tail elements to 1s */                             \
> +    if (vta_all_1s) {                                         \
> +        for (; i < total_elems; i++) {                        \
> +            vext_set_elem_mask(vd, i, 1);                     \
> +        }                                                     \
> +    }                                                         \
>  }
>
>  GEN_VEXT_CMP_VV(vmseq_vv_b, uint8_t,  H1, DO_MSEQ)
> @@ -1422,6 +1431,8 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong s1, void *vs2,   \
>  {                                                                   \
>      uint32_t vm = vext_vm(desc);                                    \
>      uint32_t vl = env->vl;                                          \
> +    uint32_t total_elems = env_archcpu(env)->cfg.vlen;              \
> +    uint32_t vta_all_1s = vext_vta_all_1s(desc);                    \
>      uint32_t i;                                                     \
>                                                                      \
>      for (i = env->vstart; i < vl; i++) {                            \
> @@ -1433,6 +1444,13 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong s1, void *vs2,   \
>                  DO_OP(s2, (ETYPE)(target_long)s1));                 \
>      }                                                               \
>      env->vstart = 0;                                                \
> +    /* mask destination register are always tail-agnostic */        \
> +    /* set tail elements to 1s */                                   \
> +    if (vta_all_1s) {                                               \
> +        for (; i < total_elems; i++) {                              \
> +            vext_set_elem_mask(vd, i, 1);                           \
> +        }                                                           \
> +    }                                                               \
>  }
>
>  GEN_VEXT_CMP_VX(vmseq_vx_b, uint8_t,  H1, DO_MSEQ)
> --
> 2.34.2
>
>

