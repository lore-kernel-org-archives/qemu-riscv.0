Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oMdeE-0003p3-Ir
	for mharc-qemu-riscv@gnu.org; Fri, 12 Aug 2022 19:00:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@dabbelt.com>)
 id 1oMdeA-0003nb-Hu
 for qemu-riscv@nongnu.org; Fri, 12 Aug 2022 19:00:54 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:36357)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@dabbelt.com>)
 id 1oMde7-0002Lw-Nx
 for qemu-riscv@nongnu.org; Fri, 12 Aug 2022 19:00:54 -0400
Received: by mail-pf1-x431.google.com with SMTP id a22so1557408pfg.3
 for <qemu-riscv@nongnu.org>; Fri, 12 Aug 2022 16:00:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:to:from:cc
 :in-reply-to:subject:date:from:to:cc;
 bh=k6yWT/0OjMT08JWrp5IdU9/chuuVGBhkOndCfNLMzYY=;
 b=yLsgRIRwA8ZiH4+lGdH6RRS5ILYT+orT7GeS21/wHoWZ8ZUt5l/J1W2vNdZPcHIDku
 JLBDyE6yd6mqOn8IxccJ27Ly01t0Lm+UXmlsX5CuEuuBquJd4oYmCWN/jTi6MtilqJ4R
 RN/S5dnc8+h+tqSxXpFhP2xXu9a0PDdcA9rLpNSGXhHy8Ti0RHNOeh4NE97+KfqhU8jP
 p4rITjJfdGxe8kSpEmx6egLLGYzUFPizMbZKinQ6qywVWiXe3TFAUlrRrHfpRGDCTTz8
 5coK/0HuRmLTTLH83qM07Tv7Fmuka2tymI+KPUC5AIql4ysW3nY+ap9wrd1e3vsguMRt
 ZwjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:to:from:cc
 :in-reply-to:subject:date:x-gm-message-state:from:to:cc;
 bh=k6yWT/0OjMT08JWrp5IdU9/chuuVGBhkOndCfNLMzYY=;
 b=RdcTpVDlVe5QRL5K82OaALdyIyIM8zfCSORyOi7gXUG8y/twYZjDDBpyiWq2S7Ai3U
 QsVGdeUO44uMSVZvcioKZeP4u/HycsvK9BjxL7DSrh4WHK/DjmoUlr5AZYdPFfb5zmZU
 DbeHDtxcqW1NNgchtTU77Z693o5vqSSI9QmG1x4RPeH4Wc54pvFOksGtpgExBPLq1S+8
 M4W87tpuw56N7E52iAxIAJS6ID+Fq2bPJRaNsUUsvmcGAbrQjbz8XSRUSK7DbpiOV+kF
 EHFiIovaG2+HKddkUVWh6hzchrker+DCpYTPxCTzkoLiY3iS5sz2y16ukG2xFFbegvgK
 Ircg==
X-Gm-Message-State: ACgBeo0aCUkhPyhLLc3DyCEcno8Gi6PGVIR8upZKMMKwWSHFBOa54nUt
 XXM1g3NvRXC+m8F9Ppp58niuEA==
X-Google-Smtp-Source: AA6agR6YU7Kq1IN6evLerwH3DeoTNNMprVg4VlHypyA9pq6EZ+iEt6VZLA/JHoYU6S51Ntyif6ktZg==
X-Received: by 2002:a05:6a00:4306:b0:52e:3bdc:2635 with SMTP id
 cb6-20020a056a00430600b0052e3bdc2635mr5939200pfb.79.1660345249567; 
 Fri, 12 Aug 2022 16:00:49 -0700 (PDT)
Received: from localhost ([50.221.140.186]) by smtp.gmail.com with ESMTPSA id
 q200-20020a632ad1000000b0041c30def5e8sm1843735pgq.33.2022.08.12.16.00.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Aug 2022 16:00:48 -0700 (PDT)
Date: Fri, 12 Aug 2022 16:00:48 -0700 (PDT)
X-Google-Original-Date: Fri, 12 Aug 2022 16:00:44 PDT (-0700)
Subject: Re: [PATCH] riscv: Make semihosting configurable for all privilege
 modes
