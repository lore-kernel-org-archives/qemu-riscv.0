Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iD44F-0003vu-S3
	for mharc-qemu-riscv@gnu.org; Wed, 25 Sep 2019 05:58:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36948)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bmeng.cn@gmail.com>) id 1iD44D-0003u2-5P
 for qemu-riscv@nongnu.org; Wed, 25 Sep 2019 05:58:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bmeng.cn@gmail.com>) id 1iD44C-0008TV-7X
 for qemu-riscv@nongnu.org; Wed, 25 Sep 2019 05:58:37 -0400
Received: from mail-yw1-xc41.google.com ([2607:f8b0:4864:20::c41]:42535)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bmeng.cn@gmail.com>)
 id 1iD449-0008Rg-SC; Wed, 25 Sep 2019 05:58:34 -0400
Received: by mail-yw1-xc41.google.com with SMTP id i207so1778482ywc.9;
 Wed, 25 Sep 2019 02:58:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8jNHHqTNXkqX0eXwTVH5nEoQRCcUSRmsudoY9Aq7OdE=;
 b=QN4Mu7G0MZ9Xj5nFz7BtCKzBRB6Y82ADE43Nea1qqG4mT6vkD/bdvbZNbDD+l5/Wsa
 e4tw/GinEEnX72V3qfiR6gWf0TztZIjKEVqc0tjO3Z1lA8SAXu0C23v7hfbLtuC4+jqb
 9ZBYONkAz7jY/LSAdpjax20l0jzdKreELdeLYkvzH87cF3AO3ieULwTbR5ao8EhOP+nG
 eT8IqHVMTpweECxRjfBSan0oom4o2nh2eM/7x5tXNUCAeAH2T1RhOmzvUNqhTZAJxGOk
 kvCDy+KNGHor3Tt/Jq9T/hHabHzdInqS0Qn7i0KPD0SGEaCB2bAIm5F8eLph2ZnIrqge
 SeWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8jNHHqTNXkqX0eXwTVH5nEoQRCcUSRmsudoY9Aq7OdE=;
 b=oBjxGTCjia5wjHS6jmuvCKtQFJvKZCPpv5vjFJwOI6pfBighHF6hs624syUuqsrOzz
 7cEnIyrVS6KbTafkO5wsr6SFIi1JHMYWYiuED8MQfOs0EdlOHTlvzJKilvdgqGoNBNUV
 fOYegjNUnFqF5kk3nks6gfsP7uMlvYYQrqJz6INBiFJanLPwhAP/XHI+xZlix7LqIzQp
 +JUIjPyWYIwcm+EUBVu6cbFpXFPv1eMuQi78eolylUBbNJs64GgA1yYb88sgSy7mzBNy
 FZ/pwoe/w8AUB1OQJ538mq8mA47xvW5DAnK56y1hzMJEYEXpqXYHBbIyttfX2/3tYmpM
 TrAQ==
X-Gm-Message-State: APjAAAVJTJOpAZ76dYCyLMriR0p8yCYRY197BJNOKlLuv45pwzo+8n9F
 rR744ac7fwE0nQgMA7BpkyKvCgk2OrNrB8H8DjI=
X-Google-Smtp-Source: APXvYqyRekIQ5A1TJXe5qzHxBO04a6IszwOixMsJyV4X2WCUD7xPcNMpz1j3uZZYbJF2/gMq7FJlMol9032wz2VRX7I=
X-Received: by 2002:a0d:ca03:: with SMTP id m3mr4923560ywd.209.1569405513177; 
 Wed, 25 Sep 2019 02:58:33 -0700 (PDT)
MIME-Version: 1.0
References: <1569403262-23523-1-git-send-email-guoren@kernel.org>
In-Reply-To: <1569403262-23523-1-git-send-email-guoren@kernel.org>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 25 Sep 2019 17:58:21 +0800
Message-ID: <CAEUhbmUb=KOBje_X_hnmHz9LFDLyE+eb7iJhGkns2WMAsBRCpQ@mail.gmail.com>
Subject: Re: [PATCH V4] target/riscv: Ignore reserved bits in PTE for RV64
To: guoren@kernel.org
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Alistair Francis <alistair.francis@wdc.com>, Palmer Dabbelt <palmer@sifive.com>,
 Alistair Francis <alistair23@gmail.com>, Guo Ren <ren_guo@c-sky.com>
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Wed, 25 Sep 2019 09:58:38 -0000

On Wed, Sep 25, 2019 at 5:21 PM <guoren@kernel.org> wrote:
>
> From: Guo Ren <ren_guo@c-sky.com>
>
> Highest 10 bits of PTE are reserved in riscv-privileged, ref: [1], so we
> need to ignore them. They cannot be a part of ppn.
>
> 1: The RISC-V Instruction Set Manual, Volume II: Privileged Architecture
>    4.4 Sv39: Page-Based 39-bit Virtual-Memory System
>    4.5 Sv48: Page-Based 48-bit Virtual-Memory System
>
> Signed-off-by: Guo Ren <ren_guo@c-sky.com>
> Reviewed-by: Liu Zhiwei <zhiwei_liu@c-sky.com>
> ---
>  target/riscv/cpu_bits.h   | 7 +++++++
>  target/riscv/cpu_helper.c | 2 +-
>  2 files changed, 8 insertions(+), 1 deletion(-)
>
> Changelog V4:
>  - Change title to Ignore not Bugfix
>  - Use PTE_PPN_MASK for RV32 and RV64
>
> Changelog V3:
>  - Use UUL define for PTE_RESERVED
>  - Keep ppn >> PTE_PPN_SHIFT
>
> Changelog V2:
>  - Bugfix pte destroyed cause boot fail
>  - Change to AND with a mask instead of shifting both directions
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Tested-by: Bin Meng <bmeng.cn@gmail.com>

