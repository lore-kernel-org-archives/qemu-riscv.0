Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kTRCr-0004cn-Jt
	for mharc-qemu-riscv@gnu.org; Fri, 16 Oct 2020 10:59:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <adelt@hni.upb.de>)
 id 1kTMii-0004TM-Cl; Fri, 16 Oct 2020 06:12:21 -0400
Received: from zuban.uni-paderborn.de ([2001:638:502:c003::17]:47374)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <adelt@hni.upb.de>)
 id 1kTMid-0002qF-EY; Fri, 16 Oct 2020 06:12:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=hni.uni-paderborn.de; s=20170601; h=To:Cc:Date:Message-Id:Subject:
 Mime-Version:Content-Transfer-Encoding:Content-Type:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NsyoKU5JYCFe/mYWFtpP8suMkzdEmg4/dVRmG7SLcZ0=; b=P7YPgkFmxPYO1jyDEEA9WQH4as
 2qJ+hAWbNwiktK0flNmwGmgjVpKNQ+rA0IEYAnYqf/7ESvonnz9tZpU7zSXSERJuFeu6lZ3mYANNj
 9qRKTdhZMdjI3tiJcT/s0x6AYeiq5RmgT6m42Gc7mk9RioX6WFic+LrF343dO2/YK3ms=;
From: Peer Adelt <adelt@hni.upb.de>
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.15\))
Subject: HTIF tohost symbol size check always fails
Message-Id: <B96DF081-AEDD-470E-A99C-8A9536E0A8CE@hni.upb.de>
Date: Fri, 16 Oct 2020 12:12:05 +0200
Cc: qemu-devel@nongnu.org,
 sagark@eecs.berkeley.edu
To: qemu-riscv@nongnu.org
X-Mailer: Apple Mail (2.3445.104.15)
X-IMT-Spam-Score: 0.0 ()
X-PMX-Version: 6.4.9.2830568, Antispam-Engine: 2.7.2.2107409,
 Antispam-Data: 2020.10.16.100318, AntiVirus-Engine: 5.77.0,
 AntiVirus-Data: 2020.9.28.5770001
X-Sophos-SenderHistory: ip=37.24.125.142, fs=43337703, da=90452191, mc=238,
 sc=1, hc=237, sp=0, fso=43337703, re=0, sd=0, hd=0
X-IMT-Authenticated-Sender: uid=adelt,ou=People,o=upb,c=de
Received-SPF: neutral client-ip=2001:638:502:c003::17;
 envelope-from=adelt@hni.upb.de; helo=zuban.uni-paderborn.de
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, SPF_HELO_NONE=0.001,
 SPF_NEUTRAL=0.779 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 16 Oct 2020 10:59:44 -0400
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
X-List-Received-Date: Fri, 16 Oct 2020 10:12:22 -0000

Hi,

I have a problem with the RISC-V HTIF device.=20

Every binary I have compiled for Spike on riscv32 fails with the =
following error message: "HTIF tohost must be 8 bytes"

This happens regardless of which program I have translated for Spike. =
This is also the case with the official riscv-compliance tests, for =
example.

The query "if (st_size !=3D 8)" in the HTIF device always fails, because =
st_size seems to be always 0.

To be able to reproduce it:
- QEMU GIT Hash: d0ed6a69d399ae193959225cdeaa9382746c91cc (tag "v5.1.0")
- System: Mac OS 10.14.6 (Darwin Kernel Version 18.7.0)
- Compiler: Latest SiFive Build for GCC under OSX
- Command: qemu-system-riscv32 -M spike -nographic -bios none -kernel =
<ANY_SPIKE_ELF_FILE>

Best regards,
Peer Adelt=

