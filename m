Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71C88CDB465
	for <qemu-riscv@archiver.kernel.org>; Mon, 16 Oct 2023 05:17:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qsFz3-0000da-BC; Mon, 16 Oct 2023 01:17:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qsFz0-0000ck-GD; Mon, 16 Oct 2023 01:17:38 -0400
Received: from mail-vs1-xe35.google.com ([2607:f8b0:4864:20::e35])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qsFyy-0002E3-Kb; Mon, 16 Oct 2023 01:17:38 -0400
Received: by mail-vs1-xe35.google.com with SMTP id
 ada2fe7eead31-457d9ffc9d2so886077137.1; 
 Sun, 15 Oct 2023 22:17:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697433455; x=1698038255; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6J/zldDvqR4PLbii/XKeWDfYYlpxyoZ1GqWZNkOZVik=;
 b=CX5NTYSByCDeCE7oBwVsZpIu4tOrawjvdilBIsdINN0BZ1jPA04smV+H41ElKw0DB1
 ALPsF3bMvKHtegKJHrYuUlGQSMfKt1z0m5IGVxfZ+9WRewrT3RsxUmoOILwqk+hisBBj
 MLIa6vH2I0KEgWWMO3hhGrHsZMIeEI0PzuPgB+Chr80pY8F5aJ+lAcsyAIOnxM2p6XZJ
 sHYZ1u5WIfOO6+H9mJ1FD1+ddf6WV9R33cdP4UXgj3NKG3GbRii3oouQbNjYFXEDrlHB
 e0HycNu9rr8ARUwZkBH2yL/UtomS5mj51oV4K2KaqBOk3xLEeCQFTqpgMKhVnM+FNwnX
 lvjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697433455; x=1698038255;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6J/zldDvqR4PLbii/XKeWDfYYlpxyoZ1GqWZNkOZVik=;
 b=J38obrKr8ygn6WMHThcoajFMt0M+qmv9DDbWF5S+I+Wp5zQv5ohsWvMMm9skvuONLj
 ztettD5/cRmaAoRDHDllBCFggls7h9uTxKFX0cQlnvO7xGoVT3f8l4uXDLZ9ktOC71rS
 xuVV2A7FUmKlQAFQyR+fjww9h/f48PrLqpAVj6xHe3QVGMOMPpBgNqY3tl0+QuAu2XOV
 Wh/Soee0SsMUWQPd30Cli9iYQUwJ1gSurFXf2zHbZuoemJQ/9wHU4RCu6wZ4Hgl0PJ/j
 1u6iHNIdndroHn1/j0jjw1x/rtJeVI7E8Q2PYegmUtZ8moZ2M1tH9N44Qzl4sABYtjQi
 ICqQ==
X-Gm-Message-State: AOJu0YxnvsCkUOkBHwqlOsVeICmHXK5r563tOWqz8Gr+R1pbSu00smit
 hpjjTlYatwT31ezyOrsDhBJ/0jzyL5144XCt5FU=
X-Google-Smtp-Source: AGHT+IH4YMhN5pq4QC49qa5hUhVrOGuEZL/lA5mO1OITr10i66vcimIQESSXeFhlaTfRse+4WnITAxbrO0df5ZVJFQY=
X-Received: by 2002:a67:c21c:0:b0:452:618b:13e3 with SMTP id
 i28-20020a67c21c000000b00452618b13e3mr3123275vsj.9.1697433454880; Sun, 15 Oct
 2023 22:17:34 -0700 (PDT)
MIME-Version: 1.0
References: <20230926184019.166352-1-dbarboza@ventanamicro.com>
 <20230926184019.166352-3-dbarboza@ventanamicro.com>
In-Reply-To: <20230926184019.166352-3-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 16 Oct 2023 15:17:08 +1000
Message-ID: <CAKmqyKMKNeSo79Z9UbiPWeAO=tKA9zSzN5-DNsX8hA9Nnfot6A@mail.gmail.com>
Subject: Re: [PATCH v2 2/6] qapi,risc-v: add query-cpu-model-expansion
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e35;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe35.google.com
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

