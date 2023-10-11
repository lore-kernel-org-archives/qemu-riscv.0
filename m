Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6BB7CD98E9
	for <qemu-riscv@archiver.kernel.org>; Wed, 11 Oct 2023 03:04:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qqPVj-0003A0-49; Tue, 10 Oct 2023 23:03:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qqPVh-00039J-49; Tue, 10 Oct 2023 23:03:45 -0400
Received: from mail-ua1-x92a.google.com ([2607:f8b0:4864:20::92a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qqPVf-0001Gs-NE; Tue, 10 Oct 2023 23:03:44 -0400
Received: by mail-ua1-x92a.google.com with SMTP id
 a1e0cc1a2514c-7b610279c8aso409612241.3; 
 Tue, 10 Oct 2023 20:03:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696993422; x=1697598222; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HEG/9xf2lPbUjPxy8+UWItvfcganGBz6u/2yK5De5kU=;
 b=gAMIljBY0yM3mGShuP9uoC6ROa8uNxNknOjpRFFL8ep6xTgpq2hAVbPgu3m+tOEnz8
 wEK5F2ygKzPp0BVyDADNAsb+RzyVebW+eoJ8b1uT79R8qQTgBSkmvmzUOKM+GfSK8aJN
 ko5Ee5Lg6q5QpJKs5K3PAluxh3q91LgD6bbNWtHHumlny0zSdvy2iFjYUp06Fc/22tlf
 DWA97Uo0CCpSfTjxzhslHCghSDibAXSlPK+feynN3GNi1q8LaFvP7mqg9nIqrUo219jy
 WRDXUYdKLsEAWWSqtmy84gQaJP6BPcDLX1YCLMBTqBjR9+Uf7q+l7w8WnWYzivJ6W8zs
 LLjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696993422; x=1697598222;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HEG/9xf2lPbUjPxy8+UWItvfcganGBz6u/2yK5De5kU=;
 b=hCWY4D18Gn+c8BPfrGnwdmZ4OBAF4NgD7Wo1e311uilY3wKvY8VbEVvXeOPsOamYMs
 WLreTv72Pz5zSzZB2nKJm2+s7y/gsxauEmhzZ34PtrrY6pCmFGwu4prHivQv95dBzW/9
 r4WSWgb2VphvG9eTtr7pLsHcy/TynVPHtf/DLxTq0EaDAUDuPFjG1B1DptO2eJvaK+aQ
 18ozihoBCz27qRxQ9PmDtgvxI0SyIb8rgraEPEqftLgWZ/gryBDG0fA6LMyO87i++9sC
 R3rR6leGQ81L9CHtmhGdytqkl8ryx5bboONsZJnEmAbmzDnOFYL+7p4ZhJLPcpejArj0
 0Wig==
X-Gm-Message-State: AOJu0Yyg3Ko5RQoBExUcaXscbIqjNcxF5yP+pEdfiH+VX0OSK402Js+k
 Wd3SpXF+jvRJGLRrFBdpzltDa842mKtI14XdJEk=
X-Google-Smtp-Source: AGHT+IFc1svEpcAuBvdQf0d4pgc9aiMqQl0ssbjEbg5xGsUwUCzJEuExSmmSwIpt7U5LRYdDkTv/BjlgsMvkK+V0xpI=
X-Received: by 2002:a67:fdc1:0:b0:450:f5cb:c3ce with SMTP id
 l1-20020a67fdc1000000b00450f5cbc3cemr19703680vsq.17.1696993422148; Tue, 10
 Oct 2023 20:03:42 -0700 (PDT)
MIME-Version: 1.0
References: <20231006132134.1135297-1-dbarboza@ventanamicro.com>
 <20231006132134.1135297-8-dbarboza@ventanamicro.com>
In-Reply-To: <20231006132134.1135297-8-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 11 Oct 2023 13:03:15 +1000
Message-ID: <CAKmqyKMGOzQsQq-NGVw=5wCZKgUO481E7fRVpZQp+sNuag3a0g@mail.gmail.com>
Subject: Re: [PATCH v2 07/10] target/riscv/tcg: add MISA user options hash
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::92a;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x92a.google.com
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On Sat, Oct 7, 2023 at 12:25=E2=80=AFAM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> We already track user choice for multi-letter extensions because we
> needed to honor user choice when enabling/disabling extensions during
> realize(). We refrained from adding the same mechanism for MISA
> extensions since we didn't need it.
>
> Profile support requires tne need to check for user choice for MISA
> extensions, so let's add the corresponding hash now. It works like the
> existing multi-letter hash (multi_ext_user_opts) but tracking MISA bits
> options in the cpu_set_misa_ext_cfg() callback.
>
> Note that we can't re-use the same hash from multi-letter extensions
> because that hash uses cpu->cfg offsets as keys, while for MISA
> extensions we're using MISA bits as keys.
>
> After adding the user hash in cpu_set_misa_ext_cfg(), setting default
> values with object_property_set_bool() in add_misa_properties() will end
> up marking the user choice hash with them. Set the default value
> manually to avoid it.
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/tcg/tcg-cpu.c | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)
>
> diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
> index 8fb77e9e35..58de4428a9 100644
> --- a/target/riscv/tcg/tcg-cpu.c
> +++ b/target/riscv/tcg/tcg-cpu.c
> @@ -34,6 +34,7 @@
>
>  /* Hash that stores user set extensions */
>  static GHashTable *multi_ext_user_opts;
> +static GHashTable *misa_ext_user_opts;
>
>  static bool cpu_cfg_ext_is_user_set(uint32_t ext_offset)
>  {
> @@ -689,6 +690,10 @@ static void cpu_set_misa_ext_cfg(Object *obj, Visito=
r *v, const char *name,
>          return;
>      }
>
> +    g_hash_table_insert(misa_ext_user_opts,
> +                        GUINT_TO_POINTER(misa_bit),
> +                        (gpointer)value);
> +
>      prev_val =3D env->misa_ext & misa_bit;
>
>      if (value =3D=3D prev_val) {
> @@ -752,6 +757,7 @@ static const RISCVCPUMisaExtConfig misa_ext_cfgs[] =
=3D {
>   */
>  static void riscv_cpu_add_misa_properties(Object *cpu_obj)
>  {
> +    CPURISCVState *env =3D &RISCV_CPU(cpu_obj)->env;
>      bool use_def_vals =3D riscv_cpu_is_generic(cpu_obj);
>      int i;
>
> @@ -772,7 +778,13 @@ static void riscv_cpu_add_misa_properties(Object *cp=
u_obj)
>                              NULL, (void *)misa_cfg);
>          object_property_set_description(cpu_obj, name, desc);
>          if (use_def_vals) {
> -            object_property_set_bool(cpu_obj, name, misa_cfg->enabled, N=
ULL);
> +            if (misa_cfg->enabled) {
> +                env->misa_ext |=3D bit;
> +                env->misa_ext_mask |=3D bit;
> +            } else {
> +                env->misa_ext &=3D ~bit;
> +                env->misa_ext_mask &=3D ~bit;
> +            }
>          }
>      }
>  }
> @@ -967,6 +979,7 @@ static void tcg_cpu_instance_init(CPUState *cs)
>      RISCVCPU *cpu =3D RISCV_CPU(cs);
>      Object *obj =3D OBJECT(cpu);
>
> +    misa_ext_user_opts =3D g_hash_table_new(NULL, g_direct_equal);
>      multi_ext_user_opts =3D g_hash_table_new(NULL, g_direct_equal);
>      riscv_cpu_add_user_properties(obj);
>
> --
> 2.41.0
>
>

