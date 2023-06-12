Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC0F5C7EE23
	for <qemu-riscv@archiver.kernel.org>; Mon, 12 Jun 2023 03:56:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q8Yfi-0000gG-9o; Sun, 11 Jun 2023 23:56:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1q8YfZ-0000cv-E1; Sun, 11 Jun 2023 23:56:42 -0400
Received: from mail-vk1-xa2a.google.com ([2607:f8b0:4864:20::a2a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1q8YfX-0004SV-RV; Sun, 11 Jun 2023 23:56:41 -0400
Received: by mail-vk1-xa2a.google.com with SMTP id
 71dfb90a1353d-46010179da6so998023e0c.0; 
 Sun, 11 Jun 2023 20:56:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1686542198; x=1689134198;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5En8uQ2/DZUKUJcVNjpDapGMc7ZG8+Q+/gbvYu4O98Y=;
 b=bQvfv91Lf4FiBV3h6l/psVVkcV6egO+riZe46OQ+YbGWe86OP4m7ljO8Jve0ioUlww
 8b0ctibhT80YpFr9/cRItM0nrG6f3QaExJWuiE34tNb+J2iTviPpGngopB6Z7Uk26HI1
 EJTf/3D5xPefkCJL0cYn6D9sfNKQ3oUrmoqoBirCweAFDomTsLolPpY9EyKTQDf9rOEz
 v9bjTTAa56EASHswODs9ta6391rzHMbhcig5czOZa7sRp2Qqu/X+IdnRzxkxV+cBaHV7
 62VdVrM7wWoCden8WgCiYDQNMmrOtfzuZtzriw2gMmXlYgiV024EmMaIml0qXbGG0kte
 vJkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686542198; x=1689134198;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5En8uQ2/DZUKUJcVNjpDapGMc7ZG8+Q+/gbvYu4O98Y=;
 b=goa/qFIwnafGo/3QDB6DLog3wdfUBUneb991/il340uF+qgh6BYz19320AS+vSzsbe
 5+F0JkamrwWbZ8Wh1o5EVRMtUtzjSora7lLDCD/tQlNSYwOoNpE0lhlApcWO5DfCcLLb
 6GG30ZrCnJrE06TY6sjwPDt8We+YhJjQp1Ot0MNbVxd+jq7ufN1d7PTQh0Bxmx+z2wqF
 faeOVMXrYhF6C1e2U0Yoprz5LjBtWj0pgIngsszck0lxo1axUGJtSqW7z4Xrgei2NlYV
 +VsY6oC5vHIWoCy4krkcf3dPJR1ZsfOZ1DLIbCaNH90cCW1wl4C5CbxYIO6FoDHAU+wy
 bcqQ==
X-Gm-Message-State: AC+VfDx0DIgjtkcklaRyOeZZQEnZhrMPRoK4gMuVGGEPkDrTsy3XoZFh
 rE3OHxxYG0nF7/A2ESaEGqhumwN4xnYFkQro1R8=
X-Google-Smtp-Source: ACHHUZ6ULjmUHK9JC3kSer0ItdfJkBADocp1qRTkdLxwzqpc9UtYcLrG/VgZNtoX7Y2Gm+xNQfnNQJ3Y5OCoFZokEu8=
X-Received: by 2002:a1f:dec3:0:b0:450:56f:947c with SMTP id
 v186-20020a1fdec3000000b00450056f947cmr2318529vkg.14.1686542198265; Sun, 11
 Jun 2023 20:56:38 -0700 (PDT)
MIME-Version: 1.0
References: <20230530194623.272652-1-dbarboza@ventanamicro.com>
 <20230530194623.272652-4-dbarboza@ventanamicro.com>
In-Reply-To: <20230530194623.272652-4-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 12 Jun 2023 13:56:12 +1000
Message-ID: <CAKmqyKNm1cH+fqqNKtm6+bKovdCqajoAcbTpWtA7BH=wLK5j+Q@mail.gmail.com>
Subject: Re: [PATCH 03/16] target/riscv/cpu.c: restrict 'mvendorid' value
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2a;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa2a.google.com
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

On Wed, May 31, 2023 at 5:49=E2=80=AFAM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> We're going to change the handling of mvendorid/marchid/mimpid by the
> KVM driver. Since these are always present in all CPUs let's put the
> same validation for everyone.
>
> It doesn't make sense to allow 'mvendorid' to be different than it
> is already set in named (vendor) CPUs. Generic (dynamic) CPUs can have
> any 'mvendorid' they want.
>
> Change 'mvendorid' to be a class property created via
> 'object_class_property_add', instead of using the DEFINE_PROP_UINT32()
> macro. This allow us to define a custom setter for it that will verify,
> for named CPUs, if mvendorid is different than it is already set by the
> CPU. This is the error thrown for the 'veyron-v1' CPU if 'mvendorid' is
> set to an invalid value:
>
> $ qemu-system-riscv64 -M virt -nographic -cpu veyron-v1,mvendorid=3D2
> qemu-system-riscv64: can't apply global veyron-v1-riscv-cpu.mvendorid=3D2=
:
>     Unable to change veyron-v1-riscv-cpu mvendorid (0x61f)

Is this something we want to enforce? What if someone wanted to test
using the veyron-v1 CPU but they wanted to change some properties. I
don't see an advantage in not letting them do that

Alistair

>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>  target/riscv/cpu.c | 31 ++++++++++++++++++++++++++++++-
>  1 file changed, 30 insertions(+), 1 deletion(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 72f5433776..bcd69bb032 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -1723,7 +1723,6 @@ static void riscv_cpu_add_user_properties(Object *o=
bj)
>  static Property riscv_cpu_properties[] =3D {
>      DEFINE_PROP_BOOL("debug", RISCVCPU, cfg.debug, true),
>
> -    DEFINE_PROP_UINT32("mvendorid", RISCVCPU, cfg.mvendorid, 0),
>      DEFINE_PROP_UINT64("marchid", RISCVCPU, cfg.marchid, RISCV_CPU_MARCH=
ID),
>      DEFINE_PROP_UINT64("mimpid", RISCVCPU, cfg.mimpid, RISCV_CPU_MIMPID)=
,
>
> @@ -1810,6 +1809,32 @@ static const struct TCGCPUOps riscv_tcg_ops =3D {
>  #endif /* !CONFIG_USER_ONLY */
>  };
>
> +static bool riscv_cpu_is_dynamic(Object *cpu_obj)
> +{
> +    return object_dynamic_cast(cpu_obj, TYPE_RISCV_DYNAMIC_CPU) !=3D NUL=
L;
> +}
> +
> +static void cpu_set_mvendorid(Object *obj, Visitor *v, const char *name,
> +                              void *opaque, Error **errp)
> +{
> +    bool dynamic_cpu =3D riscv_cpu_is_dynamic(obj);
> +    RISCVCPU *cpu =3D RISCV_CPU(obj);
> +    uint32_t prev_val =3D cpu->cfg.mvendorid;
> +    uint32_t value;
> +
> +    if (!visit_type_uint32(v, name, &value, errp)) {
> +        return;
> +    }
> +
> +    if (!dynamic_cpu && prev_val !=3D value) {
> +        error_setg(errp, "Unable to change %s mvendorid (0x%x)",
> +                   object_get_typename(obj), prev_val);
> +        return;
> +    }
> +
> +    cpu->cfg.mvendorid =3D value;
> +}
> +
>  static void riscv_cpu_class_init(ObjectClass *c, void *data)
>  {
>      RISCVCPUClass *mcc =3D RISCV_CPU_CLASS(c);
> @@ -1841,6 +1866,10 @@ static void riscv_cpu_class_init(ObjectClass *c, v=
oid *data)
>      cc->gdb_get_dynamic_xml =3D riscv_gdb_get_dynamic_xml;
>      cc->tcg_ops =3D &riscv_tcg_ops;
>
> +    object_class_property_add(c, "mvendorid", "uint32", NULL,
> +                              cpu_set_mvendorid,
> +                              NULL, NULL);
> +
>      device_class_set_props(dc, riscv_cpu_properties);
>  }
>
> --
> 2.40.1
>
>

