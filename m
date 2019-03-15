Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h4rf1-000387-TW
	for mharc-qemu-riscv@gnu.org; Fri, 15 Mar 2019 14:34:27 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33099)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1h4rez-00035z-3D
	for qemu-riscv@nongnu.org; Fri, 15 Mar 2019 14:34:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1h4rex-0001qj-Tn
	for qemu-riscv@nongnu.org; Fri, 15 Mar 2019 14:34:24 -0400
Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244]:34375)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1h4reu-0001oC-MB; Fri, 15 Mar 2019 14:34:20 -0400
Received: by mail-lj1-x244.google.com with SMTP id j25so2372629lji.1;
	Fri, 15 Mar 2019 11:34:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=uNXVjytv2pBYkkgLCPINuYtrTdK+rjRkOcsZvgBws+8=;
	b=NJSWVZ+r7y2YVN4WzknwA1BEE9KXWqJHY+ehcwMUHpEfMZH0WOvM3bO677MnQnmOUO
	umG21CyljUXw4ik/bUFgy+7ab/uiah98Rd7O89BIMecZD7ZDBDKKSXZLTCCgc6rEwyVe
	tv0F88TxGo/Iy5FAzNp5pDm8/TNcJXym6lWcMntQ6Hq9asgOWle99LFXTkmZwWnTRtYh
	TNhHlYl9I0Qd2+xwBel0KWPnaWw/rA8OnVqoxIzkfgPfNr3i4J1iH2bYUF/WX5AJXk6X
	Exx7ExnfF4n3SDQpJJq5RV73rHWXCoRjn3uvOlvDuqQkL+6dG/B2Lh51W4T9Irt4IqcP
	M6sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=uNXVjytv2pBYkkgLCPINuYtrTdK+rjRkOcsZvgBws+8=;
	b=k7B0V48oyIh7YBwTKibH7gnLeMdJoAtKRc/s5ukNYQubgt2nyUUbJ84UntXtud7l7L
	f578prAWEq3BFWrHVj3Oj3IVRU7SyKghQOkSgLnIrX7i830fAeV0U4FGG3B6VY66Y4L4
	E02NjC36O1VQ3bS/v2ZobvaWKI/XuyFUVJlOTgCEgdZgOiuG23LSYEplecjDF6zhJn4I
	VvnE4wEmD1xC24QFHjHy4GdG4LS3AVIGudTcqHw8AwliTwQnZ61glsbb6JcGLxftABp0
	nQRgnYZsEIZ2/OFV06go/8llhtw+qceUkSvk3wz+5GGvt+XKd8cFP+jcMCjVkNSXuTkM
	UriQ==
X-Gm-Message-State: APjAAAVNVM11ezmhnrdKWzo5fEtd+mv3EU9h/q5WDJ7V1qoIpyA72QrL
	NS6oKGgGPITYP3wtf4IyO3gdvNPvgPwfFiOQgRW2j4Ok5/Q=
X-Google-Smtp-Source: APXvYqx1cUdY/ys59zlh1oFp1DaS8xtu1zgMaiL/rqMjIdRTzti0ZrFT9i3W0eomIGG/BDH5yzfOfFaW3uVVvTk23JE=
X-Received: by 2002:a2e:711b:: with SMTP id m27mr2974801ljc.141.1552674859374; 
	Fri, 15 Mar 2019 11:34:19 -0700 (PDT)
MIME-Version: 1.0
References: <1552645619-18244-1-git-send-email-chihmin.chao@sifive.com>
In-Reply-To: <1552645619-18244-1-git-send-email-chihmin.chao@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 15 Mar 2019 11:33:09 -0700
Message-ID: <CAKmqyKNK0ovGpGSqvthp5B-=1k8VrxNAokZj4+PFx==Lr=ETbA@mail.gmail.com>
To: Chih-Min Chao <chihmin.chao@sifive.com>, Palmer Dabbelt <palmer@sifive.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	"open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::244
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH v5 0/5] RISC-V: Add gdb xml
 files and gdbstub support
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-riscv/>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 15 Mar 2019 18:34:26 -0000

On Fri, Mar 15, 2019 at 6:45 AM Chih-Min Chao <chihmin.chao@sifive.com> wrote:
>
> This is the 5th version of the patch set, based on the Jim's previous work,
>      http://lists.nongnu.org/archive/html/qemu-riscv/2019-02/msg00059.html
>
>     v4 -> v5:
>        - rebase 7074ab1
>        - update the register xml files to gdb 8.3
>        - refine the fpu control registers, fflags/frm/fcsr index calculation
>        - fix the csr offset calculcation because of tne regnum field in fpu
>          xml file introducing one useless number

Hey Chih-Min,

I thought this was merged into master, but apparently that never
happened. Thanks for bringing this up again.

Thanks for the corrections on top of the v4. For future reference if
the changes are very minor you can probably keep the reviewed tags.

I have reviewed the changes and this should be ready to go. I have
added Palmer so hopefully he can add this to a PR to get it in for
4.0.

Alistair

>
> Jim Wilson (5):
>   RISC-V: Add 32-bit gdb xml files.
>   RISC-V: Add 64-bit gdb xml files.
>   RISC-V: Fixes to CSR_* register macros.
>   RISC-V: Add debug support for accessing CSRs.
>   RISC-V: Add hooks to use the gdb xml files.
>
>  configure                   |   2 +
>  gdb-xml/riscv-32bit-cpu.xml |  47 ++++++
>  gdb-xml/riscv-32bit-csr.xml | 250 +++++++++++++++++++++++++++++++
>  gdb-xml/riscv-32bit-fpu.xml |  50 +++++++
>  gdb-xml/riscv-64bit-cpu.xml |  47 ++++++
>  gdb-xml/riscv-64bit-csr.xml | 250 +++++++++++++++++++++++++++++++
>  gdb-xml/riscv-64bit-fpu.xml |  56 +++++++
>  target/riscv/cpu.c          |   9 +-
>  target/riscv/cpu.h          |   7 +
>  target/riscv/cpu_bits.h     |  35 ++++-
>  target/riscv/csr.c          |  32 +++-
>  target/riscv/gdbstub.c      | 350 ++++++++++++++++++++++++++++++++++++++++++--
>  12 files changed, 1114 insertions(+), 21 deletions(-)
>  create mode 100644 gdb-xml/riscv-32bit-cpu.xml
>  create mode 100644 gdb-xml/riscv-32bit-csr.xml
>  create mode 100644 gdb-xml/riscv-32bit-fpu.xml
>  create mode 100644 gdb-xml/riscv-64bit-cpu.xml
>  create mode 100644 gdb-xml/riscv-64bit-csr.xml
>  create mode 100644 gdb-xml/riscv-64bit-fpu.xml
>
> --
> 2.7.4
>
>

