Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hxgHb-0004l6-7v
	for mharc-qemu-riscv@gnu.org; Tue, 13 Aug 2019 19:32:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32795)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <palmer@dabbelt.com>) id 1hxgHY-0004j6-U6
 for qemu-riscv@nongnu.org; Tue, 13 Aug 2019 19:32:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1hxgHX-0002Wj-UE
 for qemu-riscv@nongnu.org; Tue, 13 Aug 2019 19:32:48 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:38612)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1hxgHX-0002WV-MY
 for qemu-riscv@nongnu.org; Tue, 13 Aug 2019 19:32:47 -0400
Received: by mail-pg1-f193.google.com with SMTP id e11so1497036pga.5
 for <qemu-riscv@nongnu.org>; Tue, 13 Aug 2019 16:32:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=VUCYFgLRcrjaURdLsUK0F7+mqlZBM3XUnUhKf279SxU=;
 b=JJ+QtHsjq8a9ErmmnFg3LMeCeYLi4u19Mvpz2IlBPyJd7em5CZTe2fAPtS6WNIl2cG
 yvFR9FrMu6DkCxG9mXvxch8Hc3/6hdkkQ1LrYU8iRpalQamhuw6WGyoL21kaB939a3ZI
 L4WX+N3h6NLhqnrdtZjSEdwnTQSSpNDvHKepZ4qsnJoZTFpi7unpJv+XNBzcwXnuE4yQ
 DTFFJqaJ9empZ11bRgeUow8jk5jRowAE/xzgj37JtOMa9rGyCpdaxWg7xo/89LfS2O1A
 KntD82KsxVHKkB8EghISIwk4/KM/gw7Wku/ZRzO/98qLTtdm01HOYHjGM2m8dhG63bH+
 m55g==
X-Gm-Message-State: APjAAAUzcp5TIjBMyCLOqTdgR8MyuF9SEZBEqo0TaQ6jRZG5h772SP8b
 OodkG/Lgwe8JoilM7GuQiZlCsw==
X-Google-Smtp-Source: APXvYqxyEIxdhY9OaPUWlG3GQ/bez3G6FJqIi3VcEa5NwTg5kaG1TXxE5Auzehp+LL7a4ZcojnnFHQ==
X-Received: by 2002:a62:8f91:: with SMTP id n139mr41734308pfd.48.1565739166427; 
 Tue, 13 Aug 2019 16:32:46 -0700 (PDT)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id t7sm113231981pfh.101.2019.08.13.16.32.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Aug 2019 16:32:45 -0700 (PDT)
Date: Tue, 13 Aug 2019 16:32:45 -0700 (PDT)
X-Google-Original-Date: Tue, 13 Aug 2019 16:32:33 PDT (-0700)
In-Reply-To: <CAKmqyKNFTFjzHpt5YewksjW=eEZp+A=tmrcb3AynXK56e0tLXg@mail.gmail.com>
CC: Peter Maydell <peter.maydell@linaro.org>, bmeng.cn@gmail.com,
 qemu-riscv@nongnu.org, mst@redhat.com, lersek@redhat.com, qemu-devel@nongnu.org,
 Alistair Francis <Alistair.Francis@wdc.com>, kraxel@redhat.com,
 imammedo@redhat.com, philmd@redhat.com
From: Palmer Dabbelt <palmer@sifive.com>
To: alistair23@gmail.com
Message-ID: <mhng-9d672209-4c16-444d-964f-54dbb46c8466@palmer-si-x1e>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.215.193
Subject: Re: [Qemu-riscv] [Qemu-devel] [FOR 4.1 PATCH] riscv: roms: Fix make
 rules for building sifive_u bios
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
X-List-Received-Date: Tue, 13 Aug 2019 23:32:50 -0000

On Tue, 13 Aug 2019 09:52:13 PDT (-0700), alistair23@gmail.com wrote:
> On Tue, Aug 13, 2019 at 6:00 AM Peter Maydell <peter.maydell@linaro.org> wrote:
>>
>> On Mon, 12 Aug 2019 at 09:38, Peter Maydell <peter.maydell@linaro.org> wrote:
>> >
>> > On Sun, 11 Aug 2019 at 08:17, Bin Meng <bmeng.cn@gmail.com> wrote:
>> > >
>> > > Hi Palmer,
>> > >
>> > > On Tue, Aug 6, 2019 at 1:04 AM Alistair Francis <alistair23@gmail.com> wrote:
>> > > >
>> > > > On Fri, Aug 2, 2019 at 11:08 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>> > > > >
>> > > > > Currently the make rules are wrongly using qemu/virt opensbi image
>> > > > > for sifive_u machine. Correct it.
>> > > > >
>> > > > > Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
>> > > >
>> > > > Good catch.
>> > > >
>> > > > @Palmer Dabbelt can you take this for 4.1?
>> > > >
>> > >
>> > > Is this patch merged for 4.1? Thanks!
>> >
>> > Sorry, it doesn't look like it is, and it's now missed the
>> > deadline for 4.1 (only critical showstopper bugs and security
>> > issues would go in at this point).
>>
>> Since a very late ppc pullreq turned up which needed to also go into
>> rc5 and meant we couldn't just have a single-change rc, I figured this
>> was safe enough to also apply for rc5, so I've put it in.
>
> Thanks Peter!

Ya, that's great -- this will save us some headaches.

