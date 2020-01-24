Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iutAn-0005ls-E4
	for mharc-qemu-riscv@gnu.org; Fri, 24 Jan 2020 02:14:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42520)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <thuth@redhat.com>) id 1iutAl-0005jP-3j
 for qemu-riscv@nongnu.org; Fri, 24 Jan 2020 02:14:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <thuth@redhat.com>) id 1iutAj-00064p-Pr
 for qemu-riscv@nongnu.org; Fri, 24 Jan 2020 02:14:30 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:39702
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <thuth@redhat.com>) id 1iutAj-00063B-NK
 for qemu-riscv@nongnu.org; Fri, 24 Jan 2020 02:14:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579850069;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:openpgp:openpgp;
 bh=cQ9gL/KOwh3t5IosdL0LXKwdsA6JTafa+gJobfej92A=;
 b=OMLLVtH8sRYyGWz9IkE9FOUftwwdjQhfZtJ9TlMqMJolSkd7rDLQFiL2lFxs5Y6ug/fYlx
 7d38N/PPi+cED+0rjEQsHG+3Y80B6q7dCEGRvrE25Uks/uJUhrX4RiSIZhuo3TpbPIqCIq
 pbrXtBe1aVPM5hv6O7aDkS5qbFUcKEE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-59-Kj88nHq1NjmORWbJCDk4yQ-1; Fri, 24 Jan 2020 02:14:26 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1D35E1882CC0;
 Fri, 24 Jan 2020 07:14:24 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-116-156.ams2.redhat.com [10.36.116.156])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0D3F35D9E2;
 Fri, 24 Jan 2020 07:14:13 +0000 (UTC)
Subject: Re: [PATCH rc2 14/25] target/avr: Add section about AVR into QEMU
 documentation
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, mrolnik@gmail.com, richard.henderson@linaro.org,
 me@xcancerberox.com.ar
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 Paolo Bonzini <pbonzini@redhat.com>, S.E.Harris@kent.ac.uk,
 qemu-riscv@nongnu.org, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@redhat.com>, Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 imammedo@redhat.com, Markus Armbruster <armbru@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Fam Zheng <fam@euphon.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Eric Blake
 <eblake@redhat.com>, Sagar Karandikar <sagark@eecs.berkeley.edu>,
 aleksandar.m.mail@gmail.com, =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?=
 <marcandre.lureau@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, dovgaluk@ispras.ru,
 Eduardo Habkost <ehabkost@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>
References: <20200124005131.16276-1-f4bug@amsat.org>
 <20200124005131.16276-15-f4bug@amsat.org>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <50348fa2-0fda-78fd-ad64-f7cc94d6d158@redhat.com>
Date: Fri, 24 Jan 2020 08:14:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200124005131.16276-15-f4bug@amsat.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: Kj88nHq1NjmORWbJCDk4yQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 207.211.31.120
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
X-List-Received-Date: Fri, 24 Jan 2020 07:14:32 -0000

On 24/01/2020 01.51, Philippe Mathieu-Daud=C3=A9 wrote:
> From: Michael Rolnik <mrolnik@gmail.com>
>=20
> Signed-off-by: Michael Rolnik <mrolnik@gmail.com>
> Message-Id: <20200118191416.19934-16-mrolnik@gmail.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> [PMD: Fixed typos]
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
> rc2: Fixed typos, s/sample/Arduino/, removed -serial section (thuth)
> ---
>  qemu-doc.texi | 51 +++++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 51 insertions(+)
>=20
> diff --git a/qemu-doc.texi b/qemu-doc.texi
> index 39f950471f..89df1d325e 100644
> --- a/qemu-doc.texi
> +++ b/qemu-doc.texi
> @@ -1741,6 +1741,7 @@ differences are mentioned in the following sections=
.
>  * Microblaze System emulator::
>  * SH4 System emulator::
>  * Xtensa System emulator::
> +* AVR System emulator::
>  @end menu
> =20
>  @node PowerPC System emulator
> @@ -2514,6 +2515,56 @@ so should only be used with trusted guest OS.
> =20
>  @c man end
> =20
> +@node AVR System emulator
> +@section AVR System emulator
> +@cindex system emulation (AVR)
> +
> +Use the executable @file{qemu-system-avr} to emulates a AVR 8 bit based =
machine
> +having one for the following cores: avr1, avr2, avr25, avr3, avr31, avr3=
5, avr4,
> +avr5, avr51, avr6, avrtiny, xmega2, xmega3, xmega4, xmega5, xmega6 and x=
mega7.
> +
> +As for now it supports few Arduino boards for educational and testing pu=
rposes.
> +These boards use a ATmega controller, which model is limited to USART & =
16 bit
> +timer devices, enought to run FreeRTOS based applications (like this @ur=
l{https://github.com/seharris/qemu-avr-tests/blob/master/free-rtos/Demo/AVR=
_ATMega2560_GCC/demo.elf,,demo})
> +
> +Following are examples of possible usages, assuming program.elf is compi=
led for
> +AVR cpu
> +@itemize
> +
> +@item Continuous non interrupted execution
> +@example
> +qemu-system-avr -kernel program.elf
> +@end example
> +
> +@item Continuous non interrupted execution with serial output into telne=
t window
> +@example
> +qemu-system-avr -kernel program.elf -serial tcp::5678,server,nowait -nog=
raphic
> +@end example
> +and then in another shell
> +@example
> +telnet localhost 5678
> +@end example
> +
> +@item Debugging wit GDB debugger
> +@example
> +qemu-system-avr -kernel program.elf -s -S
> +@end example
> +and then in another shell
> +@example
> +avr-gdb program.elf
> +@end example
> +and then within GDB shell
> +@example
> +target remote :1234
> +@end example
> +
> +@item Print out executed instructions
> +@example
> +qemu-system-avr -kernel program.elf -d in_asm

If you don't have a default board anymore, I think you need to list -M
here, too.
And didn't you mention that -kernel is not working anyway? Do you need
to replace it with -bios ?

 Thomas


