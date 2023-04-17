Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1poF4V-0002Da-W2
	for mharc-qemu-riscv@gnu.org; Sun, 16 Apr 2023 22:58:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1poF4U-0002DN-LL; Sun, 16 Apr 2023 22:58:26 -0400
Received: from mail-ua1-x92d.google.com ([2607:f8b0:4864:20::92d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1poF4S-0005KL-WB; Sun, 16 Apr 2023 22:58:26 -0400
Received: by mail-ua1-x92d.google.com with SMTP id a19so1392840uan.1;
 Sun, 16 Apr 2023 19:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681700303; x=1684292303;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GNeVIXiBQVe62GiBRADOoObv5sQnMZQrt/sxQjqT2ec=;
 b=c7fQYBPAzTTeXA5gQkSMwMvYtSU12hrLvV/nRznbV6NJmpCPIOc9FoWpPDC8MPXwdk
 4OwDPayuYY4WjGL3KhNNZIC3bnxv7g411bc9JGHn/XtMOOwD3JKAuSt6HIiLuou6agO5
 ZHDfMSp4UUDjFU2vDV8MXL78nz55KhkyadIudCCMlzHMh4zdV4arTbFGdhe9qjsD/I+b
 /mssWZBIPxFzz2Ws+u3Rm6Bm8mZBfj8YIVRP/RFjg65wYLsJUdyC7i9ys4NE0p7xBZ/D
 UlQQcRyIFlrPoyOk0033ip1qlluSlTfT9bTbbd/p+6ToXhB4Ismn6lM/pqa2P0/ncsLP
 fFwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681700303; x=1684292303;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GNeVIXiBQVe62GiBRADOoObv5sQnMZQrt/sxQjqT2ec=;
 b=PILqsPIshcZcV11avik1cJAAoWF8M3pB65y+5KIq33jLBCh2J+GjgTcUJzx+0ef2Tj
 RXx+EzMoH2bNtVR6MPUAu8rNUCs9gwBq4niMCugCc2oTsyoQrkvCLqLuk4HrLAHOPcmG
 7R3Q8BgVMWRRKYiZjNeMlQ5rY+7ztdgeMMZg/GW8ES356FwL9/wZ7OgV7pixLtuKNXUi
 9V11YN2bjeog/pJ74e1eWo5d2IF0KgIwTos4tcLFYwNiNpyV2v2vMEYNufoUK4ksMB/p
 av140MZnCTF5bQrbqE2UY/o7GJwojOfqRzYJ7FUG53WQpZ9za/iWrOA8YAkqWvVFfyaB
 WGjg==
X-Gm-Message-State: AAQBX9dOuxqDAeSb9WwzvBVWDaO6TfMp1MPJn4vpMVRL5HNw8VFZFAy4
 9YOe8Dg6nyL5W/9nzMh64Le9M/tODuadSyoLiEQ=
X-Google-Smtp-Source: AKy350aZJlZAeoKQTP6U+usI7nRdwVfgCuuYhYO7cc1CyK4txjBR3sc/Ohlzt7Zcy/goU2kgt8olDbrrlx9LouIIx8Y=
X-Received: by 2002:ab0:6092:0:b0:772:a1e:6f3 with SMTP id
 i18-20020ab06092000000b007720a1e06f3mr8849425ual.0.1681700303571; 
 Sun, 16 Apr 2023 19:58:23 -0700 (PDT)
MIME-Version: 1.0
References: <20230411183511.189632-1-dbarboza@ventanamicro.com>
 <20230411183511.189632-4-dbarboza@ventanamicro.com>
In-Reply-To: <20230411183511.189632-4-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 17 Apr 2023 12:57:57 +1000
Message-ID: <CAKmqyKPNLWvUrhCBQZh5VUXiU-Kci0KnNKBsCnAbZDMkQunSTQ@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] target/riscv: add TYPE_RISCV_DYNAMIC_CPU
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com, richard.henderson@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::92d;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x92d.google.com
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
X-List-Received-Date: Mon, 17 Apr 2023 02:58:27 -0000

On Wed, Apr 12, 2023 at 4:36=E2=80=AFAM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> This new abstract type will be used to differentiate between static and
> non-static CPUs in query-cpu-definitions.
>
> All generic CPUs were changed to be of this type. Named CPUs are kept as
> TYPE_RISCV_CPU and will still be considered static.
>
> This is the output of query-cpu-definitions after this change for the
> riscv64 target:
>
> $ ./build/qemu-system-riscv64 -S -M virt -display none -qmp stdio
> {"QMP": {"version": (...)}
> {"execute": "qmp_capabilities", "arguments": {"enable": ["oob"]}}
> {"return": {}}
> {"execute": "query-cpu-definitions"}
> {"return": [
> {"name": "rv64", "typename": "rv64-riscv-cpu", "static": false, "deprecat=
ed": false},
> {"name": "sifive-e51", "typename": "sifive-e51-riscv-cpu", "static": true=
, "deprecated": false},
> {"name": "any", "typename": "any-riscv-cpu", "static": false, "deprecated=
": false},
> {"name": "x-rv128", "typename": "x-rv128-riscv-cpu", "static": false, "de=
precated": false},
> {"name": "shakti-c", "typename": "shakti-c-riscv-cpu", "static": true, "d=
eprecated": false},
> {"name": "thead-c906", "typename": "thead-c906-riscv-cpu", "static": true=
, "deprecated": false},
> {"name": "sifive-u54", "typename": "sifive-u54-riscv-cpu", "static": true=
, "deprecated": false}
> ]}
>
> Suggested-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu-qom.h        |  2 +-
>  target/riscv/cpu.c            | 20 ++++++++++++++++----
>  target/riscv/riscv-qmp-cmds.c |  4 ++++
>  3 files changed, 21 insertions(+), 5 deletions(-)
>
> diff --git a/target/riscv/cpu-qom.h b/target/riscv/cpu-qom.h
> index b9318e0783..b29090ad86 100644
> --- a/target/riscv/cpu-qom.h
> +++ b/target/riscv/cpu-qom.h
> @@ -23,6 +23,7 @@
>  #include "qom/object.h"
>
>  #define TYPE_RISCV_CPU "riscv-cpu"
> +#define TYPE_RISCV_DYNAMIC_CPU "riscv-dynamic-cpu"
>
>  #define RISCV_CPU_TYPE_SUFFIX "-" TYPE_RISCV_CPU
>  #define RISCV_CPU_TYPE_NAME(name) (name RISCV_CPU_TYPE_SUFFIX)
> @@ -66,5 +67,4 @@ struct RISCVCPUClass {
>      DeviceRealize parent_realize;
>      ResettablePhases parent_phases;
>  };
> -
>  #endif /* RISCV_CPU_QOM_H */
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index fab38859ec..56f2b345cf 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -1788,6 +1788,13 @@ void riscv_cpu_list(void)
>          .instance_init =3D initfn            \
>      }
>
> +#define DEFINE_DYNAMIC_CPU(type_name, initfn) \
> +    {                                         \
> +        .name =3D type_name,                    \
> +        .parent =3D TYPE_RISCV_DYNAMIC_CPU,     \
> +        .instance_init =3D initfn               \
> +    }
> +
>  static const TypeInfo riscv_cpu_type_infos[] =3D {
>      {
>          .name =3D TYPE_RISCV_CPU,
> @@ -1799,23 +1806,28 @@ static const TypeInfo riscv_cpu_type_infos[] =3D =
{
>          .class_size =3D sizeof(RISCVCPUClass),
>          .class_init =3D riscv_cpu_class_init,
>      },
> -    DEFINE_CPU(TYPE_RISCV_CPU_ANY,              riscv_any_cpu_init),
> +    {
> +        .name =3D TYPE_RISCV_DYNAMIC_CPU,
> +        .parent =3D TYPE_RISCV_CPU,
> +        .abstract =3D true,
> +    },
> +    DEFINE_DYNAMIC_CPU(TYPE_RISCV_CPU_ANY,      riscv_any_cpu_init),
>  #if defined(CONFIG_KVM)
>      DEFINE_CPU(TYPE_RISCV_CPU_HOST,             riscv_host_cpu_init),
>  #endif
>  #if defined(TARGET_RISCV32)
> -    DEFINE_CPU(TYPE_RISCV_CPU_BASE32,           rv32_base_cpu_init),
> +    DEFINE_DYNAMIC_CPU(TYPE_RISCV_CPU_BASE32,   rv32_base_cpu_init),
>      DEFINE_CPU(TYPE_RISCV_CPU_IBEX,             rv32_ibex_cpu_init),
>      DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_E31,       rv32_sifive_e_cpu_init),
>      DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_E34,       rv32_imafcu_nommu_cpu_in=
it),
>      DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_U34,       rv32_sifive_u_cpu_init),
>  #elif defined(TARGET_RISCV64)
> -    DEFINE_CPU(TYPE_RISCV_CPU_BASE64,           rv64_base_cpu_init),
> +    DEFINE_DYNAMIC_CPU(TYPE_RISCV_CPU_BASE64,   rv64_base_cpu_init),
>      DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_E51,       rv64_sifive_e_cpu_init),
>      DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_U54,       rv64_sifive_u_cpu_init),
>      DEFINE_CPU(TYPE_RISCV_CPU_SHAKTI_C,         rv64_sifive_u_cpu_init),
>      DEFINE_CPU(TYPE_RISCV_CPU_THEAD_C906,       rv64_thead_c906_cpu_init=
),
> -    DEFINE_CPU(TYPE_RISCV_CPU_BASE128,          rv128_base_cpu_init),
> +    DEFINE_DYNAMIC_CPU(TYPE_RISCV_CPU_BASE128,  rv128_base_cpu_init),
>  #endif
>  };
>
> diff --git a/target/riscv/riscv-qmp-cmds.c b/target/riscv/riscv-qmp-cmds.=
c
> index 128677add9..5ecff1afb3 100644
> --- a/target/riscv/riscv-qmp-cmds.c
> +++ b/target/riscv/riscv-qmp-cmds.c
> @@ -33,11 +33,15 @@ static void riscv_cpu_add_definition(gpointer data, g=
pointer user_data)
>      CpuDefinitionInfoList **cpu_list =3D user_data;
>      CpuDefinitionInfo *info =3D g_malloc0(sizeof(*info));
>      const char *typename =3D object_class_get_name(oc);
> +    ObjectClass *dyn_class;
>
>      info->name =3D g_strndup(typename,
>                             strlen(typename) - strlen("-" TYPE_RISCV_CPU)=
);
>      info->q_typename =3D g_strdup(typename);
>
> +    dyn_class =3D object_class_dynamic_cast(oc, TYPE_RISCV_DYNAMIC_CPU);
> +    info->q_static =3D dyn_class =3D=3D NULL;
> +
>      QAPI_LIST_PREPEND(*cpu_list, info);
>  }
>
> --
> 2.39.2
>
>

