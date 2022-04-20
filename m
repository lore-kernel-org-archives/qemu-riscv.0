Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nhJ0Q-00045r-2D
	for mharc-qemu-riscv@gnu.org; Wed, 20 Apr 2022 18:41:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nhJ0O-00040A-1O; Wed, 20 Apr 2022 18:41:00 -0400
Received: from mail-il1-x12c.google.com ([2607:f8b0:4864:20::12c]:44855)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nhJ0M-00017k-AK; Wed, 20 Apr 2022 18:40:59 -0400
Received: by mail-il1-x12c.google.com with SMTP id o5so1948131ils.11;
 Wed, 20 Apr 2022 15:40:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7pGp/h59g4a5oO3qzs/3HLXwUSrsXiX9152ZJ92SLGk=;
 b=EEChALWbGMBXkmemqQ57SsH0lo5C1YCNx2Xl2vHzUU9Sy3UCEmX4FdzZjx/wjj/eV8
 5MCO+F6iZ7WGSd1UahD1eZqukznMrFMYYBFGuKe427j0TvKDvFOq5eWInQdgUVJLGX7D
 R8NFHrO0E1rjN5y7941z1xdjNryMA+EIp8j/XwcEGD89iPFSehdUBLgfx2Dom092CTKI
 Mrp281wMiprfQy+UgxHCdUaoHR0S3wCSyM34jfhTEHTcOuOAMZQ/ABGxByxpfggMIdPO
 3zP1z1pc7swWWX/9SBLljUiYwjA2AImZjWv793w0NfF173+saELafDvkyq4WYqgs3xBT
 KKuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7pGp/h59g4a5oO3qzs/3HLXwUSrsXiX9152ZJ92SLGk=;
 b=wuHgbnm5dMgfj/rLOlO/NemJaMO/Q6kYS4yyuhQW6iUgnGTYHu8+Cx0l0Bky4I8PB1
 NUHDp7pNF5ff6q1jO9zXM3ORGgfnh8qCGBsj4D2PD7rn/oDToK9qTQIAwcVhFFuIAxtR
 D/v0z8bX3daBPAP2FhLly39ePh13k+9/50kuf61PctWDdvVhL8OEs4ZYgWUNPfvknbJC
 a+JarHKM8VsBZ/nc/j4i8+bl2F0C3pAHDWhGrwmnjuS6IV1o1vhgS+x2MRlt0LUqgWEd
 Uzgqd1+g6FUV4eY3fkmbH9QKysCKFhqEDXcLb9z0MOI0A64q08H3AWcvjzNN0TaipyH7
 nR5Q==
X-Gm-Message-State: AOAM531wxgqM0HB0+KYFxAFkNOZw6bjdnh5jBIOAyCOQjroNH6v7qN7F
 6wNxoNu4e/E3LMJJevBYImEtW5iUTfN2fSr1DeM=
X-Google-Smtp-Source: ABdhPJzjYEyLvPqApCcDGEg8H/BgHlqrCDucE2Y95cH/EUxLISsiRhHpaEXgLtgs62dmuIh+5gfk7HbxUp391VrbkKw=
X-Received: by 2002:a92:6012:0:b0:2bd:fb5f:d627 with SMTP id
 u18-20020a926012000000b002bdfb5fd627mr9840368ilb.86.1650494456877; Wed, 20
 Apr 2022 15:40:56 -0700 (PDT)
MIME-Version: 1.0
References: <20220420080901.14655-1-frank.chang@sifive.com>
In-Reply-To: <20220420080901.14655-1-frank.chang@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 21 Apr 2022 08:40:30 +1000
Message-ID: <CAKmqyKMFWO+aJdAyKviysp7AzhAHnRw2KnqK=7UY6ZvrxZNtBg@mail.gmail.com>
Subject: Re: [PATCH v4 0/4] Support ACLINT 32/64-bit mtimecmp/mtime read/write
 accesses
To: Frank Chang <frank.chang@sifive.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::12c;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x12c.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 20 Apr 2022 22:41:00 -0000

On Wed, Apr 20, 2022 at 6:09 PM <frank.chang@sifive.com> wrote:
>
> From: Frank Chang <frank.chang@sifive.com>
>
> This patchset makes ACLINT mtime to be writable as RISC-V privilege
> spec defines that mtime is exposed as a memory-mapped machine-mode
> read-write register. Also, mtimecmp and mtime should be 32/64-bit memory
> accessible registers. ACLINT reset function is also added, which requires
> mtime to be resetable if we need to support core power-gating feature in
> the future.
>
> This patchset is the updated verion of:
> https://patchew.org/QEMU/20220126095448.2964-1-frank.chang@sifive.com/

Thanks!

Applied to riscv-to-apply.next

Alistair

>
> Changelog:
>
> v4:
>   * Replace the error log mask for invalid 8-byte timecmp_hi and time_hi
>     writes from LOG_UNIMP to LOG_GUEST_ERROR.
>
> v3:
>   * Forbid 8-byte write access to timecmp_hi and time_hi.
>   * Add ACLINT reset function.
>
> v2:
>   * Support 32/64-bit mtimecmp/mtime memory accesses.
>   * Add .impl.[min|max]_access_size declaration.
>
> Frank Chang (3):
>   hw/intc: Add .impl.[min|max]_access_size declaration in RISC-V ACLINT
>   hw/intc: Support 32/64-bit mtimecmp and mtime accesses in RISC-V
>     ACLINT
>   hw/intc: Make RISC-V ACLINT mtime MMIO register writable
>
> Jim Shu (1):
>   hw/intc: riscv_aclint: Add reset function of ACLINT devices
>
>  hw/intc/riscv_aclint.c         | 144 ++++++++++++++++++++++++++-------
>  include/hw/intc/riscv_aclint.h |   1 +
>  target/riscv/cpu.h             |   8 +-
>  target/riscv/cpu_helper.c      |   4 +-
>  4 files changed, 121 insertions(+), 36 deletions(-)
>
> --
> 2.35.1
>
>

