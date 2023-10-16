Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACD70CDB474
	for <qemu-riscv@archiver.kernel.org>; Mon, 16 Oct 2023 05:27:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qsG81-0003NA-SB; Mon, 16 Oct 2023 01:26:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qsG80-0003MY-7E; Mon, 16 Oct 2023 01:26:56 -0400
Received: from mail-vk1-xa2c.google.com ([2607:f8b0:4864:20::a2c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qsG7y-0003vj-GC; Mon, 16 Oct 2023 01:26:55 -0400
Received: by mail-vk1-xa2c.google.com with SMTP id
 71dfb90a1353d-4a403fdebedso1593916e0c.1; 
 Sun, 15 Oct 2023 22:26:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697434013; x=1698038813; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lYkTPXzIPamgrFeqy/0g9xh8A1FBuy2HSshzvtgfsRQ=;
 b=YPVZL+qVkQi3lCVjiAnRekqeTDKumZJVLTnAnly70d8vAwG3ZpVBfwQrrxo5dgVssF
 s8NHQfA0fnjKk9+iNznuYP1Yg83qSrzE8CQh+cvb8kxLKxeosuc4G8zrlSamgRmFwX30
 VItBtQsFxvto5pq664w3TghFdBsiYaT8hDNOIKLz5c8r8oUprwGiKemBnqiew36KKinJ
 xsv4G94GZFzarLG43lDCQql00WOmxrwucmKQ8v16AQgMroDHvhObBirGzycEzit5Jof7
 Y5mbRrDkY0a6KF5nQ/Hdr7YiBQv7pDCKouYL9Y5C30aWxugItb4S37Rfm02Y4XEceqM7
 +cQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697434013; x=1698038813;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lYkTPXzIPamgrFeqy/0g9xh8A1FBuy2HSshzvtgfsRQ=;
 b=Yq9Cu50YCISQFMb2xaFc4ZgRQkOyOeZo6tHLF9ENId78orikVTTYtkvWGxwzp82L65
 3ZKB5kLypCQAx0zUR+v9pfn/WtcLncj6AqzkjlwJ5idBjKhayHmzo9d7vj+7pegc5zOo
 EP/ueMtvudD+1ATpoHZKJ5x2vSbQ6YVmdNooc/rSFLEA3KCUZgnindltZSzmKFlNQFTD
 LtM2eQEoJCEgcER59hEOG6votOnTFs1PDVgJz90hB2YVgpNSLM3lN02Ao0AuRctZRRTb
 Zt+PjthXIsGJfuXFatpVfWZnw4AmQ7C8C3DwZ1zj8/sqlQ48NWmttYNkYpL//mPhVM1k
 n/tg==
X-Gm-Message-State: AOJu0Yz9fZJyJJVY1leaoxqtotIW4w36dfa5Nuk7bqJgEo1jUsDO93np
 zbeYvoXHo8IALUKmvdEYNaBuNzKwJYflRV5sNBHCsUSCGNg=
X-Google-Smtp-Source: AGHT+IEd0NaI+PM5F/vPYqP50muCBeJ5gPA/c/17lcq1URrWAXjwbMUZ/z8DMbiyuyYeBaeTfsnoHfIpqlUuPlaXKaM=
X-Received: by 2002:a1f:dfc1:0:b0:490:c49e:3fe0 with SMTP id
 w184-20020a1fdfc1000000b00490c49e3fe0mr25339881vkg.11.1697434012758; Sun, 15
 Oct 2023 22:26:52 -0700 (PDT)
MIME-Version: 1.0
References: <20230926184019.166352-1-dbarboza@ventanamicro.com>
 <20230926184019.166352-5-dbarboza@ventanamicro.com>
In-Reply-To: <20230926184019.166352-5-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 16 Oct 2023 15:26:26 +1000
Message-ID: <CAKmqyKPsLbNf5EPsaj3gm3fmJ1CfFd=6-HyQVM_w+x5D4k=kJw@mail.gmail.com>
Subject: Re: [PATCH v2 4/6] target/riscv: handle custom props in
 qmp_query_cpu_model_expansion
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2c;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa2c.google.com
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

On Wed, Sep 27, 2023 at 4:42=E2=80=AFAM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> Callers can add 'props' when querying for a cpu model expansion to see
> if a given CPU model supports a certain criteria, and what's the
> resulting CPU object.
>
> If we have 'props' to handle, gather it in a QDict and use the new
> riscv_cpuobj_validate_qdict_in() helper to validate it. This helper will
> add the custom properties in the CPU object and validate it using
> riscv_cpu_finalize_features(). Users will be aware of validation errors
> if any occur, if not a CPU object with 'props' will be returned.
>
> Here's an example with the veyron-v1 vendor CPU. Disabling vendor CPU
> extensions is allowed, assuming the final config is valid. Disabling
> 'smstateen' is a valid expansion:
>
> (QEMU) query-cpu-model-expansion type=3Dfull model=3D{"name":"veyron-v1",=
"props":{"smstateen":false}}
> {"return": {"model": {"name": "veyron-v1", "props": {"zicond": false, ...=
, "smstateen": false, ...}
>
> But enabling extensions isn't allowed for vendor CPUs. E.g. enabling 'V'
> for the veyron-v1 CPU isn't allowed:
>
> (QEMU) query-cpu-model-expansion type=3Dfull model=3D{"name":"veyron-v1",=
"props":{"v":true}}
> {"error": {"class": "GenericError", "desc": "'veyron-v1' CPU does not all=
ow enabling extensions"}}
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/riscv-qmp-cmds.c | 65 +++++++++++++++++++++++++++++++++++
>  1 file changed, 65 insertions(+)
>
> diff --git a/target/riscv/riscv-qmp-cmds.c b/target/riscv/riscv-qmp-cmds.=
c
> index 2170562e3a..5b2d186c83 100644
> --- a/target/riscv/riscv-qmp-cmds.c
> +++ b/target/riscv/riscv-qmp-cmds.c
> @@ -27,6 +27,9 @@
>  #include "qapi/error.h"
>  #include "qapi/qapi-commands-machine-target.h"
>  #include "qapi/qmp/qdict.h"
> +#include "qapi/qmp/qerror.h"
> +#include "qapi/qobject-input-visitor.h"
> +#include "qapi/visitor.h"
>  #include "qom/qom-qobject.h"
>  #include "cpu-qom.h"
>  #include "cpu.h"
> @@ -83,14 +86,58 @@ static void riscv_obj_add_multiext_props(Object *obj,=
 QDict *qdict_out,
>      }
>  }
>
> +static void riscv_cpuobj_validate_qdict_in(Object *obj, QObject *props,
> +                                           const QDict *qdict_in,
> +                                           Error **errp)
> +{
> +    const QDictEntry *qe;
> +    Visitor *visitor;
> +    Error *local_err =3D NULL;
> +
> +    visitor =3D qobject_input_visitor_new(props);
> +    if (!visit_start_struct(visitor, NULL, NULL, 0, &local_err)) {
> +        goto err;
> +    }
> +
> +    for (qe =3D qdict_first(qdict_in); qe; qe =3D qdict_next(qdict_in, q=
e)) {
> +        object_property_find_err(obj, qe->key, &local_err);
> +        if (local_err) {
> +            goto err;
> +        }
> +
> +        object_property_set(obj, qe->key, visitor, &local_err);
> +        if (local_err) {
> +            goto err;
> +        }
> +    }
> +
> +    visit_check_struct(visitor, &local_err);
> +    if (local_err) {
> +        goto err;
> +    }
> +
> +    riscv_cpu_finalize_features(RISCV_CPU(obj), &local_err);
> +    if (local_err) {
> +        goto err;
> +    }
> +
> +    visit_end_struct(visitor, NULL);
> +
> +err:
> +    error_propagate(errp, local_err);
> +    visit_free(visitor);
> +}
> +
>  CpuModelExpansionInfo *qmp_query_cpu_model_expansion(CpuModelExpansionTy=
pe type,
>                                                       CpuModelInfo *model=
,
>                                                       Error **errp)
>  {
>      CpuModelExpansionInfo *expansion_info;
> +    const QDict *qdict_in =3D NULL;
>      QDict *qdict_out;
>      ObjectClass *oc;
>      Object *obj;
> +    Error *local_err =3D NULL;
>
>      if (type !=3D CPU_MODEL_EXPANSION_TYPE_FULL) {
>          error_setg(errp, "The requested expansion type is not supported"=
);
> @@ -104,8 +151,26 @@ CpuModelExpansionInfo *qmp_query_cpu_model_expansion=
(CpuModelExpansionType type,
>          return NULL;
>      }
>
> +    if (model->props) {
> +        qdict_in =3D qobject_to(QDict, model->props);
> +        if (!qdict_in) {
> +            error_setg(errp, QERR_INVALID_PARAMETER_TYPE, "props", "dict=
");
> +            return NULL;
> +        }
> +    }
> +
>      obj =3D object_new(object_class_get_name(oc));
>
> +    if (qdict_in) {
> +        riscv_cpuobj_validate_qdict_in(obj, model->props, qdict_in,
> +                                       &local_err);
> +        if (local_err) {
> +            error_propagate(errp, local_err);
> +            object_unref(obj);
> +            return NULL;
> +        }
> +    }
> +
>      expansion_info =3D g_new0(CpuModelExpansionInfo, 1);
>      expansion_info->model =3D g_malloc0(sizeof(*expansion_info->model));
>      expansion_info->model->name =3D g_strdup(model->name);
> --
> 2.41.0
>
>

