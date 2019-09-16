Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1i9lnC-0000ys-PO
	for mharc-qemu-riscv@gnu.org; Mon, 16 Sep 2019 03:51:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53590)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bmeng.cn@gmail.com>) id 1i9lnA-0000ym-RN
 for qemu-riscv@nongnu.org; Mon, 16 Sep 2019 03:51:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bmeng.cn@gmail.com>) id 1i9ln9-0002og-PD
 for qemu-riscv@nongnu.org; Mon, 16 Sep 2019 03:51:24 -0400
Received: from mail-ed1-x541.google.com ([2a00:1450:4864:20::541]:34725)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bmeng.cn@gmail.com>)
 id 1i9ln9-0002oG-G2; Mon, 16 Sep 2019 03:51:23 -0400
Received: by mail-ed1-x541.google.com with SMTP id c20so23183794eds.1;
 Mon, 16 Sep 2019 00:51:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/Z/wgUqHE1IEsmP2VsOT/ybDy6SfrfuIOfZL+uoEI6I=;
 b=Fr6CoQ8AzT5JT2/JjeF2Ain0oFCrmBbL6YKQ1E+lryiU0CjnGjyIAzVikGK59KnYsH
 NeO9Qhy8ldwMj71durVICFJxrG/GNiQCrdxkdLN+DWLVTjB6c8s2CbD4xDvNZ+41D3cP
 ubHYLHORotnJMMrUG0w11grNDBDIOWmgY0Zh/vrL7vi3MskMR/l3b1ZU7ZC+JKlj0z4Y
 pc1r45q0NY90pj39T9RJgNnHI3F2dMzDWHoJEZ6n8XfOkkqTuhkvPl9r3uGc0xlG0yYA
 YuMh0xUslZ2GBrDSbaH0F5Y6sXmu/5BC6EE9x/oSxGm+8AnhmwF0RHsBN8wM2flt707J
 wwMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/Z/wgUqHE1IEsmP2VsOT/ybDy6SfrfuIOfZL+uoEI6I=;
 b=Bf8wP5B5tpZdifaD0dtH/3Zc9Yfpt/Y4CCa1UxYeq6NRrkYCUp8KXII4BwZmVe6D3N
 2KOCqTnS6Jhy4gHIlryEAPEtyw6RfB08I6geuMoZy0Um6NmYRJIDHFD/umugOdASo0jE
 zcCTVIioPRgGZctPidch8HL0vVOdsMfBKO4S2uIQ+a90gFgBSKwkWZORaELGoFYesRH5
 uoANQkXgLp/gLqXi+8RsN8pqnqMaty0dHTgLWOc8k+Ul93k09J9eRHP3cH4V3NtjvoL+
 Wgg47YULFaIKizqHqiVir/GLaBULTjeQe5Gb/nxcAz/suGBDSnf/+cMFEj2Q9djrvsfO
 uNBg==
X-Gm-Message-State: APjAAAWtSGyIEMNC7lR+fvs5XXmwI6O3P+XVd9C3UR+siP5Jvfk7l7/U
 PLnqaHtH/VNtGag1RY3Y0Fopr1lZ52VHMN1eeRU=
X-Google-Smtp-Source: APXvYqypDb+WXR9Rc+4xEy9iJAB6Y+532tNJtxWMTn4kXDwrq5rIl6/N2FlWr99swbduuLebu72JFqODq4cTWXyCm+Q=
X-Received: by 2002:a17:906:4a19:: with SMTP id
 w25mr50831293eju.239.1568620282258; 
 Mon, 16 Sep 2019 00:51:22 -0700 (PDT)
MIME-Version: 1.0
References: <CAEUhbmV=v62a0CAHe2mt1Qzz0n+fESgVYDtjdoXfyhH6_j5zFw@mail.gmail.com>
 <mhng-da766f03-2535-4a8c-97aa-1f85f986bee3@palmer-si-x1e>
 <CANnJOVGRWepwwZPyOmF1O7azqKVYgB2ZSqLrh5qnye10Oi_M7Q@mail.gmail.com>
In-Reply-To: <CANnJOVGRWepwwZPyOmF1O7azqKVYgB2ZSqLrh5qnye10Oi_M7Q@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 16 Sep 2019 15:51:11 +0800
Message-ID: <CAEUhbmUWoPhpYm9_SvTg5bm74x3P5bOK8Mmz_bzP_OrdAKKqLQ@mail.gmail.com>
To: Jonathan Behrens <fintelia@gmail.com>
Cc: Palmer Dabbelt <palmer@sifive.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Alistair Francis <Alistair.Francis@wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::541
Subject: Re: [Qemu-riscv] [PATCH v8 18/32] riscv: sifive_u: Set the minimum
 number of cpus to 2
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
X-List-Received-Date: Mon, 16 Sep 2019 07:51:26 -0000

Hi Jonathan,

On Mon, Sep 16, 2019 at 1:40 AM Jonathan Behrens <fintelia@gmail.com> wrote:
>
> Has there been testing with "-smp 2"? A while back I thought I read that the included uboot firmware was using a hard-coded device tree that indicated 4+1 CPUs, which I would have expected to cause Linux boot issues?
>

No, U-Boot is using DTB that was passed from previous stage firmware - OpenSBI.

On a real board this is 4 + 1. On QEMU, DTB is dynamically generated
per "-smp n" settings. So there should be no problem.

Regards,
Bin

