Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jRFIX-0005Kp-2r
	for mharc-qemu-riscv@gnu.org; Wed, 22 Apr 2020 09:20:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52786)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bmeng.cn@gmail.com>) id 1jRFIU-0005J0-6P
 for qemu-riscv@nongnu.org; Wed, 22 Apr 2020 09:20:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <bmeng.cn@gmail.com>) id 1jRFIT-0006tD-Cr
 for qemu-riscv@nongnu.org; Wed, 22 Apr 2020 09:20:13 -0400
Received: from mail-yb1-xb43.google.com ([2607:f8b0:4864:20::b43]:44341)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1jRFIS-0006rU-VC; Wed, 22 Apr 2020 09:20:13 -0400
Received: by mail-yb1-xb43.google.com with SMTP id o139so1140358ybc.11;
 Wed, 22 Apr 2020 06:20:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=97m0/4ZysN3isvQJ9AHdM4ybafTxpnR1Ka/HbolmuMU=;
 b=gpidqnK4K+QqKXfiSNHGt5oten0DTmajtpOl9xBqigfcXcsvUWMxo7XejDiWUb8TCN
 jqatUY4yxCqTLSCen4CpUJC4t+zbrXuoh3TvMCMrSupZQ9RCgKsxCW+NxcH6KtegFxcT
 0FJEVn266zoSYwJgj586/9t1tiYNhmTb9+lrl6C/ZupY0Ex2bPiRD/VzcGAx4gRWaiqX
 BHC+dKRBbI9S6Pf1fU3wBQiw+peVJyIAZHIhX+Y4nGHkSZXeb/vOJMGBPe3bodel9Kgw
 fdBi0nPeIeH5Gw/GcG1/oL1sRR8NGDwv/0nt7LGyD3l3zj2TqlfvFReMAj29itIHVfpb
 17Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=97m0/4ZysN3isvQJ9AHdM4ybafTxpnR1Ka/HbolmuMU=;
 b=Pmh2+g2HFA5n2g4+bwgxNSbBXossxUy/tW+gtUEqZsLMLVpiDFxNvyqmSVi8wrW+pc
 ZfDUnxjpuf43yO7O3iD/KPHW+XPoXRMlnuO/aptkGr/iFPejZoLHYs07MuuSFWTEPnYD
 Ca1ubXl94+2Q8Z9wS9UbDOCppKEkbUtOJz2wy+ThEfPF1UVYD2mjNCFb0pAve10P/kRV
 3f8kFtSa88+QsQ041Z2QF/iG3laVPBzUNpeSad3NRy5JdXIMrV865zy+6qg9keMnYQyo
 LbEfoL9Qa+DkS2/1jQjmCq38YYNqasYuEBgYgzYF5DlzvTYFdpokC+gW4vFUpeVW1CHs
 VXKQ==
X-Gm-Message-State: AGi0Puatj1YnTxOqpxqUfLgjImzXx2YHFm//c8VRn7VohoOa6WMte0h0
 dhoCMx1Kt+AgYpbkxG4NsUwA06U5tYR85jChoh4=
X-Google-Smtp-Source: APiQypIq/vgM0hu1QpEkwrbJ8CGzV3og+Jhvrv0Qz1A55NAOT+ZDSFgfHIQFYWcpvXgbF6XCQ8FDjNidFpKd1h2+WnU=
X-Received: by 2002:a25:a0c2:: with SMTP id i2mr6994617ybm.203.1587561611236; 
 Wed, 22 Apr 2020 06:20:11 -0700 (PDT)
MIME-Version: 1.0
References: <1587389038-1549-1-git-send-email-bmeng.cn@gmail.com>
 <CAKmqyKMzUzHC1FhV6ccjswjRvQH_h6DuUwEWjte4CAEmxPOKDg@mail.gmail.com>
 <CAEUhbmUTEVPF6f91SqrXL-_M-G_Jg2D29cBjbCs1YBGm2fk6QA@mail.gmail.com>
 <CAEUhbmWsNmTTTFz66M4sK-pEtEMOhfoYzCHYVyEF4AJ2X02twA@mail.gmail.com>
 <bd7da39b-4ece-7e72-a0a0-1d401c3b8c34@redhat.com>
 <CAEUhbmWCNGTn34wGSUvbwAbuY15VeDPPnFF2em4=XKEH5kReKw@mail.gmail.com>
 <f70626ab-3527-475e-de97-b399cc1d378c@redhat.com>
