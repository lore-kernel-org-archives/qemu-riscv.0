Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1i5Dp8-0008Tz-2z
	for mharc-qemu-riscv@gnu.org; Tue, 03 Sep 2019 14:46:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33971)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmer@dabbelt.com>) id 1i5Dp5-0008Tk-Go
 for qemu-riscv@nongnu.org; Tue, 03 Sep 2019 14:46:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1i5Dp4-0004El-6u
 for qemu-riscv@nongnu.org; Tue, 03 Sep 2019 14:46:35 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:40979)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1i5Dp4-0004EB-10
 for qemu-riscv@nongnu.org; Tue, 03 Sep 2019 14:46:34 -0400
Received: by mail-pg1-f195.google.com with SMTP id x15so9621187pgg.8
 for <qemu-riscv@nongnu.org>; Tue, 03 Sep 2019 11:46:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=lTBnmSOBqUKx2hxZLXlAr5Jk335lHE92K6mAhufuKb0=;
 b=Mru9u8NIPp4NHwxQ8K8UlWPIkyOI3mLRdGBog5G+MZT2YU5Qt/m/WBvE4b1+2SmKbL
 aE1lrgb6YLvwiekcUNx1w1pBRgUhdxHtjscosHR4nICOPk8f+xRsaG0WjXWnVIXQHuxi
 7nE6/KhToHm5Yb8jewVU5uBZF+hbfdqrqrwl7VI4GFEyRTiucEHGAnB3SBjzNDnBO/mP
 zeS0q4ty/ze9O6Il/I47dfngOM5lZWPrfsOZKp05oolcEmzcGW8J7bV7jN/41fPjOM/Q
 dyq86zsf5eyayOcWGbX55b4BCQZ8pyUFvXZo2Abnb/H07Gdcve9eCpCMLt7Lnkas7wzY
 cfJQ==
X-Gm-Message-State: APjAAAWKUr62At2BdeLXSBK8Ubdh/wbRdZCd4bkl3muBN9wKRFY2yq9T
 TSJ4KijH010Y4CGAxARcH0kCCQ==
X-Google-Smtp-Source: APXvYqyCURPjGi+zSKb5TovgXT/uNBgY2uC1FxCLDolVYEDgiIujwtZjOMK3nvrGiePEoCtISw4miw==
X-Received: by 2002:a63:4a51:: with SMTP id j17mr31507143pgl.284.1567536392250; 
 Tue, 03 Sep 2019 11:46:32 -0700 (PDT)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id r23sm272493pjo.22.2019.09.03.11.46.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2019 11:46:31 -0700 (PDT)
Date: Tue, 03 Sep 2019 11:46:31 -0700 (PDT)
X-Google-Original-Date: Tue, 03 Sep 2019 10:35:56 PDT (-0700)
In-Reply-To: <CAEUhbmV5fWqzPcdWW52n7DTczTtoLfbmE0HhLCz1jsgcNbLwRA@mail.gmail.com>
CC: Alistair Francis <Alistair.Francis@wdc.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, sagark@eecs.berkeley.edu,
 dgilbert@redhat.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
From: Palmer Dabbelt <palmer@sifive.com>
To: bmeng.cn@gmail.com
Message-ID: <mhng-255d26e8-02dd-4acb-8b8f-a5e35aabd6c4@palmer-si-x1e>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.215.195
Subject: Re: [Qemu-riscv] [PATCH v4] riscv: hmp: Add a command to show
 virtual memory mappings
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
X-List-Received-Date: Tue, 03 Sep 2019 18:46:36 -0000

On Tue, 27 Aug 2019 18:31:18 PDT (-0700), bmeng.cn@gmail.com wrote:
> Hi Palmer,
>
> On Wed, Aug 28, 2019 at 7:18 AM Palmer Dabbelt <palmer@sifive.com> wrote:
>>
>> On Sun, 18 Aug 2019 22:59:54 PDT (-0700), bmeng.cn@gmail.com wrote:
>> > On Wed, Aug 14, 2019 at 11:33 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>> >>
>> >> This adds 'info mem' command for RISC-V, to show virtual memory
>> >> mappings that aids debugging.
>> >>
>> >> Rather than showing every valid PTE, the command compacts the
>> >> output by merging all contiguous physical address mappings into
>> >> one block and only shows the merged block mapping details.
>> >>
>> >> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
>> >> Acked-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
>> >> Reviewed-by: Palmer Dabbelt <palmer@sifive.com>
>> >>
>> >> ---
>> >>
>> >> Changes in v4:
>> >> - restore to v2, that does not print all harts's PTE, since we
>> >>   should switch to a cpu context via the 'cpu' command
>> >>
>> >> Changes in v3:
>> >> - print PTEs for all harts instead of just current hart
>> >>
>> >> Changes in v2:
>> >> - promote ppn to hwaddr when doing page table address calculation
>> >>
>> >>  hmp-commands-info.hx       |   2 +-
>> >>  target/riscv/Makefile.objs |   4 +
>> >>  target/riscv/monitor.c     | 229 +++++++++++++++++++++++++++++++++++++++++++++
>> >>  3 files changed, 234 insertions(+), 1 deletion(-)
>> >>  create mode 100644 target/riscv/monitor.c
>> >>
>> >
>> > Ping?
>> >
>> > What's the status of this patch?
>>
>> This is in my patch queue (for-master on github).  I'm still a bit backed up on
>> email, but when I get caught back up I'll send a PR.
>
> I double checked your git repo, and found you applied an older version
> of this patch.
>
> Please drop that, and apply this v4 one.
> http://patchwork.ozlabs.org/patch/1147104/

Sorry about that, it should be fixed now.

