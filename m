Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iut94-0004dc-0B
	for mharc-qemu-riscv@gnu.org; Fri, 24 Jan 2020 02:12:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42346)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <thuth@redhat.com>) id 1iut90-0004by-W2
 for qemu-riscv@nongnu.org; Fri, 24 Jan 2020 02:12:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <thuth@redhat.com>) id 1iut90-00055b-21
 for qemu-riscv@nongnu.org; Fri, 24 Jan 2020 02:12:42 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:25340
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <thuth@redhat.com>) id 1iut8z-00054s-VH
 for qemu-riscv@nongnu.org; Fri, 24 Jan 2020 02:12:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579849961;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:openpgp:openpgp;
 bh=wcf8Xzp7aHOwdZ0HT44Mj1cdXXgWs6FFTgXjTkWvx98=;
 b=T/cBrULd8mE3OUFVEuGsHJKR0nZfloknuCBq4N55TRuxKovMp740P5lmSe0gK/v+OAiC7O
 CoayTa0wIWuoQseBtshToq2LZVKlCF6E8AAushhiYU1inTsP4kateyePZup5sr0MLRqCpW
 aYCzg1jLQw39ENKzPjuWRyF100a4WHs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-248-pH51zXVBMDuM3KG2TvNMhw-1; Fri, 24 Jan 2020 02:12:39 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A601F800D4E;
 Fri, 24 Jan 2020 07:12:35 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-116-156.ams2.redhat.com [10.36.116.156])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 195041001920;
 Fri, 24 Jan 2020 07:12:24 +0000 (UTC)
Subject: Re: [PATCH rc2 00/25] target/avr merger
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
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <41fcbdd8-efcd-ea26-2507-ba4350b729c0@redhat.com>
Date: Fri, 24 Jan 2020 08:12:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200124005131.16276-1-f4bug@amsat.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: pH51zXVBMDuM3KG2TvNMhw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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
X-List-Received-Date: Fri, 24 Jan 2020 07:12:44 -0000

On 24/01/2020 01.51, Philippe Mathieu-Daud=C3=A9 wrote:
> This is the AVR port from Michael release (merge) candidate 2.
>=20
> Since v1 [1]:
> - Addressed Thomas comments
> - Fixed a non-critical bug in ATmega (incorrect SRAM base address)
> - Added ELF parsing requested by Aleksandar
> - Dropped default machine (as with the ARM port)

If you don't have a default machine, I'd expect to see a change to
tests/qemu-iotests/check in the patchset. Please make sure that "make
check" (i.e. "make check-block" in this case) continues to work if you
run "configure" just with this single architecture
(--target-list=3Davr-softmmu).

 Thanks,
  Thomas


