Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gtxEi-0002wO-1i
	for mharc-qemu-riscv@gnu.org; Wed, 13 Feb 2019 11:18:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38510)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kbastian@mail.uni-paderborn.de>) id 1gtxEe-0002t8-B1
	for qemu-riscv@nongnu.org; Wed, 13 Feb 2019 11:18:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kbastian@mail.uni-paderborn.de>) id 1gtxEd-00049a-GI
	for qemu-riscv@nongnu.org; Wed, 13 Feb 2019 11:18:08 -0500
Received: from mail.uni-paderborn.de ([131.234.142.9]:45912)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kbastian@mail.uni-paderborn.de>)
	id 1gtxEZ-00044u-Eb; Wed, 13 Feb 2019 11:18:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=mail.uni-paderborn.de; s=20170601;
	h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:
	Sender:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=UGeILxPQcEYp4MLFbSw4iW0WinhJmTVkaL81DC3qLr0=;
	b=gvpXd4Fuo8NSRxKzod34M/4Dir
	ix2NaFTrH05E8URBxMYIrxNNzvvsoit9OCoa0OXOOT7L3/nRnKjj2kJs25miyhH1JcxWlHL/Mx5AT
	sAXZwzPhUyuK1MmNJtYUNBaWe0sLpMvtjV/axRcx8tpJV7AsAAC1Sr1nR+H5TBE46PuE=; 
To: Palmer Dabbelt <palmer@sifive.com>, qemu-riscv@nongnu.org
Cc: qemu-devel@nongnu.org
References: <20190213155414.22285-1-palmer@sifive.com>
	<20190213155414.22285-2-palmer@sifive.com>
From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Message-ID: <0ba65ec0-803b-8aff-c562-ab56e317d48a@mail.uni-paderborn.de>
Date: Wed, 13 Feb 2019 17:18:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.5.0
MIME-Version: 1.0
In-Reply-To: <20190213155414.22285-2-palmer@sifive.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US-large
X-IMT-Spam-Score: 0.0 ()
X-PMX-Version: 6.4.6.2792898, Antispam-Engine: 2.7.2.2107409,
	Antispam-Data: 2019.2.13.160618, AntiVirus-Engine: 5.56.1,
	AntiVirus-Data: 2019.1.23.5561002
X-IMT-Authenticated-Sender: kbastian@UNI-PADERBORN.DE
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 131.234.142.9
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH v7 01/35] target/riscv: Move
 CPURISCVState pointer to DisasContext
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
X-List-Received-Date: Wed, 13 Feb 2019 16:18:10 -0000


On 2/13/19 4:53 PM, Palmer Dabbelt wrote:
> From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
>
> CPURISCVState is rarely used, so there is no need to pass it to every
> translate function. This paves the way for decodetree which only passes
> DisasContext to translate functions.
>
> Reviewed-by: Palmer Dabbelt <palmer@sifive.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
> ---
>   target/riscv/translate.c | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)

We can drop this patch as you pull request already fixes this. (see 
https://patchwork.kernel.org/patch/10794241/)

Cheers,

Bastian


