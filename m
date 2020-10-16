Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kTXOF-0001g9-9V
	for mharc-qemu-riscv@gnu.org; Fri, 16 Oct 2020 17:35:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <adelt@hni.upb.de>)
 id 1kTXOC-0001fd-0k; Fri, 16 Oct 2020 17:35:52 -0400
Received: from shirlock.uni-paderborn.de ([2001:638:502:c003::15]:56930)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <adelt@hni.upb.de>)
 id 1kTXO6-0007yH-MW; Fri, 16 Oct 2020 17:35:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=hni.uni-paderborn.de; s=20170601; h=To:References:Message-Id:
 Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
 Content-Type:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JsbfTRET59b9lal5XyZFPyehhRCO8KQPDSpRIIGz39E=; b=CFbWIPqzRUbV+t2w2Qh+i1pSP0
 33iMwEJ0cXkcszfmARdccQ3eaKYyciCvV2UeP9kD+F6zZ7ttkhSXh5ysltEHXEANgFyg4yQCESxz+
 y14NWfGXKLwsU++N1AXznGjjCVRfoUg8hI4XvN6FGNCY2AP/Oy5DL+EG5pWaRuepU9FY=;
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.15\))
Subject: Re: HTIF tohost symbol size check always fails
From: Peer Adelt <adelt@hni.upb.de>
In-Reply-To: <CAKmqyKPnnLHuTvosMLs+4A8QqR-XvuxgRU33c0f1Q92LJ_x8CA@mail.gmail.com>
Date: Fri, 16 Oct 2020 23:35:37 +0200
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Content-Transfer-Encoding: quoted-printable
Message-Id: <7F36EF66-D48D-418C-94D2-AA66D86C38CA@hni.upb.de>
References: <B96DF081-AEDD-470E-A99C-8A9536E0A8CE@hni.upb.de>
 <CAKmqyKPnnLHuTvosMLs+4A8QqR-XvuxgRU33c0f1Q92LJ_x8CA@mail.gmail.com>
To: Alistair Francis <alistair23@gmail.com>
X-Mailer: Apple Mail (2.3445.104.15)
X-IMT-Spam-Score: 0.0 ()
X-Sophos-SenderHistory: ip=37.24.125.142, fs=43378715, da=90493203, mc=242,
 sc=1, hc=241, sp=0, fso=43378715, re=0, sd=0, hd=0
X-PMX-Version: 6.4.9.2830568, Antispam-Engine: 2.7.2.2107409,
 Antispam-Data: 2020.10.16.212417, AntiVirus-Engine: 5.77.0,
 AntiVirus-Data: 2020.10.16.5770002
X-IMT-Authenticated-Sender: uid=adelt,ou=People,o=upb,c=de
Received-SPF: neutral client-ip=2001:638:502:c003::15;
 envelope-from=adelt@hni.upb.de; helo=shirlock.uni-paderborn.de
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, SPF_HELO_NONE=0.001,
 SPF_NEUTRAL=0.779 autolearn=no autolearn_force=no
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
X-List-Received-Date: Fri, 16 Oct 2020 21:35:52 -0000

The solution was even easier: I forgot to load the proxy kernel. As soon =
as I replaced the command-line parameter "-kernel <ELF>" with "-kernel =
<PK> -append <ELF>", everything was working as expected.=20

Without your hint about my possibly misconfigured toolchain I would have =
probably continued to search for the error in the QEMU HTIF device. But =
in fact it was due to the wrong binary.

Thanks a lot! :-)

> On 16. Oct 2020, at 20:03, Alistair Francis <alistair23@gmail.com> =
wrote:
>=20
> On Fri, Oct 16, 2020 at 7:59 AM Peer Adelt <adelt@hni.upb.de> wrote:
>>=20
>> Hi,
>>=20
>> I have a problem with the RISC-V HTIF device.
>>=20
>> Every binary I have compiled for Spike on riscv32 fails with the =
following error message: "HTIF tohost must be 8 bytes"
>>=20
>> This happens regardless of which program I have translated for Spike. =
This is also the case with the official riscv-compliance tests, for =
example.
>>=20
>> The query "if (st_size !=3D 8)" in the HTIF device always fails, =
because st_size seems to be always 0.
>>=20
>> To be able to reproduce it:
>> - QEMU GIT Hash: d0ed6a69d399ae193959225cdeaa9382746c91cc (tag =
"v5.1.0")
>=20
> I just checked with this hash and with the current master and on both
> I can run a ELF executable on the Spike machine for RV32.
>=20
>> - System: Mac OS 10.14.6 (Darwin Kernel Version 18.7.0)
>> - Compiler: Latest SiFive Build for GCC under OSX
>=20
> Maybe try using an official toolchain instead of a vendor fork.
>=20
> Alistair
>=20
>> - Command: qemu-system-riscv32 -M spike -nographic -bios none -kernel =
<ANY_SPIKE_ELF_FILE>
>>=20
>> Best regards,
>> Peer Adelt


