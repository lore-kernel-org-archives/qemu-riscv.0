Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pZrl7-0004BL-35
	for mharc-qemu-riscv@gnu.org; Wed, 08 Mar 2023 06:15:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1pZrl4-0004Ai-9r
 for qemu-riscv@nongnu.org; Wed, 08 Mar 2023 06:14:58 -0500
Received: from mail-oa1-x2f.google.com ([2001:4860:4864:20::2f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1pZrl2-0005Pk-JZ
 for qemu-riscv@nongnu.org; Wed, 08 Mar 2023 06:14:57 -0500
Received: by mail-oa1-x2f.google.com with SMTP id
 586e51a60fabf-17711f56136so3412803fac.12
 for <qemu-riscv@nongnu.org>; Wed, 08 Mar 2023 03:14:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1678274095;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fbPGXRoFZx0QK8lm9D/pZpaZ0oDNBqf+IjxqEmzbdck=;
 b=gneKH3ge1a8O+5gdY9fdd+Krc0P+biuBEjw3Ug4sS1Ge82ZbrgBXXLuoODip3OJxCY
 Kp88OHHhmGRHaw48ekO7gqV8TVGFRjdJprZPAfvOIETC6ovkAytxRVbFtFntXlNd4cHf
 CfhtK3Ho/cqzPas9gEaER8iDjiUo7OG2t2SewnkyWjWDoBUAt3jsRwaAn/ia0D5xSg7c
 RoHdJgtduf7yj1XMZQD12aTu+LACezDggnTMSzTDIscyDsJ6F5DpFJvCwhqsrnmR58IM
 wBeVuTJs5Ask5h7svST1f9vRZ5ot2LasTcjUCteXu1YtzBhhSb6r1JxN2XRacwXl9Ue/
 h12A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678274095;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fbPGXRoFZx0QK8lm9D/pZpaZ0oDNBqf+IjxqEmzbdck=;
 b=kDtfjl+yY/XHo27LXh9HV0oLZZTF3fcbtHyTAPPHH6og/7rDx/LMGLC0ZvwcW5cHMM
 XXmYRPZRfYdFLQr0nv8Hd70/KKoq61yryeOo6CMWy6ya+2HKS4GhCgLMwkq71fBr1/2V
 OPkZfYMpVBROmQ9e2z+oxU9CBDvAwXMfdOcdux0m2AiqaMGeSb+57qF2Iwv2YKYjUWcT
 B3peB20KPLh5EnrU+42yiai3AyP+KEKQt5wsV49Yl1bCwPa1EBHeyMbaLVTQbEcRhSwd
 yOYjJxgm/SkDUYe3CO2FaAcLKdMPuMcXwBnom1QqzPuh7b6rZx1Mf2uvsgU6n8N+FOxW
 8Lpw==
X-Gm-Message-State: AO0yUKXid/2orcwR6tzLIghlGmgKbOdXxUENWCjCHMPuBKfAFrg1gahj
 FSw6Gjw+jvhGcjbOOCxHTjhEmlXTn+cG4f3esiLwfg==
X-Google-Smtp-Source: AK7set9dt6hUTjNqaMXXiOK0QZ47Mt+FP6slcufZ4HJuwT7oEL6mX2VevtGLQnSnz8X98wiU50FFeEzI/La6QZBDFJA=
X-Received: by 2002:a05:6870:cd04:b0:176:be86:b659 with SMTP id
 qk4-20020a056870cd0400b00176be86b659mr5174284oab.5.1678274094756; Wed, 08 Mar
 2023 03:14:54 -0800 (PST)
MIME-Version: 1.0
References: <20230305094231.1616-1-jim.shu@sifive.com>
 <20230305094231.1616-2-jim.shu@sifive.com>
 <0b2407ee-a7dd-d651-763a-a73b3802dc8f@linux.alibaba.com>
In-Reply-To: <0b2407ee-a7dd-d651-763a-a73b3802dc8f@linux.alibaba.com>
From: Jim Shu <jim.shu@sifive.com>
Date: Wed, 8 Mar 2023 19:14:44 +0800
Message-ID: <CALw707oB_CJmQBTV9Zft9qAhhzbBtBRvrrWZHvao1Q4nUhrK_g@mail.gmail.com>
Subject: Re: [PATCH 2/2] target/riscv: Make the "virt" register writable by GDB
To: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2001:4860:4864:20::2f;
 envelope-from=jim.shu@sifive.com; helo=mail-oa1-x2f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Wed, 08 Mar 2023 11:14:58 -0000

Thanks for reviewing.
I'll fix this issue.


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

