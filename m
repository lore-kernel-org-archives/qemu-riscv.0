Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F364E80A84
	for <qemu-riscv@archiver.kernel.org>; Wed, 27 Sep 2023 04:59:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qlMdI-00035z-Oj; Wed, 27 Sep 2023 00:58:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qlMdG-00035O-Or; Wed, 27 Sep 2023 00:58:42 -0400
Received: from mail-vs1-xe36.google.com ([2607:f8b0:4864:20::e36])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qlMdF-0000r9-61; Wed, 27 Sep 2023 00:58:42 -0400
Received: by mail-vs1-xe36.google.com with SMTP id
 ada2fe7eead31-45269fe9d6bso4743845137.2; 
 Tue, 26 Sep 2023 21:58:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695790716; x=1696395516; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bHCBLUlfWdk144iXgWGACMvFufw35RZLwjTVgx+u+a0=;
 b=F+vc3azAyCJoCI0DQtbxvC83UwIQgbNDRCSqAt4TX0L3BVbdb1JCj9um42dZZVbdvL
 CaEp4ImjM6rT6NmJ+Rqrlzqadm1KGQl7Qsx72M5lV8zmPpji4bAGAJDwB7J+qjeje5lK
 cL6PHUCVkyZ/qFM1aqbpSGc85dNGIx9dJSWVszxL7l2wj96BGEU8tuSBcagBwclHPzz/
 6wHkHzD6V0j2FKV6K+YKmP6nxThy2Y/ksweUsk6fR3BgAn3YbjE334CKTuay+D4o5kHE
 KEvQNQGt7cLxAQ3owLAHbJcWhk/hvMrrK2Lwrsbz7wxhtC37HPGd1IZpowco8NCXpCuu
 FdIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695790716; x=1696395516;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bHCBLUlfWdk144iXgWGACMvFufw35RZLwjTVgx+u+a0=;
 b=Ll3md287MMSMSLse8b8RJzB13o7KG708ONjz/rUJZb8TaI6hHwlL725w3o2g26DhbN
 x1P3xMHRBYrNxqatx54Twd+9+NQADBia+XrzfyYdrMpYRlySPbj0A5/cHUMvyExtodut
 hfOOBPStg58AckFdtZqB2Wtlodt+67apRdDrPyYxpLVfnoAMv7ExcoyawXuATMLmwWvd
 9v1bpyRoBVSBGR1uGP/7tj/QqPBGDDsP2Ndlf4VqQtcoSBs15uLiQ43JmeyBhSWVqRkA
 yTRuteZEZhHeHouwArfzci7NifQMAbEnMUPx2p5LXY2bwvYpwIxOyiMJG22Lx1wpGKK9
 1d9Q==
X-Gm-Message-State: AOJu0Yz8LU4exCeProXTOBwU90KMvCmemXeimx9XvfR4i6dlTDRuzh+g
 g6tb+iQRRgWSu/+Wfk/p9RjS5ao2WDpmH7MiqSg=
X-Google-Smtp-Source: AGHT+IHg9WwPCAOcVHiKzhzQ/NMxRMJO7nhEs4FjXOLXgi/ACe8ekYyeD54R4ceahM4Fwhxtil6o26JqyHaKr/gtp1E=
X-Received: by 2002:a67:e95a:0:b0:44e:b570:3fae with SMTP id
 p26-20020a67e95a000000b0044eb5703faemr1130056vso.11.1695790715977; Tue, 26
 Sep 2023 21:58:35 -0700 (PDT)
MIME-Version: 1.0
References: <20230926183109.165878-1-dbarboza@ventanamicro.com>
 <20230926183109.165878-2-dbarboza@ventanamicro.com>
In-Reply-To: <20230926183109.165878-2-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 27 Sep 2023 14:58:09 +1000
Message-ID: <CAKmqyKNJHT+bWN-Es5mZLtH1Q2NnE=GDChhZhvnBPvON=V0DuA@mail.gmail.com>
Subject: Re: [PATCH 1/2] target/riscv: add riscv_cpu_get_name()
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e36;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe36.google.com
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

On Wed, Sep 27, 2023 at 5:35=E2=80=AFAM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> We'll introduce generic errors that will output a CPU type name via its
> RISCVCPU pointer. Create a helper for that.
>
> Use the helper in tcg_cpu_realizefn() instead of hardcoding the 'host'
> CPU name.
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c         | 11 +++++++++++
>  target/riscv/cpu.h         |  1 +
>  target/riscv/tcg/tcg-cpu.c |  4 +++-
>  3 files changed, 15 insertions(+), 1 deletion(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index eeeb08a35a..521bb88538 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -643,6 +643,17 @@ static ObjectClass *riscv_cpu_class_by_name(const ch=
ar *cpu_model)
>      return oc;
>  }
>
> +char *riscv_cpu_get_name(RISCVCPU *cpu)
> +{
> +    RISCVCPUClass *rcc =3D RISCV_CPU_GET_CLASS(cpu);
> +    const char *typename =3D object_class_get_name(OBJECT_CLASS(rcc));
> +
> +    g_assert(g_str_has_suffix(typename, RISCV_CPU_TYPE_SUFFIX));
> +
> +    return g_strndup(typename,
> +                     strlen(typename) - strlen(RISCV_CPU_TYPE_SUFFIX));
> +}
> +
>  static void riscv_cpu_dump_state(CPUState *cs, FILE *f, int flags)
>  {
>      RISCVCPU *cpu =3D RISCV_CPU(cs);
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 219fe2e9b5..3f11e69223 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -730,6 +730,7 @@ typedef struct isa_ext_data {
>      int ext_enable_offset;
>  } RISCVIsaExtData;
>  extern const RISCVIsaExtData isa_edata_arr[];
> +char *riscv_cpu_get_name(RISCVCPU *cpu);
>
>  void riscv_add_satp_mode_properties(Object *obj);
>
> diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
> index 8c052d6fcd..f31aa9bcc4 100644
> --- a/target/riscv/tcg/tcg-cpu.c
> +++ b/target/riscv/tcg/tcg-cpu.c
> @@ -563,7 +563,9 @@ static bool tcg_cpu_realizefn(CPUState *cs, Error **e=
rrp)
>      Error *local_err =3D NULL;
>
>      if (object_dynamic_cast(OBJECT(cpu), TYPE_RISCV_CPU_HOST)) {
> -        error_setg(errp, "'host' CPU is not compatible with TCG accelera=
tion");
> +        g_autofree char *name =3D riscv_cpu_get_name(cpu);
> +        error_setg(errp, "'%s' CPU is not compatible with TCG accelerati=
on",
> +                   name);
>          return false;
>      }
>
> --
> 2.41.0
>
>

