Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lNF3q-0005mG-7W
	for mharc-qemu-riscv@gnu.org; Fri, 19 Mar 2021 09:21:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lNF3n-0005ku-Fg; Fri, 19 Mar 2021 09:21:03 -0400
Received: from mail-il1-x12a.google.com ([2607:f8b0:4864:20::12a]:43711)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lNF3k-0000pq-UF; Fri, 19 Mar 2021 09:21:03 -0400
Received: by mail-il1-x12a.google.com with SMTP id d2so7977898ilm.10;
 Fri, 19 Mar 2021 06:21:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Y+wXREcz+G27txgq0Zyw9ZKW7U/CnCbXn9a5uKaTow4=;
 b=SwdIIYAZ1UH9ahWmONx+VeVqe/HZ6iQG4O8SKm0GdymqmVrFKVlUXYeqe75i59X57Y
 69srAY9NgFIY8AJQbQRDeJs/oGcFwL6DiHinFGBIKl+/7Wwyhq6KwWMSYcDdZUPHpT4X
 DzhMgRFXig0DbQMS0/s6orXbIqTuBEQ94tCzVXmhN0OrznewJ0lY4Z6jZoZ1JsHPQ/vt
 3vZt1YEuqBc7w82GrBrI8ytXDoLDooGKX99ZKoOBTDUMHo34eMOrLNi83Zpn4g//Rifu
 6nz6kwcoFkcSdkFp4PQoWywugB5JnfT5gcGo2iHLf1Xl9aSv6jXzxOt3zBVEE0HWhB4d
 73pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Y+wXREcz+G27txgq0Zyw9ZKW7U/CnCbXn9a5uKaTow4=;
 b=JBgvYUIJNo7P2mWLRupEi4cqLaYS6ErRRSQ/BBWoenbRJgfTWS6jua1dThs/ZKJ0oS
 dQD8bXETdjFcXjYUX0nrz7boKxWKa6AUVWvTEtOR/akQBupPT6P6E3G0ThQhQ4oCARM3
 F1tOztFSzR40VtZtpRnoMA69d9E6bZKWe2aMPY3FV9EUOWhrt66wtDH3J3IYWsIj1kRp
 ttgchY6yTG0MPU6D0Zfid3AvNESE+dey1mRxLA0ooGq87UcErhR73AvLUq7ZRIp2yoXF
 vVkvmn/kiLus+Ja1zPJQMgo2VlxmhRlY8KGMwkCRKrGzqOFtqu9YsST4XxwaSbvDrgNz
 7KWQ==
X-Gm-Message-State: AOAM53054bObluGuKg+cj/vnur/hUNAKo2otCDUL+NDnICEJuFGYPz4k
 Y8owHCKNhUxp53QNbr9Z77rTlM05aYX9DbiXdeU=
X-Google-Smtp-Source: ABdhPJzXeyziPzcq4JpGxW3I9kFzwjWdwL7P3QyxB1STXWYf8njaSFnyhyA9yfR83RpCDpgHnPbHNqzMX1C+6nkqUNg=
X-Received: by 2002:a92:c102:: with SMTP id p2mr2587397ile.227.1616160059404; 
 Fri, 19 Mar 2021 06:20:59 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1616002766.git.alistair.francis@wdc.com>
 <6834cb79431f394b05b06a26317799c9066ccd4f.1616002766.git.alistair.francis@wdc.com>
 <20c52b91-3ddb-f384-3094-7efb344ca5ef@linaro.org>
In-Reply-To: <20c52b91-3ddb-f384-3094-7efb344ca5ef@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 19 Mar 2021 09:19:11 -0400
Message-ID: <CAKmqyKN7TeyLUYZ2kdLb1iOBLeVGuvpx55NmSXeDM7MdxxVG1w@mail.gmail.com>
Subject: Re: [PATCH v1 5/5] target/riscv: Use RiscVException enum for CSR
 access
To: Richard Henderson <richard.henderson@linaro.org>
Cc: Alistair Francis <alistair.francis@wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bmeng.cn@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::12a;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x12a.google.com
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
X-List-Received-Date: Fri, 19 Mar 2021 13:21:04 -0000

On Thu, Mar 18, 2021 at 9:25 AM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 3/17/21 11:40 AM, Alistair Francis wrote:
> >           result = riscv_csrrw_debug(env, n - 32, &val,
> >                                      0, 0);
> > -        if (result == 0) {
> > +        if (result != RISCV_EXCP_NONE) {
>
> This was intending == NONE.  I.e. no exception raised, let gdb proceed.

Good catch! Fixed.

Alistair

>
>
> r~

