Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jT5SR-0000Wo-CW
	for mharc-qemu-riscv@gnu.org; Mon, 27 Apr 2020 11:14:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35296)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alistair23@gmail.com>) id 1jT5SP-0000Q2-Fa
 for qemu-riscv@nongnu.org; Mon, 27 Apr 2020 11:14:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <alistair23@gmail.com>) id 1jT5SO-00040u-Ub
 for qemu-riscv@nongnu.org; Mon, 27 Apr 2020 11:14:05 -0400
Received: from mail-io1-xd43.google.com ([2607:f8b0:4864:20::d43]:45412)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1jT5SO-00040i-H3; Mon, 27 Apr 2020 11:14:04 -0400
Received: by mail-io1-xd43.google.com with SMTP id i19so19200394ioh.12;
 Mon, 27 Apr 2020 08:14:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vSl9tFxLX/n9X0hlCbc09Op8WwsbwBcotpw6NVs2uME=;
 b=gbGdtWbMLCKQsltGJv0+BIU8wymvD2/hnHRQ/gJeLPvihBGwgyILUMIruXcRDbouSQ
 cIKXsX8fbG9wO/SjIoP36Ap7rkPaHW8SygQc/j1OahRcJkSMLJHuB7lCvdJfMVg3gbyP
 HQPwV4SItgdHlCfxjFOrn4FyanQaOm+RnRbpXgR3LYb2dmiLnbnQxv2E73xQ8f9B01r+
 A2rh6kzpPX6GwD8M/t4g70Ji+ZqQEHppAc8MP7JsMZb7SQ883JsLvbJXvuGh8G6DWGIJ
 wcvMq13CIU9pM5CtAjUtkN6of7yyuNzEvUZDSg5Jjo4aCEpn0TQxDb9UbgtkIAiVssY+
 dUNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vSl9tFxLX/n9X0hlCbc09Op8WwsbwBcotpw6NVs2uME=;
 b=mGMQXmR8lcr7XTsUYSlnfok2sPZ9PObCpDB6CI2INxs+0k0YoZYRCI4V3UURfPYoCg
 COFyvwHb0oFsKIxkMLS4d6NPDQ6MtceAlRTCmiLX4V/QrHDzlNBw0/jFkF3r8HjwWR75
 201xnQNnrh5ADMQU65e9gd7isd4SPYLvAWVFt4Eh+kCJTKbQahYHrh46p7EJOJLcpZH2
 DKbeRRG0DHKPn+h5dba4axpep/NXJh9mPnDLib/87F22thvxU0sqZ3zZ/OTHp4lS/Hhm
 OPmiVAqh9wmhkL4A2Qg0djzyAJCNQumI10YuAjOaWXqf0TxznzLqSdL8VgkpjT8ASQ8A
 mX0g==
X-Gm-Message-State: AGi0PuY9QpQHsDXrEF4G26otgWz15fYIK5GyUEemPEM/uHwYo7KJJpIj
 sEIlLQGVci0+KQxYLwf2gpmN7KZitUzqAaunppI=
X-Google-Smtp-Source: APiQypI1qfgdKIvtNopqmpO+EAg3QK+XgTz0w7yepJIA01cMWMrz0Y4/o2fVLBWbf+pOuPTsM3r9sHKux9Z7UO+g5G8=
X-Received: by 2002:a5d:984b:: with SMTP id p11mr21296857ios.175.1588000443029; 
 Mon, 27 Apr 2020 08:14:03 -0700 (PDT)
MIME-Version: 1.0
References: <20200427080644.168461-1-anup.patel@wdc.com>
In-Reply-To: <20200427080644.168461-1-anup.patel@wdc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 27 Apr 2020 08:05:24 -0700
Message-ID: <CAKmqyKPb52FQ5NWLVGLBgJqSXXyeReJ-Di--+TwkeQcpJ4H3HQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] RISC-V Spike machine improvements
To: Anup Patel <anup.patel@wdc.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Atish Patra <atish.patra@wdc.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Anup Patel <anup@brainfault.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d43;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd43.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2607:f8b0:4864:20::d43
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
X-List-Received-Date: Mon, 27 Apr 2020 15:14:06 -0000

On Mon, Apr 27, 2020 at 1:07 AM Anup Patel <anup.patel@wdc.com> wrote:
>
> This series improves QEMU Spike machine to:
> 1. Allow loading OpenBI firmware using -bios option
> 2. Allow more than one CPUs
>
> Changes since v2:
>  - Rebased on QEMU v5.0-rc4
>
> Changes since v1:
>  - Rebased on QEMU master (commit 2ac031d171ccd18c973014d9978b4a63f0ad5fb0)

Applied to the RISC-V tree for 5.1.

Alistair

>
> Anup Patel (3):
>   hw/riscv: Add optional symbol callback ptr to riscv_load_firmware()
>   hw/riscv/spike: Allow loading firmware separately using -bios option
>   hw/riscv/spike: Allow more than one CPUs
>
>  hw/riscv/boot.c         | 13 ++++++++-----
>  hw/riscv/sifive_u.c     |  2 +-
>  hw/riscv/spike.c        | 26 ++++++++++++++++++++++++--
>  hw/riscv/virt.c         |  2 +-
>  include/hw/riscv/boot.h |  6 ++++--
>  5 files changed, 38 insertions(+), 11 deletions(-)
>
> --
> 2.25.1
>
>

