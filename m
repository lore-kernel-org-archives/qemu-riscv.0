Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hhJH1-0008Gu-NL
	for mharc-qemu-riscv@gnu.org; Sat, 29 Jun 2019 15:44:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56960)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <luke.r.nels@gmail.com>) id 1hhJGz-0008Gd-HD
 for qemu-riscv@nongnu.org; Sat, 29 Jun 2019 15:44:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <luke.r.nels@gmail.com>) id 1hhJGy-00066m-LT
 for qemu-riscv@nongnu.org; Sat, 29 Jun 2019 15:44:33 -0400
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:40379)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <luke.r.nels@gmail.com>)
 id 1hhJGy-00064v-CE; Sat, 29 Jun 2019 15:44:32 -0400
Received: by mail-wm1-x341.google.com with SMTP id v19so12001980wmj.5;
 Sat, 29 Jun 2019 12:44:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XR3CYR+hNAhsKH1MYETD7KsWjiyjIq23cGrTQzYkak8=;
 b=CICh/XrWkdUQBj4vOVfkehnuL3k9qdWBZfFQLsTqpIy7y5NMkaFNiIND0WH0yOvhQC
 loEbaG9RZtum3oKJnxevuzVpzQF86HjS7kU/LRXN3iSmEMK7w619DtZ0r/iQOu89ESno
 sMv71jC5AlWH+d5fyFDjYOA5Tz5nsC5g9VvJTmYhY85G4622V0Ns9E56VYYCQN2srjKj
 2vMI38cS95EwzJjeyBDnYYvuvJ1f2QTQJSCHjzpMqQGIsNQx7vqTfOLve4XFHGz20jd4
 DfgzICLvnZOpmejCpDn+iHIHL6gLLWBrrkiYpYa31M+LEHxmnmvzM1vUZynzgU8OcZ4d
 KOXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XR3CYR+hNAhsKH1MYETD7KsWjiyjIq23cGrTQzYkak8=;
 b=CDduYWziMFVAGwzF5Ia4K6ZBNbxIjXstVD4BPThEOtm5lDTgR3tuAMn3OLcTcouCNG
 V5m85f/dWNBzfDyz60eoIyO7L5l5s4YPS2Wzxanl6J3mEtO3FGqSR8BH94Lg2gQG3LWo
 20eZwfcuPsDi+bpiY/1vUTYMU0XM6mPJLn9ZERFHg5pdmLY1EWgukjWlHv3qzCdRnG0U
 +eWnRCz3O+SvyYw4le98WC9DAZZ/xekSYE9jjF0hTF1TGokn9buLqcswJc5UCrqHAB6X
 wXM1V/2OZL4i6cAZYDyN+3pDObGosclRU3ht8NHr8vGXB6l42VmIxYA9C566SaZDLNNM
 CWuA==
X-Gm-Message-State: APjAAAUcNMiEbTu/eeRNMBaTakVwQwsNPjMqAXpPFSEPE6I7Ln93bWqQ
 4ZaxEzY7eXIIiSPr2sEdTa/Oi87X31S4h2BQ0tI=
X-Google-Smtp-Source: APXvYqykPFs+X6QrUUw+DJ0M7EvOQUoQSeV/xLPRV+qN/7Aj4skcXcoVAt8AH09E82je219O9Nd4h5YMwHTfOOrdy2w=
X-Received: by 2002:a1c:5453:: with SMTP id p19mr10535238wmi.148.1561837469382; 
 Sat, 29 Jun 2019 12:44:29 -0700 (PDT)
MIME-Version: 1.0
References: <CAKmqyKNPpRKYJunZLQrbNE9LmXLKkMcGUdghe3Ry6kO=R9TQLw@mail.gmail.com>
 <mhng-eb63042f-42db-4a31-96b5-e13a0e1d2363@palmer-si-x1c4>
In-Reply-To: <mhng-eb63042f-42db-4a31-96b5-e13a0e1d2363@palmer-si-x1c4>
From: Luke Nelson <luke.r.nels@gmail.com>
Date: Sat, 29 Jun 2019 12:44:13 -0700
Message-ID: <CAB-e3NRoDmJwr_QEf2djUV6KuESP+kyrhB470vS5t5sUphXPBg@mail.gmail.com>
To: Palmer Dabbelt <palmer@sifive.com>
Cc: alistair23@gmail.com, qemu-riscv@nongnu.org, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, 
 "open list:All patches CC here" <qemu-devel@nongnu.org>, lukenels@pm.me,
 Michael Clark <mjc@sifive.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>, Xi Wang <xi.wang@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::341
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH] RISC-V: Fix pmpcfg register
 indexing
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
X-List-Received-Date: Sat, 29 Jun 2019 19:44:34 -0000

On Wed, Feb 13, 2019 at 10:12 AM Palmer Dabbelt <palmer@sifive.com> wrote:
>
> On Fri, 08 Feb 2019 10:57:17 PST (-0800), alistair23@gmail.com wrote:
> >
> > Good catch!
> >
> > Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
>
> Ya, thanks -- that's a somewhat embarrassing bug, as someone else just fixed
> one on the line below :).  I'll target this for my next PR.
>

Is there any chance this patch could make it in the next PR?

Thanks,
- Luke

