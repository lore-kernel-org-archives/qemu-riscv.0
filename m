Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jOJqj-0003qW-Pd
	for mharc-qemu-riscv@gnu.org; Tue, 14 Apr 2020 07:35:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55575)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jOJqg-0003lh-NJ
 for qemu-riscv@nongnu.org; Tue, 14 Apr 2020 07:35:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1jOJqf-0004vy-MT
 for qemu-riscv@nongnu.org; Tue, 14 Apr 2020 07:35:26 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:47308
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1jOJqf-0004vj-JN
 for qemu-riscv@nongnu.org; Tue, 14 Apr 2020 07:35:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586864125;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TkWkv1sSQkb10ESnJ81NX+eXLN9yPeO5ArhBlLlo7kM=;
 b=g3qI1N+WndwWYqYJQt38oWJEWlUKHYiNwTLiHOVj/UNJM5AMndteBpSKBqTZv0AeTjtjz3
 QT94hQXFr4755O4AqZAzixyKEv3m5OdTPgSNiGhF1DXLWi5DbKE/+kBg0JIVEpxFtAhKqq
 OP0QmQgQbkQnTBgEWmiwA/4KpnvQgX8=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-335-PA0WiAe_NQy2SCQuOTu4Ww-1; Tue, 14 Apr 2020 07:35:21 -0400
X-MC-Unique: PA0WiAe_NQy2SCQuOTu4Ww-1
Received: by mail-wr1-f72.google.com with SMTP id f15so8570029wrj.2
 for <qemu-riscv@nongnu.org>; Tue, 14 Apr 2020 04:35:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=45deY+ympfnEFZqUmSQTtjgToLUZLlw6E2wOzJRdDj4=;
 b=uNA6uQI+QPEftTHhXRJdfg9qA/aB5vJ9j69muj0D6MqKzp7a6QS9WBrLtUwuzgtG1A
 uqNxji5CN7q8PplyTHV/uWbI06yA72LR8UZ5IWf67lwLh8+VUPXnQJ1YbeAI4XButF0k
 thoU97AqE2J7uHzIFZ0ZfJOTnSjNFVbqsBB5wEQ5vwgJCFSOL2sDVaSMBQmFeR2aQgwd
 pFpi4FN0OPAz4mm4hT6LhqJS8+L9ZccCuV8+S/RU6kKdpqJxtOrYMwlJ5ePcnCAtQwd6
 z8WsUKhtHqdhG1p6GLQxHclbygwABe1B3EAZcH7g0OqnegjSIlyTMvZxuOZ1B3QOBdFJ
 BuCQ==
X-Gm-Message-State: AGi0PuaulopgU4fDIEmTVxJQFXXVag6pKX9QKGaYpk2FQhO25hc1irKy
 2I7Z9gMvmIT3AWAWLGiPN1zIoegnR41rhAUVYWPzkc8WQYcEFU2CdH6XNXOAKXQoeW1uKe9jPao
 anHp0yR697ZFEQes=
X-Received: by 2002:a1c:bd8b:: with SMTP id
 n133mr24582579wmf.175.1586864120411; 
 Tue, 14 Apr 2020 04:35:20 -0700 (PDT)
X-Google-Smtp-Source: APiQypJxpzJUPs71ndHLjBXMIIAwJUSa61a2IhohKCQIKujRbnA0a2cGrYPLSN/8L9HsIyecDuogew==
X-Received: by 2002:a1c:bd8b:: with SMTP id
 n133mr24582536wmf.175.1586864120106; 
 Tue, 14 Apr 2020 04:35:20 -0700 (PDT)
Received: from [192.168.1.39] (116.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.116])
 by smtp.gmail.com with ESMTPSA id h26sm18105559wmb.19.2020.04.14.04.35.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Apr 2020 04:35:19 -0700 (PDT)
Subject: Re: [PATCH-for-5.1] gdbstub: Rename GByteArray variable 'mem_buf' as
 'array'
