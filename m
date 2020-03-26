Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jHaOo-0000KP-D3
	for mharc-qemu-riscv@gnu.org; Thu, 26 Mar 2020 17:50:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51499)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jHaOm-0000Hp-B7
 for qemu-riscv@nongnu.org; Thu, 26 Mar 2020 17:50:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1jHaOl-0000lP-BZ
 for qemu-riscv@nongnu.org; Thu, 26 Mar 2020 17:50:48 -0400
Received: from mail-oi1-x233.google.com ([2607:f8b0:4864:20::233]:33802)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1jHaOl-0000kZ-6b
 for qemu-riscv@nongnu.org; Thu, 26 Mar 2020 17:50:47 -0400
Received: by mail-oi1-x233.google.com with SMTP id d3so2436243oic.1
 for <qemu-riscv@nongnu.org>; Thu, 26 Mar 2020 14:50:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=eHb0jfKvXVU274VJYP9E1m8sOv0o9NIfCTrQgmuuMxQ=;
 b=km/Z6bQKQvqySinTMdQCbKwMWomhCsjefkMpcfKgD5dpEFIAqVZzvDhpesBR9SGnOL
 X/045XR9qwEddTL/yolS8x5FoidJ7bdxVy1lJMJmEdhrleiVHLZUTSsz0orY1hknqnN2
 +W1s1DrYyf0+lwe0jcyJzJtZrKLWLS6qnluEKfat0vdrhJFgL3Qf1qZqnKfc87ypkgJr
 zAM99meJPbB+IBlIbAt6JHT2f/QOoOvUTkQT73mFkQlgZDqi7vQXQrhdyflfNrWMR+E8
 wtB6x+NGg+Chj6O3uiInCDfW7YsOqUwAbELXElGE8TShGAjAeRPl97oDkw6mtlA/RIii
 4aqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=eHb0jfKvXVU274VJYP9E1m8sOv0o9NIfCTrQgmuuMxQ=;
 b=BGsXCv2h2lAB+nSOcd6a9x4pw43NhFMFw0r0z7EkLEg0Sk2WuEYCy7KNFbiOEZd7VZ
 LMQun5ohOlotopNjrYBsAeKqzZj5ZuexyVeqTigGzanXNz9rmrEfUl3cKO1Xy60BUjhG
 99oFCp7TJhMRWpKi5h6/WLFzQ+6o34/OaqIt/dHBGZ+gHNuL97km47oeXuT79vUFUIeC
 N0p1b19OGLdFsztd0eFqQQ2nwX2j1yokkrBm+ssC1pWNLg6lTFUQ8lRoKQ/Pb0Nqb/9R
 UI1kDTIkSSYTjr8vW4UZtJdgEapk5UkhwMs6dkCJW1Uk+WiLzeXv13XRwnHPqPDP1wXu
 P3Kg==
X-Gm-Message-State: ANhLgQ2LqIb+fiH3C/+Oulgi+JnqIbMADvhAXYJ2kQJ5nybheug4I9k9
 HWJ70QwBwGDyBOWR2fF5Uq6xXwrymfLNvEJr1qfXBQ==
X-Google-Smtp-Source: ADFU+vtG3JVnS91kZlvWGSN6o2d1T88nsN+iTnHWTXokEih1kXTKVTrUTnaQgNH0r5YGUQ5q4cAy6sVLBBoTCQPMcHQ=
X-Received: by 2002:a05:6808:64c:: with SMTP id
 z12mr1837436oih.146.1585259446443; 
 Thu, 26 Mar 2020 14:50:46 -0700 (PDT)
MIME-Version: 1.0
References: <20200325191830.16553-1-f4bug@amsat.org>
 <20200325191830.16553-11-f4bug@amsat.org>
In-Reply-To: <20200325191830.16553-11-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 26 Mar 2020 21:50:35 +0000
Message-ID: <CAFEAcA9boqPf35M9pEn7wF_McdXBUwoyWSSXHC=O5g8H+Aa=4g@mail.gmail.com>
Subject: Re: [PATCH-for-5.0 10/12] hw/misc/macio/macio: Add missing
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
X-Received-From: 2607:f8b0:4864:20::233
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
X-List-Received-Date: Thu, 26 Mar 2020 21:50:49 -0000

On Wed, 25 Mar 2020 at 19:19, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> Running the coccinelle script produced:
>
>   $ spatch \
>     --macro-file scripts/cocci-macro-file.h --include-headers \
>     --sp-file scripts/coccinelle/object_property_missing_error_propagate.=
cocci \
>     --keep-comments --smpl-spacing --dir hw
>
>   [[manual check required: error_propagate() might be missing in object_p=
roperty_set_bool() hw/misc/macio/macio.c:350:8]]
>
> Add the missing error_propagate() after manual review.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

