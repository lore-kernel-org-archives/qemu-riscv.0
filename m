Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iwpHJ-00038n-68
	for mharc-qemu-riscv@gnu.org; Wed, 29 Jan 2020 10:29:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46819)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmerdabbelt@google.com>) id 1iwpHG-00038Z-Tn
 for qemu-riscv@nongnu.org; Wed, 29 Jan 2020 10:29:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmerdabbelt@google.com>) id 1iwpHF-0008Pl-Sp
 for qemu-riscv@nongnu.org; Wed, 29 Jan 2020 10:29:14 -0500
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:41394)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmerdabbelt@google.com>)
 id 1iwpHF-0008MJ-Ke
 for qemu-riscv@nongnu.org; Wed, 29 Jan 2020 10:29:13 -0500
Received: by mail-wr1-x444.google.com with SMTP id c9so20676645wrw.8
 for <qemu-riscv@nongnu.org>; Wed, 29 Jan 2020 07:29:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:subject:cc:from:to:in-reply-to:references:message-id
 :mime-version:content-transfer-encoding;
 bh=/OepjiM66bZe8KwsOgHG8bTCJYzjbGSZ/EkEmj4RXsc=;
 b=OTEKiEVOBmM8V1L4U7WPSvkW0qbL9igEx4jyxr1Po7mAQQ4RH5E/4GdzH9ngaexTFc
 uBbf+wHCRH1re131HKG6JHGHpZMFyPRizOqdAqRW2GMn267WswLUJt37C48tv0X0cQeC
 cQqsQEzSCER/NGKz7SMf5nqIWDr4TbslA/VWo0maCrGucS9l1OWQa23C/a7MZFCQ00bb
 vJeb8DvIJCbsUmt7NxrOVuHiUFjd6DUALeipPivQ2/jN1f3dmM1mdfHuE0LWTrecGY6z
 Tue51n8g0MqlxmhrInjgPEDj2sKP+ih9DAesQUQO4EXqZqO4BuiaHUjgBRdekulH9f3t
 t7WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:cc:from:to:in-reply-to:references
 :message-id:mime-version:content-transfer-encoding;
 bh=/OepjiM66bZe8KwsOgHG8bTCJYzjbGSZ/EkEmj4RXsc=;
 b=plptapbcSp612trrsBfe5C2AsB++jTKWhT8aRHsaMSi9fhnwERUKfbs+bCqmJNZuhN
 LSBqP094t0hr1HboI+N8CORx/qlPS4gOrXjt1iLUQ+3E510V1HXT2MMxV9SC0DoMGlMh
 QwzhYHpjBfsjGUPbqSOMI2d3UC1PnPveOvQa5D8LfooDR1C05P55OQ3C7Lo9EG7ZLjjR
 FynVvN9MWObYdAnIuUC/FsmI5fhwPxCOA1WsTNGa3yWXSIulp/LJ7KF7vHc06S2seYZm
 gb1oITUd0YeE+ZVp8TOHiVg/17f1yucx5i9gcvH5ijz5pbTOnwJunrkxzxGzL0R5b1d3
 cTzQ==
X-Gm-Message-State: APjAAAWohy0ARvvVYkq/UYkra8smTozHy9MYGHT1/Ay+2ew0IBbazJUo
 d6hYZpuvS2/bk/8Wzub7Vd5Iqw==
X-Google-Smtp-Source: APXvYqxSdv2Bu4x6KY+14S+ce+NFPS1gCqWJTTT3ubj5CcfxJtt6kaAOSD5gmao6t9a2I9gCXL8qVQ==
X-Received: by 2002:a5d:4ec2:: with SMTP id s2mr33695170wrv.291.1580311751448; 
 Wed, 29 Jan 2020 07:29:11 -0800 (PST)
Received: from localhost ([2a00:79e0:d:11:1da2:3fd4:a302:4fff])
 by smtp.gmail.com with ESMTPSA id b17sm3264260wrx.15.2020.01.29.07.29.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jan 2020 07:29:11 -0800 (PST)
Date: Wed, 29 Jan 2020 07:29:11 -0800 (PST)
X-Google-Original-Date: Wed, 29 Jan 2020 15:28:50 GMT (+0000)
Subject: Re: [PATCH] riscv: sifive_u: Add a "serial" property for board serial
 number
CC: Alistair Francis <Alistair.Francis@wdc.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, sagark@eecs.berkeley.edu,
 qemu-devel@nongnu.org, qemu-riscv@nongnu.org
From: Palmer Dabbelt <palmerdabbelt@google.com>
To: bmeng.cn@gmail.com
In-Reply-To: <CAEUhbmXRaHqxNt2XCgsjUDfR+VoMOjb5f38V6Yu35HWV1nkKeQ@mail.gmail.com>
References: <CAEUhbmXRaHqxNt2XCgsjUDfR+VoMOjb5f38V6Yu35HWV1nkKeQ@mail.gmail.com>
 <CAEUhbmUuCOzd_Y6ip_oh13gt83rM8EffdXWRCa=KybOjAvEN-A@mail.gmail.com>
 <mhng-b2e05f4a-7c3d-4be1-a843-a19b4054760a@palmerdabbelt.mtv.corp.google.com>
Message-ID: <mhng-e3089574-e78c-4b6c-961e-cac55f0f23d4@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::444
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
X-List-Received-Date: Wed, 29 Jan 2020 15:29:16 -0000

On Fri, 10 Jan 2020 07:52:05 GMT (+0000), bmeng.cn@gmail.com wrote:
> Hi Palmer,
>
> On Fri, Nov 22, 2019 at 10:38 AM Palmer Dabbelt
> <palmerdabbelt@google.com> wrote:
>>
>> On Thu, 21 Nov 2019 17:10:18 PST (-0800), bmeng.cn@gmail.com wrote:
>> > On Sat, Nov 16, 2019 at 11:08 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>> >>
>> >> At present the board serial number is hard-coded to 1, and passed
>> >> to OTP model during initialization. Firmware (FSBL, U-Boot) uses
>> >> the serial number to generate a unique MAC address for the on-chip
>> >> ethernet controller. When multiple QEMU 'sifive_u' instances are
>> >> created and connected to the same subnet, they all have the same
>> >> MAC address hence it creates a unusable network.
>> >>
>> >> A new "serial" property is introduced to specify the board serial
>> >> number. When not given, the default serial number 1 is used.
>> >>
>> >> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
>> >> ---
>> >>
>> >>  hw/riscv/sifive_u.c         | 21 ++++++++++++++++++++-
>> >>  include/hw/riscv/sifive_u.h |  1 +
>> >>  2 files changed, 21 insertions(+), 1 deletion(-)
>> >>
>> >
>> > ping?
>>
>> Sorry, it looks like I dropped this one.  I've put it in the queue for 5.0,
>> with a
>>
>> Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
>
> Has this been applied somewhere?

Weird, not sure how I managed to screw this up again.  It's actually on for-master as 

    * a828041ba6 - riscv: sifive_u: Add a "serial" property for board serial number (50 seconds ago) <Bin Meng>

with any luck I'll manage to avoid screwing it up a third time.

>
> Regards,
> Bin

