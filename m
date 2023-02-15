Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pSQyQ-0006Y8-5q
	for mharc-qemu-riscv@gnu.org; Wed, 15 Feb 2023 18:14:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <debug@rivosinc.com>)
 id 1pSQyO-0006XU-61
 for qemu-riscv@nongnu.org; Wed, 15 Feb 2023 18:14:00 -0500
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <debug@rivosinc.com>)
 id 1pSQyL-0006Hd-7G
 for qemu-riscv@nongnu.org; Wed, 15 Feb 2023 18:13:59 -0500
Received: by mail-ed1-x534.google.com with SMTP id n20so642516edy.0
 for <qemu-riscv@nongnu.org>; Wed, 15 Feb 2023 15:13:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=EhztFA5Q+nmazngAoL8vXMR+vDKNbL+tGotZpUc65dc=;
 b=hyJuBhE5o0zJgrDGM0L680OVzysBChLQOVR7G/UU/eoTuF/QGb9HsnGACwFnNsXtul
 kn+4R8CGbyXVXnadgL9uWtXP//uViLeRsdpPA9mfdQnh+rwdsSQN6j/rPr8r5S4tlrqh
 33iySqevu+lFthX4lobw7t8TXCiG6gByU4OiW5wL7UY89v7Q5cSg4wVtNhpZ6YV0pMJE
 r+v8ZyMY6w8rYfW0aDtwiPQw3QWZxG2ASCeQ1q6s1rXyEvs93+uDQOKW/opsQjNGqDIX
 w+GQR2fANJ3xZarr7CvZtQ/TSoairGyPUn3qhpsp0629LPbTzm1WgVP6sVUQqCFIhfq3
 mQeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EhztFA5Q+nmazngAoL8vXMR+vDKNbL+tGotZpUc65dc=;
 b=NWpqlGktsFuW1hZVk9flQ6GFAvLi9c+Y7PnxcP/K7p49gdwyO2yOmG6gML5A9NuRpN
 aqHM5LGhOS1HZWzAN2uC56NFiE1dD420SyIGnfEsvQoT/E77FukjC1airzk5gPfXyRkx
 sFaFtmgj+myteDFMQ6LgWLPGFTa/4jSfzco6RazCyMgEYWqAnymLlVN9q67n4iSU5plI
 /SskVxcXZ0rXQ5J4dx3CYg4EXw3t1X0b/BCXOFNnor4qrjY5WsrEePOhYGIiE56oJAPq
 wUyZ3QD4dFP9FYIeICQmJGp8BsTvaShU64e8RfWJivoVyGKKip8inV6l4zGrtWqrD4+Z
 r3yQ==
X-Gm-Message-State: AO0yUKXyOTZbl9lwsMkWwurHn8rVlx2dJ97cEjC1Pi9zYCUJNYbL7hsm
 Blqrw4BCGtFJeQX4e1mVkL1MauH2ccmZpYK4zh5duQ==
X-Google-Smtp-Source: AK7set+rgSg7j+qryPXpFspUMUYYEZSXK6B1DKJpAjFqsG6IJSMDTm7xowdL6gKQPtG7FEesAqqKZ/xdaf0D8p3kZLU=
X-Received: by 2002:a05:6402:f21:b0:4ac:e5d4:e13f with SMTP id
 i33-20020a0564020f2100b004ace5d4e13fmr185797eda.3.1676502834430; Wed, 15 Feb
 2023 15:13:54 -0800 (PST)
MIME-Version: 1.0
References: <20230209062404.3582018-1-debug@rivosinc.com>
 <20230209062404.3582018-6-debug@rivosinc.com>
 <ab4b143a-0fac-dbd5-7e35-46e8433a1644@linux.alibaba.com>
In-Reply-To: <ab4b143a-0fac-dbd5-7e35-46e8433a1644@linux.alibaba.com>
From: Deepak Gupta <debug@rivosinc.com>
Date: Wed, 15 Feb 2023 15:13:34 -0800
Message-ID: <CAKC1njSRmc1G6MAn5XJt_pcR7Q425aFiZV2KprQt32jOS-uaUQ@mail.gmail.com>
Subject: Re: [PATCH v1 RFC Zisslpcfi 5/9] target/riscv: state save and restore
 of zisslppcfi state
To: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, liweiwei@iscas.ac.cn,
 dbarboza@ventanamicro.com, 
 Kip Walker <kip@rivosinc.com>, qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=debug@rivosinc.com; helo=mail-ed1-x534.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Wed, 15 Feb 2023 23:14:00 -0000

On Tue, Feb 14, 2023 at 10:11 PM LIU Zhiwei
<zhiwei_liu@linux.alibaba.com> wrote:
>
>
> On 2023/2/9 14:24, Deepak Gupta wrote:
> > zisslpcfi's forward cfi if enabled on a hart, enables tracking of
> > indirect branches. CPU/hart internally keeps a state `elp` short
> > for expecting landing pad instruction. This state goes into
> > LP_EXPECTED on an indirect branch. But an interrupt/exception can occur
> > before target instruction is executed. In such a case this state must be
> > preserved so that it can be restored later. zisslpcfi saves elp state in
> > `sstatus` CSR.
>
> And mstatus CSR.

Noted.

