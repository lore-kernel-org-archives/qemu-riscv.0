Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lVsbA-0006DV-88
	for mharc-qemu-riscv@gnu.org; Mon, 12 Apr 2021 05:11:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lVsb4-000689-An; Mon, 12 Apr 2021 05:11:06 -0400
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a]:46717)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lVsb0-0002mj-5d; Mon, 12 Apr 2021 05:11:06 -0400
Received: by mail-yb1-xb2a.google.com with SMTP id y2so12177267ybq.13;
 Mon, 12 Apr 2021 02:11:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kmbpTK92GQfYEIXF9NmnDQO7G+AtjqUQSYavOl45PTc=;
 b=TWMaF3bsE7ORBzohglIHIYYz/nsvA8QgVFnKdWIyPh/D2dyMp81BJm1yu48mBhIetM
 OMcfpp4tRXWWgPbG/2K8PkoZBVMUhFUQ+78ZRjY2dHhoFaS15OClbfiTAajaSz6SNLAx
 n4w70FfjFeL9+bOk1lU1gQrXLJ1KUialZJHqExeJGHXu5cEv4GUFOJsJwnqRMmPwZj7Z
 OFQh8c28fqtKWHtg9Ue9+k0ShiE1RUK+/6BeLU7YY8i+8a+0vRWgmQwaZ+bE41eoqLby
 W+tP9LSIqcOOouvKpUoNFPGXF4+3T/78GsT50sjGuMD0gm9qellWzWerWcbzeULQ2Lyo
 CCxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kmbpTK92GQfYEIXF9NmnDQO7G+AtjqUQSYavOl45PTc=;
 b=Q64VlcXv1jwXWiZCM/L7xLRj8TuqZgJcmXY6S4t9wICnqIXeESw7VdDZqRJiz4JevY
 SuEHQ/yyW3E/0lz5Dxm662TncCdO2Ow+cZ497VVPCOYAo6ASJgRxPPAz+B1Vd82Zinge
 0p/Arzw8jFZ3190F2wOGgFkp6h3iV1PZAz8tyhifsvBIdrz2zjwzNAbAGA4GhWgyCGvI
 2SsS79J1e1Hr+vFCAqpe8nOiZEhMnenFJffZyViJcgb91kCcY7mm0G9k4qRvqtYVvBdV
 uHqAbDdQLLRaz0jz5d+zEwXYGTnWsA/4hKR+CRsLCvEKlkM6gKG1u1wpJ1dz+Z3Mg2P7
 7Siw==
X-Gm-Message-State: AOAM5333pEJtmpaIHAtJ23FpGKG4iKo+qYDlby+wMflxvIl7ZioBn30F
 efhMemdPVfs35iHYPyacgKXrZBq7FdlEIRyxz0B5gGHb
X-Google-Smtp-Source: ABdhPJxIGFswS0IuIdetf8oF64p1eC1I+yaeb/2FlEUVRDLEdbkixwh39h7j4zPpJCdHK4Lio2zHPsRsqc2ZAerF2kA=
X-Received: by 2002:a25:be09:: with SMTP id h9mr8408482ybk.239.1618218660819; 
 Mon, 12 Apr 2021 02:11:00 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1617393702.git.alistair.francis@wdc.com>
 <4b26392f1626590ee9064d43df4aef590472b72d.1617393702.git.alistair.francis@wdc.com>
In-Reply-To: <4b26392f1626590ee9064d43df4aef590472b72d.1617393702.git.alistair.francis@wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 12 Apr 2021 17:10:49 +0800
Message-ID: <CAEUhbmURD5iRpqLNsdkF=vTwMJYt_WgGDpTW14NdTmeY2Y-03A@mail.gmail.com>
Subject: Re: [PATCH v1 2/8] target/riscv: Remove the hardcoded SSTATUS_SD macro
To: Alistair Francis <alistair.francis@wdc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Alistair Francis <alistair23@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2a;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2a.google.com
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
X-List-Received-Date: Mon, 12 Apr 2021 09:11:06 -0000

On Sat, Apr 3, 2021 at 4:04 AM Alistair Francis
<alistair.francis@wdc.com> wrote:

Worth mentioning that this also fixed the issue of a writable SD bit

>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  target/riscv/cpu_bits.h | 6 ------
>  target/riscv/csr.c      | 9 ++++++++-
>  2 files changed, 8 insertions(+), 7 deletions(-)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

