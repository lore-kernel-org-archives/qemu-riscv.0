Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jJKIo-0002SJ-Ug
	for mharc-qemu-riscv@gnu.org; Tue, 31 Mar 2020 13:03:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47017)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jJKIl-0002Nc-UG
 for qemu-riscv@nongnu.org; Tue, 31 Mar 2020 13:03:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1jJKIk-00004v-Eq
 for qemu-riscv@nongnu.org; Tue, 31 Mar 2020 13:03:47 -0400
Received: from mail-oi1-x22b.google.com ([2607:f8b0:4864:20::22b]:39014)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1jJKIj-0008VK-DL
 for qemu-riscv@nongnu.org; Tue, 31 Mar 2020 13:03:45 -0400
Received: by mail-oi1-x22b.google.com with SMTP id d63so19543170oig.6
 for <qemu-riscv@nongnu.org>; Tue, 31 Mar 2020 10:03:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=9blV1H9Js4on1Ru4pm7hErJIva7kNEymOz2IOkz5vus=;
 b=SLv0dQ7u1fEVRXqkzrOdwk8U3oIebC2JYOFyn5H3Ap9UMGXug+Ki2LmB7tMf5dalMM
 ZVCDWaE8AMUENE4AAGM9ra/L6etUNOIO0ErUUIZBw2fED6xgcVUj4n0J8njSKMLiHhDq
 3RSDUZLhG7dELbTj5yEBthasUqochW4FQpYHaE7A4DDZISu4NzoO7YCDvjyVHh/+0kez
 Q/9AxIKsRcAG6T9teNyd22CpINizKC3dGf0SNqEE+HV2c5jGdtnYolw6HhbMAQXhnNos
 dhUmpaWaiEkUvMXdA6UTMErbxRxVVW94eEBCxXzuU2panAyvzOg+/s0oQLr4YBUmYge/
 OXLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=9blV1H9Js4on1Ru4pm7hErJIva7kNEymOz2IOkz5vus=;
 b=TZAV6nTznqVE0I8r9V03nc1RA62B11YpH5bxMyTDpZXsun0unIByC+uvNRvfqmrn1r
 KpbxX7J7fSfqFUI4iI3UV0PgCETEZJfYXjLjcSumC8H4JTqkC5RDagmRPhJM8lMjHCoL
 HZ6RaojtMXHVA7OHaCB4UUlDMe8T9baL4RCZNEQz1TSLMuhiKDbHPvFzVZWKwuYmHIcW
 cWGuMTWAVypLv/FJFujqppzQ+0UpgdAB7GEkoQ76RYoRGPhe8zvqWBPOQfpjdcDvN4gJ
 mAYJRSSrs9f2fyy0nYhkf+enSK72AQudPXcJYVUkx1cL593rXHBBDTbJtMVHUY0x2x8P
 uUBg==
X-Gm-Message-State: ANhLgQ3/riJmLFg3qD4eIkunLbK3Oc1jqgrW6JLue7qEtl6D772jjeEO
 hSrYpqGvmacSJxqsLkOOMvojVfarRPSnah25JLW3Aw==
X-Google-Smtp-Source: ADFU+vukaA/yWKn49R6q5KefPeW7YOl72sG3FHyafQT6fGH4fTrRy/6qZjVmQqrm5Iuva8UOjqwXVAuPJ2XknyT1hPQ=
X-Received: by 2002:a05:6808:8cb:: with SMTP id
 k11mr2652699oij.48.1585674223782; 
 Tue, 31 Mar 2020 10:03:43 -0700 (PDT)
MIME-Version: 1.0
References: <20200325191830.16553-1-f4bug@amsat.org>
 <20200325191830.16553-13-f4bug@amsat.org>
 <CAFEAcA-26fHbOp5saM+XBCz72fzfz+=+xtiXGRtWnc6CMoiakA@mail.gmail.com>
 <e293f19c-7005-16f0-57df-55ce953fe0a4@redhat.com>
In-Reply-To: <e293f19c-7005-16f0-57df-55ce953fe0a4@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 31 Mar 2020 18:03:32 +0100
Message-ID: <CAFEAcA-W9V_GvA0yKXY+tsZNSe_DnSbYsd33wNnAP4WWivi-og@mail.gmail.com>
Subject: Re: [PATCH-for-5.0 12/12] hw/riscv/sifive_u: Add missing
 error-propagation code
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 QEMU Developers <qemu-devel@nongnu.org>,
 Alistair Francis <alistair@alistair23.me>, 
 Paul Burton <pburton@wavecomp.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-ppc <qemu-ppc@nongnu.org>,
 Jason Wang <jasowang@redhat.com>, Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Richard Henderson <rth@twiddle.net>, Eduardo Habkost <ehabkost@redhat.com>, 
 David Gibson <david@gibson.dropbear.id.au>, 
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 qemu-arm <qemu-arm@nongnu.org>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>, 
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, 
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 "Michael S. Tsirkin" <mst@redhat.com>, 
 Markus Armbruster <armbru@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>, 
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Paolo Bonzini <pbonzini@redhat.com>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::22b
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
X-List-Received-Date: Tue, 31 Mar 2020 17:03:50 -0000

On Tue, 31 Mar 2020 at 18:02, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m> wrote
> What about this memory_region_init_rom() call (and later
> memory_region_init_ram) using error_fatal, same reasoning right?

Yes.

-- PMM

