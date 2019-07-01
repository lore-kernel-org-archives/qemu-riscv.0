Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hi4ZL-0005QR-5a
	for mharc-qemu-riscv@gnu.org; Mon, 01 Jul 2019 18:14:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58891)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hi4ZA-0005Lk-1N
 for qemu-riscv@nongnu.org; Mon, 01 Jul 2019 18:14:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hi4Z7-0003o6-E4
 for qemu-riscv@nongnu.org; Mon, 01 Jul 2019 18:14:27 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:44389)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hi4Z7-0003nt-9U
 for qemu-riscv@nongnu.org; Mon, 01 Jul 2019 18:14:25 -0400
Received: by mail-ot1-f66.google.com with SMTP id b7so15072644otl.11
 for <qemu-riscv@nongnu.org>; Mon, 01 Jul 2019 15:14:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BH24mY7k31TZuEACtPdnoer+3QK+UzkYFwAlGUuW/xc=;
 b=PG2Gf8lnkqL04b54KHIPw303yj+wZif5+Nx9aTpQBUdj5AbSYQXUAps5bD+h8EObaG
 outuZZHpWugFVGZ2bjAs4gkr0Nb6EoJcxcqanqFNDFA9pp5hzcqwbpcVMQep5R/T8dQ9
 xg/QooE7bfVEXbZ7T6G5YLwI7ekHCKo7XrSQdCkeb8ywqyHJN8CAeIqKtm4XAm1oK5o7
 u824WE2f8nWeA9MVLlVJrq+O22Te9CoqsH1/cztSfuw8zObSmgzc5kstX+FNzG0Mgw2+
 ZBDVfy/1PG+WEBj6kZc2m1b7jBFAsR5rTfFRuct9dR5ZtoakOZUWn8em7oAezRXWallN
 Blzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BH24mY7k31TZuEACtPdnoer+3QK+UzkYFwAlGUuW/xc=;
 b=IUd/KwAA7p4MQvU5hl4RmdRE962OKTuWLMKm7ygdwrRaMls/YnWvKX8W1qfEhWem8h
 Z4I67MfeP7EiHw0mQ076j5aZpBVJIKQKy3MDoywaTjJEgsJiOu+u0XuUiyTCU9AtO2R6
 FbGAai7nXHgssGHaNBtUHsj1Ebodg2UlMmEcS9hcEuw60dhJLWJtEhSydztjflpb+70L
 IEApJoyroMG4aeEgenHFACZonjcP/j2GYzhS/CH5YkPhNeeXCZM8T5kIy2sqMRz49AxN
 xVN+0eRP15tiTRqtwoNIWy10xytEFDEy6mz3RQ/6dEjGXjc1zeE8gMcR9z1wEMnVAYan
 EE/w==
X-Gm-Message-State: APjAAAWYLgQow3IVgZro6KC5LnAExVL8CyCq94Cd0K8GsPCdE9c5V+aX
 T5Yf8tE2BRxdWvnoRMsDMnHvojmhi9i4IjDinD4n99RviGM=
X-Google-Smtp-Source: APXvYqxurZRvyLXBTyGMagF+p8aXINbgp9r1YhxiIZyGtOtKkuw44zNowbC/NUnXNTNz2ius8HACwgpp5BWCKF67CGc=
X-Received: by 2002:a9d:4d81:: with SMTP id u1mr9605025otk.221.1562004794476; 
 Mon, 01 Jul 2019 11:13:14 -0700 (PDT)
MIME-Version: 1.0
References: <20190627152011.18686-1-palmer@sifive.com>
 <20190627152011.18686-34-palmer@sifive.com>
 <CAFEAcA8sscJQ2GCwL1gM+EcRtfHQb1v0BwORt6ncH54x51TCVg@mail.gmail.com>
 <5896113812cd914308e5b617377f8e8205224cfe.camel@wdc.com>
 <CAFEAcA_-h6b_f1fuWh7NkGo+FT0xSyCDXgd3b4pwEvNDN8HcJw@mail.gmail.com>
 <efaaaa7aabddfb8481af4c5b2eeec23513f8fcb8.camel@wdc.com>
In-Reply-To: <efaaaa7aabddfb8481af4c5b2eeec23513f8fcb8.camel@wdc.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 1 Jul 2019 19:13:03 +0100
Message-ID: <CAFEAcA_cwm_1VhGW7yGL6=ja7TuO3c9perBs_OoWMaXBhJYH9g@mail.gmail.com>
To: Alistair Francis <Alistair.Francis@wdc.com>
Cc: "codyprime@gmail.com" <codyprime@gmail.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, 
 "stefanha@redhat.com" <stefanha@redhat.com>,
 "qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>, 
 "bmeng.cn@gmail.com" <bmeng.cn@gmail.com>,
 "eblake@redhat.com" <eblake@redhat.com>, 
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "palmer@sifive.com" <palmer@sifive.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.210.66
Subject: Re: [Qemu-riscv] [PULL 33/34] roms: Add OpenSBI version 0.3
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
X-List-Received-Date: Mon, 01 Jul 2019 22:14:33 -0000

On Mon, 1 Jul 2019 at 19:09, Alistair Francis <Alistair.Francis@wdc.com> wrote:
>
> On Mon, 2019-07-01 at 19:01 +0100, Peter Maydell wrote:
> > On Mon, 1 Jul 2019 at 18:50, Alistair Francis <
> > Alistair.Francis@wdc.com> wrote:
> > > PS: It seems like there are still some issues with this patch so
> > > maybe
> > > it's worth dropping this patch from the PR so that we can get
> > > everything else merged.
> >
> > Yeah, that would be my suggestion.
>
> Can you do that when you merge it or does Palmer have to send the PR
> again?

Palmer needs to respin it -- pulls are signed and I can't
modify them, only either apply them or not. (Technically I
could in theory cherry-pick all the other commits out of them
but that would be a huge amount of manual labour.)

thanks
-- PMM

