Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1goaht-00041w-Hr
	for mharc-qemu-riscv@gnu.org; Tue, 29 Jan 2019 16:14:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50834)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1goahr-00041T-9f
	for qemu-riscv@nongnu.org; Tue, 29 Jan 2019 16:14:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1goahq-0000rd-8o
	for qemu-riscv@nongnu.org; Tue, 29 Jan 2019 16:14:07 -0500
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242]:44918)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1goahp-0000r9-VX; Tue, 29 Jan 2019 16:14:06 -0500
Received: by mail-lj1-x242.google.com with SMTP id k19-v6so18781563lji.11;
	Tue, 29 Jan 2019 13:14:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=g0sd5lq9JfrHF2NIe+XR666Dx5dUlVK7Y0kTyn98/3Y=;
	b=RLuyQ04QRI25DGIxO/6wumh0H8c2BusJjsiv3oW9aSNTTN5l7/W6GShg7JRiL73n4a
	dLJFKdg2FeoNZ20ZpISwLEiXVlcPM/kEgHQJgoVQ9kbM8zhYwbe33IoeK6o+hBjEcH2z
	qhiZFUHEOIs7u1mod2krKQgX4YIpfuYgP7URubuv55+cL0DWjnpAMrNqjHsjtKDzJL7i
	f8XJaxDbYoEIkWgH+Vo6GsqkAxxVltQ9JkWyR7WmZsQ1F4Lpd3BMv3jXHzZeScwEm9p/
	dyz10UP1Bo3TJxBuSZrpgFf3KeelkXbM2TiSSQ/72ZrpYgMObSGrV82cQyDsFUc+HvIa
	aIgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=g0sd5lq9JfrHF2NIe+XR666Dx5dUlVK7Y0kTyn98/3Y=;
	b=tc3rqvxHpJKI6Bqp6LuIlctZeWo0jRbziLntp8OGRZqsSLymFOCWxWhPGHDUOwHHdU
	eubyQ+BFXF7KJNFOSe6vDj5Cpm7Hbp8stLdcw+iRHdECPPz9wvM7olfrik3A1KmYBr3N
	dBoWcJCq3xWiTBLCu1Xbga0c+yH8rHPK9ww7HthKVYuFtRqHHBAeCfZTKsNNvLWf042a
	kuzAl5thCidZ6z/Ou5R9t+bzBckJ71FG+8iVOtv3i9WsYNjMB/QBjIsVZf94jZpdUtAm
	OE5bD/9E/5WyUgXCPtYfMSVMdi1XLjglt7HI45tf+0vJKdsi6LolMlUCTO6sXrtYxgxi
	c4mg==
X-Gm-Message-State: AJcUukeb4exDHRlejxD+I2+wH/Mc5iscTu6nJatTp2q985E1fbbk8WGp
	6vCEfxq549Drmu6ZLonNgOkVi/hgK6oLlcNNvz8=
X-Google-Smtp-Source: ALg8bN6Y91qyd7kco8Dy4mw2SmQrDjVlmFsAxZ+FcLrWRZcBC5FDCxpElCRxg+Iacx3kLHdEAS9x1A0eU99WTFu7AWw=
X-Received: by 2002:a2e:145a:: with SMTP id
	26-v6mr21772710lju.116.1548796444088; 
	Tue, 29 Jan 2019 13:14:04 -0800 (PST)
MIME-Version: 1.0
References: <69b40819-748e-d555-316a-6ce90e944bde@mail.uni-paderborn.de>
	<mhng-2dd4c232-3efb-4173-aae1-491b9aa2685b@palmer-si-x1c4>
In-Reply-To: <mhng-2dd4c232-3efb-4173-aae1-491b9aa2685b@palmer-si-x1c4>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 29 Jan 2019 13:13:36 -0800
Message-ID: <CAKmqyKPdGDB9Apd0SwsLBGwpaJqb1W-mGMEnw005q1jLSnGAkQ@mail.gmail.com>
To: Palmer Dabbelt <palmer@sifive.com>
Cc: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, 
	Alistair Francis <Alistair.Francis@wdc.com>, qemu-riscv@nongnu.org, 
	peer.adelt@hni.uni-paderborn.de, 
	Richard Henderson <richard.henderson@linaro.org>, 
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Sagar Karandikar <sagark@eecs.berkeley.edu>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::242
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH v5 00/35] target/riscv:
 Convert to decodetree
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
X-List-Received-Date: Tue, 29 Jan 2019 21:14:08 -0000

