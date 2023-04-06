Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pkDLl-00005y-J2
	for mharc-qemu-riscv@gnu.org; Wed, 05 Apr 2023 20:19:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pkDLk-0008VB-FM; Wed, 05 Apr 2023 20:19:36 -0400
Received: from mail-ua1-x92c.google.com ([2607:f8b0:4864:20::92c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pkDLi-0003IQ-Nj; Wed, 05 Apr 2023 20:19:36 -0400
Received: by mail-ua1-x92c.google.com with SMTP id n1so304855uae.9;
 Wed, 05 Apr 2023 17:19:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680740373;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6+qMYf8C6NH2Aq6wrRoivpvXaikZW2wath4EgVBBufY=;
 b=YoYdB+Fqk82dX8XOFuaomkziBemlLM5sJ1xtbxALbQL/ve3QCDG32QXiQesco/+ANa
 oN/L9AyTtVfAF/XBiYnhUziaUQWctKInIU6Dr9QOrqs7QtPAMN29ERNtD0a2wcNfxFf2
 ja9cGtUkIbgfpzpfiY0xWuh8+t4vpFdDZ4GJAQSyEZNCUMkpJC0W2MfMRJ2+Ono3a+3a
 ATS6CfiKw2IUVjai+K9Z9n11DqHBi+KeIvKR2CyiUS+qxGvBMIgZiiX07DW+cFfyA4ME
 u6fDQWWedkUbDqZ/91+OXOUiN3k8y49h/hHE9UQo+TI09D+6A2YoHoE9Psytkcok7rIa
 R8Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680740373;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6+qMYf8C6NH2Aq6wrRoivpvXaikZW2wath4EgVBBufY=;
 b=WvmLuuPRoc9hMdx5lTVITWz+B0j5MxstLC2MxfOaGJ+m+okAzD2/0BFfodQe2/UQ9N
 g/GV6d3esn08y7z6O0p7X183l1uHLq00mhGdfy6lujYPmFV8aPmT4QfZin+RGqS5IANy
 42iLd2jRi/ItXpqdz7tEtUSKyUpTAET8OeyZELheZsXRm9WHSB5VZFLHGAfExv8qFSal
 AU1Hbyo8iR8l2GMEUrAmCthaRvRO25RTP00MyiIImWnqY2AUPUXh36AesJuAtrXILMuO
 D5KeJMZdUckBbdG4n/la4XSUJ0VYm98gunjXTNdRf3YM0ewVKBYYEzAGBujpYrcYO4rw
 dBbw==
X-Gm-Message-State: AAQBX9eN9iUHOljvM7nLoWxNRN14sQlR9JEc+UUBYwFTCl+r697UcPft
 cECVnMcsH8twSaYcLDZOzsAy8T1o82SQTm8BQg8=
X-Google-Smtp-Source: AKy350abnysa5flNbDv47BBfcaKFEvuUHjCVk55mFdgsB4lbr2Ht1MF7XNlpwaybFe8wSjCfM1xaqaGHXU/zz6F0pkU=
X-Received: by 2002:a1f:280b:0:b0:43b:e059:987f with SMTP id
 o11-20020a1f280b000000b0043be059987fmr5758065vko.0.1680740373322; Wed, 05 Apr
 2023 17:19:33 -0700 (PDT)
MIME-Version: 1.0
References: <20230329172903.636383-1-dbarboza@ventanamicro.com>
 <20230329172903.636383-14-dbarboza@ventanamicro.com>
In-Reply-To: <20230329172903.636383-14-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 6 Apr 2023 10:19:07 +1000
Message-ID: <CAKmqyKMDsKszFh-yUfq=cD_c2=0vz=M_1=joC8awy0vP2UXtqg@mail.gmail.com>
Subject: Re: [PATCH v3 13/20] target/riscv: remove cpu->cfg.ext_u
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::92c;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x92c.google.com
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
X-List-Received-Date: Thu, 06 Apr 2023 00:19:36 -0000

On Thu, Mar 30, 2023 at 3:32=E2=80=AFAM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> Create a new "u" RISCVCPUMisaExtConfig property that will update
> env->misa_ext* with RVU. Instances of cpu->cfg.ext_u and similar are
> replaced with riscv_has_ext(env, RVU).
>
> Remove the old "u" property and 'ext_u' from RISCVCPUConfig.
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c | 9 ++++-----
>  target/riscv/cpu.h | 1 -
>  2 files changed, 4 insertions(+), 6 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 59f6711f94..a72bc651cf 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -400,7 +400,6 @@ static void rv64_thead_c906_cpu_init(Object *obj)
>      set_priv_version(env, PRIV_VERSION_1_11_0);
>
>      cpu->cfg.ext_g =3D true;
> -    cpu->cfg.ext_u =3D true;
>      cpu->cfg.ext_icsr =3D true;
>      cpu->cfg.ext_zfh =3D true;
>      cpu->cfg.mmu =3D true;
> @@ -835,7 +834,7 @@ static void riscv_cpu_validate_set_extensions(RISCVCP=
U *cpu, Error **errp)
>          return;
>      }
>
> -    if (riscv_has_ext(env, RVS) && !cpu->cfg.ext_u) {
> +    if (riscv_has_ext(env, RVS) && !riscv_has_ext(env, RVU)) {
>          error_setg(errp,
>                     "Setting S extension without U extension is illegal")=
;
>          return;
> @@ -1110,7 +1109,7 @@ static void riscv_cpu_sync_misa_cfg(CPURISCVState *=
env)
>      if (riscv_has_ext(env, RVS)) {
>          ext |=3D RVS;
>      }
> -    if (riscv_cpu_cfg(env)->ext_u) {
> +    if (riscv_has_ext(env, RVU)) {
>          ext |=3D RVU;
>      }
>      if (riscv_cpu_cfg(env)->ext_h) {
> @@ -1448,6 +1447,8 @@ static const RISCVCPUMisaExtConfig misa_ext_cfgs[] =
=3D {
>       .misa_bit =3D RVM, .enabled =3D true},
>      {.name =3D "s", .description =3D "Supervisor-level instructions",
>       .misa_bit =3D RVS, .enabled =3D true},
> +    {.name =3D "u", .description =3D "User-level instructions",
> +     .misa_bit =3D RVU, .enabled =3D true},
>  };
>
>  static void riscv_cpu_add_misa_properties(Object *cpu_obj)
> @@ -1471,7 +1472,6 @@ static void riscv_cpu_add_misa_properties(Object *c=
pu_obj)
>  static Property riscv_cpu_extensions[] =3D {
>      /* Defaults for standard extensions */
>      DEFINE_PROP_BOOL("g", RISCVCPU, cfg.ext_g, false),
> -    DEFINE_PROP_BOOL("u", RISCVCPU, cfg.ext_u, true),
>      DEFINE_PROP_BOOL("v", RISCVCPU, cfg.ext_v, false),
>      DEFINE_PROP_BOOL("h", RISCVCPU, cfg.ext_h, true),
>      DEFINE_PROP_UINT8("pmu-num", RISCVCPU, cfg.pmu_num, 16),
> @@ -1578,7 +1578,6 @@ static void register_cpu_props(Object *obj)
>       */
>      if (cpu->env.misa_ext !=3D 0) {
>          cpu->cfg.ext_v =3D misa_ext & RVV;
> -        cpu->cfg.ext_u =3D misa_ext & RVU;
>          cpu->cfg.ext_h =3D misa_ext & RVH;
>          cpu->cfg.ext_j =3D misa_ext & RVJ;
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index fc35aa7509..7b98cf4dd7 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -419,7 +419,6 @@ typedef struct {
>
>  struct RISCVCPUConfig {
>      bool ext_g;
> -    bool ext_u;
>      bool ext_h;
>      bool ext_j;
>      bool ext_v;
> --
> 2.39.2
>
>

