Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jxiIP-0002R9-Uu
	for mharc-qemu-riscv@gnu.org; Mon, 20 Jul 2020 22:46:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zong.li@sifive.com>)
 id 1jxiIO-0002Qd-2M
 for qemu-riscv@nongnu.org; Mon, 20 Jul 2020 22:46:20 -0400
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:39147)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <zong.li@sifive.com>)
 id 1jxiIM-0000iB-Ei
 for qemu-riscv@nongnu.org; Mon, 20 Jul 2020 22:46:19 -0400
Received: by mail-oi1-x244.google.com with SMTP id w17so16045857oie.6
 for <qemu-riscv@nongnu.org>; Mon, 20 Jul 2020 19:46:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZvtYBtBKpih4QmDpBqfuD7U/hOUtMDyjJ2qtYKxB568=;
 b=i7AiMrL36RCzMo5/AR2E1Nbopn9ARiUKIdBS0wrikt4n1VW5g5fxOXhDQ93TwuppTe
 OjDg/JhBg3Vul1conSLIpdlp00I7VoGtGcNQkU3vH3Ux8K34q+xH/qgaatV4BUso+SDA
 t9Es63E1/lFIfFl84Emru4cay9asbzyJIsk1VkD1Pfs/R0u0c2NXMSpxLYiWPMd8LkVr
 gAaHthgWXpueU7uVwHHpCmcA+3q9/jZjx880SbcrciedSiCNS7v7kqOoxgR2lhATbdm6
 4VcGWp2ozwJrT9t7so/SzCjJAqA+U8xRA+tHsGuhuPzncwN2saBLFvSjUEKRLi05TkVZ
 r8Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZvtYBtBKpih4QmDpBqfuD7U/hOUtMDyjJ2qtYKxB568=;
 b=a5gVZ7DAgk1A1rV2n5floifA7KMblY6nzWP5vZilnnN8Vr41wnLLABvu56LKfSTwF7
 derkKxxA3019o3vgL3TiVyUwe/6BUxYPFT3eGa4IQ60GbStQ85UlcLL1jupgX8/5nef6
 ZgJk9vveg+hzMnh1xc7ykMexxb73qTzJTu5PW+2ZNRxGCIUQGBIlPbOF/wrycFGhjhOc
 ZIXbAOXE61IS5yKFNU/m4x+iQ7FqjGWy3R1ubhjgp0kl3tVz0esQf4qnaSgQ+ddz76TX
 EjbB7rPNEcMKukBTCWuub6BOnbWd+cZLoAXbW+MOXyPDlkx9/0nm5OOzIsg7ze7qZXAY
 pvoA==
X-Gm-Message-State: AOAM531T0fu8RoOuCnTeOaknge6XYUwTUPj7yMzfdvT1FRyv2xMlPO2B
 xy3HNVm2ZQmH1Pk9XZ1zV/sQP2tLtao5g8GPVtSHXg==
X-Google-Smtp-Source: ABdhPJy/t4FSy2xk9r4adOXS9wwLrNXQblEDBrB+S6JFMkdH1iQzpNH3tUlQ5YZwev9K92VzyCeLBA+JGT6CPVLMPaU=
X-Received: by 2002:aca:d509:: with SMTP id m9mr1534190oig.116.1595299577131; 
 Mon, 20 Jul 2020 19:46:17 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1595234208.git.zong.li@sifive.com>
 <658e49284fc564d4114307cb559cf23ea3e751fd.1595234208.git.zong.li@sifive.com>
 <CAEUhbmWz0Afs4YotbQi-t96A-eEcQzxzwkYjHtQ4BZxJ7SCgxw@mail.gmail.com>
In-Reply-To: <CAEUhbmWz0Afs4YotbQi-t96A-eEcQzxzwkYjHtQ4BZxJ7SCgxw@mail.gmail.com>
From: Zong Li <zong.li@sifive.com>
Date: Tue, 21 Jul 2020 10:46:06 +0800
Message-ID: <CANXhq0pd7LyN4-Ysmss=SWjidBZjui_EGq1d1xrOXDmDNN=KeA@mail.gmail.com>
Subject: Re: [PATCH 2/2] target/riscv/pmp.c: Fix the index offset on RV64
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::244;
 envelope-from=zong.li@sifive.com; helo=mail-oi1-x244.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 21 Jul 2020 02:46:20 -0000

On Tue, Jul 21, 2020 at 10:41 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> Hi Zong,
>
> On Mon, Jul 20, 2020 at 5:46 PM Zong Li <zong.li@sifive.com> wrote:
> >
> > On RV64, the reg_index is 2 (pmpcfg2 CSR) after the seventh pmp
> > entry, it is not 1 (pmpcfg1 CSR) like RV32. In the original
> > implementation, the second parameter of pmp_write_cfg is
> > "reg_index * sizeof(target_ulong)", and we get the the result
> > which is started from 16 if reg_index is 2, but we expect that
> > it should be started from 8. Separate the implementation for
> > RV32 and RV64 respectively.
> >
> > Signed-off-by: Zong Li <zong.li@sifive.com>
> > ---
> >  target/riscv/pmp.c | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> >
> > diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
> > index 2a2b9f5363..adcdd411e6 100644
> > --- a/target/riscv/pmp.c
> > +++ b/target/riscv/pmp.c
> > @@ -320,8 +320,13 @@ void pmpcfg_csr_write(CPURISCVState *env, uint32_t reg_index,
> >
> >      for (i = 0; i < sizeof(target_ulong); i++) {
> >          cfg_val = (val >> 8 * i)  & 0xff;
> > +#if defined(TARGET_RISCV32)
> >          pmp_write_cfg(env, (reg_index * sizeof(target_ulong)) + i,
> >              cfg_val);
> > +#elif defined(TARGET_RISCV64)
> > +        pmp_write_cfg(env, ((reg_index >> 1) * sizeof(target_ulong)) + i,
> > +            cfg_val);
> > +#endif
>
> Can you please simplify this by shifting reg_index outside the for
> loop for RV64?
>

OK, that would be great. Change it in the next version, thanks.

> >      }
> >  }
> >
> > @@ -336,7 +341,11 @@ target_ulong pmpcfg_csr_read(CPURISCVState *env, uint32_t reg_index)
> >      target_ulong val = 0;
> >
> >      for (i = 0; i < sizeof(target_ulong); i++) {
> > +#if defined(TARGET_RISCV32)
> >          val = pmp_read_cfg(env, (reg_index * sizeof(target_ulong)) + i);
> > +#elif defined(TARGET_RISCV64)
> > +        val = pmp_read_cfg(env, ((reg_index >> 1) * sizeof(target_ulong)) + i);
> > +#endif
> >          cfg_val |= (val << (i * 8));
> >      }
> >      trace_pmpcfg_csr_read(env->mhartid, reg_index, cfg_val);
>
> Regards,
> Bin

