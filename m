Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hdMSQ-0007SC-MA
	for mharc-qemu-riscv@gnu.org; Tue, 18 Jun 2019 18:20:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49677)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <alistair23@gmail.com>) id 1hdMSO-0007K4-DY
 for qemu-riscv@nongnu.org; Tue, 18 Jun 2019 18:20:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair23@gmail.com>) id 1hdMSN-0001fJ-Dt
 for qemu-riscv@nongnu.org; Tue, 18 Jun 2019 18:20:00 -0400
Received: from mail-lj1-x241.google.com ([2a00:1450:4864:20::241]:43249)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alistair23@gmail.com>)
 id 1hdMSK-0001cI-Su; Tue, 18 Jun 2019 18:19:57 -0400
Received: by mail-lj1-x241.google.com with SMTP id 16so1129197ljv.10;
 Tue, 18 Jun 2019 15:19:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aAJWVVec2Jigq26RokbFHtvW8G9YhYkNmX2iMrQF5lE=;
 b=dS55AJCvYsoR8xfgTZb+RtYoek/PKIsQgOxQz3xxCXgslJcut/r8rOxGTPgrsfe1g0
 4hoUInawsIu+kAR4pEXzKDfcz9ceL5znGyRZSBSX08hlB0J0HDJNl8ITxYQDz13/zvLn
 Mj2agxTyFJ6L/FkAwc2RFopsqwkI3YDDx4tFZ05PwvhDEglmJ7clNV/qZ84zi6cuyJA6
 4PT8KZbcYyawR2LRGGoi7RVMc+XK2aW4EAMR3uCgVNXUibgrbRY6TK/EHPkT+EPQmRve
 T+l1Ee+3/intZYTz4JcFzi0YnnBynkIsnGli/035ruGi3ku0cD5erI6wamxUPNoa/OUc
 JAUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aAJWVVec2Jigq26RokbFHtvW8G9YhYkNmX2iMrQF5lE=;
 b=tdDhUxPA3AzJ9Iy59wT6E6D/rfe69/PUPXE5bL9r+aCCQW02z6CfRKOZhk3a4sI/sI
 yN1HbinwR0TqZPdFm4rPftU8sYR8nK4i3X11PwpZFtzAchCK1o+ppkMP3kDDyUcVKvkw
 Ux0vW5Dy/n3iWviQIv90AXhwQ+BT/Wt7rabXJP/yjUOxYlP9dsugjZO3LP29KfULv85F
 C1hhFS1/kfMqkcvTvLqvQYoRVWI5N1uVC3crRrtZiwLb7MkLfbGFlB7VBGWToy8fiGvo
 tWM6buka6qEiyWMyouyVYvzHF8ecqW7NTC4vD7JYpEBZJWBG4cz+7N+WNuKNHeJFrbo9
 O5mw==
X-Gm-Message-State: APjAAAVELoumjpDj59QhUVRolHLnplRFRaUBkfxk2+Q4w/7z9Q8oU5qF
 Sy4YAEogCe9q1ehl+47lLpu9SVs3zqfVddXgL/Yvel/i
X-Google-Smtp-Source: APXvYqwlVDRjRKxSxiUCkwiCpZcGt/auKl/RQmuJj4z23mhf2qXLrj3mMH04/KSk99wm0T7jbaPuzVpjEEURGelJy0g=
X-Received: by 2002:a2e:9758:: with SMTP id f24mr12553772ljj.58.1560896395174; 
 Tue, 18 Jun 2019 15:19:55 -0700 (PDT)
MIME-Version: 1.0
References: <CAKmqyKMs4nt0eddFkXHG9vOdxnj=yB8jx8s9NivNiwvVg8TObA@mail.gmail.com>
 <mhng-03d5c9ed-4818-4efc-99e0-cdceab2eab3d@palmer-si-x1e>
In-Reply-To: <mhng-03d5c9ed-4818-4efc-99e0-cdceab2eab3d@palmer-si-x1e>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 18 Jun 2019 15:17:07 -0700
Message-ID: <CAKmqyKOE11M=yn_xbHG3yGDLzC8tCNjL3MkkW54Zu=EjwrVa6A@mail.gmail.com>
To: Palmer Dabbelt <palmer@sifive.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, 
 Alistair Francis <Alistair.Francis@wdc.com>, onathan@fintelia.io
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::241
Subject: Re: [Qemu-riscv] RISC-V: Include ROM in QEMU
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
X-List-Received-Date: Tue, 18 Jun 2019 22:20:01 -0000

On Fri, Jun 7, 2019 at 5:03 PM Palmer Dabbelt <palmer@sifive.com> wrote:
>
> On Thu, 06 Jun 2019 16:22:47 PDT (-0700), alistair23@gmail.com wrote:
> > Hello,
> >
> > As a test of the waters, how would the QEMU community feel about
> > including the RISC-V OpenSBI project as a ROM submodule?
> >
> > The idea would be to have OpenSBI (similar to ATF for ARM and a BIOS
> > for x86) included by default to simplify the QEMU RISC-V boot process
> > for users. This would remove the requirement for users/developers to
> > build a RISC-V firmware. The goal here is to allow people to just
> > download and run their kernel as easily as they currently do for x86.
> >
> > We would make sure that it can be disabled! That is users/developers
> > can use their own (or none) if they want to. The idea here is just to
> > simplify the boot process, not lock anyone out.
>
> I like it.  My only question is about the mechanics of doing so: are we just
> going to assume there's a cross compiler in PATH?  I guess that's less of a
> usability headache than needing a complier and a firmware.

It looks like we will include a binary in the QEMU source and also
provide the option for users to compile it themselves.

Alistair

