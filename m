Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1hyg6P-0003Da-2J
	for mharc-qemu-riscv@gnu.org; Fri, 16 Aug 2019 13:33:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56560)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alistair23@gmail.com>) id 1hyg6M-0003BJ-Ix
 for qemu-riscv@nongnu.org; Fri, 16 Aug 2019 13:33:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair23@gmail.com>) id 1hyg6L-0008TE-Is
 for qemu-riscv@nongnu.org; Fri, 16 Aug 2019 13:33:22 -0400
Received: from mail-lf1-x143.google.com ([2a00:1450:4864:20::143]:37608)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alistair23@gmail.com>)
 id 1hyg6I-0008RC-Nh; Fri, 16 Aug 2019 13:33:18 -0400
Received: by mail-lf1-x143.google.com with SMTP id c9so4589640lfh.4;
 Fri, 16 Aug 2019 10:33:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Sg4DchbEuir7TA0M1GFZRMxqEoBHsIS0Huq+Eu6XP0k=;
 b=tq2L41f0IXTzezULoWr4I2QKNjUexaVTTQg4co5CBG2JxMdyIf2laO9gqvrufs5moQ
 PjU+gA/jUC3iTLwWxjz4hAb0kmd4eMJqHyUktCt2RuVgFMRxSkkxDy6m5v4kNSmaIFdX
 tPTNh9YzyFq4Y+CnyofyEDxabRQ6Agv8oUa56mfDI4UodYe/qUPw/aIv/BdKGaLOt+3t
 zq4hmXnfXDqMUpZxJ99liHNlRfdXaC+v2AB3xVd6ePVcKssQxra0UJdQe4QWxr/V6ngk
 v8xgvKuiZSCHUoP9/7A7hgkfdhLn1Z+hP91QXRPjFL9CzASrN3hXk1TgMQAgN9A9PYX3
 Sp2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Sg4DchbEuir7TA0M1GFZRMxqEoBHsIS0Huq+Eu6XP0k=;
 b=kcSZ4dLW1po37NxGDVZOBuW8CJ1cYwZXEBLi49ra1JsWNrZmaS8b+6d1/cuDvuvGog
 nkWQYcqKHHysh85Id71XSE3JMVoQLk+IyXqdDD8fnkGy1MOwa6cfnNxUscDRXoYcMZF0
 8jEbq8fa156Il58D8xioSKkCFCL22Hy8GLToJqJ3DSSF4O5QBO3ppnDlTQE/bwgevVzP
 ZSS+1n5PyWZ/g7QxcGiHugBUgt/csuaMFcc/z3vVm0uo98feWlgo++JsBAm1Re5B/7Bn
 jBn/d1B4vUzd8j3Bv5hktXhyN2mnOmEeVFWZPYbkaDnzmA/0JPE1D745t7vj+bpwiqxG
 hdkQ==
X-Gm-Message-State: APjAAAXHYnZkePTZoak7Z7gB5XP1qKp23NOdBqkzRXmWDVAkiUwRTXjA
 QvzCuZ/IdtTnDzTSCE0+SXSKiOIqtcoEJL2Ms7c=
X-Google-Smtp-Source: APXvYqxSO9/6CRejVavGlJcQRfBJgqfkdm4/NF7DbI9ZQxD3Ma/RlKEvHre92ZB0++pU76jshZJdvMxmYkuJOzrLPMQ=
X-Received: by 2002:a19:7006:: with SMTP id h6mr5784362lfc.5.1565976797286;
 Fri, 16 Aug 2019 10:33:17 -0700 (PDT)
MIME-Version: 1.0
References: <0141541d-43ff-98d8-e9d4-4a2fdcfdcf36@c-sky.com>
In-Reply-To: <0141541d-43ff-98d8-e9d4-4a2fdcfdcf36@c-sky.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 16 Aug 2019 10:29:21 -0700
Message-ID: <CAKmqyKPr0V6acB2-Y+N1-aoj-5LSofwi=Jz=u6KFJN1fPUWjzA@mail.gmail.com>
To: liuzhiwei <zhiwei_liu@c-sky.com>
Cc: Palmer Dabbelt <palmer@sifive.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, 
 Alistair Francis <Alistair.Francis@wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::143
Subject: Re: [Qemu-riscv] [Qemu-devel] RISCV: when will the CLIC be ready?
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
X-List-Received-Date: Fri, 16 Aug 2019 17:33:24 -0000

On Thu, Aug 15, 2019 at 8:39 PM liuzhiwei <zhiwei_liu@c-sky.com> wrote:
>
> Hi, Palmer
>
> When Michael Clark still was the maintainer of RISCV QEMU, he wrote in the mail list, "the CLIC interrupt controller is under testing,
> and will be included in QEMU 3.1 or 3.2". It is pity that the CLIC is not in
> included even in QEMU 4.1.0.

I see that there is a CLIC branch available here:
https://github.com/riscv/riscv-qemu/pull/157

It looks like all of the work is in a single commit
(https://github.com/riscv/riscv-qemu/pull/157/commits/206d9ac339feb9ef2c325402a00f0f45f453d019)
and that most of the other commits in the PR have already made it into
master.

Although the CLIC commit is very large it doesn't seem impossible to
manually pull out the CLIC bits and apply it onto master.

Do you know the state of the CLIC model? If it's working it shouldn't
be too hard to rebase the work and get the code into mainline.

Alistair

>
> As we have cpus using CLIC, I have to use the out of tree qemu code in SIFIVE
> a long time. Could you tell me when it will be upstreamed?
>
> Best Regards
> Zhiwei
>

