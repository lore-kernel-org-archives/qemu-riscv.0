Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nyPJN-00062G-81
	for mharc-qemu-riscv@gnu.org; Mon, 06 Jun 2022 22:51:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1nyPJI-0005yY-Ut
 for qemu-riscv@nongnu.org; Mon, 06 Jun 2022 22:51:13 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:42879)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1nyPJH-0000z5-4I
 for qemu-riscv@nongnu.org; Mon, 06 Jun 2022 22:51:12 -0400
Received: by mail-wr1-x42b.google.com with SMTP id t13so22169497wrg.9
 for <qemu-riscv@nongnu.org>; Mon, 06 Jun 2022 19:51:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=S+09+OP0eU+crTKg4kfXnDxTTjWv7URTt3KeiLCwS2k=;
 b=z/2n7S+Yrn81QVzHaOYAmHW8pTmZvJPng1yebVd0Vr/bExMN/x4xoKooexGqaqQOsC
 hG6ZqbGlBCuPcSrOoIo47yuAUoUXGEc2P+kV1EC9ndauzow1eh7HCkrsGa0JW8JT6LcG
 QENjlkCTBVQk1u72jKIq0xDIuZ8IG4KWTLgBLbMuNuAvVn+Dj3hXgrH8fSHuZFZ1hr3Q
 ze0EDz3gcOAZn1d3dlH9cG4vcpDiU/bI/+rwF8rVbqHE3P93ppZAOS1y42jBgirYtoVO
 G6zqprHsVC0FPZ4dKS3QR+ijarbw3c5JshGo4sNUIx6cv7eRnl7I8nPoADjnCp+dpVGX
 ZWHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=S+09+OP0eU+crTKg4kfXnDxTTjWv7URTt3KeiLCwS2k=;
 b=rfs7JHfZZ8xSUfyeBMR79rXUlexuE6my/FXwM663nk2r1yJ4qKOLugRnqPbuDJB2mR
 Gg5dvDZ6fvY7vkIwXd++fZyzNOUm+C55HSMCZsNCQI8oOBA7gDzwoMUKXR01OlzciIHr
 nlMAhyNDgllfa0u/ut2bYf2rpyFm63d4LJ7EGpxLKfKtlB7o0wBel06HYr+6Tii8jXbs
 bVCxDLZ6uA4l2ooshJ4iQsL8WfseV27bQeOfzffZceLqAAGh/abT/36w4PwSTMhhodkg
 D80Jg1qiX4rlDsVgkdDel3GeWcRnIhAzJyUWi212rjty87OfeHRaiuztgWYnaDLV207J
 Fm6w==
X-Gm-Message-State: AOAM531S7y7h35pvdsIMsDH33ncdIWCk7edq42ffZCnp8cIJnJzNkKAm
 XiPq8q/b93CgIs/EKJ5F9fYUfLcklbN2cnUVyuamZA==
X-Google-Smtp-Source: ABdhPJx71yqgd6/0jeYDNlwxP4luErA0tEJO5gihsdAIumEhNvQmSYRKxE2YhJRBCy4LbMYVMbVjufCxPZmtLz04SmY=
X-Received: by 2002:adf:e30f:0:b0:210:346e:d5da with SMTP id
 b15-20020adfe30f000000b00210346ed5damr24506590wrj.313.1654570268603; Mon, 06
 Jun 2022 19:51:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220526100536.49672-1-apatel@ventanamicro.com>
 <20220526100536.49672-5-apatel@ventanamicro.com>
 <CAKmqyKPSZVtJG1PEYXMN=TAbcb5gwT-x0isMA0MEBvtNBmiocA@mail.gmail.com>
In-Reply-To: <CAKmqyKPSZVtJG1PEYXMN=TAbcb5gwT-x0isMA0MEBvtNBmiocA@mail.gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 7 Jun 2022 08:20:57 +0530
Message-ID: <CAAhSdy1X5NRA8jsYh2=1QWduat7pzFFgtOdhrCKk9Myb9KfPKw@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] target/riscv: Force disable extensions if priv
 spec version does not match
