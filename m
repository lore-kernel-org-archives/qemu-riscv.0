Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iAvX1-00063q-T5
	for mharc-qemu-riscv@gnu.org; Thu, 19 Sep 2019 08:27:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39026)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iAvWx-0005wW-AJ
 for qemu-riscv@nongnu.org; Thu, 19 Sep 2019 08:27:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iAvWv-0005DK-Kq
 for qemu-riscv@nongnu.org; Thu, 19 Sep 2019 08:27:26 -0400
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:46427)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iAvWt-0004xI-Fb
 for qemu-riscv@nongnu.org; Thu, 19 Sep 2019 08:27:23 -0400
Received: by mail-ot1-x342.google.com with SMTP id f21so2829299otl.13
 for <qemu-riscv@nongnu.org>; Thu, 19 Sep 2019 05:27:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=01YN0A8DWIRGqUZeKm/Pn2I2QWNXv9febKb7C1fFe5Y=;
 b=iTVPQDnulHZTuWBXrdQqVhU1J95kyL/cmmiaZum+8DMubU28m+6VS5al58A7l6QLs3
 BEWmWjmSoRdNOO98obA/LanUDholfGSQIKJHzRZ7wAKYBr1wuZJuxCnOfywQfFRdgT18
 WlDvAYenwaXWCbgU4iiFyOSD6Zkgnq8/+pr4OJlnziQ6zIHgmrGHp65H/XwKMuasVMRN
 P6VjjGKdiZHEWVtqsoMe3YfHaoe4WLjty+A6GLbY3zu0ylvRekinxYC+JHSyiG7qjsUs
 aU1VjEmzrBQl/aIRccxcOpwEXGqKQm63nGmXq+Gzmw2WOQSv8mho705SBDPSwPDYnK7i
 mXrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=01YN0A8DWIRGqUZeKm/Pn2I2QWNXv9febKb7C1fFe5Y=;
 b=oMguTy0zB2IRyUYGDMkxSkO2rGI4MOh9lJQQ1TLYTbHjxpktVPXJta+mEo+hF2kA6h
 7ZhR3KpSE6VV2hVXs6c55XhVUllpq6BNa2duaXDdxLFHv5romMefJ030eDr9rs9xOa2g
 t1pRLn2wW4cDd46lE1ESsw8mPC15M+wB2j8fc9PcVpMT+ciV5HdcW6M49OrmZ0uwAirV
 4fYLlM62Z4LK/zi0y0ja8BLsYzJYp/7SH1LJof8gbbaQ3gJZ6o5GPvOIuHkRJJ97uAZB
 5TdJwV9dF1A7pUhmLqlFIe4Xx3M0tAls7VTXyJt3fcVC3vh56ZdLynkcRD+3Q9DvP0Nk
 U5Cw==
X-Gm-Message-State: APjAAAUTa5lEElGqO26Cm+24yx89rM6p0I+pbOE9Pd0YldD/dWhMLFhM
 TRUB+ahDql54Gk+ci0AkaGsDk1EfnMl4D3Zeptyb9Q==
X-Google-Smtp-Source: APXvYqzdZ0vZ7lMPM2dBINWWafmydBKWMcwbq6NH1Th9fR4puVdP+zP2SnaxATH8x+LI7sE8cMrkk1YowaH3bzjV+LY=
X-Received: by 2002:a05:6830:16c9:: with SMTP id
 l9mr3326998otr.97.1568896027579; 
 Thu, 19 Sep 2019 05:27:07 -0700 (PDT)
MIME-Version: 1.0
References: <20190918145640.17349-1-palmer@sifive.com>
In-Reply-To: <20190918145640.17349-1-palmer@sifive.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 19 Sep 2019 13:26:56 +0100
Message-ID: <CAFEAcA_h3+Zm=PXiGV7THCL0wJz_RyWEjfCrSJV2exWOZQ0Dig@mail.gmail.com>
To: Palmer Dabbelt <palmer@sifive.com>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::342
Subject: Re: [Qemu-riscv] [PULL] RISC-V Patches for the 4.2 Soft Freeze,
 Part 1, v3
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
X-List-Received-Date: Thu, 19 Sep 2019 12:27:29 -0000

On Wed, 18 Sep 2019 at 16:27, Palmer Dabbelt <palmer@sifive.com> wrote:
>
> The following changes since commit f8c3db33a5e863291182f8862ddf81618a7c6194:
>
>   target/sparc: Switch to do_transaction_failed() hook (2019-09-17 12:01:00 +0100)
>
> are available in the Git repository at:
>
>   git://github.com/palmer-dabbelt/qemu.git tags/riscv-for-master-4.2-sf1-v3
>
> for you to fetch changes up to b3e86929189c526d22ef49e18f2f5066535f6deb:
>
>   gdbstub: riscv: fix the fflags registers (2019-09-17 08:42:50 -0700)
>
> ----------------------------------------------------------------
> RISC-V Patches for the 4.2 Soft Freeze, Part 1, v3
>
> This contains quite a few patches that I'd like to target for 4.2.
> They're mostly emulation fixes for the sifive_u board, which now much
> more closely matches the hardware and can therefor run the same fireware
> as what gets loaded onto the board.  Additional user-visible
> improvements include:
>
> * support for loading initrd files from the command line into Linux, via
>   /chosen/linux,initrd-{start,end} device tree nodes.
> * The conversion of LOG_TRACE to trace events.
> * The addition of clock DT nodes for our uart and ethernet.
>
> This also includes some preliminary work for the H extension patches,
> but does not include the H extension patches as I haven't had time to
> review them yet.
>
> This passes my OE boot test on 32-bit and 64-bit virt machines, as well
> as a 64-bit upstream Linux boot on the sifive_u machine.  It has been
> fixed to actually pass "make check" this time.
>
> Changes since v2 (never made it to the list):
>
> * Sets the sifive_u machine default core count to 2 instead of 5.
>
> Changes since v1 <20190910190513.21160-1-palmer@sifive.com>:
>
> * Sets the sifive_u machine default core count to 5 instead of 1, as
>   it's impossible to have a single core sifive_u machine.
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/4.2
for any user-visible changes.

-- PMM

