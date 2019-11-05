Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iS3oA-0003BX-FB
	for mharc-qemu-riscv@gnu.org; Tue, 05 Nov 2019 13:44:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59609)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmer@sifive.com>) id 1iS3o8-00038b-39
 for qemu-riscv@nongnu.org; Tue, 05 Nov 2019 13:44:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@sifive.com>) id 1iS3o6-0002ev-Rd
 for qemu-riscv@nongnu.org; Tue, 05 Nov 2019 13:43:59 -0500
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:40274)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@sifive.com>) id 1iS3o6-0002dz-KQ
 for qemu-riscv@nongnu.org; Tue, 05 Nov 2019 13:43:58 -0500
Received: by mail-pg1-x541.google.com with SMTP id 15so14905575pgt.7
 for <qemu-riscv@nongnu.org>; Tue, 05 Nov 2019 10:43:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=yLuvCFUddkI93gzOEAO/dpXNHzKVU9aKgXyUMMSp0FU=;
 b=BGYrjsyqrvdn+VslzPYr2pvkZ/b8G5obbm34MELxakZEdkYrh7KQeS5CyeKiQxsC7f
 RxxSbW0tahVx4dYOsQgbvBNUokUul1MbAWIA1ESB/cWccC74mWGY/A91hZGH1erti+7h
 dSmfk7Fruf6kAbn/ObOzKlKjdYDLyybzCDXHf2Y2Q//rqtPzKH01Sa5zWT1PsIX4hwUi
 sof/mIAFNZ7m8vtqXiArgpfz83sSzsGr2i9ayewpCzlHB5bNCr6N0XxsnwgH3wz9Mr/6
 TomZLiTwYMLdPGLNr0hnycn7jOkKVuSg70ezTHZJXs5JKX7c5Z9CO1JEUnBVg3B/KFJJ
 7JhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=yLuvCFUddkI93gzOEAO/dpXNHzKVU9aKgXyUMMSp0FU=;
 b=gKYueZKwr2b8hwplfDs9+Y00zpRDU9B3/cgjc7Qu8xcz/tQ1ZbMobAg2OyvhABG3GG
 dIQCHCG3/bBv02Hyb23Ciz4PUQjp0Bvri+NLoNWORTQTioyGnKSp74WnvSkGGDfuGiyZ
 HwUbwhROHumBMAmfSpZ7AzeYeSAMrK9zapdOUvZslLEjCuMr6tX9hEFWvObTQFPJSGYM
 x5MzClIzijTunyX3NV5SQXuXygewZeplgH0siMZt2UAkXIAShPJ6MATvZ57CF6NhHRfB
 pgS1FYjS+sFImx3hOan2HKj3ZAUSkjxFDvEUnFnKzYJ0NbrLVdmeSBZoX3xlhqmvhx2e
 kLWg==
X-Gm-Message-State: APjAAAWZG8PWamdIEX4j6sbhyIlQ4mc+G/uEEJAeWgzvx7MnX+pXdzjI
 A/s0fAR+mOj4bXHiKxbBtNrLBQ==
X-Google-Smtp-Source: APXvYqwwVSyc1BNCkUH8jVCJIy57luLQ9fBdiuv0M+0O522m28hcpsI+mAj5e6808AUf7h3XXBTZJg==
X-Received: by 2002:a63:8249:: with SMTP id w70mr2438075pgd.54.1572979436636; 
 Tue, 05 Nov 2019 10:43:56 -0800 (PST)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id f33sm19836274pgl.33.2019.11.05.10.43.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Nov 2019 10:43:55 -0800 (PST)
Date: Tue, 05 Nov 2019 10:43:55 -0800 (PST)
X-Google-Original-Date: Tue, 05 Nov 2019 09:42:18 PST (-0800)
Subject: Re: [PATCH v5 0/2] RTC support for QEMU RISC-V virt machine
In-Reply-To: <CAFEAcA9bV=-t0+ro6rxu7Atodj6J78aT1aMnz9bjaqyfLDV3_w@mail.gmail.com>
CC: alistair23@gmail.com, qemu-riscv@nongnu.org, sagark@eecs.berkeley.edu,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Anup Patel <Anup.Patel@wdc.com>, qemu-devel@nongnu.org, 
 Atish Patra <Atish.Patra@wdc.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 anup@brainfault.org
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <mhng-2b88a4a2-0027-4ec8-947d-1515e5b05f39@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::541
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
X-List-Received-Date: Tue, 05 Nov 2019 18:44:01 -0000

On Sat, 02 Nov 2019 03:37:42 PDT (-0700), Peter Maydell wrote:
> On Tue, 29 Oct 2019 at 13:25, Alistair Francis <alistair23@gmail.com> wrote:
>>
>> On Fri, Oct 25, 2019 at 6:28 AM Anup Patel <Anup.Patel@wdc.com> wrote:
>> >
>> > This series adds RTC device to QEMU RISC-V virt machine. We have
>> > selected Goldfish RTC device model for this. It's a pretty simple
>> > synthetic device with few MMIO registers and no dependency external
>> > clock. The driver for Goldfish RTC is already available in Linux so
>> > we just need to enable it in Kconfig for RISCV and also update Linux
>> > defconfigs.
>> >
>> > We have tested this series with Linux-5.4-rc4 plus defconfig changes
>> > available in 'goldfish_rtc_v2' branch of:
>> > https://github.com/avpatel/linux.git
>>
>> @Peter Maydell this has been reviewed, do you mind taking this in you
>> next PR? I don't see a maintainer for hw/rtc.
>
> Generally devices used by a single architecture should
> go via the tree of the maintainer who handles that
> architecture -- in this case that's riscv. (The reason
> is that it's only riscv folks who can test whether the
> device works in the machine model, and only riscv
> folks who can reasonably review whether the device
> is the right way of implementing the functionality for
> them.)

OK, I'm taking it via the RISC-V tree.  I'll send the PR for 4.3.

