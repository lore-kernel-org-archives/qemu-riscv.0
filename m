Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1poF3H-0001F5-OW
	for mharc-qemu-riscv@gnu.org; Sun, 16 Apr 2023 22:57:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1poF3C-0001DR-Ie; Sun, 16 Apr 2023 22:57:06 -0400
Received: from mail-vs1-xe2f.google.com ([2607:f8b0:4864:20::e2f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1poF36-0004xK-VY; Sun, 16 Apr 2023 22:57:04 -0400
Received: by mail-vs1-xe2f.google.com with SMTP id e19so7155788vsa.12;
 Sun, 16 Apr 2023 19:56:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681700206; x=1684292206;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=feTt3RYcYLeTyK1vmuFBUuFhZ8MdbVXuFjZ/Su5+T5Q=;
 b=Cvsl/buv7Np7piXfF/1UAbK3XUwIogxwpigyrZumja3sMj4Xge2dofVVzESfzKXEym
 XJC43XJJhSl1R328ouoKYB8srrtwQjPhieK0TInhX4rfmMRG5LBwaQ0OJBIOXk9AH2+/
 jVPeMcjc4ErWYO4trqsvqUVKXptp6yeBSxU/A5I+lepJawNnaw2FNeelqLNQW+/txWlL
 ZbcLoh3OLrshp00d0TYp91mz1zzCeujDZqOqOg1nY53La/VDFUk5ccZA9ffl00+oH4eH
 EtbAlGd/dhL5t5o0vzW5LzxKUr+Bw2zRfX0j1pbFDWkX8HjqF2tJjHgvT6uMQoRwLmwn
 kleA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681700206; x=1684292206;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=feTt3RYcYLeTyK1vmuFBUuFhZ8MdbVXuFjZ/Su5+T5Q=;
 b=MOinf6h73C5hGmYYV23E8L4iFoSusOzy8vzF4TBA3+elLX8Zeu3VZYxkhiqG2BE8y6
 4Egx7mlQGw0TzjdqrcDaTZCe2zc7ufCZZ/XhT3kjlIk3QWwbP58iy2BXAgIkrixA8KHY
 /fUVXWaNTUbV0CL6bM24KMHisYhRVw6dj2D1AC204ei8rAC20UEVbFI9PHr28lEV75u8
 AWnEvs94IAbaFoqw+Q9EUNSWzpxvbU/rTp93Umbnhh7fagLaVGH/JvAWd6/VvRa0TUaG
 0JcskDrz6A5tS04Qa9tJPfPFUI6MBboJyCHU4tds/mh1IG8Z4/+KMkRP6MxakNjQtO3C
 9wOg==
X-Gm-Message-State: AAQBX9eq99uJRruVpdiyIP51iFekQF9azA/Uf4gm+pekjSiuQTbEbTYn
 3EtXPyPznWKjZTFA8j/4LmUdmXd3ulMp6mYoXJE=
X-Google-Smtp-Source: AKy350aYjngqdKyXGgRxJXHkJ5vioKoNghJiyKMSZ9yRcyvjho3zoGdrjcWTP6yVd1VfqRDJxxrg42xO262YPO4VPyA=
X-Received: by 2002:a67:d71c:0:b0:422:1654:7737 with SMTP id
 p28-20020a67d71c000000b0042216547737mr7089525vsj.3.1681700206329; Sun, 16 Apr
 2023 19:56:46 -0700 (PDT)
MIME-Version: 1.0
References: <20230411183511.189632-1-dbarboza@ventanamicro.com>
 <20230411183511.189632-3-dbarboza@ventanamicro.com>
In-Reply-To: <20230411183511.189632-3-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 17 Apr 2023 12:56:20 +1000
Message-ID: <CAKmqyKMxr+WS6-ek96SwwfBysBC9rrOsvZ5SJ5qRJTsY2djCgg@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] target/riscv: add query-cpy-definitions support
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com, richard.henderson@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2f;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe2f.google.com
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
X-List-Received-Date: Mon, 17 Apr 2023 02:57:07 -0000

On Wed, Apr 12, 2023 at 4:37=E2=80=AFAM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> This command is used by tooling like libvirt to retrieve a list of
> supported CPUs. Each entry returns a CpuDefinitionInfo object that
> contains more information about each CPU.
>
> This initial support includes only the name of the CPU and its typename.
> Here's what the command produces for the riscv64 target:
>
> $ ./build/qemu-system-riscv64 -S -M virt -display none -qmp stdio
> {"QMP": {"version": (...)}
> {"execute": "qmp_capabilities", "arguments": {"enable": ["oob"]}}
> {"return": {}}
> {"execute": "query-cpu-definitions"}
> {"return": [
> {"name": "rv64", "typename": "rv64-riscv-cpu", "static": false, "deprecat=
ed": false},
> {"name": "sifive-e51", "typename": "sifive-e51-riscv-cpu", "static": fals=
e, "deprecated": false},
> {"name": "any", "typename": "any-riscv-cpu", "static": false, "deprecated=
": false},
> {"name": "x-rv128", "typename": "x-rv128-riscv-cpu", "static": false, "de=
precated": false},
> {"name": "shakti-c", "typename": "shakti-c-riscv-cpu", "static": false, "=
deprecated": false},
> {"name": "thead-c906", "typename": "thead-c906-riscv-cpu", "static": fals=
e, "deprecated": false},
> {"name": "sifive-u54", "typename": "sifive-u54-riscv-cpu", "static": fals=
e, "deprecated": false}]
> }
>
> Next patch will introduce a way to tell whether a given CPU is static or
> not.
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  qapi/machine-target.json      |  6 ++--
>  target/riscv/meson.build      |  3 +-
>  target/riscv/riscv-qmp-cmds.c | 53 +++++++++++++++++++++++++++++++++++
>  3 files changed, 59 insertions(+), 3 deletions(-)
>  create mode 100644 target/riscv/riscv-qmp-cmds.c
>
> diff --git a/qapi/machine-target.json b/qapi/machine-target.json
> index 2e267fa458..f3a3de6648 100644
> --- a/qapi/machine-target.json
> +++ b/qapi/machine-target.json
> @@ -324,7 +324,8 @@
>                     'TARGET_I386',
>                     'TARGET_S390X',
>                     'TARGET_MIPS',
> -                   'TARGET_LOONGARCH64' ] } }
> +                   'TARGET_LOONGARCH64',
> +                   'TARGET_RISCV' ] } }
>
>  ##
>  # @query-cpu-definitions:
> @@ -341,4 +342,5 @@
>                     'TARGET_I386',
>                     'TARGET_S390X',
>                     'TARGET_MIPS',
> -                   'TARGET_LOONGARCH64' ] } }
> +                   'TARGET_LOONGARCH64',
> +                   'TARGET_RISCV' ] } }
> diff --git a/target/riscv/meson.build b/target/riscv/meson.build
> index 5b7f813a3e..e1ff6d9b95 100644
> --- a/target/riscv/meson.build
> +++ b/target/riscv/meson.build
> @@ -32,7 +32,8 @@ riscv_softmmu_ss.add(files(
>    'monitor.c',
>    'machine.c',
>    'pmu.c',
> -  'time_helper.c'
> +  'time_helper.c',
> +  'riscv-qmp-cmds.c',
>  ))
>
>  target_arch +=3D {'riscv': riscv_ss}
> diff --git a/target/riscv/riscv-qmp-cmds.c b/target/riscv/riscv-qmp-cmds.=
c
> new file mode 100644
> index 0000000000..128677add9
> --- /dev/null
> +++ b/target/riscv/riscv-qmp-cmds.c
> @@ -0,0 +1,53 @@
> +/*
> + * QEMU CPU QMP commands for RISC-V
> + *
> + * Copyright (c) 2023 Ventana Micro Systems Inc.
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining=
 a copy
> + * of this software and associated documentation files (the "Software"),=
 to deal
> + * in the Software without restriction, including without limitation the=
 rights
> + * to use, copy, modify, merge, publish, distribute, sublicense, and/or =
sell
> + * copies of the Software, and to permit persons to whom the Software is
> + * furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice shall be includ=
ed in
> + * all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRE=
SS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILI=
TY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHA=
LL
> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR =
OTHER
> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISI=
NG FROM,
> + * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALING=
S IN
> + * THE SOFTWARE.
> + */
> +
> +#include "qemu/osdep.h"
> +
> +#include "qapi/qapi-commands-machine-target.h"
> +#include "cpu-qom.h"
> +
> +static void riscv_cpu_add_definition(gpointer data, gpointer user_data)
> +{
> +    ObjectClass *oc =3D data;
> +    CpuDefinitionInfoList **cpu_list =3D user_data;
> +    CpuDefinitionInfo *info =3D g_malloc0(sizeof(*info));
> +    const char *typename =3D object_class_get_name(oc);
> +
> +    info->name =3D g_strndup(typename,
> +                           strlen(typename) - strlen("-" TYPE_RISCV_CPU)=
);
> +    info->q_typename =3D g_strdup(typename);
> +
> +    QAPI_LIST_PREPEND(*cpu_list, info);
> +}
> +
> +CpuDefinitionInfoList *qmp_query_cpu_definitions(Error **errp)
> +{
> +    CpuDefinitionInfoList *cpu_list =3D NULL;
> +    GSList *list =3D object_class_get_list(TYPE_RISCV_CPU, false);
> +
> +    g_slist_foreach(list, riscv_cpu_add_definition, &cpu_list);
> +    g_slist_free(list);
> +
> +    return cpu_list;
> +}
> --
> 2.39.2
>
>

