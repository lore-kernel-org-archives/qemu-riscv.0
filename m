Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oMe4m-0007ag-Vs
	for mharc-qemu-riscv@gnu.org; Fri, 12 Aug 2022 19:28:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <furquan@rivosinc.com>)
 id 1oMe4l-0007WE-CD
 for qemu-riscv@nongnu.org; Fri, 12 Aug 2022 19:28:23 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:45583)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <furquan@rivosinc.com>)
 id 1oMe4j-00060Y-5S
 for qemu-riscv@nongnu.org; Fri, 12 Aug 2022 19:28:23 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 p14-20020a17090a74ce00b001f4d04492faso2151898pjl.4
 for <qemu-riscv@nongnu.org>; Fri, 12 Aug 2022 16:28:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=xNk7QRDru7WIhpfwo6TBO/LqKPVMp3a1KLB0M19rccc=;
 b=kk3lDlYf0KAtit8IJWg1FDQdb/3J4tOmNLsvi96R0QUM/oWN2rljFA82gUf9Cs4gvv
 SSpmhx9G7lJO52MBDEDu6aAmW4tOdGbSpOl+xpBxBNGT+Xx+97nmfcRr7+n6oMPeQKD8
 +Tyh8NuvfBWne+78UD+5+Rej+XH8QX+7O4YoLw+8HnjChRZ7UvD5VMtbqhR2h2k3SzX9
 +p+jE6osQSO+6U0WcfRgZZlSlNovsIp5BBgFP5do6vuUtQsdq8rCSf15lgooQoFkUHs8
 HYU3TxS60TkrWgildxRN3FYGtumoF5loSptkyHPW576L6c1qmXZfJ+Fc3AiDaz7+aP+5
 BC6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=xNk7QRDru7WIhpfwo6TBO/LqKPVMp3a1KLB0M19rccc=;
 b=PinD6YZtYb0YQ0mRswQX3vlZs82PsCYQ7bQWflKExfl3ir7Pn1Eo0QEt2TdVeUinzH
 uambfxIzeWf/V6XNoQEY+N3OGzG76CshN9a+Pphb0Bnv8F8dTA/0dE63ztP3w6IQTr/3
 xKWBt5qfE7mMJJcbRTDBvksUV6T/zKURC0jD+Mk+xZWUSLHeN3x1OtCoWCSqoJDLKaDR
 pc+T0rCIeDI/PPtbpTei7n+0nv4C9C1xyUhVMUxj43aqayCzcEQx/WAp7eTl3oCo5dEt
 MpbHU/JiyolcJnnfrYk4Tz0/rcSl36Tdx0KtvZq0htlOoSXsP4yLMf/gjRciBP9pCzsx
 V6eQ==
X-Gm-Message-State: ACgBeo1D03XK1W+z+taw4mGLr+xROWnvoOz23qPynDRwHI8iEkR8dvqt
 TrIeYnuYlXh3kcrkJvfVjAGb8PAaxw8m/aJ3DSvB/Q==
X-Google-Smtp-Source: AA6agR5WXQjV14ezKLJX5T16Kswqf7liDBVqFTvIdyBkmeVwxUriVcSif/vPAC1wyqjM7MXy8rI5gy8Z3zQ4fKAQ/1k=
X-Received: by 2002:a17:903:4051:b0:16d:c677:ecd2 with SMTP id
 n17-20020a170903405100b0016dc677ecd2mr6215463pla.81.1660346899538; Fri, 12
 Aug 2022 16:28:19 -0700 (PDT)
MIME-Version: 1.0
References: <CA+tJHD7L3Jxp06O1bAxsy_Z+qkUvUVNOhoXJM_PL6rxx1FsAAQ@mail.gmail.com>
 <mhng-2b0bb7a1-581d-4c56-88bc-d5b548520df1@palmer-ri-x1c9>
