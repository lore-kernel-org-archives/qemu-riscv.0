Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kFxDQ-00006E-BB
	for mharc-qemu-riscv@gnu.org; Wed, 09 Sep 2020 06:20:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1kFxDN-0008Tg-Rt; Wed, 09 Sep 2020 06:20:33 -0400
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:36057)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1kFxDL-0003Wn-M3; Wed, 09 Sep 2020 06:20:33 -0400
Received: by mail-pf1-x444.google.com with SMTP id d9so1761867pfd.3;
 Wed, 09 Sep 2020 03:20:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZLkT7w98LPmkCt3TSXG6BXZLILHPsUd1j02KoxHSXhc=;
 b=UDAJuKRqNxabaEIoLX9z2fi8tvoYMCRsFa4BMheB4VHfGylM6V9/AgEd5yS+BlKiy1
 5I3QcMIYi7Ehvx7CH+Wab4RfxDPVm04nl7OjCr21W5KBC/SrdNvCt4p+NGqoqAriLuY0
 yAmNoWR5a1VHaERb9ZK/2KWL045nySUbk95cZaKKq+Vaewb5NnK3eAJeF0x3TgegurK4
 GGobWL3fNdNkP58v/4GG3S75J8q9JDnxZlGH+Um1wBVKjelBtuBe+ZwkwKiHnB2Lnwbj
 wE+InLu3nghTzKGLt6Hp727XXZo5Cyd7kLQzXYAwnNwf6RE3DkZsoCkTdW7EAH/0cRpA
 4PKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZLkT7w98LPmkCt3TSXG6BXZLILHPsUd1j02KoxHSXhc=;
 b=UrChvJryWR0remJ68wCm8lwchrhdzPrlwNRfXYtg2PWGT/YXOc44tAWj5nivBSCpQC
 iF2zJxbtMKiMmmbSlt1LM3o33A6TW9H6DRVoyhQ03RmEvkL+/hGw/vdBUk/9ZqlvkLgi
 JtPo3TX7KpR98zAVwdWa2HI4jg4rNnZCdTMld6MybSsRUejTfm8wSbHORhWl2e36G+Ll
 hkprViZ1CHNsUB0T24KLIvFAaNzI7PlfAHJSWXnodqPrvC3coOrn4cjP7iI72cgLLnz4
 R0nbJgQ+3uz0IiKxl4NFGieijgVF+M1z+1KVJIA+ENr7BuKU7JVimYNVeGB1a0mJe6/J
 MeeQ==
X-Gm-Message-State: AOAM530CtooQU+RYiuXOQSb69Se6aXBoroEhsBuR66fo4M2RcZwRf5lD
 MiPvAkA9/oO1IPQv9NiPgra6PB4lhoh0lls0DuA=
X-Google-Smtp-Source: ABdhPJwhZQ0MR7oxhR5BVCF4Nuy3oFvUgkm+RuYuMp7nG+cAOVB42Z9mUTceJ7lx4fs7ZIL2Pugdec6HoVEMDz9h9i8=
X-Received: by 2002:a17:902:7895:b029:d0:89f4:621c with SMTP id
 q21-20020a1709027895b02900d089f4621cmr255144pll.4.1599646829254; Wed, 09 Sep
 2020 03:20:29 -0700 (PDT)
MIME-Version: 1.0
References: <20200813052257.226142-1-stefanha@redhat.com>
 <CAFEAcA-OMwaMbrp60Gd3URMykAxOxd0+_SogW13VCRCnhn6JHw@mail.gmail.com>
In-Reply-To: <CAFEAcA-OMwaMbrp60Gd3URMykAxOxd0+_SogW13VCRCnhn6JHw@mail.gmail.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Wed, 9 Sep 2020 11:20:17 +0100
Message-ID: <CAJSP0QWBk0=8d78VrpSFvbBEnYdzR_cWmvYXibYnQWGnAPTShA@mail.gmail.com>
Subject: Re: [PULL 0/9] Tracing patches
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Stefan Hajnoczi <stefanha@redhat.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, 
 QEMU Developers <qemu-devel@nongnu.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Li Zhijian <lizhijian@cn.fujitsu.com>, Qemu-block <qemu-block@nongnu.org>, 
 Juan Quintela <quintela@redhat.com>, David Hildenbrand <david@redhat.com>, 
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, 
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, David Gibson <david@gibson.dropbear.id.au>,
 Kevin Wolf <kwolf@redhat.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Max Reitz <mreitz@redhat.com>, 
 Zhang Chen <chen.zhang@intel.com>, qemu-ppc <qemu-ppc@nongnu.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>, 
 Stefan Berger <stefanb@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::444;
 envelope-from=stefanha@gmail.com; helo=mail-pf1-x444.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 09 Sep 2020 10:20:34 -0000

On Fri, Aug 21, 2020 at 5:26 PM Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Thu, 13 Aug 2020 at 08:44, Stefan Hajnoczi <stefanha@redhat.com> wrote:
> >
> > The following changes since commit d0ed6a69d399ae193959225cdeaa9382746c91cc:
> >
> >   Update version for v5.1.0 release (2020-08-11 17:07:03 +0100)
> >
> > are available in the Git repository at:
> >
> >   https://github.com/stefanha/qemu.git tags/tracing-pull-request
> >
> > for you to fetch changes up to bd6c9e56aba2e1b9a307642c72375386afbcf1f2:
> >
> >   trace-events: Fix attribution of trace points to source (2020-08-12 20:28:5=
> > 4 +0100)
> >
> > ----------------------------------------------------------------
> > Pull request
> >
> > macOS dtrace support and cleanups.
>
> Hi; this conflicts with the meson buildsystem merge, I'm
> afraid -- can you rebase and resend, please?

Sure, I will resend it.

Stefan

