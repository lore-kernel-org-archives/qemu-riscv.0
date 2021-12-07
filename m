Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1muXPF-0005d2-1Q
	for mharc-qemu-riscv@gnu.org; Tue, 07 Dec 2021 05:09:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1muXPD-0005b6-6c
 for qemu-riscv@nongnu.org; Tue, 07 Dec 2021 05:09:03 -0500
Received: from [2a00:1450:4864:20::429] (port=43528
 helo=mail-wr1-x429.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1muXPB-0003Bn-8Q
 for qemu-riscv@nongnu.org; Tue, 07 Dec 2021 05:09:02 -0500
Received: by mail-wr1-x429.google.com with SMTP id v11so28304243wrw.10
 for <qemu-riscv@nongnu.org>; Tue, 07 Dec 2021 02:09:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8MZEczad7TrkxfpuAcU2gPQugacmN72JMORCufPCdxI=;
 b=bCw+qqgh20M5JrbazDLWp7cqLzkE8PtTvaJrYzwk4Sw8Y4UAZ/OgeHXN0KTfWKwCL/
 6wKTf9dP7vp+U69UgNCv/tDEuDorBtbbtOvCzkq3usFVvK/GVtL5xPlTVjGcvmJeFBrx
 KwoiqgTlJVXVRmUEbDSButOMrMtS7Q8CAsRRWPt/1fl+oTgTTvUnSJCiMC3xHKGPSazy
 RfGSbgs2bU9VRil+F5R7zFvqaniPhPp5WAAX8Ik8WX6XlTQXRnB9JkTzfIaSXFStbV3r
 5mUuTSDHTaP54KTtOqekza3q0dHAXuM5nbTbVqDAMZUJzvMRh6w8eaOSLmL45JswrEit
 5klA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8MZEczad7TrkxfpuAcU2gPQugacmN72JMORCufPCdxI=;
 b=xpuPT0RDmhYYqYlLpsWzfTSBNR2ESRk3zvl8TGcC+g/fGjmSjwuwcHj/8wPJNvtPPj
 eJ64/T9I5FbnWbREk+mVSfwgScRdHVKbk2OU8oTX3PODMmhdxvi5s9nfB46Xkg2J0f/e
 d9o9WGo5Xa0yYR0DzGVFi8EJZ99X/DLCIHVLSgDNq7930xRPt3eqCAc9n9MTSybcnFSE
 9gE3SCE9ppnrPIZLgjo04kBrEtQ5JvhMhuhpctBluGTsgnKvyy5EnBJQx8xQCxd1fcFS
 3sQhmFwAz2ndfseN/hSAgpTReKkojo61RAurnXGv4y8DemuKOGqtjfxHmYiY2FKUHjW4
 grRg==
X-Gm-Message-State: AOAM5333hdb6JPfzBWcjSnrjSx+/r6VCfNw6pYvgTfcbE8F7RLFIJAeo
 0D2MLdLV6N8/Zac9sFXo5cTLArxetXdN08U2dS5QIA==
X-Google-Smtp-Source: ABdhPJyfYpobDQ+zcZjXkax34+OZAR6UMrK09k3PqHM0sXgoCLbn3MbVOJyEMWxpwSrE9nIKTWFzCCGsJxE4Ih09S0Q=
X-Received: by 2002:a5d:45c4:: with SMTP id b4mr49559165wrs.222.1638871738891; 
 Tue, 07 Dec 2021 02:08:58 -0800 (PST)
MIME-Version: 1.0
References: <20211026064227.2014502-1-anup.patel@wdc.com>
 <20211026064227.2014502-9-anup.patel@wdc.com>
 <CAKmqyKOQm1Cz39vmaz0McP6OD=GoOptL0BxC+z6bzFwUCnx0pQ@mail.gmail.com>
In-Reply-To: <CAKmqyKOQm1Cz39vmaz0McP6OD=GoOptL0BxC+z6bzFwUCnx0pQ@mail.gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 7 Dec 2021 15:38:47 +0530
Message-ID: <CAAhSdy2FzJXxXVi2jrDWcpioaZ5msm5zs3fOtFReXoSDo-fM5g@mail.gmail.com>
Subject: Re: [PATCH v4 08/22] target/riscv: Allow AIA device emulation to set
 ireg rmw callback
To: Alistair Francis <alistair23@gmail.com>
Cc: Anup Patel <anup.patel@wdc.com>, Peter Maydell <peter.maydell@linaro.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Atish Patra <atish.patra@wdc.com>, Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::429
 (failed)
Received-SPF: none client-ip=2a00:1450:4864:20::429;
 envelope-from=anup@brainfault.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Tue, 07 Dec 2021 10:09:03 -0000

On Thu, Nov 4, 2021 at 10:23 AM Alistair Francis <alistair23@gmail.com> wrote:
>
> On Tue, Oct 26, 2021 at 6:00 PM Anup Patel <anup.patel@wdc.com> wrote:
> >
> > The AIA device emulation (such as AIA IMSIC) should be able to set
> > (or provide) AIA ireg read-modify-write callback for each privilege
> > level of a RISC-V HART.
> >
> > Signed-off-by: Anup Patel <anup.patel@wdc.com>
> > ---
> >  target/riscv/cpu.h        | 19 +++++++++++++++++++
> >  target/riscv/cpu_helper.c | 14 ++++++++++++++
> >  2 files changed, 33 insertions(+)
> >
> > diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> > index 7182fadd21..ef4298dc69 100644
> > --- a/target/riscv/cpu.h
> > +++ b/target/riscv/cpu.h
> > @@ -239,6 +239,18 @@ struct CPURISCVState {
> >      uint64_t (*rdtime_fn)(uint32_t);
> >      uint32_t rdtime_fn_arg;
> >
> > +    /* machine specific AIA ireg read-modify-write callback */
> > +#define AIA_MAKE_IREG(__isel, __priv, __virt, __vgein) \
> > +    ((((__vgein) & 0x3f) << 24) | (((__virt) & 0x1) << 20) | \
> > +     (((__priv) & 0x3) << 16) | (__isel & 0xffff))
> > +#define AIA_IREG_ISEL(__ireg)                  ((__ireg) & 0xffff)
> > +#define AIA_IREG_PRIV(__ireg)                  (((__ireg) >> 16) & 0x3)
> > +#define AIA_IREG_VIRT(__ireg)                  (((__ireg) >> 20) & 0x1)
> > +#define AIA_IREG_VGEIN(__ireg)                 (((__ireg) >> 24) & 0x3f)
>
> These should be added when they are used

Actually, these define help us encode/decode AIA indirect register number
passed as "reg" parameter to aia_ireg_rmw_fn() below.

Regards,
Anup

>
> Alistair
>
> > +    int (*aia_ireg_rmw_fn[4])(void *arg, target_ulong reg,
> > +        target_ulong *val, target_ulong new_val, target_ulong write_mask);
> > +    void *aia_ireg_rmw_fn_arg[4];
> > +
> >      /* True if in debugger mode.  */
> >      bool debugger;
> >  #endif
> > @@ -380,6 +392,13 @@ uint32_t riscv_cpu_update_mip(RISCVCPU *cpu, uint32_t mask, uint32_t value);
> >  #define BOOL_TO_MASK(x) (-!!(x)) /* helper for riscv_cpu_update_mip value */
> >  void riscv_cpu_set_rdtime_fn(CPURISCVState *env, uint64_t (*fn)(uint32_t),
> >                               uint32_t arg);
> > +void riscv_cpu_set_aia_ireg_rmw_fn(CPURISCVState *env, uint32_t priv,
> > +                                   int (*rmw_fn)(void *arg,
> > +                                                 target_ulong reg,
> > +                                                 target_ulong *val,
> > +                                                 target_ulong new_val,
> > +                                                 target_ulong write_mask),
> > +                                   void *rmw_fn_arg);
> >  #endif
> >  void riscv_cpu_set_mode(CPURISCVState *env, target_ulong newpriv);
> >
> > diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> > index 04df3792a8..d70def1da8 100644
> > --- a/target/riscv/cpu_helper.c
> > +++ b/target/riscv/cpu_helper.c
> > @@ -375,6 +375,20 @@ void riscv_cpu_set_rdtime_fn(CPURISCVState *env, uint64_t (*fn)(uint32_t),
> >      env->rdtime_fn_arg = arg;
> >  }
> >
> > +void riscv_cpu_set_aia_ireg_rmw_fn(CPURISCVState *env, uint32_t priv,
> > +                                   int (*rmw_fn)(void *arg,
> > +                                                 target_ulong reg,
> > +                                                 target_ulong *val,
> > +                                                 target_ulong new_val,
> > +                                                 target_ulong write_mask),
> > +                                   void *rmw_fn_arg)
> > +{
> > +    if (priv <= PRV_M) {
> > +        env->aia_ireg_rmw_fn[priv] = rmw_fn;
> > +        env->aia_ireg_rmw_fn_arg[priv] = rmw_fn_arg;
> > +    }
> > +}
> > +
> >  void riscv_cpu_set_mode(CPURISCVState *env, target_ulong newpriv)
> >  {
> >      if (newpriv > PRV_M) {
> > --
> > 2.25.1
> >
> >

