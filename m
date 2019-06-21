Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1he9cg-0002sM-Ms
	for mharc-qemu-riscv@gnu.org; Thu, 20 Jun 2019 22:49:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59564)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <palmer@dabbelt.com>) id 1he9cd-0002qw-Cp
 for qemu-riscv@nongnu.org; Thu, 20 Jun 2019 22:49:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1he9cc-0007PG-0y
 for qemu-riscv@nongnu.org; Thu, 20 Jun 2019 22:49:51 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:43345)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1he9ca-0007K5-VD
 for qemu-riscv@nongnu.org; Thu, 20 Jun 2019 22:49:49 -0400
Received: by mail-pl1-f195.google.com with SMTP id cl9so2220652plb.10
 for <qemu-riscv@nongnu.org>; Thu, 20 Jun 2019 19:49:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=aw5wQUD3VPHO+OMY2qMWNTo++9Jftg7mvus/qfGsyqE=;
 b=e9kvS06CCWw/bX9gC4yGtPhCvflRJ2IpT3Ghw2oUskP8Q91NK+EYinhbZ/stMn+35J
 gK9G/+BLpO5mIC8Zgkv6QBNzqgYr6siWU6wTWMLaYv0IvWnWfJHki7Iy/FT6yLAeQs+w
 OF1L2h85SjqO09mbCQ6lw2TyXbERwSXokyD4JyZmOSvVrXUBExFYsJ1btPHB+ojhJtoC
 BJSFGoODKw7MmxXZS4ehST0w89avU2/P5ayho1lPi1NWpOoALCF/XHTKTs3uao9ngTu+
 YzNiBwNfwM0jTMgL+yaKRtX3f1ah5FKA3RW1bEQVqGVVLRhnul6Bc8UJJvF7rvVbwnHF
 Pcyw==
X-Gm-Message-State: APjAAAWBhwwjKVJy6iAhsydEC9Jw9aUlpnNydYvRprRy9KAgmf4XYNsj
 Cfy1O3SP/kuGkkNosBDH7CXrfg==
X-Google-Smtp-Source: APXvYqyfTMyEBgN9jjzkVHj92pAld7l8OPxCMiJDL7IwcJepCj6g1F4eYyELMa6BA8U7TNxYwl0QEQ==
X-Received: by 2002:a17:902:8f87:: with SMTP id
 z7mr100620972plo.65.1561085385651; 
 Thu, 20 Jun 2019 19:49:45 -0700 (PDT)
Received: from localhost (amx-tls3.starhub.net.sg. [203.116.164.13])
 by smtp.gmail.com with ESMTPSA id h21sm863887pgg.75.2019.06.20.19.49.43
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 20 Jun 2019 19:49:44 -0700 (PDT)
Date: Thu, 20 Jun 2019 19:49:44 -0700 (PDT)
X-Google-Original-Date: Thu, 20 Jun 2019 19:41:46 PDT (-0700)
In-Reply-To: <CAKmqyKPRWASwUPQUROPWyrNC8gXTnizXTaXYdpbEAmkfjOZo1g@mail.gmail.com>
CC: Alistair Francis <Alistair.Francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
From: Palmer Dabbelt <palmer@sifive.com>
To: alistair23@gmail.com
Message-ID: <mhng-2816be05-3e0d-4cb6-a39e-082b071f8ba2@palmer-si-x1e>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.214.195
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
X-List-Received-Date: Fri, 21 Jun 2019 02:49:53 -0000

On Wed, 19 Jun 2019 07:19:38 PDT (-0700), alistair23@gmail.com wrote:
> On Wed, Jun 19, 2019 at 3:58 AM Palmer Dabbelt <palmer@sifive.com> wrote:
>>
>> On Mon, 17 Jun 2019 18:31:00 PDT (-0700), Alistair Francis wrote:
>> > Based-on: <cover.1555726824.git.alistair.francis@wdc.com>
>> >
>> > Now that the RISC-V spec has started to be ratified let's update our
>> > QEMU implementation. There are a few things going on here:
>> >  - Add priv version 1.11.0 to QEMU
>> >     - This is the ratified version of the Privledge spec
>> >     - There are almost no changes to 1.10
>> >  - Mark the 1.09.1 privledge spec as depreated
>> >      - Let's aim to remove it in two releases
>> >  - Set priv version 1.11.0 as the default
>> >  - Remove the user_spec version
>> >      - This doesn't really mean anything so let's remove it
>> >  - Add support for the "Counters" extension
>> >  - Add command line options for Zifencei and Zicsr
>>
>> Thanks!  I'll look at the code, but I've currently got this queued up behind
>> your hypervisor patches so it might take a bit.  LMK if you want me to invert
>> the priority on these.  I'll probably be buried until the start of July.
>
> Let's move the Hypervisor patches to the back then. There is a new
> spec version now anyway so I'll have to update them for that.

OK.  Do you want me to just drop them and wait for a v2 / draft 0.4?

>
> Alistair
>
>>
>> > We can remove the spec version as it's unused and has never been exposed
>> > to users. The idea is to match the specs in specifying the version. To
>> > handle versions in the future we can extend the extension props to
>> > handle version information.
>> >
>> > For example something like this: -cpu rv64,i=2.2,c=2.0,h=0.4,priv_spec=1.11
>> >
>> > NOTE: This isn't supported today as we only have one of each version.
>> >
>> > This will be a future change if we decide to support multiple versions
>> > of extensions.
>> >
>> > The "priv_spec" string doesn't really match, but I don't have a better
>> > way to say "Machine ISA" and "Supervisor ISA" which is what is included
>> > in "priv_spec".
>> >
>> > For completeness I have also added the Counters, Zifencei and Zicsr
>> > extensions.
>> >
>> > Everything else seems to match the spec names/style.
>> >
>> > Please let me know if I'm missing something. QEMU 4.1 is the first
>> > release to support the extensions from the command line, so we can
>> > easily change it until then. After that it'll take more work to change
>> > the command line interface.
>> >
>> > Alistair Francis (9):
>> >   target/riscv: Restructure deprecatd CPUs
>> >   target/riscv: Add the privledge spec version 1.11.0
>> >   target/riscv: Comment in the mcountinhibit CSR
>> >   target/riscv: Set privledge spec 1.11.0 as default
>> >   qemu-deprecated.texi: Deprecate the RISC-V privledge spec 1.09.1
>> >   target/riscv: Require either I or E base extension
>> >   target/riscv: Remove user version information
>> >   target/riscv: Add support for disabling/enabling Counters
>> >   target/riscv: Add Zifencei and Zicsr as command line options
>> >
>> >  qemu-deprecated.texi                          |  8 +++
>> >  target/riscv/cpu.c                            | 72 ++++++++++---------
>> >  target/riscv/cpu.h                            | 19 ++---
>> >  target/riscv/cpu_bits.h                       |  1 +
>> >  target/riscv/csr.c                            | 13 +++-
>> >  .../riscv/insn_trans/trans_privileged.inc.c   |  2 +-
>> >  6 files changed, 71 insertions(+), 44 deletions(-)

