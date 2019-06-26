Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hg2sV-0003WZ-OG
	for mharc-qemu-riscv@gnu.org; Wed, 26 Jun 2019 04:02:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40393)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <palmer@dabbelt.com>) id 1hg2sO-0003SS-0C
 for qemu-riscv@nongnu.org; Wed, 26 Jun 2019 04:01:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1hg2sJ-0006dw-KN
 for qemu-riscv@nongnu.org; Wed, 26 Jun 2019 04:01:55 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:39551)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1hg2sH-0006Ht-2I
 for qemu-riscv@nongnu.org; Wed, 26 Jun 2019 04:01:49 -0400
Received: by mail-pg1-f194.google.com with SMTP id 196so826069pgc.6
 for <qemu-riscv@nongnu.org>; Wed, 26 Jun 2019 01:01:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=GNVjCt/UnOvfzM54OS4u394MdYdibYc6JR2d6IeD4Y0=;
 b=KT7ICtswGnfjUOrjySb3Oh/ClG96IaRVC36Cd8W6dBSUXvuHeAmzc3h/QLmwDxhiFo
 0SwkR83abSdf2CmY/cn9+ZSdrZB68cdFf5eJgcNXcXGUtBs/EC2Fl3+9qOTmhioNtMeN
 Ud7pCtEFGY9nocosqcqwQ1Dx2ZOM60RPHBvenlkcYO6baqpAG8Rt1u2TPmRnPtETlWMq
 b5+8j1JAO9BqQqiO4IcRD3DlhI72CWVFEiY+AX4xwtt26Bz4e2IFDgVO6GAWTEz+rwtR
 u1MkCOGo/dpPrEx1G5eAPIo7vjH0WMRjGy5YHB7ptpULWBL88Af7jovtKDs7X2afChK8
 4BnA==
X-Gm-Message-State: APjAAAXR1R5BRhWxlM+7sxXIbGkgEKiomENDFWmw46Ye/uanY9POztj9
 /oai9GXxtyITGTpMTe94INo8zg==
X-Google-Smtp-Source: APXvYqzWvmc5RwFpr2xclUy9ABN40j9WXGJ2TZi2+Zi/U1OQuc3MMc8NfFQoi1Y+58p0juwDBglkBw==
X-Received: by 2002:a63:2bc8:: with SMTP id r191mr1604595pgr.398.1561536076676; 
 Wed, 26 Jun 2019 01:01:16 -0700 (PDT)
Received: from localhost (220-132-236-182.HINET-IP.hinet.net.
 [220.132.236.182])
 by smtp.gmail.com with ESMTPSA id g9sm13976523pgq.88.2019.06.26.01.01.15
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 26 Jun 2019 01:01:16 -0700 (PDT)
Date: Wed, 26 Jun 2019 01:01:16 -0700 (PDT)
X-Google-Original-Date: Wed, 26 Jun 2019 01:01:04 PDT (-0700)
In-Reply-To: <CAEUhbmVGdeX7j1ep1vJKhZ8a-4K2j-G40LjBJqDkXOi4WM-B9w@mail.gmail.com>
CC: alistair23@gmail.com, qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Alistair Francis <Alistair.Francis@wdc.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: bmeng.cn@gmail.com
Message-ID: <mhng-8dd07bdd-b2dd-46f7-ab0b-a14fe7cf7506@palmer-si-x1e>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.215.194
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH] riscv: virt: Correct pci
 "bus-range" encoding
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
X-List-Received-Date: Wed, 26 Jun 2019 08:02:00 -0000

On Tue, 25 Jun 2019 18:47:33 PDT (-0700), bmeng.cn@gmail.com wrote:
> Hi,
>
> On Fri, Jun 7, 2019 at 2:46 AM Alistair Francis <alistair23@gmail.com> wrote:
>>
>> On Thu, Jun 6, 2019 at 5:55 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>> >
>> > On Thu, May 30, 2019 at 11:36 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>> > >
>> > > Hi Alistair,
>> > >
>> > > On Thu, May 30, 2019 at 11:14 AM Alistair Francis <alistair23@gmail.com> wrote:
>> > > >
>> > > > On Wed, May 29, 2019 at 1:52 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>> > > > >
>> > > > > The largest pci bus number should be calculated from ECAM size,
>> > > > > instead of its base address.
>> > > > >
>> > > > > Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
>> > > >
>> > > > This seems ok, can you maybe explain what this fixes?
>> > > >
>> > >
>> > > The logic is wrong, as the commit message said. With current wrong
>> > > logic, the largest pci bus number encoded in "bus-ranges" property was
>> > > wrongly set to 0x2ff in this case. Per pci spec, the bus number should
>> > > not exceed 0xff.
>> > >
>> >
>> > Ping?
>>
>> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
>
> Can this go in the 4.1 PR?

This one I didn't miss, it's been in the queue for a bit.  Thanks!

