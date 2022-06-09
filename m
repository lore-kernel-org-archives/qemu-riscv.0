Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nz73S-0000ad-0R
	for mharc-qemu-riscv@gnu.org; Wed, 08 Jun 2022 21:33:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1nz73N-0000aG-FW; Wed, 08 Jun 2022 21:33:44 -0400
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f]:38537)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1nz73L-0007Xk-1z; Wed, 08 Jun 2022 21:33:40 -0400
Received: by mail-qk1-x72f.google.com with SMTP id a184so13251049qkg.5;
 Wed, 08 Jun 2022 18:33:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=w3Q0CGKpqe46Ntjbda5H49zfequ4/2nvQjthUD3RZsw=;
 b=Ga0jxCVfhEwDcbS17m948Mregp9CZFkY8c+2XxVirvUwtWMxYN2D8UjtwFLFCg5XCh
 bPrpMTCfgzHp9NjNzZiAlFE9CrHgud9BLYJYZAze2Oqsthp5PFA36pp1IzJPSlgUYKrF
 hobv7/1gUapDj5qnoymql0MuhJAdRvHkoIOZuYiNVShrou1wqOs3/3ps1I7dlsivgdF5
 ctJpAS7qKn8j8pVT2WNqD6bwxPQypJ+NJLIhMW05wPsOuEe7H01NO/IpnP8Ym9yzeoLt
 3cPleg0uJ5y4BO+qNNEhkpv4mQ0I5gvEy5OzQsDnDPLwz1sNkwE7GRhs6qswQ0o69Q8I
 svuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=w3Q0CGKpqe46Ntjbda5H49zfequ4/2nvQjthUD3RZsw=;
 b=ULWrPV7tDXwmyNvcct7wWP2mt+ubntKvvUyV9UsG9C2RAvWrmhjxfs0FfGRF05e422
 raGd6PkbZT//tqZtEG17QR0i40VBxQETkfE7+7qP0C3gwlNzP2lEqDHlKgzPsXvZYZ3g
 6aSykeIrUsqAprA0jnNooxZo7sNzvPNuAwWa5pTJlcQBiawhRNrHeXWtp0TCgJsmK4dw
 kwiDUqFY9kmu25xoz1sHkZ59tAZul+hxMFf+h9h5ny0G5M2qyNpaSmfjkU3wsFWWmJ3N
 B8VRwjZkREafODYYjj73Awvk2YJ1yXVJtbUQaMrikrViCnwwWdMk9DSzZChpd5ZpIqsL
 Unug==
X-Gm-Message-State: AOAM531SGA6wwxjvVV6nz1d5jpKfNVLHAQnUtIoAa1n4UwxbqtzHABSV
 FAY2tqA4J6Uf2Rt+IZ/QroHg41gWihfoxzB2L9VxnE5r
X-Google-Smtp-Source: ABdhPJyIVhdIQBba7aT1b6R6+VGTEUET/tIspaIZVpzA9S26pd3eOFIDjBexQxdeSonqsPmxuhPEGQvlM1k8gXMskj8=
X-Received: by 2002:a05:620a:4305:b0:6a6:50f8:17e3 with SMTP id
 u5-20020a05620a430500b006a650f817e3mr24211290qko.389.1654738417540; Wed, 08
 Jun 2022 18:33:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220608161405.729964-1-apatel@ventanamicro.com>
 <20220608161405.729964-5-apatel@ventanamicro.com>
In-Reply-To: <20220608161405.729964-5-apatel@ventanamicro.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 9 Jun 2022 09:33:25 +0800
Message-ID: <CAEUhbmU4cZMYtuxSrmJsLZT55mnQwnEdwrufTZQ1Fq7RR9bm_A@mail.gmail.com>
Subject: Re: [PATCH v4 4/4] target/riscv: Force disable extensions if priv
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
Received-SPF: pass client-ip=2607:f8b0:4864:20::72f;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qk1-x72f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Thu, 09 Jun 2022 01:33:45 -0000

