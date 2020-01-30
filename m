Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ixBje-0004ak-SS
	for mharc-qemu-riscv@gnu.org; Thu, 30 Jan 2020 10:28:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56179)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <anup@brainfault.org>) id 1ixBjc-0004a7-7Q
 for qemu-riscv@nongnu.org; Thu, 30 Jan 2020 10:28:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <anup@brainfault.org>) id 1ixBjb-0000sl-5v
 for qemu-riscv@nongnu.org; Thu, 30 Jan 2020 10:28:00 -0500
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:55879)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <anup@brainfault.org>) id 1ixBja-0000or-Py
 for qemu-riscv@nongnu.org; Thu, 30 Jan 2020 10:27:59 -0500
Received: by mail-wm1-x341.google.com with SMTP id q9so4208678wmj.5
 for <qemu-riscv@nongnu.org>; Thu, 30 Jan 2020 07:27:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XNr//a8sPPOFMad0JXNigPx1xjtUzd0UPgS5DzpF3NY=;
 b=Y+bevn6QKWF3Lspiq/y7+KGk+KYxsAmPB3335p+D7hWA5gcnnjzqACEiit5VTyfSfR
 vz0B8qqXL+NsADWQu7tVIooerzEsK+5VHe87x0p0jbHNkQnGEJaCEt/NZ6DSbV15RVaH
 8eLtZvedFfci/+0czFa6gAfiyijUZKkFniQvK6plnPhpbIgTympSy8W6loZylTM7Wjaj
 PxHvd7zymnoBEPyoKspE67D13xIokC+stDYdLbBQ68nG+P5NHxc/ZVEYh8deH+NfGLXF
 UV0+2qGV1/7RZ0/LRV81r1CIvbsILNw4cGx+8mLuUhpQnaybGPVbUObjGwsZi2iyD3hv
 Mc/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XNr//a8sPPOFMad0JXNigPx1xjtUzd0UPgS5DzpF3NY=;
 b=Ppo3A1YWEhIMvsk9NWnULDdW7a8fhWsZj+YTPdwqtwFjfKcpYr9iqz3l52KLH4r0I4
 pvQpKWyJ/0J3IAITA9BXv5YavNDq8OYi/pMntkTOof2iLFBBUUdutMPBmPpCWjwkQJfq
 HtGxBjzCyuD4qK1ZCOITzzhiw5KVt3jqwSFlIGxKFLDrGRi4UoAGaqMFUzEEQKU6g9DO
 CeSJwMw5rkT+XNY5orWq+E2AZKXvEDCDx6sz3Z95k1OcP7LPbAH8tI9mcjmqS5py3cPU
 SibebYns5RcsffFuYSy7MSI6gQ0q0obhSbyX6IZHxRJOR0zN8GyCDTY9ThiSP660HEVq
 DF4w==
X-Gm-Message-State: APjAAAUolJOe9lbqMrlNF62ECieL+/rmnoevXyDC7iFTVGqXGHtkxZdh
 BvdXRYYPRPAYZml9SUx562Ny9GGSiaXg+8GzrTKMZg==
X-Google-Smtp-Source: APXvYqwKPfz9NyRn2oF9MWDRb468vWEVEVSpAJhAMlWa7UIAcvwsMUBqa1T9/kHfALiM8Hy9YxCbimbvaVKBifHLEWg=
X-Received: by 2002:a1c:6246:: with SMTP id w67mr6109478wmb.141.1580398077208; 
 Thu, 30 Jan 2020 07:27:57 -0800 (PST)
MIME-Version: 1.0
References: <20200122112952.94284-1-anup.patel@wdc.com>
 <20200122112952.94284-3-anup.patel@wdc.com>
 <mhng-89da94b9-64c1-43e7-ae24-5a21ffc6d695@palmerdabbelt-glaptop1>
In-Reply-To: <mhng-89da94b9-64c1-43e7-ae24-5a21ffc6d695@palmerdabbelt-glaptop1>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 30 Jan 2020 20:57:45 +0530
Message-ID: <CAAhSdy24G9WTN42J65DfbsFXTf2vVyO8oinHD2ZoeZU311P_ng@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] hw/riscv: Provide rdtime callback for TCG in CLINT
 emulation
To: Palmer Dabbelt <palmerdabbelt@google.com>
Cc: Anup Patel <Anup.Patel@wdc.com>, Peter Maydell <peter.maydell@linaro.org>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Atish Patra <Atish.Patra@wdc.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::341
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
X-List-Received-Date: Thu, 30 Jan 2020 15:28:01 -0000

On Thu, Jan 30, 2020 at 8:19 PM Palmer Dabbelt <palmerdabbelt@google.com> wrote:
>
> On Wed, 22 Jan 2020 11:30:36 GMT (+0000), Anup Patel wrote:
> > This patch extends CLINT emulation to provide rdtime callback for
> > TCG. This rdtime callback will be called wheneven TIME CSRs are
> > read in privileged modes.
> >
> > Signed-off-by: Anup Patel <anup.patel@wdc.com>
> > Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> > ---
> >  hw/riscv/sifive_clint.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/hw/riscv/sifive_clint.c b/hw/riscv/sifive_clint.c
> > index e5a8f75cee..805503dc27 100644
> > --- a/hw/riscv/sifive_clint.c
> > +++ b/hw/riscv/sifive_clint.c
> > @@ -236,6 +236,7 @@ DeviceState *sifive_clint_create(hwaddr addr, hwaddr size, uint32_t num_harts,
> >          if (!env) {
> >              continue;
> >          }
> > +        riscv_cpu_set_rdtime_fn(env, cpu_riscv_read_rtc);
> >          env->timer = timer_new_ns(QEMU_CLOCK_VIRTUAL,
> >                                    &sifive_clint_timer_cb, cpu);
> >          env->timecmp = 0;
> > --
> > 2.17.1
>
> Can you make this optional?  Ideally via a command-line argument, but at a
> minimum as via the board configuration files.  As it stands this will enable
> the direct rdtime implemnetation everywhere, and while that's sensible for the
> virt board I'd prefer to avoid changing the behavior of the sifive_u board in
> ways that differ from the hardware when that's easy.

Command-line will unnecessary make things complicated for users.

I think the better option is to make it board specific so that we can
emulate exact HW behaviour in QEMU. This way since real-world
SiFive unleashed board does not have TIME CSR even QEMU will
not emulate TIME CSR for "sifive_u" machine. For now, we should
definitely emulate TIME CSR for virt machine because of the
performance improvement.

Regards,
Anup

