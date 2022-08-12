Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oMcmT-0008Do-R5
	for mharc-qemu-riscv@gnu.org; Fri, 12 Aug 2022 18:05:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <furquan@rivosinc.com>)
 id 1oMcmS-0008DV-9L
 for qemu-riscv@nongnu.org; Fri, 12 Aug 2022 18:05:24 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:37426)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <furquan@rivosinc.com>)
 id 1oMcmQ-0008NJ-7t
 for qemu-riscv@nongnu.org; Fri, 12 Aug 2022 18:05:23 -0400
Received: by mail-pf1-x433.google.com with SMTP id f30so2046808pfq.4
 for <qemu-riscv@nongnu.org>; Fri, 12 Aug 2022 15:05:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=VnyEWyHtDQ9CQhguApANT9oyMrdyTxg72PEr7/VYbJY=;
 b=Szbzq8obQqBaMGCCqe1z8WbVJZ+edd4RoKLN0rH9TRXfhNfX2EKQLdPeSUZgsv9+Fq
 wH73q78N9fIYvY7xmGbvIMJVsT0hhrteS6kyFSiNquKsGhRA7TXlFoOlCTlvfY+Ant9L
 glDv9QUVHvlLUUHff5pgIzXb7NJpjaEiESSFVXTN/PIfmhXXZ1dWRkD1/WN/MIg+Tsu0
 ur7plI+jmq4c6IiolMLXy1NDXb1vkaxWaDB6Tit9YhmVJSH5eU5QZKtSPSp7xYfzKBJB
 RwEPITvLt3FnDKJdcEeb6j38aGD8uM3OTm6COTWcG+YZzdKBJdvXRZOwWhHwEvhw9smW
 MtYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=VnyEWyHtDQ9CQhguApANT9oyMrdyTxg72PEr7/VYbJY=;
 b=6RWdrsTtcHWUGNxyVNtVh9VSjmwGNHZWlX6digvPgHCCd24X6g/y7b8Kw8hb67+GyQ
 udVoLzi2O75I05nmYR+RFPa5x9Rtt0RnbkZqJsVBl8VTU25GGC1N0j74Fd/fgHkNKy8C
 tiUT4JHYEQN17nq/RAIHn37YtWO1Vn77nIS4XXmqR6nB9bgIEq5caOxJf1FA4aJHw8EW
 QZm4hRaKoXTwnKlSMVZ/kSacsaRc9lPV9OVbdpYIk9TSAwjMHHaY3kHYX6KRmxiZ2OAq
 tTlIbUFq0lrsJErzxnb0wg2O6GcYcOg0z1yFD67nB+4Szy+MQfxRGi+Xh0U08U5v7n98
 I53g==
X-Gm-Message-State: ACgBeo2o8jO4GQNT6yzzDDiRt0eRQNE5hN2OzV3Ajx3DrjWL1kF4SY5C
 6UGbIDybIPiGN3t1+2PXA3QYZpyUf4+JimY3z+4UIw==
X-Google-Smtp-Source: AA6agR49lTJdNNbMhBEP0erHiJ5tIpgQsrDOlYSzPXZn6vLQCW6KRDviaNkyNRfYH4fIORrTeimgffCDZs6S5S1yDxY=
X-Received: by 2002:a62:79c4:0:b0:52d:cd3d:2027 with SMTP id
 u187-20020a6279c4000000b0052dcd3d2027mr5900890pfc.71.1660341919020; Fri, 12
 Aug 2022 15:05:19 -0700 (PDT)
MIME-Version: 1.0
References: <CA+tJHD7FcrBTetGRO0vZn-XGPmZmQraMrw1dw9ia6jzHQniB0w@mail.gmail.com>
 <20220812110411.b3yx5yojrdrux6pd@kamzik>
In-Reply-To: <20220812110411.b3yx5yojrdrux6pd@kamzik>
From: Furquan Shaikh <furquan@rivosinc.com>
Date: Fri, 12 Aug 2022 15:05:08 -0700
Message-ID: <CA+tJHD7L3Jxp06O1bAxsy_Z+qkUvUVNOhoXJM_PL6rxx1FsAAQ@mail.gmail.com>
Subject: Re: [PATCH] riscv: Make semihosting configurable for all privilege
 modes
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=furquan@rivosinc.com; helo=mail-pf1-x433.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 12 Aug 2022 22:05:24 -0000