In-Reply-To: <CA+tJHD7L3Jxp06O1bAxsy_Z+qkUvUVNOhoXJM_PL6rxx1FsAAQ@mail.gmail.com>
CC: ajones@ventanamicro.com, Alistair Francis <Alistair.Francis@wdc.com>,
 bin.meng@windriver.com, qemu-riscv@nongnu.org, qemu-devel@nongnu.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: furquan@rivosinc.com
Message-ID: <mhng-2b0bb7a1-581d-4c56-88bc-d5b548520df1@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=palmer@dabbelt.com; helo=mail-pf1-x431.google.com
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
X-List-Received-Date: Fri, 12 Aug 2022 23:00:56 -0000

On Fri, 12 Aug 2022 15:05:08 PDT (-0700), furquan@rivosinc.com wrote:
> On Fri, Aug 12, 2022 at 4:04 AM Andrew Jones <ajones@ventanamicro.com> wrote:
>>
>> On Thu, Aug 11, 2022 at 01:41:04PM -0700, Furquan Shaikh wrote:
>> > Unlike ARM, RISC-V does not define a separate breakpoint type for
>> > semihosting. Instead, it is entirely ABI. Thus, we need an option
>> > to allow users to configure what the ebreak behavior should be for
>> > different privilege levels - M, S, U, VS, VU. As per the RISC-V
>> > privilege specification[1], ebreak traps into the execution
>> > environment. However, RISC-V debug specification[2] provides
>> > ebreak{m,s,u,vs,vu} configuration bits to allow ebreak behavior to
>> > be configured to trap into debug mode instead. This change adds
>> > settable properties for RISC-V CPUs - `ebreakm`, `ebreaks`, `ebreaku`,
>> > `ebreakvs` and `ebreakvu` to allow user to configure whether qemu
>> > should treat ebreak as semihosting traps or trap according to the
>> > privilege specification.
>> >
>> > [1] https://github.com/riscv/riscv-isa-manual/releases/download/draft-20220723-10eea63/riscv-privileged.pdf
>> > [2] https://github.com/riscv/riscv-debug-spec/blob/release/riscv-debug-release.pdf
>> >
>> > Signed-off-by: Furquan Shaikh <furquan@rivosinc.com>
>> > ---
>> >  target/riscv/cpu.c        |  8 ++++++++
>> >  target/riscv/cpu.h        |  7 +++++++
>> >  target/riscv/cpu_helper.c | 26 +++++++++++++++++++++++++-
>> >  3 files changed, 40 insertions(+), 1 deletion(-)
>> >
>> > diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
>> > index ac6f82ebd0..082194652b 100644
>> > --- a/target/riscv/cpu.c
>> > +++ b/target/riscv/cpu.c
>> > @@ -953,6 +953,14 @@ static Property riscv_cpu_properties[] = {
>> >      DEFINE_PROP_BOOL("short-isa-string", RISCVCPU,
>> > cfg.short_isa_string, false),
>> >
>> >      DEFINE_PROP_BOOL("rvv_ta_all_1s", RISCVCPU, cfg.rvv_ta_all_1s, false),
>> > +
>> > +    /* Debug spec */
>> > +    DEFINE_PROP_BOOL("ebreakm", RISCVCPU, cfg.ebreakm, true),
>> > +    DEFINE_PROP_BOOL("ebreaks", RISCVCPU, cfg.ebreaks, false),
>> > +    DEFINE_PROP_BOOL("ebreaku", RISCVCPU, cfg.ebreaku, false),
>> > +    DEFINE_PROP_BOOL("ebreakvs", RISCVCPU, cfg.ebreakvs, false),
>> > +    DEFINE_PROP_BOOL("ebreakvu", RISCVCPU, cfg.ebreakvu, false),
>> > +
>> >      DEFINE_PROP_END_OF_LIST(),
>> >  };
>> >
>> > diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
>> > index 5c7acc055a..eee8e487a6 100644
>> > --- a/target/riscv/cpu.h
>> > +++ b/target/riscv/cpu.h
>> > @@ -454,6 +454,13 @@ struct RISCVCPUConfig {
>> >      bool epmp;
>> >      bool aia;
>> >      bool debug;
>> > +
>> > +    /* Debug spec */
>> > +    bool ebreakm;
>> > +    bool ebreaks;
>> > +    bool ebreaku;
>> > +    bool ebreakvs;
>> > +    bool ebreakvu;
>>
>> There's only five of these, so having each separate probably makes the
>> most sense, but I wanted to point out that we could keep the properties
>> independent booleans, as we should, but still consolidate the values
>> into a single bitmap like we did for the sve vq bitmap for arm (see
>> cpu_arm_get/set_vq). Maybe worth considering?
>
> Thanks for the review and feedback, Andrew! I gave your suggestion a
> try and updated the independent booleans to a single bitmap. It works,
> but I am not sure if we really need all that additional code for this.
> Like you mentioned, it is just five of these and having independent
> booleans isn't too bad. If you or others feel strongly about switching
> this to a bitmap, I can push a revised patchset. Else, I will keep the
> change as is.
>
>>
>> >      uint64_t resetvec;
>> >
>> >      bool short_isa_string;
>> > diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
>> > index 59b3680b1b..be09abbe27 100644
>> > --- a/target/riscv/cpu_helper.c
>> > +++ b/target/riscv/cpu_helper.c
>> > @@ -1314,6 +1314,30 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr
>> > address, int size,
>> >
>> >      return true;
>> >  }
>> > +
>> > +static bool semihosting_enabled(RISCVCPU *cpu)
>> > +{
>> > +    CPURISCVState *env = &cpu->env;
>> > +
>> > +    switch (env->priv) {
>> > +    case PRV_M:
>> > +        return cpu->cfg.ebreakm;
>> > +    case PRV_S:
>> > +        if (riscv_cpu_virt_enabled(env)) {
>> > +            return cpu->cfg.ebreakvs;
>> > +        } else {
>> > +            return cpu->cfg.ebreaks;
>> > +        }
>> > +    case PRV_U:
>> > +        if (riscv_cpu_virt_enabled(env)) {
>> > +            return cpu->cfg.ebreakvu;
>> > +        } else {
>> > +            return cpu->cfg.ebreaku;
>> > +        }
>> > +    }
>> > +
>> > +    return false;
>> > +}
>> >  #endif /* !CONFIG_USER_ONLY */
>> >
>> >  /*
>> > @@ -1342,7 +1366,7 @@ void riscv_cpu_do_interrupt(CPUState *cs)
>> >      target_ulong mtval2 = 0;
>> >
>> >      if  (cause == RISCV_EXCP_SEMIHOST) {
>> > -        if (env->priv >= PRV_S) {
>> > +        if (semihosting_enabled(cpu)) {
>> >              do_common_semihosting(cs);
>> >              env->pc += 4;
>> >              return;
>> > --
>> > 2.34.1
>> >
>>
>> Bitmap or no bitmap,
>>
>> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>

Also no strong feelings on the bitmap, but I do like the feature.  When 
using an external JTAG debugger to talk to a this would probably be 
configured via something like GDB's monitor commands.  We could probably 
hook this up to QEMU's monitor as well, but doing it this way seems 
easier to implement and use.

We should document it, though.  Maybe just something like this?

diff --git a/qemu-options.hx b/qemu-options.hx
index 3f23a42fa8..f9444a1e4b 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -4635,7 +4635,9 @@ SRST
     open/read/write/seek/select. Tensilica baremetal libc for ISS and
     linux platform "sim" use this interface.

-    On RISC-V this implements the standard semihosting API, version 0.2.
+    On RISC-V this implements the standard semihosting API, version 0.2.  See
+    the ebreak{m,s,u,vs,vu} CPU properties to control which modes treat
+    breakpoints as semihosting calls.

     ``target=native|gdb|auto``
         Defines where the semihosting calls will be addressed, to QEMU

