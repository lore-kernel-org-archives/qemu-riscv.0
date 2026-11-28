Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52961606A31C
	for <qemu-riscv@archiver.kernel.org>; Sat, 28 Nov 2026 17:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.a=rsa-sha256 header.s=google header.b=O1iXEQR0
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xXMLW-0007wG-UY; Sat, 28 Nov 2026 12:36:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <asrinivasan@tenstorrent.com>)
 id 1xXMLU-0007vj-O6
 for qemu-riscv@nongnu.org; Sat, 28 Nov 2026 12:36:20 -0500
Received: from mail-yx1-xb132.google.com ([2607:f8b0:4864:20::b132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <asrinivasan@tenstorrent.com>)
 id 1xXMLS-0003Oq-K8
 for qemu-riscv@nongnu.org; Sat, 28 Nov 2026 12:36:20 -0500
Received: by mail-yx1-xb132.google.com with SMTP id
 956f58d0204a3-67c0bd676eeso6284695d50.3
 for <qemu-riscv@nongnu.org>; Sat, 28 Nov 2026 09:36:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795887377; cv=none;
 d=google.com; s=arc-20260327;
 b=CNcZqCxtOgXGNyipXUyh/gZd1NrN/l91p2H1+cMVW1pWI3QfCE0MKn8YktnKzhzeL+
 /CVGMLZ8c6iiiMqF++pdEOA6r4XQBpeaIWd4S4eJBNDV3IZItrCFyB2F+EUdn3MEMVGP
 Wp2Za5Yk/Kh37ueLWJw0lAC2H+XhmZuy6NQ8ec2hrx+JQCkkNT4jn7irh0oKqZYDWANs
 75kk2j6p9IBqxJ1aq07Wew1jSFKNfix7snvv5CM9gjucAZEzSFp5bzfH5sUhKzP7OJcc
 +uHgKtqs+i/v3w06iHPiWzW8ala0dNQlTnm21MMNI/on/82K5+GH5O06Bww6Q6ojN889
 aLcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=dwN3td4yLntxvg5SLnF526kRzpxktTDIWO5fB/CzpOk=;
 fh=gU4aPEXf9ZnDDyXD92PT8D8F3lk4xDoYaoM7LbgFTf4=;
 b=lfL9hq+JC/t8ySTLbr/b8Hxc1+uzNVJsaYj7aQd+vIcKbuKhdXbvh95jlLkXCBMkTQ
 X6/Lp6dAGdJ1OOGQX4CKtU9k8BZVFRlII4GHeAD+lDvadLj43IJYsDpwzlHfXMAOYjEy
 nnWXXZURSPCknDPK8T3P3OlBhQkFJWFAg1Dk7zZMdXmjufnzvX8LZTQJ8nqew4hxrHYf
 syjHTsthUtkb4nZu+mQHnoQANewLjgXQK8jc49r0XKerQtqYAe/zRL9Kr6k3DxXaWlDs
 8K9Q0R/N/vrFH2wTfqRIJF0TzSuVrVDW+nLrXeeCXyvqn41ZnRxpflesWd0uhsKnH3P8
 A+lw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tenstorrent.com; s=google; t=1795887377; x=1796492177; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=dwN3td4yLntxvg5SLnF526kRzpxktTDIWO5fB/CzpOk=;
 b=O1iXEQR0qgeyZEuDYJexWQycHkPBLqF/xfErJyqLeXr7OESRG+5OVd/VTPj8gYyt6z
 cgcRoBk/lfJtDfSwsScjJDBQKGGnlV/oTUELpSI9/GwtLID6kYb0KaGxr7cx5lEDtYU6
 xIPzUTbsoE87Ca+VJJlcQ9cTjw8WNdbJJgP0RK3/iV6CKXoOox7PHHfOO4AU7H+0ty1n
 YOCun1orNDG6F0rAjspGGkr1EyQB5p7rSC9roejArjcdp2E12/9cV1sTk/MnWHAokxpC
 PsMdTjofhrdfQbuFw9qDgLAgMb33M1mq9Ow/y5Fdfb1yLaiuQ2q/JmBikLvs/Bpn9Le0
 RMnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795887377; x=1796492177;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=dwN3td4yLntxvg5SLnF526kRzpxktTDIWO5fB/CzpOk=;
 b=Iyegsqtsfd/Db38NqhgXK/zxjfAfOin+OBnZF7jw7gypZF2F8q8M15UenR2F3cE8AO
 Hu6hs+DqhYLMFt/yGWMAzG08dkdAV1UmXVr8Z1SPEyvk6Mzv1l/4MeXbaF5JgQiCIw8r
 pbIBBj9yncnJ0dinQkCUi2C0l0n54/I3WkcXRUGZr4JrKu90azMug1l8vOIb8guuMCoc
 tvZg4kb3iFzBAPKUcLvG1IjkmX08kcFEBoP0Gs0vnUuO+RxXJDIZdAxZZOwJk6NBNgYa
 Fp2STcoN9MhezSdXNMr6pAWJQNBCMl5zMGK/wJzA+6DYPrXilUHkY7jRWijjmgLczvWC
 LxdQ==
X-Forwarded-Encrypted: i=1;
 AL+hErFbWO82wF1RAgWVqHASw36OYtIsnJ6nlyYaXNu8e9ULU5ele6ptc5cPkPP0yvdUK1rO28lnGzuaaRkE@nongnu.org
X-Gm-Message-State: APuU4Z8wPjGb+oj79X6j54y/U9LtJKl5P8hWpMEWkW5FfDsIHhxDC+zB
 fgkkCXLzrtpEzB2feS73Po+ms6eNKWZyw7Kk0f2W2PDTl9bzECMNht07w4pLz8LYrprCY+2kMwz
 auXMzp+F31CXnUw1iI6K09VVkkvn4bhJQpAtsZXb1Qw==
X-Gm-Gg: AZFdTZdsiHj6Ks4bJTO/MlATf19TsA44/XoH2KLQB/rCuweW/3MhxJJ6LwIvie6fI5A
 cmF1pNxJ0I6i3/os+ri8QFTgs/UDPMEa5TVXx89NbeyJXny+Ru1tvCAvDZaAM0qMwaflesOLVMJ
 QBiuixSDS0UBCmgho7ai5EQbTeUi2cEDxW0tOtj2XaLtCYNYYpmDebtz/iHmZz4Tzjr/gsIHY6W
 CCXTuVh3/WVD+gmfAXZ3LbuBOtUVUxkaejoMlLgo/fHm5Pmijrv29vM3j2g9+E5Wl6zlzurHQ5e
 X6anMv6co7VmcyHaHLSdBPincw1Xw6YZZ8jtoQpOsFDv2lu5x4aVC42DGZhqV2K+8OUlSCadhsm
 ihXEKcN5+ImlvOuoHWDLImq7w/2Mz288Kx74uLmffTEqneMqOpYjGevXMfZLbhFltvGFc+ZcUXJ
 J7d50URx0YA/KPk38JUzrbBdBJ/g==
X-Received: by 2002:a05:690e:c4c:b0:67c:1a7d:d968 with SMTP id
 956f58d0204a3-67df44934e8mr12374314d50.92.1795887376728; Sat, 28 Nov 2026
 09:36:16 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261124-spacemit_k3-v1-1-e911d6e88542@oss.tenstorrent.com>
 <20261128163336.34973-1-chao.liu@processmission.com>
In-Reply-To: <20261128163336.34973-1-chao.liu@processmission.com>
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Date: Sat, 28 Nov 2026 11:36:05 -0600
X-Gm-Features: Aa3M54qN9lUaJCnm0vlsr_iC0ZGYsmiHylnuqlyhapybWzk2ECZTY35SaV8lkTY
Message-ID: <CAEev2e_TQrFRA3d=WBH545KTFYnY0zFsAh6U4Rw68cNa-L4MpA@mail.gmail.com>
Subject: Re: [PATCH 1/8] target/riscv: Add Spacemit X100 CPU type
To: Chao Liu <chao.liu@processmission.com>
Cc: qemu-devel@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li <liwei1518@gmail.com>, 
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 qemu-riscv@nongnu.org, Jeuk Kim <jeuk20.kim@samsung.com>, 
 Alistair Francis <alistair@alistair23.me>, Paolo Bonzini <pbonzini@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b132;
 envelope-from=asrinivasan@tenstorrent.com; helo=mail-yx1-xb132.google.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hello Chao,

On Sat, Nov 28, 2026 at 10:34=E2=80=AFAM Chao Liu <chao.liu@processmission.=
com> wrote:
>
> On Tue, 24 Nov 2026 20:37:20 -0600 Anirudh Srinivasan <asrinivasan@oss.te=
nstorrent.com> wrote:
>
> > Adds a CPU definition for the X100 cores present in the Spacemit K3 SoC=
.
> > The CPU definition is based on information from datasheet[1] and Linux
> > device tree. The custom CSRs are based on what the Spacemit K3 bootrom,
> > U-Boot SPL and OpenSBI write to during the boot process.
> >
> > [1] https://github.com/spacemit-com/docs-chip/tree/main/en/key_stone/k3
> >
> > Signed-off-by: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
> > ---
> >  MAINTAINERS                     |  6 +++
> >  target/riscv/cpu-qom.h          |  1 +
> >  target/riscv/cpu.c              | 87 +++++++++++++++++++++++++++++++++=
++++++++
> >  target/riscv/cpu_vendorid.h     |  4 ++
> >  target/riscv/tcg/csr.h          |  3 ++
> >  target/riscv/tcg/meson.build    |  1 +
> >  target/riscv/tcg/spacemit_csr.c | 82 +++++++++++++++++++++++++++++++++=
+++++
> >  7 files changed, 184 insertions(+)
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 40bf63651c..a9dbb39815 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -1854,6 +1854,12 @@ F: hw/*/*sifive*.c
> >  F: include/hw/*/*sifive*.h
> >  F: tests/functional/riscv64/test_sifive_u.py
> >
> > +Spacemit Machines
> > +M: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
> > +L: qemu-riscv@nongnu.org
> > +S: Supported
> > +F: target/riscv/tcg/spacemit_csr.c
> > +
> >  Tenstorrent Machines
> >  M: Joel Stanley <joel@jms.id.au>
> >  M: Nicholas Piggin <npiggin@gmail.com>
> > diff --git a/target/riscv/cpu-qom.h b/target/riscv/cpu-qom.h
> > index 61234842e3..d88a56f514 100644
> > --- a/target/riscv/cpu-qom.h
> > +++ b/target/riscv/cpu-qom.h
> > @@ -56,6 +56,7 @@
> >  #define TYPE_RISCV_CPU_THEAD_C908       RISCV_CPU_TYPE_NAME("thead-c90=
8")
> >  #define TYPE_RISCV_CPU_THEAD_C908V      RISCV_CPU_TYPE_NAME("thead-c90=
8v")
> >  #define TYPE_RISCV_CPU_VEYRON_V1        RISCV_CPU_TYPE_NAME("veyron-v1=
")
> > +#define TYPE_RISCV_CPU_SPACEMIT_X100    RISCV_CPU_TYPE_NAME("spacemit-=
x100")
> >  #define TYPE_RISCV_CPU_TT_ASCALON       RISCV_CPU_TYPE_NAME("tt-ascalo=
n")
> >  #define TYPE_RISCV_CPU_XIANGSHAN_NANHU  RISCV_CPU_TYPE_NAME("xiangshan=
-nanhu")
> >  #define TYPE_RISCV_CPU_XIANGSHAN_KMH    RISCV_CPU_TYPE_NAME("xiangshan=
-kunminghu")
> > diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> > index 15c27f4ce4..9bbe0cf626 100644
> > --- a/target/riscv/cpu.c
> > +++ b/target/riscv/cpu.c
> > @@ -3616,6 +3616,93 @@ static const TypeInfo riscv_cpu_type_infos[] =3D=
 {
> >          .misa_mxl_max =3D MXL_RV64,
> >      ),
> >
> > +    DEFINE_RISCV_CPU(TYPE_RISCV_CPU_SPACEMIT_X100, TYPE_RISCV_VENDOR_C=
PU,
> > +        .misa_mxl_max =3D MXL_RV64,
> > +        .misa_ext =3D RVG | RVB | RVC | RVS | RVU | RVH | RVV,
> > +        .priv_spec =3D PRIV_VERSION_1_13_0,
> > +        .vext_spec =3D VEXT_VERSION_1_00_0,
> > +#if !defined(CONFIG_USER_ONLY)
> > +        .cfg.pmp_granularity =3D 1 << 12,
> > +        /*
> > +         * QEMU doesn't allow setting this yet
> > +         * .cfg.pmp_addr_bits =3D 38,
> > +         */
> > +        .custom_csrs =3D spacemit_csr_list,
> > +        .num_triggers =3D 4,
> Maybe we need to add an ext_sdtrig as well?

Looks like ext_sdtrig was added a few months back. I will add it here.

Some other CPU definitions (like Ascalon) are also missing it.

Regards
Anirudh Srinivasan