To: Alistair Francis <alistair23@gmail.com>
Cc: Anup Patel <apatel@ventanamicro.com>,
 Peter Maydell <peter.maydell@linaro.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Atish Patra <atishp@atishpatra.org>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: none client-ip=2a00:1450:4864:20::42b;
 envelope-from=anup@brainfault.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 07 Jun 2022 02:51:13 -0000

On Mon, Jun 6, 2022 at 7:25 AM Alistair Francis <alistair23@gmail.com> wrote:
>
> On Thu, May 26, 2022 at 8:09 PM Anup Patel <apatel@ventanamicro.com> wrote:
> >
> > We should disable extensions in riscv_cpu_realize() if minimum required
> > priv spec version is not satisfied. This also ensures that machines with
> > priv spec v1.11 (or lower) cannot enable H, V, and various multi-letter
> > extensions.
> >
> > Fixes: a775398be2e ("target/riscv: Add isa extenstion strings to the
> > device tree")
> > Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> > ---
> >  target/riscv/cpu.c | 56 +++++++++++++++++++++++++++++++++++++++++-----
> >  1 file changed, 51 insertions(+), 5 deletions(-)
> >
> > diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> > index b086eb25da..e6e878ceb3 100644
> > --- a/target/riscv/cpu.c
> > +++ b/target/riscv/cpu.c
> > @@ -43,9 +43,13 @@ static const char riscv_single_letter_exts[] = "IEMAFDQCPVH";
> >
> >  struct isa_ext_data {
> >      const char *name;
> > -    bool enabled;
> > +    int min_version;
> > +    bool *enabled;
> >  };
> >
> > +#define ISA_EDATA_ENTRY(name, prop) {#name, PRIV_VERSION_1_10_0, &cpu->cfg.prop}
> > +#define ISA_EDATA_ENTRY2(name, min_ver, prop) {#name, min_ver, &cpu->cfg.prop}
> > +
> >  const char * const riscv_int_regnames[] = {
> >    "x0/zero", "x1/ra",  "x2/sp",  "x3/gp",  "x4/tp",  "x5/t0",   "x6/t1",
> >    "x7/t2",   "x8/s0",  "x9/s1",  "x10/a0", "x11/a1", "x12/a2",  "x13/a3",
> > @@ -513,8 +517,42 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
> >      CPURISCVState *env = &cpu->env;
> >      RISCVCPUClass *mcc = RISCV_CPU_GET_CLASS(dev);
> >      CPUClass *cc = CPU_CLASS(mcc);
> > -    int priv_version = -1;
> > +    int i, priv_version = -1;
> >      Error *local_err = NULL;
> > +    struct isa_ext_data isa_edata_arr[] = {
> > +        ISA_EDATA_ENTRY2(h, PRIV_VERSION_1_12_0, ext_h),
> > +        ISA_EDATA_ENTRY2(v, PRIV_VERSION_1_12_0, ext_v),
> > +        ISA_EDATA_ENTRY2(zicsr, PRIV_VERSION_1_10_0, ext_icsr),
> > +        ISA_EDATA_ENTRY2(zifencei, PRIV_VERSION_1_10_0, ext_ifencei),
> > +        ISA_EDATA_ENTRY2(zfh, PRIV_VERSION_1_12_0, ext_zfh),
> > +        ISA_EDATA_ENTRY2(zfhmin, PRIV_VERSION_1_12_0, ext_zfhmin),
> > +        ISA_EDATA_ENTRY2(zfinx, PRIV_VERSION_1_12_0, ext_zfinx),
> > +        ISA_EDATA_ENTRY2(zdinx, PRIV_VERSION_1_12_0, ext_zdinx),
> > +        ISA_EDATA_ENTRY2(zba, PRIV_VERSION_1_12_0, ext_zba),
> > +        ISA_EDATA_ENTRY2(zbb, PRIV_VERSION_1_12_0, ext_zbb),
> > +        ISA_EDATA_ENTRY2(zbc, PRIV_VERSION_1_12_0, ext_zbc),
> > +        ISA_EDATA_ENTRY2(zbkb, PRIV_VERSION_1_12_0, ext_zbkb),
> > +        ISA_EDATA_ENTRY2(zbkc, PRIV_VERSION_1_12_0, ext_zbkc),
> > +        ISA_EDATA_ENTRY2(zbkx, PRIV_VERSION_1_12_0, ext_zbkx),
> > +        ISA_EDATA_ENTRY2(zbs, PRIV_VERSION_1_12_0, ext_zbs),
> > +        ISA_EDATA_ENTRY2(zk, PRIV_VERSION_1_12_0, ext_zk),
> > +        ISA_EDATA_ENTRY2(zkn, PRIV_VERSION_1_12_0, ext_zkn),
> > +        ISA_EDATA_ENTRY2(zknd, PRIV_VERSION_1_12_0, ext_zknd),
> > +        ISA_EDATA_ENTRY2(zkne, PRIV_VERSION_1_12_0, ext_zkne),
> > +        ISA_EDATA_ENTRY2(zknh, PRIV_VERSION_1_12_0, ext_zknh),
> > +        ISA_EDATA_ENTRY2(zkr, PRIV_VERSION_1_12_0, ext_zkr),
> > +        ISA_EDATA_ENTRY2(zks, PRIV_VERSION_1_12_0, ext_zks),
> > +        ISA_EDATA_ENTRY2(zksed, PRIV_VERSION_1_12_0, ext_zksed),
> > +        ISA_EDATA_ENTRY2(zksh, PRIV_VERSION_1_12_0, ext_zksh),
> > +        ISA_EDATA_ENTRY2(zkt, PRIV_VERSION_1_12_0, ext_zkt),
> > +        ISA_EDATA_ENTRY2(zve32f, PRIV_VERSION_1_12_0, ext_zve32f),
> > +        ISA_EDATA_ENTRY2(zve64f, PRIV_VERSION_1_12_0, ext_zve64f),
> > +        ISA_EDATA_ENTRY2(zhinx, PRIV_VERSION_1_12_0, ext_zhinx),
> > +        ISA_EDATA_ENTRY2(zhinxmin, PRIV_VERSION_1_12_0, ext_zhinxmin),
> > +        ISA_EDATA_ENTRY2(svinval, PRIV_VERSION_1_12_0, ext_svinval),
> > +        ISA_EDATA_ENTRY2(svnapot, PRIV_VERSION_1_12_0, ext_svnapot),
> > +        ISA_EDATA_ENTRY2(svpbmt, PRIV_VERSION_1_12_0, ext_svpbmt),
> > +    };
> >
> >      cpu_exec_realizefn(cs, &local_err);
> >      if (local_err != NULL) {
> > @@ -541,6 +579,16 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
> >          set_priv_version(env, priv_version);
> >      }
> >
> > +    /* Force disable extensions if priv spec version does not match */
> > +    for (i = 0; i < ARRAY_SIZE(isa_edata_arr); i++) {
> > +        if (*isa_edata_arr[i].enabled &&
> > +            (env->priv_ver < isa_edata_arr[i].min_version)) {
> > +            *isa_edata_arr[i].enabled = false;
> > +            warn_report("privilege spec version does not match for %s extension",
> > +                        isa_edata_arr[i].name);
>
> This should indicate to the user that we are disabling the extension
> because of this

Sure, I will update.

Regards,
Anup

>
> Alistair
>
> > +        }
> > +    }
> > +
> >      if (cpu->cfg.mmu) {
> >          riscv_set_feature(env, RISCV_FEATURE_MMU);
> >      }
> > @@ -1005,8 +1053,6 @@ static void riscv_cpu_class_init(ObjectClass *c, void *data)
> >      device_class_set_props(dc, riscv_cpu_properties);
> >  }
> >
> > -#define ISA_EDATA_ENTRY(name, prop) {#name, cpu->cfg.prop}
> > -
> >  static void riscv_isa_string_ext(RISCVCPU *cpu, char **isa_str, int max_str_len)
> >  {
> >      char *old = *isa_str;
> > @@ -1064,7 +1110,7 @@ static void riscv_isa_string_ext(RISCVCPU *cpu, char **isa_str, int max_str_len)
> >      };
> >
> >      for (i = 0; i < ARRAY_SIZE(isa_edata_arr); i++) {
> > -        if (isa_edata_arr[i].enabled) {
> > +        if (*isa_edata_arr[i].enabled) {
> >              new = g_strconcat(old, "_", isa_edata_arr[i].name, NULL);
> >              g_free(old);
> >              old = new;
> > --
> > 2.34.1
> >
> >

