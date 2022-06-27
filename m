Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1o5xyq-0001Q4-W1
	for mharc-qemu-riscv@gnu.org; Mon, 27 Jun 2022 19:17:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1o5xyp-0001Mv-7O; Mon, 27 Jun 2022 19:17:19 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:37882)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1o5xyn-0004QP-5H; Mon, 27 Jun 2022 19:17:18 -0400
Received: by mail-pg1-x533.google.com with SMTP id h192so10496818pgc.4;
 Mon, 27 Jun 2022 16:17:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Iwz/9GkI5iNwSinYuvu1AqnzkCUt9uwRvqu4EWezZZY=;
 b=d5rvVtzKpubBCd0fuZXpvbtAGHDQsDvkYqDjJelfdqisW7zBLi9nINi4UjszMybaAK
 1PW6Zue2/ynvvTeadfR8k9ndxz0TTqk1Vdct0V0SBq95v+l5cEp4UCaDZRjSfpr+BRNQ
 TIiPlLDcZA/ZXDdBLf+7UQS8v4Gj7MnXa2gvyCFYJ7/rFRlMgYQ92YuOiPID+dl6iFTy
 ncI0xReWR7jGrxF557q9ryHA2BcZFeOXmBRatj7c8ONEaFOMSvFO8NuhYCDbKGszAqf/
 iT0zGr1JEIroy4SI3q5c/roabJ7fRf1O4EVv7q8DnQ7IT6k/ejpRl1gAhCaIqc6S7oGy
 fhYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Iwz/9GkI5iNwSinYuvu1AqnzkCUt9uwRvqu4EWezZZY=;
 b=cVwqt7ua87zPBOvR7BMsZZJJaaaYhBKJ2tme/efEWjMGBAPKZA7XogPqqr+97uApIH
 9+VMSywVxyWx6QrhwFT1dVGOJWXcrjz4w+qcoUt58wY/JIw18t1+c++p8sfhk7sGgceC
 csDPpyoKCOU6egkT/HWlHZoyNdd1jCFT5AuwQwNwOg0ywUQWHOnfoq2sUnH6jYuTg5yn
 4u4W6itn8tbQPy3h89DyliO7Zw/KuS1aU+Mcj3ZxEh5Zl1HL9jVLU1uj9m4yUU3umNU6
 r0EVne8mMOtYJvSrVsP9DBl7XGh04uIIXx6vR8RtxER1dipeZ1biAwMugKQxGFS2AKOC
 WS5A==
X-Gm-Message-State: AJIora8EXclKSCSsNoA86bfR+YAdz5Hhndk73h0Tb9SZWDP9ZqTbANpR
 ZxW9NPcTHNdSEBcliZx2ofgKrh2dnZjN+CrPgrg=
X-Google-Smtp-Source: AGRyM1sn7NSmhzoujJpSbJv3aZiyXWPC93kddqN6FBL3CBeOKAHz4EDIZ1n51wkF1uVYQ86fvqd28kXS0tVAGGhY/jg=
X-Received: by 2002:a65:6b8a:0:b0:3db:7dc5:fec2 with SMTP id
 d10-20020a656b8a000000b003db7dc5fec2mr14569412pgw.223.1656371835297; Mon, 27
 Jun 2022 16:17:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220611080107.391981-1-apatel@ventanamicro.com>
 <20220611080107.391981-5-apatel@ventanamicro.com>
In-Reply-To: <20220611080107.391981-5-apatel@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 28 Jun 2022 09:16:49 +1000
Message-ID: <CAKmqyKMRCQYcMdwK315_0w81tt9TOhDLM+9==BX+6SussnohLg@mail.gmail.com>
Subject: Re: [PATCH v6 4/4] target/riscv: Force disable extensions if priv
 spec version does not match
To: Anup Patel <apatel@ventanamicro.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=alistair23@gmail.com; helo=mail-pg1-x533.google.com
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
X-List-Received-Date: Mon, 27 Jun 2022 23:17:19 -0000

On Sat, Jun 11, 2022 at 6:07 PM Anup Patel <apatel@ventanamicro.com> wrote:
>
> We should disable extensions in riscv_cpu_realize() if minimum required
> priv spec version is not satisfied. This also ensures that machines with
> priv spec v1.11 (or lower) cannot enable H, V, and various multi-letter
> extensions.
>
> Fixes: a775398be2e9 ("target/riscv: Add isa extenstion strings to the device tree")
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>

