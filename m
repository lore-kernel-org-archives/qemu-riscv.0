Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hf3fd-0005q0-5e
	for mharc-qemu-riscv@gnu.org; Sun, 23 Jun 2019 10:40:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37650)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <palmer@dabbelt.com>) id 1hf3fT-0005kc-Um
 for qemu-riscv@nongnu.org; Sun, 23 Jun 2019 10:40:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1hf3fR-0007ak-QG
 for qemu-riscv@nongnu.org; Sun, 23 Jun 2019 10:40:31 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:41500)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1hf3fP-0007UQ-SH
 for qemu-riscv@nongnu.org; Sun, 23 Jun 2019 10:40:28 -0400
Received: by mail-pf1-f194.google.com with SMTP id m30so6017671pff.8
 for <qemu-riscv@nongnu.org>; Sun, 23 Jun 2019 07:40:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=YOaEEFBPvcxvJgGpPlut+YjkH80smJ/PfSeMe5hChqs=;
 b=UsbUZwKSapQvF8OE7QwOUNAl1xQjiFBE515JYjstep7Nw8SBsF8iKJgGOrbhovxDAJ
 HQKhqJ4dgncrgXCV5RrphWSI0fvW2/qr7/c2+sO2WtjQbSz4PrxN0Ygkw5D9ajYKE9ub
 BTcEfHES5v8k97ObaFwzrWD3EWjauCFP0+KQVmwAkmKMGBYFB5CklNynNva1nCQFnO8p
 uKElApS7oQ4KOFjXO3UkEe+0V2+6A7geNniZ3iZYggio+H5shH0oz5xm3s2GICqR9xzn
 iScpx5pG/KcFbSEkhJavZDVPsZEyNtvnQIppouUYyS9bN9+M4V7XZQGa/WG2+gq3ASHr
 fQwQ==
X-Gm-Message-State: APjAAAWU9F2l7Urm+FIwRoLyhagbDbTPnAkezwXgqIm73B/ljxdNY4Gx
 NUTQcdPQp2xS/DJ/ZQCNlgYt1Yj0y6gdfA==
X-Google-Smtp-Source: APXvYqxJTPlS1dynC7CdvgHst5UxCqt2P+bLFyIqSmSvXt88SUbIMeJ53pASlYMCRoKkFfhxywCiJA==
X-Received: by 2002:a63:52:: with SMTP id 79mr27987392pga.381.1561300826774;
 Sun, 23 Jun 2019 07:40:26 -0700 (PDT)
Received: from localhost (220-137-89-38.dynamic-ip.hinet.net. [220.137.89.38])
 by smtp.gmail.com with ESMTPSA id
 y22sm16155091pfo.39.2019.06.23.07.40.25
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sun, 23 Jun 2019 07:40:26 -0700 (PDT)
Date: Sun, 23 Jun 2019 07:40:26 -0700 (PDT)
X-Google-Original-Date: Sat, 22 Jun 2019 23:30:01 PDT (-0700)
In-Reply-To: <CAKmqyKM0WBjwK+TjoJnhBOTTaAgeSeB5ATUpRgKGvxvw35Cvdg@mail.gmail.com>
CC: Alistair Francis <Alistair.Francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
From: Palmer Dabbelt <palmer@sifive.com>
To: alistair23@gmail.com
Message-ID: <mhng-ff7e9f1e-0b1a-425f-b386-ab6c2732cf24@palmer-si-x1e>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.210.194
Subject: Re: [Qemu-riscv] [PATCH v1 0/9] Update the RISC-V specification
 versions
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
X-List-Received-Date: Sun, 23 Jun 2019 14:40:33 -0000

