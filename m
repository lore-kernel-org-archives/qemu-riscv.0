Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jQx6d-0003X0-Gl
	for mharc-qemu-riscv@gnu.org; Tue, 21 Apr 2020 13:54:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39022)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmer@dabbelt.com>) id 1jQx6b-0003Wn-Rx
 for qemu-riscv@nongnu.org; Tue, 21 Apr 2020 13:54:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <palmer@dabbelt.com>) id 1jQx6b-0006gK-6c
 for qemu-riscv@nongnu.org; Tue, 21 Apr 2020 13:54:45 -0400
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644]:35927)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@dabbelt.com>)
 id 1jQx6a-0006fx-NL
 for qemu-riscv@nongnu.org; Tue, 21 Apr 2020 13:54:44 -0400
Received: by mail-pl1-x644.google.com with SMTP id g2so5536340plo.3
 for <qemu-riscv@nongnu.org>; Tue, 21 Apr 2020 10:54:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=pbQLfZNEmk9NwdxdIe4YCL2SDI8JoZiPsUPFarsQOac=;
 b=i8wmBIrN7Q0sIAyUiDXmSMc7jA5ll3kdUTJNk37hC3KU3HzeZIzdTt5cvMo2YMC57r
 GlbxR1gtkfgnfNbs82s3rfCtl4wFVT2Hfeplh8so8oOQKyIug2DGuq/vQTEv81gwWb3Z
 Tcs4tLKnXdFu8p4iPbz0ixbDWICK0WIKgTKor5Go44NudPvLwX/G/YeqFwQpRnZfsGyn
 s6KlTiIcdU2CF8ZRE0UOSEsrtcGQcyTahZ6t+byWHwFZjjZXQnpCVajTWvJmPaall7bw
 zxWuOLkngZP7Zm0yR3Nur5anXREgzwEcIx1kujdMoVepst0/K7Zppb4bKFYz5q5yZt7z
 mvXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=pbQLfZNEmk9NwdxdIe4YCL2SDI8JoZiPsUPFarsQOac=;
 b=KRpCxLBDOB0bqqRJ7FFPKuu6WDG9RzJivNcEqSPYO+oVzZIOvtjYRWCzFqBPbt1tDD
 Phdcjbc4/C6VhV2xBeRGZVZIV2hEn/XBuNZoUDNS40Ob4tg1Pj5A5FJsuiQDYKTWYWP9
 UKK81+DeDQIfOLgBqu9PRqfi0ZseduUANgxOUv+B/nkHftVeN6Qh3zZdZl+s0/Rp/bN2
 NlpX/CCZa0mO/z9X4Z3kxcc4SPxdnCeCqOnZxT5buRM/DAr2i1N+voBm+1Cgu+F/mUCC
 4Y3tQpgUw3BQinMQfwH64kORps1zHzDXOIkmrNM9yVNgQLhqEygLbMJxSQL0oCBKiEcW
 4Yfw==
X-Gm-Message-State: AGi0PuYEXdNEWC1hMUgFEYor3rue8zwClg8nsg8cWpnzeaiE4/AeZSui
 +vtOtB3OU53H+gJbYtfN37lzVw==
X-Google-Smtp-Source: APiQypIpqxeLv7B95SubW5UpwkpHIok3NoWXLw8+JbsbRgrGgq7bhiYABjXOfdvgq0B4oW2zGCjGjA==
X-Received: by 2002:a17:90a:f197:: with SMTP id
 bv23mr6858320pjb.3.1587491682541; 
 Tue, 21 Apr 2020 10:54:42 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id o99sm3056275pjo.8.2020.04.21.10.54.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Apr 2020 10:54:42 -0700 (PDT)
Date: Tue, 21 Apr 2020 10:54:42 -0700 (PDT)
X-Google-Original-Date: Tue, 21 Apr 2020 10:54:21 PDT (-0700)
Subject: Re: [PATCH v3 0/3] hw/riscv: Add a serial property to sifive_u
In-Reply-To: <CAKmqyKNvZYu0-VEf8HB_chbB_mD2DxsmCo5_p9Csx=KE8gbiGQ@mail.gmail.com>
CC: bmeng.cn@gmail.com, Alistair Francis <Alistair.Francis@wdc.com>,
 qemu-devel@nongnu.org, qemu-riscv@nongnu.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: alistair23@gmail.com
Message-ID: <mhng-6e844dae-bb4e-4385-8351-c1916d3b1983@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::644;
 envelope-from=palmer@dabbelt.com; helo=mail-pl1-x644.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2607:f8b0:4864:20::644
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
X-List-Received-Date: Tue, 21 Apr 2020 17:54:46 -0000

On Tue, 21 Apr 2020 10:40:05 PDT (-0700), alistair23@gmail.com wrote:
> On Mon, Apr 20, 2020 at 7:17 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>>
>> On Tue, Apr 21, 2020 at 3:26 AM Alistair Francis <alistair23@gmail.com> wrote:
>> >
>> > On Wed, Apr 1, 2020 at 10:39 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>> > >
>> > > On Tue, Mar 24, 2020 at 10:08 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>> > > >
>> > > > Hi Palmer,
>> > > >
>> > > > On Sat, Mar 7, 2020 at 5:45 AM Alistair Francis
>> > > > <alistair.francis@wdc.com> wrote:
>> > > > >
>> > > > > At present the board serial number is hard-coded to 1, and passed
>> > > > > to OTP model during initialization. Firmware (FSBL, U-Boot) uses
>> > > > > the serial number to generate a unique MAC address for the on-chip
>> > > > > ethernet controller. When multiple QEMU 'sifive_u' instances are
>> > > > > created and connected to the same subnet, they all have the same
>> > > > > MAC address hence it creates a unusable network.
>> > > > >
>> > > > > A new "serial" property is introduced to specify the board serial
>> > > > > number. When not given, the default serial number 1 is used.
>> > > > >
>> > > >
>> > > > Could you please take this for v5.0.0?
>> >
>> > Applied to the RISC-V tree for 5.1
>> >
>>
>> Sigh, this patch was submitted on Mar 7 and that is before soft freeze ...
>>
>> Any chance to get this in 5.0?
>
> That is up to Palmer. I'm only taking over PRs after the 5.0 release.

Oh, sorry, I just saw this.  I though I'd sent out this in a PR weeks ago, but
it looks like I didn't actually send it out.  I'm not sure if 5.0 is still
open, but I'll send a PR out now...

>
> Alistair
>
>>
>> Regards,
>> Bin

