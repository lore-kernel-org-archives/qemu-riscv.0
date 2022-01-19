Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nA4tN-0001ZT-V2
	for mharc-qemu-riscv@gnu.org; Wed, 19 Jan 2022 01:56:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1nA4tC-0001SP-7D; Wed, 19 Jan 2022 01:56:15 -0500
Received: from [2607:f8b0:4864:20::b2d] (port=39591
 helo=mail-yb1-xb2d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1nA4tA-0001xQ-SW; Wed, 19 Jan 2022 01:56:13 -0500
Received: by mail-yb1-xb2d.google.com with SMTP id o80so4488702yba.6;
 Tue, 18 Jan 2022 22:56:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=y1leCV4fprrunTPFLEjm1cVuCtn1dsX6ZDpcdcTtWXs=;
 b=IHWJdATm3YjQb1v6nUDg9+8NXYZatW5oejTXB0vqlGGGtO/tBgUQ4X8M7JlSRzcVeA
 /8j9IKRG3D0NxsPs8qUaTZDsBJ/AHfQtt6w6qonxPyr4NRSphmoqxkmP3ESVM3MWojCz
 jep4E0AEjnHucpL9i16st+BNl6OmF4TNMgLXlhsDO/jsb/VT1hDRlSDwInE1l7YXIzZR
 n0+1+Z5RDcxDIclH9kRpVCLahNMbG50WLEY4Urg5cR4m9cCnGwbJzpB2ofXqTpXTwXKx
 hptmIkYnE9bW/7XoGCT3aYac7Vw99WKtGDPIl6jZ1qEkYnadHCpndUS7IeiwD7WDB2oo
 4h6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=y1leCV4fprrunTPFLEjm1cVuCtn1dsX6ZDpcdcTtWXs=;
 b=f482sHUojHAun8pjNE/MD8ld6mYFjizjjoWo5IJO+TuApB+Il+2UH6uc6gv+dYhF9v
 rGbY69QTUD2g89rzeWYS26KFWMb3/wM12YorqyE4zXnb3fUjVRWe3sklGM1WASRtElVr
 AxQeWl2JZFhFh9X8bm+B2hrLvqGzhRMO8bTcqzzdytangk4iRKCRTG3njzAZMxUxxhAS
 VwJXqnR5O+q91sUo1fJi/fE3RZ/bVHqOplyLTnRvj0nYMx+mNSbqDL37MtHtSzseH8hy
 +9MoyX+rweLn5wOaYkDWmrBmVgg2Gkq+aquky2VjUMPXmQ8hTramXWHQf+mQA+GkgnkG
 8LKA==
X-Gm-Message-State: AOAM532CIeC+Xl+xVUKjlRMHixzFt6BYFF2ruExuzommsav7WPD6F3Xs
 5Ccy71fy1WzjjEnRVgDRNPp+V7xHi/qwIaZYo6OvTAp9Eow=
X-Google-Smtp-Source: ABdhPJzKXcUrmLmj/31I1t20zRjlcKAFJYxhxXrLDbu9vpp1ynlldZVxb8VLNVhSJPAsFKiHHZ7sKTQFcnzt148kLm0=
X-Received: by 2002:a25:9c45:: with SMTP id x5mr21722177ybo.91.1642575370228; 
 Tue, 18 Jan 2022 22:56:10 -0800 (PST)
MIME-Version: 1.0
References: <20220118111736.454150-1-apatel@ventanamicro.com>
 <20220118111736.454150-3-apatel@ventanamicro.com>
In-Reply-To: <20220118111736.454150-3-apatel@ventanamicro.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 19 Jan 2022 14:55:58 +0800
Message-ID: <CAEUhbmWzS0qNpH6K-1gO+o3QraF7Z1FD0HJErO_DiGs-6fmF+Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] hw/riscv: Remove macros for ELF BIOS image names
To: Anup Patel <apatel@ventanamicro.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b2d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2d;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2d.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Wed, 19 Jan 2022 06:56:19 -0000

On Tue, Jan 18, 2022 at 7:18 PM Anup Patel <apatel@ventanamicro.com> wrote:
>
> Now that RISC-V Spike machine can use BIN BIOS images, we remove
> the macros used for ELF BIOS image names.
>
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  hw/riscv/spike.c        | 4 ++--
>  include/hw/riscv/boot.h | 2 --
>  2 files changed, 2 insertions(+), 4 deletions(-)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

