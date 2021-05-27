Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lmO8Z-0005K4-HL
	for mharc-qemu-riscv@gnu.org; Thu, 27 May 2021 18:05:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lmO8X-0005Jk-TK; Thu, 27 May 2021 18:05:53 -0400
Received: from mail-io1-xd30.google.com ([2607:f8b0:4864:20::d30]:47048)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lmO8W-0004Kj-3y; Thu, 27 May 2021 18:05:53 -0400
Received: by mail-io1-xd30.google.com with SMTP id o21so2092974iow.13;
 Thu, 27 May 2021 15:05:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cDysua+4kuxWHfpZTIHNXbgpeWjdpl+1S0WyFIiaY0w=;
 b=Zuie2RrzHa9UGklZxfE1pSPWekkLEjI3irnR6XMaiWfTWoxCMpz+OVS/Feu/QLUaia
 u3XIurdXmzgTZRjywMDlnB9DG9W6NG7fH/+gACnLzke+hzIWjXhQtV3KoW1KkozOUyqs
 CL9lTsq5elTRCUZMXDb4KFz50ayDyjEgAxDBmg60Qu1OLOyW2A+y9KsE9ur8wlIRMnUc
 kPhbbHSfWZ40B32tzpo8+Td8IEMgyGI1zSvqME6EgnGPNs3zNCcTl/Bc2QssdhrcfXvj
 7zrelZmW/3UMfLNPl8Vi3K45V4FOUAFcD5mVdM2IthqkZHV4u8X/FV7zXOVHV1MA5kxi
 rGFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cDysua+4kuxWHfpZTIHNXbgpeWjdpl+1S0WyFIiaY0w=;
 b=jC50XH4/rT3Q5yTh+6sqdnHGeqjmftXR6ctF3lYPqwJPmXvFLp1Cpo0m04nMT8HzoC
 EndqC/5G4kDNMOgJ00ayTeWW8c5isTxq8UsMjmpgOKQOoQdw44SrBqowyTAemSue217j
 V2XfrRxkAVPgMqPPwMycKUTiP5Ub0supSwJN/jWAgec3BoYCEBiSRvTNX3wnvN3Veg8f
 4DWBjvsAZzIG/M6XjDf9VNWjtTYBswud6LtJaCuxTaQWbvCh4Gthz05CXo4uQTAcSOPH
 tMrVA6TP75RgvjNcZtYpDOiHVEuZKoDpK9FAwZ0IoUa6RVmNzxJzQ0diBbOs8NTSxhkT
 j38Q==
X-Gm-Message-State: AOAM532s5Y31sonT0bvzc0rFkI5JgDN11t5FpZYPd2annzo4nzykV03p
 JRlXu8jgDa5+WZ/3OXq/tp3cPc05VNLwPGi4PEs=
X-Google-Smtp-Source: ABdhPJy7dWXQ/M5hZ9LhfZACoLSv3och3mINC68SU+TTgVh334mmDg75K1pNxks4dNHJHNKOhgjUndIG4mCFiNIU880=
X-Received: by 2002:a05:6638:635:: with SMTP id
 h21mr5433878jar.135.1622153149423; 
 Thu, 27 May 2021 15:05:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210505160620.15723-1-frank.chang@sifive.com>
 <20210505160620.15723-18-frank.chang@sifive.com>
In-Reply-To: <20210505160620.15723-18-frank.chang@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 28 May 2021 08:05:22 +1000
Message-ID: <CAKmqyKMkUvTwxYiyDcLaKbu6OjpEZtfv9KRmjshVb0Vo9jx+=A@mail.gmail.com>
Subject: Re: [PATCH v6 17/17] target/riscv: rvb: add b-ext version cpu option
To: Frank Chang <frank.chang@sifive.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d30;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd30.google.com
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
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 27 May 2021 22:05:54 -0000

