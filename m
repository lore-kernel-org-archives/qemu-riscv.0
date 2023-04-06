Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pkF24-0006zW-NY
	for mharc-qemu-riscv@gnu.org; Wed, 05 Apr 2023 22:07:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pkF23-0006zH-Gb; Wed, 05 Apr 2023 22:07:23 -0400
Received: from mail-ua1-x92f.google.com ([2607:f8b0:4864:20::92f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pkF21-0006sP-ME; Wed, 05 Apr 2023 22:07:23 -0400
Received: by mail-ua1-x92f.google.com with SMTP id n17so26921365uaj.10;
 Wed, 05 Apr 2023 19:07:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680746840;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZzL9EU2zvMnScLiTuz5F/YKrUPv772mAnZrOfDQP2DU=;
 b=diUaet4Ga8CAn2ykWlHh/O5LHAKMBwhXHvyCWkY7iQnTObMTCOs8piPC/cLcLCcHK4
 4zCPzjHDNTn1ZX41rsH6RbiYZaMeta00eBiEkKiJfbSYrUqsxHY3kc2znrdHM8dlI/CB
 l1Zw/gEpQgz6J+GevxPBYqY9Z0uBM5wLZSXx3XEP4P30XokehtJb+03PA74jdT9ZrBnv
 WpKEmgjjtGaQ7x7vUjGA3Wz4p/MRCrzPf7wYJRVnXCxmVz2dwpW1yZi7O3e5rZvl1IAh
 lAXroUpLf9Zwj96wGJgyuocWMvkXrMCGYqmyO8eZ8Ek4vXX942PWZ72BkvkJbTpYIaBs
 4u4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680746840;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZzL9EU2zvMnScLiTuz5F/YKrUPv772mAnZrOfDQP2DU=;
 b=fzz4u8RsmxefOc7Byxv9Rjmu7gKK/NjgKNZN6ll1eQ/ZPsyCf4zLZzUPL3ofGETtHi
 E+HwupysrBLG4nCe5Gk+nxLpdaOlTW/JtMlE9zlf66Egwd+Mknm/8fkMGoxndVwNKSd4
 0N6pvea6VI/u2tXGF0tB4GWPw7WmW5pdoOf4uIkwAFe29QMk82QpVeKqgNRCKplgxfgx
 bnz9TYYb5RjCo2bDBKAMH7CvnVEJIKRjQQkWFLj34B3X68VHNvXBjbQFD7HfAnrG8EFd
 rPIQn+KYG+LcZp3LdGT67pAlFPHN7U3fmHdz8Ydj7Ph1GCEefa700k3OdCnxTPhxKy4z
 OaCA==
X-Gm-Message-State: AAQBX9dX4+z7UVobgb3z1aUv70RF7thMAk9fIOCYAEvEj55QfRVHjAs3
 b/JeR5YYtExipF1AFOnlK4RTIBsqZBcgLQiONYU=
X-Google-Smtp-Source: AKy350aLz9bmYmeP1WWGc/glj/zWzGuutQXx0YhzHuaL7bOAS0fAQ/H+pFVeFVnjy+dE1aolZX3DIpsenOKEcnslpgk=
X-Received: by 2002:a1f:ad0b:0:b0:43c:6481:2b50 with SMTP id
 w11-20020a1fad0b000000b0043c64812b50mr6232954vke.0.1680746840337; Wed, 05 Apr
 2023 19:07:20 -0700 (PDT)
MIME-Version: 1.0
References: <20230329200856.658733-1-dbarboza@ventanamicro.com>
 <20230329200856.658733-5-dbarboza@ventanamicro.com>
In-Reply-To: <20230329200856.658733-5-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 6 Apr 2023 12:06:54 +1000
Message-ID: <CAKmqyKMHBJphVYovJ4Gzi2FGKAZGwXGR7SGFny_z-KFOU0bALQ@mail.gmail.com>
Subject: Re: [PATCH v6 4/9] target/riscv: add PRIV_VERSION_LATEST
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com, Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::92f;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x92f.google.com
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
X-List-Received-Date: Thu, 06 Apr 2023 02:07:23 -0000

On Thu, Mar 30, 2023 at 6:11=E2=80=AFAM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> All these generic CPUs are using the latest priv available, at this
> moment PRIV_VERSION_1_12_0:
>
> - riscv_any_cpu_init()
> - rv32_base_cpu_init()
> - rv64_base_cpu_init()
> - rv128_base_cpu_init()
>
> Create a new PRIV_VERSION_LATEST enum and use it in those cases. I'll
> make it easier to update everything at once when a new priv version is
> available.
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
> Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c | 8 ++++----
>  target/riscv/cpu.h | 2 ++
>  2 files changed, 6 insertions(+), 4 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 75c3d4ed22..1743e9ede3 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -338,7 +338,7 @@ static void riscv_any_cpu_init(Object *obj)
>                                      VM_1_10_SV32 : VM_1_10_SV57);
>  #endif
>
> -    env->priv_ver =3D PRIV_VERSION_1_12_0;
> +    env->priv_ver =3D PRIV_VERSION_LATEST;
>  }
>
>  #if defined(TARGET_RISCV64)
> @@ -349,7 +349,7 @@ static void rv64_base_cpu_init(Object *obj)
>      set_misa(env, MXL_RV64, 0);
>      riscv_cpu_add_user_properties(obj);
>      /* Set latest version of privileged specification */
> -    env->priv_ver =3D PRIV_VERSION_1_12_0;
> +    env->priv_ver =3D PRIV_VERSION_LATEST;
>  #ifndef CONFIG_USER_ONLY
>      set_satp_mode_max_supported(RISCV_CPU(obj), VM_1_10_SV57);
>  #endif
> @@ -418,7 +418,7 @@ static void rv128_base_cpu_init(Object *obj)
>      set_misa(env, MXL_RV128, 0);
>      riscv_cpu_add_user_properties(obj);
>      /* Set latest version of privileged specification */
> -    env->priv_ver =3D PRIV_VERSION_1_12_0;
> +    env->priv_ver =3D PRIV_VERSION_LATEST;
>  #ifndef CONFIG_USER_ONLY
>      set_satp_mode_max_supported(RISCV_CPU(obj), VM_1_10_SV57);
>  #endif
> @@ -431,7 +431,7 @@ static void rv32_base_cpu_init(Object *obj)
>      set_misa(env, MXL_RV32, 0);
>      riscv_cpu_add_user_properties(obj);
>      /* Set latest version of privileged specification */
> -    env->priv_ver =3D PRIV_VERSION_1_12_0;
> +    env->priv_ver =3D PRIV_VERSION_LATEST;
>  #ifndef CONFIG_USER_ONLY
>      set_satp_mode_max_supported(RISCV_CPU(obj), VM_1_10_SV32);
>  #endif
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 02f26130d5..03b5cc2cf4 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -86,6 +86,8 @@ enum {
>      PRIV_VERSION_1_10_0 =3D 0,
>      PRIV_VERSION_1_11_0,
>      PRIV_VERSION_1_12_0,
> +
> +    PRIV_VERSION_LATEST =3D PRIV_VERSION_1_12_0,
>  };
>
>  #define VEXT_VERSION_1_00_0 0x00010000
> --
> 2.39.2
>
>

