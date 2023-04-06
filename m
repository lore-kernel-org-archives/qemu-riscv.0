Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pkDN2-0001ZH-B8
	for mharc-qemu-riscv@gnu.org; Wed, 05 Apr 2023 20:20:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pkDN0-0001Ym-AD; Wed, 05 Apr 2023 20:20:54 -0400
Received: from mail-ua1-x936.google.com ([2607:f8b0:4864:20::936])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pkDMy-0004Vx-Lm; Wed, 05 Apr 2023 20:20:54 -0400
Received: by mail-ua1-x936.google.com with SMTP id ay14so26811604uab.13;
 Wed, 05 Apr 2023 17:20:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680740450;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GR+y9ggDoAfdMil6qqvxiVU0Db+0IfzK2p3pfw8gShQ=;
 b=Y0f3oCGLjoRdg2If8dcAPdXUY2w+eHHxlXVyZqFx6uZsedM/mDVxYV8yNfDhfOIcNq
 IYHyW1VJNENIkOClJMJOkpOAF71edrRnuM6Bjd/LQrMi5G9hjYRnE9vNcQsKT27PWw2a
 p5VzrT4sbS/X4xia+yRYh+8NjCgyH/Rc7I37Z1F6NgHXlpA0U03C5duClPJY03SUReaQ
 BNjvXLtCYQ+8zblB4Up0hD4OikQKHAZrLg0zmH3g2sYGNvuBRUeFiewAXukiFm5ktJIH
 gZCcDv55YLffwJe/czVod1/3EnA4ZCXgr7lCqwKmQS74wJMIikcsHvECQLcmUfLY95DF
 jwSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680740450;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GR+y9ggDoAfdMil6qqvxiVU0Db+0IfzK2p3pfw8gShQ=;
 b=ABPnrggzKnzYnY11QAVdL51XkmKPK5Ul8rfDaMbj8GkJhXxDL1ZPVtFjlGH2qzwDSk
 DoqW+ByaxmawkRxTNNnU6l6PaLufubxf/XCIGz3AyxZCHsST/eiLQurpVxu9akY0hvfP
 bOHhkau2a1wDlcXUJX2Ugyq3UVjMd7kw+K+M9cjlDttVCbXH2+8Yuc2hSBI0kD+q5Ubv
 a69KuyPMfpYUau+40G1sBjxoByUFHQwq46eXps4NkEpjMfPm23ZswbLfHQ3/WwSOs2I9
 3SQSJTL2O3kN6Na7gY/Q+QEIrMNT6C83HPnGt1Ld3S8GqYLM9KNMitIXbui6i+UhR6VA
 6VbQ==
X-Gm-Message-State: AAQBX9dTWgOV0k2ywMlAyOCeruY2EVdYkQH8eldaK0+L13QfnjY7ql7N
 DOCgXDa6c2IdsIuzgbclXTJCNXFyPTrf/oEApNM=
X-Google-Smtp-Source: AKy350ZH0jOKIvGo1lLoNt/tLrFLZtbN1eNXyiScsYPdC3f/hKS2dAifxpuL1XxqDYfRZ0S4z62Mt9RKBese58nobFo=
X-Received: by 2002:ab0:7ce:0:b0:68d:6360:77b with SMTP id
 d14-20020ab007ce000000b0068d6360077bmr5388624uaf.1.1680740450134; 
 Wed, 05 Apr 2023 17:20:50 -0700 (PDT)
MIME-Version: 1.0
References: <20230329172903.636383-1-dbarboza@ventanamicro.com>
 <20230329172903.636383-16-dbarboza@ventanamicro.com>
In-Reply-To: <20230329172903.636383-16-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 6 Apr 2023 10:20:24 +1000
Message-ID: <CAKmqyKPuSx-nRk5HjCvstPB2UAG23ou=S5+ke=yXkCCx=VxY0w@mail.gmail.com>
Subject: Re: [PATCH v3 15/20] target/riscv: remove cpu->cfg.ext_j
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::936;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x936.google.com
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
X-List-Received-Date: Thu, 06 Apr 2023 00:20:54 -0000

On Thu, Mar 30, 2023 at 3:31=E2=80=AFAM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> Create a new "j" RISCVCPUMisaExtConfig property that will update
> env->misa_ext* with RVJ. Instances of cpu->cfg.ext_j and similar are
> replaced with riscv_has_ext(env, RVJ).
>
> Remove the old "j" property and 'ext_j' from RISCVCPUConfig.
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c | 6 +++---
>  target/riscv/cpu.h | 1 -
>  2 files changed, 3 insertions(+), 4 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 76dcf26f6c..86edc08545 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -1118,7 +1118,7 @@ static void riscv_cpu_sync_misa_cfg(CPURISCVState *=
env)
>      if (riscv_cpu_cfg(env)->ext_v) {
>          ext |=3D RVV;
>      }
> -    if (riscv_cpu_cfg(env)->ext_j) {
> +    if (riscv_has_ext(env, RVJ)) {
>          ext |=3D RVJ;
>      }
>
> @@ -1451,6 +1451,8 @@ static const RISCVCPUMisaExtConfig misa_ext_cfgs[] =
=3D {
>       .misa_bit =3D RVU, .enabled =3D true},
>      {.name =3D "h", .description =3D "Hypervisor",
>       .misa_bit =3D RVH, .enabled =3D true},
> +    {.name =3D "x-j", .description =3D "Dynamic translated languages",
> +     .misa_bit =3D RVJ, .enabled =3D false},
>  };
>
>  static void riscv_cpu_add_misa_properties(Object *cpu_obj)
> @@ -1547,7 +1549,6 @@ static Property riscv_cpu_extensions[] =3D {
>
>      /* These are experimental so mark with 'x-' */
>      DEFINE_PROP_BOOL("x-zicond", RISCVCPU, cfg.ext_zicond, false),
> -    DEFINE_PROP_BOOL("x-j", RISCVCPU, cfg.ext_j, false),
>      /* ePMP 0.9.3 */
>      DEFINE_PROP_BOOL("x-epmp", RISCVCPU, cfg.epmp, false),
>      DEFINE_PROP_BOOL("x-smaia", RISCVCPU, cfg.ext_smaia, false),
> @@ -1579,7 +1580,6 @@ static void register_cpu_props(Object *obj)
>       */
>      if (cpu->env.misa_ext !=3D 0) {
>          cpu->cfg.ext_v =3D misa_ext & RVV;
> -        cpu->cfg.ext_j =3D misa_ext & RVJ;
>
>          /*
>           * We don't want to set the default riscv_cpu_extensions
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index f3cb28443c..43a40ba950 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -419,7 +419,6 @@ typedef struct {
>
>  struct RISCVCPUConfig {
>      bool ext_g;
> -    bool ext_j;
>      bool ext_v;
>      bool ext_zba;
>      bool ext_zbb;
> --
> 2.39.2
>
>

