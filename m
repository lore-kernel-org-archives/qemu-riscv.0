Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jL5KB-0004Px-He
	for mharc-qemu-riscv@gnu.org; Sun, 05 Apr 2020 09:28:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55451)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bmeng.cn@gmail.com>) id 1jL5K9-0004Nn-GU
 for qemu-riscv@nongnu.org; Sun, 05 Apr 2020 09:28:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bmeng.cn@gmail.com>) id 1jL5K8-0003C7-MY
 for qemu-riscv@nongnu.org; Sun, 05 Apr 2020 09:28:29 -0400
Received: from mail-yb1-xb41.google.com ([2607:f8b0:4864:20::b41]:45711)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bmeng.cn@gmail.com>)
 id 1jL5K7-0003AC-0o; Sun, 05 Apr 2020 09:28:27 -0400
Received: by mail-yb1-xb41.google.com with SMTP id g6so7186149ybh.12;
 Sun, 05 Apr 2020 06:28:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PwrT+6SQswYhhhEhIMm1owyMKlltlTcdgDGebqx19z0=;
 b=Ffl4gJmo5fCLTXWmHAMuyA1Y9iu5K9ebq5HYcIn1CrVQMY9WW72leXCs8u3pATmMRm
 3IdahiLH+LsFoT8w7jGMsCPT681FLdqsM8tXTOCVgXP9UMNIe/CsHmXfQ15f1dU1pkZF
 n6sha3cc4IbOBdgMxXe9HwgoJFJgTPWg8Mbuzpap+5HJ4GygxBVyMX/0XvwaXjHnQrcy
 6N9hOH7jmmArLNhBsuYx8sWEt/90zvjZjp9mc1CdNwOxWl3IyhTQZ/2CShcuhORQIdb8
 EhZ5nci/F3maMKs8tVIZTzIbJBoeFlo7CShhNRb1cZzaGfN+SvJOaSEXdHG+hDjCNrOk
 LoOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PwrT+6SQswYhhhEhIMm1owyMKlltlTcdgDGebqx19z0=;
 b=iXMRzt4+kzLABENn7jD9Bd6l/fm7W67gFjjL5F2jg/JsJYRQ+jixB+2IXI3sdqDcn5
 l7FJWNgdwvrldTz4mNs5OzT/CXOIqZ+UDvQJKvUCTlly7R+otvPTf7GGQSdeQAV4RcwS
 8Fc7XVEcXnZ08c7BItMaWm+bvEZdKd8pLTBtbVDHCIrDqhYLc0buvoqJz5Id+GwMlCJd
 GwgfT/XEbsgXmVTvrY0WbAiBcbMtyaKQoAHZIcjqNXlNeH7Xpy97D9xbkOImC5L8M4WB
 jB15UROaPWb2RA2apwLfzayIdOyao1+mK1O7diE5OMNe/E2XwHm18Lzlt40QBbWqwcgT
 2Vvg==
X-Gm-Message-State: AGi0PuaZvdmg0D4Q1brpdEj04hsI6n2USd4+SSUrIrhRhaKRO9MJo2I3
 EPPQYfOPIPyMwtlgOfR0heRruiOk4woKDeaOxfc=
X-Google-Smtp-Source: APiQypLuzWynkdC5itnLxnqcstt8DXo7Csg0mzc8oHtdTMVv1Jfvg8oBnJPBGP2KcG4FxFobRRP2srm88Pk6bkTs5Kc=
X-Received: by 2002:a25:d646:: with SMTP id n67mr26034326ybg.65.1586093305131; 
 Sun, 05 Apr 2020 06:28:25 -0700 (PDT)
MIME-Version: 1.0
References: <1583585319-26603-1-git-send-email-bmeng.cn@gmail.com>
 <CAKmqyKPEptmsw222Tt1T1qvoSvfhgMMznypEM+wr8hWYkcW0qg@mail.gmail.com>
In-Reply-To: <CAKmqyKPEptmsw222Tt1T1qvoSvfhgMMznypEM+wr8hWYkcW0qg@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Sun, 5 Apr 2020 21:28:13 +0800
Message-ID: <CAEUhbmU+w___MiNS7kCd-b9C4rKz_OMUCMFFeroo9ew5bayYrw@mail.gmail.com>
Subject: Re: [PATCH] hw/riscv: Generate correct "mmu-type" for 32-bit machines
To: Alistair Francis <alistair23@gmail.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Palmer Dabbelt <palmerdabbelt@google.com>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
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
X-List-Received-Date: Sun, 05 Apr 2020 13:28:30 -0000

Hi Palmer,

On Tue, Mar 10, 2020 at 1:22 AM Alistair Francis <alistair23@gmail.com> wrote:
>
> On Sat, Mar 7, 2020 at 4:49 AM Bin Meng <bmeng.cn@gmail.com> wrote:
> >
> > 32-bit machine should have its CPU's "mmu-type" set to "riscv,sv32".
> >
> > Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
>

Ping? Could you please take this for v5.0.0?

Regards,
Bin