On Fri, 21 Jun 2019 17:23:44 PDT (-0700), alistair23@gmail.com wrote:
> On Thu, Jun 20, 2019 at 7:49 PM Palmer Dabbelt <palmer@sifive.com> wrote:
>>
>> On Wed, 19 Jun 2019 07:19:38 PDT (-0700), alistair23@gmail.com wrote:
>> > On Wed, Jun 19, 2019 at 3:58 AM Palmer Dabbelt <palmer@sifive.com> wrote:
>> >>
>> >> On Mon, 17 Jun 2019 18:31:00 PDT (-0700), Alistair Francis wrote:
>> >> > Based-on: <cover.1555726824.git.alistair.francis@wdc.com>
>> >> >
>> >> > Now that the RISC-V spec has started to be ratified let's update our
>> >> > QEMU implementation. There are a few things going on here:
>> >> >  - Add priv version 1.11.0 to QEMU
>> >> >     - This is the ratified version of the Privledge spec
>> >> >     - There are almost no changes to 1.10
>> >> >  - Mark the 1.09.1 privledge spec as depreated
>> >> >      - Let's aim to remove it in two releases
>> >> >  - Set priv version 1.11.0 as the default
>> >> >  - Remove the user_spec version
>> >> >      - This doesn't really mean anything so let's remove it
>> >> >  - Add support for the "Counters" extension
>> >> >  - Add command line options for Zifencei and Zicsr
>> >>
>> >> Thanks!  I'll look at the code, but I've currently got this queued up behind
>> >> your hypervisor patches so it might take a bit.  LMK if you want me to invert
>> >> the priority on these.  I'll probably be buried until the start of July.
>> >
>> > Let's move the Hypervisor patches to the back then. There is a new
>> > spec version now anyway so I'll have to update them for that.
>>
>> OK.  Do you want me to just drop them and wait for a v2 / draft 0.4?
>
> I haven't looked at the 0.4 yet, but I think there are still lots of
> similarities so let's just put Hypervisor patches at the back of the
> list and see if you get there. It would still be nice to have comments
> on the v1.

Works for me.  I'm in Taiwan this week but I'm at the office, so with any luck
I'll have some time to actually work.

>
> Alistair
>
>>
>> >
>> > Alistair
>> >
>> >>
>> >> > We can remove the spec version as it's unused and has never been exposed
>> >> > to users. The idea is to match the specs in specifying the version. To
>> >> > handle versions in the future we can extend the extension props to
>> >> > handle version information.
>> >> >
>> >> > For example something like this: -cpu rv64,i=2.2,c=2.0,h=0.4,priv_spec=1.11
>> >> >
>> >> > NOTE: This isn't supported today as we only have one of each version.
>> >> >
>> >> > This will be a future change if we decide to support multiple versions
>> >> > of extensions.
>> >> >
>> >> > The "priv_spec" string doesn't really match, but I don't have a better
>> >> > way to say "Machine ISA" and "Supervisor ISA" which is what is included
>> >> > in "priv_spec".
>> >> >
>> >> > For completeness I have also added the Counters, Zifencei and Zicsr
>> >> > extensions.
>> >> >
>> >> > Everything else seems to match the spec names/style.
>> >> >
>> >> > Please let me know if I'm missing something. QEMU 4.1 is the first
>> >> > release to support the extensions from the command line, so we can
>> >> > easily change it until then. After that it'll take more work to change
>> >> > the command line interface.
>> >> >
>> >> > Alistair Francis (9):
>> >> >   target/riscv: Restructure deprecatd CPUs
>> >> >   target/riscv: Add the privledge spec version 1.11.0
>> >> >   target/riscv: Comment in the mcountinhibit CSR
>> >> >   target/riscv: Set privledge spec 1.11.0 as default
>> >> >   qemu-deprecated.texi: Deprecate the RISC-V privledge spec 1.09.1
>> >> >   target/riscv: Require either I or E base extension
>> >> >   target/riscv: Remove user version information
>> >> >   target/riscv: Add support for disabling/enabling Counters
>> >> >   target/riscv: Add Zifencei and Zicsr as command line options
>> >> >
>> >> >  qemu-deprecated.texi                          |  8 +++
>> >> >  target/riscv/cpu.c                            | 72 ++++++++++---------
>> >> >  target/riscv/cpu.h                            | 19 ++---
>> >> >  target/riscv/cpu_bits.h                       |  1 +
>> >> >  target/riscv/csr.c                            | 13 +++-
>> >> >  .../riscv/insn_trans/trans_privileged.inc.c   |  2 +-
>> >> >  6 files changed, 71 insertions(+), 44 deletions(-)

