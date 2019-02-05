Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gqy94-0003UC-8F
	for mharc-qemu-riscv@gnu.org; Tue, 05 Feb 2019 05:40:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37621)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cohuck@redhat.com>) id 1gqy92-0003Sh-CO
	for qemu-riscv@nongnu.org; Tue, 05 Feb 2019 05:40:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cohuck@redhat.com>) id 1gqy8y-00028o-Hc
	for qemu-riscv@nongnu.org; Tue, 05 Feb 2019 05:39:58 -0500
Received: from mx1.redhat.com ([209.132.183.28]:59332)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <cohuck@redhat.com>)
	id 1gqy8r-0001rY-Ef; Tue, 05 Feb 2019 05:39:49 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 31F11A7E1;
	Tue,  5 Feb 2019 10:32:32 +0000 (UTC)
Received: from gondolin (dhcp-192-187.str.redhat.com [10.33.192.187])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 82C31183D4;
	Tue,  5 Feb 2019 10:32:21 +0000 (UTC)
Date: Tue, 5 Feb 2019 11:32:19 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
	Stefano Garzarella <sgarzare@redhat.com>, David Gibson
	<david@gibson.dropbear.id.au>, Halil Pasic <pasic@linux.ibm.com>, Christian
	Borntraeger <borntraeger@de.ibm.com>, Richard Henderson <rth@twiddle.net>, 
	David Hildenbrand <david@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Fam Zheng <fam@euphon.net>, Markus Armbruster <armbru@redhat.com>, Michael
	Roth <mdroth@linux.vnet.ibm.com>, Michael Clark <mjc@sifive.com>, Palmer
	Dabbelt <palmer@sifive.com>, Alistair Francis <Alistair.Francis@wdc.com>,
	Sagar Karandikar <sagark@eecs.berkeley.edu>, Bastian Koppelmann
	<kbastian@mail.uni-paderborn.de>, Gerd Hoffmann <kraxel@redhat.com>,
	qemu-s390x@nongnu.org (open list:S390 Virtio-ccw), qemu-ppc@nongnu.org
	(open list:PowerPC)
Message-ID: <20190205113219.0c1311e0.cohuck@redhat.com>
In-Reply-To: <20190204211204.27321-3-philmd@redhat.com>
References: <20190204211204.27321-1-philmd@redhat.com>
	<20190204211204.27321-3-philmd@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Tue, 05 Feb 2019 10:32:33 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-riscv] [PATCH v3 2/3] util/cutils: Move ctype macros to
 "cutils.h"
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
X-List-Received-Date: Tue, 05 Feb 2019 10:40:01 -0000

On Mon,  4 Feb 2019 22:12:03 +0100
Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> wrote:

> Introduced in cd390083ad1, these macros don't need to be in
> a generic header.
> Add documentation to justify their use.
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
> Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
> ---
> v2: Fixed checkpatch warnings (tabs)
> ---
>  hw/core/bus.c              |  2 +-
>  hw/core/qdev-properties.c  |  1 +
>  hw/s390x/s390-virtio-ccw.c |  1 +
>  hw/scsi/scsi-generic.c     |  2 +-
>  include/qemu-common.h      | 16 ----------------
>  include/qemu/cutils.h      | 25 +++++++++++++++++++++++++
>  qapi/qapi-util.c           |  2 +-
>  qobject/json-parser.c      |  1 -
>  target/ppc/monitor.c       |  1 +
>  target/riscv/cpu.c         |  1 +
>  ui/keymaps.c               |  1 +
>  util/id.c                  |  2 +-
>  util/readline.c            |  1 -
>  13 files changed, 34 insertions(+), 22 deletions(-)

> diff --git a/include/qemu/cutils.h b/include/qemu/cutils.h
> index 9ee40470e3..644f2d75bd 100644
> --- a/include/qemu/cutils.h
> +++ b/include/qemu/cutils.h
> @@ -3,6 +3,31 @@
> =20
>  #include "qemu/fprintf-fn.h"
> =20
> +/**
> + * unsigned ctype macros:
> + *
> + * The standards require that the argument for these functions
> + * is either EOF or a value that is representable in the type
> + * unsigned char. If the argument is of type char, it must be
> + * cast to unsigned char. This is what these macros do,
> + * avoiding 'signed to unsigned' conversion warnings.

I'd add

"Note that these macros are intended for use with char arguments only,
they cannot handle EOF."

> + */
> +#define qemu_isalnum(c)     isalnum((unsigned char)(c))
> +#define qemu_isalpha(c)     isalpha((unsigned char)(c))
> +#define qemu_iscntrl(c)     iscntrl((unsigned char)(c))
> +#define qemu_isdigit(c)     isdigit((unsigned char)(c))
> +#define qemu_isgraph(c)     isgraph((unsigned char)(c))
> +#define qemu_islower(c)     islower((unsigned char)(c))
> +#define qemu_isprint(c)     isprint((unsigned char)(c))
> +#define qemu_ispunct(c)     ispunct((unsigned char)(c))
> +#define qemu_isspace(c)     isspace((unsigned char)(c))
> +#define qemu_isupper(c)     isupper((unsigned char)(c))
> +#define qemu_isxdigit(c)    isxdigit((unsigned char)(c))
> +#define qemu_tolower(c)     tolower((unsigned char)(c))
> +#define qemu_toupper(c)     toupper((unsigned char)(c))
> +#define qemu_isascii(c)     isascii((unsigned char)(c))
> +#define qemu_toascii(c)     toascii((unsigned char)(c))
> +
>  /**
>   * pstrcpy:
>   * @buf: buffer to copy string into

With that added,

Reviewed-by: Cornelia Huck <cohuck@redhat.com>