To: qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Stafford Horne <shorne@gmail.com>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, qemu-arm@nongnu.org,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 David Hildenbrand <david@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Laurent Vivier <laurent@vivier.eu>, Cornelia Huck <cohuck@redhat.com>,
 qemu-s390x@nongnu.org, Alistair Francis <Alistair.Francis@wdc.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-riscv@nongnu.org,
 Marek Vasut <marex@denx.de>, Aurelien Jarno <aurelien@aurel32.net>,
 Chris Wulff <crwulff@gmail.com>, Richard Henderson <rth@twiddle.net>,
 qemu-ppc@nongnu.org, David Gibson <david@gibson.dropbear.id.au>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Paolo Bonzini <pbonzini@redhat.com>, Michael Walle <michael@walle.cc>,
 Max Filippov <jcmvbkbc@gmail.com>
References: <20200414112849.21787-1-philmd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <09f9ae36-f8e9-8412-cd97-f3f386907b6f@redhat.com>
Date: Tue, 14 Apr 2020 13:35:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200414112849.21787-1-philmd@redhat.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
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
X-List-Received-Date: Tue, 14 Apr 2020 11:35:28 -0000

On 4/14/20 1:28 PM, Philippe Mathieu-Daud=C3=A9 wrote:
> GByteArray type has should not be treated as a u8[] buffer.
> The GLib Byte Arrays API should be used instead.
> Rename the 'mem_buf' variable as 'array' to make it more
> obvious in the code.

I forgot to mention this variable was used as u8[] buffer prior to=20
commit a010bdbe719 ("extend GByteArray to read register helpers").

>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
> Based-on: <20200414111846.27495-1-philmd@redhat.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>   include/exec/gdbstub.h      | 34 +++++++-------
>   include/hw/core/cpu.h       |  2 +-
>   target/alpha/cpu.h          |  2 +-
>   target/arm/cpu.h            |  4 +-
>   target/cris/cpu.h           |  4 +-
>   target/hppa/cpu.h           |  2 +-
>   target/i386/cpu.h           |  2 +-
>   target/lm32/cpu.h           |  2 +-
>   target/m68k/cpu.h           |  2 +-
>   target/microblaze/cpu.h     |  2 +-
>   target/mips/internal.h      |  2 +-
>   target/openrisc/cpu.h       |  2 +-
>   target/ppc/cpu.h            |  4 +-
>   target/riscv/cpu.h          |  2 +-
>   target/rx/cpu.h             |  2 +-
>   target/s390x/internal.h     |  2 +-
>   target/sh4/cpu.h            |  2 +-
>   target/sparc/cpu.h          |  2 +-
>   target/xtensa/cpu.h         |  2 +-
>   gdbstub.c                   |  6 +--
>   hw/core/cpu.c               |  3 +-
>   target/alpha/gdbstub.c      |  4 +-
>   target/arm/gdbstub.c        | 10 ++--
>   target/arm/gdbstub64.c      | 10 ++--
>   target/cris/gdbstub.c       | 34 +++++++-------
>   target/hppa/gdbstub.c       |  6 +--
>   target/i386/gdbstub.c       | 92 ++++++++++++++++++-------------------
>   target/lm32/gdbstub.c       | 18 ++++----
>   target/m68k/gdbstub.c       | 10 ++--
>   target/m68k/helper.c        | 24 +++++-----
>   target/microblaze/gdbstub.c |  6 +--
>   target/mips/gdbstub.c       | 30 ++++++------
>   target/nios2/cpu.c          |  8 ++--
>   target/openrisc/gdbstub.c   | 10 ++--
>   target/riscv/gdbstub.c      |  6 +--
>   target/rx/gdbstub.c         | 22 ++++-----
>   target/s390x/gdbstub.c      | 28 +++++------
>   target/sh4/gdbstub.c        | 38 +++++++--------
>   target/sparc/gdbstub.c      | 46 +++++++++----------
>   target/xtensa/gdbstub.c     | 20 ++++----
>   40 files changed, 254 insertions(+), 253 deletions(-)


