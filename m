Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pkDOj-0002zm-CM
	for mharc-qemu-riscv@gnu.org; Wed, 05 Apr 2023 20:22:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pkDOh-0002yT-Os; Wed, 05 Apr 2023 20:22:39 -0400
Received: from mail-ua1-x932.google.com ([2607:f8b0:4864:20::932])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pkDOf-0004on-WB; Wed, 05 Apr 2023 20:22:39 -0400
Received: by mail-ua1-x932.google.com with SMTP id i22so26803108uat.8;
 Wed, 05 Apr 2023 17:22:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680740556;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rD9Nyl5Ghq+rrnAmSw5uYHh+vSsyBp2OCSD0omgxGXw=;
 b=W1MARoTIOFzzc/JjsSMJD8++FphEOGKoAR6znxhT9EWZaBIk7ooCs5BVdYdpkIZuqB
 IMWD4x2BF8Bz43NTdEyDerkm/ycRtIDyDn2sIMuERCjk1Q4Jj8u41e5CM0b5fUC2zCig
 poOWOZC1OKbdmgW6puf4wwCsnc7ee35qMruntKsxk9s9zJYuFiTM/3qb8HGyOeYbd1Vc
 B77zRp/gu4j43HC/Xmgcayn4eCGWQon0Dns/zUGCS1dITyzA7pbTIRO8YNhzGEEt2Z6Y
 N/vv4OSlFgDT5xlXpsINKa0Z1xWCXTPFburQrCjR4sMipZChFmWaI1LMsfxFwf+mnaU/
 A/Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680740556;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rD9Nyl5Ghq+rrnAmSw5uYHh+vSsyBp2OCSD0omgxGXw=;
 b=gflSQOArNSlonWpJ9otahi+oF3egDw6Iw6MP7qZoEEz+VXd/5AOg/UD8tehiBknI/Z
 uLHmsK2JRKoNxLmPSQHY/0YsQo7zl2Jtrgju7mbbTKGe8WcXFn/JBuMsQcK/LxGUmW0Y
 WU0PsyXhhMJgQtUoaH+ZFYswx+xEYiey5pSk1U7xz1dyJF2nxZUwn9OvugQPb23sDaLY
 Y/kKRrPZ/BmU9KxXnbOTARwOcu2TN3V6i4GAhO1UQJW+5bRgA6gXfs8y9/GxvHufMpGs
 dU/yyj8yg3jBbThmKm1SpwhxvO8yS0GZuKLwiMv0n0SB0j7GW15TgCl+/V+eQnoppzhe
 L+lQ==
X-Gm-Message-State: AAQBX9d1G/5EV/MSrrQjFN+6CzrpeeUQrY0gIJOPp7sPd4L/9B1HoxtY
 lJRjlq3RqmRNhodRR+LYgA5Hbfz1QR6M5GWoJZg=
X-Google-Smtp-Source: AKy350aT6Mw6hPutcfIJLpyuwPRhEtnQ6HckBuLtLBwQFs8KOCu5//cwYAFIJqNqHiUZyNxGpZsATlBeoJVdnjJlqhg=
X-Received: by 2002:ab0:5485:0:b0:765:c225:c914 with SMTP id
 p5-20020ab05485000000b00765c225c914mr5225889uaa.1.1680740556538; Wed, 05 Apr
 2023 17:22:36 -0700 (PDT)
MIME-Version: 1.0
References: <20230329172903.636383-1-dbarboza@ventanamicro.com>
 <20230329172903.636383-18-dbarboza@ventanamicro.com>
In-Reply-To: <20230329172903.636383-18-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 6 Apr 2023 10:22:10 +1000
Message-ID: <CAKmqyKN2q8NK62w+MdzihfxKiwrqSzYGQ166tJZbgObCiLpong@mail.gmail.com>
Subject: Re: [PATCH v3 17/20] target/riscv: remove riscv_cpu_sync_misa_cfg()
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::932;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x932.google.com
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
X-List-Received-Date: Thu, 06 Apr 2023 00:22:40 -0000

On Thu, Mar 30, 2023 at 3:31=E2=80=AFAM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> This function was created to move the sync between cpu->cfg.ext_N bit
> changes to env->misa_ext* from the validation step to an ealier step,
> giving us a guarantee that we could use either cpu->cfg.ext_N or
> riscv_has_ext(env,N) in the validation.
>
> We don't have any cpu->cfg.ext_N left that has an existing MISA bit
> (cfg.ext_g will be handled shortly). The function is now a no-op, simply
> copying the existing values of misa_ext* back to misa_ext*.
>
> Remove it.
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c | 52 ----------------------------------------------
>  1 file changed, 52 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index b40a55bc8d..3eb3b7dc59 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -1081,50 +1081,6 @@ static void riscv_cpu_finalize_features(RISCVCPU *=
cpu, Error **errp)
>  #endif
>  }
>
> -static void riscv_cpu_sync_misa_cfg(CPURISCVState *env)
> -{
> -    uint32_t ext =3D 0;
> -
> -    if (riscv_has_ext(env, RVI)) {
> -        ext |=3D RVI;
> -    }
> -    if (riscv_has_ext(env, RVE)) {
> -        ext |=3D RVE;
> -    }
> -    if (riscv_has_ext(env, RVM)) {
> -        ext |=3D RVM;
> -    }
> -    if (riscv_has_ext(env, RVA)) {
> -        ext |=3D RVA;
> -    }
> -    if (riscv_has_ext(env, RVF)) {
> -        ext |=3D RVF;
> -    }
> -    if (riscv_has_ext(env, RVD)) {
> -        ext |=3D RVD;
> -    }
> -    if (riscv_has_ext(env, RVC)) {
> -        ext |=3D RVC;
> -    }
> -    if (riscv_has_ext(env, RVS)) {
> -        ext |=3D RVS;
> -    }
> -    if (riscv_has_ext(env, RVU)) {
> -        ext |=3D RVU;
> -    }
> -    if (riscv_has_ext(env, RVH)) {
> -        ext |=3D RVH;
> -    }
> -    if (riscv_has_ext(env, RVV)) {
> -        ext |=3D RVV;
> -    }
> -    if (riscv_has_ext(env, RVJ)) {
> -        ext |=3D RVJ;
> -    }
> -
> -    env->misa_ext =3D env->misa_ext_mask =3D ext;
> -}
> -
>  static void riscv_cpu_validate_misa_priv(CPURISCVState *env, Error **err=
p)
>  {
>      if (riscv_has_ext(env, RVH) && env->priv_ver < PRIV_VERSION_1_12_0) =
{
> @@ -1168,14 +1124,6 @@ static void riscv_cpu_realize(DeviceState *dev, Er=
ror **errp)
>          set_priv_version(env, priv_version);
>      }
>
> -    /*
> -     * We can't be sure of whether we set defaults during cpu_init()
> -     * or whether the user enabled/disabled some bits via cpu->cfg
> -     * flags. Sync env->misa_ext with cpu->cfg now to allow us to
> -     * use just env->misa_ext later.
> -     */
> -    riscv_cpu_sync_misa_cfg(env);
> -
>      riscv_cpu_validate_misa_priv(env, &local_err);
>      if (local_err !=3D NULL) {
>          error_propagate(errp, local_err);
> --
> 2.39.2
>
>

