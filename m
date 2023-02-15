Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pSDPw-0005kf-2W
	for mharc-qemu-riscv@gnu.org; Wed, 15 Feb 2023 03:45:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pSDPt-0005jA-7Q; Wed, 15 Feb 2023 03:45:29 -0500
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pSDPr-0004M1-Ds; Wed, 15 Feb 2023 03:45:28 -0500
Received: by mail-ed1-x52d.google.com with SMTP id w3so13894353edc.2;
 Wed, 15 Feb 2023 00:45:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WkNwHrLJHap8jGFwZdGi7jb8FN8o5jOWXtFdYec5TR0=;
 b=D26W1rAfDuwIX0J08zBDzvpontxxBRoMQLLatdVbze6IeLMwswz0OrfK8Y6uYiJllX
 KVyWqWpG+OyVHUYiLa2d10ICO7muh42fY3Q04bJsyz+M4UxXhPcHSym1kKe6QRsN2fUo
 G5xEgxtlbkMHsR+ddRshC/J69j2XRJwSxwi+jE80Dy82oVq9eT7c20MOgwDM+llbpiXD
 C8zQV/J6I+Yd7Du8DX6O1kgkbZzngh32sd2fKaRzgmwcaaWhqAhfPsyTor9aotOKRU4d
 FzAkovZ7p3FSsLSHYdapxrYllZBsyvy5y+rDkJeVwQzS05iidMFhnLohTIyjEP2Oxd2M
 70vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WkNwHrLJHap8jGFwZdGi7jb8FN8o5jOWXtFdYec5TR0=;
 b=JxcRZ611ReeDct9Ol+lUtgXm4Sj2mBpNkmvBHMWt+d8m6xl6ccBhn2kKBagxU0oTDD
 cHLFCWOR2H5VItq5nS8OIS0Ar53PB2eTlFyyexK3sgfucpCQbKDqGSn7LviDcurR9EC4
 +X5Q90+XhALmZiZJJ6/003h4cwIv8F81FAGOHZJ3aYFbzito2T9vSgVZWV+mzRZeDxxX
 hU2MKjzvRCvQw/Jq8DXWKYgplQmducHt2r6tqAtnE3+Cfv+4xrHPITH7w5bLdET7AzxE
 Z3/isLiF9VgQLQVEyNhgjykLq7fKGvLRluzTL/ve8QxVSSk3u0x2o1H6djG+J18i9Axx
 OX5g==
X-Gm-Message-State: AO0yUKUDb2dVghMRvILOgaba3AxOADunSo+4/7xgfKdqUbdeiaZm/0EN
 nPJBqTuC7a9AY7lkmmAJCmQBuRf+wGijDc5QSdQ=
X-Google-Smtp-Source: AK7set8SvN01f8ml11nI3ddSzyPMmQnYcAS1IToi1K/kkOhCV/CHZRvpV8ymbU9EjFocsdJTdw/Mk4PFrMFpDR0JLzQ=
X-Received: by 2002:a05:6402:1954:b0:4ac:b38f:ae5 with SMTP id
 f20-20020a056402195400b004acb38f0ae5mr2004464edz.1.1676450723894; Wed, 15 Feb
 2023 00:45:23 -0800 (PST)
MIME-Version: 1.0
References: <20230214192356.319991-1-dbarboza@ventanamicro.com>
 <20230214192356.319991-4-dbarboza@ventanamicro.com>
In-Reply-To: <20230214192356.319991-4-dbarboza@ventanamicro.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 15 Feb 2023 16:45:12 +0800
Message-ID: <CAEUhbmXBDf8UGN6VszQma6CH_LV-pNEQjeT_RGpEG_+0H9UOEg@mail.gmail.com>
Subject: Re: [PATCH v2 03/11] target/riscv: allow users to actually write the
 MISA CSR
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Wed, 15 Feb 2023 08:45:30 -0000

On Wed, Feb 15, 2023 at 3:26 AM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> At this moment, and apparently since ever, we have no way of enabling
> RISCV_FEATURE_MISA. This means that all the code from write_misa(), all
> the nuts and bolts that handles how to properly write this CSR, has
> always been a no-op as well because write_misa() will always exit
> earlier.
>
> This seems to be benign in the majority of cases. Booting an Ubuntu
> 'virt' guest and logging all the calls to 'write_misa' shows that no
> writes to MISA CSR was attempted. Writing MISA, i.e. enabling/disabling
> RISC-V extensions after the machine is powered on, seems to be a niche
> use.
>
> There is a good chance that the code in write_misa() hasn't been
> properly tested. Allowing users to write MISA can open the floodgates of
> new breeds of bugs. We could instead remove most (if not all) of
> write_misa() since it's never used. Well, as a hardware emulator,
> dealing with crashes because a register write went wrong is what we're
> here for.
>
> Create a 'misa-w' CPU property to allow users to choose whether writes
> to MISA should be allowed. The default is set to 'false' for all RISC-V
> machines to keep compatibility with what we=C2=B4ve been doing so far.
>
> Read cpu->cfg.misa_w directly in write_misa(), instead of executing
> riscv_set_feature(RISCV_FEATURE_MISA) in riscv_cpu_realize(), that would
> simply reflect the cpu->cfg.misa_w bool value in 'env->features' and
> require a riscv_feature() call to read it back.

I am surprised to see we have a RISCV_FEATURE_MISA. Per spec MISA is a
WARL read-write CSR. I don't think creating a special config property
for a read-write CSR makes sense.

We should drop the feature enum and the feature check in write_misa() direc=
tly.

>
> Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>  target/riscv/cpu.c | 1 +
>  target/riscv/cpu.h | 1 +
>  target/riscv/csr.c | 2 +-
>  3 files changed, 3 insertions(+), 1 deletion(-)
>

Regards,
Bin

