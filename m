Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gwVH3-0000cW-SJ
	for mharc-qemu-riscv@gnu.org; Wed, 20 Feb 2019 12:03:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38234)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kbastian@mail.uni-paderborn.de>) id 1gwVH1-0000aQ-J4
	for qemu-riscv@nongnu.org; Wed, 20 Feb 2019 12:03:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kbastian@mail.uni-paderborn.de>) id 1gwVH0-0000tE-Kc
	for qemu-riscv@nongnu.org; Wed, 20 Feb 2019 12:03:07 -0500
Received: from mail.uni-paderborn.de ([131.234.142.9]:51602)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kbastian@mail.uni-paderborn.de>)
	id 1gwVGx-0000pb-KU; Wed, 20 Feb 2019 12:03:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=mail.uni-paderborn.de; s=20170601;
	h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:
	Sender:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=5gymRTuk8cj28T4c7EAQxeBpdEDJQNXHT9HLzEh2qUs=;
	b=LPIgg6jfU5w8kFNv1XCqi9edpz
	FmdWEHH3VtQXVqpaae7+fwguo6UJEr5LOjIVdSwcaWIlKq5edr7WSCMuFu4G06hw/hnQTwzxhRGCa
	OFI2Vl32MSh8Ah+UFvOZQHirnxqVtu1VOiQGUOxpLMFotcs7rheNfDmDvBtynIfzuwUM=; 
To: Palmer Dabbelt <palmer@sifive.com>, qemu-riscv@nongnu.org
Cc: qemu-devel@nongnu.org
References: <20190213155414.22285-1-palmer@sifive.com>
From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Message-ID: <7cf246c6-1bb7-6479-7448-750a9f9801e0@mail.uni-paderborn.de>
Date: Wed, 20 Feb 2019 18:02:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <20190213155414.22285-1-palmer@sifive.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US-large
X-IMT-Spam-Score: 0.0 ()
X-PMX-Version: 6.4.6.2792898, Antispam-Engine: 2.7.2.2107409,
	Antispam-Data: 2019.2.20.165416, AntiVirus-Engine: 5.58.0,
	AntiVirus-Data: 2019.2.19.5580002
X-IMT-Authenticated-Sender: kbastian@UNI-PADERBORN.DE
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 131.234.142.9
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH v7 00/35] target/riscv:
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
X-List-Received-Date: Wed, 20 Feb 2019 17:03:08 -0000

Hi Palmer,

On 2/13/19 4:53 PM, Palmer Dabbelt wrote:
> Palmer: I caused some merge conflicts in Bastian's patch set so I
> figured I'd attempt to clean these up.  As far as I'm concerned v6 was
> good to go, but since the merge conflicts were fairly extensive (if
> somewhat mechanical) I'd like to pass the baton back to Bastian here for
> at least a sanity check.


Thanks for doing the merge. I will have time on Friday to integrate my 
nitpicks and send a v8. Then it should be good to be merged.

Cheers,

Bastian


