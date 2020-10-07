Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kQBqK-00045U-Ue
	for mharc-qemu-riscv@gnu.org; Wed, 07 Oct 2020 11:59:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kQBqI-0003z9-Km
 for qemu-riscv@nongnu.org; Wed, 07 Oct 2020 11:59:02 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:46869)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kQBqF-0000Ze-RN
 for qemu-riscv@nongnu.org; Wed, 07 Oct 2020 11:59:02 -0400
Received: by mail-ej1-x62e.google.com with SMTP id t25so3658239ejd.13
 for <qemu-riscv@nongnu.org>; Wed, 07 Oct 2020 08:58:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7OyP3p/J0BJTuUMR+7M8eSTXEQKQJgp0W9yhB+Uzeec=;
 b=fpXED4jJez9o+tGUuQt5fbq3Y9S8FcKGfdeUgSbaOC5TiZBP6wgdmvckuLx2XpdUaL
 m0ZsojOb0ZN+Ce+b3nK/Y/JvkTNGcOqI+AoYsnN5KlCuvEr9PiXLb6yIBYg9G6w23epU
 BuGjICsQSF0Vya6GA0a182kzIo38j5Iz++I4PSzT0tx8YXdcf4TSaD+yqCNInde3dkKT
 ifIKUbjc/1r2UrqxN5Bc/9sm5feBOukGV4B6tf+JxoIEQKprnXLBVOqInUedf9eDWhoX
 +8kVjyOOmKmFH8W3+GYrTUju7zh+GyPzJEc9elOCzTPG5az7lEC/0TRDekaBG5D7ppi6
 lpxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7OyP3p/J0BJTuUMR+7M8eSTXEQKQJgp0W9yhB+Uzeec=;
 b=EXIT4afND6Nm3p9pes8yAtujqWDzVSfIcA4GmDNC9rhB8GZR6z3/qmQCKot0UaacNC
 /RKSlaNB8Cn9zDwH0y320jaIOOyOeAUfwwvdoCr3Vm+hK7JZW8y1Cjs4N2wDqOaUWl8V
 iiPM0nkK+KuY7BBznPWh8eN1WqftV6yY7LvXMY6wmJKnsMPWDOMWdLT1uuhqIVx2+AP/
 HWewg/g6e8rz/LpyJZBj9rJR0+8CfHSpJq4AC1ea709//0jxa9/d2z56ITTPOYSXaw/4
 55d4nB0ufSgTujbW8NC1FzdOF8c2PY4RTA79IbmMPKO9tu4inbcDDEQeWeehJezGpqVU
 fH0Q==
X-Gm-Message-State: AOAM531agwgtI4hReEFXyuv8w5ue1YOM/8RTsKoG4zBZtcoMsnD4a4je
 3x/oSLhuh4F3iPAChnDWZ+yffFneHDqXQ0XezjKRlw==
X-Google-Smtp-Source: ABdhPJyw6uWzSTzDUK26HIZ8hn8FkB9EtIUsyDnj5w678rF0ngl7EQsIExq63jk95BQrO0xOf5FyRKoVofKi35ES7fY=
X-Received: by 2002:a17:906:c7d9:: with SMTP id
 dc25mr3999790ejb.482.1602086337977; 
 Wed, 07 Oct 2020 08:58:57 -0700 (PDT)
MIME-Version: 1.0
References: <20201006220647.GR7303@habkost.net>
 <a6e652d9-548f-4d4e-e451-48e3f5e11031@redhat.com>
 <20201007130240.GU7303@habkost.net>
 <659289e0-4133-b945-45fd-25e759c18b03@redhat.com>
 <20201007142742.GV7303@habkost.net>
 <117cb090-d9ce-6394-42a2-2ac99fd965b9@redhat.com>
 <20201007155105.GX7303@habkost.net>
In-Reply-To: <20201007155105.GX7303@habkost.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 7 Oct 2020 16:58:46 +0100
Message-ID: <CAFEAcA9kaTa0P8g6qzEvGYq8fKqmjquH0+bBbAWLeLaa11ygHA@mail.gmail.com>
Subject: Re: Purpose of QOM properties registered at realize time?
To: Eduardo Habkost <ehabkost@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, 
 qemu-arm <qemu-arm@nongnu.org>, qemu-ppc <qemu-ppc@nongnu.org>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 "Daniel P. Berrange" <berrange@redhat.com>, John Snow <jsnow@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62e.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Wed, 07 Oct 2020 15:59:03 -0000

On Wed, 7 Oct 2020 at 16:51, Eduardo Habkost <ehabkost@redhat.com> wrote:
> Right now, I only want to know if the QOM property is part of a
> supported stable external interface.  For the properties
> registered at realize time, the answer seems to be "no".

I don't think that's inherently the case. But most QOM
properties are not going to be part of an external
interface (and definitely those for devices which are
not user-creatable are not), so the chances are good
that any particular QOM property is not external.

> Now, how do I locate the code that depends on those QOM
> properties to work?  When the property name is visible in the
> code, I can grep for the property name.  But I don't know how to
> find users of the GPIOs exposed by qdev_pass_gpios().

GPIOs are wired up with the APIs documented in
hw/qdev-core.h: typically qdev_get_gpio_in() to get
an anonymous GPIO input, qdev_get_gpio_in_named()
for a named GPIO line, similarly qdev_connect_gpio_out()
and qdev_connect_gpio_out_named() for oubound GPIO lines.
Most GPIOs are anonymous because that's the older set
of APIs (and sometimes it's still the simplest). To find
which code is wiring up the GPIOs from a particular
device you're better off searching for the device name,
because different devices can use the same name for a
set of GPIO lines (and lots of devices have anonymous
GPIO lines).

The GPIOs exposed by qdev_pass_gpios() are no different
from those exposed when the device directly creates
its own GPIOs.

thanks
-- PMM

