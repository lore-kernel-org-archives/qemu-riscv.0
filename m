Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jHaM6-0006bF-DI
	for mharc-qemu-riscv@gnu.org; Thu, 26 Mar 2020 17:48:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46259)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jHaM3-0006Vt-FU
 for qemu-riscv@nongnu.org; Thu, 26 Mar 2020 17:48:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1jHaM1-0004TR-K0
 for qemu-riscv@nongnu.org; Thu, 26 Mar 2020 17:47:58 -0400
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a]:41483)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1jHaM0-0004RE-Rx
 for qemu-riscv@nongnu.org; Thu, 26 Mar 2020 17:47:57 -0400
Received: by mail-ot1-x32a.google.com with SMTP id f52so7623605otf.8
 for <qemu-riscv@nongnu.org>; Thu, 26 Mar 2020 14:47:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ZFaXxcTV2mZj7ztpP7Zlz24D0mXHTvj4xwbEqB7WPNI=;
 b=juYgvXXDriG1rpjoe2C4H/Ugr3UC3p3gEye4w7GtZyXIYu+Zo+0ki3p4CAgIX15+oQ
 13h5mATdRjtEkuGPVFaxzfcsaweHEuIOXKQCjsIO+enfgSKWiu27x20N8d8AvGiHsxM/
 e4Ce1RNfFU37xU1Ue2YfH/qxSfQCfB7j7QP3+5DySd4yt8Z9JU4wQedhPF4knWQXN7A8
 NaHe8ZVDSrPQDxueQqrQlU9JVviih8K/d0bu9p7aXRExllyFV1dgv1wI0wxlqgdmypgG
 z9RsRkYOfs/e1fquBEPFlNxCbd3k6gbJwwwZ7QWHtMIzm0RlqS/PJ+udzu/7twiznYtH
 rsKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ZFaXxcTV2mZj7ztpP7Zlz24D0mXHTvj4xwbEqB7WPNI=;
 b=HYhgb2bkvvEp8dJMrPzqsCPEtIg420VSNfHJtNLreEn47oStYDpRD5025RHOpHc3qE
 giXiPfBRo3LSe5HmlVm8uVi7mQDGfirOiKqcTFlo142wFXZXw3xKX5ZZ5g35plm5iyin
 RwODcvynYOt6tBK9NV1x4iltGc24LwKEFjRz0BXl+OB2lzZmiqPIrkYY8rwRppOSr2tp
 DP6zz9QbRyoq4Vni9Pv7UCJG3Zl0Moa+vrY+mk2IklilMVhA/ydGAwBUYEfnQx/LUX/i
 zE6WJ00zBfA5el/3IShLrHE6QrmdtCk7rTkie2p/gQu8/DgPDQPCZkaErzQNVyHhvu+G
 Rnjw==
X-Gm-Message-State: ANhLgQ0iRT/nVUuGu7JKFxzgpo3wKEbWUb1xPnu8+3lrpWWrosHq5SD2
 fAYQt9f5++YqZkcC57pXhx5VmBObNA824dFxZF79pQ==
X-Google-Smtp-Source: ADFU+vs/DYQLrg+PY3A6R5Ck0seQHQa0rq5Ma6p3xVb/cN+6b9+7Ko2apbr98hdWTJWqo29ykVhVtUleBkYzpxXs/dQ=
X-Received: by 2002:a4a:d1a5:: with SMTP id z5mr6961361oor.63.1585259275554;
 Thu, 26 Mar 2020 14:47:55 -0700 (PDT)
MIME-Version: 1.0
References: <20200325191830.16553-1-f4bug@amsat.org>
 <20200325191830.16553-9-f4bug@amsat.org>
In-Reply-To: <20200325191830.16553-9-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 26 Mar 2020 21:47:44 +0000
Message-ID: <CAFEAcA-SJSTP==JM9xWJbSYOb-ZM=UyYtHP=2iQGq979SYvjyw@mail.gmail.com>
Subject: Re: [PATCH-for-5.0 08/12] hw/mips/boston: Add missing
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
X-Received-From: 2607:f8b0:4864:20::32a
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
X-List-Received-Date: Thu, 26 Mar 2020 21:48:00 -0000

On Wed, 25 Mar 2020 at 19:18, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
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
roperty_set_int() hw/mips/boston.c:462:4]]
>   [[manual check required: error_propagate() might be missing in object_p=
roperty_set_str() hw/mips/boston.c:460:4]]
>
> Since the uses are inside a MachineClass::init() function,
> directly use &error_fatal instead of error_propagate().
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