This fails to build

../target/riscv/cpu.c: In function 'riscv_cpu_realize':
../target/riscv/cpu.c:641:66: error: 'CPURISCVState' {aka 'struct
CPUArchState'} has no member named 'mhartid'
  641 |                         isa_edata_arr[i].name, (unsigned
long)env->mhartid);
      |                                                                  ^~

Alistair

> ---
>  target/riscv/cpu.c | 144 +++++++++++++++++++++++++++------------------
>  1 file changed, 88 insertions(+), 56 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 8db0f0bd49..a17bc98662 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -43,9 +43,82 @@ static const char riscv_single_letter_exts[] = "IEMAFDQCPVH";
>
>  struct isa_ext_data {
>      const char *name;
> -    bool enabled;
> +    bool multi_letter;
> +    int min_version;
> +    int ext_enable_offset;
>  };
>
> +#define ISA_EXT_DATA_ENTRY(_name, _m_letter, _min_ver, _prop) \
> +{#_name, _m_letter, _min_ver, offsetof(struct RISCVCPUConfig, _prop)}
> +
> +/**
> + * Here are the ordering rules of extension naming defined by RISC-V
> + * specification :
> + * 1. All extensions should be separated from other multi-letter extensions
> + *    by an underscore.
> + * 2. The first letter following the 'Z' conventionally indicates the most
> + *    closely related alphabetical extension category, IMAFDQLCBKJTPVH.
> + *    If multiple 'Z' extensions are named, they should be ordered first
> + *    by category, then alphabetically within a category.
> + * 3. Standard supervisor-level extensions (starts with 'S') should be
> + *    listed after standard unprivileged extensions.  If multiple
> + *    supervisor-level extensions are listed, they should be ordered
> + *    alphabetically.
> + * 4. Non-standard extensions (starts with 'X') must be listed after all
> + *    standard extensions. They must be separated from other multi-letter
> + *    extensions by an underscore.
> + */
> +static const struct isa_ext_data isa_edata_arr[] = {
> +    ISA_EXT_DATA_ENTRY(h, false, PRIV_VERSION_1_12_0, ext_h),
> +    ISA_EXT_DATA_ENTRY(v, false, PRIV_VERSION_1_12_0, ext_v),
> +    ISA_EXT_DATA_ENTRY(zicsr, true, PRIV_VERSION_1_10_0, ext_icsr),
> +    ISA_EXT_DATA_ENTRY(zifencei, true, PRIV_VERSION_1_10_0, ext_ifencei),
> +    ISA_EXT_DATA_ENTRY(zfh, true, PRIV_VERSION_1_12_0, ext_zfh),
> +    ISA_EXT_DATA_ENTRY(zfhmin, true, PRIV_VERSION_1_12_0, ext_zfhmin),
> +    ISA_EXT_DATA_ENTRY(zfinx, true, PRIV_VERSION_1_12_0, ext_zfinx),
> +    ISA_EXT_DATA_ENTRY(zdinx, true, PRIV_VERSION_1_12_0, ext_zdinx),
> +    ISA_EXT_DATA_ENTRY(zba, true, PRIV_VERSION_1_12_0, ext_zba),
> +    ISA_EXT_DATA_ENTRY(zbb, true, PRIV_VERSION_1_12_0, ext_zbb),
> +    ISA_EXT_DATA_ENTRY(zbc, true, PRIV_VERSION_1_12_0, ext_zbc),
> +    ISA_EXT_DATA_ENTRY(zbkb, true, PRIV_VERSION_1_12_0, ext_zbkb),
> +    ISA_EXT_DATA_ENTRY(zbkc, true, PRIV_VERSION_1_12_0, ext_zbkc),
> +    ISA_EXT_DATA_ENTRY(zbkx, true, PRIV_VERSION_1_12_0, ext_zbkx),
> +    ISA_EXT_DATA_ENTRY(zbs, true, PRIV_VERSION_1_12_0, ext_zbs),
> +    ISA_EXT_DATA_ENTRY(zk, true, PRIV_VERSION_1_12_0, ext_zk),
> +    ISA_EXT_DATA_ENTRY(zkn, true, PRIV_VERSION_1_12_0, ext_zkn),
> +    ISA_EXT_DATA_ENTRY(zknd, true, PRIV_VERSION_1_12_0, ext_zknd),
> +    ISA_EXT_DATA_ENTRY(zkne, true, PRIV_VERSION_1_12_0, ext_zkne),
> +    ISA_EXT_DATA_ENTRY(zknh, true, PRIV_VERSION_1_12_0, ext_zknh),
> +    ISA_EXT_DATA_ENTRY(zkr, true, PRIV_VERSION_1_12_0, ext_zkr),
> +    ISA_EXT_DATA_ENTRY(zks, true, PRIV_VERSION_1_12_0, ext_zks),
> +    ISA_EXT_DATA_ENTRY(zksed, true, PRIV_VERSION_1_12_0, ext_zksed),
> +    ISA_EXT_DATA_ENTRY(zksh, true, PRIV_VERSION_1_12_0, ext_zksh),
> +    ISA_EXT_DATA_ENTRY(zkt, true, PRIV_VERSION_1_12_0, ext_zkt),
> +    ISA_EXT_DATA_ENTRY(zve32f, true, PRIV_VERSION_1_12_0, ext_zve32f),
> +    ISA_EXT_DATA_ENTRY(zve64f, true, PRIV_VERSION_1_12_0, ext_zve64f),
> +    ISA_EXT_DATA_ENTRY(zhinx, true, PRIV_VERSION_1_12_0, ext_zhinx),
> +    ISA_EXT_DATA_ENTRY(zhinxmin, true, PRIV_VERSION_1_12_0, ext_zhinxmin),
> +    ISA_EXT_DATA_ENTRY(svinval, true, PRIV_VERSION_1_12_0, ext_svinval),
> +    ISA_EXT_DATA_ENTRY(svnapot, true, PRIV_VERSION_1_12_0, ext_svnapot),
> +    ISA_EXT_DATA_ENTRY(svpbmt, true, PRIV_VERSION_1_12_0, ext_svpbmt),
> +};
> +
> +static bool isa_ext_is_enabled(RISCVCPU *cpu,
> +                               const struct isa_ext_data *edata)
> +{
> +    bool *ext_enabled = (void *)&cpu->cfg + edata->ext_enable_offset;
> +
> +    return *ext_enabled;
> +}
> +
> +static void isa_ext_update_enabled(RISCVCPU *cpu,
> +                                   const struct isa_ext_data *edata, bool en)
> +{
> +    bool *ext_enabled = (void *)&cpu->cfg + edata->ext_enable_offset;
> +
> +    *ext_enabled = en;
> +}
> +
>  const char * const riscv_int_regnames[] = {
>    "x0/zero", "x1/ra",  "x2/sp",  "x3/gp",  "x4/tp",  "x5/t0",   "x6/t1",
>    "x7/t2",   "x8/s0",  "x9/s1",  "x10/a0", "x11/a1", "x12/a2",  "x13/a3",
> @@ -530,7 +603,7 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
>      CPURISCVState *env = &cpu->env;
>      RISCVCPUClass *mcc = RISCV_CPU_GET_CLASS(dev);
>      CPUClass *cc = CPU_CLASS(mcc);
> -    int priv_version = -1;
> +    int i, priv_version = -1;
>      Error *local_err = NULL;
>
>      cpu_exec_realizefn(cs, &local_err);
> @@ -558,6 +631,17 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
>          set_priv_version(env, priv_version);
>      }
>
> +    /* Force disable extensions if priv spec version does not match */
> +    for (i = 0; i < ARRAY_SIZE(isa_edata_arr); i++) {
> +        if (isa_ext_is_enabled(cpu, &isa_edata_arr[i]) &&
> +            (env->priv_ver < isa_edata_arr[i].min_version)) {
> +            isa_ext_update_enabled(cpu, &isa_edata_arr[i], false);
> +            warn_report("disabling %s extension for hart 0x%lx because "
> +                        "privilege spec version does not match",
> +                        isa_edata_arr[i].name, (unsigned long)env->mhartid);
> +        }
> +    }
> +
>      if (cpu->cfg.mmu) {
>          riscv_set_feature(env, RISCV_FEATURE_MMU);
>      }
> @@ -1050,67 +1134,15 @@ static void riscv_cpu_class_init(ObjectClass *c, void *data)
>      device_class_set_props(dc, riscv_cpu_properties);
>  }
>
> -#define ISA_EDATA_ENTRY(name, prop) {#name, cpu->cfg.prop}
> -
>  static void riscv_isa_string_ext(RISCVCPU *cpu, char **isa_str, int max_str_len)
>  {
>      char *old = *isa_str;
>      char *new = *isa_str;
>      int i;
>
> -    /**
> -     * Here are the ordering rules of extension naming defined by RISC-V
> -     * specification :
> -     * 1. All extensions should be separated from other multi-letter extensions
> -     *    by an underscore.
> -     * 2. The first letter following the 'Z' conventionally indicates the most
> -     *    closely related alphabetical extension category, IMAFDQLCBKJTPVH.
> -     *    If multiple 'Z' extensions are named, they should be ordered first
> -     *    by category, then alphabetically within a category.
> -     * 3. Standard supervisor-level extensions (starts with 'S') should be
> -     *    listed after standard unprivileged extensions.  If multiple
> -     *    supervisor-level extensions are listed, they should be ordered
> -     *    alphabetically.
> -     * 4. Non-standard extensions (starts with 'X') must be listed after all
> -     *    standard extensions. They must be separated from other multi-letter
> -     *    extensions by an underscore.
> -     */
> -    struct isa_ext_data isa_edata_arr[] = {
> -        ISA_EDATA_ENTRY(zicsr, ext_icsr),
> -        ISA_EDATA_ENTRY(zifencei, ext_ifencei),
> -        ISA_EDATA_ENTRY(zmmul, ext_zmmul),
> -        ISA_EDATA_ENTRY(zfh, ext_zfh),
> -        ISA_EDATA_ENTRY(zfhmin, ext_zfhmin),
> -        ISA_EDATA_ENTRY(zfinx, ext_zfinx),
> -        ISA_EDATA_ENTRY(zdinx, ext_zdinx),
> -        ISA_EDATA_ENTRY(zba, ext_zba),
> -        ISA_EDATA_ENTRY(zbb, ext_zbb),
> -        ISA_EDATA_ENTRY(zbc, ext_zbc),
> -        ISA_EDATA_ENTRY(zbkb, ext_zbkb),
> -        ISA_EDATA_ENTRY(zbkc, ext_zbkc),
> -        ISA_EDATA_ENTRY(zbkx, ext_zbkx),
> -        ISA_EDATA_ENTRY(zbs, ext_zbs),
> -        ISA_EDATA_ENTRY(zk, ext_zk),
> -        ISA_EDATA_ENTRY(zkn, ext_zkn),
> -        ISA_EDATA_ENTRY(zknd, ext_zknd),
> -        ISA_EDATA_ENTRY(zkne, ext_zkne),
> -        ISA_EDATA_ENTRY(zknh, ext_zknh),
> -        ISA_EDATA_ENTRY(zkr, ext_zkr),
> -        ISA_EDATA_ENTRY(zks, ext_zks),
> -        ISA_EDATA_ENTRY(zksed, ext_zksed),
> -        ISA_EDATA_ENTRY(zksh, ext_zksh),
> -        ISA_EDATA_ENTRY(zkt, ext_zkt),
> -        ISA_EDATA_ENTRY(zve32f, ext_zve32f),
> -        ISA_EDATA_ENTRY(zve64f, ext_zve64f),
> -        ISA_EDATA_ENTRY(zhinx, ext_zhinx),
> -        ISA_EDATA_ENTRY(zhinxmin, ext_zhinxmin),
> -        ISA_EDATA_ENTRY(svinval, ext_svinval),
> -        ISA_EDATA_ENTRY(svnapot, ext_svnapot),
> -        ISA_EDATA_ENTRY(svpbmt, ext_svpbmt),
> -    };
> -
>      for (i = 0; i < ARRAY_SIZE(isa_edata_arr); i++) {
> -        if (isa_edata_arr[i].enabled) {
> +        if (isa_edata_arr[i].multi_letter &&
> +            isa_ext_is_enabled(cpu, &isa_edata_arr[i])) {
>              new = g_strconcat(old, "_", isa_edata_arr[i].name, NULL);
>              g_free(old);
>              old = new;
> --
> 2.34.1
>
>

