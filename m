Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1i5xFg-00022j-VL
	for mharc-qemu-riscv@gnu.org; Thu, 05 Sep 2019 15:17:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45115)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmer@dabbelt.com>) id 1i5xFZ-00020W-5p
 for qemu-riscv@nongnu.org; Thu, 05 Sep 2019 15:16:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1i5xFX-0003Um-D1
 for qemu-riscv@nongnu.org; Thu, 05 Sep 2019 15:16:57 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:33075)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1i5xFX-0003T8-4s
 for qemu-riscv@nongnu.org; Thu, 05 Sep 2019 15:16:55 -0400
Received: by mail-pg1-f194.google.com with SMTP id n190so1977620pgn.0
 for <qemu-riscv@nongnu.org>; Thu, 05 Sep 2019 12:16:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=iDHG0BDVBB8epY4Vv2q/BqiF9tL6/6irQjK8zuxQYWY=;
 b=ocIjmCHz/imf5A9IPENggskyOnybcuaf6r1CiJLAiqiwGBh7DonDpSJCQt3pTts5Fo
 wwFBBqprfO/XDh4crlAV7mhAwD5MDORGeuTq+KfWr+yCefdg8qrKpBmFDV2s54tUHQK6
 fb543i/g3YfYpIqkN7wYV4iSKeIjKjo9nIo3iHolw+etKSUItlI9Xdc3hfgNnfDPZz4y
 wegJExcGR1xwy6gmh09HoY/TVoMEtgvJWK8tOwy437tjihAi850ByRAorwqODV5mMZlT
 HPmlZeikSjt/rFZjtsZISvxy/umxs/Ipp0OPCl3FE6V8kzNTlKX4l+JN+kua7WaSktP3
 QU2Q==
X-Gm-Message-State: APjAAAXNtl11oyPEKwryQyFjphjjz3YV6LtL5q2khSxFx62O+m3hOH78
 goUPkTvPd0fMhcbJ6aMSOkrpQw==
X-Google-Smtp-Source: APXvYqzUIHNrQ3B+aRSQp3DHHG9RDU1Vl8NoiwOCCZ5uKwCSLUhIbYybptv7XR4BSmFUQL50ytrk/A==
X-Received: by 2002:a62:ee0a:: with SMTP id e10mr5918604pfi.197.1567711013322; 
 Thu, 05 Sep 2019 12:16:53 -0700 (PDT)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id k5sm2534680pjs.1.2019.09.05.12.16.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Sep 2019 12:16:52 -0700 (PDT)
Date: Thu, 05 Sep 2019 12:16:52 -0700 (PDT)
X-Google-Original-Date: Thu, 05 Sep 2019 12:16:43 PDT (-0700)
In-Reply-To: <CAEUhbmX-czUP9e9CcN69kjkw2VZJaRcEc+F0SVbRXYkaecv9MQ@mail.gmail.com>
CC: qemu-devel@nongnu.org, qemu-riscv@nongnu.org
From: Palmer Dabbelt <palmer@sifive.com>
To: bmeng.cn@gmail.com
Message-ID: <mhng-0cc8e543-568d-44a0-8408-1d2e439939e2@palmer-si-x1e>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.215.194
Subject: Re: [Qemu-riscv] [PATCH v2] riscv: sifive_test: Add reset
 functionality
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
X-List-Received-Date: Thu, 05 Sep 2019 19:16:59 -0000

On Thu, 05 Sep 2019 08:57:44 PDT (-0700), bmeng.cn@gmail.com wrote:
> Hi Palmer,
>
> On Thu, Sep 5, 2019 at 11:55 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>>
>> This adds a reset opcode for sifive_test device to trigger a system
>> reset for testing purpose.
>>
>> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
>> Reviewed-by: Palmer Dabbelt <palmer@sifive.com>
>>
>> ---
>>
>> Changes in v2:
>> - fix build error in the "for-master" branch of Palmer's RISC-V repo
>>   that was rebased on QEMU master
>>
>>  hw/riscv/sifive_test.c         | 4 ++++
>>  include/hw/riscv/sifive_test.h | 3 ++-
>>  2 files changed, 6 insertions(+), 1 deletion(-)
>>
>
> Please drop the already applied v1 patch in your "for-master" branch
> and apply this v2.
>
> After you rebased the "for-master' branch, this patch no longer build
> any more due to changes in QEMU master.
>
> Regards,
> Bin

Thanks!

