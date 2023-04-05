Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pkCbN-0004eN-IJ
	for mharc-qemu-riscv@gnu.org; Wed, 05 Apr 2023 19:31:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pkCbL-0004cA-W0; Wed, 05 Apr 2023 19:31:40 -0400
Received: from mail-vs1-xe2e.google.com ([2607:f8b0:4864:20::e2e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pkCbK-0002EB-AC; Wed, 05 Apr 2023 19:31:39 -0400
Received: by mail-vs1-xe2e.google.com with SMTP id z17so26336134vsf.4;
 Wed, 05 Apr 2023 16:31:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680737497;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7eWaHMi4sWUY6e28zgWlSSNGep43sNdkDyFjL6Fqfu0=;
 b=o4BfR80KkdYi42PuNUOfk0v42FU0QxE7bTyD8Cg/9UyIxEra9q20UNYapciy8ayLRU
 QX7MX7PeXnNeXhRkWE1Wzre8Lpa6n+FxjygNP4tSYwQhqHyOxo/3SOCUqoqttxBj1a+Z
 huS4+2ZeYYFdwSEFNBxnSGCp0sM8qJpiK7cHS25mvtZYzXjPEqf+COQpuZYPKl4qAntK
 B2L1a/hmztsUpKd64o8TYihU9HdFcxrqT4Pf6z2iEwBi3gzjxwLQS4LsJcaEZ3isDDTw
 IYfkBzvsaAX051FZZWlsU4nJOJeQ2G8e8o8vHFEKNXr/BsHXMwKtmw6+ZmEFa/1lz466
 dQLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680737497;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7eWaHMi4sWUY6e28zgWlSSNGep43sNdkDyFjL6Fqfu0=;
 b=t7czsFq++JU+7E6gKF/gDAGszlE5JBrzi8aOhC4y4EjIN9CCLWptVKjjxHFFGuzkdc
 9inBdFZJ9WjSr+jYFpe65zuPfvVpeSksLMj9VvlknMwhedb8Kt+GWwbCsNxCsC9ruKKz
 bIeD//VnWNtoGSMTQrLTJOuTnhege5lNccgQw0F7E94cq72X6fJS/oO9Bh1spHYgMiBT
 Ibee/7TIsdhQtCC9fqYdMMGxi5j0RNxnzHKoBWEcTf3Dr9wiwIxNEdiBqP4If1he+n54
 Dhv+e6tNopAJ0zdBu9hmyY4IV11oXK+c069fg+6v5M7grTsmu5T21O+QwEM0yKIVJbVK
 N4oQ==
X-Gm-Message-State: AAQBX9ezKVXyhXH996SUwKS9hTaDza/hlROnSAiIKIfOJZOimZNRZXo4
 5J6Lwvs1CgUrVRr6pk8Sp83DXfWzGHg2nP7AC1c=
X-Google-Smtp-Source: AKy350adkWkU0C5uEb3EvE9Mzmr5tkNS2Mmg1iCpWApa1N0lsdVAiYqUTR0EHNwM5P3zqvB+BGsEV58HL8GPRqs/gsc=
X-Received: by 2002:a67:d60c:0:b0:425:969d:3709 with SMTP id
 n12-20020a67d60c000000b00425969d3709mr5914150vsj.3.1680737496747; Wed, 05 Apr
 2023 16:31:36 -0700 (PDT)
MIME-Version: 1.0
References: <20230329172903.636383-1-dbarboza@ventanamicro.com>
 <20230329172903.636383-3-dbarboza@ventanamicro.com>
In-Reply-To: <20230329172903.636383-3-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 6 Apr 2023 09:31:10 +1000
Message-ID: <CAKmqyKMq6Uf1FzJqe3E-MaXLeogjGS9+vbTJSFzU1sU_7h_4bg@mail.gmail.com>
Subject: Re: [PATCH v3 02/20] target/riscv: remove MISA properties from
 isa_edata_arr[]
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2e;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe2e.google.com
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
X-List-Received-Date: Wed, 05 Apr 2023 23:31:40 -0000

On Thu, Mar 30, 2023 at 3:33=E2=80=AFAM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> The code that disables extensions if there's a priv version mismatch
> uses cpu->cfg.ext_N properties to do its job.
>
> We're aiming to not rely on cpu->cfg.ext_N props for MISA bits. Split
> the MISA related verifications in a new function, removing it from
> isa_edata_arr[].
>
> We're also erroring it out instead of disabling, making the cpu_init()
> function responsible for running an adequate priv spec for the MISA
> extensions it wants to use.
>
> Note that the RVV verification is being ignored since we're always have
> at least PRIV_VERSION_1_10_0.
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c | 19 +++++++++++++++++--
>  1 file changed, 17 insertions(+), 2 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 2711d80e16..21c0c637e4 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -72,10 +72,11 @@ struct isa_ext_data {
>   * 4. Non-standard extensions (starts with 'X') must be listed after all
>   *    standard extensions. They must be separated from other multi-lette=
r
>   *    extensions by an underscore.
> + *
> + * Single letter extensions are checked in riscv_cpu_validate_misa_priv(=
)
> + * instead.
>   */
>  static const struct isa_ext_data isa_edata_arr[] =3D {
> -    ISA_EXT_DATA_ENTRY(h, false, PRIV_VERSION_1_12_0, ext_h),
> -    ISA_EXT_DATA_ENTRY(v, false, PRIV_VERSION_1_10_0, ext_v),
>      ISA_EXT_DATA_ENTRY(zicbom, true, PRIV_VERSION_1_12_0, ext_icbom),
>      ISA_EXT_DATA_ENTRY(zicboz, true, PRIV_VERSION_1_12_0, ext_icboz),
>      ISA_EXT_DATA_ENTRY(zicond, true, PRIV_VERSION_1_12_0, ext_zicond),
> @@ -1131,6 +1132,14 @@ static void riscv_cpu_sync_misa_cfg(CPURISCVState =
*env)
>      env->misa_ext =3D env->misa_ext_mask =3D ext;
>  }
>
> +static void riscv_cpu_validate_misa_priv(CPURISCVState *env, Error **err=
p)
> +{
> +    if (riscv_has_ext(env, RVH) && env->priv_ver < PRIV_VERSION_1_12_0) =
{
> +        error_setg(errp, "H extension requires priv spec 1.12.0");
> +        return;
> +    }
> +}
> +
>  static void riscv_cpu_realize(DeviceState *dev, Error **errp)
>  {
>      CPUState *cs =3D CPU(dev);
> @@ -1174,6 +1183,12 @@ static void riscv_cpu_realize(DeviceState *dev, Er=
ror **errp)
>       */
>      riscv_cpu_sync_misa_cfg(env);
>
> +    riscv_cpu_validate_misa_priv(env, &local_err);
> +    if (local_err !=3D NULL) {
> +        error_propagate(errp, local_err);
> +        return;
> +    }
> +
>      /* Force disable extensions if priv spec version does not match */
>      for (i =3D 0; i < ARRAY_SIZE(isa_edata_arr); i++) {
>          if (isa_ext_is_enabled(cpu, &isa_edata_arr[i]) &&
> --
> 2.39.2
>
>

