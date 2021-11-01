Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mhSC0-0007nb-Sd
	for mharc-qemu-riscv@gnu.org; Mon, 01 Nov 2021 03:57:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1mhSBy-0007l3-Ri
 for qemu-riscv@nongnu.org; Mon, 01 Nov 2021 03:57:18 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:53825)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1mhSBw-0002vb-Sl
 for qemu-riscv@nongnu.org; Mon, 01 Nov 2021 03:57:18 -0400
Received: by mail-wm1-x32a.google.com with SMTP id y196so3531791wmc.3
 for <qemu-riscv@nongnu.org>; Mon, 01 Nov 2021 00:57:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FwU1FdOhps6Sk9gtnQ13CNN9KN87r3ROPel+eStITko=;
 b=gdGrlnOGhuSJtfSedU/2HV8xF85ThAfC7h3PIi4anJ/PMl0/uILW2/Rkr6y1J9ffqw
 oNA7ZeR6DNCuTKUgeDnaw61Mn443pX0gazvHPW1c0Kjx3rihSvn/7ZSBQF0EbiMuJ9UC
 MU9hV0ZCwyCxGCKfX7qwDI0a6ksXiSvBXop0HiV86izXpw0QLNjWKdOZ3nFbsxlXumT9
 2oFIUOur5eT+ESGSqrTaGr9ZcZRHtvkNoEFRiJNCXYj5F8J5JBns9NqddBH7Hl0H2nUe
 pLeMeMx5IUED19DTzHl/oTvMLPa+tMBgavH7xY0wNknsj5KTZJsGrKXeqOLgV8HXnhux
 cxiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FwU1FdOhps6Sk9gtnQ13CNN9KN87r3ROPel+eStITko=;
 b=TvZF/zrvxLXfRCy4rYj8xg0mf0AQ+QKFJOJTwW/SWHdc0qWU9k3NNINQCluk0us/20
 0XsQnCTW0CxcRYKxaUDOkI/taxFUPaxBXtg0U5HDePp8jxt6f8rqAGPXDY140oMXOcJ5
 mCkMX9j9LfKB+VgdBxZUpmMDf6U7kZP4af5TroO5uKxJyqo05BWOVaZxhIkxZrlFknn8
 gZrVo2H2MWwTMLDQoTeHXCWckOZneVIJySwPRTFtOm9fbMlkoglO/H2Q53SduSkCZSiU
 GabQUPkHgqmQC93lk0EJsaLiN5oKjNyPAAknPz8aO6VK+SPJMU8VLlaKHrl2h+tUWf/+
 qpmw==
X-Gm-Message-State: AOAM533OHaPrwzaPi3XYhINwoCK6NmdOkH976O4/dk0A5W5xnDJxeofT
 oiDaekvpS71ynkpvXN+FaFBp8ImOfEXUGdH0XIz4Pw==
X-Google-Smtp-Source: ABdhPJyaKizgsvkhHL3cFWU5lFYOHGsBGgNSTpzolBD5Ke6RDaxyZOaODQQ2f41t9zy1HyoxbRUnqMYA/nAS7cwNWWY=
X-Received: by 2002:a05:600c:354c:: with SMTP id
 i12mr29913637wmq.59.1635753434367; 
 Mon, 01 Nov 2021 00:57:14 -0700 (PDT)
MIME-Version: 1.0
References: <20211026064227.2014502-1-anup.patel@wdc.com>
 <20211026064227.2014502-8-anup.patel@wdc.com>
 <CAKmqyKOyTR1RX4k3Eq-YmcuWRsxVu5J=o-_eQeU6Ht1TUEUEBA@mail.gmail.com>
In-Reply-To: <CAKmqyKOyTR1RX4k3Eq-YmcuWRsxVu5J=o-_eQeU6Ht1TUEUEBA@mail.gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 1 Nov 2021 13:27:02 +0530
Message-ID: <CAAhSdy2F+63j3S1zP=eQMaeM4dpRvNLO55avAaZgZXO5ZpTbPw@mail.gmail.com>
Subject: Re: [PATCH v4 07/22] target/riscv: Add defines for AIA CSRs
To: Alistair Francis <alistair23@gmail.com>
Cc: Anup Patel <anup.patel@wdc.com>, Peter Maydell <peter.maydell@linaro.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Atish Patra <atish.patra@wdc.com>, Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: none client-ip=2a00:1450:4864:20::32a;
 envelope-from=anup@brainfault.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 01 Nov 2021 07:57:19 -0000

On Mon, Nov 1, 2021 at 12:26 PM Alistair Francis <alistair23@gmail.com> wrote:
>
> On Tue, Oct 26, 2021 at 5:01 PM Anup Patel <anup.patel@wdc.com> wrote:
> >
> > The RISC-V AIA specification extends RISC-V local interrupts and
> > introduces new CSRs. This patch adds defines for the new AIA CSRs.
> >
> > Signed-off-by: Anup Patel <anup.patel@wdc.com>
>
> What's the status of these CSR addresses being finalised?

These CSR addresses have not changed since the past 2 months.

Overall, the AIA spec has been in stable state for quite some time
without much changes or objections.

Regards,
Anup

>
> Alistair

