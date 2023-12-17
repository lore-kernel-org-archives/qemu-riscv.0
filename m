Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E65E5C3DA6E
	for <qemu-riscv@archiver.kernel.org>; Sun, 17 Dec 2023 23:32:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rF0bg-00006O-5t; Sun, 17 Dec 2023 18:31:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rF0bb-0008Uv-FL; Sun, 17 Dec 2023 18:31:31 -0500
Received: from mail-oo1-xc2a.google.com ([2607:f8b0:4864:20::c2a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rF0bZ-0000rN-SS; Sun, 17 Dec 2023 18:31:31 -0500
Received: by mail-oo1-xc2a.google.com with SMTP id
 006d021491bc7-59067ccb090so1773531eaf.1; 
 Sun, 17 Dec 2023 15:31:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702855888; x=1703460688; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hmvrTNVKpntJINm3U3Z/KBle5aKlIXKR6P6QP7zbpTg=;
 b=Mp312Iei0pClg8Mv/3wH4q/OphKrulwmLbzJ0S95+RhXvQsP5vCKJ8yJKA9evCf9bz
 j/BP9Bk56DYKD1Adr/RTr7zu+GZEI1ItsVWVxziMOTggoIiEQjzZV3YPMwSV3c0vUM1a
 y1LI8og3n8Cvib/h4IRNMTSkllPpyZY5plVzEkcr4IFiyaTNoKAHj7BNJDxwrZ9+n1t1
 gvlVQ5QxeUbRjx/38tcyLNrazYZbBxn24i9yxahRgDNexkuvxyRpfQKsvyO4dS0YJHx+
 IxTolbVkcbqdXCLUrTLgUm3qWakJhM6dnzD8nzynpI0Sg+ULoW5cfs1u86Zds5CngQNw
 4BWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702855888; x=1703460688;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hmvrTNVKpntJINm3U3Z/KBle5aKlIXKR6P6QP7zbpTg=;
 b=qXaO/IszplPEGINa/RnX/1TeIsplR0YDCPX6BJEUD4sOICO7Oh9WCUEQIwzqV5Vplq
 e8fxoWDaWWRKQ19TPpBl7E6Achkc7JLQGmkcSVZCZn/9ijhJ7Bko4C/IYrFFgMQTnpQI
 N7HcRE0goENI//UCmgOcMsTyTnU31BAwHA/jbjNswFtlMiW2jkNQs1wplo/bXSWTiRKu
 Zqpy8lqUDaCwuepPOJ1hKKI3uhJ87IPJPfPzlzmN0aPV1emOmWEM5X+CEIGayaSX+trR
 WCa815zyLci5GOoPC+J/iwyxAyZBADX8wLNfno76Xa+gSWtYezzNftxDY/771Rybkkrl
 xDuQ==
X-Gm-Message-State: AOJu0Yx7h9KJX40SNYiOcy+CLxjaoOPL7NqX0UJ0z6MtRvevtX8LUiVD
 9vvaZfQh//bIplK9KCJhm3v8dfv/0WAlwzntMwo=
X-Google-Smtp-Source: AGHT+IGDX/3aMT3Tt7JsP6B4t2877j1SNNnWqW+Iv1HB2mblmJKr4tvH3nt+6Y1B7L6BgU+0C8AAdvpN/X1wGRBObqE=
X-Received: by 2002:a05:6358:cc1e:b0:16d:bc07:7d2f with SMTP id
 gx30-20020a056358cc1e00b0016dbc077d2fmr12919156rwb.15.1702855887784; Sun, 17
 Dec 2023 15:31:27 -0800 (PST)
MIME-Version: 1.0
References: <20231211170732.2541368-1-dbarboza@ventanamicro.com>
In-Reply-To: <20231211170732.2541368-1-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 18 Dec 2023 09:31:01 +1000
Message-ID: <CAKmqyKOkXe-Jxn7WGSCom_4SK9oMF41=CYO5mgBdsMCC9hxmxQ@mail.gmail.com>
Subject: Re: [PATCH for-9.0] target/riscv/cpu.c: fix machine IDs getters
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com, ajones@ventanamicro.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2a;
 envelope-from=alistair23@gmail.com; helo=mail-oo1-xc2a.google.com
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

On Tue, Dec 12, 2023 at 3:08=E2=80=AFAM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> mvendorid is an uint32 property, mimpid/marchid are uint64 properties.
> But their getters are returning bools. The reason this went under the
> radar for this long is because we have no code using the getters.
>
> The problem can be seem via the 'qom-get' API though. Launching QEMU
> with the 'veyron-v1' CPU, a model with:
>
> VEYRON_V1_MVENDORID: 0x61f (1567)
> VEYRON_V1_MIMPID: 0x111 (273)
> VEYRON_V1_MARCHID: 0x8000000000010000 (9223372036854841344)
>
> This is what the API returns when retrieving these properties:
>
> (qemu) qom-get /machine/soc0/harts[0] mvendorid
> true
> (qemu) qom-get /machine/soc0/harts[0] mimpid
> true
> (qemu) qom-get /machine/soc0/harts[0] marchid
> true
>
> After this patch:
>
> (qemu) qom-get /machine/soc0/harts[0] mvendorid
> 1567
> (qemu) qom-get /machine/soc0/harts[0] mimpid
> 273
> (qemu) qom-get /machine/soc0/harts[0] marchid
> 9223372036854841344
>
> Fixes: 1e34150045 ("target/riscv/cpu.c: restrict 'mvendorid' value")
> Fixes: a1863ad368 ("target/riscv/cpu.c: restrict 'mimpid' value")
> Fixes: d6a427e2c0 ("target/riscv/cpu.c: restrict 'marchid' value")
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

Thanks!

Applied to riscv-to-apply.next

Alistair

> ---
>  target/riscv/cpu.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 83c7c0cf07..70bf10aa7c 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -1573,9 +1573,9 @@ static void cpu_set_mvendorid(Object *obj, Visitor =
*v, const char *name,
>  static void cpu_get_mvendorid(Object *obj, Visitor *v, const char *name,
>                                void *opaque, Error **errp)
>  {
> -    bool value =3D RISCV_CPU(obj)->cfg.mvendorid;
> +    uint32_t value =3D RISCV_CPU(obj)->cfg.mvendorid;
>
> -    visit_type_bool(v, name, &value, errp);
> +    visit_type_uint32(v, name, &value, errp);
>  }
>
>  static void cpu_set_mimpid(Object *obj, Visitor *v, const char *name,
> @@ -1602,9 +1602,9 @@ static void cpu_set_mimpid(Object *obj, Visitor *v,=
 const char *name,
>  static void cpu_get_mimpid(Object *obj, Visitor *v, const char *name,
>                             void *opaque, Error **errp)
>  {
> -    bool value =3D RISCV_CPU(obj)->cfg.mimpid;
> +    uint64_t value =3D RISCV_CPU(obj)->cfg.mimpid;
>
> -    visit_type_bool(v, name, &value, errp);
> +    visit_type_uint64(v, name, &value, errp);
>  }
>
>  static void cpu_set_marchid(Object *obj, Visitor *v, const char *name,
> @@ -1652,9 +1652,9 @@ static void cpu_set_marchid(Object *obj, Visitor *v=
, const char *name,
>  static void cpu_get_marchid(Object *obj, Visitor *v, const char *name,
>                             void *opaque, Error **errp)
>  {
> -    bool value =3D RISCV_CPU(obj)->cfg.marchid;
> +    uint64_t value =3D RISCV_CPU(obj)->cfg.marchid;
>
> -    visit_type_bool(v, name, &value, errp);
> +    visit_type_uint64(v, name, &value, errp);
>  }
>
>  static void riscv_cpu_class_init(ObjectClass *c, void *data)
> --
> 2.41.0
>
>

