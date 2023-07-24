Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B6DCC001E0
	for <qemu-riscv@archiver.kernel.org>; Mon, 24 Jul 2023 01:57:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qNkoX-0001gk-BJ; Sun, 23 Jul 2023 21:56:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qNkoV-0001gV-Jq; Sun, 23 Jul 2023 21:56:43 -0400
Received: from mail-vk1-xa32.google.com ([2607:f8b0:4864:20::a32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qNkoU-0004f5-3l; Sun, 23 Jul 2023 21:56:43 -0400
Received: by mail-vk1-xa32.google.com with SMTP id
 71dfb90a1353d-460eb67244eso1468094e0c.1; 
 Sun, 23 Jul 2023 18:56:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690163800; x=1690768600;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=F3sSru2rjyKueBTs/Yjo9Ux/9V0nYgFtsY6vkL1nTEo=;
 b=TWj//AFwJc8CGJct2msvvOJbg5o2rZDE4IW1BfRfPIED3tjWcBxDx31z31mRKn5mQh
 tn/Wa5cgmw2Q+W2A5AJ6/xNYy0vS9Pt5JXeiIrZO6/kDcQJ5VfOb81LcrsfvUIRV6ds4
 tIMdHshXGTPxz6sl3hOcYL8CWrJh3fWmiXrQLoKN4iiSCiuYZzgDrFly1J0fNFN2APwG
 8NyJvYiWm5aJaCDERYnoN/iXIhUxNKfvV9qPzQfQYwx00WYB5EwNSXHcsngVgt4/I1d3
 eLLMWREZqQo4BnyeX+SHZ3J2jIxEEBKZiHHsn1zwN0jC4QoX3yZo13wLtVjHI+K6lpwc
 tWqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690163800; x=1690768600;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=F3sSru2rjyKueBTs/Yjo9Ux/9V0nYgFtsY6vkL1nTEo=;
 b=mEy4jh/oDr7IAn3CfgBVK1blTPDIAsE9A2KqxOJ7j177hTp8CvrQ/Jp4DfOaVuv8Di
 2EYTACHbUf90CD7KgtLKH/cDWaHWS4+zGWijvk5j8TfaLCRsqbX0iFa7GdtasLcb47oW
 wjvZS9JCFqxt36YuMiHeQ5V5StmSGBJRxppFm3M3LvPJ3lGsdNal3OxB392nQzRWW1y+
 OauyMBeQf6ceu386sbWphp/VFpq50BFY4pGKhIM/bjaTe4KZw+l+OfokXsaNUNshVEQ9
 zmUND4UCkr9VFkA2cb9+u8usGZKFulVc8Quuav9BSfmWKsX9PviS+tMrJozTKAUnB+jZ
 6Abg==
X-Gm-Message-State: ABy/qLbdb4sO8SRYjNIq0mi5LlAaG19ad2h+d8DEO1l0HtDf5XfJlaG2
 o5E8HGWrOc7N97RQMa5ebAa+xHdRQLCvMC12Mh4=
X-Google-Smtp-Source: APBJJlGke8A/pAzIxQBLl34Y4PEzHJB8nKrWw3aucJLXBFW8FTOaM0Df80+DzRGKOd0W/DVME48Jo0klYmU8AvE4VcA=
X-Received: by 2002:a1f:5e09:0:b0:476:4267:1788 with SMTP id
 s9-20020a1f5e09000000b0047642671788mr3430457vkb.13.1690163800618; Sun, 23 Jul
 2023 18:56:40 -0700 (PDT)
MIME-Version: 1.0
References: <20230717215419.124258-1-dbarboza@ventanamicro.com>
 <20230717215419.124258-2-dbarboza@ventanamicro.com>
In-Reply-To: <20230717215419.124258-2-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 24 Jul 2023 11:56:14 +1000
Message-ID: <CAKmqyKMOrwrVq0QUPafhQSGzr+K_C0MS-5Ki7wPmmRnxThqZiw@mail.gmail.com>
Subject: Re: [PATCH for-8.2 1/2] target/riscv/cpu.c: add zicntr extension flag
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a32;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa32.google.com
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On Tue, Jul 18, 2023 at 7:55=E2=80=AFAM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> zicntr is the Base Counters and Timers extension described in chapter 12
> of the unprivileged spec. It describes support for RDCYCLE, RDTIME and
> RDINSTRET.
>
> QEMU already implements it way before it was a discrete extension.
> zicntr is part of the RVA22 profile, so let's add it to QEMU to make the
> future profile implementation flag complete.
>
> Given than it represents an already existing feature, default it to
> 'true'. Change the realize() time validation to disable it in case its
> dependency (icsr) isn't present.
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c     | 11 +++++++++++
>  target/riscv/cpu_cfg.h |  1 +
>  2 files changed, 12 insertions(+)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 9339c0241d..7ec88659be 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -85,6 +85,7 @@ static const struct isa_ext_data isa_edata_arr[] =3D {
>      ISA_EXT_DATA_ENTRY(zicbom, PRIV_VERSION_1_12_0, ext_icbom),
>      ISA_EXT_DATA_ENTRY(zicboz, PRIV_VERSION_1_12_0, ext_icboz),
>      ISA_EXT_DATA_ENTRY(zicond, PRIV_VERSION_1_12_0, ext_zicond),
> +    ISA_EXT_DATA_ENTRY(zicntr, PRIV_VERSION_1_12_0, ext_icntr),
>      ISA_EXT_DATA_ENTRY(zicsr, PRIV_VERSION_1_10_0, ext_icsr),
>      ISA_EXT_DATA_ENTRY(zifencei, PRIV_VERSION_1_10_0, ext_ifencei),
>      ISA_EXT_DATA_ENTRY(zihintpause, PRIV_VERSION_1_10_0, ext_zihintpause=
),
> @@ -1291,6 +1292,10 @@ void riscv_cpu_validate_set_extensions(RISCVCPU *c=
pu, Error **errp)
>          cpu->cfg.ext_zksh =3D true;
>      }
>
> +    if (cpu->cfg.ext_icntr && !cpu->cfg.ext_icsr) {
> +        cpu->cfg.ext_icntr =3D false;
> +    }
> +
>      /*
>       * Disable isa extensions based on priv spec after we
>       * validated and set everything we need.
> @@ -1778,6 +1783,12 @@ static Property riscv_cpu_extensions[] =3D {
>      DEFINE_PROP_BOOL("svnapot", RISCVCPU, cfg.ext_svnapot, false),
>      DEFINE_PROP_BOOL("svpbmt", RISCVCPU, cfg.ext_svpbmt, false),
>
> +    /*
> +     * Always default true - we'll disable it during
> +     * realize() if needed.
> +     */
> +    DEFINE_PROP_BOOL("zicntr", RISCVCPU, cfg.ext_icntr, true),
> +
>      DEFINE_PROP_BOOL("zba", RISCVCPU, cfg.ext_zba, true),
>      DEFINE_PROP_BOOL("zbb", RISCVCPU, cfg.ext_zbb, true),
>      DEFINE_PROP_BOOL("zbc", RISCVCPU, cfg.ext_zbc, true),
> diff --git a/target/riscv/cpu_cfg.h b/target/riscv/cpu_cfg.h
> index 2bd9510ba3..d36dc12b92 100644
> --- a/target/riscv/cpu_cfg.h
> +++ b/target/riscv/cpu_cfg.h
> @@ -62,6 +62,7 @@ struct RISCVCPUConfig {
>      bool ext_zksh;
>      bool ext_zkt;
>      bool ext_ifencei;
> +    bool ext_icntr;
>      bool ext_icsr;
>      bool ext_icbom;
>      bool ext_icboz;
> --
> 2.41.0
>
>

