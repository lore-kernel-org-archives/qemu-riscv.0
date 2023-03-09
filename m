Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pa6aw-0005B3-M0
	for mharc-qemu-riscv@gnu.org; Wed, 08 Mar 2023 22:05:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1pa6aq-000551-JF
 for qemu-riscv@nongnu.org; Wed, 08 Mar 2023 22:05:25 -0500
Received: from mail-oi1-x22a.google.com ([2607:f8b0:4864:20::22a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1pa6ao-0006az-Kv
 for qemu-riscv@nongnu.org; Wed, 08 Mar 2023 22:05:24 -0500
Received: by mail-oi1-x22a.google.com with SMTP id c11so672306oiw.2
 for <qemu-riscv@nongnu.org>; Wed, 08 Mar 2023 19:05:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1678331121;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iwufO+Gqkkax9w1/aMb9Hym6Jn4yYY879YeHGUqMxfE=;
 b=E48oRBm0Sz11MM8+aMH02ElOFsGumzgKfDEJMlQYwDhCabUSRke3jpnY6Tstsy9rFK
 enAvBaWO3Rq54hQXkzMPuIW6A4wpItd0xgnaGoeKpibO8nGDmWZHBLu6W8aA5gMKjnpB
 9IIG1zj4PSwInNELY7rpyftwMfqb+5ar1V12DuBzEyldAsT1o3K4kWq8oDhZhWnGdTaZ
 FEQ2h5uH2ejCNXXZVL+jBXd2mmulnGW/vMRUbjsTBInUC5sjRl51smpzDosEp+bB4loA
 6MhzbDKhdkqLSCrmpK8aIqX3BCBS0ns6Woq6XnJZGA400UQi0cDunsAImP1wDmCRc/bm
 QA4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678331121;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iwufO+Gqkkax9w1/aMb9Hym6Jn4yYY879YeHGUqMxfE=;
 b=wRfwqTKxeosGQLfd8akSj8T2Vdb9bk9ohkw1NsAONvUHTm8ZY/1O4gFmJH6my2Y1ok
 IPx224ufp4ds93BP7Z6vxrLq4WBPVwZzhfX4Ggy3RYkT5WkpK3h5Wkt5SDlHC5FrieB2
 F8Psi5wVN3RGfaekgiYDfvb6AlOTAqsCFRxOvM7EvcnGy2up1+lvYGUJ2hcEzMdZnIcR
 DzlFQ+kpmnjTOhmRjZIuNH1FgL3ZMxa3KCZuYCc8M8vZKb+OPA4FWFtur/eNEHY9gslf
 qIEO99ul/ByXPacod5VwQyxdiEKDUJTz6Rzd+hinw4Bxx1p9bjWDWKlmCbgB3wcDQHA7
 yQaA==
X-Gm-Message-State: AO0yUKWP6xTlp1jPKnf94MgBU65Fu6xmebctsgYjHQ1MtC75UkApfDmM
 ngNq1PYersGjnL6FQB7RlEQlhQMIRW3VbprxF6W4Xw==
X-Google-Smtp-Source: AK7set/xSEa+DZpzeaTbJ9R8UMnIMUppK5gnijObLZYhrKVSUGV6IrRufgME1qGERcavtzIbJcsizpED1vLfy0DA3dY=
X-Received: by 2002:a05:6808:2098:b0:383:f981:b1e5 with SMTP id
 s24-20020a056808209800b00383f981b1e5mr11305178oiw.5.1678331121300; Wed, 08
 Mar 2023 19:05:21 -0800 (PST)
MIME-Version: 1.0
References: <20230305094231.1616-1-jim.shu@sifive.com>
 <20230305094231.1616-2-jim.shu@sifive.com>
 <0b2407ee-a7dd-d651-763a-a73b3802dc8f@linux.alibaba.com>
In-Reply-To: <0b2407ee-a7dd-d651-763a-a73b3802dc8f@linux.alibaba.com>
From: Jim Shu <jim.shu@sifive.com>
Date: Thu, 9 Mar 2023 11:05:10 +0800
Message-ID: <CALw707rM3w+yDWhizA122eH5L_OVjhnE2t2BVQy5edr23V6S-Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] target/riscv: Make the "virt" register writable by GDB
To: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::22a;
 envelope-from=jim.shu@sifive.com; helo=mail-oi1-x22a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-List-Received-Date: Thu, 09 Mar 2023 03:05:25 -0000

On Mon, Mar 6, 2023 at 7:26=E2=80=AFPM LIU Zhiwei <zhiwei_liu@linux.alibaba=
.com> wrote:
>
>
> On 2023/3/5 17:42, Jim Shu wrote:
> > This patch also enables debugger to set current privilege mode to
> > VU/VS-mode.
> >
> > Extend previous commit 81d2929c41d32af138f3562f5a7b309f6eac7ca7 to
> > support H-extension.
> >
> > Signed-off-by: Jim Shu <jim.shu@sifive.com>
> > Reviewed-by: Frank Chang <frank.chang@sifive.com>
> > ---
> >   target/riscv/gdbstub.c | 18 ++++++++++++++++--
> >   1 file changed, 16 insertions(+), 2 deletions(-)
> >
> > diff --git a/target/riscv/gdbstub.c b/target/riscv/gdbstub.c
> > index 1755fd9d51..a7f234beaf 100644
> > --- a/target/riscv/gdbstub.c
> > +++ b/target/riscv/gdbstub.c
> > @@ -203,15 +203,29 @@ static int riscv_gdb_get_virtual(CPURISCVState *c=
s, GByteArray *buf, int n)
> >
> >   static int riscv_gdb_set_virtual(CPURISCVState *cs, uint8_t *mem_buf,=
 int n)
> >   {
> > +#ifdef CONFIG_USER_ONLY
> > +    if (n >=3D 0 && n <=3D 1) {
> > +        return sizeof(target_ulong);
> > +    }
> > +#else
> > +    bool virt;
> > +
> >       if (n =3D=3D 0) {
> > -#ifndef CONFIG_USER_ONLY
> >           cs->priv =3D ldtul_p(mem_buf) & 0x3;
> >           if (cs->priv =3D=3D PRV_H) {
> >               cs->priv =3D PRV_S;
> >           }
> > -#endif
> > +        return sizeof(target_ulong);
> We should return according to the misa_mxl_max. And this is a bug before
> your commit.

Hi Zhiwei,

After reading other gdbstub.c code, I think it is OK to use
'sizeof(target_ulong)' as virtual register length.
Its length is 32-bit in RV32 and is 64-bit in RV64/RV128. We don't
need to handle RV128 specially.
Virtual register length is same as CSR length and
'riscv_gdb_set_csr()' also use 'sizeof(target_ulong)'.

Jim Shu

> > +    } else if (n =3D=3D 1) {
> > +        virt =3D ldtul_p(mem_buf) & 0x1;
> > +        if ((cs->priv =3D=3D PRV_M) && (virt =3D=3D true)) {
> > +            /* M-mode only supports V=3D0. */
> > +            virt =3D false;
> > +        }
> > +        riscv_cpu_set_virt_enabled(cs, virt);
> >           return sizeof(target_ulong);
> Same error here. Otherwise,
>
> Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
>
> Zhiwei
>
> >       }
> > +#endif
> >       return 0;
> >   }
> >

