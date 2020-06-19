Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jm6GB-0006Se-W9
	for mharc-qemu-riscv@gnu.org; Thu, 18 Jun 2020 21:56:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@atishpatra.org>)
 id 1jm6GA-0006RK-5M
 for qemu-riscv@nongnu.org; Thu, 18 Jun 2020 21:56:02 -0400
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:37969)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@atishpatra.org>)
 id 1jm6G8-0007YJ-E5
 for qemu-riscv@nongnu.org; Thu, 18 Jun 2020 21:56:01 -0400
Received: by mail-wm1-x343.google.com with SMTP id f185so7626050wmf.3
 for <qemu-riscv@nongnu.org>; Thu, 18 Jun 2020 18:56:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XzFxL0Tr2VHc6i+U5sXHL28eAkGcjo5HAI4Y3K/2FBc=;
 b=lCpDf/hnEoFUhj0m/xtwE35NwDIMRMhFzp9YyuGO9effqFpgEI9rxKZMedkeT2nmCn
 c1aTMWKN2eNIchIbSLBUmkWjgE+VRADmwSAj5s4zOgQL9tpQzZeKCacY3MK39ata0m5b
 N/qJD5j7dNps+QWH4B8JMkfVrstiO9yFz7Ug0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XzFxL0Tr2VHc6i+U5sXHL28eAkGcjo5HAI4Y3K/2FBc=;
 b=PbJHXElOK8gVLi5mWyaW3TWlkQcWKq9PxgpIpUHe6yMBAKSAbYbZw9k1lDtit+Hb0W
 Kc+DJOH5OrHyDT6IlDJjh32UWCn0K/aGJ2upi/8bb7P/Wk2S5qM98h6MVxS8x7Gfu71Q
 1RrmdPaVhgAzyPMBVsa0FuL1xJsyysO23KSMMkcI71s6sGZsEsqseq1MHlAfkFGt5wQB
 z9VNB75QX7Qu153zn7m8Xm/IgmgRGgwK/368e4UlSfFXB1sEV7jK3lCuFgZxylGE2/8z
 ekyD5arT/Ya+fPgIY0uYCYPI+o4tIiEhfOVLAGh0hzYo2iE7kjpde/l8DH9ZJtq6vCs2
 z6AA==
X-Gm-Message-State: AOAM531xhiLo3gg7e5ObAV5aY+EU8CvrkLFlKxKJi43c++BIoxMTCY1D
 dfapLDVTu7DlamivU+gEu1wT0Pywk0v0N3m3JDcC
X-Google-Smtp-Source: ABdhPJzESkpuZsAH910yLb1PKqt7P6Lc014ghtKenuATcTYnr5+Nys6qEaiAsILYC5vFluRKo9fwETsO8h1k4EU3zto=
X-Received: by 2002:a05:600c:2:: with SMTP id g2mr1129260wmc.176.1592531758927; 
 Thu, 18 Jun 2020 18:55:58 -0700 (PDT)
MIME-Version: 1.0
References: <20200616192700.1900260-1-atish.patra@wdc.com>
 <20200616192700.1900260-2-atish.patra@wdc.com>
 <CAEUhbmV6jtFZuC=OeYn6GWijf-Q9Zzbj=YG6EDBTZoJy0QTC4g@mail.gmail.com>
In-Reply-To: <CAEUhbmV6jtFZuC=OeYn6GWijf-Q9Zzbj=YG6EDBTZoJy0QTC4g@mail.gmail.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Thu, 18 Jun 2020 18:55:48 -0700
Message-ID: <CAOnJCUJ-7Ga3DEVZPLJdFGBAMVrCKqAb3C88cPjM+dXP0QM3+Q@mail.gmail.com>
Subject: Re: [PATCH 1/3] riscv: Unify Qemu's reset vector code path
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Atish Patra <atish.patra@wdc.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::343;
 envelope-from=atishp@atishpatra.org; helo=mail-wm1-x343.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 19 Jun 2020 01:56:02 -0000

On Thu, Jun 18, 2020 at 1:03 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> On Wed, Jun 17, 2020 at 3:30 AM Atish Patra <atish.patra@wdc.com> wrote:
> >
> > Currently, all riscv machines have identical reset vector code
> > implementations with memory addresses being different for all machines.
> > They can be easily combined into a single function in common code.
> >
> > Move it to common function and let all the machines use the common function.
> >
> > Signed-off-by: Atish Patra <atish.patra@wdc.com>
> > ---
> >  hw/riscv/boot.c         | 46 +++++++++++++++++++++++++++++++++++++++++
> >  hw/riscv/sifive_u.c     | 38 +++-------------------------------
>
> sifive_u's reset vector has to be different to emulate the real
> hardware MSEL pin state.
> Please rebase this on top of the following series:
> http://patchwork.ozlabs.org/project/qemu-devel/list/?series=183567
>
Sure. I will rebase. I think sifive_u may be used in future to emulate
other sifive boards in future.
This may require additional data in rom. That's why, it's better to
keep the reset vector code in
sifive_u and just unify spike & virt.

> >  hw/riscv/spike.c        | 38 +++-------------------------------
> >  hw/riscv/virt.c         | 37 +++------------------------------
> >  include/hw/riscv/boot.h |  2 ++
> >  5 files changed, 57 insertions(+), 104 deletions(-)
> >
>
> Regards,
> Bin
>


-- 
Regards,
Atish