On Wed, Sep 27, 2023 at 4:41=E2=80=AFAM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> This API is used to inspect the characteristics of a given CPU model. It
> also allows users to validate a CPU model with a certain configuration,
> e.g. if "-cpu X,a=3Dtrue,b=3Dfalse" is a valid setup for a given QEMU
> binary. We'll start implementing the first part. The second requires
> more changes in RISC-V CPU boot flow.
>
> The implementation is inspired by the existing ARM
> query-cpu-model-expansion impl in target/arm/arm-qmp-cmds.c. We'll
> create a RISCVCPU object with the required model, fetch its existing
> properties, add a couple of relevant boolean options (pmp and mmu) and
> display it to users.
>
> Here's an usage example:
>
> ./build/qemu-system-riscv64 -S -M virt -display none \
>   -qmp  tcp:localhost:1234,server,wait=3Doff
>
> ./scripts/qmp/qmp-shell localhost:1234
> Welcome to the QMP low-level shell!
> Connected to QEMU 8.1.50
>
> (QEMU)  query-cpu-model-expansion type=3Dfull model=3D{"name":"rv64"}
> {"return": {"model": {"name": "rv64", "props": {"zicond": false, "x-zvfh"=
: false, "mmu": true, "x-zvfbfwma": false, "x-zvfbfmin": false, "xtheadbs":=
 false, "xtheadbb": false, "xtheadba": false, "xtheadmemidx": false, "smsta=
teen": false, "zfinx": false, "Zve64f": false, "Zve32f": false, "x-zvfhmin"=
: false, "xventanacondops": false, "xtheadcondmov": false, "svpbmt": false,=
 "zbs": true, "zbc": true, "zbb": true, "zba": true, "zicboz": true, "xthea=
dmac": false, "Zfh": false, "Zfa": true, "zbkx": false, "zbkc": false, "zbk=
b": false, "Zve64d": false, "x-zfbfmin": false, "zk": false, "x-epmp": fals=
e, "xtheadmempair": false, "zkt": false, "zks": false, "zkr": false, "zkn":=
 false, "Zfhmin": false, "zksh": false, "zknh": false, "zkne": false, "zknd=
": false, "zhinx": false, "Zicsr": true, "sscofpmf": false, "Zihintntl": tr=
ue, "sstc": true, "xtheadcmo": false, "x-zvbb": false, "zksed": false, "x-z=
vkned": false, "xtheadsync": false, "x-zvkg": false, "zhinxmin": false, "sv=
adu": true, "xtheadfmv": false, "x-zvksed": false, "svnapot": false, "pmp":=
 true, "x-zvknhb": false, "x-zvknha": false, "xtheadfmemidx": false, "x-zvk=
sh": false, "zdinx": false, "zicbom": true, "Zihintpause": true, "svinval":=
 false, "zcf": false, "zce": false, "zcd": false, "zcb": false, "zca": fals=
e, "x-ssaia": false, "x-smaia": false, "zmmul": false, "x-zvbc": false, "Zi=
fencei": true, "zcmt": false, "zcmp": false, "Zawrs": true}}}}
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  qapi/machine-target.json      |  6 ++-
>  target/riscv/riscv-qmp-cmds.c | 75 +++++++++++++++++++++++++++++++++++
>  2 files changed, 79 insertions(+), 2 deletions(-)
>
> diff --git a/qapi/machine-target.json b/qapi/machine-target.json
> index f0a6b72414..e5630e73aa 100644
> --- a/qapi/machine-target.json
> +++ b/qapi/machine-target.json
> @@ -228,7 +228,8 @@
>    'data': { 'model': 'CpuModelInfo' },
>    'if': { 'any': [ 'TARGET_S390X',
>                     'TARGET_I386',
> -                   'TARGET_ARM' ] } }
> +                   'TARGET_ARM',
> +                   'TARGET_RISCV' ] } }
>
>  ##
>  # @query-cpu-model-expansion:
> @@ -273,7 +274,8 @@
>    'returns': 'CpuModelExpansionInfo',
>    'if': { 'any': [ 'TARGET_S390X',
>                     'TARGET_I386',
> -                   'TARGET_ARM' ] } }
> +                   'TARGET_ARM',
> +                   'TARGET_RISCV' ] } }
>
>  ##
>  # @CpuDefinitionInfo:
> diff --git a/target/riscv/riscv-qmp-cmds.c b/target/riscv/riscv-qmp-cmds.=
c
> index 5ecff1afb3..2170562e3a 100644
> --- a/target/riscv/riscv-qmp-cmds.c
> +++ b/target/riscv/riscv-qmp-cmds.c
> @@ -24,8 +24,12 @@
>
>  #include "qemu/osdep.h"
>
> +#include "qapi/error.h"
>  #include "qapi/qapi-commands-machine-target.h"
> +#include "qapi/qmp/qdict.h"
> +#include "qom/qom-qobject.h"
>  #include "cpu-qom.h"
> +#include "cpu.h"
>
>  static void riscv_cpu_add_definition(gpointer data, gpointer user_data)
>  {
> @@ -55,3 +59,74 @@ CpuDefinitionInfoList *qmp_query_cpu_definitions(Error=
 **errp)
>
>      return cpu_list;
>  }
> +
> +static void riscv_obj_add_qdict_prop(Object *obj, QDict *qdict_out,
> +                                     const char *name)
> +{
> +    ObjectProperty *prop =3D object_property_find(obj, name);
> +
> +    if (prop) {
> +        QObject *value;
> +
> +        assert(prop->get);
> +        value =3D object_property_get_qobject(obj, name, &error_abort);
> +
> +        qdict_put_obj(qdict_out, name, value);
> +    }
> +}
> +
> +static void riscv_obj_add_multiext_props(Object *obj, QDict *qdict_out,
> +                                         const RISCVCPUMultiExtConfig *a=
rr)
> +{
> +    for (int i =3D 0; arr[i].name !=3D NULL; i++) {
> +        riscv_obj_add_qdict_prop(obj, qdict_out, arr[i].name);
> +    }
> +}
> +
> +CpuModelExpansionInfo *qmp_query_cpu_model_expansion(CpuModelExpansionTy=
pe type,
> +                                                     CpuModelInfo *model=
,
> +                                                     Error **errp)
> +{
> +    CpuModelExpansionInfo *expansion_info;
> +    QDict *qdict_out;
> +    ObjectClass *oc;
> +    Object *obj;
> +
> +    if (type !=3D CPU_MODEL_EXPANSION_TYPE_FULL) {
> +        error_setg(errp, "The requested expansion type is not supported"=
);
> +        return NULL;
> +    }
> +
> +    oc =3D cpu_class_by_name(TYPE_RISCV_CPU, model->name);
> +    if (!oc) {
> +        error_setg(errp, "The CPU type '%s' is not a known RISC-V CPU ty=
pe",
> +                   model->name);
> +        return NULL;
> +    }
> +
> +    obj =3D object_new(object_class_get_name(oc));
> +
> +    expansion_info =3D g_new0(CpuModelExpansionInfo, 1);
> +    expansion_info->model =3D g_malloc0(sizeof(*expansion_info->model));
> +    expansion_info->model->name =3D g_strdup(model->name);
> +
> +    qdict_out =3D qdict_new();
> +
> +    riscv_obj_add_multiext_props(obj, qdict_out, riscv_cpu_extensions);
> +    riscv_obj_add_multiext_props(obj, qdict_out, riscv_cpu_experimental_=
exts);
> +    riscv_obj_add_multiext_props(obj, qdict_out, riscv_cpu_vendor_exts);
> +
> +    /* Add our CPU boolean options too */
> +    riscv_obj_add_qdict_prop(obj, qdict_out, "mmu");
> +    riscv_obj_add_qdict_prop(obj, qdict_out, "pmp");
> +
> +    if (!qdict_size(qdict_out)) {
> +        qobject_unref(qdict_out);
> +    } else {
> +        expansion_info->model->props =3D QOBJECT(qdict_out);
> +    }
> +
> +    object_unref(obj);
> +
> +    return expansion_info;
> +}
> --
> 2.41.0
>
>