On Thu, Jun 9, 2022 at 12:20 AM Anup Patel <apatel@ventanamicro.com> wrote:
>
> We should disable extensions in riscv_cpu_realize() if minimum required
> priv spec version is not satisfied. This also ensures that machines with
> priv spec v1.11 (or lower) cannot enable H, V, and various multi-letter
> extensions.
>
> Fixes: a775398be2e ("target/riscv: Add isa extenstion strings to the
> device tree")

single line "Fixes" tag. Also the commit id should have at least 12 digits.

> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  target/riscv/cpu.c | 57 ++++++++++++++++++++++++++++++++++++++++++----
>  1 file changed, 52 insertions(+), 5 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 9f9c27a3f5..953ba2e445 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -43,9 +43,13 @@ static const char riscv_single_letter_exts[] = "IEMAFDQCPVH";
>
>  struct isa_ext_data {
>      const char *name;
> -    bool enabled;
> +    int min_version;
> +    bool *enabled;
>  };
>
> +#define ISA_EDATA_ENTRY(name, prop) {#name, PRIV_VERSION_1_10_0, &cpu->cfg.prop}
> +#define ISA_EDATA_ENTRY2(name, min_ver, prop) {#name, min_ver, &cpu->cfg.prop}
> +
>  const char * const riscv_int_regnames[] = {
>    "x0/zero", "x1/ra",  "x2/sp",  "x3/gp",  "x4/tp",  "x5/t0",   "x6/t1",
>    "x7/t2",   "x8/s0",  "x9/s1",  "x10/a0", "x11/a1", "x12/a2",  "x13/a3",
> @@ -513,8 +517,42 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
>      CPURISCVState *env = &cpu->env;
>      RISCVCPUClass *mcc = RISCV_CPU_GET_CLASS(dev);
>      CPUClass *cc = CPU_CLASS(mcc);
> -    int priv_version = -1;
> +    int i, priv_version = -1;
>      Error *local_err = NULL;
> +    struct isa_ext_data isa_edata_arr[] = {
> +        ISA_EDATA_ENTRY2(h, PRIV_VERSION_1_12_0, ext_h),
> +        ISA_EDATA_ENTRY2(v, PRIV_VERSION_1_12_0, ext_v),
> +        ISA_EDATA_ENTRY2(zicsr, PRIV_VERSION_1_10_0, ext_icsr),
> +        ISA_EDATA_ENTRY2(zifencei, PRIV_VERSION_1_10_0, ext_ifencei),
> +        ISA_EDATA_ENTRY2(zfh, PRIV_VERSION_1_12_0, ext_zfh),
> +        ISA_EDATA_ENTRY2(zfhmin, PRIV_VERSION_1_12_0, ext_zfhmin),
> +        ISA_EDATA_ENTRY2(zfinx, PRIV_VERSION_1_12_0, ext_zfinx),
> +        ISA_EDATA_ENTRY2(zdinx, PRIV_VERSION_1_12_0, ext_zdinx),
> +        ISA_EDATA_ENTRY2(zba, PRIV_VERSION_1_12_0, ext_zba),
> +        ISA_EDATA_ENTRY2(zbb, PRIV_VERSION_1_12_0, ext_zbb),
> +        ISA_EDATA_ENTRY2(zbc, PRIV_VERSION_1_12_0, ext_zbc),
> +        ISA_EDATA_ENTRY2(zbkb, PRIV_VERSION_1_12_0, ext_zbkb),
> +        ISA_EDATA_ENTRY2(zbkc, PRIV_VERSION_1_12_0, ext_zbkc),
> +        ISA_EDATA_ENTRY2(zbkx, PRIV_VERSION_1_12_0, ext_zbkx),
> +        ISA_EDATA_ENTRY2(zbs, PRIV_VERSION_1_12_0, ext_zbs),
> +        ISA_EDATA_ENTRY2(zk, PRIV_VERSION_1_12_0, ext_zk),
> +        ISA_EDATA_ENTRY2(zkn, PRIV_VERSION_1_12_0, ext_zkn),
> +        ISA_EDATA_ENTRY2(zknd, PRIV_VERSION_1_12_0, ext_zknd),
> +        ISA_EDATA_ENTRY2(zkne, PRIV_VERSION_1_12_0, ext_zkne),
> +        ISA_EDATA_ENTRY2(zknh, PRIV_VERSION_1_12_0, ext_zknh),
> +        ISA_EDATA_ENTRY2(zkr, PRIV_VERSION_1_12_0, ext_zkr),
> +        ISA_EDATA_ENTRY2(zks, PRIV_VERSION_1_12_0, ext_zks),
> +        ISA_EDATA_ENTRY2(zksed, PRIV_VERSION_1_12_0, ext_zksed),
> +        ISA_EDATA_ENTRY2(zksh, PRIV_VERSION_1_12_0, ext_zksh),
> +        ISA_EDATA_ENTRY2(zkt, PRIV_VERSION_1_12_0, ext_zkt),
> +        ISA_EDATA_ENTRY2(zve32f, PRIV_VERSION_1_12_0, ext_zve32f),
> +        ISA_EDATA_ENTRY2(zve64f, PRIV_VERSION_1_12_0, ext_zve64f),
> +        ISA_EDATA_ENTRY2(zhinx, PRIV_VERSION_1_12_0, ext_zhinx),
> +        ISA_EDATA_ENTRY2(zhinxmin, PRIV_VERSION_1_12_0, ext_zhinxmin),
> +        ISA_EDATA_ENTRY2(svinval, PRIV_VERSION_1_12_0, ext_svinval),
> +        ISA_EDATA_ENTRY2(svnapot, PRIV_VERSION_1_12_0, ext_svnapot),
> +        ISA_EDATA_ENTRY2(svpbmt, PRIV_VERSION_1_12_0, ext_svpbmt),
> +    };
>
>      cpu_exec_realizefn(cs, &local_err);
>      if (local_err != NULL) {
> @@ -541,6 +579,17 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
>          set_priv_version(env, priv_version);
>      }
>
> +    /* Force disable extensions if priv spec version does not match */
> +    for (i = 0; i < ARRAY_SIZE(isa_edata_arr); i++) {
> +        if (*isa_edata_arr[i].enabled &&
> +            (env->priv_ver < isa_edata_arr[i].min_version)) {
> +            *isa_edata_arr[i].enabled = false;
> +            warn_report("disabling %s extension for hart 0x%lx because "
> +                        "privilege spec version does not match",
> +                        isa_edata_arr[i].name, (unsigned long)env->mhartid);
> +        }
> +    }
> +
>      if (cpu->cfg.mmu) {
>          riscv_set_feature(env, RISCV_FEATURE_MMU);
>      }
> @@ -1011,8 +1060,6 @@ static void riscv_cpu_class_init(ObjectClass *c, void *data)
>      device_class_set_props(dc, riscv_cpu_properties);
>  }
>
> -#define ISA_EDATA_ENTRY(name, prop) {#name, cpu->cfg.prop}
> -
>  static void riscv_isa_string_ext(RISCVCPU *cpu, char **isa_str, int max_str_len)
>  {
>      char *old = *isa_str;
> @@ -1071,7 +1118,7 @@ static void riscv_isa_string_ext(RISCVCPU *cpu, char **isa_str, int max_str_len)
>      };
>
>      for (i = 0; i < ARRAY_SIZE(isa_edata_arr); i++) {
> -        if (isa_edata_arr[i].enabled) {
> +        if (*isa_edata_arr[i].enabled) {
>              new = g_strconcat(old, "_", isa_edata_arr[i].name, NULL);
>              g_free(old);
>              old = new;
> --

Regards,
Bin

