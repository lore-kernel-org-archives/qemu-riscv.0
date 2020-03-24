Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jGYzb-0005bx-OT
	for mharc-qemu-riscv@gnu.org; Mon, 23 Mar 2020 22:08:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40877)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bmeng.cn@gmail.com>) id 1jGYzZ-0005Zv-Cs
 for qemu-riscv@nongnu.org; Mon, 23 Mar 2020 22:08:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bmeng.cn@gmail.com>) id 1jGYzY-0007xx-FQ
 for qemu-riscv@nongnu.org; Mon, 23 Mar 2020 22:08:33 -0400
Received: from mail-yb1-xb43.google.com ([2607:f8b0:4864:20::b43]:38599)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bmeng.cn@gmail.com>)
 id 1jGYzW-0007vu-H5; Mon, 23 Mar 2020 22:08:30 -0400
Received: by mail-yb1-xb43.google.com with SMTP id 204so1067847ybw.5;
 Mon, 23 Mar 2020 19:08:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=D07qrjjFuBwOl5e6g/jqH6or0Hlbi+mHH4dHWH5fW80=;
 b=KFNQu6xaGBF9CGLFJEYiM0PiOLFTY3p1Fw8Dv5V7D11KTkFQ4KopFZvm+YKWgyUVtt
 5sLsAOR0001GwTK7kzjlePYFV4bP6X6qXIi5HeRu4JMwu11T8NcsfXCux/cJ3obN8PR6
 6f5r7d8qjs9ndDkJ8UVWlKkZMSnX2sPejpumKbOyiKA7Lry3ags4qkip0tiYbkHXbbVJ
 pKp87cbkONsinoZyIU76z5f6tnZwSLaZ9BoE0EYvXiSZsdoSDqqHB2UyifW7upm4pj7p
 Y4e7Xl3x/5GzheWTwO4cwuBhvQHN38lD8oIJuq4GrJmG+J/nBVPPVHc8smaVIVmaC9V7
 DdEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=D07qrjjFuBwOl5e6g/jqH6or0Hlbi+mHH4dHWH5fW80=;
 b=IZo9ndJzoAHq9qJUPC8SHMpwYw2yenzSkMScLJKdHpx/utLI5pFrhdWMqXF81puWXA
 I4w82YWBpu5KlrLFLdCjgiK9xrmiEaC+3JIlxFPXyTcnUwVbuM5mT6nlRIPYaX2DrJld
 arZVb/BgJlOn/wXBdG3C+422s3LPO23a5uzth0TnBAm5bip/nTYkvTFnFOeIvqwSSDpI
 a9/xzI0pX9G9rQ8eusDR7NhWskI2Rx61fEeGjo2zlvbZibgGlGk2gkT9Rw/Yd+0OKnFj
 TbjpuMrtOBvhZfxJml/zkpGEDgFkX/NflQIFqQcjAiD9QrIXuxoC64guZ7YRhYs/z1jO
 aVzg==
X-Gm-Message-State: ANhLgQ1MSVj5aY45m0adLNLbCRhBzhhfcV4tQOal6Xv5YVglQBurSDqa
 LS7f8nG8uEAd3AL2GgYj75FmoLKy8IY+vd7yrvE=
X-Google-Smtp-Source: ADFU+vs5RZ84/OUPi95ZvFtZRudyfY93HJgYzawnbYLYcSLfdZpX1gCS2vsKLK0Knj3TSM1kLdT87Iipei3L3WHtAdA=
X-Received: by 2002:a25:d646:: with SMTP id n67mr10230715ybg.65.1585015709623; 
 Mon, 23 Mar 2020 19:08:29 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1583530528.git.alistair.francis@wdc.com>
In-Reply-To: <cover.1583530528.git.alistair.francis@wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Tue, 24 Mar 2020 10:08:19 +0800
Message-ID: <CAEUhbmUHNLYoJutr3dg0hpEPehuzRD4r6eux1EStZxCknMst0w@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] hw/riscv: Add a serial property to sifive_u
To: Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Alistair Francis <alistair23@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::b43
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
X-List-Received-Date: Tue, 24 Mar 2020 02:08:34 -0000

Hi Palmer,

On Sat, Mar 7, 2020 at 5:45 AM Alistair Francis
<alistair.francis@wdc.com> wrote:
>
> At present the board serial number is hard-coded to 1, and passed
> to OTP model during initialization. Firmware (FSBL, U-Boot) uses
> the serial number to generate a unique MAC address for the on-chip
> ethernet controller. When multiple QEMU 'sifive_u' instances are
> created and connected to the same subnet, they all have the same
> MAC address hence it creates a unusable network.
>
> A new "serial" property is introduced to specify the board serial
> number. When not given, the default serial number 1 is used.
>

Could you please take this for v5.0.0?

Regards,
Bin

