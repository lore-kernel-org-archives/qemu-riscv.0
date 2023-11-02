Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18BA3C4332F
	for <qemu-riscv@archiver.kernel.org>; Thu,  2 Nov 2023 02:38:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qyNbU-00019n-Jx; Wed, 01 Nov 2023 22:38:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qyNbT-00017X-6v; Wed, 01 Nov 2023 22:38:39 -0400
Received: from mail-vk1-xa32.google.com ([2607:f8b0:4864:20::a32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qyNbR-000322-G7; Wed, 01 Nov 2023 22:38:38 -0400
Received: by mail-vk1-xa32.google.com with SMTP id
 71dfb90a1353d-495eb6e2b80so181487e0c.1; 
 Wed, 01 Nov 2023 19:38:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698892716; x=1699497516; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=awry+c4/zeC6ayxEhtM2FRouX0yJ/SqSqnN5W06yaB8=;
 b=m682rI7ScAUcnR0Gcq2nXVK1BDy4IK+kIQ9xYK37+EcabwXq07NSbGvY0YTCIo+CeK
 yKC+RxXgHlEwm0jso9DpZYZ3TdoFG7tuR2stKDIZeZ7cjbxEMG9WkEEue33f5Dey+duu
 ZhmawL0Yjms1W5UpS4m8D1uef1VEzivmnk2DJDdX1Nd42taQK9PKPZ1BFvbweqpD4HqZ
 xazgcrPwXTyhVCCuafkuVGI9knvn6z8q/+kzYpdc52fYnQXP0xG9PO8kV9T6zJzPeM05
 2pT+Sq/3FcxqNc60WRXsV4GhAjasvRkX/KOF3QzX+yIJ7WLpF6ZZb224jOq18MSPGefM
 FoSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698892716; x=1699497516;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=awry+c4/zeC6ayxEhtM2FRouX0yJ/SqSqnN5W06yaB8=;
 b=amjoKqPLGs+wChyy3LvuYgwpNkog8IWm0jsNDGSa42+aXDEvQeVB+26uUzF27VJITV
 7SKOafE+IEb+KitKWsgREIfLfFvnFWjrRxTPvHLlSiwGpphGm4iqG7yYiWDYXcAMXTga
 oRDvlpzOwRVGhwXqy/qJvGXXSCYUiQ0H/TIurc/hs+0QgNc2CqM6pe3s8Ou4LVsmaAbE
 IdLIIdCozzUzoxZep2HFEEmmSI0FAHaJJtSkI4Y41ZqOaHbwzkdetgQl1RLEQN9jyR2E
 7simrw4aFfhT9L406XIYOVrY2NsG98M4LWej1QP6tv0VnapC/myFzIMCNY1cVdu704L1
 SkzQ==
X-Gm-Message-State: AOJu0YwmTyNqgW8BmwrCXH6CfOQgRu0MRlsuLS2zuWIcvS9eaNTH0MkU
 d3giCei1COLu8JCeweCE3JG4SEjRS2JOYMGlSu8=
X-Google-Smtp-Source: AGHT+IG1ohRUNRZ92R3h/pj/EUnLoPFI2WWNu/P7e+QsBSMMlJMAxs/qGlK85n4fCXF/YW/5lagGpaoHkEnK/lBCLi8=
X-Received: by 2002:a05:6122:150a:b0:496:1f95:209a with SMTP id
 d10-20020a056122150a00b004961f95209amr11934691vkq.15.1698892715860; Wed, 01
 Nov 2023 19:38:35 -0700 (PDT)
MIME-Version: 1.0
References: <20231101204204.345470-1-dbarboza@ventanamicro.com>
 <20231101204204.345470-3-dbarboza@ventanamicro.com>
In-Reply-To: <20231101204204.345470-3-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 2 Nov 2023 12:38:09 +1000
Message-ID: <CAKmqyKNVnf9fex7Uzzz++BbWCEb14xY4=d+aC5oHULd0WQSCPg@mail.gmail.com>
Subject: Re: [PATCH v8 02/19] target/riscv/tcg: do not use "!generic" CPU
 checks
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com, ajones@ventanamicro.com
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

On Thu, Nov 2, 2023 at 8:13=E2=80=AFAM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> Our current logic in get/setters of MISA and multi-letter extensions
> works because we have only 2 CPU types, generic and vendor, and by using
> "!generic" we're implying that we're talking about vendor CPUs. When addi=
ng
> a third CPU type this logic will break so let's handle it beforehand.
>
> In set_misa_ext_cfg() and set_multi_ext_cfg(), check for "vendor" cpu ins=
tead
> of "not generic". The "generic CPU" checks remaining are from
> riscv_cpu_add_misa_properties() and cpu_add_multi_ext_prop() before
> applying default values for the extensions.
>
> This leaves us with:
>
> - vendor CPUs will not allow extension enablement, all other CPUs will;
>
> - generic CPUs will inherit default values for extensions, all others
>   won't.
>
> And now we can add a new, third CPU type, that will allow extensions to
> be enabled and will not inherit defaults, without changing the existing
> logic.
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/tcg/tcg-cpu.c | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)
>
> diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
> index 093bda2e75..f54069d06f 100644
> --- a/target/riscv/tcg/tcg-cpu.c
> +++ b/target/riscv/tcg/tcg-cpu.c
> @@ -612,6 +612,11 @@ static bool riscv_cpu_is_generic(Object *cpu_obj)
>      return object_dynamic_cast(cpu_obj, TYPE_RISCV_DYNAMIC_CPU) !=3D NUL=
L;
>  }
>
> +static bool riscv_cpu_is_vendor(Object *cpu_obj)
> +{
> +    return object_dynamic_cast(cpu_obj, TYPE_RISCV_VENDOR_CPU) !=3D NULL=
;
> +}
> +
>  /*
>   * We'll get here via the following path:
>   *
> @@ -674,7 +679,7 @@ static void cpu_set_misa_ext_cfg(Object *obj, Visitor=
 *v, const char *name,
>      target_ulong misa_bit =3D misa_ext_cfg->misa_bit;
>      RISCVCPU *cpu =3D RISCV_CPU(obj);
>      CPURISCVState *env =3D &cpu->env;
> -    bool generic_cpu =3D riscv_cpu_is_generic(obj);
> +    bool vendor_cpu =3D riscv_cpu_is_vendor(obj);
>      bool prev_val, value;
>
>      if (!visit_type_bool(v, name, &value, errp)) {
> @@ -688,7 +693,7 @@ static void cpu_set_misa_ext_cfg(Object *obj, Visitor=
 *v, const char *name,
>      }
>
>      if (value) {
> -        if (!generic_cpu) {
> +        if (vendor_cpu) {
>              g_autofree char *cpuname =3D riscv_cpu_get_name(cpu);
>              error_setg(errp, "'%s' CPU does not allow enabling extension=
s",
>                         cpuname);
> @@ -793,7 +798,7 @@ static void cpu_set_multi_ext_cfg(Object *obj, Visito=
r *v, const char *name,
>  {
>      const RISCVCPUMultiExtConfig *multi_ext_cfg =3D opaque;
>      RISCVCPU *cpu =3D RISCV_CPU(obj);
> -    bool generic_cpu =3D riscv_cpu_is_generic(obj);
> +    bool vendor_cpu =3D riscv_cpu_is_vendor(obj);
>      bool prev_val, value;
>
>      if (!visit_type_bool(v, name, &value, errp)) {
> @@ -817,7 +822,7 @@ static void cpu_set_multi_ext_cfg(Object *obj, Visito=
r *v, const char *name,
>          return;
>      }
>
> -    if (value && !generic_cpu) {
> +    if (value && vendor_cpu) {
>          g_autofree char *cpuname =3D riscv_cpu_get_name(cpu);
>          error_setg(errp, "'%s' CPU does not allow enabling extensions",
>                     cpuname);
> --
> 2.41.0
>
>

