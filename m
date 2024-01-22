Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17609C47422
	for <qemu-riscv@archiver.kernel.org>; Mon, 22 Jan 2024 02:39:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rRkCz-0005tb-5d; Sun, 21 Jan 2024 21:38:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rRkCv-0005sp-8u; Sun, 21 Jan 2024 21:38:41 -0500
Received: from mail-ua1-x92d.google.com ([2607:f8b0:4864:20::92d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rRkCt-0007XR-La; Sun, 21 Jan 2024 21:38:40 -0500
Received: by mail-ua1-x92d.google.com with SMTP id
 a1e0cc1a2514c-7d2a67daa25so796344241.0; 
 Sun, 21 Jan 2024 18:38:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705891117; x=1706495917; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vv+u4W2Hx8OQa8plQDcFKIld72nNQ8ZUv2EyDmmeHb8=;
 b=OEG5f11/TO2sAdcnZqnLCBXgdzPa7/8gLyhaqloI+mFO9iGQiVF+gpJad/IdKfnB9s
 iRie8Gb/YHDH4CKX3Ac2FHKbysLPUBc1LBmvgyo99rliRCaPpPnSrkUcSavdbHh1Xs84
 pO2MsMCG/HtAWY3ZaWJ1BleLb0VRsGB7abk4e8XNxHiZRf3+SzGQFa33aWWKtCGbcGKt
 KXCP1Heu7FMiADAEQf7lTD7mutNtvnVkQdAosbL4/u7wHfuRS0cQ3dU8HWa2zxCWlaWp
 riWQbgFiLk3rZzQtriB9zq7M6DvE7lH9VLX2A9YOMtqWrUxhIb/q2mcuNSvqJpbIOZrk
 laTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705891117; x=1706495917;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vv+u4W2Hx8OQa8plQDcFKIld72nNQ8ZUv2EyDmmeHb8=;
 b=ljz85Wyy01gMKBsTbQ6ddY/zhycUGwECsiLQDRidLkGM4hJonFNwh7ibjPSvM6LOCU
 tguh4QD4YI8DTB9Ei36QS7WT537BMxWmxv4tf0vaoIX72emdvZTLJ3FXeEyTmnHwu4MR
 ry5a8SNlhmXON2L3hw/eIwNCxOB/UAGOS76n9RqUY+nwUUkbjn+8QK+hUoEFJ0nuOiG4
 yP3yNsDswB+7/8jd/NIzSUPC7lQXk4Z76Ot2Gz4NYVcNZnM8ECZUv7LOvGKK0ofZp/Rh
 anJcBeQZqFrV8dGHWtyHc2gS/PpV9jkOinvPpj1cfNW8r4HCiX7aIFuOcMLpy+XMR9rE
 /qpQ==
X-Gm-Message-State: AOJu0Yw+Ecj5IGDzXQZCPQRp5ocBSvSNBc98fLSiN2gIqeZTiGR7w0jP
 6SEDnft0NgB47ccTs9qEywdoaZrPi+VEmQmYMAkZIf6L8u10hiIhUzLrEdaaoYt2RpCA9DUXxAy
 Llkd8evt9LyOTwNn1DsLJUXXSew4=
X-Google-Smtp-Source: AGHT+IG0hmGWEJdOujoz0o16V/RfVq6qm3uO2z5xPIq2W6HY8mknZx0VECJJdJsYqLDybCBdvNgE6yWD2u614rgFS/A=
X-Received: by 2002:a05:6122:509:b0:4b6:dc25:3d4b with SMTP id
 x9-20020a056122050900b004b6dc253d4bmr717664vko.12.1705891116273; Sun, 21 Jan
 2024 18:38:36 -0800 (PST)
MIME-Version: 1.0
References: <20240116205817.344178-1-dbarboza@ventanamicro.com>
 <20240116205817.344178-2-dbarboza@ventanamicro.com>
In-Reply-To: <20240116205817.344178-2-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 22 Jan 2024 12:38:10 +1000
Message-ID: <CAKmqyKN71zvJnF8OuLRFmXHXn47OyaYUTVD+r5cS9SipUZYdJw@mail.gmail.com>
Subject: Re: [PATCH v3 01/13] target/riscv: add 'vlenb' field in cpu->cfg
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com, richard.henderson@linaro.org, max.chou@sifive.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::92d;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x92d.google.com
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

On Wed, Jan 17, 2024 at 7:00=E2=80=AFAM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> Our usage of 'vlenb' is overwhelming superior than the use of 'vlen'.
> We're using 'vlenb' most of the time, having to do 'vlen >> 3' or
> 'vlen / 8' in every instance.
>
> In hindsight we would be better if the 'vlenb' property  was introduced
> instead of 'vlen'. That's not what happened, and now we can't easily get
> rid of it due to user scripts all around. What we can do, however, is to
> change our internal representation to use 'vlenb'.
>
> Add a 'vlenb' field in cpu->cfg. It'll be set via the existing 'vlen'
> property, i.e. setting 'vlen' will also set 'vlenb'.
>
> We'll replace all 'vlen >> 3' code to use 'vlenb' directly. Start with
> the single instance we have in target/riscv/cpu.c.
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c     | 4 +++-
>  target/riscv/cpu_cfg.h | 1 +
>  2 files changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 8d3ec74a1c..f4261d2ffc 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -847,7 +847,7 @@ static void riscv_cpu_dump_state(CPUState *cs, FILE *=
f, int flags)
>                               csr_ops[csrno].name, val);
>              }
>          }
> -        uint16_t vlenb =3D cpu->cfg.vlen >> 3;
> +        uint16_t vlenb =3D cpu->cfg.vlenb;
>
>          for (i =3D 0; i < 32; i++) {
>              qemu_fprintf(f, " %-8s ", riscv_rvv_regnames[i]);
> @@ -1314,6 +1314,7 @@ static void riscv_cpu_init(Object *obj)
>      /* Default values for non-bool cpu properties */
>      cpu->cfg.pmu_mask =3D MAKE_64BIT_MASK(3, 16);
>      cpu->cfg.vlen =3D 128;
> +    cpu->cfg.vlenb =3D 128 >> 3;
>      cpu->cfg.elen =3D 64;
>      cpu->env.vext_ver =3D VEXT_VERSION_1_00_0;
>  }
> @@ -1810,6 +1811,7 @@ static void prop_vlen_set(Object *obj, Visitor *v, =
const char *name,
>
>      cpu_option_add_user_setting(name, value);
>      cpu->cfg.vlen =3D value;
> +    cpu->cfg.vlenb =3D value >> 3;
>  }
>
>  static void prop_vlen_get(Object *obj, Visitor *v, const char *name,
> diff --git a/target/riscv/cpu_cfg.h b/target/riscv/cpu_cfg.h
> index fea14c275f..50479dd72f 100644
> --- a/target/riscv/cpu_cfg.h
> +++ b/target/riscv/cpu_cfg.h
> @@ -140,6 +140,7 @@ struct RISCVCPUConfig {
>
>      uint32_t pmu_mask;
>      uint16_t vlen;
> +    uint16_t vlenb;
>      uint16_t elen;
>      uint16_t cbom_blocksize;
>      uint16_t cbop_blocksize;
> --
> 2.43.0
>
>

