Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pHGmE-0003xn-WE
	for mharc-qemu-riscv@gnu.org; Sun, 15 Jan 2023 23:07:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pHGmD-0003xV-Fh; Sun, 15 Jan 2023 23:07:17 -0500
Received: from mail-vs1-xe2b.google.com ([2607:f8b0:4864:20::e2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pHGmC-0002u8-0q; Sun, 15 Jan 2023 23:07:17 -0500
Received: by mail-vs1-xe2b.google.com with SMTP id 3so27877563vsq.7;
 Sun, 15 Jan 2023 20:07:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=TWaWNkZ9HOhNO3rSyGQwgo3VeDHHzXOK4yVjYhGODo0=;
 b=G7CX7x2Syz6UVoMqzlCG6tmdzoxF12PkERPUnuOnGHmycrJ33Le7+N9hYXI1NPtgar
 izOwlGY4xWJnDxdc9Eyhv2ghE6lil3Ln4cKD6Da8Kacj57gDhbvkY3XGSTCLkDxzUWVG
 jQJTkFPKV8Bs5CktCfu6PVGgQ2dmAGPMNhhXzF+eyLScocSkE3FcfUQlEdkc8YRmUhH6
 yF8wTHFEr54yFjKhDP9seWkhz3wykpegbk7dyRZgCRe47pCPeUnTn7zfvdf0MF+LmbKy
 bEprpqvISm0OBrZyoY23Bl27pnBlQsIt3H5ycwHmFmlh1jBXyCPCMvZMTA8f5FPnHJgz
 YEsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TWaWNkZ9HOhNO3rSyGQwgo3VeDHHzXOK4yVjYhGODo0=;
 b=Y/xIdDQL3acQdBjBKV8I9XnvSbaBBUB3TpTL/coV3z1qPgPrxSFf0GWzAoDtWZyjoM
 +chgDXtCsW74hzJhQb2K/NPP3EFIsfE+8MjTGMs864Kb1lu5i5dkRFkdrgGBCPqO3scJ
 +63uCA2RNHshQeNsLRpdOZLyqm1JTO54YLvFAlcLVdGpCJlEvYXUIF8lcUFKUlC20+d6
 xxm91RhQCQu6w/jzpLNqylMPw1YfwZf9PZ8VRNaba+rwFEIRTLCC5RoK28AwMDV1/aJo
 aQ3vDsmK9o3UXht48f8xTiPeT8rE3nqiM2zBz3Klc/UTSXN7G7fnntyv1yWhvIIPu77b
 w2fw==
X-Gm-Message-State: AFqh2kpW7gBAu/RZcCNYr0OhN1Er+V2c69KAOlgumHvYVUn6NV5FfhQY
 YIDW/SqkC0zsb3cVOOYyiXCcRYo8LO6BmkBSmd0=
X-Google-Smtp-Source: AMrXdXunvGtqVa2Who3IhTCLyfZ2H0cvEIx7wPw66s/6T9BuLIwL04DsZ73ZnvuAtXVQgIfUb3R9+4bQlKqM+SvgeQU=
X-Received: by 2002:a67:c508:0:b0:3d3:c7d9:7b62 with SMTP id
 e8-20020a67c508000000b003d3c7d97b62mr445423vsk.72.1673842034054; Sun, 15 Jan
 2023 20:07:14 -0800 (PST)
MIME-Version: 1.0
References: <20230113103453.42776-1-alexghiti@rivosinc.com>
 <20230113103453.42776-2-alexghiti@rivosinc.com>
In-Reply-To: <20230113103453.42776-2-alexghiti@rivosinc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 16 Jan 2023 14:06:48 +1000
Message-ID: <CAKmqyKOG-VYhTVf_PRha1MfgEZjkT9mZtsn6L-DEWHruM4j3jQ@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] riscv: Pass Object to register_cpu_props instead
 of DeviceState
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Andrew Jones <ajones@ventanamicro.com>, 
 Frank Chang <frank.chang@sifive.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Mon, 16 Jan 2023 04:07:17 -0000

On Fri, Jan 13, 2023 at 8:36 PM Alexandre Ghiti <alexghiti@rivosinc.com> wrote:
>
> One can extract the DeviceState pointer from the Object pointer, so pass
> the Object for future commits to access other fields of Object.
>
> No functional changes intended.
>
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c | 15 ++++++++-------
>  1 file changed, 8 insertions(+), 7 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index cc75ca7667..7181b34f86 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -200,7 +200,7 @@ static const char * const riscv_intr_names[] = {
>      "reserved"
>  };
>
> -static void register_cpu_props(DeviceState *dev);
> +static void register_cpu_props(Object *obj);
>
>  const char *riscv_cpu_get_trap_name(target_ulong cause, bool async)
>  {
> @@ -238,7 +238,7 @@ static void riscv_any_cpu_init(Object *obj)
>      set_misa(env, MXL_RV64, RVI | RVM | RVA | RVF | RVD | RVC | RVU);
>  #endif
>      set_priv_version(env, PRIV_VERSION_1_12_0);
> -    register_cpu_props(DEVICE(obj));
> +    register_cpu_props(obj);
>  }
>
>  #if defined(TARGET_RISCV64)
> @@ -247,7 +247,7 @@ static void rv64_base_cpu_init(Object *obj)
>      CPURISCVState *env = &RISCV_CPU(obj)->env;
>      /* We set this in the realise function */
>      set_misa(env, MXL_RV64, 0);
> -    register_cpu_props(DEVICE(obj));
> +    register_cpu_props(obj);
>      /* Set latest version of privileged specification */
>      set_priv_version(env, PRIV_VERSION_1_12_0);
>  }
> @@ -280,7 +280,7 @@ static void rv128_base_cpu_init(Object *obj)
>      CPURISCVState *env = &RISCV_CPU(obj)->env;
>      /* We set this in the realise function */
>      set_misa(env, MXL_RV128, 0);
> -    register_cpu_props(DEVICE(obj));
> +    register_cpu_props(obj);
>      /* Set latest version of privileged specification */
>      set_priv_version(env, PRIV_VERSION_1_12_0);
>  }
> @@ -290,7 +290,7 @@ static void rv32_base_cpu_init(Object *obj)
>      CPURISCVState *env = &RISCV_CPU(obj)->env;
>      /* We set this in the realise function */
>      set_misa(env, MXL_RV32, 0);
> -    register_cpu_props(DEVICE(obj));
> +    register_cpu_props(obj);
>      /* Set latest version of privileged specification */
>      set_priv_version(env, PRIV_VERSION_1_12_0);
>  }
> @@ -343,7 +343,7 @@ static void riscv_host_cpu_init(Object *obj)
>  #elif defined(TARGET_RISCV64)
>      set_misa(env, MXL_RV64, 0);
>  #endif
> -    register_cpu_props(DEVICE(obj));
> +    register_cpu_props(obj);
>  }
>  #endif
>
> @@ -1083,9 +1083,10 @@ static Property riscv_cpu_extensions[] = {
>      DEFINE_PROP_END_OF_LIST(),
>  };
>
> -static void register_cpu_props(DeviceState *dev)
> +static void register_cpu_props(Object *obj)
>  {
>      Property *prop;
> +    DeviceState *dev = DEVICE(obj);
>
>      for (prop = riscv_cpu_extensions; prop && prop->name; prop++) {
>          qdev_property_add_static(dev, prop);
> --
> 2.37.2
>
>

