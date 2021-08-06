Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mBpdR-0003dO-Vo
	for mharc-qemu-riscv@gnu.org; Thu, 05 Aug 2021 22:30:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mBpdQ-0003d7-Mk; Thu, 05 Aug 2021 22:30:56 -0400
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e]:43616)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mBpdP-0002Aj-3I; Thu, 05 Aug 2021 22:30:56 -0400
Received: by mail-yb1-xb2e.google.com with SMTP id z128so12495901ybc.10;
 Thu, 05 Aug 2021 19:30:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4yn6SjV3xwgtOOtZ3g1cfEvueIldTk/ZmJurx6DzPh8=;
 b=YTBZPY4OoozLn8hoBPmaJLVH0Wt4Zdh+Wf1x1SwlPb17zSmC8F5qtHTGtLmsQlG/3L
 /jNwM0TV+6PoA6Fm8RbTmphnpMLTNlsOTYQFl/+co+ocLWXWXdmdSOS3y0bfWwF7YoP/
 UUozDaY1JUJmX0Hae4Zr4szW88z6UDM7ljF9YQMI6QegsuQC//UvmeechEJPArKGNbmr
 G0aIz2BcQOJwz+jgHspqzF5Ivbp8esJUR11L8ZvH6li8IVhP0xeBr8hxvb25rRwCPNmh
 1pMzsad2nyXXH5Nz6wfQcqoK9eyf8OMwyp6ks/HsRe3KIQ8899nBFQbZJAHxAeZeatWU
 4x/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4yn6SjV3xwgtOOtZ3g1cfEvueIldTk/ZmJurx6DzPh8=;
 b=HA8bs9xPGlafd0Vr7mLkKmNItAUoToLKXx9V5eZsqBdWltcdyuhnIIPQeTPUGN8Gpb
 ltAeSTBZkJVLsMjb3GcuIgDE8thZEinWqNAqoTB0zdFUewdpDs+BttwhOoBDkMxFc0ef
 wkdR4UXV+nRkLmdrGdIYl8OSsX9KqhPZ7BX4nNtLSPR+5B3RzN9brtzDtkVpvuv1jiFp
 au+Sc1j1dFOFAZnzkCPtrA/ZlWBUR4ywSKH+TEnp0+ga0Uttqaz69x2ZJ5MurGR72EmE
 iIqpbzQ7LElPg1aJtKz6XovHCjeuRv+0QY8CKqM7YdmAgy6GvBoFuU68CEucP5zdn7UY
 4NMA==
X-Gm-Message-State: AOAM532/9InjHCJL0HqsvhBFBO6IhBsStoa0eDIEvfftOcbbCEpQ44nv
 E0ZvpBiNRi4YHFMH+QRftLXnOrVnmtI/3ASN+cY=
X-Google-Smtp-Source: ABdhPJyOH7iSeYLhPAxtpf2bcJwCKmMWi8fafVui/OY/TiMdITZn1PvBv0GHrCKVRZm8KcmGtsWRsTtpiYtOObX6WLs=
X-Received: by 2002:a5b:304:: with SMTP id j4mr9900141ybp.314.1628217053655;
 Thu, 05 Aug 2021 19:30:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210724122407.2486558-1-anup.patel@wdc.com>
 <20210724122407.2486558-5-anup.patel@wdc.com>
In-Reply-To: <20210724122407.2486558-5-anup.patel@wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 6 Aug 2021 10:30:42 +0800
Message-ID: <CAEUhbmUMkGtsC0V7kz22_0h4Ku2xStankcfhEVS5ywnuRpFtBQ@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] hw/riscv: virt: Add optional ACLINT support to
 virt machine
To: Anup Patel <anup.patel@wdc.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Atish Patra <atish.patra@wdc.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Anup Patel <anup@brainfault.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2e;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2e.google.com
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
X-List-Received-Date: Fri, 06 Aug 2021 02:30:56 -0000

On Sat, Jul 24, 2021 at 8:27 PM Anup Patel <anup.patel@wdc.com> wrote:
>
> We extend virt machine to emulate ACLINT devices only when "aclint=on"
> parameter is passed along with machine name in QEMU command-line.
>
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> ---
>  hw/riscv/virt.c         | 113 +++++++++++++++++++++++++++++++++++++++-
>  include/hw/riscv/virt.h |   2 +
>  2 files changed, 114 insertions(+), 1 deletion(-)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

Please add a "Machine-specific options" in the Virt documentation.

See sifive_u example @
https://qemu.readthedocs.io/en/latest/system/riscv/sifive_u.html#machine-specific-options

Regards,
Bin

