Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jlqLY-00008v-TN
	for mharc-qemu-riscv@gnu.org; Thu, 18 Jun 2020 04:56:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1jlqLU-00008X-RE; Thu, 18 Jun 2020 04:56:29 -0400
Received: from mail-yb1-xb42.google.com ([2607:f8b0:4864:20::b42]:33969)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1jlqLT-0005IL-Ax; Thu, 18 Jun 2020 04:56:28 -0400
Received: by mail-yb1-xb42.google.com with SMTP id a80so2752077ybg.1;
 Thu, 18 Jun 2020 01:56:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GaaKiFRWVgX3m5d9C4sK5TZmSi+TDccHMDDNXZY9sZ8=;
 b=tDX+f7EZvLXoVd67ZNT9A10Rb9u5Fa9VpTvqdZmkBn37baqmsjl9Z/tU0Iht+G/PX0
 8AIRoGrihWJt/dDYlDgCjVXfX2uNpX2CPyuLGzATKEF2t98XLba06X+9QY0KiHBC6T3s
 NhunrFnmXqvepcdq2XCFX2IMtXLg4koDvuwO0bRQ9lQ+X3lcbryr0hVuuKmj5ujBSJkY
 eIkzHh4cP14+5+YysdrUEIJ9z4oWFCCAmccpt92gYymtAx4vb0LB4Ne2klHGut5HRCnB
 r0LtLUXdN87PwKtHkpSKJXudEmJMSkkzhFnMNo7Y5X77q3K3qeqEbDM2p0OZSRckXqAQ
 aByg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GaaKiFRWVgX3m5d9C4sK5TZmSi+TDccHMDDNXZY9sZ8=;
 b=gUxeu3R79/bm2bpwaqJcD8e1xy8TlYgHLf+ypbxuTb/BLugB0N6kSyX3b97003tZqc
 1pm8c7WF000D4dNffW41qz09PkOFmR8gUMhGHh2z37N1guzJexkDX7pirPDL6iFuV77t
 VbbfjVFPp8QmMmaUP9BDpHatT2jq8rM/vI0w3YpfNv6nX1Dsmdg9z+qCoqd1kJIdZ1fO
 gKpZRGzKzdnDOaFpbQF7qdYIxyz6d66hl9Qjfz4YVxiqqmi6pqOjvblyL27SMBgx/Cw8
 zKuwEaY/EZYvpdJ6SgoYmRWQjDdcUnGg4uV8TF7O+xUVqsWQsDiOfKxSlLnkSnwGNc5x
 CBGw==
X-Gm-Message-State: AOAM5338TLx0uMrnT6sUQ5yCeZUXD8VZsTVzNZDkL+da5t3de1ak28vL
 evNkL2SVXVGOvKvMPNlzkvjxMTHpB3CXUdQ7c1o=
X-Google-Smtp-Source: ABdhPJzO73BncriSdDqmCUiIpVzAKrTKGGuGhlSWy8UmeGP5Xchi9AOlHaINfMZgnAiRjXPfXY9pXtQWgVB5MI2rFYQ=
X-Received: by 2002:a25:7a06:: with SMTP id v6mr5023524ybc.152.1592470585931; 
 Thu, 18 Jun 2020 01:56:25 -0700 (PDT)
MIME-Version: 1.0
References: <20200616192700.1900260-1-atish.patra@wdc.com>
In-Reply-To: <20200616192700.1900260-1-atish.patra@wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 18 Jun 2020 16:56:14 +0800
Message-ID: <CAEUhbmVRN2Ze=jNqFSJbZgO0_ggyX6B-1UydPJB1sZVdAokrxQ@mail.gmail.com>
Subject: Re: [PATCH 0/3] Add OpenSBI dynamic firmware support
To: Atish Patra <atish.patra@wdc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b42;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb42.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Thu, 18 Jun 2020 08:56:30 -0000

On Wed, Jun 17, 2020 at 3:29 AM Atish Patra <atish.patra@wdc.com> wrote:
>
> This series adds support OpenSBI dynamic firmware support to Qemu.
> Qemu loader passes the information about the DT and next stage (i.e. kernel
> or U-boot) via "a2" register. It allows the user to build bigger OS images
> without worrying about overwriting DT. It also unifies the reset vector code

I am not sure in what situation overwriting DT could happen. Could you
please elaborate?

> in rom and dt placement. Now, the DT is copied directly in DRAM instead of ROM.
>
> The changes have been verified on following qemu machines.
>
> 64bit:
>  - spike, sifive_u, virt
> 32bit:
>  - virt

Any test instructions?

>
> I have also verified fw_jump on all the above platforms to ensure that this
> series doesn't break the existing setup.
>

Regards,
Bin

