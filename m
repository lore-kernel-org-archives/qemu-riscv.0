Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gRDA8-0007zY-5N
	for mharc-qemu-riscv@gnu.org; Mon, 26 Nov 2018 04:26:40 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40864)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kbastian@mail.uni-paderborn.de>) id 1gRDA5-0007zC-UZ
	for qemu-riscv@nongnu.org; Mon, 26 Nov 2018 04:26:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kbastian@mail.uni-paderborn.de>) id 1gRDA1-0001QY-QR
	for qemu-riscv@nongnu.org; Mon, 26 Nov 2018 04:26:37 -0500
Received: from mail.uni-paderborn.de ([131.234.142.9]:52400)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kbastian@mail.uni-paderborn.de>)
	id 1gRDA1-0001PH-JN
	for qemu-riscv@nongnu.org; Mon, 26 Nov 2018 04:26:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=mail.uni-paderborn.de; s=20170601;
	h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:
	Sender:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=OegC47jVmDVD1WS9QxAiVgNMftZcfSxViB2Riky+JAg=;
	b=bnyd/AQyz/QKXJ37QFtl21cf/t
	eueFxpvTx9KCg1r6yaJAh+pOE2rDB55UNyB7LcLf8VAQBn344Ahhq0o3/8Kjavaw54v5A1zW9zHvD
	H/RFcMrCy5s3/JBBXTyx4qbcwwbzwepMTqb5Lj+ykUiDbuZ/TbBD3ta+SLNyXdTPpr0c=; 
To: Mao Zhongyi <maozhongyi@cmss.chinamobile.com>, qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: sagark@eecs.berkeley.edu, palmer@sifive.com, mjc@sifive.com,
	Alistair.Francis@wdc.com, philmd@redhat.com
References: <20181126032038.22044-1-maozhongyi@cmss.chinamobile.com>
From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Message-ID: <d17b7767-a72f-a84a-a65d-d848db42d030@mail.uni-paderborn.de>
Date: Mon, 26 Nov 2018 10:06:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.1
MIME-Version: 1.0
In-Reply-To: <20181126032038.22044-1-maozhongyi@cmss.chinamobile.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US-large
X-IMT-Spam-Score: 0.0 ()
X-PMX-Version: 6.4.6.2792898, Antispam-Engine: 2.7.2.2107409,
	Antispam-Data: 2018.11.26.85717, AntiVirus-Engine: 5.53.0,
	AntiVirus-Data: 2018.11.13.5530001
X-IMT-Authenticated-Sender: kbastian@UNI-PADERBORN.DE
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 131.234.142.9
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH] riscv/cpu: use
 device_class_set_parent_realize
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
X-List-Received-Date: Mon, 26 Nov 2018 09:26:38 -0000

On 11/26/18 4:20 AM, Mao Zhongyi wrote:
> Signed-off-by: Mao Zhongyi <maozhongyi@cmss.chinamobile.com>
> ---
>   target/riscv/cpu.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>

Reviewed-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>

Cheers,

Bastian


