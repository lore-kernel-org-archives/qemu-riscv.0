Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pkFIx-0004HY-7f
	for mharc-qemu-riscv@gnu.org; Wed, 05 Apr 2023 22:24:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pkFIw-0004HL-0Z; Wed, 05 Apr 2023 22:24:50 -0400
Received: from mail-ua1-x931.google.com ([2607:f8b0:4864:20::931])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pkFIu-00075o-0N; Wed, 05 Apr 2023 22:24:49 -0400
Received: by mail-ua1-x931.google.com with SMTP id n1so443043uae.9;
 Wed, 05 Apr 2023 19:24:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680747886;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=94x6Rdgafue90U09/EODbxKVizsF8muWJ3EcHC3OZEU=;
 b=DybMU/dCquzm3U9ir8WiTyvTsCN1FqzQAXgLrG0sZ26bz34Ba/S5eSnY+RaJDE8orS
 aonYKCjUCn9F7/WAnozNH3u8abZEfbcfSqsGrq9UTQHFgkRudpm7mBfb7o/ek+2Jc9lK
 4tK8PZtyq+f588Gyo9xGipFzWakurFjvxZoUNbZpF/SXpjTEbcibXbfyR21f4Dq0XjOm
 4U3Sh6MKwDthOrh1M0yU47TxTeuEhpTzLPaK7wV6NYmYMLhXnKPRbPEmFD3Ek8UGS8NS
 f1DLfDl/V0QNpGRG7zm6qDeaG0Qdz6xKMsVvKz+7C3hXPsL4S4JbcGvHQYKpN9xo21ha
 icMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680747886;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=94x6Rdgafue90U09/EODbxKVizsF8muWJ3EcHC3OZEU=;
 b=rzLqmXCVRb+msIQtvVkbcqSbvqgw7e9fDDNLhYBx500yH/WDGYDHUnChIQWVJ+py7N
 w/rYe1p+bCfrwfYIuBp4482KBvodZmD1QJWLWeh04YDCQLbR/5sc1cVlV/Srl92Nyhc/
 yI3wNZKZs+NLyTGODnf+MfXWcmBJcTKumHOg0UANYf7l12XTHWhAkshObQpANiQOkss8
 kAX+wKRuS62fFHmVh7v0oNjALgosHfHmo8ilVKTg35MlwVUhkf/J7RWCuFh/uOBQIq8L
 l17kfHP3m4LrWhp/oxDJEcrS8evUZ7HigVhoVAFmTHiP1NESy1/PqiVhQsKFWVKzRRmp
 C5BQ==
X-Gm-Message-State: AAQBX9d8oEXtcGH8yiEBd6QMIFJE6w7IWo01wJX9TD/kAAvwFUZ31Zpz
 vbMdit4vCpHFwSyQOJ1zqIClZUnniHF10IVW9GE=
X-Google-Smtp-Source: AKy350YkzMmxEWWdGZL2V+wqAE1svrk1OMFrYAGGLOWyz/ZotucckQjM0oKuTzdS/f1XhtJtVPxchU0bz8+fY1TAs04=
X-Received: by 2002:ab0:7ce:0:b0:68d:6360:77b with SMTP id
 d14-20020ab007ce000000b0068d6360077bmr5575109uaf.1.1680747886503; 
 Wed, 05 Apr 2023 19:24:46 -0700 (PDT)
MIME-Version: 1.0
References: <20230330135818.68417-1-liweiwei@iscas.ac.cn>
 <20230330135818.68417-2-liweiwei@iscas.ac.cn>
 <CAKmqyKMzPwFpScWg2H+JMZpvH6oJAP0A5vgaKAEiXR57db0r4w@mail.gmail.com>
 <2b52f993-158e-a7ee-9180-b84f85f432c6@iscas.ac.cn>
 <CAKmqyKOOHs-Wq2s6fNJLyEUAQ1B3=PoyU5EFZ7e_=BDL-vLwAg@mail.gmail.com>
 <0b8f3928-1901-b338-43a6-b436fb9013ed@iscas.ac.cn>
In-Reply-To: <0b8f3928-1901-b338-43a6-b436fb9013ed@iscas.ac.cn>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 6 Apr 2023 12:24:19 +1000
Message-ID: <CAKmqyKM=R2c+ayUQnyMTJA8SweGAnLc=5ZxrcZpKn3JtUqgHYg@mail.gmail.com>
Subject: Re: [PATCH 1/2] target/riscv: Fix the mstatus.MPP value after
 executing MRET
To: liweiwei <liweiwei@iscas.ac.cn>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, palmer@dabbelt.com, 
 alistair.francis@wdc.com, bin.meng@windriver.com, dbarboza@ventanamicro.com, 
 zhiwei_liu@linux.alibaba.com, wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::931;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x931.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 06 Apr 2023 02:24:50 -0000

