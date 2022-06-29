Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1o6hEB-0000Ob-6c
	for mharc-qemu-riscv@gnu.org; Wed, 29 Jun 2022 19:36:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1o6hE9-0000Ni-Jv; Wed, 29 Jun 2022 19:36:09 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:33586)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1o6hE7-0006Tx-Eg; Wed, 29 Jun 2022 19:36:09 -0400
Received: by mail-pf1-x436.google.com with SMTP id n12so16569820pfq.0;
 Wed, 29 Jun 2022 16:36:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=dvgzQ6ITclk9Dao8CVBi7O8GmtJWWtfWRLnwdSOilE8=;
 b=bi3lFyLEjyKUQLJva59Iuj6A4WrG2CcG9TNUV2Lx5qxVflGZo8bTrtME6B/9qt5ssY
 TC7nUjCZRNR+SPU0gskP4AOdX1LGxKeMI93DVCfVF8mHAQF+v7PZLkDzGThnG+kskf8H
 LJ3HHdjToMbbhBiEpDJShCz5uzYM1G8WmXMfvptE8JNiGDyV9nRErvdaGkXx5uX7MTc+
 /3hBqxq8Y78mk2VaEU+WoqUHy6sx5euUQJ0gj+x2MlK37EkcadTsZuf7sy48WjXxvACz
 C6kK+TyGzhRrcBjj8V+n0mEnZBYs7RQQxssWphk9rcM0Cwgz2KYJUQa13BfHB02IGRrJ
 jBLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=dvgzQ6ITclk9Dao8CVBi7O8GmtJWWtfWRLnwdSOilE8=;
 b=PISFt+3SsKvv0/O7Yik5zY2699IBtWg4MKvWfD4v//ZHpzGX3h8agRQ+HlFJl/6PFP
 +ZYuL0vESzWGPVmQXzdezZRNBenJPKW4u6JYTdQf5UL7gzJBHoVmAh0eGWYmCHyN4pwe
 nfmMCoXKlvHixSRJ4q1M3VRn6Ah/1LQfgy7fN7XRQ7F1O6dfyrtki7mHTnNqmCuLsG18
 h/i+c2f8rT/7vB5dV2KvQJLNEw3LIP4CGXLiuG3hJ+RZ8UhnQEzxFUNcW74B7km9AnXW
 M0TAeV+565cz7HxlbURnOMS7cDekQ91aHSYvZs9gAm8inGs2p+U49SVbjx/JNyhb5lLk
 HfWg==
X-Gm-Message-State: AJIora+Il+8nxWQQd3Py2TRnKRGVolD8qoYruV4fafJYnnuJa+pcXR7u
 s9ROrwMJ6VyAh/hdAek1RBAGAgnu25eB+7b507U=
X-Google-Smtp-Source: AGRyM1uaizrZcJy3c7sJruPozjnufRZiR96IsNkLx6tjeHhQ0TPRn6PwuqgC4FTG98eLIZhUA8oiMyh+iW6lruWpLqQ=
X-Received: by 2002:a63:4d5:0:b0:40d:77fd:cff8 with SMTP id
 204-20020a6304d5000000b0040d77fdcff8mr4929350pge.361.1656545764834; Wed, 29
 Jun 2022 16:36:04 -0700 (PDT)
MIME-Version: 1.0
References: <20220623152907.1606964-1-christoph.muellner@vrull.eu>
 <CAKmqyKN2A1kMNdNpDg0wy+1uC3cz0o7sc0SWt6m01jo4DZe6xQ@mail.gmail.com>
 <CAEg0e7hc6t75eK93TZAiFAVwuJXiZQn6d7FMiS+Y=BaDNg7Pgg@mail.gmail.com>
In-Reply-To: <CAEg0e7hc6t75eK93TZAiFAVwuJXiZQn6d7FMiS+Y=BaDNg7Pgg@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 30 Jun 2022 09:35:37 +1000
Message-ID: <CAKmqyKPdk_7tBLGw9s3Ljw7yc5hFuobmwuq0L=BDmJRtAoSOkw@mail.gmail.com>
Subject: Re: [RFC PATCH v3] RISC-V: Add Zawrs ISA extension support
To: =?UTF-8?Q?Christoph_M=C3=BCllner?= <christoph.muellner@vrull.eu>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Philipp Tomsich <philipp.tomsich@vrull.eu>, 
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko.stuebner@vrull.eu>, 
 Aaron Durbin <adurbin@rivosinc.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=alistair23@gmail.com; helo=mail-pf1-x436.google.com
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
X-List-Received-Date: Wed, 29 Jun 2022 23:36:09 -0000

