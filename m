Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jHaJU-0002yD-7Z
	for mharc-qemu-riscv@gnu.org; Thu, 26 Mar 2020 17:45:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41839)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jHaJR-0002tu-Tv
 for qemu-riscv@nongnu.org; Thu, 26 Mar 2020 17:45:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1jHaJQ-0001HE-Qa
 for qemu-riscv@nongnu.org; Thu, 26 Mar 2020 17:45:17 -0400
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335]:39792)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1jHaJQ-0001FN-Jb
 for qemu-riscv@nongnu.org; Thu, 26 Mar 2020 17:45:16 -0400
Received: by mail-ot1-x335.google.com with SMTP id x11so7629571otp.6
 for <qemu-riscv@nongnu.org>; Thu, 26 Mar 2020 14:45:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=iIJml/paGDft77iresLwu7OhLTxm+EOldnil3k1PySI=;
 b=RsWHG52B29eyg8Pi3JaQftoGk+yqSXnN4SiIAjTlpSpVDEfJ3SiF03f4swlCr/tpvw
 uIkPGoFOwrJXKE9wRopdMz+h9sefM3mG7nPP4DS+t77b4gbMkTxE0M1b6jL3kVJB26Wt
 gImMG0M02OZ/pzbhyGN+RM8dvVydQnmmO0ELke6JSaccOE3TDU0BCLXko0FiWOB7SqQ+
 So5T1eoEWBERec4c5kbSHY93O7XIVwOKS0Fuj8rdeOJHLeWYnbazADfWzGh7w3yLTjqk
 kPDf9t9WoGRn1bbRJJ6gtemb7LLHYKvIWkljWaqaBO9I3lRVBWiyFiJKYdOFnJufvLHL
 8a8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=iIJml/paGDft77iresLwu7OhLTxm+EOldnil3k1PySI=;
 b=eaxgRg4IoPgwUlw0IVFNagoKWetcSfQcdL3ybZD2dzWS9v82QWG2flzuk8L/DKZhbD
 m//dL6ukLcI80HvDuT0V6vuOTSWlJ/Wp2DlXc8KEHu2EBbgzixQZiX0fKj0/kuPx/ZvW
 k23yIfFVphUanBn577utmLDhv24dQjzx9ms0YuAqTed/9y4nBNe5iEGH7HprYLEfWjy/
 Ma20PeLBzn8oUoCP9Sz8kG5N1ia/eWrvjtAw7vvoocPoqlG7wSvMAm8UcG9syBkojWH6
 9PKzzO8oBjHlaa90iPVXZgWZXJ1WV5yTaEuKxRoblBUWXjJ9UmsjM43Tsl4MKH0MLKZW
 AVlA==
X-Gm-Message-State: ANhLgQ2FcPItrpGwSSU4NdPs2NKB0E5MPCvMWiU1fUZDNKKWBbTeBoyU
 +/pFq5RZA3VqBBSF4ieCrir4OWzotmpo6ZDhZ8tk0w==
X-Google-Smtp-Source: ADFU+vsZOKy89PpOxSXvQfJ28qeu8o83Grx1B9VLfGc9Splkvxu67PczFwZDjz23f/xm7P5Gha3y4W3uQsHKoV1hWxA=
X-Received: by 2002:a05:6830:18f4:: with SMTP id
 d20mr5418119otf.91.1585259115314; 
 Thu, 26 Mar 2020 14:45:15 -0700 (PDT)
MIME-Version: 1.0
References: <20200325191830.16553-1-f4bug@amsat.org>
 <20200325191830.16553-5-f4bug@amsat.org>
In-Reply-To: <20200325191830.16553-5-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 26 Mar 2020 21:45:03 +0000
Message-ID: <CAFEAcA9e8weisrD+2zHsOjGAP0UR513V1mN0RH5VJnd9m5hFqQ@mail.gmail.com>
Subject: Re: [PATCH-for-5.0 04/12] hw/arm/stm32fx05_soc: Add missing
 error-propagation code
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
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
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::335
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
X-List-Received-Date: Thu, 26 Mar 2020 21:45:19 -0000

On Wed, 25 Mar 2020 at 19:18, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> Patch created mechanically by running:
>
>   $ spatch \
>     --macro-file scripts/cocci-macro-file.h --include-headers \
>     --sp-file scripts/coccinelle/object_property_missing_error_propagate.=
cocci \
>     --keep-comments --smpl-spacing --in-place --dir hw
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  hw/arm/stm32f205_soc.c | 4 ++++
>  hw/arm/stm32f405_soc.c | 4 ++++
>  2 files changed, 8 insertions(+)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

