Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ntFPk-0005dP-0L
	for mharc-qemu-riscv@gnu.org; Mon, 23 May 2022 17:16:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1ntFPi-0005Xp-AZ; Mon, 23 May 2022 17:16:30 -0400
Received: from mail-io1-xd35.google.com ([2607:f8b0:4864:20::d35]:42698)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1ntFPg-00012v-9R; Mon, 23 May 2022 17:16:29 -0400
Received: by mail-io1-xd35.google.com with SMTP id a10so16582270ioe.9;
 Mon, 23 May 2022 14:16:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=bC4mRZTBRMiPw33yhVCueTcd4vYm/1+iEBSzgpWX1gQ=;
 b=Ukzwu1GD244mKy6LMRez1SGPPX8LAtrhVEtvr5MjaPRYJozSVtraDe2Z+jvmSrP55B
 vM9g0VWod1Xii/hC87NhW/IKRucwqb8ffzzqjlJcHPgYxT8ZNx+8rdYVmORfUCADrlVo
 L5qa4OWUPZNBleBWssCCnuX2SqsSj9csOc8mZm2fAjfOjnRr1bLpvTkEpgBrLY3GyuDy
 4qxTi5WQJDo5PxFuT6x/R+aPUFYp9+YC+/7a0z5wNHcgaywD6fPhESK8khbsbo6m4DOM
 E3x3fTtIPdyoehVoMDpEJoQVM6E8EscYCE8qEZOTaH0XDyzmqigf5BS0Ir+A6ThPvuEM
 SNfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=bC4mRZTBRMiPw33yhVCueTcd4vYm/1+iEBSzgpWX1gQ=;
 b=3d3iRUS36Yim9BBq6pUBc9wd1sJByoklNf4fdnm8bhCFsoa/CrIkPp8/NO98vzZjnk
 3YZ++N/7gc5UIsfraCJJtPLix2Hxiw5aowUu3A7RxQQ6VfMzo6spb+Rob4IEOSCVy7WR
 QbFGqafRYoOdF/mAsIrH30vaME6cSiX7Jj+3NP+e8PZZMHqsmrPbU2bVShpOkk2h/6R8
 7Xb8iTJgGL/MatZaKsjcVelpTbPM5zc9pZNY4pe9r3clSSK6vOa59OwjBT0XWyOHaLim
 kQoX+Dn4RckGxJTtqV+CLhNv6iREGKagD+nc+y2jTvINrbgRXDAyl/1lqMZ3nbCD6qcY
 K3lQ==
X-Gm-Message-State: AOAM5302/qx4rwvuTJnBo9XULmRyOC1Fsm5VTB3oXluaTiOjY9MN4QSv
 303I7L/iDGFOOyab4WH2ZTgr+/4pIYfWlPzpGYw=
X-Google-Smtp-Source: ABdhPJzfMzlDRdmlc0vbWubkZ43caW0ZAq9h6haf3tmdQBTDMrHe1qDfKFdzr5O1vKh2z4LVEv/Y7F/HUQLUWfHrHbU=
X-Received: by 2002:a05:6638:160d:b0:32b:d9d2:f2f2 with SMTP id
 x13-20020a056638160d00b0032bd9d2f2f2mr12155050jas.68.1653340585712; Mon, 23
 May 2022 14:16:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220518015316.20504-1-liweiwei@iscas.ac.cn>
 <CAKmqyKNBQo91af1m5t_wDOVMeh=6uYD9Q+KugoTOQYzQJUtf5w@mail.gmail.com>
 <3ed635e4-5705-007c-be5c-edd07936758d@iscas.ac.cn>
In-Reply-To: <3ed635e4-5705-007c-be5c-edd07936758d@iscas.ac.cn>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 24 May 2022 07:15:59 +1000
Message-ID: <CAKmqyKPBqGvvE1LLu3s3zHNYJqhT=OKD5tLU02gmKfPdsBcy8w@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: add support for zmmul extension v0.1
To: Weiwei Li <liweiwei@iscas.ac.cn>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 wangjunqiang <wangjunqiang@iscas.ac.cn>, 
 =?UTF-8?B?V2VpIFd1ICjlkLTkvJ8p?= <lazyparser@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::d35;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd35.google.com
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
X-List-Received-Date: Mon, 23 May 2022 21:16:30 -0000