On Fri, Aug 12, 2022 at 4:04 AM Andrew Jones <ajones@ventanamicro.com> wrote:
>
> On Thu, Aug 11, 2022 at 01:41:04PM -0700, Furquan Shaikh wrote:
> > Unlike ARM, RISC-V does not define a separate breakpoint type for
> > semihosting. Instead, it is entirely ABI. Thus, we need an option
> > to allow users to configure what the ebreak behavior should be for
> > different privilege levels - M, S, U, VS, VU. As per the RISC-V
> > privilege specification[1], ebreak traps into the execution
> > environment. However, RISC-V debug specification[2] provides
> > ebreak{m,s,u,vs,vu} configuration bits to allow ebreak behavior to
> > be configured to trap into debug mode instead. This change adds
> > settable properties for RISC-V CPUs - `ebreakm`, `ebreaks`, `ebreaku`,
> > `ebreakvs` and `ebreakvu` to allow user to configure whether qemu
> > should treat ebreak as semihosting traps or trap according to the
> > privilege specification.
> >
> > [1] https://github.com/riscv/riscv-isa-manual/releases/download/draft-20220723-10eea63/riscv-privileged.pdf
> > [2] https://github.com/riscv/riscv-debug-spec/blob/release/riscv-debug-release.pdf
> >
> > Signed-off-by: Furquan Shaikh <furquan@rivosinc.com>
> > ---
> >  target/riscv/cpu.c        |  8 ++++++++
> >  target/riscv/cpu.h        |  7 +++++++
> >  target/riscv/cpu_helper.c | 26 +++++++++++++++++++++++++-
> >  3 files changed, 40 insertions(+), 1 deletion(-)
> >
> > diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> > index ac6f82ebd0..082194652b 100644
> > --- a/target/riscv/cpu.c
> > +++ b/target/riscv/cpu.c
> > @@ -953,6 +953,14 @@ static Property riscv_cpu_properties[] = {
> >      DEFINE_PROP_BOOL("short-isa-string", RISCVCPU,
> > cfg.short_isa_string, false),
> >
> >      DEFINE_PROP_BOOL("rvv_ta_all_1s", RISCVCPU, cfg.rvv_ta_all_1s, false),
> > +
> > +    /* Debug spec */
> > +    DEFINE_PROP_BOOL("ebreakm", RISCVCPU, cfg.ebreakm, true),
> > +    DEFINE_PROP_BOOL("ebreaks", RISCVCPU, cfg.ebreaks, false),
> > +    DEFINE_PROP_BOOL("ebreaku", RISCVCPU, cfg.ebreaku, false),
> > +    DEFINE_PROP_BOOL("ebreakvs", RISCVCPU, cfg.ebreakvs, false),
> > +    DEFINE_PROP_BOOL("ebreakvu", RISCVCPU, cfg.ebreakvu, false),
> > +
> >      DEFINE_PROP_END_OF_LIST(),
> >  };
> >
> > diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> > index 5c7acc055a..eee8e487a6 100644
> > --- a/target/riscv/cpu.h
> > +++ b/target/riscv/cpu.h
> > @@ -454,6 +454,13 @@ struct RISCVCPUConfig {
> >      bool epmp;
> >      bool aia;
> >      bool debug;
> > +
> > +    /* Debug spec */
> > +    bool ebreakm;
> > +    bool ebreaks;
> > +    bool ebreaku;
> > +    bool ebreakvs;
> > +    bool ebreakvu;
>
> There's only five of these, so having each separate probably makes the
> most sense, but I wanted to point out that we could keep the properties
> independent booleans, as we should, but still consolidate the values
> into a single bitmap like we did for the sve vq bitmap for arm (see
> cpu_arm_get/set_vq). Maybe worth considering?

Thanks for the review and feedback, Andrew! I gave your suggestion a
try and updated the independent booleans to a single bitmap. It works,
but I am not sure if we really need all that additional code for this.
Like you mentioned, it is just five of these and having independent
booleans isn't too bad. If you or others feel strongly about switching
this to a bitmap, I can push a revised patchset. Else, I will keep the
change as is.

>
> >      uint64_t resetvec;
> >
> >      bool short_isa_string;
> > diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> > index 59b3680b1b..be09abbe27 100644
> > --- a/target/riscv/cpu_helper.c
> > +++ b/target/riscv/cpu_helper.c
> > @@ -1314,6 +1314,30 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr
> > address, int size,
> >
> >      return true;
> >  }
> > +
> > +static bool semihosting_enabled(RISCVCPU *cpu)
> > +{
> > +    CPURISCVState *env = &cpu->env;
> > +
> > +    switch (env->priv) {
> > +    case PRV_M:
> > +        return cpu->cfg.ebreakm;
> > +    case PRV_S:
> > +        if (riscv_cpu_virt_enabled(env)) {
> > +            return cpu->cfg.ebreakvs;
> > +        } else {
> > +            return cpu->cfg.ebreaks;
> > +        }
> > +    case PRV_U:
> > +        if (riscv_cpu_virt_enabled(env)) {
> > +            return cpu->cfg.ebreakvu;
> > +        } else {
> > +            return cpu->cfg.ebreaku;
> > +        }
> > +    }
> > +
> > +    return false;
> > +}
> >  #endif /* !CONFIG_USER_ONLY */
> >
> >  /*
> > @@ -1342,7 +1366,7 @@ void riscv_cpu_do_interrupt(CPUState *cs)
> >      target_ulong mtval2 = 0;
> >
> >      if  (cause == RISCV_EXCP_SEMIHOST) {
> > -        if (env->priv >= PRV_S) {
> > +        if (semihosting_enabled(cpu)) {
> >              do_common_semihosting(cs);
> >              env->pc += 4;
> >              return;
> > --
> > 2.34.1
> >
>
> Bitmap or no bitmap,
>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