In-Reply-To: <f70626ab-3527-475e-de97-b399cc1d378c@redhat.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 22 Apr 2020 21:19:58 +0800
Message-ID: <CAEUhbmUo7NTXGrOKKnKu9GWmG3LEkc3C+9i3ZPN9d0A7YVJO-Q@mail.gmail.com>
Subject: Re: [PATCH] roms: opensbi: Upgrade from v0.6 to v0.7
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Cc: Anup Patel <anup.patel@wdc.com>, Alistair Francis <alistair23@gmail.com>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Palmer Dabbelt <palmerdabbelt@google.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b43;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb43.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2607:f8b0:4864:20::b43
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
X-List-Received-Date: Wed, 22 Apr 2020 13:20:14 -0000

On Wed, Apr 22, 2020 at 6:04 PM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> On 4/22/20 11:50 AM, Bin Meng wrote:
> > On Wed, Apr 22, 2020 at 4:15 PM Philippe Mathieu-Daud=C3=A9
> > <philmd@redhat.com> wrote:
> >>
> >> On 4/22/20 3:30 AM, Bin Meng wrote:
> >>> Hi Alistair,
> >>>
> >>> On Tue, Apr 21, 2020 at 9:34 AM Bin Meng <bmeng.cn@gmail.com> wrote:
> >>>>
> >>>> Hi Alistair,
> >>>>
> >>>> On Tue, Apr 21, 2020 at 2:41 AM Alistair Francis <alistair23@gmail.c=
om> wrote:
> >>>>>
> >>>>> On Mon, Apr 20, 2020 at 6:25 AM Bin Meng <bmeng.cn@gmail.com> wrote=
:
> >>>>>>
> >>>>>> Upgrade OpenSBI from v0.6 to v0.7 and the pre-built bios images.
> >>>>>>
> >>>>>> The v0.7 release includes the following commits:
> >>>>>>
> >>>>>> f64f4b9 lib: Add a new platform feature to bringup secondary harts
> >>>>>> b677a9b lib: Implement hart hotplug
> >>>>>> 5b48240 lib: Add possible hart status values
> >>>>>> e3f69fc lib: Implement Hart State Management (HSM) SBI extension
> >>>>>> 6704216 lib: Check MSIP bit after returning from WFI
> >> [...]
> >>>>>> 6c7922e lib: Support vector extension
> >>>>>> 615587c docs: Update README about supported SBI versions
> >>>>>> 66d0184 lib: Allow overriding SBI implementation ID
> >>>>>> 9f1b72c include: Bump-up version to 0.7
> >>
> >> The git-short-log in the commit message is very appreciated, thanks.
> >>
> >>>>>>
> >>>>>> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
> >>>>>
> >>>>> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> >>>>>
> >>>>> Can you share a git branch with this patch? From memory these binar=
y
> >>>>> patches don't apply well from emails.
> >>
> >> Indeed. These patches are good candidate to use the 'git-format-patch
> >> --no-binary' option with a link to a git repository to fetch the full
> >> commit:
> >>
> >
> > Some other project mailing lists do not prevent binary patch mails. If
> > this is QEMU convention, I suggest we document this in
> > https://wiki.qemu.org/Contribute/SubmitAPatch.
>
> This is not a convention, but a personal suggestion. QEMU mailing list
> don't have this limitation AFAIK. However some MTA do weird things when
> relaying encoded binaries, and the result is patch are simply not
> applicable.
> Also such large (broken) mails are a pain when your mailbox has quota.
>
> I added this entry:
> https://wiki.qemu.org/Contribute/SubmitAPatch#Avoid_posting_large_binary_=
blob

Thanks for updating the QEMU WiKi. Looks good to me.

>
> >
> >>     --no-binary
> >>       Do not output contents of changes in binary files,
> >>       instead display a notice that those files changed.
> >>       Patches generated using this option cannot be applied
> >>       properly, but they are still useful for code review.
> >>
> >>>>
> >>>> Sure. Please grab the bits from http://github.com/lbmeng/qemu opensb=
i branch.
> >>>>
> >>>> You can also use patchwork to help with your custodian work.
> >>>> http://patchwork.ozlabs.org/project/qemu-devel/patch/1587389038-1549=
-1-git-send-email-bmeng.cn@gmail.com/
> >>>>
> >>>> Click on the "mbox" button to download the patch and apply it.
> >>>
> >>> Will this be 5.0, or 5.1?
> >>
> >> Unlikely 5.1, too late.
> >
> > I am fine. Just wanted to know the strategy of which QEMU release to
> > ship which OpenSBI release. +Anup in case he has some comments.
>
> Well I'm not taking any decision here, I'm simply sharing the impression
> I have after reading the thread between Palmer and Peter:
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg697142.html
> You can still ask Alistair to insist to Peter, but you'd need a strong
> reason :)

Yes, I see that. Unfortunately that patch series was not put in the
RISC-V queue in time and missed the merge window. Sigh.

Regards,
Bin

