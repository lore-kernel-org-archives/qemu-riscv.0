Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1i0ypM-0004cH-IQ
	for mharc-qemu-riscv@gnu.org; Thu, 22 Aug 2019 21:57:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54566)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bmeng.cn@gmail.com>) id 1i0ypJ-0004Wz-Sp
 for qemu-riscv@nongnu.org; Thu, 22 Aug 2019 21:57:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bmeng.cn@gmail.com>) id 1i0ypJ-00047Z-0w
 for qemu-riscv@nongnu.org; Thu, 22 Aug 2019 21:57:17 -0400
Received: from mail-ed1-x543.google.com ([2a00:1450:4864:20::543]:37652)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bmeng.cn@gmail.com>)
 id 1i0ypG-00045f-P2; Thu, 22 Aug 2019 21:57:14 -0400
Received: by mail-ed1-x543.google.com with SMTP id f22so10899679edt.4;
 Thu, 22 Aug 2019 18:57:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=F1LwxoDLcc9DurYrRnnkSdTu9XJjMBtcp763pSxm7Gs=;
 b=hlwm29ZDHVLgxywMuCE+HTmDGph5p9UIO1OMy+ePNrPwG8M7pmEbYMHLWIe7yZeGvg
 9BgxZRTzbqbB+66j/LuoxNMf4U44Sk4wfdWynATIt+Wk6vc4hjrDvFccoz5R8xu7OkHW
 WZdJPAH9GilVwzkqfRwS0DjFUnhtwgwMw1itWS00UiS6sGu0wo4R80B5/aCyq6C2lDYI
 RvFWeuwVepFNoxWKW/OODKeOoPhRuo5l/kEllwZ5i0s4wmIobZ0D+WKmheUuvXM+uJbY
 Q/8PeDxHvuZ557yzhSIe0lrbHYLTBn21qZ6K5obxxZNSqQdzGdBYt4Z9+kSSgqUs+fYo
 W5NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=F1LwxoDLcc9DurYrRnnkSdTu9XJjMBtcp763pSxm7Gs=;
 b=dRbqwrQvaloX2UoTBBmHgdptffIBLTijC+SyhygF4mpumrf6KbIN4s8Mu/hqidMqPu
 r9cTRiznrGu/iKX6f5GqjYptxj2/SmfZm+paNeseUIxE2LQRxMMQ/mCWJpMPksrC+bPu
 KNUq9NCfEGi7Lu6iteMFc8TosesKTQ3aRkuRfm1Anc4yvwFSd+oUW7rTy5431ca+Y7Iz
 DvrTeWvVV086/jQ7BMZHUaWXUXlAFVPjHX+3KiaB58Ue2hrprz7SHod6TemBzS7V97ZC
 M3eZMi2Uxm1cqegPuW6EonirMFuzjlrCOYr+W8Y7pUsh8BYq2BtCL/zNLtCIWk+hhUt9
 bX9w==
X-Gm-Message-State: APjAAAVWujFpAjRB7Lt0fq6sADDS5e+nW1SkQUaQv0utDavm4Dw3DpLm
 6pTliH5mT2Xm2xxsPL1i3VwTdvhVCNi+aaYP8gE=
X-Google-Smtp-Source: APXvYqxnJaxhs9J8KGM+mn47NgYAHCOIyTQY34n891g3KarKSLlOcYlx+hwNpsHB6nhurMQdMyShP4fn6VAQIITa45A=
X-Received: by 2002:a05:6402:128b:: with SMTP id
 w11mr1943197edv.182.1566525433516; 
 Thu, 22 Aug 2019 18:57:13 -0700 (PDT)
MIME-Version: 1.0
References: <1566191521-7820-1-git-send-email-bmeng.cn@gmail.com>
 <1566191521-7820-14-git-send-email-bmeng.cn@gmail.com>
 <CAKmqyKO-FvyWnMimAGNAEwSRqrswkY9QW1=iiaaSZMh6kgXLCg@mail.gmail.com>
In-Reply-To: <CAKmqyKO-FvyWnMimAGNAEwSRqrswkY9QW1=iiaaSZMh6kgXLCg@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 23 Aug 2019 09:57:03 +0800
Message-ID: <CAEUhbmUuZ2YhKNZkqeAJq7EhNOEX2=7Di1UU66jfSXpbFoBkqw@mail.gmail.com>
To: Alistair Francis <alistair23@gmail.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@sifive.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::543
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH v4 13/28] riscv: hart: Add a
 "hartid-base" property to RISC-V hart array
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
X-List-Received-Date: Fri, 23 Aug 2019 01:57:18 -0000

Hi Alistair,

On Fri, Aug 23, 2019 at 6:44 AM Alistair Francis <alistair23@gmail.com> wrote:
>
> On Sun, Aug 18, 2019 at 10:27 PM Bin Meng <bmeng.cn@gmail.com> wrote:
> >
> > At present each hart's hartid in a RISC-V hart array is assigned
> > the same value of its index in the hart array. But for a system
> > that has multiple hart arrays, this is not the case any more.
> >
> > Add a new "hartid-base" property so that hartid number can be
> > assigned based on the property value.
> >
> > Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
>
> Why do we need this patch?
>

Without this patch, we cannot create two clusters that represent 1 E51
(hartid 0) and 4 U54 (hart id 1-4). Current codes will create 1 E51
(hartid 0) and 4 U54 (hartid 0-3)

Regards,
Bin

