Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l0aWL-0005ke-HU
	for mharc-qemu-riscv@gnu.org; Fri, 15 Jan 2021 20:36:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l0aWJ-0005jt-HR; Fri, 15 Jan 2021 20:36:51 -0500
Received: from mail-yb1-xb2d.google.com ([2607:f8b0:4864:20::b2d]:43215)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l0aWH-0001II-OL; Fri, 15 Jan 2021 20:36:51 -0500
Received: by mail-yb1-xb2d.google.com with SMTP id y128so6774247ybf.10;
 Fri, 15 Jan 2021 17:36:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7lp0Ef58W/Yt6Vest35/k9tef9VJ8QOVGYd/N6GO1eg=;
 b=HBnVvpsQ5d+iC+oWrYpSySI3nYFqXFwFFYJe86gE/vD8tGrHougyq4psDld2K0Zjh7
 ZgIDip4sk9MUkTNXo4Rjws5GV9LkXZSf4/Uel0PyT74FTIXDwDycyGG7q7aFNuUw7dOx
 a+1WyEjOWck2hcJwn+qzUDGv4VRZRSYHwt1RDUGVvHA9Db52ZAkAzrJ+F8JLePyFJG4E
 5lXTMcLp5IOaJY+EiFi4QwkydClZQ1ewlWYi7PY23NDdwn340R0QbreCg/z+ZAWNyTZs
 falUWQ+rf6w4qKMb2gJSPStOu1j4mAMQZRChn688PuAbOC1n+1IKfnD6e1OzJmue8oBq
 beAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7lp0Ef58W/Yt6Vest35/k9tef9VJ8QOVGYd/N6GO1eg=;
 b=gXsE8iaKdvqKxrh9bT1cQHE4cJqdKdxxm25KHBgbRQBvPRj41QmhuOKt0y2nJHU16V
 PSLrRPQ/P5iP3j5Yca/4j/6bSPBj/0NQ54Y0+eEnXB/CeVVZZBnULOzXqdcEw6feXM1R
 A6ynzEFfJXG/eoTxpA/Evvo/9TwlGa7X3g98TUBm98o38kBzLCKFdQJvS0TnFDokWD+K
 Y9qWYttPyhHaNDV1iGLghsgk9zuSfkVJI2BVKb5Wb6bV3BPUP8asJ/tA+uy06I+9d7ka
 M0bvDLGe9DrGa6VYGiIc4Gio7lMtCJ7A/TWnrvsPKq8/EykueF19jo3SsXsAFaixVPeY
 t0Mg==
X-Gm-Message-State: AOAM532ziU+SNt0dbC0iNbG71NT8HMQz9BDOcODABJ5TsUWwD2wCTWqH
 3SM5FhVqjOp/GGwMPs24xcdk1CslquIeFl7PLEQ=
X-Google-Smtp-Source: ABdhPJwk229q6nYZd//6zopPZV/9wiZ8/FT/CRxMv9MrzRPLRDVm8NgY12jcnL7uAkyk7aDu8I5Qpi2jds4LS/73pjQ=
X-Received: by 2002:a25:2041:: with SMTP id g62mr22939905ybg.152.1610761008396; 
 Fri, 15 Jan 2021 17:36:48 -0800 (PST)
MIME-Version: 1.0
References: <1610427124-49887-1-git-send-email-bmeng.cn@gmail.com>
 <1610427124-49887-4-git-send-email-bmeng.cn@gmail.com>
 <CAKmqyKO2noST5un=fRqhzWG6mL8R2rws_h6Bt1R27b+F7ujqjA@mail.gmail.com>
 <CAKmqyKNRzBYHWwY_yo-yLQTY5BMBcbY3kYHh2NY2g-=9_Qg_dw@mail.gmail.com>
In-Reply-To: <CAKmqyKNRzBYHWwY_yo-yLQTY5BMBcbY3kYHh2NY2g-=9_Qg_dw@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Sat, 16 Jan 2021 09:36:37 +0800
Message-ID: <CAEUhbmWLK4-X3exVLrtUn8Vi54c=jVrFFv0pphaodc97Y6NYoQ@mail.gmail.com>
Subject: Re: [PATCH 3/4] target/riscv: Generate the GDB XML file for CSR
 registers dynamically
To: Alistair Francis <alistair23@gmail.com>
Cc: Jim Wilson <jimw@sifive.com>, Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2d;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2d.google.com
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
X-List-Received-Date: Sat, 16 Jan 2021 01:36:51 -0000

On Sat, Jan 16, 2021 at 6:08 AM Alistair Francis <alistair23@gmail.com> wrote:
>
> On Fri, Jan 15, 2021 at 1:59 PM Alistair Francis <alistair23@gmail.com> wrote:
> >
> > On Mon, Jan 11, 2021 at 8:55 PM Bin Meng <bmeng.cn@gmail.com> wrote:
> > >
> > > From: Bin Meng <bin.meng@windriver.com>
> > >
> > > At present QEMU RISC-V uses a hardcoded XML to report the feature
> > > "org.gnu.gdb.riscv.csr" [1]. There are two major issues with the
> > > approach being used currently:
> > >
> > > - The XML does not specify the "regnum" field of a CSR entry, hence
> > >   consecutive numbers are used by the remote GDB client to access
> > >   CSRs. In QEMU we have to maintain a map table to convert the GDB
> > >   number to the hardware number which is error prone.
> > > - The XML contains some CSRs that QEMU does not implement at all,
> > >   which causes an "E14" response sent to remote GDB client.
> > >
> > > Change to generate the CSR register list dynamically, based on the
> > > availability presented in the CSR function table. This new approach
> > > will reflect a correct list of CSRs that QEMU actually implements.
> > >
> > > [1] https://sourceware.org/gdb/current/onlinedocs/gdb/RISC_002dV-Features.html#RISC_002dV-Features
>
> Do you mind rebasing this patch on the current riscv-to-apply.next
> branch: https://github.com/alistair23/qemu/tree/riscv-to-apply.next
>

Yes, for sure.

Regards,
Bin

