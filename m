Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lThAw-0007J6-Kl
	for mharc-qemu-riscv@gnu.org; Tue, 06 Apr 2021 04:35:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lThAn-0007DS-M5; Tue, 06 Apr 2021 04:34:59 -0400
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30]:37401)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lThAk-0007Nc-SJ; Tue, 06 Apr 2021 04:34:57 -0400
Received: by mail-yb1-xb30.google.com with SMTP id l187so9138632ybl.4;
 Tue, 06 Apr 2021 01:34:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7m5O4pIrW+zmF7aecJ6Le3KWJTS5I5qIwn8E6o+gZHo=;
 b=nWQKjWMdaM37J10yH9M+RHFla55h4jurtbxtuAkLSyyGIu0JSKX4KiJTEVY+kQQU0w
 4XtGO/4KmCdsjnCyK7KmPJEbYLf38y6kM9jA78Q0hlv8jeuOo1Y444CnAebXwcUzs4PR
 USBECRb8KK+6f0oK8NI7lkzvy2BqK2ExlpcLpyoJsIelphW7b+OI8F8yyWfF5Jj8RJPM
 +fFbvk5VdNZhF0/a/O9Zk9ku6WipqIYA1hmQhr5XzqKdQFPgoWTK1XyIV7KKH7xrUCHk
 rAeqkUU0ErPc7Fng3xk4tL16F8YprvcEHUH6lTha9agrrj+yR46zyLJ0yw3lq+17IB2F
 saig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7m5O4pIrW+zmF7aecJ6Le3KWJTS5I5qIwn8E6o+gZHo=;
 b=Ot76QPhp+7iEC6ItcyRoUEBHTkhmw/ZbvdfbGpLhGGKTHlu9suQmKiGqLtgYWsZ9gW
 kmAFt2SXLNcenc1VNw9N2vfD8dP8hWg8jX2TPDliFHBjIxkvJ6rTPLjl44evnFG/uLCG
 wbzy0Tf342OpACCcRymE2f1Gu/02zMBxJOgDOqm94MfoZl9EdW0Kg3Fx/daPB9V3tP0M
 CgjEMeH4tyTE0mHhyAKCG6YJLQuvHOLmdBmD/jpNycH3aoHTvS07lxrypUziCeRI2RZ0
 T2ms1B2jbOXHTNW6PBxjhQBM6EwDUqBzShMoEPKykXggLugjcnhDBNuBSaWtt903Joqj
 otBg==
X-Gm-Message-State: AOAM533YsIRNkAXIMWlsuX/O5s5qAuF1rDWSEb+O3oplgRelvPierdlU
 uBjhVuD8XK3j5eVjISQw0S5fAXvQX0eoktlV/9Q=
X-Google-Smtp-Source: ABdhPJxRUbRn8xsJfrMKUjI/Amk1seLbmOJyo2dk51xWkXwhw08lAtggkTRr1nzV9E69dXInRp1M3t6/rl7JC7kbUi4=
X-Received: by 2002:a25:d645:: with SMTP id n66mr42441850ybg.122.1617698093505; 
 Tue, 06 Apr 2021 01:34:53 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1617290165.git.alistair.francis@wdc.com>
 <302b208f40373557fa11b351b5c9f43039ca8ea3.1617290165.git.alistair.francis@wdc.com>
In-Reply-To: <302b208f40373557fa11b351b5c9f43039ca8ea3.1617290165.git.alistair.francis@wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Tue, 6 Apr 2021 16:34:42 +0800
Message-ID: <CAEUhbmX9C-ytcR7qfVjtdHB7BHCZF48DmpTYfR2-+_P2q3rKoQ@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] target/riscv: Use RISCVException enum for CSR
 access
To: Alistair Francis <alistair.francis@wdc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Alistair Francis <alistair23@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b30;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb30.google.com
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
X-List-Received-Date: Tue, 06 Apr 2021 08:35:00 -0000

On Thu, Apr 1, 2021 at 11:19 PM Alistair Francis
<alistair.francis@wdc.com> wrote:
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  target/riscv/cpu.h       | 11 +++++++----
>  target/riscv/csr.c       | 37 ++++++++++++++++++-------------------
>  target/riscv/gdbstub.c   |  8 ++++----
>  target/riscv/op_helper.c | 18 +++++++++---------
>  4 files changed, 38 insertions(+), 36 deletions(-)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