In-Reply-To: <mhng-2b0bb7a1-581d-4c56-88bc-d5b548520df1@palmer-ri-x1c9>
From: Furquan Shaikh <furquan@rivosinc.com>
Date: Fri, 12 Aug 2022 16:28:08 -0700
Message-ID: <CA+tJHD57e0rg9LsY9K+3Gr2e7bKnt1cLJ=xwsrcqpNeZfLDX8Q@mail.gmail.com>
Subject: Re: [PATCH] riscv: Make semihosting configurable for all privilege
 modes
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Andrew Jones <ajones@ventanamicro.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=furquan@rivosinc.com; helo=mail-pj1-x1032.google.com
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
X-List-Received-Date: Fri, 12 Aug 2022 23:28:23 -0000

On Fri, Aug 12, 2022 at 4:00 PM Palmer Dabbelt <palmer@dabbelt.com> wrote:
>
> On Fri, 12 Aug 2022 15:05:08 PDT (-0700), furquan@rivosinc.com wrote:
> > On Fri, Aug 12, 2022 at 4:04 AM Andrew Jones <ajones@ventanamicro.com> wrote:
> >>
> >> On Thu, Aug 11, 2022 at 01:41:04PM -0700, Furquan Shaikh wrote:
> >> > Unlike ARM, RISC-V does not define a separate breakpoint type for
> >> > semihosting. Instead, it is entirely ABI. Thus, we need an option
> >> > to allow users to configure what the ebreak behavior should be for
> >> > different privilege levels - M, S, U, VS, VU. As per the RISC-V
> >> > privilege specification[1], ebreak traps into the execution
> >> > environment. However, RISC-V debug specification[2] provides
> >> > ebreak{m,s,u,vs,vu} configuration bits to allow ebreak behavior to
> >> > be configured to trap into debug mode instead. This change adds
> >> > settable properties for RISC-V CPUs - `ebreakm`, `ebreaks`, `ebreaku`,
> >> > `ebreakvs` and `ebreakvu` to allow user to configure whether qemu
> >> > should treat ebreak as semihosting traps or trap according to the
> >> > privilege specification.
> >> >
> >> > [1] https://github.com/riscv/riscv-isa-manual/releases/download/draft-20220723-10eea63/riscv-privileged.pdf
> >> > [2] https://github.com/riscv/riscv-debug-spec/blob/release/riscv-debug-release.pdf
> >> >
> >> > Signed-off-by: Furquan Shaikh <furquan@rivosinc.com>
> >> > ---
> >> >  target/riscv/cpu.c        |  8 ++++++++
> >> >  target/riscv/cpu.h        |  7 +++++++
> >> >  target/riscv/cpu_helper.c | 26 +++++++++++++++++++++++++-
> >> >  3 files changed, 40 insertions(+), 1 deletion(-)
> >> >
> >> > diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> >> > index ac6f82ebd0..082194652b 100644
> >> > --- a/target/riscv/cpu.c
> >> > +++ b/target/riscv/cpu.c
> >> > @@ -953,6 +953,14 @@ static Property riscv_cpu_properties[] = {
> >> >      DEFINE_PROP_BOOL("short-isa-string", RISCVCPU,
> >> > cfg.short_isa_string, false),
> >> >
> >> >      DEFINE_PROP_BOOL("rvv_ta_all_1s", RISCVCPU, cfg.rvv_ta_all_1s, false),
> >> > +
> >> > +    /* Debug spec */
> >> > +    DEFINE_PROP_BOOL("ebreakm", RISCVCPU, cfg.ebreakm, true),
> >> > +    DEFINE_PROP_BOOL("ebreaks", RISCVCPU, cfg.ebreaks, false),
> >> > +    DEFINE_PROP_BOOL("ebreaku", RISCVCPU, cfg.ebreaku, false),
> >> > +    DEFINE_PROP_BOOL("ebreakvs", RISCVCPU, cfg.ebreakvs, false),
> >> > +    DEFINE_PROP_BOOL("ebreakvu", RISCVCPU, cfg.ebreakvu, false),
> >> > +
> >> >      DEFINE_PROP_END_OF_LIST(),
> >> >  };
> >> >
> >> > diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> >> > index 5c7acc055a..eee8e487a6 100644
> >> > --- a/target/riscv/cpu.h
> >> > +++ b/target/riscv/cpu.h
> >> > @@ -454,6 +454,13 @@ struct RISCVCPUConfig {
> >> >      bool epmp;
> >> >      bool aia;
> >> >      bool debug;
> >> > +
> >> > +    /* Debug spec */
> >> > +    bool ebreakm;
> >> > +    bool ebreaks;
> >> > +    bool ebreaku;
> >> > +    bool ebreakvs;
> >> > +    bool ebreakvu;
> >>
> >> There's only five of these, so having each separate probably makes the
> >> most sense, but I wanted to point out that we could keep the properties
> >> independent booleans, as we should, but still consolidate the values
> >> into a single bitmap like we did for the sve vq bitmap for arm (see
> >> cpu_arm_get/set_vq). Maybe worth considering?
> >
> > Thanks for the review and feedback, Andrew! I gave your suggestion a
> > try and updated the independent booleans to a single bitmap. It works,
> > but I am not sure if we really need all that additional code for this.
> > Like you mentioned, it is just five of these and having independent
> > booleans isn't too bad. If you or others feel strongly about switching
> > this to a bitmap, I can push a revised patchset. Else, I will keep the
> > change as is.
> >
> >>
> >> >      uint64_t resetvec;
> >> >
> >> >      bool short_isa_string;
> >> > diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> >> > index 59b3680b1b..be09abbe27 100644
> >> > --- a/target/riscv/cpu_helper.c
> >> > +++ b/target/riscv/cpu_helper.c
> >> > @@ -1314,6 +1314,30 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr
> >> > address, int size,
> >> >
> >> >      return true;
> >> >  }
> >> > +
> >> > +static bool semihosting_enabled(RISCVCPU *cpu)
> >> > +{
> >> > +    CPURISCVState *env = &cpu->env;
> >> > +
> >> > +    switch (env->priv) {
> >> > +    case PRV_M:
> >> > +        return cpu->cfg.ebreakm;
> >> > +    case PRV_S:
> >> > +        if (riscv_cpu_virt_enabled(env)) {
> >> > +            return cpu->cfg.ebreakvs;
> >> > +        } else {
> >> > +            return cpu->cfg.ebreaks;
> >> > +        }
> >> > +    case PRV_U:
> >> > +        if (riscv_cpu_virt_enabled(env)) {
> >> > +            return cpu->cfg.ebreakvu;
> >> > +        } else {
> >> > +            return cpu->cfg.ebreaku;
> >> > +        }
> >> > +    }
> >> > +
> >> > +    return false;
> >> > +}
> >> >  #endif /* !CONFIG_USER_ONLY */
> >> >
> >> >  /*
> >> > @@ -1342,7 +1366,7 @@ void riscv_cpu_do_interrupt(CPUState *cs)
> >> >      target_ulong mtval2 = 0;
> >> >
> >> >      if  (cause == RISCV_EXCP_SEMIHOST) {
> >> > -        if (env->priv >= PRV_S) {
> >> > +        if (semihosting_enabled(cpu)) {
> >> >              do_common_semihosting(cs);
> >> >              env->pc += 4;
> >> >              return;
> >> > --
> >> > 2.34.1
> >> >
> >>
> >> Bitmap or no bitmap,
> >>
> >> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
>
> Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>
>
> Also no strong feelings on the bitmap, but I do like the feature.  When
> using an external JTAG debugger to talk to a this would probably be
> configured via something like GDB's monitor commands.  We could probably
> hook this up to QEMU's monitor as well, but doing it this way seems
> easier to implement and use.
>
> We should document it, though.  Maybe just something like this?

Thanks, Palmer. I sent a v2 with the change you suggested.

>
> diff --git a/qemu-options.hx b/qemu-options.hx
> index 3f23a42fa8..f9444a1e4b 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -4635,7 +4635,9 @@ SRST
>      open/read/write/seek/select. Tensilica baremetal libc for ISS and
>      linux platform "sim" use this interface.
>
> -    On RISC-V this implements the standard semihosting API, version 0.2.
> +    On RISC-V this implements the standard semihosting API, version 0.2.  See
> +    the ebreak{m,s,u,vs,vu} CPU properties to control which modes treat
> +    breakpoints as semihosting calls.
>
>      ``target=native|gdb|auto``
>          Defines where the semihosting calls will be addressed, to QEMU

