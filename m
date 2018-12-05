Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gUWsW-0000cP-3e
	for mharc-qemu-riscv@gnu.org; Wed, 05 Dec 2018 08:06:14 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43682)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <viktor.prutyanov@phystech.edu>) id 1gUUic-0004oL-BO
	for qemu-riscv@nongnu.org; Wed, 05 Dec 2018 05:47:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <viktor.prutyanov@phystech.edu>) id 1gUUiY-0006Pe-5i
	for qemu-riscv@nongnu.org; Wed, 05 Dec 2018 05:47:50 -0500
Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244]:39491)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <viktor.prutyanov@phystech.edu>)
	id 1gUUiX-0006Jq-Kx
	for qemu-riscv@nongnu.org; Wed, 05 Dec 2018 05:47:46 -0500
Received: by mail-lj1-x244.google.com with SMTP id t9-v6so17853679ljh.6
	for <qemu-riscv@nongnu.org>; Wed, 05 Dec 2018 02:47:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=phystech-edu.20150623.gappssmtp.com; s=20150623;
	h=date:from:to:cc:subject:message-id:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=rWYL5P9mVbix74RlMYEr2ZQ3ZLGN3tbpAR9O2wstoGA=;
	b=zPVbrP5bY9XCi54hYy+q/JgdtngUdFg4LptbgrEX389U3RJU7I5TjDiAZxZxEx003h
	0VucpNZeGXBvLT4YTnfdpqaIEyg6fUEIgSa6keZjFFbBnk8zQbuYiERIXVtjdWlypbFr
	8THn5RmreiLfCSwLXWXBtYdRhPWnJqCUqOzWtOJj3NE1a+y4xnlokYOxjsrshn5HgzsO
	xcXpyPg9hLvpgzsfXZz1TlASieAJS7nWDGJcZ+MA1WxDUHFQGEV3ZoHFAE1alXUGO0l4
	2tlJurk/dPxbzgJRz/ee4j3wgSQ3DF7gppM2aw1L1ZjHfnPAMpnlR26ktD3kguNrKpMU
	pu4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=rWYL5P9mVbix74RlMYEr2ZQ3ZLGN3tbpAR9O2wstoGA=;
	b=DLEJeH572SWVMSNlzjkXPxMJDNUJuef48GGQ1wdImqQzAj43n6nYtCNEaLNXnjlK5k
	NVScdjaohyGJ0m6+LeqzsIO5MhYzQNVz7+SGznenYFxGuDa/mRS2fSWwQJEQAjn7qX9L
	x2SZNmPI2A70RbIzOb6d2tCza3xUIadnjaqNkLLRHFHRVk9wjJdkpTqMBw/9P2MYonnZ
	v9Hnu0KY6T8e1JUVGI+2Bdnb9sRvJofOcUhL2KxOyyIVbjUP3KhQWHa0wgNOvUpygQ0Z
	3O0amjMmF+Hl88PDpczLHmjEeeu+Kn5kJd/gibZWmsqheqtLRPHSVeyxMLZG3M5sHmTU
	J3vA==
X-Gm-Message-State: AA+aEWY7+Rc090dqLHxBiRS6yvaCnquRn+tXmhDq8MnBnxJbTfT0JzRr
	G8qnWhb7fnHDPPXB6FL9s0NDxg==
X-Google-Smtp-Source: AFSGD/W+CVfcs6KOqPSbpnPnrLFiBTBUekCqZsOF58o2KID+f4ZooaeHHPWRzfT0C0U6kBUPCja/ug==
X-Received: by 2002:a2e:131a:: with SMTP id
	26-v6mr16634312ljt.107.1544006864110; 
	Wed, 05 Dec 2018 02:47:44 -0800 (PST)
Received: from localhost ([93.175.11.132])
	by smtp.gmail.com with ESMTPSA id 10sm3504336lff.62.2018.12.05.02.47.43
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 05 Dec 2018 02:47:43 -0800 (PST)
Date: Wed, 5 Dec 2018 13:47:38 +0300
From: Viktor Prutyanov <viktor.prutyanov@phystech.edu>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, Yuval Shaia <yuval.shaia@oracle.com>, Marcel
	Apfelbaum <marcel.apfelbaum@gmail.com>, Cornelia Huck <cohuck@redhat.com>, 
	Alex Williamson <alex.williamson@redhat.com>, Christian Borntraeger
	<borntraeger@de.ibm.com>, Tony Krowiak <akrowiak@linux.ibm.com>, Halil
	Pasic <pasic@linux.ibm.com>, Pierre Morel <pmorel@linux.ibm.com>, Paolo
	Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>, Eduardo
	Habkost <ehabkost@redhat.com>, Michael Clark <mjc@sifive.com>, Palmer
	Dabbelt <palmer@sifive.com>, Alistair Francis <Alistair.Francis@wdc.com>,
	Sagar Karandikar <sagark@eecs.berkeley.edu>, Bastian Koppelmann
	<kbastian@mail.uni-paderborn.de>, Stefan Berger <stefanb@linux.ibm.com>,
	qemu-s390x@nongnu.org, qemu-riscv@nongnu.org
Message-ID: <20181205134738.30b1cd18@phystech.edu>
In-Reply-To: <20181204172535.2799-1-armbru@redhat.com>
References: <20181204172535.2799-1-armbru@redhat.com>
Organization: MIPT
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::244
X-Mailman-Approved-At: Wed, 05 Dec 2018 08:06:08 -0500
Subject: Re: [Qemu-riscv] [PATCH] Clean up includes
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
X-List-Received-Date: Wed, 05 Dec 2018 10:47:51 -0000

On Tue,  4 Dec 2018 18:25:35 +0100
Markus Armbruster <armbru@redhat.com> wrote:

> Clean up includes so that osdep.h is included first and headers
> which it implies are not included manually.
> 
> This commit was created with scripts/clean-includes, with the changes
> to the following files manually reverted:
> 
>     contrib/libvhost-user/libvhost-user-glib.h
>     contrib/libvhost-user/libvhost-user.c
>     contrib/libvhost-user/libvhost-user.h
>     linux-user/mips64/cpu_loop.c
>     linux-user/mips64/signal.c
>     linux-user/sparc64/cpu_loop.c
>     linux-user/sparc64/signal.c
>     linux-user/x86_64/cpu_loop.c
>     linux-user/x86_64/signal.c
>     target/s390x/gen-features.c
>     tests/migration/s390x/a-b-bios.c
>     tests/test-rcu-simpleq.c
>     tests/test-rcu-tailq.c
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---

For the elf2dmp:

>  contrib/elf2dmp/pdb.h                     | 2 --
>  contrib/elf2dmp/pe.h                      | 1 -
>  contrib/elf2dmp/qemu_elf.h                | 1 -

Acked-by: Viktor Prutyanov <viktor.prutyanov@phystech.edu>

-- 
Viktor Prutyanov

