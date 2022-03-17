Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nUhvi-00023M-W3
	for mharc-qemu-riscv@gnu.org; Thu, 17 Mar 2022 00:40:07 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nUhvh-00021t-MU; Thu, 17 Mar 2022 00:40:05 -0400
Received: from [2607:f8b0:4864:20::12a] (port=46931
 helo=mail-il1-x12a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nUhvf-0007G6-Vo; Thu, 17 Mar 2022 00:40:05 -0400
Received: by mail-il1-x12a.google.com with SMTP id l13so2965610iln.13;
 Wed, 16 Mar 2022 21:40:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ELgYjz6NhM4YqxfUOFsazz8sdchnf/vKQnrjAbMl9UM=;
 b=aTZCtoeNWfvpZ8R1ItzbE/2IHnjiC+eU3kNs+5kOlL79YFiCS3jO0iJFYOrKa8Oxn/
 SDZTdLYBlSzyTwG1/5dDt8sdvjJqO3EhVsJF5Lx8PyNxwYvzfOATJTDJX8PfxcicFXNK
 pKUKwkJ5m1tFi3mCxpZiAgcLSmIxafraezctXsAhKAPoXnKdI6Ydl8+fLPOMyKmNhpdS
 MmDDKg27Cl13EopYJBShtSX6fNjpwV5vLxCbLTnS5/Lty2P4F37jMKUuvROuwCN6w3kw
 H5C2XhzG6ee2ChdvQyMVTH0SEczUt0qvzSYz7XGsfFrwQwo8AvnUHcgA62dYbwv6oCcc
 5B2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ELgYjz6NhM4YqxfUOFsazz8sdchnf/vKQnrjAbMl9UM=;
 b=a0LYGqOGcZ2wMSzQYb7EJpy61BO5w1Lz9ReGg7wWL7cH2nWuYaOxkMAq+q+/vzbRAw
 xgYEn2RgBZyPiLCbHy96ZyYdVwMd23iu7SKGqW7WEm0YTxCxo7k8KblCN/7gOUSHdKV8
 4m9CXNj9wtXnk1HnkEC6f1cE6RuJUzNZgLjcfA6dx5tEaqQFHb73Xo7o12IqVutwsbdQ
 UnR6kx2UXiu1bSamBV3waNM/+pIM4YkAXomJbXuEJQ4xBzABYZkwfKbewScmJonIUshH
 8QHkbDdNU3GxT7pAr0LC3XZoffQ/IoRCsnBWoCzllbSw8TitZaC8SAimGL1wEfCZjVEe
 lXNw==
X-Gm-Message-State: AOAM530S3206Y74prBgBETdBMWJ5vHkRpQAHsQ3y4kuBSlmMbrULqkFD
 j6SWBGNMWzoDvHPNGvz6TywQBU6NmeXo8oG7+yA=
X-Google-Smtp-Source: ABdhPJzNI9wtXSVbd7P6M4XliFcyP4bPKWAVWq8Vm/xJJ/wU11aOPExqhTDe9NyVYIaIDcxEoqy+oByQXboqLoL9xso=
X-Received: by 2002:a92:6012:0:b0:2bd:fb5f:d627 with SMTP id
 u18-20020a926012000000b002bdfb5fd627mr1195791ilb.86.1647492001959; Wed, 16
 Mar 2022 21:40:01 -0700 (PDT)
MIME-Version: 1.0
References: <20220311094601.30440-1-liweiwei@iscas.ac.cn>
 <CAEUhbmX7wBzhvojSioQnB=T-DDuq9FX7UTPdvtR=oXHDm5Ra4A@mail.gmail.com>
 <769fe78f-e4c0-83c1-d5fc-65fbf40bb5ff@iscas.ac.cn>
 <CAKmqyKMpWFo5-=XSTBy_B9aTqDsw6-uxWfe3RwNnKUCKXQtjeQ@mail.gmail.com>
 <f5a1d76b-12a9-6d84-f73f-2dc523cfa4ee@iscas.ac.cn>
In-Reply-To: <f5a1d76b-12a9-6d84-f73f-2dc523cfa4ee@iscas.ac.cn>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 17 Mar 2022 14:39:35 +1000
Message-ID: <CAKmqyKOFJBKG7t0+6bxf+rzNDgMeOkjZoBok=6SUucOp5A0dvg@mail.gmail.com>
Subject: Re: [PATCH v2] target/riscv: write back unmodified value for
 csrrc/csrrs with rs1 is not x0 but holding zero
To: Weiwei Li <liweiwei@iscas.ac.cn>
Cc: Bin Meng <bmeng.cn@gmail.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 wangjunqiang <wangjunqiang@iscas.ac.cn>, Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>, 
 =?UTF-8?B?V2VpIFd1ICjlkLTkvJ8p?= <lazyparser@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::12a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::12a;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x12a.google.com
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
X-List-Received-Date: Thu, 17 Mar 2022 04:40:06 -0000

On Thu, Mar 17, 2022 at 12:10 PM Weiwei Li <liweiwei@iscas.ac.cn> wrote:
>
>
> =E5=9C=A8 2022/3/17 =E4=B8=8A=E5=8D=886:35, Alistair Francis =E5=86=99=E9=
=81=93:
> > On Thu, Mar 17, 2022 at 1:13 AM Weiwei Li <liweiwei@iscas.ac.cn> wrote:
> >>
> >>>>            riscv_raise_exception(env, ret, GETPC());
> >>>> @@ -90,7 +90,7 @@ void helper_csrw_i128(CPURISCVState *env, int csr,
> >>>>    {
> >>>>        RISCVException ret =3D riscv_csrrw_i128(env, csr, NULL,
> >>>>                                              int128_make128(srcl, sr=
ch),
> >>>> -                                          UINT128_MAX);
> >>>> +                                          UINT128_MAX, true);
> >>>>
> >>>>        if (ret !=3D RISCV_EXCP_NONE) {
> >>>>            riscv_raise_exception(env, ret, GETPC());
> >>>> @@ -104,7 +104,7 @@ target_ulong helper_csrrw_i128(CPURISCVState *en=
v, int csr,
> >>>>        Int128 rv =3D int128_zero();
> >>>>        RISCVException ret =3D riscv_csrrw_i128(env, csr, &rv,
> >>>>                                              int128_make128(srcl, sr=
ch),
> >>>> -                                          int128_make128(maskl, mas=
kh));
> >>>> +                                          int128_make128(maskl, mas=
kh), true);
> >>>>
> >>>>        if (ret !=3D RISCV_EXCP_NONE) {
> >>>>            riscv_raise_exception(env, ret, GETPC());
> >>> I am afraid the adding of "bool write_op" argument was done on many
> >>> functions, some of which do not look good to me, e.g.: predicate
> >>> funcs. v1 is much better.*>
> >> Yeah, I agree adding  argument to predicate is not a good idea. Howeve=
r
> >> it seems that the csr(like seed)
> >>
> >> itself cannot  distinguish whether it's to be written or not except
> >> these two ways(in v1 and v2).
> >>
> >> Or we can take seed CSR as a special case  in riscv_csrrw_check since =
no
> >> other csr will limit itself
> >>
> >> to be accessed only with read-write instruction currently.
> >>
> >>> Or maybe, is that possible we do something in trans_csrrs() instead?
> > That might be a better option. Unless there are other CSRs we expect
> > to do this I think trans_csrr*() is probably the place to have this,
> > similar to the `rd =3D=3D 0` case.
> >
> > It could also go in helper_csrr() which would just be a simple if check=
.
> >
> > Alistair
> >
> Sorry. I don't understand what can be done in trans_csrr*(). As I said
> in last email: trans_csr*
>
> have made all the read operation will go to the helper_csrr. However
> helper_csrr share the progress
>
> of riscv_csrrw*  with helper_csrrw/helper_csrw to implement its function.

Yep, so the problem you are trying to solve is the seed CSR access right?

"The seed CSR must be accessed with a read-write instruction. A
read-only instruction such as CSRRS/CSRRC with rs1=3Dx0 or CSRRSI/CSRRCI
with uimm=3D0 will raise an illegal instruction exception. The write
value (in rs1 or uimm) must be ignored by implementations. The purpose
of the write is to signal polling and flushing."

So trans_csr*() probably isn't the right place, but you could do the
check in helper_csr*()

helper_csrr() is only called from do_csrr(), which should only be
called on an invalid access for the seed CSR.

>
> The truely question is that helper_csrr will call riscv_csrrw*with
> write_mask =3D zero, new_value=3Dzero,
>
> which cannot distinguished from the call from helper_csrrw of which its
> write_mask all can be zero

Agreed. But helper_csrrw() isn't called if rs1=3Dx0 or uimm=3D0. So if
helper_csrrw() is called no matter the write mask then you should be
fine.

So a simple:
if (csr =3D=3D CSR_SEED) {
    riscv_raise_exception()
}

in helper_csrr() and helper_csrw() should be fine. Or am I missing somethin=
g?

Alistair

>
> (origin from trans_csrrs/trans_csrrc when rs1 is not x0 and the value of
> rs1 reg is zero).
>
> Regards,
>
> Weiwei Li
>
>
> >> The read and write operation in trans_csr*  have been truely
> >> distinguished in original code:
> >>
> >> all the read operation will go to  the helper_csrr,  write to
> >> helper_csrrw, read/write to helper_csrrw.
> >>
> >> However, they all go to the same progress  riscv_csrrw* in the helper
> >> with different arguments.
> >>
> >> Regards,
> >>
> >> Weiwei Li
> >>
> >>> Regards,
> >>> Bin
> >>
> >>
> >>
> >>
>

