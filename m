Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iSm9X-0006yk-ON
	for mharc-qemu-riscv@gnu.org; Thu, 07 Nov 2019 13:05:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58058)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alistair23@gmail.com>) id 1iSm9U-0006v3-Md
 for qemu-riscv@nongnu.org; Thu, 07 Nov 2019 13:05:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair23@gmail.com>) id 1iSm9T-0000Bf-II
 for qemu-riscv@nongnu.org; Thu, 07 Nov 2019 13:05:00 -0500
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242]:39827)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alistair23@gmail.com>)
 id 1iSm9T-00008F-Ar; Thu, 07 Nov 2019 13:04:59 -0500
Received: by mail-lj1-x242.google.com with SMTP id p18so3308800ljc.6;
 Thu, 07 Nov 2019 10:04:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FY24fOw6o4HBDCzH2lKR8yEr39lJrGQkhK0mEp6DnU0=;
 b=kW0ICBuq/asLGode1tllWIm2WPo6cyOXxwxYat7F7PwN1ukaIllVP0lZbq+/WT5zcX
 U6bHvhz6OTjVY7y6nR/jTqS9A9CQ23pK0lvjdyZriWwsqtUo2hwkXMtBdfyw1ORFLqly
 5214jwncrBJ7NJNuj+wUam6+ExD9K8I7/s1Biz9ylmB7MQpefYZQ8miC1N+A8Ayd4EWW
 W4ViHd+91q9+dD+6oSNL57tP21mjhGuiHpZv60n12+pxBmPKeWxlWyNFpGhiSoIyKr3v
 AIU3HLAgWRerCZUzM9PKi4S+SxL2kU1hi6Q/naXFWDI+DtOgtiQi8EZlwbikK8ifY//C
 E2mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FY24fOw6o4HBDCzH2lKR8yEr39lJrGQkhK0mEp6DnU0=;
 b=FR6vvhjFZ6ZpoVTwtnL/7SoXDmk0+9ElaQNJo+Zm+R2+l+sZYchE5ShxCFZxnTSMQk
 HCItRjnJ1O3LZ1L0eceBYnNdwmzsu1Qc7LasjDKOVUS6AftpfteabxFUQVb9WUmaCfit
 IsZTTuKbYwKuv1WssGb4OYPuJkrZBBHotQfoeGdtXcG/lhCcAykGD1EY2IaQyjLcL6Z0
 TvAdvZeqLMhGma3g5HkrjQvvkdY8bEb4QKritix5ZWnW/ahKjA4BOtS6InDoqhuOEetH
 Sycit7IKX+LDWGFg2hScINnNlc+KPKAfYcTEdu6bBgyG5f1E3k92ogFL67kHIuviw2yD
 /CaA==
X-Gm-Message-State: APjAAAV8X61jQrhDNsd6RhdLKvT2aa9nnDhWLehrI7zJgxoKyNQLqnI6
 pEH9IRfOo2eqJaqWRu2cj/a/njOLZ6AB+XuvvM0=
X-Google-Smtp-Source: APXvYqxJ84EGuov2NfXuqi04FmIKBIObByn+b93KQMt6HEEw0j8OQjdVXgAXHrn1RNBmPvZkYVtzwa8LjTQYLZfXpTs=
X-Received: by 2002:a2e:8188:: with SMTP id e8mr3379608ljg.152.1573149897847; 
 Thu, 07 Nov 2019 10:04:57 -0800 (PST)
MIME-Version: 1.0
References: <03c2f42b32fb4e304319c241122ae83584f085e0.1573087610.git.alistair.francis@wdc.com>
 <mhng-35530489-a164-4825-90da-e550083fef9d@palmer-si-x1c4>
 <CAFEAcA8YU5pp5xwqJSBqLtChp1WFmGFLUsHjnWPGk6+k1MtV3Q@mail.gmail.com>
In-Reply-To: <CAFEAcA8YU5pp5xwqJSBqLtChp1WFmGFLUsHjnWPGk6+k1MtV3Q@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 7 Nov 2019 09:59:15 -0800
Message-ID: <CAKmqyKPy4e_Q6iS63Zuqk2fTwMcVAznACrU+0-NN0BCVbh0pDw@mail.gmail.com>
Subject: Re: [PATCH for 4.2 v1 1/1] riscv/virt: Increase flash size
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Palmer Dabbelt <palmer@sifive.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::242
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
X-List-Received-Date: Thu, 07 Nov 2019 18:05:02 -0000

On Thu, Nov 7, 2019 at 10:01 AM Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Thu, 7 Nov 2019 at 17:09, Palmer Dabbelt <palmer@dabbelt.com> wrote:
> >
> > On Wed, 06 Nov 2019 16:47:20 PST (-0800), Alistair Francis wrote:
> > > Coreboot developers have requested that they have at least 32MB of flash
> > > to load binaries. We currently have 32MB of flash, but it is split in
> > > two to allow loading two flash binaries. Let's increase the flash size
> > > from 32MB to 64MB to ensure we have a single region that is 32MB.
> > >
> > > No QEMU release has include flash in the RISC-V virt machine, so this
> > > isn't a breaking change.
> >
> > Even if we had, I wouldn't consider it a breaking change because it adds to
> > the memory map so existing programs will continue to run fine.
>
> I have a feeling you may find that some old command lines won't
> work any more because they specified a flash contents binary
> that was the old 32MB and now it needs to be padded out to 64MB.

Yes, that is correct. Everyone using -pflash will need to change the
size of their binaries. This was only just merged into QEMU master
though and hasn't been in a release so I don't think many people are
using it.

I only know of two users, one is me and someone from Coreboot who
requested the larger size. It doesn't seem like a problem users will
see.

Alistair

> But I haven't tested whether this theory is correct (it will
> depend on how the flash contents are specified -- --bios will
> be ok, as will loading contents directly as an ELF file or
> similar, specifying contents by a -drive option intended to be
> consumed by the pflash is the case which likely needs extra padding.)
>
> thanks
> -- PMM

