Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1hyY3R-00068j-J3
	for mharc-qemu-riscv@gnu.org; Fri, 16 Aug 2019 04:57:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54297)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1hyY3O-00067o-SO
 for qemu-riscv@nongnu.org; Fri, 16 Aug 2019 04:57:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hyY3N-0002WK-A9
 for qemu-riscv@nongnu.org; Fri, 16 Aug 2019 04:57:46 -0400
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:37390)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hyY3M-0002V9-H5
 for qemu-riscv@nongnu.org; Fri, 16 Aug 2019 04:57:44 -0400
Received: by mail-oi1-x241.google.com with SMTP id b25so278372oib.4
 for <qemu-riscv@nongnu.org>; Fri, 16 Aug 2019 01:57:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=F/VignfD644W9m9MuiKKhm5HFSHse80KdACdxMIyICk=;
 b=w9Dyt7HiWFNGV7ag9WBn7uv0Bwk6AlpijxSoiJbtViKFv101pAdAUY42UQTMmSQUVu
 8x9Vk7yiCD07FLHoD6Hoq1ZkM8cwPOfawipAPy7Ddhdrh37ChuwcwVrqAT4BLm+zVzwb
 bCZmduOvDHGsh40MzqqUqN7J1jqP6cI2fV+sqpSstKPeJ7QuMCPAx3u163AGiVo5XuQJ
 08me0mdd99iJ1AW9i9iYumJGFRDcuX0faQja3U/1qIaJ983q65M312df+j5sapjHK2d0
 mEF8wZGF4xG1OHrsu2vKVCBb7kEYS/EyVpSlg41aktj/EFHQ7RG7jgFIRaKcnadyQNyb
 G7Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=F/VignfD644W9m9MuiKKhm5HFSHse80KdACdxMIyICk=;
 b=jZHdbyN8CPBFOgbIrO8mfLMo7greJtoPcwScumlb6qErQ3AB3ZTYe/+aAOpRXg7auX
 kl46hhZbMYOwy9j9nOz0pt58inPoDxcLtublZKrD2lhrRtbig6217hrkOu5XMR7guuFk
 HTilqs7QUnNJusZfx4ttI8U81Fv0/kATmMLPP6qSNOCkHSVIOUR/oYqsReVw7qh30n7d
 3CKCmDO6oTQiVTHL+fRV+j7+FEdS2PXInqzMXUe3z4y64FSK4ECEgFyVFnLZZ0z6HanI
 8tKsDFMs8xVjkxvUY8lFPof2FZZZP07cUSV9As5wiwKYU2aLHvLQH2bLjD78yENtXw8/
 6EeQ==
X-Gm-Message-State: APjAAAUGfjldrixSSQmoEY6pOH8oxWjJBMc5X9p7XKgrgyTYoc3elEmZ
 3ohM0ZYPzT9FZOvQVzS00ZstzRmY5q2AuQQK7cx24A==
X-Google-Smtp-Source: APXvYqzyPfv/xecnWNFmgiV366iAdVLiDuHA+bTghxUmEyBN5dbrMCtBN/czALmovteMSXgRldjOu2lnyXKLEdDwr74=
X-Received: by 2002:aca:50cb:: with SMTP id e194mr3994816oib.48.1565945862801; 
 Fri, 16 Aug 2019 01:57:42 -0700 (PDT)
MIME-Version: 1.0
References: <CAKmqyKMyv8gt8Gb6y0DMktnWnSKBw4ePwOXBzWkEpw5GVmyG0A@mail.gmail.com>
 <mhng-f7096b78-f11e-425e-8ade-d20c77ee1de6@palmer-si-x1e>
In-Reply-To: <mhng-f7096b78-f11e-425e-8ade-d20c77ee1de6@palmer-si-x1e>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 16 Aug 2019 09:57:31 +0100
Message-ID: <CAFEAcA_gpS3odPN_1sxCjV+0bRrNn+=xmS=5JgUFvz2A332LEw@mail.gmail.com>
To: Palmer Dabbelt <palmer@sifive.com>
Cc: Alistair Francis <alistair23@gmail.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::241
Subject: Re: [Qemu-riscv] [Qemu-devel] [PULL 04/32] target/riscv: Implement
 riscv_cpu_unassigned_access
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
X-List-Received-Date: Fri, 16 Aug 2019 08:57:48 -0000

On Thu, 15 Aug 2019 at 23:17, Palmer Dabbelt <palmer@sifive.com> wrote:
> You're more than welcome to take them over.  I've got something that boots
> Linux on my unassigned_access branch (github.com/palmer-dabbelt/qemu), but I
> haven't sanitized the whole port for physical accesses and I haven't convinced
> myself that my hook implementation is correct.

Rather than doing
   if (retaddr) {
       cpu_restore_state(cs, retaddr, true);
   }

at the start of the hook I think you just want to pass 'retaddr'
as the final argument to riscv_raise_exception() instead of
using GETPC(). Other than that I think the hook itself is right.

The 'git grep' regexes in docs/devel/loads-stores.rst are handy
for finding the places where the target code is doing physical
accesses. IIRC the only ones I found with a quick scan were the
PTE loads in get_physical_address() via ldl_phys/ldq_phys, which will
now return 0 and run into the 'invalid PTE' code path. I don't
know whether your architecture requires some different behaviour
for bus errors on page table walk than that (you might want to
specifically code the error path anyway or comment it even if the
behaviour is right, to be a bit more explicit that it can happen).

thanks
-- PMM

