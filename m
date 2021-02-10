Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l9vrz-0002c0-8g
	for mharc-qemu-riscv@gnu.org; Wed, 10 Feb 2021 15:13:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1l9vry-0002b1-C2; Wed, 10 Feb 2021 15:13:50 -0500
Received: from mail-il1-x130.google.com ([2607:f8b0:4864:20::130]:45317)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1l9vrw-0006Ra-1a; Wed, 10 Feb 2021 15:13:50 -0500
Received: by mail-il1-x130.google.com with SMTP id w1so1889450ilm.12;
 Wed, 10 Feb 2021 12:13:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=49nHISXzKLSeXZgn/rBI3XeJM0gg35JQBCQmXySPVo0=;
 b=uBKiHFsPmLbTeyVWWArpUkWqm2yDA9JvkqS5TQCYxGRxmyjXr+4iorDOWGHbx+aKhK
 XcjVfUDm/iJMXqDEx35MEXqmBc4NQqn9/cc+71tG/Punf1pWSP0n5w3YwKSmSPjpXnU4
 PLPQhvw8hJMmWgy+pk9N8nvNXN8E+u6j/78aGMNs4JkM8kSYm6eQ80DFUTNzXz8Xpxhh
 y2ou5SF6V8j2DRojl08qFJF1sOqxOJ+fHKSFzv5gYrKoo9XYFacWs3I7OP/pn57WjxXJ
 tupn6UAoqWtA8VBHyHjXym3ceYX0BMVDwmXAczet1Nst17mD80BN6VBze76xwuK/nNnk
 Ntsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=49nHISXzKLSeXZgn/rBI3XeJM0gg35JQBCQmXySPVo0=;
 b=V/lnB3iVmXMtjWOQ0NtliImiRmQO5dYrfLxQvjkDOHlZx7JFfBfqZTDrMfLX5wH+s+
 gA4Ygqcw/HohGE8mKT2hUaLZcZhererul7fjxHG4PPPlhHQcDnVJy0M3CmUSyW4/3jVN
 yXVNjxCCUxZ0qz1E3h84P1VNCibQRCCNgQ4EmTZEKVn6fYqRel47FpSvZw8ddXX3jtND
 8ggXzmxOt2J/ljlGvmjClxe+/sWrVFkYqhuynk4i2VwkWh0MlhEosqUTYk4p/x4XJKba
 FtrauYUAcHAAVfa+7pvajZOW9yg50K3Hqnf0mM/qrai2yVZhNGzceut+5xyOJBgbh18K
 /8vQ==
X-Gm-Message-State: AOAM532WbyQR+UTZE1rwr+Z1weByX9Hmy3WHEtqBPQIcRzeoIQ5BE3V+
 2E70kZNWPKWa5wLW2PugKk3fieRvc8mjBkPWZKk=
X-Google-Smtp-Source: ABdhPJxH97Egeznid1iFK7nOvdc6CSRrNa9cssdRlLjV1mkpKeNR8DQl3IIvxO3QilaFOrVAHW3CCEEzMcrngFAPREk=
X-Received: by 2002:a05:6e02:20e5:: with SMTP id
 q5mr2524743ilv.131.1612988026498; 
 Wed, 10 Feb 2021 12:13:46 -0800 (PST)
MIME-Version: 1.0
References: <SG2PR02MB26340A07DB8609F72486202C93450@SG2PR02MB2634.apcprd02.prod.outlook.com>
In-Reply-To: <SG2PR02MB26340A07DB8609F72486202C93450@SG2PR02MB2634.apcprd02.prod.outlook.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 10 Feb 2021 12:13:11 -0800
Message-ID: <CAKmqyKM230JKH4DddGZCmFaPRC-jGufduSDw+KidgqOmA9YpGA@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] riscv: Add enhanced PMP support
To: Hou Weiying <weiying_hou@outlook.com>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::130;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x130.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
X-List-Received-Date: Wed, 10 Feb 2021 20:13:50 -0000

On Mon, Aug 10, 2020 at 5:23 PM Hou Weiying <weiying_hou@outlook.com> wrote:
>
> v1 -> v2 :
> * regenerate this patch based on the latest upstream
>
> Hou Weiying (4):
>   Define ePMP mseccfg
>   Implementation of enhanced PMP(ePMP) support
>   Add ePMP CSR accesses
>   Add a config option for ePMP.

Thanks for the patches.

Sorry again it has taken so long to get to. I kept hoping that next
week the CSRs would be reserved, but it still hasn't happened.

I have rebased all of the patches and fixed the compile issues. If you
want to pick these up feel free to, otherwise I'll send out the
rebased versions and work on getting them merged.

Alistair

>
>  target/riscv/cpu.c        |   9 ++
>  target/riscv/cpu.h        |   3 +
>  target/riscv/cpu_bits.h   |   3 +
>  target/riscv/csr.c        |  18 ++++
>  target/riscv/gdbstub.c    |   2 +
>  target/riscv/pmp.c        | 174 +++++++++++++++++++++++++++++++++++---
>  target/riscv/pmp.h        |  12 +++
>  target/riscv/trace-events |   4 +
>  8 files changed, 213 insertions(+), 12 deletions(-)
>
> --
> 2.20.1
>
>