On Mon, Jun 27, 2022 at 6:16 PM Christoph M=C3=BCllner
<christoph.muellner@vrull.eu> wrote:
>
>
>
> On Mon, Jun 27, 2022 at 7:20 AM Alistair Francis <alistair23@gmail.com> w=
rote:
>>
>> On Fri, Jun 24, 2022 at 1:31 AM Christoph Muellner
>> <christoph.muellner@vrull.eu> wrote:
>> >
>> > This patch adds support for the Zawrs ISA extension.
>> > Given the current (incomplete) implementation of reservation sets
>> > there seems to be no way to provide a full emulation of the WRS
>> > instruction (wake on reservation set invalidation or timeout or
>> > interrupt). Therefore, we just pretend that an interrupt occured,
>> > exit the execution loop and finally continue execution.
>> >
>> > The specification can be found here:
>> > https://github.com/riscv/riscv-zawrs/blob/main/zawrs.adoc
>> >
>> > Note, that the Zawrs extension is not frozen or ratified yet.
>> > Therefore this patch is an RFC and not intended to get merged.
>> >
>> > Changes since v2:
>> > * Adjustments according to a specification change
>> > * Inline REQUIRE_ZAWRS() since it has only one user
>> >
>> > Changes since v1:
>> > * Adding zawrs to the ISA string that is passed to the kernel
>> >
>> > Signed-off-by: Christoph M=C3=BCllner <christoph.muellner@vrull.eu>
>> > ---
>> >  target/riscv/cpu.c                          |  2 +
>> >  target/riscv/cpu.h                          |  1 +
>> >  target/riscv/insn32.decode                  |  4 ++
>> >  target/riscv/insn_trans/trans_rvzawrs.c.inc | 54 ++++++++++++++++++++=
+
>> >  target/riscv/translate.c                    |  1 +
>> >  5 files changed, 62 insertions(+)
>> >  create mode 100644 target/riscv/insn_trans/trans_rvzawrs.c.inc
>> >
>> > diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
>> > index 05e6521351..6cb00fadff 100644
>> > --- a/target/riscv/cpu.c
>> > +++ b/target/riscv/cpu.c
>> > @@ -882,6 +882,7 @@ static Property riscv_cpu_extensions[] =3D {
>> >      DEFINE_PROP_BOOL("Counters", RISCVCPU, cfg.ext_counters, true),
>> >      DEFINE_PROP_BOOL("Zifencei", RISCVCPU, cfg.ext_ifencei, true),
>> >      DEFINE_PROP_BOOL("Zicsr", RISCVCPU, cfg.ext_icsr, true),
>> > +    DEFINE_PROP_BOOL("zawrs", RISCVCPU, cfg.ext_zawrs, true),
>>
>> Would this be enabled by default?
>
>
> The "true" was a personal preference (I prefer to keep the argument list =
for QEMU short)
> and I did not see any conflicts with existing behavior (no code should br=
eak).
> If you prefer otherwise or if I missed a policy I will change it.
>
>>
>>
>> >      DEFINE_PROP_BOOL("Zfh", RISCVCPU, cfg.ext_zfh, false),
>> >      DEFINE_PROP_BOOL("Zfhmin", RISCVCPU, cfg.ext_zfhmin, false),
>> >      DEFINE_PROP_BOOL("Zve32f", RISCVCPU, cfg.ext_zve32f, false),
>> > @@ -1075,6 +1076,7 @@ static void riscv_isa_string_ext(RISCVCPU *cpu, =
char **isa_str, int max_str_len)
>> >          ISA_EDATA_ENTRY(zicsr, ext_icsr),
>> >          ISA_EDATA_ENTRY(zifencei, ext_ifencei),
>> >          ISA_EDATA_ENTRY(zmmul, ext_zmmul),
>> > +        ISA_EDATA_ENTRY(zawrs, ext_zawrs),
>> >          ISA_EDATA_ENTRY(zfh, ext_zfh),
>> >          ISA_EDATA_ENTRY(zfhmin, ext_zfhmin),
>> >          ISA_EDATA_ENTRY(zfinx, ext_zfinx),
>> > diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
>> > index 7d6397acdf..a22bc0fa09 100644
>> > --- a/target/riscv/cpu.h
>> > +++ b/target/riscv/cpu.h
>> > @@ -380,6 +380,7 @@ struct RISCVCPUConfig {
>> >      bool ext_h;
>> >      bool ext_j;
>> >      bool ext_v;
>> > +    bool ext_zawrs;
>> >      bool ext_zba;
>> >      bool ext_zbb;
>> >      bool ext_zbc;
>> > diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
>> > index 4033565393..513ea227fe 100644
>> > --- a/target/riscv/insn32.decode
>> > +++ b/target/riscv/insn32.decode
>> > @@ -711,6 +711,10 @@ vsetvli         0 ........... ..... 111 ..... 101=
0111  @r2_zimm11
>> >  vsetivli        11 .......... ..... 111 ..... 1010111  @r2_zimm10
>> >  vsetvl          1000000 ..... ..... 111 ..... 1010111  @r
>> >
>> > +# *** Zawrs Standard Extension ***
>> > +wrs_nto    000000001101 00000 000 00000 1110011
>> > +wrs_sto    000000011101 00000 000 00000 1110011
>> > +
>> >  # *** RV32 Zba Standard Extension ***
>> >  sh1add     0010000 .......... 010 ..... 0110011 @r
>> >  sh2add     0010000 .......... 100 ..... 0110011 @r
>> > diff --git a/target/riscv/insn_trans/trans_rvzawrs.c.inc b/target/risc=
v/insn_trans/trans_rvzawrs.c.inc
>> > new file mode 100644
>> > index 0000000000..d0df56378e
>> > --- /dev/null
>> > +++ b/target/riscv/insn_trans/trans_rvzawrs.c.inc
>> > @@ -0,0 +1,54 @@
>> > +/*
>> > + * RISC-V translation routines for the RISC-V Zawrs Extension.
>> > + *
>> > + * Copyright (c) 2022 Christoph Muellner, christoph.muellner@vrull.io
>> > + *
>> > + * This program is free software; you can redistribute it and/or modi=
fy it
>> > + * under the terms and conditions of the GNU General Public License,
>> > + * version 2 or later, as published by the Free Software Foundation.
>> > + *
>> > + * This program is distributed in the hope it will be useful, but WIT=
HOUT
>> > + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY=
 or
>> > + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public Lice=
nse for
>> > + * more details.
>> > + *
>> > + * You should have received a copy of the GNU General Public License =
along with
>> > + * this program.  If not, see <http://www.gnu.org/licenses/>.
>> > + */
>> > +
>> > +static bool trans_wrs(DisasContext *ctx)
>> > +{
>> > +    if (!ctx->cfg_ptr->ext_zawrs) {
>> > +        return false;
>> > +    }
>> > +
>> > +    /*
>> > +     * We may continue if one or more of the following conditions are=
 met:
>> > +     * a) The reservation set is invalid
>>
>> Shouldn't this be valid?
>
>
> The CPU is supposed to continue (stop waiting) when the reservation set b=
ecomes invalid.
> An earlier LR instruction registers a reservation set and the WRS.* instr=
uctions wait until
> this reservation set becomes invalided by a store from another hart to th=
e same reservation set.
> So I think the description is correct.
>
>>
>>
>> > +     * b) If WRS.STO, a short time since start of stall has elapsed
>> > +     * c) An interrupt is observed
>> > +     *
>> > +     * A reservation set can be invalidated by any store to a reserve=
d
>> > +     * memory location. However, that's currently not implemented in =
QEMU.
>> > +     * So let's just exit the CPU loop and pretend that an interrupt =
occured.
>>
>> We don't actually pretend an interrupt occurs though. It seems like
>> it's valid to terminate the stall early, so we should just be able to
>> do that.
>
>
> The specification allows stopping the CPU stall if an interrupt occurs th=
at is disabled.
> I think that would match the implemented behavior.
>
> The latest spec update introduced the following sentence:
> "While stalled, an implementation is permitted to occasionally terminate =
the stall and complete execution for any reason."
> I did not want to use this justification for the implementation, because =
of the word "occasionally" (the correct word would
> be "always" in the implementation). Do you prefer to use this sentence in=
stead?

I think that is a better justification. When I first read your comment
I thought you were going to generate a fake interrupt as well!

Alistair

>
> Thanks,
> Christoph
>
>
>
>>
>>
>> Alistair
>>
>> > +     */
>> > +
>> > +    /* Clear the load reservation  (if any).  */
>> > +    tcg_gen_movi_tl(load_res, -1);
>> > +
>> > +    gen_set_pc_imm(ctx, ctx->pc_succ_insn);
>> > +    tcg_gen_exit_tb(NULL, 0);
>> > +    ctx->base.is_jmp =3D DISAS_NORETURN;
>> > +
>> > +    return true;
>> > +}
>> > +
>> > +#define GEN_TRANS_WRS(insn)                                          =
  \
>> > +static bool trans_ ## insn(DisasContext *ctx, arg_ ## insn *a)       =
  \
>> > +{                                                                    =
  \
>> > +       (void)a;                                                      =
  \
>> > +       return trans_wrs(ctx);                                        =
  \
>> > +}
>> > +
>> > +GEN_TRANS_WRS(wrs_nto)
>> > +GEN_TRANS_WRS(wrs_sto)
>> > diff --git a/target/riscv/translate.c b/target/riscv/translate.c
>> > index b151c20674..a4f07d5166 100644
>> > --- a/target/riscv/translate.c
>> > +++ b/target/riscv/translate.c
>> > @@ -1007,6 +1007,7 @@ static uint32_t opcode_at(DisasContextBase *dcba=
se, target_ulong pc)
>> >  #include "insn_trans/trans_rvh.c.inc"
>> >  #include "insn_trans/trans_rvv.c.inc"
>> >  #include "insn_trans/trans_rvb.c.inc"
>> > +#include "insn_trans/trans_rvzawrs.c.inc"
>> >  #include "insn_trans/trans_rvzfh.c.inc"
>> >  #include "insn_trans/trans_rvk.c.inc"
>> >  #include "insn_trans/trans_privileged.c.inc"
>> > --
>> > 2.35.3
>> >
>> >

