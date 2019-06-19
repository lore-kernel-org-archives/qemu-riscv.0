Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hdilu-0006wF-3k
	for mharc-qemu-riscv@gnu.org; Wed, 19 Jun 2019 18:09:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60173)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <alistair23@gmail.com>) id 1hdilr-0006ta-Qw
 for qemu-riscv@nongnu.org; Wed, 19 Jun 2019 18:09:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair23@gmail.com>) id 1hdilq-0002j2-RZ
 for qemu-riscv@nongnu.org; Wed, 19 Jun 2019 18:09:35 -0400
Received: from mail-lj1-x241.google.com ([2a00:1450:4864:20::241]:47077)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alistair23@gmail.com>)
 id 1hdilo-0002eu-Jn; Wed, 19 Jun 2019 18:09:32 -0400
Received: by mail-lj1-x241.google.com with SMTP id v24so676624ljg.13;
 Wed, 19 Jun 2019 15:09:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MKDh+n9uB7E/g/10x/dOQPcXAjCFeBAUMOPTkg4idJE=;
 b=T9UgrwWagX04BOQsxn2Wg+aZU/Uqg6prSikZYjXivojmdohxC70gMxu4EWeyatBWSm
 gWbW9xlokn1NXW33vi6kO6sn7w9xDIPShN+bory5MSg0KJGafas1sFVwx8rQOAnvyF03
 2XPsx69LFcnJiFo2jf1TiNZyzEb+yQc7RFltgpmgkKfcETlePKXb2W/qEKHfd5RVY9/h
 j2A+A9/fbYUygOhtZ6/BFO8ezTJCnMFlI7klL+iood2a8BvJTjSV2DPkVFhVnZvLs05Y
 xVdr666osdZ8bvtSVZpk3iiYZ8Ns8DWMrddz/LIAwYV/q+zj0O+IildtXy1CeNX/pQQS
 YewQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MKDh+n9uB7E/g/10x/dOQPcXAjCFeBAUMOPTkg4idJE=;
 b=GALNWmC1kYs0Ec/zQYaSKgeER8rTAyMykl0+xvLxO78A/CEO4kuRKMfY6rIq2BM/mo
 bV2SZdGSl/bJ0i0FNleh6aLSA+LK6lTUFAF5zUEuP+Zl/zaazDFVpwo7XWBEhakyF7Dj
 5g58KsK3XhPY9/xM4HOnRMiTBSxI7exmCgDwZvaI/QyauaHFb1VWVw5LT43HJj35pHTn
 X9xN1mnNcp3BEwYoaWayYb432BcqVvkGFuqmD8T7mCOqIWvBcgPZt3pZEzvBYmkmHM9w
 rN8QLuZ9+bdOvPBvqkg2005Wg7utndOMy35fhtTmZd8oq6KM/bziNtMKDJj2VjNqsa3S
 N5Ug==
X-Gm-Message-State: APjAAAVNMKBorQYgAS+Ov6Pe92CKvzqcHqDQFrSS1lzHTiXiaWhzXT0V
 eEPiBk22UUzLMvQH7ssfFZCDq2H7Oz6qHnhEy68=
X-Google-Smtp-Source: APXvYqwAbO/wDhLJlunppjqdn5giHDzKwVac4oQvxUG14SplG232OOBGOOIDvNnITq4ap4J+wb2lRKk6LuaEBoprqg4=
X-Received: by 2002:a2e:5d83:: with SMTP id v3mr339846lje.196.1560982169334;
 Wed, 19 Jun 2019 15:09:29 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1560904640.git.alistair.francis@wdc.com>
 <99fc8fe28f2a0493f248d50d32d4b1bc649536ab.1560904640.git.alistair.francis@wdc.com>
 <CAEUhbmXKv7-r3KyDGnq8ysmyccy1tVgBDqwLcf46U96BZOiKYw@mail.gmail.com>
 <CAKmqyKMqWcx4-EhTrtLMdfLtid742=8exDNSQHmuxPf_7tHkaw@mail.gmail.com>
In-Reply-To: <CAKmqyKMqWcx4-EhTrtLMdfLtid742=8exDNSQHmuxPf_7tHkaw@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 19 Jun 2019 15:06:40 -0700
Message-ID: <CAKmqyKO_Rn1kwOsYk23EFNht6Ss6K05+1k=3Xvk=oJ-UDKsqFw@mail.gmail.com>
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@sifive.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::241
Subject: Re: [Qemu-riscv] [Qemu-devel] [RFC v1 3/5] hw/riscv: Extend the
 kernel loading support
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
X-List-Received-Date: Wed, 19 Jun 2019 22:09:36 -0000

On Wed, Jun 19, 2019 at 2:01 PM Alistair Francis <alistair23@gmail.com> wrote:
>
> On Wed, Jun 19, 2019 at 8:16 AM Bin Meng <bmeng.cn@gmail.com> wrote:
> >
> > On Wed, Jun 19, 2019 at 8:56 AM Alistair Francis
> > <alistair.francis@wdc.com> wrote:
> > >
> > > Extend the RISC-V kernel loader to support uImage and Image files.
> > > A Linux kernel can now be booted with:
> > >
> > >     qemu-system-riscv64 -machine virt -bios fw_jump.elf -kernel Image
> > >
> > > Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> > > ---
> > >  hw/riscv/boot.c | 19 ++++++++++++++-----
> > >  1 file changed, 14 insertions(+), 5 deletions(-)
> > >
> > > diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
> > > index 392ca0cb2e..7f68035a3f 100644
> > > --- a/hw/riscv/boot.c
> > > +++ b/hw/riscv/boot.c
> > > @@ -67,13 +67,22 @@ target_ulong riscv_load_kernel(MachineState *machine,
> > >      uint64_t kernel_entry, kernel_high;
> > >
> > >      if (load_elf(kernel_filename, NULL, kernel_translate, machine,
> > > -                 &kernel_entry, NULL, &kernel_high,
> > > -                 0, EM_RISCV, 1, 0) < 0) {
> > > -        error_report("could not load kernel '%s'", kernel_filename);
> > > -        exit(1);
> > > +                 &kernel_entry, NULL, &kernel_high, 0, EM_RISCV, 1, 0) > 0) {
> > > +        return kernel_entry;
> > > +    }
> > > +
> > > +    if (load_uimage_as(kernel_filename, &kernel_entry, NULL, NULL,
> > > +                       kernel_translate, machine, NULL) > 0) {
> >
> > We should not set the 'kernel_translate' here for uImage.
> >
> > In fact, the whole kernel_translate() is not necessary.
>
> I have removed the kernel_translate() function. I tested loading
> uImage files though and they don't seem to work as the image is loaded
> at the wrong address.
>
> I have removed uImage loading support from this series. We can look at
> it in the future if we decide we want it.

Ah, my mistake, it looks like my uImage wasn't built correctly. I'll
keep this in.

Alistair

>
> Alistair
>
> >
> > > +        return kernel_entry;
> > > +    }
> > > +
> >
> > Regards,
> > Bin