>
> Otherwise,
>
> Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
>
> > This patch saves elp state in sstatus CSR on trap delivery
> > while restores from sstatus CSR on trap return.
> >
> > Additionally state in sstatus CSR must have save and restore zisslpcfi
> > state on exiting from hypervisor and entering into hypervisor.
> >
> > Signed-off-by: Deepak Gupta <debug@rivosinc.com>
> > Signed-off-by: Kip Walker  <kip@rivosinc.com>
> > ---
> >   target/riscv/cpu_bits.h   |  5 +++++
> >   target/riscv/cpu_helper.c | 26 ++++++++++++++++++++++++++
> >   target/riscv/op_helper.c  | 12 ++++++++++++
> >   3 files changed, 43 insertions(+)
> >
> > diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
> > index 1663ba5775..37100ec8f6 100644
> > --- a/target/riscv/cpu_bits.h
> > +++ b/target/riscv/cpu_bits.h
> > @@ -594,6 +594,11 @@ typedef enum {
> >
> >   #define CFISTATUS_S_MASK    (SSTATUS_UFCFIEN | SSTATUS_UBCFIEN | \
> >                                SSTATUS_SPELP)
> > +/* enum for branch tracking state in cpu/hart */
> > +typedef enum {
> > +    NO_LP_EXPECTED = 0,
> > +    LP_EXPECTED = 1,
> > +} cfi_elp;
> >
> >   /* hstatus CSR bits */
> >   #define HSTATUS_VSBE         0x00000020
> > diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> > index a397023840..fc188683c9 100644
> > --- a/target/riscv/cpu_helper.c
> > +++ b/target/riscv/cpu_helper.c
> > @@ -534,6 +534,16 @@ void riscv_cpu_swap_hypervisor_regs(CPURISCVState *env)
> >       if (riscv_has_ext(env, RVF)) {
> >           mstatus_mask |= MSTATUS_FS;
> >       }
> > +
> > +    /*
> > +     * If cfi extension available, menvcfg.CFI = 1 and henvcfg.CFI = 1,
> > +     * then apply CFI mask on mstatus
> > +     */
> > +    if (env_archcpu(env)->cfg.ext_cfi &&
> > +        get_field(env->menvcfg, MENVCFG_CFI) &&
> > +        get_field(env->henvcfg, HENVCFG_CFI)) {
> > +        mstatus_mask |= CFISTATUS_S_MASK;
> > +    }
> >       bool current_virt = riscv_cpu_virt_enabled(env);
> >
> >       g_assert(riscv_has_ext(env, RVH));
> > @@ -1723,6 +1733,10 @@ void riscv_cpu_do_interrupt(CPUState *cs)
> >       if (env->priv <= PRV_S &&
> >               cause < TARGET_LONG_BITS && ((deleg >> cause) & 1)) {
> >           /* handle the trap in S-mode */
> > +        /* save elp status */
> > +        if (cpu_get_fcfien(env)) {
> > +            env->mstatus = set_field(env->mstatus, MSTATUS_SPELP, env->elp);
> > +        }
> >           if (riscv_has_ext(env, RVH)) {
> >               uint64_t hdeleg = async ? env->hideleg : env->hedeleg;
> >
> > @@ -1772,6 +1786,10 @@ void riscv_cpu_do_interrupt(CPUState *cs)
> >           riscv_cpu_set_mode(env, PRV_S);
> >       } else {
> >           /* handle the trap in M-mode */
> > +        /* save elp status */
> > +        if (cpu_get_fcfien(env)) {
> > +            env->mstatus = set_field(env->mstatus, MSTATUS_MPELP, env->elp);
> > +        }
> >           if (riscv_has_ext(env, RVH)) {
> >               if (riscv_cpu_virt_enabled(env)) {
> >                   riscv_cpu_swap_hypervisor_regs(env);
> > @@ -1803,6 +1821,14 @@ void riscv_cpu_do_interrupt(CPUState *cs)
> >           riscv_cpu_set_mode(env, PRV_M);
> >       }
> >
> > +    /*
> > +     * Interrupt/exception/trap delivery is asynchronous event and as per
> > +     * Zisslpcfi spec CPU should clear up the ELP state. If cfi extension is
> > +     * available, clear ELP state.
> > +     */
> > +    if (cpu->cfg.ext_cfi) {
> > +        env->elp = NO_LP_EXPECTED;
> > +    }
> >       /* NOTE: it is not necessary to yield load reservations here. It is only
> >        * necessary for an SC from "another hart" to cause a load reservation
> >        * to be yielded. Refer to the memory consistency model section of the
> > diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
> > index 878bcb03b8..d15893aa82 100644
> > --- a/target/riscv/op_helper.c
> > +++ b/target/riscv/op_helper.c
> > @@ -176,6 +176,12 @@ target_ulong helper_sret(CPURISCVState *env)
> >           riscv_cpu_set_virt_enabled(env, prev_virt);
> >       }
> >
> > +    /* If forward cfi enabled for target, restore elp status */
> > +    if (cpu_get_fcfien(env)) {
> > +        env->elp = get_field(env->mstatus, MSTATUS_SPELP);
> > +        env->mstatus = set_field(env->mstatus, MSTATUS_SPELP, 0);
> > +    }
> > +
> >       riscv_cpu_set_mode(env, prev_priv);
> >
> >       return retpc;
> > @@ -220,6 +226,12 @@ target_ulong helper_mret(CPURISCVState *env)
> >           riscv_cpu_set_virt_enabled(env, prev_virt);
> >       }
> >
> > +    /* If forward cfi enabled for target, restore elp status */
> > +    if (cpu_get_fcfien(env)) {
> > +        env->elp = get_field(env->mstatus, MSTATUS_MPELP);
> > +        env->mstatus = set_field(env->mstatus, MSTATUS_MPELP, 0);
> > +    }
> > +
> >       return retpc;
> >   }
> >

