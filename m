Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65A9BC47422
	for <qemu-riscv@archiver.kernel.org>; Mon, 22 Jan 2024 03:14:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rRklh-0000qN-Ft; Sun, 21 Jan 2024 22:14:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rRklf-0000qA-Pi; Sun, 21 Jan 2024 22:14:35 -0500
Received: from mail-ua1-x936.google.com ([2607:f8b0:4864:20::936])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rRkle-0006we-3Z; Sun, 21 Jan 2024 22:14:35 -0500
Received: by mail-ua1-x936.google.com with SMTP id
 a1e0cc1a2514c-7d2dee968a5so313896241.0; 
 Sun, 21 Jan 2024 19:14:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705893272; x=1706498072; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HZiKZHenpCp/ipK3xnk011QEJCokR8f2bzsGTp3ZZ1Q=;
 b=Bfq9vNThIAEloAag1c35yF+6TMkv9HIHxGX97qe9XO6qYSRlcNOEhw55tiMgtwf/E8
 5yo5sUgQOAIJq+SGI51bxFN+2ZSWRIxL3xr+Bzsoi67FS0Rz2FFEXz9ptfh8UXZiEmMJ
 DdlrnKBpDaQPTACK+nc3y21CUI8nGMkwZX2Xb/Fbv6zc6t3Nz3pZ3fz74xGqGhwNk12x
 SiVFoPVBohbtm0te5bLmAbjdR0Wsg2fo8LZ3iPMIoR1uxOOWl3OBNxfQIJ8MdEZjQknu
 Ez/FyjXQK5HKP6GBdpSpuf4OHXtPPzeEMObrbuG8RQ6kuOQzLiCy8dq+l+bfbi2hGor1
 hdoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705893272; x=1706498072;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HZiKZHenpCp/ipK3xnk011QEJCokR8f2bzsGTp3ZZ1Q=;
 b=FrXmdaQ8Hkz1mb6L/DaGaSiWKWv8qe1SMahr4IgJFzpfoB2Hm7ZbkvoVhgUQxT2ykU
 rSmkcWqDG6fu8GiCLUYUuMfgxrwB4Fv3kzBH7ysG2c+EA9fpffOoTyF31kZK1NL6IIHn
 g4wdNYaD5TxlpizGHDUuJTz5IVDFhgIkjdAwkcVpCwl1NVaJ81X7NvJ7BV3ywRFJEAs5
 OC736r+Nbqr1h4sE1f/HyrKlStCd/k3vNfYi7fcCvnXXCRrjyME7xK1KzhewsnWLP4uK
 /qTeNIJQ7F2A+GZBMc5VJUO2etv0Z7zbQWhRtj43FlZNPVECGrs8N5xOAfAfH9/xqBC7
 zJbw==
X-Gm-Message-State: AOJu0Yxy/15odrU1sSf8YBJ5V39LESOpjcCMLInx/Ztj1zsq72HxfXdP
 oKpfeTA9QLmNthzSsyuMCQP3LZch78yDTmD+l2apcToaKxIG45FcGkNG4dL55t80jyAGMvZ8+tE
 m/PwI/PSwKSe7lbW7wvxtRJlItlI=
X-Google-Smtp-Source: AGHT+IHVBmIBIvR54PDg17ORNBKt2GKC0IA9bhRHp8+qqhBIw2GVCoR0Xkq20Lz4Zq/iRpu/ypFr1iyXAOnmCzFGxM8=
X-Received: by 2002:a05:6122:3697:b0:4b6:dbfd:f89b with SMTP id
 ec23-20020a056122369700b004b6dbfdf89bmr1029208vkb.27.1705893272179; Sun, 21
 Jan 2024 19:14:32 -0800 (PST)
MIME-Version: 1.0
References: <20240116205817.344178-1-dbarboza@ventanamicro.com>
 <20240116205817.344178-14-dbarboza@ventanamicro.com>
