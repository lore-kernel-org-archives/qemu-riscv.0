Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iXyqU-0000WH-DD
	for mharc-qemu-riscv@gnu.org; Thu, 21 Nov 2019 21:38:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50605)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmerdabbelt@google.com>) id 1iXyqS-0000W5-Sh
 for qemu-riscv@nongnu.org; Thu, 21 Nov 2019 21:38:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmerdabbelt@google.com>) id 1iXyqR-0006GH-Li
 for qemu-riscv@nongnu.org; Thu, 21 Nov 2019 21:38:52 -0500
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:39492)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmerdabbelt@google.com>)
 id 1iXyqR-0006Fu-Gp
 for qemu-riscv@nongnu.org; Thu, 21 Nov 2019 21:38:51 -0500
Received: by mail-pg1-x541.google.com with SMTP id b137so309879pga.6
 for <qemu-riscv@nongnu.org>; Thu, 21 Nov 2019 18:38:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=jbn83bUftGc+2g8sczxL72tqKHzM4oLYdHruB05Msz4=;
 b=FNOoxgghtOTqEw2oJ2ZCCdJ3AEwldSEBpCHa05p0qvc7s7JMwX8UsROVuM9GTdFukd
 rRb34eGuzk97MzehAHo5XgFZcMm4lfGGg5cuKP+aAlYbdAvgZi08ZUX2VUbKH8hjyVwh
 B9qi2HJQPBVEqdEzv2auCbIx/0oTdGcm8SrJkuiYjfwisEh23Mru5iXBteD/rSC3r1Fv
 //GjcBcKpSwN2KSly7O7U/qXcCayAoW7sBcE6gJ3s2IJDjc13l7nREX3gTriReIGvvjK
 qFcJ15PhsgMrkXSYdT3vmH9ZgFkkMrgHX258FtGY9HRjI5SB8opDk1srWQv/FpFC1dEH
 y5vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=jbn83bUftGc+2g8sczxL72tqKHzM4oLYdHruB05Msz4=;
 b=OQW11B4YVlLqxZ4v+qIejq7gQjo48vGY0bOOdkd4xJGOQcms2F5xCTrc0cu2REA+/L
 N8Gdnevo/nUcB/mTCt7v3xOHVOJh+g4TYwE5cRrqDdS+vorJqlLdsAeNWLaXsoc9gTiQ
 qmJ594776K8e5icqrt4/wKUOpPvo1ODZOFt2jxw+a0dY7ro9H61Z+Xs3LdiNg4WjwuVA
 v92rzFdJT9mOTxHQiN2g7csYjeY+6PrjG+zwvBCqyTYCMAsqZOLI29UGZKv61tsqnzcI
 4L0DDlvwuEdt2/lr4BIo23gcfePEroY7LVAmHI6lPtjqn3MAS4CWFEo2qHzDvxHJmsgo
 lujA==
X-Gm-Message-State: APjAAAXcSA2WmHyr/x8JVpcEX0eQSgrZHmwwOOFj2hIkpyoncLZtiooO
 ugzu62/KyalXz0ECnTk+wZftHg==
X-Google-Smtp-Source: APXvYqzxNJeu5wHQiHTTnQaLj+mojMHHkJ+5Equ7rqdqGjxa8deQid5nCJ+diZWyhGWQVSJmTGXlIQ==
X-Received: by 2002:a65:47c1:: with SMTP id f1mr12823367pgs.393.1574390329340; 
 Thu, 21 Nov 2019 18:38:49 -0800 (PST)
Received: from localhost ([2620:15c:211:200:12cb:e51e:cbf0:6e3f])
 by smtp.gmail.com with ESMTPSA id r22sm5275105pfg.54.2019.11.21.18.38.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Nov 2019 18:38:48 -0800 (PST)
Date: Thu, 21 Nov 2019 18:38:48 -0800 (PST)
X-Google-Original-Date: Thu, 21 Nov 2019 18:18:47 PST (-0800)
Subject: Re: [PATCH] riscv: sifive_u: Add a "serial" property for board serial
 number
In-Reply-To: <CAEUhbmUuCOzd_Y6ip_oh13gt83rM8EffdXWRCa=KybOjAvEN-A@mail.gmail.com>
CC: Alistair Francis <Alistair.Francis@wdc.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, sagark@eecs.berkeley.edu,
 qemu-devel@nongnu.org, qemu-riscv@nongnu.org
From: Palmer Dabbelt <palmerdabbelt@google.com>
To: bmeng.cn@gmail.com
Message-ID: <mhng-b2e05f4a-7c3d-4be1-a843-a19b4054760a@palmerdabbelt.mtv.corp.google.com>
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
X-List-Received-Date: Fri, 22 Nov 2019 02:38:53 -0000

On Thu, 21 Nov 2019 17:10:18 PST (-0800), bmeng.cn@gmail.com wrote:
> On Sat, Nov 16, 2019 at 11:08 PM Bin Meng <bmeng.cn@gmail.com> wrote:
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
>> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
>> ---
>>
>>  hw/riscv/sifive_u.c         | 21 ++++++++++++++++++++-
>>  include/hw/riscv/sifive_u.h |  1 +
>>  2 files changed, 21 insertions(+), 1 deletion(-)
>>
>
> ping?

Sorry, it looks like I dropped this one.  I've put it in the queue for 5.0,
with a 

Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>

Thanks!

