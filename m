Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jiKQ3-00076r-9K
	for mharc-qemu-riscv@gnu.org; Mon, 08 Jun 2020 12:14:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jiKQ0-00071y-1j
 for qemu-riscv@nongnu.org; Mon, 08 Jun 2020 12:14:36 -0400
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:44612)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jiKPz-00022B-7F
 for qemu-riscv@nongnu.org; Mon, 08 Jun 2020 12:14:35 -0400
Received: by mail-oi1-x242.google.com with SMTP id x202so15782860oix.11
 for <qemu-riscv@nongnu.org>; Mon, 08 Jun 2020 09:14:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=/+4QjpT+tPPNmlVcx3DdQ4kyskVFCMtysHbcHTNYe74=;
 b=kS58IrIM5lez6Lj5rtZnhJPFBV+K9srHQMqeFSm7Z+xDcxy5VB1+sG7mD7OgAU3Xlc
 pqtBn6vqhsdiy+5UWO9tA5v94lie87F6qtEtU8Oox/I3ezGt7DNwpHBQTSE1GTX+xmXw
 k3pbE1MrKcyt2zqAeLEsEhQOPlnINXANgWN9+eUAWrJHhjMAubtk/mMoq4Yz4NnaAb+E
 qok7pIPLclNsBFO2iEIhsEcGPn4rTChUJWZlcplpcZ+BJti3DUIyDl7hvfGaH3LbrDMV
 sQ7C65a11jICToH03NJRuGZhykKF9IAflFSwaOXhWoK0BC8Ws5uLBhYv++PjUzYGuCna
 Iofw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=/+4QjpT+tPPNmlVcx3DdQ4kyskVFCMtysHbcHTNYe74=;
 b=bvtMGXwwLcEaHfrbQWoiC7rMG40yzU3dvB6F7cSS31es0NeXh1W38dh//usIRyG3tY
 nfm5ePv5TnYxspOdByLj3XSXBbCxmFIWIPDztFiEf1j54ZxAMzawKLTE+e3WKfwZyYb9
 HAatSEqHAwCluKA6P+PYDYONf7hPThdxvf0nkPVzIDorMVgc6abywSTbmqlRmuWhnv9z
 heBoiVolydns5RisyTLvrEaLZdOyWM7MeEebHnJMVVb2rtEMrLFYT7goLmjkWN07SF3O
 I1NtleFko+ZzudFmIfxK7YZx970qZMgsPRUdlixG6rSOHRFevQeMdfgw3eYiKfk9w0vW
 FGbw==
X-Gm-Message-State: AOAM531Ro1h9hPuc6X+CRMFodxv9ZhEV/jrx9WFQGT0OsUArm6xugd7J
 +s6OCxDneYnkCCia+zynQ9FKY21L0UK6p1fsj+POdg==
X-Google-Smtp-Source: ABdhPJxY837bRoD3+f6ZcPgGbh8vCM84Cl4LR/XbymbYhKCUqj4k8XH49NE9YAo4JBnuJUGXAVD6K2cFlG42HGdNVeI=
X-Received: by 2002:aca:568c:: with SMTP id k134mr107477oib.48.1591632872829; 
 Mon, 08 Jun 2020 09:14:32 -0700 (PDT)
MIME-Version: 1.0
References: <20200608160044.15531-1-philmd@redhat.com>
In-Reply-To: <20200608160044.15531-1-philmd@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 8 Jun 2020 17:14:21 +0100
Message-ID: <CAFEAcA_Ni8=mvyfG=9Aa=ym-ae9HpP8J8B0ekm8=SN2WgZ6_vA@mail.gmail.com>
Subject: Re: [RFC PATCH 00/35] hw/qdev: Warn when using pre-qdev/QOM devices
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
 Markus Armbruster <armbru@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Michael Walle <michael@walle.cc>, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>, 
 Gerd Hoffmann <kraxel@redhat.com>, Stafford Horne <shorne@gmail.com>, 
 Andrzej Zaborowski <balrogg@gmail.com>, qemu-ppc <qemu-ppc@nongnu.org>, 
 Alistair Francis <alistair@alistair23.me>, Richard Henderson <rth@twiddle.net>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 "Daniel P . Berrange" <berrange@redhat.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "Michael S. Tsirkin" <mst@redhat.com>,
 "open list:X86" <xen-devel@lists.xenproject.org>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Anthony Perard <anthony.perard@citrix.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Eduardo Habkost <ehabkost@redhat.com>, Thomas Huth <huth@tuxfamily.org>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 David Gibson <david@gibson.dropbear.id.au>, 
 Magnus Damm <magnus.damm@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::242;
 envelope-from=peter.maydell@linaro.org; helo=mail-oi1-x242.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
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
X-List-Received-Date: Mon, 08 Jun 2020 16:14:37 -0000

On Mon, 8 Jun 2020 at 17:00, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com=
> wrote:
>
> Based on today's IRC chat, this is a trivial RFC series
> to anotate pre-qdev/QOM devices so developers using them
> without knowing they are not QOM'ified yet can realize
> it and convert them if they have time.

What mechanism did you use for identifying non-QOM devices?

thanks
-- PMM

