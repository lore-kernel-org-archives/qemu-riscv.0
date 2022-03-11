Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nSa6o-0003w8-Sl
	for mharc-qemu-riscv@gnu.org; Fri, 11 Mar 2022 02:54:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nSa6m-0003tp-Uk; Fri, 11 Mar 2022 02:54:44 -0500
Received: from [2607:f8b0:4864:20::12b] (port=38734
 helo=mail-il1-x12b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nSa6l-00032A-46; Fri, 11 Mar 2022 02:54:44 -0500
Received: by mail-il1-x12b.google.com with SMTP id o12so5448538ilg.5;
 Thu, 10 Mar 2022 23:54:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=VwuaIkBHIMgKmbJ6LFdydavFy3vQvqH0z2SeUiDIHio=;
 b=UEsGOJwhdcWlnkaMVg+qWFG6PikOQRRIfKYiv7tZwFfbfA6Qm5f31nZkiaUg6eGGMc
 L+WnLmIww+m0Qd2/JeitR3HTV08rmLWUuNcKXhPD5bro6N2IBySYMifbh3sNc1Iso7YR
 Mid18QdBK5cPhz2td0LRwU2lviU0fzHglyt3wdLC/W7N/LjLD4D7/2gq0BQkQPQWoieJ
 DTL/Qh6nqdcmII28Rpsnmh+Mgyb19Cxb6DugCb+d3U4Mdu4V9rQZ2F5ghGIWOBV4C1oR
 hRgfIvnhlGbc5YwBL1dJw+sK71G2ITu1wgVddd0mMa9t+nmHkfr/ihReUA4rLHRh6C4e
 vwSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=VwuaIkBHIMgKmbJ6LFdydavFy3vQvqH0z2SeUiDIHio=;
 b=r+ormYgZj5x6kbqwQNnGPNVHycfGYqBOHgG7OFLDJyYOixme2KL/x/gvXbCFR103aM
 fTHj/4+OGKYBAxwUgtm0WXm4Lf4IwDvp3p1owmvZ3MSRe6SRBrgxdieZbP1Pye/xUJO3
 cMNwD4zk120ah0MYh5TKfYpLJ8O5aniqyPT1zpbUAanz8NiGZze2PWkrJqo1JZXsNfsV
 FdCliAS+R37DkF+qMcWYSAc3YiFn236vdBdeAFptdFXDx/QK49zSgBpHL2CGeecOXYXu
 oNbcGseF0WznZO+pmlu74bH3KauT/4iCnvvml5OTQDaztVZCiNjV0VIvt56rNKWUlakh
 HwBQ==
X-Gm-Message-State: AOAM532Hrt6XDY18zeZ4OWGescwI73NZiCU2u5UXEJ3rf8c6spWWJkRE
 Am0gGOrzu5Pygt0MF2Wuv8imWERphWO/OrFR7mg=
X-Google-Smtp-Source: ABdhPJzj1/Hin3PNWVLF/ua2IpR9aaCn0gus6Fuur6YWKDwJg7IW4DS2gEvGXkOnwI9Tw6h9anwnNKWRhvEf+Wgfga4=
X-Received: by 2002:a05:6e02:13c3:b0:2c6:229a:73b8 with SMTP id
 v3-20020a056e0213c300b002c6229a73b8mr6972947ilj.260.1646985281485; Thu, 10
 Mar 2022 23:54:41 -0800 (PST)
MIME-Version: 1.0
References: <20220302122946.29635-1-liweiwei@iscas.ac.cn>
 <CAKmqyKOgJA49Mc4H=WFN+soxaFKtJc+d+nviKiro7eCdMg7hcA@mail.gmail.com>
 <bde533f4-e55d-1058-9cad-6b0aca2fd70d@iscas.ac.cn>
In-Reply-To: <bde533f4-e55d-1058-9cad-6b0aca2fd70d@iscas.ac.cn>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 11 Mar 2022 17:54:15 +1000
Message-ID: <CAKmqyKOPDi12pQh5EUCEFHO0kudiFUqyESXELvGR00-CkX_nAQ@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: write back unmodified value for csrrc/csrrs
 with rs1 is not x0 but holding zero
To: Weiwei Li <liweiwei@iscas.ac.cn>
Cc: Richard Henderson <richard.henderson@linaro.org>, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 wangjunqiang <wangjunqiang@iscas.ac.cn>, 
 =?UTF-8?B?V2VpIFd1ICjlkLTkvJ8p?= <lazyparser@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::12b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::12b;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x12b.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.659,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-List-Received-Date: Fri, 11 Mar 2022 07:54:45 -0000

On Fri, Mar 11, 2022 at 2:58 PM Weiwei Li <liweiwei@iscas.ac.cn> wrote:
>
>
> =E5=9C=A8 2022/3/11 =E4=B8=8A=E5=8D=8810:58, Alistair Francis =E5=86=99=
=E9=81=93:
> > On Wed, Mar 2, 2022 at 11:50 PM Weiwei Li <liweiwei@iscas.ac.cn> wrote:
> >>       For csrrs and csrrc, if rs1 specifies a register other than x0, =
holding
> >>       a zero value, the instruction will still attempt to write the un=
modified
> >>       value back to the csr and will cause side effects
> >>
> >> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> >> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
> >> ---
> >>   target/riscv/csr.c       | 46 ++++++++++++++++++++++++++++----------=
--
> >>   target/riscv/op_helper.c |  7 +++++-
> >>   2 files changed, 39 insertions(+), 14 deletions(-)
> >>
> >> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> >> index aea82dff4a..f4774ca07b 100644
> >> --- a/target/riscv/csr.c
> >> +++ b/target/riscv/csr.c
> >> @@ -2872,7 +2872,7 @@ static RISCVException write_upmbase(CPURISCVStat=
e *env, int csrno,
> >>
> >>   static inline RISCVException riscv_csrrw_check(CPURISCVState *env,
> >>                                                  int csrno,
> >> -                                               bool write_mask,
> >> +                                               bool write_csr,
> >>                                                  RISCVCPU *cpu)
> >>   {
> >>       /* check privileges and return RISCV_EXCP_ILLEGAL_INST if check =
fails */
> >> @@ -2895,7 +2895,7 @@ static inline RISCVException riscv_csrrw_check(C=
PURISCVState *env,
> >>           return RISCV_EXCP_ILLEGAL_INST;
> >>       }
> >>   #endif
> >> -    if (write_mask && read_only) {
> >> +    if (write_csr && read_only) {
> >>           return RISCV_EXCP_ILLEGAL_INST;
> >>       }
> >>
> >> @@ -2915,7 +2915,8 @@ static inline RISCVException riscv_csrrw_check(C=
PURISCVState *env,
> >>   static RISCVException riscv_csrrw_do64(CPURISCVState *env, int csrno=
,
> >>                                          target_ulong *ret_value,
> >>                                          target_ulong new_value,
> >> -                                       target_ulong write_mask)
> >> +                                       target_ulong write_mask,
> >> +                                       bool write_csr)
> >>   {
> >>       RISCVException ret;
> >>       target_ulong old_value;
> >> @@ -2935,8 +2936,8 @@ static RISCVException riscv_csrrw_do64(CPURISCVS=
tate *env, int csrno,
> >>           return ret;
> >>       }
> >>
> >> -    /* write value if writable and write mask set, otherwise drop wri=
tes */
> >> -    if (write_mask) {
> >> +    /* write value if needed, otherwise drop writes */
> >> +    if (write_csr) {
> >>           new_value =3D (old_value & ~write_mask) | (new_value & write=
_mask);
> >>           if (csr_ops[csrno].write) {
> >>               ret =3D csr_ops[csrno].write(env, csrno, new_value);
> >> @@ -2960,18 +2961,27 @@ RISCVException riscv_csrrw(CPURISCVState *env,=
 int csrno,
> >>   {
> >>       RISCVCPU *cpu =3D env_archcpu(env);
> >>
> >> -    RISCVException ret =3D riscv_csrrw_check(env, csrno, write_mask, =
cpu);
> >> +    /*
> >> +     * write value when write_mask is set or rs1 is not x0 but holdin=
g zero
> >> +     * value for csrrc(new_value is zero) and csrrs(new_value is all-=
ones)
> > I don't understand this. Won't write_mask also be zero and when reading=
?
> >
> > Alistair
> >
> Yeah. It's true. To distinguish only-read operation with the special
> write case(write_mask =3D 0), I also modified the new_value of riscv_csrr=
w
> from 0 to 1 in helper_csrr :
>
>   target_ulong helper_csrr(CPURISCVState *env, int csr)
>   {
>       target_ulong val =3D 0;
> -    RISCVException ret =3D riscv_csrrw(env, csr, &val, 0, 0);
> +
> +    /*
> +     * new_value here should be none-zero or none-all-ones here to
> +     * distinguish with csrrc/csrrs with rs1 is not x0 but holding zero =
value
> +     */
> +    RISCVException ret =3D riscv_csrrw(env, csr, &val, 1, 0);

This is confusing though and I worry a future change will break this.
I think we should be explicit instead of using special combinations of
masks. What if a write operation occurred that wanted to write 1 with
a mark of 0?

The two options seem to either add a check for the seed CSR in
helper_csrr() to fault if the address matches. That's not the best as
then we have specific code, but this requirement seems pretty specific
as well so it's probably ok.

The other option would be to modify riscv_csrrw() to explicitly pass
in a `bool write_op` that you check against.

Alistair

>
>       if (ret !=3D RISCV_EXCP_NONE) {
>           riscv_raise_exception(env, ret, GETPC());
>
>
> After modification, the cases for all csr related instructions is as foll=
ows:
>
> index     instruction                   helper write_mask
> new_value        Read/Write     write_csr
>
> 1              csrrw                         csrrw/csrw all-ones
>          src1 (R)W                 true
>
> 2             csrrs(rs1=3D0) csrr                      zero
> 1                           R                      false
>
> 3              csrrs(rs1!=3D0)               csrrw                   src1
>                   all-ones RW                   true
>
> 4              csrrs(rs1=3D0) csrr                     zero
> 1                           R                     false
>
> 5              csrrc(rs1!=3D0)               csrrw                   src1
>                        zero                     RW                  true
>
> 6              csrrc(rs1=3D0) csrr                      zero
> 1                           R                    false
>
> 7              csrrwi                     csrrw/csrw
> all-ones                rs1 (R)W                  true
>
> 8              csrrsi(rs1=3D0) csrr                      zero
> 1                           R                    false
>
> 9              csrrsi(rs1!=3D0)               csrrw                    rs=
1
>                   all-ones RW                   true
>
> 10           csrrci(rs1=3D0) csrr                      zero
> 1                           R                    false
>
> 11           csrrci(rs1!=3D0)               csrrw                    rs1
>                          zero                   RW                    tru=
e
>
>
> Only row 3 and 5 can be Write-operation with write_mask =3D 0 when src1 =
=3D
> 0.  And it's the special case will be identified by :
>
> ((write_mask =3D=3D 0) && ((new_value =3D=3D 0) || (new_value =3D=3D (tar=
get_ulong)-1)));
>
> for other only-read instructions, the write_mask is zero, but the new_val=
ue is changed to 1 (none-zero and none-all-ones), so they will make write_c=
sr to be false.
>
> Regards,
> Weiwei Li
>
> >> +     */
> >> +    bool write_csr =3D write_mask || ((write_mask =3D=3D 0) &&
> >> +                                    ((new_value =3D=3D 0) ||
> >> +                                     (new_value =3D=3D (target_ulong)=
-1)));
> >> +
> >>
> >> --
> >> 2.17.1
> >>
> >>
>

