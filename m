Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iDl8C-0006um-A1
	for mharc-qemu-riscv@gnu.org; Fri, 27 Sep 2019 03:57:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40539)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bmeng.cn@gmail.com>) id 1iDl87-0006pc-VM
 for qemu-riscv@nongnu.org; Fri, 27 Sep 2019 03:57:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bmeng.cn@gmail.com>) id 1iDl86-0001XB-Sm
 for qemu-riscv@nongnu.org; Fri, 27 Sep 2019 03:57:31 -0400
Received: from mail-yw1-xc41.google.com ([2607:f8b0:4864:20::c41]:37588)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bmeng.cn@gmail.com>)
 id 1iDl83-0001UT-Fl; Fri, 27 Sep 2019 03:57:27 -0400
Received: by mail-yw1-xc41.google.com with SMTP id u65so612176ywe.4;
 Fri, 27 Sep 2019 00:57:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=1ulQVMgYqQD3VaW5xilM4PVnmRiBHUelaeuS5oMSLX0=;
 b=n95unHRPEwRZt18MgpwZS9rBRyukXnIsMRVVPreEB5lRwXWguv6DmC3exeFBOYHkZq
 JO/zqkjaAms+gbXiKJJWlIPq8aq+OXhqk+ECEq5LLn4H48j0/MtGTkq9nGhzxjY+bB+U
 JP79GIRLiCw/Rlg47R7WQ2ni8IqIm2/BMmZFMR+NETpdznRcC7EIp9xbhKPiDk2aSWty
 2Kpbi8fU7AqAMtafiFw7RbqIHfyw+V8yNFqGkUXURGcurJ7w/C0f1+xoE+X4PK6KosK+
 PVOSTJDhyQP0EikymqSP1zXuqLS0scoGHF53HXG7Q/J+bp3lg3fAUSteT66aNsA7qheF
 UN1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=1ulQVMgYqQD3VaW5xilM4PVnmRiBHUelaeuS5oMSLX0=;
 b=nAcm4SQ8ql1LwhAJHc+xWEnTrc80b8+Bi7LJIG3MCxoGVOIX1PjrtaJvxnrLvgaWjF
 EKuYmkKQTJu0Qa8TVL6DKoriCDHzQBIetoth5ghu2432ZEAL+vPaK6tw7XnZdKNXZ79y
 eYaEfP30+dh6Fc8F9SYDj3DtSnu0SoD1lAVNlw9iN+lp8CNI354Ww+VuzXv9hoQwNwQ5
 IKg5LVzqv8a4hKOpHmuSqaYQx5ZrpV66ApfSilsVk08qGIaLKcJQYrib078I4sEglI9h
 vL6JDtUyJC73wNke09Tt94DS8KheumMqv130FQ5JBmeQxYGMJYgpUQSgEZWFNm1bFxxD
 enYA==
X-Gm-Message-State: APjAAAUAv8OQDQfjtJ4d5NA57iAnn1EpMQGrh7/zHxUbstxWZRXYQ2vt
 niwAiwYkvuVnrF5SVF5sekMyBab7/eCt6OHqEOq7eQ==
X-Google-Smtp-Source: APXvYqzyfhzOfFZYeZFjY1S93cvU4SlqKwxdIAeJh4d8ZQdziO53ND99dxIv+Kblp5owksWhmH97+lG74yAufyWiraw=
X-Received: by 2002:a81:a401:: with SMTP id b1mr1605778ywh.280.1569571047134; 
 Fri, 27 Sep 2019 00:57:27 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1569545046.git.alistair.francis@wdc.com>
 <c02135a1838ad7b289774b03989424a7a40b38d3.1569545046.git.alistair.francis@wdc.com>
In-Reply-To: <c02135a1838ad7b289774b03989424a7a40b38d3.1569545046.git.alistair.francis@wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 27 Sep 2019 15:57:14 +0800
Message-ID: <CAEUhbmUjgw-n6TiUR=P=2Af7rphLiB87yw_vEPs_Oto6Mi9-yg@mail.gmail.com>
Subject: Re: [PATCH v2 7/7] riscv/virt: Jump to pflash if specified
To: Alistair Francis <alistair.francis@wdc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Alistair Francis <alistair23@gmail.com>, Palmer Dabbelt <palmer@sifive.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::c41
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
X-List-Received-Date: Fri, 27 Sep 2019 07:57:34 -0000

On Fri, Sep 27, 2019 at 8:57 AM Alistair Francis
<alistair.francis@wdc.com> wrote:
>
> If the user supplied pflash to QEMU then change the reset code to jump
> to the pflash base address instead of the DRAM base address.
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  hw/riscv/virt.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
>

Tested-by: Bin Meng <bmeng.cn@gmail.com>

