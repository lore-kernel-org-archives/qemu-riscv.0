Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nZRc9-0006dE-G6
	for mharc-qemu-riscv@gnu.org; Wed, 30 Mar 2022 02:15:32 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <idan.horowitz@gmail.com>)
 id 1nZRbz-0006b0-74; Wed, 30 Mar 2022 02:15:22 -0400
Received: from [2607:f8b0:4864:20::32c] (port=42913
 helo=mail-ot1-x32c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <idan.horowitz@gmail.com>)
 id 1nZRbw-000572-7J; Wed, 30 Mar 2022 02:15:18 -0400
Received: by mail-ot1-x32c.google.com with SMTP id
 b17-20020a0568301df100b005ce0456a9efso837871otj.9; 
 Tue, 29 Mar 2022 23:15:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ND3HHaPvxHrZ4YoUxSzWv3J7SnMENg09YnTae1p1DaM=;
 b=E6BnkRqAhXVEHP8iW/RgFDbmg3/YstxctezmF2ikR8fYp4GNqN4wYAqVg0b3AdY2ge
 lBTm3s96Za/LnsA96asLO4kaAciw/PjQRhdqyrwzwA/9JsaPc38M7IYlYM0AGzeZk8S5
 Lp58QzPiaEUDzh7pxUCJfRNrPzIgF3HVhqZyaD8duOXH8Nj3hB+4mxlNIKqvF/iowvtd
 iZJtMPVQr02Xo6isGsONcgfv8TFe+R0S/5g1gsBwIGp4zaImhMcsQUZbh58ADxd7Wdfb
 8UrfTU2f2u/mo5ZeEp2ua3qH98Psw4qOGS+n03/1ryKl5F3j5+BgCZ+zW6ePgTHZ1mjp
 i9+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ND3HHaPvxHrZ4YoUxSzWv3J7SnMENg09YnTae1p1DaM=;
 b=iL+U/OMx04ovhGlQgPpftRh8qMwQgOoZgjAdcCfrMdqTB3GBgrw5mygunjJ6oSATcl
 25ngGA/cBmhH5+jCuxNNZJ7pYRSOaLcJGMBb/HCVOb1124mZGdC0JyHy2vQlLss1z7xz
 CpJccw/186DFV92/2MvqAxI/sq7WjumPKwA9amZoJcKXaRkkrVrIfm54cOU05V3C3oak
 /mboI1XL/VJbIVYeVNUYXxoy3fGeY98CMjqD+VfesHwSo7qYy8g9OzQJqmYyZqKJNTjJ
 mfDFJkusBlLXo4B7icegdmTDbEPQKdzhh7Epv6Yyo8GEZz2hCQHQ6o+LiZwmKjf8WXYk
 pDrg==
X-Gm-Message-State: AOAM532NsSLyT7IL8VSsU8lPyFEBXJL48Pi+9C5qWgR55zL1JPUjE24W
 a7HSJX3/ftvXDkOkpzmuXH5HB+fSCXXDnHPVi+Kn/YBEamy2SA==
X-Google-Smtp-Source: ABdhPJxgvUQYVQgOkeOl09tVMiniEKjGbGx6/XEhfLH0fFr0d+4CsKTq/j1V1bmklN+BjZY5qodGmqQYCi6MAOsiyS8=
X-Received: by 2002:a9d:332:0:b0:5b2:420c:ca87 with SMTP id
 47-20020a9d0332000000b005b2420cca87mr2651487otv.149.1648620914486; Tue, 29
 Mar 2022 23:15:14 -0700 (PDT)
MIME-Version: 1.0
References: <7f383fc2.81a2.17f93c0dad7.Coremail.phantom@zju.edu.cn>
 <CAOnJCUJck5o_-cayf-=mccenoZH048+2zhGDGOoWKiVMUFWWmQ@mail.gmail.com>
In-Reply-To: <CAOnJCUJck5o_-cayf-=mccenoZH048+2zhGDGOoWKiVMUFWWmQ@mail.gmail.com>
From: Idan Horowitz <idan.horowitz@gmail.com>
Date: Wed, 30 Mar 2022 09:15:03 +0300
Message-ID: <CA+4MfE+hFQhRYEgEXy-u10=MBhnmA5f7MdRFjW7Xc0dLPSiLXw@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: Exit current TB after an sfence.vma
To: Atish Patra <atishp@atishpatra.org>
Cc: phantom@zju.edu.cn, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Alistair Francis <Alistair.Francis@wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::32c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::32c;
 envelope-from=idan.horowitz@gmail.com; helo=mail-ot1-x32c.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 30 Mar 2022 06:15:24 -0000

On Wed, 30 Mar 2022 at 02:16, Atish Patra <atishp@atishpatra.org> wrote:
>
> This is in for-next on Alistair's tree and fails to boot the kernel
> with the following error (found -d in_asm mode).
> Reverting the patch solves the issue.
>
> ----------------
> IN:
> Priv: 1; Virt: 0
> 0x0000000080201040:  18051073          csrrw           zero,satp,a0
>
> ----------------
> IN:
> Priv: 1; Virt: 0
> 0x0000000080201044:  Address 0x80201044 is out of bounds.
>
> 0x0000000080201049:  Address 0x80201049 is out of bounds.
>
> 0x000000008020104e:  Address 0x8020104e is out of bounds.
>
> Disassembler disagrees with translator over instruction decoding
> Please report this to qemu-devel@nongnu.org
>
> ----------------
> IN:
> Priv: 1; Virt: 0
> 0x0000000080201050:  Address 0x80201050 is out of bounds.
>
> 0x0000000080201055:  Address 0x80201055 is out of bounds.
>
> 0x000000008020105a:  Address 0x8020105a is out of bounds.
>
> Disassembler disagrees with translator over instruction decoding
> Please report this to qemu-devel@nongnu.org
>
> ----------------
> IN:
> Priv: 1; Virt: 0
> 0x000000008020105c:  Address 0x8020105c is out of bounds.
>
> Disassembler disagrees with translator over instruction decoding
> Please report this to qemu-devel@nongnu.org
>
> --
> Regards,
> Atish

Do you have more specific information about which kernel image doesn't boot?
The errors you're seeing simply mean that these addresses are not
translated by the new address translation context set by the write to
the satp.
To be honest I don't immediately see how this could be caused by the
patch, as it modifies the behaviour of the sfence.vma instruction, and
there are none in your trace.

Idan Horowitz

