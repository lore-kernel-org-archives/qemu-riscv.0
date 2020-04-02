Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jJsZU-0005Wy-9Z
	for mharc-qemu-riscv@gnu.org; Thu, 02 Apr 2020 01:39:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39895)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bmeng.cn@gmail.com>) id 1jJsZP-0005Tw-Ln
 for qemu-riscv@nongnu.org; Thu, 02 Apr 2020 01:39:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bmeng.cn@gmail.com>) id 1jJsZO-0000c6-On
 for qemu-riscv@nongnu.org; Thu, 02 Apr 2020 01:39:15 -0400
Received: from mail-yb1-xb41.google.com ([2607:f8b0:4864:20::b41]:38477)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bmeng.cn@gmail.com>)
 id 1jJsZM-0000Y9-MS; Thu, 02 Apr 2020 01:39:12 -0400
Received: by mail-yb1-xb41.google.com with SMTP id 204so1449634ybw.5;
 Wed, 01 Apr 2020 22:39:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=t2EG+cIlPj5vy+M3PVYxO9zR6V+LgfrjP4Y2mgyuC2U=;
 b=oti2Drf4BvXVIrw4rFu52E5GNQT4/KXS1loSUroQ7Qg5olnS0sQB64MTqYzEJe5JtY
 eYxfE+ZDq4yXvmSpOZTiW6KhBn75I9uFzIGarzuwbYig5jQRreXaI6bjUTEl8C4DU7F5
 Tg4be6nxh4p+Bu6G1S6BK2QdsDzec2pPWH99j4WDKe5JymjxYtR8az5OlfzmsgiZOlmb
 T08rPgGUGoJHlqYG0cPO7UOPGzXL/UqSbYp5GcUDYZJ4BlAe+cyNUsJQZQszwhInHenq
 6VLlBT6PhMrNSnpyTVl1g6wWvPAmpbkPRv5mAAVUP8puFIDeCa/G7W4s7MnHNcCb35Wo
 7uhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=t2EG+cIlPj5vy+M3PVYxO9zR6V+LgfrjP4Y2mgyuC2U=;
 b=R/xangcacdH4UBRi7hLSdZd8SrToEe5uwQW+a7LkvpSKYZfohcgJ5mM/AHkYDR8g7X
 +4OulYM2YwFgL2lKPDEgdX/fCQPuvdmrEynXzAIxZO91FQRUZwqvqDKJw13PbEpga6DW
 b4gJ+1t4LhSknMrVUeb4iUjMwX4AoMnXj1rTdgJDqPiK1wlnwzUYn11b3b8a9VbYCYq8
 1cfZ+YuYGtCEfq45/Cpd5INq0G9ntKEM7c8S3pdjRcdv9f0V6P0QoNffeGUAAJIkPXpL
 vihm60ukQKmTCgmP96MuBSlSIOhyQhxH2lI5jkhyWp7qVaTNZw0oMTp8d8Qrlqr/T6i6
 tNhQ==
X-Gm-Message-State: AGi0PuZxpBqOruW7WmBPJ2Dodp3PVIKlrNWOnWNSAHQ/olo0MQUcdzp9
 5KPCtSkMOuoL48nc3L4J8/dTb56C1slNzUVeX+I=
X-Google-Smtp-Source: APiQypL6NRVjBDXPh8bQ/FWSlgjNoc9fkrA2/njOryJYnewMrKkINsj6/HvKF1a/Pp8Dyl86shzsDTbmxp7hGFHJf1k=
X-Received: by 2002:a25:ae8c:: with SMTP id b12mr2620036ybj.392.1585805951703; 
 Wed, 01 Apr 2020 22:39:11 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1583530528.git.alistair.francis@wdc.com>
 <CAEUhbmUHNLYoJutr3dg0hpEPehuzRD4r6eux1EStZxCknMst0w@mail.gmail.com>
In-Reply-To: <CAEUhbmUHNLYoJutr3dg0hpEPehuzRD4r6eux1EStZxCknMst0w@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 2 Apr 2020 13:39:00 +0800
Message-ID: <CAEUhbmWEEBJ67R=kktq=93a2h_ROA0C45Baj+Za73jg251W=WQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] hw/riscv: Add a serial property to sifive_u
To: Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Alistair Francis <alistair23@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::b41
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
X-List-Received-Date: Thu, 02 Apr 2020 05:39:18 -0000

On Tue, Mar 24, 2020 at 10:08 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> Hi Palmer,
>
> On Sat, Mar 7, 2020 at 5:45 AM Alistair Francis
> <alistair.francis@wdc.com> wrote:
> >
> > At present the board serial number is hard-coded to 1, and passed
> > to OTP model during initialization. Firmware (FSBL, U-Boot) uses
> > the serial number to generate a unique MAC address for the on-chip
> > ethernet controller. When multiple QEMU 'sifive_u' instances are
> > created and connected to the same subnet, they all have the same
> > MAC address hence it creates a unusable network.
> >
> > A new "serial" property is introduced to specify the board serial
> > number. When not given, the default serial number 1 is used.
> >
>
> Could you please take this for v5.0.0?

Ping?

