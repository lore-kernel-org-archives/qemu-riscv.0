Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1i0UYD-0002Rm-Tm
	for mharc-qemu-riscv@gnu.org; Wed, 21 Aug 2019 13:37:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42816)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmer@sifive.com>) id 1i0UY7-0002NH-MJ
 for qemu-riscv@nongnu.org; Wed, 21 Aug 2019 13:37:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@sifive.com>) id 1i0UY6-0008KF-8X
 for qemu-riscv@nongnu.org; Wed, 21 Aug 2019 13:37:31 -0400
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543]:38688)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@sifive.com>) id 1i0UY5-0008JU-Vb
 for qemu-riscv@nongnu.org; Wed, 21 Aug 2019 13:37:30 -0400
Received: by mail-pg1-x543.google.com with SMTP id e11so1712308pga.5
 for <qemu-riscv@nongnu.org>; Wed, 21 Aug 2019 10:37:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=ibQloZmh6YxJr73VWUAfF1EqB9nKWMbL7i3yL4R/AWU=;
 b=JWSZjV5eAjjWtiQkC7s/tLEIQCdk4ix0cV37v1q7tYPil/geow3qER23Ma8H2iJPhH
 SRyq+lsSaV51pZg8NGaA2Vy3QwE1FsZ+4XdUAxQW3hhbJTR2gql2IEzbLVbFRK6hFItT
 zHnBlojdFbLp8lDlZFhxHmXkCozzSmM1I+AGVnZAnayZm1C59YCvq472re4TViUjzjtv
 5WeZeafnpsj9R3tYqIgYg0ThzekcD5DvFdmGleRY8jRZgZMN02eVldZ9vdviFqA8whf2
 Rzkr/10bOu+RrTBPwh1g9tto72EAqFK0Im54mkVUsQzXpokifHCkmYSUJNji68HsLJAd
 VJzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=ibQloZmh6YxJr73VWUAfF1EqB9nKWMbL7i3yL4R/AWU=;
 b=kf1OmPCVzL1agv25VMpif0DXuZ4YXXFj1wT9tDoAk7zj8HIkBAGU5RBPVtMN6ydOPV
 /9uW6HnZCXvPQHSWa1kRw4CU9Nvz3g4/umR72l62FYsQwdUsKvS7Ew52F0gJc4xTW5qb
 uNpV3+EiwrBRAWTM9rRiOh2772nVs/BkzrGUiEFYUYX+lPHUCSKFVg7Ju4iiO1q1Yreo
 OLbsiObU+REkcDfjmoi0n9nyhty8IzrV0lRVW1z+65vOsL6gK3IYJ7qCdqThCLg62oqA
 NxJEHZuSgO/Qm89EsQB9t3Epx3qh4jjK8koL6A/zH6IZafcIPvKf5yjTmSUHZK1i7gdn
 Bh0A==
X-Gm-Message-State: APjAAAXh/rdH6wvA639gnHJn9hQLvq5tYxnxGANsK8jGixqnAgQdNCFC
 xTKIS2ZabRoLSTUt+mPoJ8D4bD8NdlmyZA==
X-Google-Smtp-Source: APXvYqwf/xMNskUEIUVx70oZ+FBwfd5+wWBwXXauBsisK2cuw+YuPX+92vJ9WYZ+R8jQb44GToEPAg==
X-Received: by 2002:a17:90a:ae15:: with SMTP id
 t21mr1142164pjq.50.1566409047857; 
 Wed, 21 Aug 2019 10:37:27 -0700 (PDT)
Received: from localhost (wsip-184-188-36-2.sd.sd.cox.net. [184.188.36.2])
 by smtp.gmail.com with ESMTPSA id n7sm26281704pff.59.2019.08.21.10.37.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Aug 2019 10:37:26 -0700 (PDT)
Date: Wed, 21 Aug 2019 10:37:26 -0700 (PDT)
X-Google-Original-Date: Wed, 21 Aug 2019 10:36:42 PDT (-0700)
In-Reply-To: <CANnJOVHdcb2wuTZ9U5ziJsuPVin8pae9gUZjh=VH5WJ_5Yn+rw@mail.gmail.com>
CC: qemu-riscv@nongnu.org, bmeng.cn@gmail.com, alistair23@gmail.com,
 sagark@eecs.berkeley.edu, Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 qemu-devel@nongnu.org, Alistair Francis <Alistair.Francis@wdc.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: jonathan@fintelia.io
Message-ID: <mhng-4545b3da-b9ba-4fa2-91e8-b0d7e66329d8@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::543
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH v2] target/riscv: Hardwire
 mcounter.TM and upper bits of [m|s]counteren
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
X-List-Received-Date: Wed, 21 Aug 2019 17:37:33 -0000

On Wed, 14 Aug 2019 20:19:39 PDT (-0700), jonathan@fintelia.io wrote:
> Ping! What is the status of this patch?

Sorry, I must have lost track of it.  I've added it to my patch queue.

>
> On Wed, Jul 3, 2019 at 2:02 PM Jonathan Behrens <jonathan@fintelia.io>
> wrote:
>
>> Bin, that proposal proved to be somewhat more controversial than I was
>> expecting, since it was different than how currently available hardware
>> worked. This option seemed much more likely to be accepted in the short
>> term.
>>
>> Jonathan
>>
>> On Mon, Jul 1, 2019 at 9:26 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>>
>>> On Tue, Jul 2, 2019 at 8:20 AM Alistair Francis <alistair23@gmail.com>
>>> wrote:
>>> >
>>> > On Mon, Jul 1, 2019 at 8:56 AM <jonathan@fintelia.io> wrote:
>>> > >
>>> > > From: Jonathan Behrens <jonathan@fintelia.io>
>>> > >
>>> > > QEMU currently always triggers an illegal instruction exception when
>>> > > code attempts to read the time CSR. This is valid behavor, but only if
>>> > > the TM bit in mcounteren is hardwired to zero. This change also
>>> > > corrects mcounteren and scounteren CSRs to be 32-bits on both 32-bit
>>> > > and 64-bit targets.
>>> > >
>>> > > Signed-off-by: Jonathan Behrens <jonathan@fintelia.io>
>>> >
>>> > Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
>>> >
>>>
>>> I am a little bit lost here. I think we agreed to allow directly read
>>> to time CSR when mcounteren.TM is set, no?
>>>
>>> Regards,
>>> Bin
>>>
>>

