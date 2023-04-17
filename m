Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1poLru-0002m0-Ne
	for mharc-qemu-riscv@gnu.org; Mon, 17 Apr 2023 06:13:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1poLrs-0002lr-2R
 for qemu-riscv@nongnu.org; Mon, 17 Apr 2023 06:13:52 -0400
Received: from mail-oa1-x33.google.com ([2001:4860:4864:20::33])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1poLrq-0004Wy-BY
 for qemu-riscv@nongnu.org; Mon, 17 Apr 2023 06:13:51 -0400
Received: by mail-oa1-x33.google.com with SMTP id
 586e51a60fabf-1842e8a8825so29885199fac.13
 for <qemu-riscv@nongnu.org>; Mon, 17 Apr 2023 03:13:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1681726428; x=1684318428;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6t6tWoe3HYk9lpgjjPyLyZkac2meqs6+zAZKrVl+iPo=;
 b=ahWoMw5+B2Dr+OANVE+wyqpdwDApKwin7YRydNtZ3r2Dm1VCLniM/XSE4TEg9hNmPw
 dDwoX3G2ntzPyt6ZdS1Si+80y/eB2HTCMK1IHGV8bXB3jG9JY+o0Mrg7GzS0VbmVpKhw
 O9qiqSNbSVMi+ahFecZ5IxjGHuzKZo2m/5BdfGhCxv0tD7h7WwehJDpMhvnrLNZtPHWe
 udodZEDkeA9G2VyRUIqdfQ4Uy9KuMTpen7KIMBxzPlZMzmV9r3osuD/NGilV3evTliNC
 4ys93cr49kEcVlexMpeUB0yZ39JSRyRZrycxYPC/8hv3QG+ctqlhpvzsP3Ok/HgHik7m
 Pmaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681726428; x=1684318428;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6t6tWoe3HYk9lpgjjPyLyZkac2meqs6+zAZKrVl+iPo=;
 b=Lk0E7K7MPLUp9OauKRy4B6gdM01YX+EMMuzXvtn5+3yLHSvNFshuQbywLcdjuSS33X
 jBISk2OKclVyqcQ9xsfZzB0Tt6auSXSt4NeDzvMAGd7HzJbhLr944ylU7MV0iUBXU2+I
 HUQKbS2WiU5+TD0PRR09LQJI5ZKX9AhMJAbxp9X1CbfbinQcOuJPnyb+1WDFEbeUH9oi
 5C4bpqICffQ3siVCVkKGRnNEqF67tkrX1o+bBMbET9uicG/b5kSBATB68tFecUkIJkKL
 UZt8+zlaUNKlz9R5xK44n81L11kqXYmdgkFlOe6x0M7i9N7xS7LqS70ZqdtDT0h61aZl
 iqiw==
X-Gm-Message-State: AAQBX9dv+k7++GRnnQEbuSSByivRZ7pLgWNabP0vtS/rQRiYDJL8e9n3
 mOWlhuYP1IxpJ79hStra573VntYPLqjmwgABSV7eYA==
X-Google-Smtp-Source: AKy350bd9c5Vk+DbxmCZQLTUznd+1FIubB5z9b95qrjOWGkhRNLfHa4j8LNSU3hC4qaPp5febMPxQvG6jZlzVUIkFeI=
X-Received: by 2002:a05:6870:4710:b0:185:7d93:b9eb with SMTP id
 b16-20020a056870471000b001857d93b9ebmr6402221oaq.7.1681726428616; Mon, 17 Apr
 2023 03:13:48 -0700 (PDT)
MIME-Version: 1.0
References: <CAECbVCt_+SCiUzv9cOR4KYC7BE_4TjRGqOndzDthUvara8OxMA@mail.gmail.com>
 <c021529c-67ce-fe7c-1acc-7753715c466f@ventanamicro.com>
In-Reply-To: <c021529c-67ce-fe7c-1acc-7753715c466f@ventanamicro.com>
From: Jim Shu <jim.shu@sifive.com>
Date: Mon, 17 Apr 2023 18:13:37 +0800
Message-ID: <CALw707opvnP59E3LFTNQVvWtNnSnaHaeStQvjaQOJ65gc_Gtgw@mail.gmail.com>
Subject: Re: KVM QEMU AIA support for RISCV guests
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: Rajnesh Kanwal <rkanwal@rivosinc.com>, qemu-riscv@nongnu.org,
 anup@brainfault.org, 
 alistair.francis@wdc.com, Atish Kumar Patra <atishp@rivosinc.com>, 
 Palmer Dabbelt <palmer@rivosinc.com>, Yong-Xuan Wang <yongxuan.wang@sifive.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2001:4860:4864:20::33;
 envelope-from=jim.shu@sifive.com; helo=mail-oa1-x33.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-List-Received-Date: Mon, 17 Apr 2023 10:13:52 -0000

Hi Rajnesh and Daniel,

Recently, Yong-Xuan (yongxang.wang@sifive.com) has already implemented
a series of QEMU v7.2-based patches for KVM-AIA and tested them on the
QEMU riscv-virt machine.
She plans to refine the patches and upstream them soon.

Thanks,
Jim Shu


On Fri, Apr 14, 2023 at 8:40=E2=80=AFPM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
>
>
> On 4/14/23 08:35, Rajnesh Kanwal wrote:
> > Hi All,
> >
> > I am starting to work on KVM-QEMU AIA support for RISCV guests to exten=
d
> > kvm accel support added in [0]. This is just to confirm if anyone else
> > is actively
> > working on it to avoid duplicate effort.
>
> I was going to look into it eventually, but now that you've started I'll =
sit
> back and help with reviews and testing and so on.
>
>
> Thanks,
>
> Daniel
>
> >
> > [0]: https://lists.nongnu.org/archive/html/qemu-riscv/2021-08/msg00117.=
html
> >
> > Thanks,
> > Rajnesh
> >
>

