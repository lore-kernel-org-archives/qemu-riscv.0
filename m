Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gyH2K-0001hR-DQ
	for mharc-qemu-riscv@gnu.org; Mon, 25 Feb 2019 09:15:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51545)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1gyH2D-0001bk-Lk
	for qemu-riscv@nongnu.org; Mon, 25 Feb 2019 09:15:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1gyH2B-0004fr-Um
	for qemu-riscv@nongnu.org; Mon, 25 Feb 2019 09:15:09 -0500
Received: from mx1.redhat.com ([209.132.183.28]:40370)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1gyH28-0004b9-UB; Mon, 25 Feb 2019 09:15:05 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E6760300162D;
	Mon, 25 Feb 2019 14:14:51 +0000 (UTC)
Received: from [10.3.116.222] (ovpn-116-222.phx2.redhat.com [10.3.116.222])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 162D85D71C;
	Mon, 25 Feb 2019 14:14:50 +0000 (UTC)
To: Amed Magdy <amagdy.afifi@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, sagark@eecs.berkeley.edu,
	kbastian@mail.uni-paderborn.de, palmer@sifive.com, mjc@sifive.com,
	Alistair.Francis@wdc.com
References: <20190222162555.13764-1-amagdy.afifi@gmail.com>
	<20190222162555.13764-2-amagdy.afifi@gmail.com>
	<8f36a26e-7e20-1b9c-18bd-a5ce4b3d9c14@redhat.com>
	<CAKV=O7=JK4t7VxQ74LvjVpM9+TQ6MJ0hA9_XX40ud7OEsh30hQ@mail.gmail.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <b9623b11-0bf9-4dc0-7605-c68601eb1fb5@redhat.com>
Date: Mon, 25 Feb 2019 08:14:50 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.5.0
MIME-Version: 1.0
In-Reply-To: <CAKV=O7=JK4t7VxQ74LvjVpM9+TQ6MJ0hA9_XX40ud7OEsh30hQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.48]);
	Mon, 25 Feb 2019 14:14:52 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH] riscv: Add proper alignment
 check and pending 'C' extension upon misa writes
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
X-List-Received-Date: Mon, 25 Feb 2019 14:15:15 -0000

On 2/24/19 2:07 AM, Amed Magdy wrote:
> Thank you so much, Eric.
> 
> Sorry about this unclear description.
> I forgot to fix user name in git configuration before submitting the patch.
> 
> Sorry about any inconvenience.

Don't worry about it. We were all once first-time contributors, and it
can be a large learning curve.


-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org

