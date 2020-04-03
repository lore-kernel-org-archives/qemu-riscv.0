Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jKOlF-0006Lu-DD
	for mharc-qemu-riscv@gnu.org; Fri, 03 Apr 2020 12:01:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60252)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmer@dabbelt.com>) id 1jKOlA-0006IU-Ud
 for qemu-riscv@nongnu.org; Fri, 03 Apr 2020 12:01:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1jKOl9-0008AI-62
 for qemu-riscv@nongnu.org; Fri, 03 Apr 2020 12:01:32 -0400
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:45657)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1jKOl8-00087T-Nz
 for qemu-riscv@nongnu.org; Fri, 03 Apr 2020 12:01:31 -0400
Received: by mail-pg1-x542.google.com with SMTP id o26so3680559pgc.12
 for <qemu-riscv@nongnu.org>; Fri, 03 Apr 2020 09:01:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=LqvGyD+24JMyraAKv5uQyvYhkRjE/KxXflK+dGY7DZA=;
 b=R8RgZzVoo84RO58LZjGvRhyZYqLw42B9YFVqL2d3UQYMauLNA3UCw3swzjZIKrXLiV
 1x0QoKbRreo9zhRo8g+4jzDdSwgWzTmLEAtPvuLNTVKq/Svfc5GyCoAVb3daMhGEZVRL
 d2r1zaPU9cUVe4N8nbSY6BuPuTwIyE2vC3H7OJ5V/UI4BDBmLxDCGcWlZe8ExyjPDETx
 TiJb6moEcqmT/GghWyZ6pQ+w1MjM4glBsZjL+MSJMupq8Noz4rPJ8WWoqiMCgQyAnm2D
 5Z+ogLJUU0xaQ24yYcw1sk5AgAdvjEWAKK51DQ42kFwrsNJAzEoy6ppwMnOSRnp4XP9P
 dJfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=LqvGyD+24JMyraAKv5uQyvYhkRjE/KxXflK+dGY7DZA=;
 b=udnjiZKsIYep5VZTSE+lhEYG/Ehsl8LzGH8ClAFB6zRP2qSb98fm93AzZ72/3j1T8q
 MD1CAbsrRBzupmkSZLSskiHyfk0ViKhQJjM2kuGMqlmPIjNHykqukt87ptAy0Ey/35aZ
 CzePSvJSKI8WIt5KET1PR33w39MVFPTNvBzoDVYSW3X+ulYzdDasFNt2DK/3oS+mczBd
 jfIVIQTincU1oNdREDEyTx5LdUAKczBy4+NxTsqy0VAPR3LPvun0rRfJxBL8fmYD0+5t
 1uZ/Z2Biiku/jm/n9Ojtv9dNVb0b+7kITDv52nVNzKtO+E+6B7MRwE510bOMj7L7+Xpa
 DSzg==
X-Gm-Message-State: AGi0PuaNaJpSnzyApVZ7U80b1DsbxJCBFLFikRdE0gViFBTZGlUpuu4H
 gb3o6lcddQ3CBb7yCIzw7YvN5w==
X-Google-Smtp-Source: APiQypL1rtTVuxpMyaupyr+Fh5McQhP7xb2ZdvsVvTvgcyo1a64T+ChJsE17lqg4ssuNqA4ZdfLRSA==
X-Received: by 2002:a65:578d:: with SMTP id b13mr2693946pgr.122.1585929688134; 
 Fri, 03 Apr 2020 09:01:28 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id c128sm5995798pfa.11.2020.04.03.09.01.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Apr 2020 09:01:27 -0700 (PDT)
Date: Fri, 03 Apr 2020 09:01:27 -0700 (PDT)
X-Google-Original-Date: Fri, 03 Apr 2020 09:01:13 PDT (-0700)
Subject: Re: [PATCH v3 0/3] hw/riscv: Add a serial property to sifive_u
In-Reply-To: <CAEUhbmUHNLYoJutr3dg0hpEPehuzRD4r6eux1EStZxCknMst0w@mail.gmail.com>
CC: Alistair Francis <Alistair.Francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, alistair23@gmail.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: bmeng.cn@gmail.com
Message-ID: <mhng-c816dc59-981b-4410-a6c1-240a8cf35ca2@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::542
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
X-List-Received-Date: Fri, 03 Apr 2020 16:01:34 -0000

On Mon, 23 Mar 2020 19:08:19 PDT (-0700), bmeng.cn@gmail.com wrote:
> Hi Palmer,
>
> On Sat, Mar 7, 2020 at 5:45 AM Alistair Francis
> <alistair.francis@wdc.com> wrote:
>>
>> At present the board serial number is hard-coded to 1, and passed
>> to OTP model during initialization. Firmware (FSBL, U-Boot) uses
>> the serial number to generate a unique MAC address for the on-chip
>> ethernet controller. When multiple QEMU 'sifive_u' instances are
>> created and connected to the same subnet, they all have the same
>> MAC address hence it creates a unusable network.
>>
>> A new "serial" property is introduced to specify the board serial
>> number. When not given, the default serial number 1 is used.
>>
>
> Could you please take this for v5.0.0?

It's in the queue, sorry I missed them.

