Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lTxBh-0003UE-7L
	for mharc-qemu-riscv@gnu.org; Tue, 06 Apr 2021 21:40:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lTxBf-0003Rl-Ci; Tue, 06 Apr 2021 21:40:55 -0400
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35]:38784)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lTxBb-0002Zj-Pa; Tue, 06 Apr 2021 21:40:55 -0400
Received: by mail-yb1-xb35.google.com with SMTP id x189so18363327ybg.5;
 Tue, 06 Apr 2021 18:40:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=52jJF6Sv8CGcjLK1vk9YyrciSwFTNzCyxcy+4M8ExZc=;
 b=fL5HyavCWhKZQGjfi3LKlo9ZtKitAhw1nRhf/cjZH3D6Af5KVNo8bC2wt3lW0HXc9W
 nvfGBo66Ab7jf6aTqXuyenqaiSsOUVlZBAzkgbOuWhQdoqGNGj4649UTqL6T6CfQS7Mj
 WOC4nXKeF3M1G/3qvt9CQ1KdHShFsS4+TExMox/pIBthw5tOVz83uk9ykFjF8g5yC0rK
 spjfofPo8Nc1nw83oomhzVTY+Qraeay79kp963F5L/5OW0cvuiSkTsVQ+eL0ADsukFI8
 UrX29r2WZJmcEP38ITjPHQuqta/b/mgtZIuZhcR534D/InFYJIQ3+7g5NjtuH0CgwINO
 jx3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=52jJF6Sv8CGcjLK1vk9YyrciSwFTNzCyxcy+4M8ExZc=;
 b=QdRvbaiCrnN2RGrJGJNgr9CKDlM2XfdYgLkYsNA6MgCfOKICL/3T755kOVGPDHlugc
 9jM+/SNu7WKdPUvfpmhEVc4uBCl05B8bBtIvGOX0oEDE3ow7mB5ky91p7YRfQgoe9xcr
 lRpMEk2Lb/LyNAcJgkHCj+irtHKriTa019MVPHBerHzKhTlM6sL4DAXwIf4c4gkH5UOt
 PPslrJvcEP2x5/nsgO4wrOLfVfeg/kz7SWtpy8IL6CESb5Z+f5jlUv2jiyKL0Z2KIGr+
 s0r6kpqeu3ItjIM/VF6u4bcFggYuYalTNZ/cyyhKAoKvCxWK1a5eh3WuSv9IsxuNLWZy
 RDNw==
X-Gm-Message-State: AOAM530YPJZKIEPWr78lgrbulmxzRcgdC8xmQUUVrEtnyFH626ZB7M0V
 N1C5Rj1NRGFMNltujkVt2XJKUawk8GfDeUKgTV0=
X-Google-Smtp-Source: ABdhPJwR52fNHVu6fBu7sXmEgLNYbqW0Ay4i+R+AeLSP5+TnSIqu8/pqdX58yFlrdAoNlFfZgajZtLsJJVc2jbppbKE=
X-Received: by 2002:a25:e04c:: with SMTP id x73mr1269101ybg.387.1617759646800; 
 Tue, 06 Apr 2021 18:40:46 -0700 (PDT)
MIME-Version: 1.0
References: <6564ba829c40ad9aa7d28f43be69d8eb5cf4b56b.1617749142.git.alistair.francis@wdc.com>
In-Reply-To: <6564ba829c40ad9aa7d28f43be69d8eb5cf4b56b.1617749142.git.alistair.francis@wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 7 Apr 2021 09:40:35 +0800
Message-ID: <CAEUhbmVMcn63My=7RMVWAEgsqrX6=O5X+C-RyPRNaGSQB5BNtA@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] MAINTAINERS: Update the RISC-V CPU Maintainers
To: Alistair Francis <alistair.francis@wdc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Alistair Francis <alistair23@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b35;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb35.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Wed, 07 Apr 2021 01:40:55 -0000

On Wed, Apr 7, 2021 at 6:51 AM Alistair Francis
<alistair.francis@wdc.com> wrote:
>
> Update the RISC-V maintainers by removing Sagar and Bastian who haven't
> been involved recently.
>
> Also add Bin who has been helping with reviews.
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
> I have run this by all of the people involved and they are all ok with
> the change.
>
>  MAINTAINERS | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>

Acked-by: Bin Meng <bin.meng@windriver.com>