On Tue, Jan 29, 2019 at 11:31 AM Palmer Dabbelt <palmer@sifive.com> wrote:
>
> On Sat, 26 Jan 2019 00:51:23 PST (-0800), Bastian Koppelmann wrote:
> > On 1/26/19 12:54 AM, Palmer Dabbelt wrote:
> >> On Tue, 22 Jan 2019 13:38:52 PST (-0800), richard.henderson@linaro.org wrote:
> >>> On 1/22/19 1:28 AM, Bastian Koppelmann wrote:
> >>>> Hi,
> >>>>
> >>>> this patchset converts the RISC-V decoder to decodetree in four major steps:
> >>>>
> >>>> 1) Convert 32-bit instructions to decodetree [Patch 1-16]:
> >>>>     Many of the gen_* functions are called by the decode functions for 16-bit
> >>>>     and 32-bit functions. If we move translation code from the gen_*
> >>>>     functions to the generated trans_* functions of decode-tree, we get a lot of
> >>>>     duplication. Therefore, we mostly generate calls to the old gen_* function
> >>>>     which are properly replaced after step 2).
> >>>>
> >>>>     Each of the trans_ functions are grouped into files corresponding to their
> >>>>     ISA extension, e.g. addi which is in RV32I is translated in the file
> >>>>     'trans_rvi.inc.c'.
> >>>>
> >>>> 2) Convert 16-bit instructions to decodetree [Patch 17-19]:
> >>>>     All 16 bit instructions have a direct mapping to a 32 bit instruction. Thus,
> >>>>     we convert the arguments in the 16 bit trans_ function to the arguments of
> >>>>     the corresponding 32 bit instruction and call the 32 bit trans_ function.
> >>>>
> >>>> 3) Remove old manual decoding in gen_* function [Patch 20-30]:
> >>>>     this move all manual translation code into the trans_* instructions of
> >>>>     decode tree, such that we can remove the old decode_* functions.
> >>>>
> >>>> 4) Simplify RVC by reusing as much as possible from the RVG decoder as suggested
> >>>>    by Richard. [Patch 31-35]
> >>>>
> >>>> full tree available at
> >>>> https://github.com/bkoppelmann/qemu/tree/riscv-dt-v5
> >>>>
> >>>> Cheers,
> >>>> Bastian
> >>>>
> >>>> v4 -> v5:
> >>>>     - fixed rebase error
> >>>>     - moved TARGET_LONG_BITS check of shift instructions before rd == 0 check
> >>>>     - removed extra sign extension of sraiw
> >>>>     - removed rs2 == 0 special cases in sraw/srlw
> >>>
> >>> All looks good to me now.  Thanks for persevering.
> >>
> >> Thanks for reviewing this.
> >>
> >> Bastian: what sort of testing have you done here?  This is a pretty big change,
> >> and while it's been fairly extensively reviewed I'm just generally paranoid.
> >>
> >
> > I ran riscv-test as well as booting the newest fedora.
>
> Well, that pretty much exhausts my testing scheme :).  I think Alistair might
> have a setup for booting a 32-bit Yocto-based distro in QEMU.  Assuming he has
> the flow set up and it boots then I don't see any reason not to merge it.

I just tested it and 32-bit images boot the same before and after this
patchset. So the 4.19 (with patches ontop) kernel boots, but the 5.0
(with patches ontop) crashes at init.

>
> Thanks for pulling this all together, it's really great to have a cleaner
> decoder!
>
> Alistair: if that's true, can you give this a shot?

Yep, I have been using this in my daily use and haven't seen any
problems. That isn't exhaustive testing but should cover a bit.

Tested-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

>
> Bastian: do you mind collecting the relevant tags (Reviwed-by, etc) and putting
> them in a v6?
>

