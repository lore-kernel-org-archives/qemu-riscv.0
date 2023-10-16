Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4035BCDB484
	for <qemu-riscv@archiver.kernel.org>; Mon, 16 Oct 2023 05:30:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qsGBC-0004xk-IN; Mon, 16 Oct 2023 01:30:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qsGBA-0004xT-PE; Mon, 16 Oct 2023 01:30:12 -0400
Received: from mail-vs1-xe2a.google.com ([2607:f8b0:4864:20::e2a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qsGB8-0004Fv-Rm; Mon, 16 Oct 2023 01:30:12 -0400
Received: by mail-vs1-xe2a.google.com with SMTP id
 ada2fe7eead31-4577c1ae94fso1643250137.1; 
 Sun, 15 Oct 2023 22:30:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697434209; x=1698039009; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aTsu6QlrSeFspM8uKeyb6L2Kc7MYBkCIop78wJLVDt4=;
 b=UT6rqBQLCr8dk6JmPorFG1AEWfK6lKCxPePfw+L2m8//Fg/BdGRS3vDBGv2gAmJTYF
 7lEUnOtPlE4eQgQ5tsLH3VBJi6P4D0QNA8TCCk2WCNzKysq/DpRrFfux9Pk9nNw3iVfr
 LgZMIksGVFP4nM5BR8KoQGGBeO//blfmEgCLDjQMB4YdHr1xyWZWxlQsoZAafadVgAHJ
 AaOmfSr8QN46Vpm9KsVl0Jx836ug5bErr2gOz/GVlVwFsTLMmhNg09DA9MrQ179uJ22O
 gnKfk0u1WHkilAzI4VGJz8nTXNniiX7bedtu6FK/DtDX1CgzgFjSKxI9CjzTTi4Gn2d/
 WIHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697434209; x=1698039009;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aTsu6QlrSeFspM8uKeyb6L2Kc7MYBkCIop78wJLVDt4=;
 b=rEaD5oSbma+xcIz8g00Dr/2CUyeXQJr77VQwVus+hEkBI4EjAPGky1MQbvFL50RVGH
 9xJJmmQTW5w+IUVVIbgJNpX3o8kJL6F33iKnbaikX70PD0ktTuFuSAGDW+IeH5VS1IYF
 NJ2qpMlycf+EGtag+eD7PJgvk2YnFyGnFtaWijbwEU6pYQEWK2rowK8UwKt8LYGCdEjr
 22ywSR3CX6Wp1vGG9a3CD78DVjtlYiOH2j1nnSoz1OBS2V5q3zmhzcfwoex3w2Zuv9IR
 oT0gGYT9fbHVpYDMKzt9n5RR134j3y+Na0XJRmlOK2DpN1jEp7Xr59kzO2X1snZHR9Um
 PdZw==
X-Gm-Message-State: AOJu0Yx7MLGQvxE0pjgCPV6mLkGfjW7fTC/HMYSrKx4RAfbHe71hS7zr
 29WXTQkP4EgQ+doODokTcF3OSvseGpKAN5W4GLg=
X-Google-Smtp-Source: AGHT+IFGX0XYsLD7tSQG34ed8QYWoG/9O4PJ/7gPUTmQJ/utDWO7gq+1SnIHADPABjjyUF6zgP/QeHI60/2KxRCPpeM=
X-Received: by 2002:a05:6102:4bca:b0:457:4645:a339 with SMTP id
 id10-20020a0561024bca00b004574645a339mr32934480vsb.1.1697434209244; Sun, 15
 Oct 2023 22:30:09 -0700 (PDT)
MIME-Version: 1.0
References: <20230926184019.166352-1-dbarboza@ventanamicro.com>
 <20230926184019.166352-7-dbarboza@ventanamicro.com>
In-Reply-To: <20230926184019.166352-7-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 16 Oct 2023 15:29:42 +1000
Message-ID: <CAKmqyKMf4gOAkRZ508W5+S+AoKSd5TtqFtuELdWMEihGJQPJHg@mail.gmail.com>
Subject: Re: [PATCH v2 6/6] target/riscv/riscv-qmp-cmds.c: check CPU accel in
 query-cpu-model-expansion
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2a;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe2a.google.com
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
> Use the recently added riscv_cpu_accelerator_compatible() to filter
> unavailable CPUs for a given accelerator. At this moment this is the
> case for a QEMU built with KVM and TCG support querying a binary running
> with TCG:
>
> qemu-system-riscv64 -S -M virt,accel=3Dtcg -display none
>     -qmp tcp:localhost:1234,server,wait=3Doff
>
> ./qemu/scripts/qmp/qmp-shell localhost:1234
>
> (QEMU) query-cpu-model-expansion type=3Dfull model=3D{"name":"host"}
> {"error": {"class": "GenericError", "desc": "'host' CPU not available wit=
h tcg"}}
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/riscv-qmp-cmds.c | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>
> diff --git a/target/riscv/riscv-qmp-cmds.c b/target/riscv/riscv-qmp-cmds.=
c
> index 5b2d186c83..2f2dbae7c8 100644
> --- a/target/riscv/riscv-qmp-cmds.c
> +++ b/target/riscv/riscv-qmp-cmds.c
> @@ -31,6 +31,8 @@
>  #include "qapi/qobject-input-visitor.h"
>  #include "qapi/visitor.h"
>  #include "qom/qom-qobject.h"
> +#include "sysemu/kvm.h"
> +#include "sysemu/tcg.h"
>  #include "cpu-qom.h"
>  #include "cpu.h"
>
> @@ -63,6 +65,17 @@ CpuDefinitionInfoList *qmp_query_cpu_definitions(Error=
 **errp)
>      return cpu_list;
>  }
>
> +static void riscv_check_if_cpu_available(RISCVCPU *cpu, Error **errp)
> +{
> +    if (!riscv_cpu_accelerator_compatible(cpu)) {
> +        g_autofree char *name =3D riscv_cpu_get_name(cpu);
> +        const char *accel =3D kvm_enabled() ? "kvm" : "tcg";
> +
> +        error_setg(errp, "'%s' CPU not available with %s", name, accel);
> +        return;
> +    }
> +}
> +
>  static void riscv_obj_add_qdict_prop(Object *obj, QDict *qdict_out,
>                                       const char *name)
>  {
> @@ -161,6 +174,13 @@ CpuModelExpansionInfo *qmp_query_cpu_model_expansion=
(CpuModelExpansionType type,
>
>      obj =3D object_new(object_class_get_name(oc));
>
> +    riscv_check_if_cpu_available(RISCV_CPU(obj), &local_err);
> +    if (local_err !=3D NULL) {
> +        error_propagate(errp, local_err);
> +        object_unref(obj);
> +        return NULL;
> +    }
> +
>      if (qdict_in) {
>          riscv_cpuobj_validate_qdict_in(obj, model->props, qdict_in,
>                                         &local_err);
> --
> 2.41.0
>
>

