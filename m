Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gxf7l-0003Tg-Tt
	for mharc-qemu-riscv@gnu.org; Sat, 23 Feb 2019 16:46:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53308)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1gxf7h-0003Ru-1j
	for qemu-riscv@nongnu.org; Sat, 23 Feb 2019 16:46:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1gxf7f-0008DV-R9
	for qemu-riscv@nongnu.org; Sat, 23 Feb 2019 16:46:16 -0500
Received: from mx1.redhat.com ([209.132.183.28]:36732)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1gxf7X-0007KU-9f; Sat, 23 Feb 2019 16:46:09 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1C5FB81F0D;
	Sat, 23 Feb 2019 21:46:01 +0000 (UTC)
Received: from [10.3.116.222] (ovpn-116-222.phx2.redhat.com [10.3.116.222])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 128D45C297;
	Sat, 23 Feb 2019 21:45:59 +0000 (UTC)
To: amagdy.afifi@gmail.com, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, sagark@eecs.berkeley.edu,
	kbastian@mail.uni-paderborn.de, palmer@sifive.com, mjc@sifive.com,
	Alistair.Francis@wdc.com
References: <20190222162555.13764-1-amagdy.afifi@gmail.com>
	<20190222162555.13764-2-amagdy.afifi@gmail.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <8f36a26e-7e20-1b9c-18bd-a5ce4b3d9c14@redhat.com>
Date: Sat, 23 Feb 2019 15:45:59 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.5.0
MIME-Version: 1.0
In-Reply-To: <20190222162555.13764-2-amagdy.afifi@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Sat, 23 Feb 2019 21:46:01 +0000 (UTC)
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
X-List-Received-Date: Sat, 23 Feb 2019 21:46:18 -0000

On 2/22/19 10:25 AM, amagdy.afifi@gmail.com wrote:
> From: ahmed_magdy <amagdy.afifi@gmail.com>
> 
> Signed-off-by: ahmed_magdy <amagdy.afifi@gmail.com>

This appears to be your first contribution to qemu. Welcome to the
community!

Typically, a Signed-off-by designation should be a proper name (what you
would sign a legal document with, as it has a legal significance on your
right to contribute the code).  Using all lowercase and _ instead of
space looks like a username, and while I am not one to tell you it can't
be a legal name, it is unusual enough to at least raise my suspicions.

Furthermore, your commit message doesn't give any details beyond the
"what" in the subject line. The body of the commit message should
explain the "why" (what bug are you fixing, how to reproduce it), so
that a reviewer stands a chance of determining if the code matches the
description you gave, and if the issue you describe really does warrant
the inclusion of your patch.  You gave a brief "why" in your cover letter:

"I'm submiting this patch to properly check the next instruction
alignment and scheduale compression extenstion enable upon 'MISA'
register writes to later aligned instruction through exporting next
instruction 'pc' to riscv cpu state"

where it would be wise to include an improved version of that text with
this commit proper (since the cover letter does not get applied to git).
 For that matter, when sending a single patch, a cover letter is
optional (it is only mandatory when sending a multi-patch series).

For more patch submission hints, see:
https://wiki.qemu.org/Contribute/SubmitAPatch

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org