On Thu, Apr 6, 2023 at 12:14=E2=80=AFPM liweiwei <liweiwei@iscas.ac.cn> wro=
te:
>
>
> On 2023/4/6 09:46, Alistair Francis wrote:
> > On Thu, Apr 6, 2023 at 10:56=E2=80=AFAM liweiwei <liweiwei@iscas.ac.cn>=
 wrote:
> >>
> >> On 2023/4/6 08:43, Alistair Francis wrote:
> >>
> >> On Thu, Mar 30, 2023 at 11:59=E2=80=AFPM Weiwei Li <liweiwei@iscas.ac.=
cn> wrote:
> >>
> >> The MPP will be set to the least-privileged supported mode (U if
> >> U-mode is implemented, else M).
> >>
> >> I don't think this is right, the spec in section 8.6.4 says this:
> >>
> >> Sorry, I didn't find this section in latest release of both privilege =
and un-privilege spec
> > I updated my spec, using commit
> > f6b8d5c7d2dcd935b48689a337c8f5bc2be4b5e5 it's now section 9.6.4 Trap
> > Return
>
> Yeah. I see it. However, this is a little different from the description
> in section 3.1.6.1.

They seem to be in conflict. It's probably worth opening an issue
against the spec to get some clarification here.

>
> And MPP is WARL field.  PRV_U will be an illegal value for MPP if U-mode
> is not implemented.

Yeah, I think you are right. It just directly goes against the mret
section. I suspect the mret section is wrong and needs to be updated

>
> So I think description in section 3.1.6.1 seems more reasonable.
>
> >
> >> (draft-20230131-c0b298a: Clarify WFI trapping behavior (#972)).
> > Also, you replied with a HTML email which loses the conversation
> > history (just see above). Can you fixup your client to reply with
> > plain text please
>
> Sorry. I don't get your problem. I replied by Thunderbird. Above is the

Have a look at your previous email, it's a HTML email. If I view the
source of the email I see this:

    Content-Type: text/html; charset=3DUTF-8

and the formatting is a little off.

This email that I'm replying to is a plain text email. I'm not sure
what happened, but try to check that your responses are plain text. I
think there is a setting in Thunderbird to just open and reply to all
emails as plain text, which is probably worth turning on

Alistair

> title for the latest release version of the spec in riscv-isa-manual
> github
> (https://github.com/riscv/riscv-isa-manual/releases/tag/draft-20230131-c0=
b298a).
>
> Regards,
>
> Weiwei Li
>
> >
> > Alistair
> >
> >> "MRET then in mstatus/mstatush sets MPV=3D0, MPP=3D0,
> >> MIE=3DMPIE, and MPIE=3D1"
> >>
> >> In section 3.1.6.1, the privilege spec says this:
> >>
> >> "An MRET or SRET instruction is used to return from a trap in M-mode o=
r S-mode respectively.
> >> When executing an xRET instruction, supposing xPP holds the value y, x=
IE is set to xPIE; the
> >> privilege mode is changed to y; xPIE is set to 1; and xPP is set to th=
e least-privileged supported
> >> mode (U if U-mode is implemented, else M). If y=CC=B8=3DM, xRET also s=
ets MPRV=3D0"
> >>
> >> And I think PRV_U is an illegal value for MPP if U-mode is not impleme=
nted.
> >>
> >> Regards,
> >>
> >> Weiwei Li
> >>
> >> So it should just always be 0 (PRV_U is 0)
> >>
> >> Alistair
> >>
> >> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> >> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
> >> ---
> >>   target/riscv/op_helper.c | 3 ++-
> >>   1 file changed, 2 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
> >> index 84ee018f7d..991f06d98d 100644
> >> --- a/target/riscv/op_helper.c
> >> +++ b/target/riscv/op_helper.c
> >> @@ -339,7 +339,8 @@ target_ulong helper_mret(CPURISCVState *env)
> >>       mstatus =3D set_field(mstatus, MSTATUS_MIE,
> >>                           get_field(mstatus, MSTATUS_MPIE));
> >>       mstatus =3D set_field(mstatus, MSTATUS_MPIE, 1);
> >> -    mstatus =3D set_field(mstatus, MSTATUS_MPP, PRV_U);
> >> +    mstatus =3D set_field(mstatus, MSTATUS_MPP,
> >> +                        riscv_has_ext(env, RVU) ? PRV_U : PRV_M);
> >>       mstatus =3D set_field(mstatus, MSTATUS_MPV, 0);
> >>       if ((env->priv_ver >=3D PRIV_VERSION_1_12_0) && (prev_priv !=3D =
PRV_M)) {
> >>           mstatus =3D set_field(mstatus, MSTATUS_MPRV, 0);
> >> --
> >> 2.25.1
> >>
> >>
>

