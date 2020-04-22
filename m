Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jRJse-0001ao-I6
	for mharc-qemu-riscv@gnu.org; Wed, 22 Apr 2020 14:13:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47944)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alistair23@gmail.com>) id 1jRJsX-0001YE-NL
 for qemu-riscv@nongnu.org; Wed, 22 Apr 2020 14:13:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <alistair23@gmail.com>) id 1jRJsW-0005l5-1z
 for qemu-riscv@nongnu.org; Wed, 22 Apr 2020 14:13:45 -0400
Received: from mail-io1-xd41.google.com ([2607:f8b0:4864:20::d41]:41155)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1jRJsV-0005ar-Fs; Wed, 22 Apr 2020 14:13:43 -0400
Received: by mail-io1-xd41.google.com with SMTP id b12so3430590ion.8;
 Wed, 22 Apr 2020 11:13:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=attfnDxbRHujPfbbN2DK1mOiaYNsAEHnOKl1Ksh1vfE=;
 b=YZepO5vvnj+VToYyKCn+fHhD7dEEDcMpraWJ4x64UB/pQvdU830s7aYcRdi3hq2Fvy
 A2dao0ly3m1W/tSC8SeFQsrGmKG0kjDZ1U+9ZkAvWcXn4VefbzQxucz1G+dQ6DjqqQDe
 7uryIkIS/Orsxpo/2LQ8uIExy2jP++zVRAQd0asLP4uQ5nDe0Z4jmVut21IKDCdG7FfW
 PFFXaSShyLNDGYw4LHtQMNxUx4BSS9vJC9xUb0kd+ALm2hiSL7b/3uctAXTc80GYimDs
 3Y9bz5ATzmx7Pq2S9UiV1ZvseaOzA8+eBF/dKPm2oJaGkjydkRK6LlY9ynmujaW/JeOf
 ciPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=attfnDxbRHujPfbbN2DK1mOiaYNsAEHnOKl1Ksh1vfE=;
 b=URvuFG6dSKFzjJ9Kcq2VtBAJbr44aB2v/iyXbU4mLp5nBunCNGAuRCaLjjtVT3qgib
 /EHLHEZQkfRzCkNJA+pzYPl/WZ//sLT/Kogo5At5W05vvCN6ymbXmP7Dy43a4FrZJMWQ
 tOI+iX7FB9b+AwkFCVXweE2edA0kKXXb30KlTlteOaWUhWpVvJjtC67dH/rGx3I5GIWm
 d+A/2ax6rsk8A2VHlzWvb31R1euTizhlClyqoVGGKMP+dPXe8BO5tKlh/gR4Mb0XsbGT
 uglOTlLMgMQiuyhe3dp9eNkQ4J/29VFllLqiWnBn+MpQ9TUT6wwGQnJZBTG+aPMqtSXT
 ps1g==
X-Gm-Message-State: AGi0PuaLpb6UlgevErD4K+rWqk8evPzO+jsIfpnOzzQtWirQT6Vx6AOn
 nl3zi02nSZSZBqZ3nqSnBCsEU4nkTHItftd8YS4=
X-Google-Smtp-Source: APiQypK0BuUi5uABE/lfret8iIDuVzgAGlzvmi4ko9MWTvGAjCajwnJVyjU2ELzWxQhzhysqFI2wBiOAjXpRx2hNbrQ=
X-Received: by 2002:a02:6243:: with SMTP id d64mr15047851jac.135.1587579215541; 
 Wed, 22 Apr 2020 11:13:35 -0700 (PDT)
MIME-Version: 1.0
References: <20200412020830.607-1-zhiwei_liu@c-sky.com>
 <f6dc4fa7-fed5-28a1-5922-68e9a0510de5@c-sky.com>
 <bf6b46c3-cc39-1b4a-4ae4-9de894721f04@linaro.org>
In-Reply-To: <bf6b46c3-cc39-1b4a-4ae4-9de894721f04@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 22 Apr 2020 11:05:05 -0700
Message-ID: <CAKmqyKMZ9x+PXOxnFqE5e-h+cCZjJThEBjJip_OCppjX71DSrg@mail.gmail.com>
Subject: Re: [PATCH] linux-user/riscv: fix up struct target_ucontext definition
To: Richard Henderson <richard.henderson@linaro.org>
Cc: LIU Zhiwei <zhiwei_liu@c-sky.com>, Laurent Vivier <laurent@vivier.eu>, 
 Riku Voipio <riku.voipio@iki.fi>, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 wxy194768@alibaba-inc.com, wenmeng_zhang@c-sky.com, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d41;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd41.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2607:f8b0:4864:20::d41
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
X-List-Received-Date: Wed, 22 Apr 2020 18:13:46 -0000

On Tue, Apr 21, 2020 at 9:10 PM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 4/21/20 7:34 PM, LIU Zhiwei wrote:
> > Ping.
> >
> > When I port RISU, I find this bug. I can't get the correct registers from the
> > struct ucontext_t parameter in the signal handler.
>
> The RISC-V Linux ABI will need to be extended to handle RVV state.
>
> There is room in your sigcontext structure:
>
> > struct __riscv_q_ext_state {
> >         __u64 f[64] __attribute__((aligned(16)));
> >         __u32 fcsr;
> >         /*
> >          * Reserved for expansion of sigcontext structure.  Currently zeroed
> >          * upon signal, and must be zero upon sigreturn.
> >          */
> >         __u32 reserved[3];
> > };
>
> in uc->uc_mcontext.sc_fpregs.q.
>
> That reserved field is going to have to be used in some way.

Just to clarify, this patch is still correct right?

It looks good to me.

Alistair

>
> My suggestion is to use some sort of extendable record list, akin to AArch64:
>
> struct _aarch64_ctx {
>         __u32 magic;
>         __u32 size;
> };
>
> One of the 3 zeros could be the total size of the extensions, so that it's easy
> to validate the size or memcpy the lot without parsing each individual record.
>  The other two zeros could be the first header of the next record.  Which in
> this case also allows the payload of that first record to be aligned mod 16,
> which could come in handy.
>
> Talk to the risc-v kernel engineers and come up with a plan that includes room
> for the next architecture extension as well.  They may have already done so,
> but I'm not monitoring the correct mailing list to know.
>
>
> r~
>

