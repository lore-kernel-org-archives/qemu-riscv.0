Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84ABEC47073
	for <qemu-riscv@archiver.kernel.org>; Thu,  4 Jan 2024 05:14:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rLG36-0000dj-2W; Thu, 04 Jan 2024 00:13:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rLG33-0000bv-C4; Thu, 04 Jan 2024 00:13:41 -0500
Received: from mail-vk1-xa2c.google.com ([2607:f8b0:4864:20::a2c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rLG2z-0001Tg-Da; Thu, 04 Jan 2024 00:13:40 -0500
Received: by mail-vk1-xa2c.google.com with SMTP id
 71dfb90a1353d-4b71b86ef81so45242e0c.2; 
 Wed, 03 Jan 2024 21:13:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704345216; x=1704950016; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1xclxlrth9yjII1kvQGCSc5SJkZ7mX0sPBJL13o8Qgk=;
 b=KxeGeeFFRYpr6yX4KMWxhqcsHFSm/cv+K3gnM2g+skhil+6y+TUkByA1vI9shWxN59
 cdF5E6PxAfkq4vETigPaO2WP/B5hA3BTrFZOYXUcwzcM05iLSH0rdWzcjdEHRhnMkKbc
 Q3KJHSmHquIGc5lMXlBT+dmtGEfhjVZH/UMuRX08nkV2OmyyrViSYXXM+mxEoQE39imU
 3R5pmRzXWISo8vekKRaZZLxeceTUYDp/XXkSkP8JB4riVHBfoj88pegT4rC2+M5tjuL1
 fZEGhGbIrxFU4vHw9JovALe4GSq6t+4znICVSXMSEiUhmoUnOq6F6Do9O8ceTtxtMmXO
 vfkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704345216; x=1704950016;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1xclxlrth9yjII1kvQGCSc5SJkZ7mX0sPBJL13o8Qgk=;
 b=MEyJQXwgVx4OLB0Am+tjH34HmYTuAnwofewly70poM6byin5gSy4ZqyYn0VzYpC9RH
 potsFXLqJ2VcCaYkUqJx1hN/7AGuenjhnuMXwcxwQr1YdS6BCt6ytYX3N7oxsH26X0JT
 sLmk59gQ69wQmTS3clyeWbs/7UZl8D16AHpAL0jMv7CnII1EGYnNsQ6MbVTd2OQ0+TTA
 FVhZew7Rd+yTX258pX4EbCRiwLeze6k3QQGu4Zr4kTjoh9E0enrrP3NAW8Z7Min6BQ+Z
 kxhpwN88M0/stiXbrVPjxVC3mdTl6BrmI0KXscy+KbbeVUXceLN1D7h2qzjZZh8am6Xj
 Qnng==
X-Gm-Message-State: AOJu0Yy70o6RYfdHDjqrC9pcmrLDlfwJDgIOYRQaDFSecufyWMsTG7Gt
 7L60vvUSOlnqAoIVwT5Si1kmleKgpbcdDTE/mFg=
X-Google-Smtp-Source: AGHT+IHJBmgKQ+GBpdN8v25kus+CvATmnYHYJ+Q9tUY5mwnaf/CH73uJ7M1kQB9IF5f/c6z9K7609KTrL1d6xbFC17k=
X-Received: by 2002:a05:6122:16a2:b0:4b7:422b:d7c3 with SMTP id
 34-20020a05612216a200b004b7422bd7c3mr63604vkl.20.1704345215655; Wed, 03 Jan
 2024 21:13:35 -0800 (PST)
MIME-Version: 1.0
References: <20231218125334.37184-1-dbarboza@ventanamicro.com>
 <20231218125334.37184-8-dbarboza@ventanamicro.com>
In-Reply-To: <20231218125334.37184-8-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 4 Jan 2024 15:13:09 +1000
Message-ID: <CAKmqyKNHTehKRnmR6qRocj0+o_J-O6p_zxhei6JCyH60hPQ67g@mail.gmail.com>
Subject: Re: [PATCH v13 07/26] riscv-qmp-cmds.c: expose named features in
 cpu_model_expansion
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com, ajones@ventanamicro.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2c;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa2c.google.com
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

On Mon, Dec 18, 2023 at 10:57=E2=80=AFPM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> Named features (zic64b the sole example at this moment) aren't expose to
> users, thus we need another way to expose them.
>
> Go through each named feature, get its boolean value, do the needed
> conversions (bool to qbool, qbool to QObject) and add it to output dict.
>
> Another adjustment is needed: named features are evaluated during
> finalize(), so riscv_cpu_finalize_features() needs to be mandatory
> regardless of whether we have an input dict or not. Otherwise zic64b
> will always return 'false', which is incorrect: the default values of
> cache blocksizes ([cbom/cbop/cboz]_blocksize) are set to 64, satisfying
> the conditions for zic64b.
>
> Here's an API usage example after this patch:
>
>  $ ./build/qemu-system-riscv64 -S -M virt -display none
>     -qmp tcp:localhost:1234,server,wait=3Doff
>
>  $ ./scripts/qmp/qmp-shell localhost:1234
> Welcome to the QMP low-level shell!
> Connected to QEMU 8.1.50
>
> (QEMU) query-cpu-model-expansion type=3Dfull model=3D{"name":"rv64"}
> {"return": {"model":
>     {"name": "rv64", "props": {... "zic64b": true, ...}}}}
>
> zic64b is set to 'true', as expected, since all cache sizes are 64
> bytes by default.
>
> If we change one of the cache blocksizes, zic64b is returned as 'false':
>
> (QEMU) query-cpu-model-expansion type=3Dfull model=3D{"name":"rv64","prop=
s":{"cbom_blocksize":128}}
> {"return": {"model":
>     {"name": "rv64", "props": {... "zic64b": false, ...}}}}
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/riscv-qmp-cmds.c | 30 +++++++++++++++++++++++++-----
>  1 file changed, 25 insertions(+), 5 deletions(-)
>
> diff --git a/target/riscv/riscv-qmp-cmds.c b/target/riscv/riscv-qmp-cmds.=
c
> index 2f2dbae7c8..5ada279776 100644
> --- a/target/riscv/riscv-qmp-cmds.c
> +++ b/target/riscv/riscv-qmp-cmds.c
> @@ -26,6 +26,7 @@
>
>  #include "qapi/error.h"
>  #include "qapi/qapi-commands-machine-target.h"
> +#include "qapi/qmp/qbool.h"
>  #include "qapi/qmp/qdict.h"
>  #include "qapi/qmp/qerror.h"
>  #include "qapi/qobject-input-visitor.h"
> @@ -99,6 +100,22 @@ static void riscv_obj_add_multiext_props(Object *obj,=
 QDict *qdict_out,
>      }
>  }
>
> +static void riscv_obj_add_named_feats_qdict(Object *obj, QDict *qdict_ou=
t)
> +{
> +    const RISCVCPUMultiExtConfig *named_cfg;
> +    RISCVCPU *cpu =3D RISCV_CPU(obj);
> +    QObject *value;
> +    bool flag_val;
> +
> +    for (int i =3D 0; riscv_cpu_named_features[i].name !=3D NULL; i++) {
> +        named_cfg =3D &riscv_cpu_named_features[i];
> +        flag_val =3D isa_ext_is_enabled(cpu, named_cfg->offset);
> +        value =3D QOBJECT(qbool_from_bool(flag_val));
> +
> +        qdict_put_obj(qdict_out, named_cfg->name, value);
> +    }
> +}
> +
>  static void riscv_cpuobj_validate_qdict_in(Object *obj, QObject *props,
>                                             const QDict *qdict_in,
>                                             Error **errp)
> @@ -129,11 +146,6 @@ static void riscv_cpuobj_validate_qdict_in(Object *o=
bj, QObject *props,
>          goto err;
>      }
>
> -    riscv_cpu_finalize_features(RISCV_CPU(obj), &local_err);
> -    if (local_err) {
> -        goto err;
> -    }
> -
>      visit_end_struct(visitor, NULL);
>
>  err:
> @@ -191,6 +203,13 @@ CpuModelExpansionInfo *qmp_query_cpu_model_expansion=
(CpuModelExpansionType type,
>          }
>      }
>
> +    riscv_cpu_finalize_features(RISCV_CPU(obj), &local_err);
> +    if (local_err) {
> +        error_propagate(errp, local_err);
> +        object_unref(obj);
> +        return NULL;
> +    }
> +
>      expansion_info =3D g_new0(CpuModelExpansionInfo, 1);
>      expansion_info->model =3D g_malloc0(sizeof(*expansion_info->model));
>      expansion_info->model->name =3D g_strdup(model->name);
> @@ -200,6 +219,7 @@ CpuModelExpansionInfo *qmp_query_cpu_model_expansion(=
CpuModelExpansionType type,
>      riscv_obj_add_multiext_props(obj, qdict_out, riscv_cpu_extensions);
>      riscv_obj_add_multiext_props(obj, qdict_out, riscv_cpu_experimental_=
exts);
>      riscv_obj_add_multiext_props(obj, qdict_out, riscv_cpu_vendor_exts);
> +    riscv_obj_add_named_feats_qdict(obj, qdict_out);
>
>      /* Add our CPU boolean options too */
>      riscv_obj_add_qdict_prop(obj, qdict_out, "mmu");
> --
> 2.43.0
>
>