In-Reply-To: <20240116205817.344178-14-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 22 Jan 2024 13:14:06 +1000
Message-ID: <CAKmqyKMgutEUq2Rpsi+8HGUN0LRyWWQXV6+OiAzqN5xTDnvG7Q@mail.gmail.com>
Subject: Re: [PATCH v3 13/13] target/riscv/cpu.c: remove cpu->cfg.vlen
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com, richard.henderson@linaro.org, max.chou@sifive.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::936;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x936.google.com
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

On Wed, Jan 17, 2024 at 7:03=E2=80=AFAM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> There is no need to keep both 'vlen' and 'vlenb'. All existing code
> that requires 'vlen' is retrieving it via 'vlenb << 3'.
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c         | 8 +++-----
>  target/riscv/cpu_cfg.h     | 1 -
>  target/riscv/tcg/tcg-cpu.c | 4 +++-
>  3 files changed, 6 insertions(+), 7 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index f4261d2ffc..7b3f69d3fb 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -1313,7 +1313,6 @@ static void riscv_cpu_init(Object *obj)
>
>      /* Default values for non-bool cpu properties */
>      cpu->cfg.pmu_mask =3D MAKE_64BIT_MASK(3, 16);
> -    cpu->cfg.vlen =3D 128;
>      cpu->cfg.vlenb =3D 128 >> 3;
>      cpu->cfg.elen =3D 64;
>      cpu->env.vext_ver =3D VEXT_VERSION_1_00_0;
> @@ -1802,22 +1801,21 @@ static void prop_vlen_set(Object *obj, Visitor *v=
, const char *name,
>          return;
>      }
>
> -    if (value !=3D cpu->cfg.vlen && riscv_cpu_is_vendor(obj)) {
> +    if (value !=3D cpu->cfg.vlenb && riscv_cpu_is_vendor(obj)) {
>          cpu_set_prop_err(cpu, name, errp);
>          error_append_hint(errp, "Current '%s' val: %u\n",
> -                          name, cpu->cfg.vlen);
> +                          name, cpu->cfg.vlenb << 3);
>          return;
>      }
>
>      cpu_option_add_user_setting(name, value);
> -    cpu->cfg.vlen =3D value;
>      cpu->cfg.vlenb =3D value >> 3;
>  }
>
>  static void prop_vlen_get(Object *obj, Visitor *v, const char *name,
>                           void *opaque, Error **errp)
>  {
> -    uint16_t value =3D RISCV_CPU(obj)->cfg.vlen;
> +    uint16_t value =3D RISCV_CPU(obj)->cfg.vlenb << 3;
>
>      visit_type_uint16(v, name, &value, errp);
>  }
> diff --git a/target/riscv/cpu_cfg.h b/target/riscv/cpu_cfg.h
> index 50479dd72f..e241922f89 100644
> --- a/target/riscv/cpu_cfg.h
> +++ b/target/riscv/cpu_cfg.h
> @@ -139,7 +139,6 @@ struct RISCVCPUConfig {
>      bool ext_XVentanaCondOps;
>
>      uint32_t pmu_mask;
> -    uint16_t vlen;
>      uint16_t vlenb;
>      uint16_t elen;
>      uint16_t cbom_blocksize;
> diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
> index daff0b8f60..667421b0b7 100644
> --- a/target/riscv/tcg/tcg-cpu.c
> +++ b/target/riscv/tcg/tcg-cpu.c
> @@ -298,7 +298,9 @@ static void riscv_cpu_validate_misa_mxl(RISCVCPU *cpu=
, Error **errp)
>  static void riscv_cpu_validate_v(CPURISCVState *env, RISCVCPUConfig *cfg=
,
>                                   Error **errp)
>  {
> -    if (cfg->vlen > RV_VLEN_MAX || cfg->vlen < 128) {
> +    uint32_t vlen =3D cfg->vlenb << 3;
> +
> +    if (vlen > RV_VLEN_MAX || vlen < 128) {
>          error_setg(errp,
>                     "Vector extension implementation only supports VLEN "
>                     "in the range [128, %d]", RV_VLEN_MAX);
> --
> 2.43.0
>
>

