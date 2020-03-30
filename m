Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jIlxk-0000Wf-A2
	for mharc-qemu-riscv@gnu.org; Mon, 30 Mar 2020 00:23:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38240)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <anup@brainfault.org>) id 1jIlxh-0000PZ-Mc
 for qemu-riscv@nongnu.org; Mon, 30 Mar 2020 00:23:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <anup@brainfault.org>) id 1jIlxg-0003oe-LV
 for qemu-riscv@nongnu.org; Mon, 30 Mar 2020 00:23:45 -0400
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:45633)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <anup@brainfault.org>) id 1jIlxg-0003mQ-Ck
 for qemu-riscv@nongnu.org; Mon, 30 Mar 2020 00:23:44 -0400
Received: by mail-wr1-x441.google.com with SMTP id t7so19778354wrw.12
 for <qemu-riscv@nongnu.org>; Sun, 29 Mar 2020 21:23:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HzG7oyXt/nsBgTi6zmit0T++IzWCAHZ7qmuGbPyQKFo=;
 b=Oaz6u8lJqj2lr0brqtHiA/sBxIkaIKveNonoyhGZWwOBo1q0ZSntJE/7YX7uxL8D0p
 TkccxD5+PflOPfefCd0T76a5e3kfoLxQdr6FI2T+zfYVrACB21rhDyi/pQFAV/XCZyou
 ONwPZwZ5c+dM8OW9GqAgXa6URTx/sAQtG9s82QkSn0aCqH0Wz/EQL8ePv12yp+TdK8tj
 hwcumrjQI71pSyEUnmIUpIA1EL6reJi2XE0A4zJmncQBLS+CtOn8aQpZmOqDvwVbbT6v
 h+EfBl7zpLfBvWlBmW86Eo5eVVNcUBiQl14nPnjeMFvtoKIH0RbgW7rtb3J2dFXLeYXM
 jNRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HzG7oyXt/nsBgTi6zmit0T++IzWCAHZ7qmuGbPyQKFo=;
 b=E2jd8GJjJtlRHCT5T6tkAYpDWX/mWkw09l+VgBxYtip4yMtrb/uv6KeWyN9Q+YX58D
 1Sl4/5dTR8YV+8yoacZW+gLRyrDNfILAYQsvSTiIvn2/uRYUwoMLSD3tJsgzoLZ92gJv
 UiG7umq7ceAg3uvtXC0FnFkdDNyKbJXgdnvminNV+RXnV//h2bd8A4X9hr6M31utdNBY
 7GrhNYNAi7qyHcjraYA2tuCgJ/kNCNKx6ERYppExLacMfbz62OYFPc6twc8cXBsHrLH4
 dFTZ+m64aQH6P700aPXRJhxXKjLs3xuq84D0sNYbTA419kg3TYlmekwjzAq5z7sn913L
 grvA==
X-Gm-Message-State: ANhLgQ3p96Tlwav9w7z5EChV76V+/sOIL/yx742NBErLTmTM8TcMjat2
 jFpZctiDJpwDfc8J4ia3OSu3dptF28iE8BSjSSbjGA==
X-Google-Smtp-Source: ADFU+vshWyqLWpOrJ9xdCfB6ck/+0gAWWbuyILfFoD+Z2kMBSFsFceasLZxT529BjjoapKRl6E/1UmsBmrDgBmgHztI=
X-Received: by 2002:adf:8187:: with SMTP id 7mr13325645wra.358.1585542222325; 
 Sun, 29 Mar 2020 21:23:42 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1585262586.git.alistair.francis@wdc.com>
 <mhng-f7361188-1bb2-4ea3-bc25-3076f877aa64@palmerdabbelt-glaptop1>
In-Reply-To: <mhng-f7361188-1bb2-4ea3-bc25-3076f877aa64@palmerdabbelt-glaptop1>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 30 Mar 2020 09:53:30 +0530
Message-ID: <CAAhSdy2PNi-XE94kzSVRZLc_iJOKkBvwB6eo8qu=byBOUH9DDw@mail.gmail.com>
Subject: Re: [PATCH for 5.0 v1 0/2] RISC-V: Fix Hypervisor guest user space
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 QEMU Developers <qemu-devel@nongnu.org>,
 Alistair Francis <alistair23@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::441
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
X-List-Received-Date: Mon, 30 Mar 2020 04:23:46 -0000

Hi Palmer,

On Fri, Mar 27, 2020 at 5:30 AM Palmer Dabbelt <palmer@dabbelt.com> wrote:
>
> On Thu, 26 Mar 2020 15:44:04 PDT (-0700), Alistair Francis wrote:
> > This series fixes two bugs in the RISC-V two stage lookup
> > implementation. This fixes the Hypervisor userspace failing to start.
> >
> > Alistair Francis (2):
> >   riscv: Don't use stage-2 PTE lookup protection flags
> >   riscv: AND stage-1 and stage-2 protection flags
> >
> >  target/riscv/cpu_helper.c | 11 +++++++----
> >  1 file changed, 7 insertions(+), 4 deletions(-)
>
> Thanks, these are in the queue.
>

I have tested this patch series on latest QEMU master without
"target/riscv: Don't set write permissions on dirty PTEs" workaround
patch. It works fine now.

Tested-by: Anup Patel <anup@brainfault.org>

Please drop the work-around patch  "target/riscv: Don't set write
permissions on dirty PTEs" from your for-next.

Regards,
Anup

