Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pjvsA-0006LV-FF
	for mharc-qemu-riscv@gnu.org; Wed, 05 Apr 2023 01:39:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pjvs9-0006LH-Ji; Wed, 05 Apr 2023 01:39:53 -0400
Received: from mail-vs1-xe31.google.com ([2607:f8b0:4864:20::e31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pjvs7-0006gk-Pr; Wed, 05 Apr 2023 01:39:53 -0400
Received: by mail-vs1-xe31.google.com with SMTP id h15so30517444vsh.0;
 Tue, 04 Apr 2023 22:39:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680673190;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xM2o4ujoKpXYwyzlXJBKNMrxzJ77LjTJxhBiwFlk32g=;
 b=EbqZq8nuGxyFwrS2SbCaSKqD9Gfi/T8O1w5TNQOJ3R8m6hVD0+erYMx+WgdI/Rh1C9
 TysMXgGPZyV+4+qLIyl1rANy0nBu5y9Sw1Blu6ZrzOK9TgBMFFwuN5UJRGfpGQ1Hf/g+
 UXjNjh16Dmmy/T+jeyH2LzaBvhHGY+85GKYL+UKr3Q3ZkjawQh9NwcAROX9NjGj1mESr
 xM6nSgb8JA0XdJI1C4eyOkl2TzyqPDeqWus6UNW5gfFXnOfbUFD0FsgNQA7TPBOe1QUV
 NUEpkRzNE9n0wesKWzIztHgzMgIvBUtxAIhE3uMe+C03NTjZ7pMtuvxhA/P/hvPtYxz3
 SFpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680673190;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xM2o4ujoKpXYwyzlXJBKNMrxzJ77LjTJxhBiwFlk32g=;
 b=jChZaamqQhh2pgn1Y6eB05mWbYZcE5htr20V1hOXkcgP887fHOx7xEDop4WhNy83Bw
 LHC6vxuoWCCNL07v0hHLnkv/ksvPicefXUwE6Onn8id7U2sJEWAbpILWgPdXh8sV2+Ga
 ytB8UBLSHQbm67u8O1tIzBP8vu9AzbgIqUbchMLDecFB92eM11oNOGJ9VcK4prQOYIqR
 BbQL+AyTMddcov2Q5KXA2PMthcpmgUOtE8KoEg3OOuFJytz6NX26acqU3XsT4itypHpJ
 FPszE4kYt4fozLHxOEQcA4qHWKHvosZKogLSNeHC6K81D65fmZvvAlbdfO0vgZPt1yPw
 tHyg==
X-Gm-Message-State: AAQBX9d2BC3N+k1ahEC3P1ekOZVJJ2Ix453yLXuFkYwni50IkXU3rHsc
 SjyR8d4D+Dd8P9Jq5GUVhqN+HI9crepJBzuCWro=
X-Google-Smtp-Source: AKy350aQOR3BAQv884ywufTc7QHiCPcfYYxQhsQnmFbaC0S6LK2/w7NO/l2Fx9jlygd2h9V8hUpPHdG1oAcVHk3fU2k=
X-Received: by 2002:a67:c29e:0:b0:425:d39f:3882 with SMTP id
 k30-20020a67c29e000000b00425d39f3882mr4037256vsj.3.1680673190287; Tue, 04 Apr
 2023 22:39:50 -0700 (PDT)
MIME-Version: 1.0
References: <20230327080858.39703-1-liweiwei@iscas.ac.cn>
 <CAKmqyKO_=DnwmU5szGASkQf_GdZLW+GDd=+qgpW_KsB3bjt0Aw@mail.gmail.com>
In-Reply-To: <CAKmqyKO_=DnwmU5szGASkQf_GdZLW+GDd=+qgpW_KsB3bjt0Aw@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 5 Apr 2023 15:39:24 +1000
Message-ID: <CAKmqyKPaHMH0McGe1HQE-EBsnbL9-HV7+tb4ejUsH8BvSsh-fA@mail.gmail.com>
Subject: Re: [PATCH v2 00/10] target/riscv: Simplification for RVH related
 check and code style fix
To: Weiwei Li <liweiwei@iscas.ac.cn>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, palmer@dabbelt.com, 
 alistair.francis@wdc.com, bin.meng@windriver.com, dbarboza@ventanamicro.com, 
 zhiwei_liu@linux.alibaba.com, wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e31;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe31.google.com
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
X-List-Received-Date: Wed, 05 Apr 2023 05:39:53 -0000

On Wed, Apr 5, 2023 at 3:30=E2=80=AFPM Alistair Francis <alistair23@gmail.c=
om> wrote:
>
> On Mon, Mar 27, 2023 at 6:11=E2=80=AFPM Weiwei Li <liweiwei@iscas.ac.cn> =
wrote:
> >
> > This patchset tries to simplify the RVH related check and fix some code=
 style problems, such as problems for indentation, multi-line comments and =
lines with over 80 characters.
> >
> > The port is available here:
> > https://github.com/plctlab/plct-qemu/tree/plct-virtfix-upstream
> >
> > v2:
> > * add comment to specify riscv_cpu_set_virt_enabled() can only be calle=
d when RVH is enabled in patch 4 (suggested by Richard Henderson)
> > * merge patch from LIU Zhiwei(Message-ID: <20230325145348.1208-1-zhiwei=
_liu@linux.alibaba.com>) to patch 5
> > * use env->virt_enabled directly instead of riscv_cpu_virt_enabled() in=
 patch 6 (suggested by LIU Zhiwei)
> > * remain the orginal identation for macro name in patch 8 (suggested by=
 LIU Zhiwei)
> >
> > LIU Zhiwei (1):
> >   target/riscv: Convert env->virt to a bool env->virt_enabled
> >
> > Weiwei Li (9):
> >   target/riscv: Remove redundant call to riscv_cpu_virt_enabled
> >   target/riscv: Remove redundant check on RVH
> >   target/riscv: Remove check on RVH for riscv_cpu_virt_enabled
> >   target/riscv: Remove check on RVH for riscv_cpu_set_virt_enabled
> >   target/riscv: Remove riscv_cpu_virt_enabled()
> >   target/riscv: Remove redundant parentheses
> >   target/riscv: Fix format for indentation
> >   target/riscv: Fix format for comments
> >   target/riscv: Fix lines with over 80 characters
>
> Thanks!
>
> Applied to riscv-to-apply.next

Actually I only applied some of the patches as there are some
conflicts. Do you mind rebasing this series on
https://github.com/alistair23/qemu/tree/riscv-to-apply.next ?

Alistair

>
> Alistair
>
> >
> >  target/riscv/arch_dump.c                |   7 +-
> >  target/riscv/cpu.c                      |   8 +-
> >  target/riscv/cpu.h                      |  29 +--
> >  target/riscv/cpu_bits.h                 |   5 +-
> >  target/riscv/cpu_helper.c               | 142 ++++++------
> >  target/riscv/csr.c                      |  52 ++---
> >  target/riscv/debug.c                    |  10 +-
> >  target/riscv/insn_trans/trans_rvv.c.inc |  36 +--
> >  target/riscv/machine.c                  |   6 +-
> >  target/riscv/op_helper.c                |  21 +-
> >  target/riscv/pmp.c                      |  48 ++--
> >  target/riscv/pmp.h                      |   9 +-
> >  target/riscv/pmu.c                      |   7 +-
> >  target/riscv/sbi_ecall_interface.h      |   8 +-
> >  target/riscv/translate.c                |  14 +-
> >  target/riscv/vector_helper.c            | 292 ++++++++++++++----------
> >  16 files changed, 378 insertions(+), 316 deletions(-)
> >
> > --
> > 2.25.1
> >
> >

