Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jHaO5-00083m-US
	for mharc-qemu-riscv@gnu.org; Thu, 26 Mar 2020 17:50:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50582)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jHaO3-000839-Uy
 for qemu-riscv@nongnu.org; Thu, 26 Mar 2020 17:50:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1jHaO2-0007Gf-UI
 for qemu-riscv@nongnu.org; Thu, 26 Mar 2020 17:50:03 -0400
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330]:42307)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1jHaO2-0007Ey-Kv
 for qemu-riscv@nongnu.org; Thu, 26 Mar 2020 17:50:02 -0400
Received: by mail-ot1-x330.google.com with SMTP id z5so7377833oth.9
 for <qemu-riscv@nongnu.org>; Thu, 26 Mar 2020 14:50:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=vmLYY/rJrxioBTJ6A3rg5gqalSw/omoc/qj0U0fRPSE=;
 b=yQEU2NIUaXHDdBFNz4pgJz1tMyrv9l34vb3Y0c+nuVoIB8ExwwDNBGsdtn7yywEcQ0
 l4vCc+i0qgYX13ySmSuu65Jq5cAbOdxybDYd+5u39WLfd1UH70wwU4rDHyFoyGwA3/42
 CTew5CcCEVqDh6eWLETY+5yoNv1cHj1HSLExV7XFbWt70WbXLXG5h9OQKCYohoApY2aO
 cO0S4hzl1jI8K+hx5O7wkZAIfE/4vVF+hbPQuJbRPuOdPa3zoF1zC5o4eOHSqDRZymTD
 F50uKR8yfaIyuk+dYy9VoGj+j9NmGNb/w/X6B4wUpJfysTCgwGeLMRaTVUKXYTPGp9t1
 ngvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=vmLYY/rJrxioBTJ6A3rg5gqalSw/omoc/qj0U0fRPSE=;
 b=bGf01b4gTEt2U7ZemP7RVQMjyedTKBzqDesfxtPqfdfHWGPk8w0VQOb6KSCNC0V5tW
 zC6y2OFCzLI/RsZ+3rNPWg5Uu7wyF+6K0lAnnrfbwdel/+Iky4tPSvzMoKIXOR5Dv379
 SAgRnjBxHbIdk1v2lrWoGM8PipYsAMVX0Ru5Hs9Fzx9xXRtnXos825GY62eNq+E50PsD
 NVRwhpmJX2H1gt6Bo7RpjN4dsbFam431KasjLkoo5rQvalzHarC4+v15UtU9YJqkk9gf
 +FCwEnaM24GOhCWQhqEKDMmibtutq+Y5PhBNiUQxKrrYWk7q9okZM7VsqVD3ga3VgMm8
 gEig==
X-Gm-Message-State: ANhLgQ021uHaRYEHqrdmVkrxcMBliWzs3YKI680dSZltzurt2KrnCZYU
 GIsxnDCioohMctrwvE1pZ7/VjL01+wo9hWw2Z71KVw==
X-Google-Smtp-Source: ADFU+vvd8j43oFEZ/E67eihVOeE7Xj+C4BcmTyGRpJ+MwNVrcYS6RfZXUAY/ZqJt3I7OjcuVqt+kEp/MeeMIgiWxtr0=
X-Received: by 2002:a05:6830:1f39:: with SMTP id
 e25mr8151827oth.135.1585259401764; 
 Thu, 26 Mar 2020 14:50:01 -0700 (PDT)
MIME-Version: 1.0
References: <20200325191830.16553-1-f4bug@amsat.org>
 <20200325191830.16553-10-f4bug@amsat.org>
In-Reply-To: <20200325191830.16553-10-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 26 Mar 2020 21:49:50 +0000
Message-ID: <CAFEAcA-2FNSxHaZUuogdmFXSc7DqKHPSVD6f-Vkpnh_pTmXHQg@mail.gmail.com>
Subject: Re: [PATCH-for-5.0 09/12] hw/mips/mips_malta: Add missing
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
X-Received-From: 2607:f8b0:4864:20::330
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
X-List-Received-Date: Thu, 26 Mar 2020 21:50:05 -0000

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
roperty_set_int() hw/mips/mips_malta.c:1193:4]]
>   [[manual check required: error_propagate() might be missing in object_p=
roperty_set_str() hw/mips/mips_malta.c:1192:4]]
>
> Add the missing error_propagate() after manual review by adding
> a Error* parameter to create_cps().
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  hw/mips/mips_malta.c | 19 ++++++++++++++-----
>  1 file changed, 14 insertions(+), 5 deletions(-)


Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

