Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1huIA3-0004B1-1u
	for mharc-qemu-riscv@gnu.org; Sun, 04 Aug 2019 11:11:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42810)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <bmeng.cn@gmail.com>) id 1huIA1-00048e-4B
 for qemu-riscv@nongnu.org; Sun, 04 Aug 2019 11:11:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bmeng.cn@gmail.com>) id 1huIA0-0000r1-9z
 for qemu-riscv@nongnu.org; Sun, 04 Aug 2019 11:11:01 -0400
Received: from mail-ed1-x541.google.com ([2a00:1450:4864:20::541]:44374)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bmeng.cn@gmail.com>)
 id 1huI9y-0000kH-Ef; Sun, 04 Aug 2019 11:10:58 -0400
Received: by mail-ed1-x541.google.com with SMTP id k8so76420766edr.11;
 Sun, 04 Aug 2019 08:10:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=nOS9iswkNotfLLJSaMbhLv7M6KMuqYvTOhv/iXXrnz0=;
 b=kzB+qLHx/u2OrVh76iAGIdWknXcHBr2v7lpCaSWYIi9bJMlt1/gNr3Dfg20cKyR3v/
 /WXkP0kRzVq0G4tFpB49cpL4/7qTgVq1SrCQTTPE57hE5vsgy5EEmedbxahlPsNKxEto
 JEQLbqUEkMFyWD3l7tJ4WX12J/Sng61mxGK6/oUHbPVkpeP0ihh9yNbolJLC/kd4PtZT
 KkLpmukShgT7MVmXoeuqNVV6u/xWwoISe/mTDVseniV3KtuWzM95TyCcXoMyS9PSEid2
 V0/f7FxO0We64mFX9PugaH0ouR0QlpYjSxgNcME9kwe6Y2IjPyr84CD4h+GooQK+pOUh
 b0fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=nOS9iswkNotfLLJSaMbhLv7M6KMuqYvTOhv/iXXrnz0=;
 b=Df9RH2xm5Uw4x5IiJYkzzYWPZZAZaXFwWNWd2AJ6Y2wwRBivG5sWYBHafD41LSejmx
 WC0AjbyT+EeE8pnCEw9GFJ+gmxgkvnV9vue+amMMv7jIVx7sEcw/WFnbGnhEoMOrVggD
 lE2n9PoelcIB7Qxq72at5dSR4DR8+4cKiu9EHCAnrdChqRiq9P87AqVrQVy5T5r87ccQ
 8n9jXn2Fcn50uEyuQ4rH3kHIeJ+8hehUkOph5xRI61fpISiYFPf0sALW9D5rnS7pHQlU
 was1CSa0JFT0V3RF9h37he3bsqjJkMibT++SUP1mh+C9QfQjJW82LonCE2OBZqU4gUce
 I8vQ==
X-Gm-Message-State: APjAAAXW19+3DKNICxx1eavRkFMI/HveRz9EBBzqR/6/YwrjOo9rMbze
 yyzkDt3lSbnL5ijTDhKnWcDlKfixyMV0xIf1+GY=
X-Google-Smtp-Source: APXvYqx4l0ftnE5U7rNn7QGdgv3IhK4/L1UDqtzn/MuKaGhoS0r55Wit5Z1E449krzgXXVmOR4ZAQwu5AG2ipls6KB0=
X-Received: by 2002:a50:ad0c:: with SMTP id y12mr126756572edc.25.1564931456878; 
 Sun, 04 Aug 2019 08:10:56 -0700 (PDT)
MIME-Version: 1.0
References: <1564812484-20385-1-git-send-email-bmeng.cn@gmail.com>
In-Reply-To: <1564812484-20385-1-git-send-email-bmeng.cn@gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Sun, 4 Aug 2019 23:10:46 +0800
Message-ID: <CAEUhbmVh4t-7CKZzX_2xhnttDm43Oa03M0oJL2-TrcHzDfjkSA@mail.gmail.com>
To: Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@sifive.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::541
Subject: Re: [Qemu-riscv] [FOR 4.1 PATCH] riscv: roms: Fix make rules for
 building sifive_u bios
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
X-List-Received-Date: Sun, 04 Aug 2019 15:11:02 -0000

Hi Alistair/Palmer,

On Sat, Aug 3, 2019 at 2:08 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> Currently the make rules are wrongly using qemu/virt opensbi image
> for sifive_u machine. Correct it.
>
> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
>
> ---
>
>  roms/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>

Would you please look at this patch? This should be in 4.1.

Regards,
Bin

