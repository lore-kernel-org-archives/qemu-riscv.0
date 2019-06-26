Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hg2pe-0001sz-WD
	for mharc-qemu-riscv@gnu.org; Wed, 26 Jun 2019 03:59:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39692)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <palmer@dabbelt.com>) id 1hg2pc-0001rR-Ah
 for qemu-riscv@nongnu.org; Wed, 26 Jun 2019 03:59:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1hg2pb-0004qz-DH
 for qemu-riscv@nongnu.org; Wed, 26 Jun 2019 03:59:04 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:38097)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1hg2pb-0004qK-6G
 for qemu-riscv@nongnu.org; Wed, 26 Jun 2019 03:59:03 -0400
Received: by mail-pf1-f194.google.com with SMTP id y15so918202pfn.5
 for <qemu-riscv@nongnu.org>; Wed, 26 Jun 2019 00:59:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=XCH2GgsIyoksdNlCCC5x+ZCA7cM41Mob0pW7J+N8gKg=;
 b=PRwtTOZp3v8n+DPZPu5WCbl1kxgynWslvU5k9f/nDYr9BMitu61zXwSJwLP8xPY4nr
 taqt+dCAvdODfKRciNFR3I93ThaGf4qE0s4Pfv/Y52NplKbNZsbpw5Q0rladYfJQC27n
 4B1cA1Ws7nyKljJe8cnY/YIQllWrKplqMu1QIGfu+g1I4GXuvbMYY3AJIa1afj0M+Kg9
 AEnbkWCar8FTnRQ54+wqkEOwdaob0rsuTOUEQVHSyk/h0pEF8Dx+g0IdkeS0T26g3jc0
 4f0kaH4DO6MdDiBC1paf1FixlQ5MpWhjdmLBVR3kAmLs7v8Pt9WYZkUj1v7BCH9f1oOC
 6Tow==
X-Gm-Message-State: APjAAAU2HoIL7+IUYjhuRr+B6E+lRno/GXBuR3ITXGH9PgnwGa/IaNMe
 93Gl3Oz0EoJY4rzAXItYQBRNvA==
X-Google-Smtp-Source: APXvYqx3oKHjXknjr/YCF+5H/pL1JCQT/W8qrJ9xpIofBJNySturdcMWYdEyNvlWFwQ4ndG8XdINag==
X-Received: by 2002:a63:3683:: with SMTP id d125mr1679724pga.252.1561535941544; 
 Wed, 26 Jun 2019 00:59:01 -0700 (PDT)
Received: from localhost (220-132-236-182.HINET-IP.hinet.net.
 [220.132.236.182])
 by smtp.gmail.com with ESMTPSA id y185sm17147727pfy.110.2019.06.26.00.59.00
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 26 Jun 2019 00:59:01 -0700 (PDT)
Date: Wed, 26 Jun 2019 00:59:01 -0700 (PDT)
X-Google-Original-Date: Wed, 26 Jun 2019 00:58:10 PDT (-0700)
In-Reply-To: <CAEUhbmVjExqi9dbq2yuKC7mw1GczxY36AeUAwkQz2+Cc5KWnKA@mail.gmail.com>
CC: Alistair Francis <Alistair.Francis@wdc.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
From: Palmer Dabbelt <palmer@sifive.com>
To: bmeng.cn@gmail.com
Message-ID: <mhng-6c6f8a3b-57fd-4e1b-8626-6e544789ff44@palmer-si-x1e>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.210.194
Subject: Re: [Qemu-riscv] [PATCH 1/2] riscv: sifive_u: Do not create
 hard-coded phandles in DT
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
X-List-Received-Date: Wed, 26 Jun 2019 07:59:05 -0000

On Tue, 25 Jun 2019 18:47:15 PDT (-0700), bmeng.cn@gmail.com wrote:
> Hi,
>
> On Sat, May 18, 2019 at 5:34 AM Alistair Francis
> <Alistair.Francis@wdc.com> wrote:
>>
>> On Fri, 2019-05-17 at 08:51 -0700, Bin Meng wrote:
>> > At present the cpu, plic and ethclk nodes' phandles are hard-coded
>> > to 1/2/3 in DT. If we configure more than 1 cpu for the machine,
>> > all cpu nodes' phandles conflict with each other as they are all 1.
>> > Fix it by removing the hardcode.
>> >
>> > Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
>>
>> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
>>
>
> Can this go in the 4.1 PR?

Thanks, I must have dropped them.

