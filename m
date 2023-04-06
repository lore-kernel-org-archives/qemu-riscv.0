Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pkDH9-0003VC-H9
	for mharc-qemu-riscv@gnu.org; Wed, 05 Apr 2023 20:14:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pkDH8-0003Ug-2u; Wed, 05 Apr 2023 20:14:50 -0400
Received: from mail-vs1-xe2b.google.com ([2607:f8b0:4864:20::e2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pkDH5-0001uw-TM; Wed, 05 Apr 2023 20:14:49 -0400
Received: by mail-vs1-xe2b.google.com with SMTP id cz11so33028127vsb.6;
 Wed, 05 Apr 2023 17:14:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680740086;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ENjZvLTdL54R8QaAKwzzq498A2XLzSfJaYX7vtmQnhw=;
 b=QmeTOnJFhQUTxKhKlgpe6cWxHWx3qNwePxPLkSBTMKrFeKPC/vBhNYLKbDJoyw5dWA
 2qyWwHchpz0rhz87Z0gwBv3zZtUVE2vGqXbaqleBpjaqK3wXxe5x4QQ0/tikA26Xaj9F
 jNFswc5SdYevkRcDMfWomyN/Yvn+Z43M3AcHmfoDc/3VwurObHTxvrvVRt8zMI+Sk4Fq
 al2yAg+JQGuclral3fV9d1coC7rW1j01o12kOLseu0QxS+Ig+Yg+2P4WdTqAknPQvosh
 OLLMActjVQAc28dSZWEp62Zbtm023ND9kD2j97S/4L5StdVhsvpz5QnBfw8OzyvyM/HX
 eAYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680740086;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ENjZvLTdL54R8QaAKwzzq498A2XLzSfJaYX7vtmQnhw=;
 b=a8ivPnu455CyLrvcWKYEwWieK+mMwsNNrtEM9pv6//WhcEQ0zHB7v3zX/dnHPdDl6P
 3gUxinEZSUrCquJMclIEPWR5ewaps4cRRvoYoN5LxI7wG/ymeI3t7ylyu+AmNROO7eax
 QtPH7aox/XZCBv3UODTCJzmWxOlrqyzkDmywOGQQHF98vGpvnggK/nPkfnP0selp/HCa
 yMQcGPowIYs4y7fpfeu64WPl520kCY8ROzHRzqksTeuuWII7PNmLZLu0cNHQlVDIwjZp
 S5M2KTfXk3fx0LPftLv0bwWCe477bS0Psj9oLDUsWaLMGUkpW5VkJS2tXVcqd+CHVYt4
 XMzA==
X-Gm-Message-State: AAQBX9ernbcJT8FCvW4E+lSJ8k4aUpE2pNxGVteqv9XpAH+u1JNXGSOV
 d8THq7sQa+MfAU3ccfTFpempvuzYDlA/bAWeqes=
X-Google-Smtp-Source: AKy350a1KoZ/pH8Vba3Zr9nPLaHX/yGct6Cc6vBOgalC2QhETdmaQAI/ENtNoHEaC3nntD+WnOqBZOzbKUT2z/xXDZ4=
X-Received: by 2002:a67:c181:0:b0:42a:eb6:6c51 with SMTP id
 h1-20020a67c181000000b0042a0eb66c51mr6216453vsj.3.1680740086128; Wed, 05 Apr
 2023 17:14:46 -0700 (PDT)
MIME-Version: 1.0
References: <20230329172903.636383-1-dbarboza@ventanamicro.com>
 <20230329172903.636383-8-dbarboza@ventanamicro.com>
In-Reply-To: <20230329172903.636383-8-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 6 Apr 2023 10:14:20 +1000
Message-ID: <CAKmqyKOB-_Sfi8d7nEvUg9526WmLHTBwAsnn53sWi1rCvwA5+A@mail.gmail.com>
Subject: Re: [PATCH v3 07/20] target/riscv: remove cpu->cfg.ext_d
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2b;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe2b.google.com
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
X-List-Received-Date: Thu, 06 Apr 2023 00:14:50 -0000

On Thu, Mar 30, 2023 at 3:31=E2=80=AFAM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> Create a new "d" RISCVCPUMisaExtConfig property that will update
> env->misa_ext* with RVD. Instances of cpu->cfg.ext_d and similar are
> replaced with riscv_has_ext(env, RVD).
>
> Remove the old "d" property and 'ext_d' from RISCVCPUConfig.
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c | 13 ++++++-------
>  target/riscv/cpu.h |  1 -
>  2 files changed, 6 insertions(+), 8 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 693ff10cab..9bb714d0d8 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -812,13 +812,12 @@ static void riscv_cpu_validate_set_extensions(RISCV=
CPU *cpu, Error **errp)
>      /* Do some ISA extension error checking */
>      if (cpu->cfg.ext_g && !(cpu->cfg.ext_i && cpu->cfg.ext_m &&
>                              riscv_has_ext(env, RVA) &&
> -                            cpu->cfg.ext_f && cpu->cfg.ext_d &&
> +                            cpu->cfg.ext_f && riscv_has_ext(env, RVD) &&
>                              cpu->cfg.ext_icsr && cpu->cfg.ext_ifencei)) =
{
>          warn_report("Setting G will also set IMAFD_Zicsr_Zifencei");
>          cpu->cfg.ext_i =3D true;
>          cpu->cfg.ext_m =3D true;
>          cpu->cfg.ext_f =3D true;
> -        cpu->cfg.ext_d =3D true;
>          cpu->cfg.ext_icsr =3D true;
>          cpu->cfg.ext_ifencei =3D true;
>
> @@ -874,7 +873,7 @@ static void riscv_cpu_validate_set_extensions(RISCVCP=
U *cpu, Error **errp)
>          return;
>      }
>
> -    if (cpu->cfg.ext_d && !cpu->cfg.ext_f) {
> +    if (riscv_has_ext(env, RVD) && !cpu->cfg.ext_f) {
>          error_setg(errp, "D extension requires F extension");
>          return;
>      }
> @@ -894,7 +893,7 @@ static void riscv_cpu_validate_set_extensions(RISCVCP=
U *cpu, Error **errp)
>          cpu->cfg.ext_zve32f =3D true;
>      }
>
> -    if (cpu->cfg.ext_zve64d && !cpu->cfg.ext_d) {
> +    if (cpu->cfg.ext_zve64d && !riscv_has_ext(env, RVD)) {
>          error_setg(errp, "Zve64d/V extensions require D extension");
>          return;
>      }
> @@ -1104,7 +1103,7 @@ static void riscv_cpu_sync_misa_cfg(CPURISCVState *=
env)
>      if (riscv_cpu_cfg(env)->ext_f) {
>          ext |=3D RVF;
>      }
> -    if (riscv_cpu_cfg(env)->ext_d) {
> +    if (riscv_has_ext(env, RVD)) {
>          ext |=3D RVD;
>      }
>      if (riscv_has_ext(env, RVC)) {
> @@ -1439,6 +1438,8 @@ static const RISCVCPUMisaExtConfig misa_ext_cfgs[] =
=3D {
>       .misa_bit =3D RVA, .enabled =3D true},
>      {.name =3D "c", .description =3D "Compressed instructions",
>       .misa_bit =3D RVC, .enabled =3D true},
> +    {.name =3D "d", .description =3D "Double-precision float point",
> +     .misa_bit =3D RVD, .enabled =3D true},
>  };
>
>  static void riscv_cpu_add_misa_properties(Object *cpu_obj)
> @@ -1466,7 +1467,6 @@ static Property riscv_cpu_extensions[] =3D {
>      DEFINE_PROP_BOOL("g", RISCVCPU, cfg.ext_g, false),
>      DEFINE_PROP_BOOL("m", RISCVCPU, cfg.ext_m, true),
>      DEFINE_PROP_BOOL("f", RISCVCPU, cfg.ext_f, true),
> -    DEFINE_PROP_BOOL("d", RISCVCPU, cfg.ext_d, true),
>      DEFINE_PROP_BOOL("s", RISCVCPU, cfg.ext_s, true),
>      DEFINE_PROP_BOOL("u", RISCVCPU, cfg.ext_u, true),
>      DEFINE_PROP_BOOL("v", RISCVCPU, cfg.ext_v, false),
> @@ -1578,7 +1578,6 @@ static void register_cpu_props(Object *obj)
>          cpu->cfg.ext_e =3D misa_ext & RVE;
>          cpu->cfg.ext_m =3D misa_ext & RVM;
>          cpu->cfg.ext_f =3D misa_ext & RVF;
> -        cpu->cfg.ext_d =3D misa_ext & RVD;
>          cpu->cfg.ext_v =3D misa_ext & RVV;
>          cpu->cfg.ext_s =3D misa_ext & RVS;
>          cpu->cfg.ext_u =3D misa_ext & RVU;
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index c6dc24d236..e4cf79e36f 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -423,7 +423,6 @@ struct RISCVCPUConfig {
>      bool ext_g;
>      bool ext_m;
>      bool ext_f;
> -    bool ext_d;
>      bool ext_s;
>      bool ext_u;
>      bool ext_h;
> --
> 2.39.2
>
>

