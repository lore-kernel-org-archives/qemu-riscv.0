Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gudJN-0005ZO-CI
	for mharc-qemu-riscv@gnu.org; Fri, 15 Feb 2019 08:13:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42575)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kbastian@mail.uni-paderborn.de>) id 1gudJL-0005X0-70
	for qemu-riscv@nongnu.org; Fri, 15 Feb 2019 08:13:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kbastian@mail.uni-paderborn.de>) id 1gudJK-0006kF-7P
	for qemu-riscv@nongnu.org; Fri, 15 Feb 2019 08:13:47 -0500
Received: from mail.uni-paderborn.de ([131.234.142.9]:52316)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kbastian@mail.uni-paderborn.de>)
	id 1gudJD-0006d7-TR; Fri, 15 Feb 2019 08:13:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=mail.uni-paderborn.de; s=20170601;
	h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:
	Sender:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=rFepp70fo5ej/xHa+6FHVwJqqBwJIZ+f2B3LLKHfmF0=;
	b=m8Fo7PK6nVqm9islKieiN2xjR+
	KV3ZKUqz8wh+YhqR7XhE0qaPJbFMaqJUDqBJtErtKtYCyuvF0AqweJ2+UrsEsy2YPr6J6pXrL8My3
	LiyrwrvLN5rbcXWgLc4HabEwmqhvG6o9aiV9nrhyo1g/DYm0uI+tqkFtQ5/yb6TYYNzc=; 
To: Palmer Dabbelt <palmer@sifive.com>, qemu-riscv@nongnu.org
Cc: qemu-devel@nongnu.org
References: <20190213155414.22285-1-palmer@sifive.com>
From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Message-ID: <f685083e-4263-be01-c54f-22d3587fe7ab@mail.uni-paderborn.de>
Date: Fri, 15 Feb 2019 14:13:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.5.0
MIME-Version: 1.0
In-Reply-To: <20190213155414.22285-1-palmer@sifive.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US-large
X-IMT-Spam-Score: 0.0 ()
X-PMX-Version: 6.4.6.2792898, Antispam-Engine: 2.7.2.2107409,
	Antispam-Data: 2019.2.15.130616, AntiVirus-Engine: 5.56.1,
	AntiVirus-Data: 2019.1.23.5561002
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
X-List-Received-Date: Fri, 15 Feb 2019 13:13:48 -0000


On 2/13/19 4:53 PM, Palmer Dabbelt wrote:
> Palmer: I caused some merge conflicts in Bastian's patch set so I
> figured I'd attempt to clean these up.  As far as I'm concerned v6 was
> good to go, but since the merge conflicts were fairly extensive (if
> somewhat mechanical) I'd like to pass the baton back to Bastian here for
> at least a sanity check.


Except for my few remark, it looks good to me :). And for what its worth:

Tested-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de

Cheers,

Bastian