On Mon, May 23, 2022 at 6:10 PM Weiwei Li <liweiwei@iscas.ac.cn> wrote:
>
>
> =E5=9C=A8 2022/5/23 =E4=B8=8B=E5=8D=882:34, Alistair Francis =E5=86=99=E9=
=81=93:
> > On Wed, May 18, 2022 at 11:54 AM Weiwei Li <liweiwei@iscas.ac.cn> wrote=
:
> >>   - includes all multiplication operations for M extension
> >>
> >> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> >> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
> >> ---
> >>   target/riscv/cpu.c                      |  2 ++
> >>   target/riscv/cpu.h                      |  1 +
> >>   target/riscv/insn_trans/trans_rvm.c.inc | 18 ++++++++++++------
> >>   3 files changed, 15 insertions(+), 6 deletions(-)
> >>
> >> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> >> index e373c61ba2..01b57d3784 100644
> >> --- a/target/riscv/cpu.c
> >> +++ b/target/riscv/cpu.c
> >> @@ -903,6 +903,7 @@ static Property riscv_cpu_properties[] =3D {
> >>
> >>       /* These are experimental so mark with 'x-' */
> >>       DEFINE_PROP_BOOL("x-j", RISCVCPU, cfg.ext_j, false),
> >> +    DEFINE_PROP_BOOL("x-zmmul", RISCVCPU, cfg.ext_zmmul, false),
> > Is this really experimental?
> >
> > Alistair
>
> I think it's experimental currently. The zmmul version in latest riscv
> spec is v0.1, even though described as  v1.0 in spike README.

Hmm... Your right that it is only v0.1, but there is no indication of
draft state in the RISC-V spec chapter on Zmmul

>
> Its specification status
> (https://wiki.riscv.org/display/home/specification+status) is Freeze
> Complete and TSC Sign-Off Voting.
>
> And It's not in the ratified extension
> list(https://wiki.riscv.org/display/home/recently+ratified+extensions).
>
> Any status update I missed?

Confusing. Ok, I guess let's leave it as experimental, we can always
remove the `x-` easily :)

>
> Regards,
>
> Weiwei Li
>
> >>       /* ePMP 0.9.3 */
> >>       DEFINE_PROP_BOOL("x-epmp", RISCVCPU, cfg.epmp, false),
> >>       DEFINE_PROP_BOOL("x-aia", RISCVCPU, cfg.aia, false),
> >> @@ -1027,6 +1028,7 @@ static void riscv_isa_string_ext(RISCVCPU *cpu, =
char **isa_str, int max_str_len)
> >>        *    extensions by an underscore.
> >>        */
> >>       struct isa_ext_data isa_edata_arr[] =3D {
> >> +        ISA_EDATA_ENTRY(zmmul, ext_zmmul),

We should have some checks though. We don't want users to enable this
and the multiply (M) extension


Alistair

> >>           ISA_EDATA_ENTRY(zfh, ext_zfh),
> >>           ISA_EDATA_ENTRY(zfhmin, ext_zfhmin),
> >>           ISA_EDATA_ENTRY(zfinx, ext_zfinx),
> >> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> >> index f5ff7294c6..68177eae12 100644
> >> --- a/target/riscv/cpu.h
> >> +++ b/target/riscv/cpu.h
> >> @@ -405,6 +405,7 @@ struct RISCVCPUConfig {
> >>       bool ext_zhinxmin;
> >>       bool ext_zve32f;
> >>       bool ext_zve64f;
> >> +    bool ext_zmmul;
> >>
> >>       uint32_t mvendorid;
> >>       uint64_t marchid;
> >> diff --git a/target/riscv/insn_trans/trans_rvm.c.inc b/target/riscv/in=
sn_trans/trans_rvm.c.inc
> >> index 16b029edf0..ec7f705aab 100644
> >> --- a/target/riscv/insn_trans/trans_rvm.c.inc
> >> +++ b/target/riscv/insn_trans/trans_rvm.c.inc
> >> @@ -18,6 +18,12 @@
> >>    * this program.  If not, see <http://www.gnu.org/licenses/>.
> >>    */
> >>
> >> +#define REQUIRE_M_OR_ZMMUL(ctx) do {                      \
> >> +    if (!ctx->cfg_ptr->ext_zmmul && !has_ext(ctx, RVM)) { \
> >> +        return false;                                     \
> >> +    }                                                     \
> >> +} while (0)
> >> +
> >>   static void gen_mulhu_i128(TCGv r2, TCGv r3, TCGv al, TCGv ah, TCGv =
bl, TCGv bh)
> >>   {
> >>       TCGv tmpl =3D tcg_temp_new();
> >> @@ -65,7 +71,7 @@ static void gen_mul_i128(TCGv rl, TCGv rh,
> >>
> >>   static bool trans_mul(DisasContext *ctx, arg_mul *a)
> >>   {
> >> -    REQUIRE_EXT(ctx, RVM);
> >> +    REQUIRE_M_OR_ZMMUL(ctx);
> >>       return gen_arith(ctx, a, EXT_NONE, tcg_gen_mul_tl, gen_mul_i128)=
;
> >>   }
> >>
> >> @@ -109,7 +115,7 @@ static void gen_mulh_w(TCGv ret, TCGv s1, TCGv s2)
> >>
> >>   static bool trans_mulh(DisasContext *ctx, arg_mulh *a)
> >>   {
> >> -    REQUIRE_EXT(ctx, RVM);
> >> +    REQUIRE_M_OR_ZMMUL(ctx);
> >>       return gen_arith_per_ol(ctx, a, EXT_SIGN, gen_mulh, gen_mulh_w,
> >>                               gen_mulh_i128);
> >>   }
> >> @@ -161,7 +167,7 @@ static void gen_mulhsu_w(TCGv ret, TCGv arg1, TCGv=
 arg2)
> >>
> >>   static bool trans_mulhsu(DisasContext *ctx, arg_mulhsu *a)
> >>   {
> >> -    REQUIRE_EXT(ctx, RVM);
> >> +    REQUIRE_M_OR_ZMMUL(ctx);
> >>       return gen_arith_per_ol(ctx, a, EXT_NONE, gen_mulhsu, gen_mulhsu=
_w,
> >>                               gen_mulhsu_i128);
> >>   }
> >> @@ -176,7 +182,7 @@ static void gen_mulhu(TCGv ret, TCGv s1, TCGv s2)
> >>
> >>   static bool trans_mulhu(DisasContext *ctx, arg_mulhu *a)
> >>   {
> >> -    REQUIRE_EXT(ctx, RVM);
> >> +    REQUIRE_M_OR_ZMMUL(ctx);
> >>       /* gen_mulh_w works for either sign as input. */
> >>       return gen_arith_per_ol(ctx, a, EXT_ZERO, gen_mulhu, gen_mulh_w,
> >>                               gen_mulhu_i128);
> >> @@ -349,7 +355,7 @@ static bool trans_remu(DisasContext *ctx, arg_remu=
 *a)
> >>   static bool trans_mulw(DisasContext *ctx, arg_mulw *a)
> >>   {
> >>       REQUIRE_64_OR_128BIT(ctx);
> >> -    REQUIRE_EXT(ctx, RVM);
> >> +    REQUIRE_M_OR_ZMMUL(ctx);
> >>       ctx->ol =3D MXL_RV32;
> >>       return gen_arith(ctx, a, EXT_NONE, tcg_gen_mul_tl, NULL);
> >>   }
> >> @@ -389,7 +395,7 @@ static bool trans_remuw(DisasContext *ctx, arg_rem=
uw *a)
> >>   static bool trans_muld(DisasContext *ctx, arg_muld *a)
> >>   {
> >>       REQUIRE_128BIT(ctx);
> >> -    REQUIRE_EXT(ctx, RVM);
> >> +    REQUIRE_M_OR_ZMMUL(ctx);
> >>       ctx->ol =3D MXL_RV64;
> >>       return gen_arith(ctx, a, EXT_SIGN, tcg_gen_mul_tl, NULL);
> >>   }
> >> --
> >> 2.17.1
> >>
> >>
>

