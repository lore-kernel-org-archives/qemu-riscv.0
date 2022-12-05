Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p26jk-0007jC-Bu
	for mharc-qemu-riscv@gnu.org; Mon, 05 Dec 2022 03:22:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1p26ji-0007ii-2K; Mon, 05 Dec 2022 03:22:02 -0500
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1p26jg-0001zn-FC; Mon, 05 Dec 2022 03:22:01 -0500
Received: by mail-lf1-x130.google.com with SMTP id p36so12990543lfa.12;
 Mon, 05 Dec 2022 00:21:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=TA/nR2VNlZpy/ClWcXj3g/NAn/1SG9KkZcZZxSl6Lpc=;
 b=C9V6S/YpHcvaS+jhG4FTMhf7yxz055DS2hz2OkwiIK7efsYTll+QdqA4gCwsuLUItG
 UJxbdlR0qawy+GM2jDy9i0oDxiEKfz9HRfi9ZJECFRGSxZIkPR4hvs16CVQBAzf2Hnvq
 wzRQXSuwqVDEV0zjjrJ+le673QIB0P5CxY86+VIpTzf/i3GwsXAoEFpqpv+byfRE9KWs
 8YmL8TpFu2uIRUMfKXJ5Lljhn3r588sX3QUoegzcOXMvLBmQernWM6et+dzdOwVhEtI8
 5sxuEP00nBehfheEHm3eJVr2Z7CO9vr9K1eqEsBiRB8O7IDxPxjShDlOa1nHAGujEeu9
 PA/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TA/nR2VNlZpy/ClWcXj3g/NAn/1SG9KkZcZZxSl6Lpc=;
 b=avFPin0eRLiKltBPYGbgEkg8hl/qhs9PvTR5lUwMucAIU14co2mPPssG2HVMa5ittE
 w5H7klAPkFHuSei3ORBKKX7LKWfT1bpQR5Irccqrkiq9OdySATu6UdZS3ctDePOQdSHM
 PcMpn8lUuMzSfpbbbE46s8Pu/dVpcacVM9oxX99DUQRYFab6t6nV1NKhMKLEyvwUstq0
 /psCnN3yUXgmfAJvVsUM3KSkGsNL9ZpOQNu6slJB78oJPrsUoXukAn1ZybZMfBcpfbKo
 PaBmCOXaiFHQE5ZZtFhpGncJdWmiRU7cFEAG6f1RF74W6fiBTNGaaMuuq7KyeUF2pR0D
 L1qw==
X-Gm-Message-State: ANoB5plGDhP70AA+LpmQJqEjql15vEdNZ4pJqDTLJsX62Yu3mXXhMiBM
 u7sPlAmdzQKOix9SjamB4joJHlMPeOsUE00/bh0=
X-Google-Smtp-Source: AA0mqf4tLRg6YDNsnuC/ucGb1putMCQZ0Kg35uhaSaOFeLFoCrlpfWfm2tyRZGwy69F4VqBlc8s34dnxuNsRheo6pUk=
X-Received: by 2002:a05:6512:3f96:b0:4b5:478d:821e with SMTP id
 x22-20020a0565123f9600b004b5478d821emr5002298lfa.250.1670228517739; Mon, 05
 Dec 2022 00:21:57 -0800 (PST)
MIME-Version: 1.0
References: <20221201140811.142123-1-bmeng@tinylab.org>
 <20221201140811.142123-15-bmeng@tinylab.org>
 <4d2fa372f88dda106d80bd26806bc32c2a92d784.camel@wdc.com>
In-Reply-To: <4d2fa372f88dda106d80bd26806bc32c2a92d784.camel@wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 5 Dec 2022 16:21:46 +0800
Message-ID: <CAEUhbmVO-OL9Awds3Q19gGhGC-agdq7JqxR28i3W+0CS0K76uw@mail.gmail.com>
Subject: Re: [PATCH 15/15] hw/intc: sifive_plic: Fix the pending register
 range check
To: Wilfred Mallawa <wilfred.mallawa@wdc.com>
Cc: "bmeng@tinylab.org" <bmeng@tinylab.org>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "bin.meng@windriver.com" <bin.meng@windriver.com>, 
 "palmer@dabbelt.com" <palmer@dabbelt.com>,
 "qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::130;
 envelope-from=bmeng.cn@gmail.com; helo=mail-lf1-x130.google.com
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
X-List-Received-Date: Mon, 05 Dec 2022 08:22:02 -0000

On Fri, Dec 2, 2022 at 8:28 AM Wilfred Mallawa <wilfred.mallawa@wdc.com> wrote:
>
> On Thu, 2022-12-01 at 22:08 +0800, Bin Meng wrote:
> > The pending register upper limit is currently set to
> > plic->num_sources >> 3, which is wrong, e.g.: considering
> > plic->num_sources is 7, the upper limit becomes 0 which fails
> > the range check if reading the pending register at pending_base.
> >
> > Fixes: 1e24429e40df ("SiFive RISC-V PLIC Block")
> > Signed-off-by: Bin Meng <bmeng@tinylab.org>
> >
> > ---
> >
> >  hw/intc/sifive_plic.c | 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> >
> > diff --git a/hw/intc/sifive_plic.c b/hw/intc/sifive_plic.c
> > index 7a6a358c57..a3fc8222c7 100644
> > --- a/hw/intc/sifive_plic.c
> > +++ b/hw/intc/sifive_plic.c
> > @@ -143,7 +143,8 @@ static uint64_t sifive_plic_read(void *opaque,
> > hwaddr addr, unsigned size)
> >          uint32_t irq = (addr - plic->priority_base) >> 2;
> >
> >          return plic->source_priority[irq];
> > -    } else if (addr_between(addr, plic->pending_base, plic-
> > >num_sources >> 3)) {
> > +    } else if (addr_between(addr, plic->pending_base,
> > +                            (plic->num_sources + 31) >> 3)) {
> why does adding specifically 31 work here?
>

Each pending register is 32-bit for 32 interrupt sources. Adding 31 is
to round up to next pending register offset.

Regards,
Bin