On Thu, May 6, 2021 at 2:27 AM <frank.chang@sifive.com> wrote:
>
> From: Frank Chang <frank.chang@sifive.com>
>
> Default b-ext version is v0.93.
>
> Signed-off-by: Frank Chang <frank.chang@sifive.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c | 23 +++++++++++++++++++++++
>  target/riscv/cpu.h |  3 +++
>  2 files changed, 26 insertions(+)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 1b3c5ba1480..32469f7c891 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -127,6 +127,11 @@ static void set_priv_version(CPURISCVState *env, int priv_ver)
>      env->priv_ver = priv_ver;
>  }
>
> +static void set_bext_version(CPURISCVState *env, int bext_ver)
> +{
> +    env->bext_ver = bext_ver;
> +}
> +
>  static void set_vext_version(CPURISCVState *env, int vext_ver)
>  {
>      env->vext_ver = vext_ver;
> @@ -385,6 +390,7 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
>      CPURISCVState *env = &cpu->env;
>      RISCVCPUClass *mcc = RISCV_CPU_GET_CLASS(dev);
>      int priv_version = PRIV_VERSION_1_11_0;
> +    int bext_version = BEXT_VERSION_0_93_0;
>      int vext_version = VEXT_VERSION_0_07_1;
>      target_ulong target_misa = env->misa;
>      Error *local_err = NULL;
> @@ -409,6 +415,7 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
>      }
>
>      set_priv_version(env, priv_version);
> +    set_bext_version(env, bext_version);
>      set_vext_version(env, vext_version);
>
>      if (cpu->cfg.mmu) {
> @@ -488,6 +495,21 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
>          }
>          if (cpu->cfg.ext_b) {
>              target_misa |= RVB;
> +
> +            if (cpu->cfg.bext_spec) {
> +                if (!g_strcmp0(cpu->cfg.bext_spec, "v0.93")) {
> +                    bext_version = BEXT_VERSION_0_93_0;
> +                } else {
> +                    error_setg(errp,
> +                           "Unsupported bitmanip spec version '%s'",
> +                           cpu->cfg.bext_spec);
> +                    return;
> +                }
> +            } else {
> +                qemu_log("bitmanip version is not specified, "
> +                         "use the default value v0.93\n");
> +            }
> +            set_bext_version(env, bext_version);
>          }
>          if (cpu->cfg.ext_v) {
>              target_misa |= RVV;
> @@ -566,6 +588,7 @@ static Property riscv_cpu_properties[] = {
>      DEFINE_PROP_BOOL("Zifencei", RISCVCPU, cfg.ext_ifencei, true),
>      DEFINE_PROP_BOOL("Zicsr", RISCVCPU, cfg.ext_icsr, true),
>      DEFINE_PROP_STRING("priv_spec", RISCVCPU, cfg.priv_spec),
> +    DEFINE_PROP_STRING("bext_spec", RISCVCPU, cfg.bext_spec),
>      DEFINE_PROP_STRING("vext_spec", RISCVCPU, cfg.vext_spec),
>      DEFINE_PROP_UINT16("vlen", RISCVCPU, cfg.vlen, 128),
>      DEFINE_PROP_UINT16("elen", RISCVCPU, cfg.elen, 64),
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 3cea62cd4c4..b2cca778526 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -83,6 +83,7 @@ enum {
>  #define PRIV_VERSION_1_10_0 0x00011000
>  #define PRIV_VERSION_1_11_0 0x00011100
>
> +#define BEXT_VERSION_0_93_0 0x00009300
>  #define VEXT_VERSION_0_07_1 0x00000701
>
>  enum {
> @@ -130,6 +131,7 @@ struct CPURISCVState {
>      target_ulong guest_phys_fault_addr;
>
>      target_ulong priv_ver;
> +    target_ulong bext_ver;
>      target_ulong vext_ver;
>      target_ulong misa;
>      target_ulong misa_mask;
> @@ -295,6 +297,7 @@ struct RISCVCPU {
>
>          char *priv_spec;
>          char *user_spec;
> +        char *bext_spec;
>          char *vext_spec;
>          uint16_t vlen;
>          uint16_t elen;
> --
> 2.17.1
>
>

