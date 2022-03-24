Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nXIop-0006ON-8a
	for mharc-qemu-riscv@gnu.org; Thu, 24 Mar 2022 04:27:44 -0400
Received: from eggs.gnu.org ([209.51.188.92]:53662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1nXIok-0006Ly-MS
 for qemu-riscv@nongnu.org; Thu, 24 Mar 2022 04:27:40 -0400
Received: from [2a00:1450:4864:20::22d] (port=34456
 helo=mail-lj1-x22d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1nXIoi-0005hg-Ty
 for qemu-riscv@nongnu.org; Thu, 24 Mar 2022 04:27:38 -0400
Received: by mail-lj1-x22d.google.com with SMTP id 17so5142154lji.1
 for <qemu-riscv@nongnu.org>; Thu, 24 Mar 2022 01:27:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=OARvDCW2c6AaFORAEuaRRit5JsuU0D4SdeA//MCto2M=;
 b=l5TErsgsi1N5YeK0C8hzuamwK2R3d9RXYf888Jpbx9qDSUVr8KYVpQ/ZLGQzm+KFYK
 OaikFmrLTsV14NMsN+eQKDP2jxY6YOkm8BmSgPXjZPQ3P+uYjPD+rVi/G8LlvgQK1FA1
 tQXHGvZZWH1FSqRJxaKcZ2+bKTVA6BuM1PXqk5eKHnI99WZNBtY+EW5e+BPE+NluJgVA
 ROLMS5vuYqoJDyy9q5uc0iA2u/RgnH7TKe56cV8J02jPj9+pirni3f7AmVCc4+bzWGKR
 afZ2Ohv7AqfsTGnPitUKoF2hP85WJcvk2v3Yds2daLl7GemEe1Y5vx1pIbv6cyKLPiot
 tjyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=OARvDCW2c6AaFORAEuaRRit5JsuU0D4SdeA//MCto2M=;
 b=TA4fj9ih2sbUQOK/dPTuPcxhKU4On3AIXqG3JeNMaRa7Ba37Pi+aMyoU/ibg0QQa3F
 REaKmNJt6rGTpVZx0YI2ZgH77R+P0Dizv5cMq/ztqeLhj9UrjZLJFnsbp3062BVCfeds
 SAuRRGJNV8zVhyapvieCa3Z9vaMA4LEHLxrM1ZcNqENRMMJdNmwtBekipsHZKaDFqAMP
 e0UWGahIb/Co5aTP0Ud39CpWN72kQScekIZVKQ8rDPl7AyQByrZvtXW5B0gAd/kGyPXO
 QgCAGZxDnoEfU6Gusjgak5sy2bwjjYw9kDCCP+bFUMHQsgobruIiRqzDo4EK80K4J4zO
 3Wiw==
X-Gm-Message-State: AOAM532OqUpIZlRadpgsS/enHVwso97bVEtGK6ueN6XgJvYYftsD8LUA
 eW2mdKodQZed44f0aaJ7r5v6fzFdOt94zYENu5WV8A==
X-Google-Smtp-Source: ABdhPJxpRbq0/aYjuEFpUwLPaZHjuFVBc4M6670y0d9QTDfnSyOQB3+KXDNBQqIu13Z/wqkiP36a1MK8fcZ2/KeTkQQ=
X-Received: by 2002:a2e:8244:0:b0:249:4180:7b15 with SMTP id
 j4-20020a2e8244000000b0024941807b15mr3351452ljh.123.1648110453614; Thu, 24
 Mar 2022 01:27:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220323111309.9109-1-mchitale@ventanamicro.com>
 <20220323111309.9109-3-mchitale@ventanamicro.com>
 <472dfd4e-099f-97e0-ba16-561df8ddeef1@iscas.ac.cn>
In-Reply-To: <472dfd4e-099f-97e0-ba16-561df8ddeef1@iscas.ac.cn>
From: Mayuresh Chitale <mchitale@ventanamicro.com>
Date: Thu, 24 Mar 2022 13:56:57 +0530
Message-ID: <CAN37VV7wwwTWH+OiuR0n-Sp17R0MMjQAAEpyEz5fW6t=3EFBaA@mail.gmail.com>
Subject: Re: [RFC PATCH v2 2/4] target/riscv: smstateen check for h/senvcfg
To: Weiwei Li <liweiwei@iscas.ac.cn>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, 
 Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::22d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::22d;
 envelope-from=mchitale@ventanamicro.com; helo=mail-lj1-x22d.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-List-Received-Date: Thu, 24 Mar 2022 08:27:40 -0000

On Wed, Mar 23, 2022 at 6:22 PM Weiwei Li <liweiwei@iscas.ac.cn> wrote:
>
>
> =E5=9C=A8 2022/3/23 =E4=B8=8B=E5=8D=887:13, Mayuresh Chitale =E5=86=99=E9=
=81=93:
> > Accesses to henvcfg, henvcfgh and senvcfg are allowed
> > only if corresponding bit in mstateen0/hstateen0 is
> > enabled. Otherwise an illegal instruction trap is
> > generated.
> >
> > Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
> > ---
> >   target/riscv/csr.c | 82 ++++++++++++++++++++++++++++++++++++++++++---=
-
> >   1 file changed, 76 insertions(+), 6 deletions(-)
> >
> > diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> > index 215c8ecef1..2388f0226f 100644
> > --- a/target/riscv/csr.c
> > +++ b/target/riscv/csr.c
> > @@ -39,6 +39,35 @@ void riscv_set_csr_ops(int csrno, riscv_csr_operatio=
ns *ops)
> >   }
> >
> >   /* Predicates */
> > +static RISCVException smstateen_acc_ok(CPURISCVState *env, int mode, i=
nt bit)
> > +{
> > +    CPUState *cs =3D env_cpu(env);
> > +    RISCVCPU *cpu =3D RISCV_CPU(cs);
> > +    bool virt =3D riscv_cpu_virt_enabled(env);
> > +
> > +    if (!cpu->cfg.ext_smstateen) {
> > +        return RISCV_EXCP_NONE;
> > +    }
> > +
> > +    if (!(env->mstateen[0] & 1UL << bit)) {
> > +        return RISCV_EXCP_ILLEGAL_INST;
> > +    }
>
> I think here should be " & (1UL << bit) " . The same for following
> similar cases.

Ok. Will fix it in the next version.
>
> Regards,
>
> Weiwei Li
>

