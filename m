Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ppHNY-0006hU-T5
	for mharc-qemu-riscv@gnu.org; Wed, 19 Apr 2023 19:38:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1ppHNV-0006go-E1; Wed, 19 Apr 2023 19:38:21 -0400
Received: from mail-ua1-x930.google.com ([2607:f8b0:4864:20::930])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1ppHNT-0000gd-T9; Wed, 19 Apr 2023 19:38:21 -0400
Received: by mail-ua1-x930.google.com with SMTP id l13so1014758uan.10;
 Wed, 19 Apr 2023 16:38:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681947498; x=1684539498;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aNYSQ2itnZx1T+TA2cQgQ4Td9fr74yXDe08hrzCiLxI=;
 b=IJO7LdA08M/b7PJxtSfrlu4zAd7Of3A1aBsg39Ho7UeEkY0URSpR/JASaKOr8qykF0
 2jopCC8WdQKJlx1gzlT6zsiLuJ+RG7fZuIenfkMN/xbN0UGzY8EwpcSDTBscPJXpuhKy
 6c1FZXGafte1C3VDfeGoZTh7bq67qF3Ykiv69v/kKJgsaz9SkEpkt8Xck2b1eOQ6XuYn
 6Jl/f8SQySIHrqoSrDpdY46AzWmalAEvww22O+at9BqXBuG9Qqx5WmacB4NQsHqtD8SD
 hS67YcuoB/l1gm1z1h4JZwWkmW7v9c9w9TOua3kNErZuO5LdCXrwW8TFi805WegPhFkU
 OnQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681947498; x=1684539498;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aNYSQ2itnZx1T+TA2cQgQ4Td9fr74yXDe08hrzCiLxI=;
 b=i7+gQpgehbR+BkHP5EL4gZp9P7t23ebfM+VIaQ+RFvQpUqjsTFYcwL2LCpziu/5AYU
 c5PmJMJAp6Q9wNGZNs1o4N3wMTDPkU8QsPw3Cbk9UjOqLSugKoUGsrQrXSFt1TnsIDhd
 lSwdeVxRvw0TANSdhRR+03Nr9zFBRaEiP7CS9BZ6EEzSo3e6diSHAsItA7LyzBUO8JA8
 5T2V8TEA4raX0mnoPXET1P1+sOVX6/vxknP0ncpw/NvR7kEAXXF7xv/JFC+jrqGyLw3B
 kMDnG6ZGLpBiJ8xa6yYiWc5GbxUayzVDsuaNk3F07J1ktYdWMAXpT7Cxt95l3KXT/G2c
 OPQA==
X-Gm-Message-State: AAQBX9ewQj3YcUOhEEe4he0ymImDemAQtkPhjUuSgq0K1DIgDvay24B2
 o8qbmc0d5kOS2QhPuTJr1/eKpSnvOIJA/k/mLKg=
X-Google-Smtp-Source: AKy350apOQUEXyChj3cZctlU33o2ac2CzxgUFtSrvFaYC/I3ZxTKCUl+TYpWwpRVagAy/bahTzzIJeVVqqpebeY9qsc=
X-Received: by 2002:a1f:e7c1:0:b0:43b:ef4d:f6c0 with SMTP id
 e184-20020a1fe7c1000000b0043bef4df6c0mr786217vkh.0.1681947498009; Wed, 19 Apr
 2023 16:38:18 -0700 (PDT)
MIME-Version: 1.0
References: <20230417140013.58893-1-dbarboza@ventanamicro.com>
 <20230417140013.58893-3-dbarboza@ventanamicro.com>
In-Reply-To: <20230417140013.58893-3-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 20 Apr 2023 09:37:51 +1000
Message-ID: <CAKmqyKOq+SWD6fVZsiRBLBqhkcuGD9Z4cbtksrsQBLc5RsZ5EA@mail.gmail.com>
Subject: Re: [PATCH v7 02/12] target/riscv/cpu.c: remove set_vext_version()
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::930;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x930.google.com
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
X-List-Received-Date: Wed, 19 Apr 2023 23:38:22 -0000

On Tue, Apr 18, 2023 at 12:08=E2=80=AFAM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> This setter is doing nothing else but setting env->vext_ver. Assign the
> value directly.
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
> Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>

I think you dropped my previous reviews

Alistair

> ---
>  target/riscv/cpu.c | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index feca13aefb..fed7b467e4 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -252,11 +252,6 @@ static void set_priv_version(CPURISCVState *env, int=
 priv_ver)
>      env->priv_ver =3D priv_ver;
>  }
>
> -static void set_vext_version(CPURISCVState *env, int vext_ver)
> -{
> -    env->vext_ver =3D vext_ver;
> -}
> -
>  #ifndef CONFIG_USER_ONLY
>  static uint8_t satp_mode_from_str(const char *satp_mode_str)
>  {
> @@ -834,7 +829,7 @@ static void riscv_cpu_validate_v(CPURISCVState *env, =
RISCVCPUConfig *cfg,
>          qemu_log("vector version is not specified, "
>                   "use the default value v1.0\n");
>      }
> -    set_vext_version(env, vext_version);
> +    env->vext_ver =3D vext_version;
>  }
>
>  /*
> --
> 2.39.2
>
>

