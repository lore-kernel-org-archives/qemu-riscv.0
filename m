Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mfYw0-0000WD-NY
	for mharc-qemu-riscv@gnu.org; Tue, 26 Oct 2021 22:45:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mfYvz-0000VD-1x; Tue, 26 Oct 2021 22:44:59 -0400
Received: from mail-io1-xd2b.google.com ([2607:f8b0:4864:20::d2b]:47052)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mfYvx-0006rM-Hc; Tue, 26 Oct 2021 22:44:58 -0400
Received: by mail-io1-xd2b.google.com with SMTP id i14so1787035ioa.13;
 Tue, 26 Oct 2021 19:44:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=n7lIj9E5AxuIGxRnhYOIVcilagWLjwNPKEFgt3akdpc=;
 b=WqBjntgwN/aMqEJohbo4zRM+6d/3x/Rbm/DIwav/s3A2GJLKPLnNnZbY+eoj0rgyOy
 +st+V6pP6ItJ9ftI4pgC9+F3gqgXvwBuqd0jT7ZRsTczLQ/qyU61ZWa1rLFX4hBcmyhe
 TohOodkNfirHL2HmUms7Ze7cjjsNApoKTrPp2jIQgMHOBNXub7/kxlEkcigZkamM24rx
 4w9MaTPXz+ceER6SU0PLiIcFUOW9yCy5q+gI3DCc/lpKSuOZxyazKB63GLa3tsV+qkm7
 ktkjPC2b/wPYMPBqvGHifaIeTl/likU7mdi4SdARaXp8IhFsNaFA0OFu3WpXeuZ1qV4+
 kavg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=n7lIj9E5AxuIGxRnhYOIVcilagWLjwNPKEFgt3akdpc=;
 b=vqFc4IQaN2lO3Or/m9PJIztQmb6F5aGw4Eymny3rFtvFKgHyrozQ8FdlJo5O0NDyzO
 2hbeI8J5WfII9UfMWQE39I6JYkxx5e59z0RFQV54rjIJpQcYH9JIkniljhJ49+suzHfp
 ODGZr/TcdbVwLbcwYqWghqaKBMeg1WcLTwdv0LiBujyc4U3uT6FnW6SYTNRdzMMB8Qpc
 gLaaRJuyzhOBAzBaKWlRr1XiDV72DDn3KUwCJl1Vt66bRTsuVwDP0wT/xBA8/EpWae92
 auTgOnc0WUIZdbVtK0DMhUMJ2db1ai/mDJQF3sMxtVX22FUIquekGB5MqA4uwnvWGgSK
 3Gsg==
X-Gm-Message-State: AOAM533HgVX2SDg7aQywUL6iZc1h7mkg2BasNNxPSa9/uWuFlc6BoT5d
 H83l0z8Y2WJDfNgzQDrhLSwHNjghZz5S6FDq4VE=
X-Google-Smtp-Source: ABdhPJw3u719sJ9saU3uJ8T0SbtzcyL7mewF8gn8SVYodjFKY3J4Eb0daOE5JDzfQRNDnqcfR25uK/fZrQckvgIsPyY=
X-Received: by 2002:a05:6638:34a:: with SMTP id
 x10mr9216230jap.114.1635302696276; 
 Tue, 26 Oct 2021 19:44:56 -0700 (PDT)
MIME-Version: 1.0
References: <20211025124319.195290-1-rpathak@ventanamicro.com>
In-Reply-To: <20211025124319.195290-1-rpathak@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 27 Oct 2021 12:44:30 +1000
Message-ID: <CAKmqyKNrje6W0kzHgfRf6k9gVAz4c12zdKYYbsSJaHNFdbnQXA@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] mconfigptr support
To: Rahul Pathak <rpathak@ventanamicro.com>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Bin Meng <bmeng.cn@gmail.com>, Alistair Francis <Alistair.Francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2b;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2b.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
X-List-Received-Date: Wed, 27 Oct 2021 02:44:59 -0000

On Mon, Oct 25, 2021 at 10:51 PM Rahul Pathak <rpathak@ventanamicro.com> wrote:
>
> Patches add the mconfigptr csr support.
> mconfigptr is newly incorporated in risc-v privileged architecture
> specification 1.12 version.
> priv spec 1.12.0 version check is also added.
>
>
> qemu-system-riscv64 -nographic -machine virt -cpu rv64,priv_spec=v1.12.0

Thanks for the patches!

I gave some comments in line with the code changes. Overall this looks
good, we just need to add the other v1.12.0 features.

Alistair

>
> Changelog:
>
> v1->v2
> ------
> 1. Added privileged architecture spec version 1.12 ("v1.12.0") check
> 2. Added predicate function for mconfigptr which verifies
> for priv spec version v1.12.0 or higher.
>
> Thanks
> Rahul
>
> Rahul Pathak (2):
>   target/riscv: Add priv spec 1.12.0 version check
>   target/riscv: csr: Implement mconfigptr CSR
>
>  target/riscv/cpu.c      |  4 +++-
>  target/riscv/cpu.h      |  1 +
>  target/riscv/cpu_bits.h |  1 +
>  target/riscv/csr.c      | 19 +++++++++++++++----
>  4 files changed, 20 insertions(+), 5 deletions(-)
>
> --
> 2.25.1
>
>

