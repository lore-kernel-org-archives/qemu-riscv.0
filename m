Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1i7bfQ-0005Yc-Sr
	for mharc-qemu-riscv@gnu.org; Tue, 10 Sep 2019 04:38:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34751)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1i7bfO-0005XU-4T
 for qemu-riscv@nongnu.org; Tue, 10 Sep 2019 04:38:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1i7bfN-0003yF-0p
 for qemu-riscv@nongnu.org; Tue, 10 Sep 2019 04:38:26 -0400
Received: from mail-ot1-x336.google.com ([2607:f8b0:4864:20::336]:34210)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1i7bfM-0003xF-R3
 for qemu-riscv@nongnu.org; Tue, 10 Sep 2019 04:38:24 -0400
Received: by mail-ot1-x336.google.com with SMTP id z26so7978923oto.1
 for <qemu-riscv@nongnu.org>; Tue, 10 Sep 2019 01:38:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:from:date:message-id:subject:to;
 bh=n3EdLZ/I+9KgAyrX3nxszcZrA5OOqP42Y3tI2lwoT8Q=;
 b=Hh2Vc7Pv9uFaSRK3z8ll1rZZU5FlGVkvIafMQp68JyjRkEir64gn8GAA6wav+Nn3ni
 rwGYmSjqAKHiTcWfIyYQJ2zwVyvZxxeplCiIIVqymC5toqRIj4wVftWvXNTJAjaiAXj0
 x+V0NCLGHgJ2bZc7docEkvzQcleLCurBzHLos6BUeqthvkR5Qd9Bj02RLmNaWt1lukr8
 3LCoGjc7Xvm0hkUJoNXqw+7e4xElQBIgFVQ9QqsX0nWw8U3Mm5QQwNTLz9t4CI8BmFOR
 GLHSvE3gWERr1UcWswPF2+5197+2Tg0f3cgpUTcGEhGkLlua+Nt1LWtx/TJ5yZS5OcAX
 GRRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=n3EdLZ/I+9KgAyrX3nxszcZrA5OOqP42Y3tI2lwoT8Q=;
 b=d4cTHhCqJr97zwM6fmUfg0XBTL2adsE+TYXRoWA1QKZ0wRCtaNx4rHkXCvl9QBzNWn
 xJQlXnbXOJuTHFujFv3TqprRI9qMaroc66yIEno0/vH7RP2T48ut3ODrGBNDWu7K6XMH
 UO51sw0HCDnS/kWySGk+/04H5uLM5k4KEFV6W4KI02YCTKP8kpgONlQecyKmqojaFuuS
 kI3mM3Rln3+Hc5c3WfIAa7Qb2orRZArvtL0FYc/VFHUHWtONGQVqY3uY03+ql/4E4Y9W
 W4JTAZrMwsl8NDitWAMbNZrRBWq1e7gDSFRfctW1VYLCoUc3Z9UwGUBBMt5EoqIbrjQH
 6rNw==
X-Gm-Message-State: APjAAAXlrxWqmlABEdRvMRAgwaO4ZWEoa6X1TDIA0Z4xExVXJbDhAkOW
 G4XJbIr0jQnfYsxh5zQU8Ylp/Lg/jity08XkJtpvz3DzRbc=
X-Google-Smtp-Source: APXvYqx2QCjn9T8il6e5esMVWZwDclM+C0oF+5iBhCVx2pgvnJCQpi6B0aq76E669LFwlQzQWSLYLLrSx1iZN3i5U+A=
X-Received: by 2002:a9d:5e10:: with SMTP id d16mr25207209oti.91.1568104703388; 
 Tue, 10 Sep 2019 01:38:23 -0700 (PDT)
MIME-Version: 1.0
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 10 Sep 2019 09:38:12 +0100
Message-ID: <CAFEAcA-14O3vYbUzCP7stDPffvHKaLrA-=apPXvGzRWoD1SXuw@mail.gmail.com>
To: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
 Qemu-block <qemu-block@nongnu.org>, qemu-discuss <qemu-discuss@nongnu.org>,
 qemu-ppc <qemu-ppc@nongnu.org>, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 qemu-s390x <qemu-s390x@nongnu.org>, qemu-stable <qemu-stable@nongnu.org>, 
 QEMU Trivial <qemu-trivial@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::336
Subject: [Qemu-riscv] ANNOUNCE: emails from this mailing list will soon drop
 the [qemu-*] subject tag
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
X-List-Received-Date: Tue, 10 Sep 2019 08:38:27 -0000

Hi; this is an announcement to let you know that in future
emails to all QEMU project mailing lists (including this one)
will no longer have the [qemu-*] tag in their Subject line.

We need to make this config change because having the mailing
list server edit subject lines like this conflicts with the
increasingly common DKIM/DMARC anti-email-forgery system. We
used to work around this by having the list server rewrite
email From addresses instead, but this has proven to have
bad consequences (notably that patches applied from emails
to QEMU can end up with incorrect authorship by accident).

If you were using the Subject line tag to filter QEMU emails,
you'll need to change your mail client's config to instead
look at the "List-Id:" message header to identify list traffic
(you can do this now without waiting for us to change the
list config to drop the subject tags).

Apologies for any inconvenience that this upcoming config
change might cause you.

thanks
-- PMM

