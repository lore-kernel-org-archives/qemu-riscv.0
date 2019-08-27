Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1i2kjW-0002kb-V1
	for mharc-qemu-riscv@gnu.org; Tue, 27 Aug 2019 19:18:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49225)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmer@dabbelt.com>) id 1i2kjV-0002kJ-4O
 for qemu-riscv@nongnu.org; Tue, 27 Aug 2019 19:18:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1i2kjT-00009M-KU
 for qemu-riscv@nongnu.org; Tue, 27 Aug 2019 19:18:37 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:39796)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1i2kjT-00008l-Fh
 for qemu-riscv@nongnu.org; Tue, 27 Aug 2019 19:18:35 -0400
Received: by mail-pf1-f193.google.com with SMTP id y200so373992pfb.6
 for <qemu-riscv@nongnu.org>; Tue, 27 Aug 2019 16:18:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=+NdJXzop9xzMrXs45gCXpBCRNCnn/BP7yEKo856qVN8=;
 b=ClSbZdbcMhDFzLTLNntXJNN5OYl2Ec47Ok79rJl3weNmcBaPsI9IvMtqELy/ez87bh
 8As5OV2rViquWQPfJovp2oPiCxNX0vyhqWENJq5y7vpI+udPvS6kfXKhcaT5400y9zpV
 W9WZ7RegLb0y52wymbeVT1nPHRZrwdjYoJmFRIkB+eH/oFMxL1jPN8RMpSsUDgCfiRW8
 mYkngfsBTjEJIJkir80eEn36GKdZNh49t3Yhx7KDDQyFNjVv+LY58xDEQQxI7rHRMOJ8
 tJICZbhX456u388Jztkvb8fCcCUItS6+xqCZ0X5oWX6Qr4Pv6+yN3KEi5zIsAkJKlf76
 feBg==
X-Gm-Message-State: APjAAAWwwdqc6gYcMgVBUQHoxZ8mlStkN3v+0qsZOqeHJFyFhe6CO23t
 pxdoCPA3L7vMIKItpbE5VK0D9g==
X-Google-Smtp-Source: APXvYqywcUq5YaCvD5t/iURf9viSeWS/h6sspDDjvgcBz8/6SQ5zT90k3b2unNnsps5xupgxbdrPyw==
X-Received: by 2002:a63:5048:: with SMTP id q8mr816030pgl.446.1566947913939;
 Tue, 27 Aug 2019 16:18:33 -0700 (PDT)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id d2sm247111pjg.19.2019.08.27.16.18.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Aug 2019 16:18:33 -0700 (PDT)
Date: Tue, 27 Aug 2019 16:18:33 -0700 (PDT)
X-Google-Original-Date: Tue, 27 Aug 2019 16:18:25 PDT (-0700)
In-Reply-To: <CAEUhbmWacQtwTRYhCw6GwfGBabrWbe2Ss2JVCJ5XE7s3bVE-gA@mail.gmail.com>
CC: Alistair Francis <Alistair.Francis@wdc.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, sagark@eecs.berkeley.edu,
 dgilbert@redhat.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
From: Palmer Dabbelt <palmer@sifive.com>
To: bmeng.cn@gmail.com
Message-ID: <mhng-e6db993a-530d-4220-8345-59a8b642a5ac@palmer-si-x1e>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.210.193
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
X-List-Received-Date: Tue, 27 Aug 2019 23:18:38 -0000

On Sun, 18 Aug 2019 22:59:54 PDT (-0700), bmeng.cn@gmail.com wrote:
> On Wed, Aug 14, 2019 at 11:33 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>>
>> This adds 'info mem' command for RISC-V, to show virtual memory
>> mappings that aids debugging.
>>
>> Rather than showing every valid PTE, the command compacts the
>> output by merging all contiguous physical address mappings into
>> one block and only shows the merged block mapping details.
>>
>> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
>> Acked-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
>> Reviewed-by: Palmer Dabbelt <palmer@sifive.com>
>>
>> ---
>>
>> Changes in v4:
>> - restore to v2, that does not print all harts's PTE, since we
>>   should switch to a cpu context via the 'cpu' command
>>
>> Changes in v3:
>> - print PTEs for all harts instead of just current hart
>>
>> Changes in v2:
>> - promote ppn to hwaddr when doing page table address calculation
>>
>>  hmp-commands-info.hx       |   2 +-
>>  target/riscv/Makefile.objs |   4 +
>>  target/riscv/monitor.c     | 229 +++++++++++++++++++++++++++++++++++++++++++++
>>  3 files changed, 234 insertions(+), 1 deletion(-)
>>  create mode 100644 target/riscv/monitor.c
>>
>
> Ping?
>
> What's the status of this patch?

This is in my patch queue (for-master on github).  I'm still a bit backed up on 
email, but when I get caught back up I'll send a PR.

