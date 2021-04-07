Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lU9Ay-00007r-Av
	for mharc-qemu-riscv@gnu.org; Wed, 07 Apr 2021 10:29:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lU9As-0008TV-Nb; Wed, 07 Apr 2021 10:28:58 -0400
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31]:36568)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lU9Ar-0002TD-6t; Wed, 07 Apr 2021 10:28:54 -0400
Received: by mail-yb1-xb31.google.com with SMTP id 185so14780577ybf.3;
 Wed, 07 Apr 2021 07:28:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dTXlqBakMi7TrH7e1LM2SCr9TWwjf8PIiilBJeHHu5g=;
 b=rA+Cb82nSy9+h6BXsX0GksxnBvyIjDpfdkFQ8VnZ2gvNP2yDAyHAFs5iK9BwawmTb5
 JdfzPcDUT0PzcaQZpXbAfPsgX401mNAXaJ794Ul63dGDCo8+tYsi/aDDPhbV2TVvuGGN
 /ZIP/+lgUIBIDmiHvHYXi2d4QXlEUXvmHctU023VNvGyUuYSKFzMG8ScAjOISC6ehF2N
 zykNZarm4vn/yVxTNKFS+CUgCjyqYSMy14Wpb8Lu94ozniH5KiURw83fnX2kMllmcWP6
 PduD2pVBfnYnfFT28cdBuNgQ1KwYt885CNenQYvLbaOAyuzIHuIeaniDsL0+aSWl8y0y
 kv0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dTXlqBakMi7TrH7e1LM2SCr9TWwjf8PIiilBJeHHu5g=;
 b=lllMMbrkQ9/38Gl/4yibVIZP8ohbkNk0xKHotpahXzUtbLGHRdFMoQ1fdv18jK+Z6c
 tneczzSeqvH2A8ayZfw2iifieiwgUnDl1dh14U0ykDw6yaAZ5XwVz5HBkyQQFz5Aur7v
 Yvkjy2h1/6vlP6+5JTIZrOFauGkolQQbBDm8YVx8S0DaQX3EGkIPzZU8OakCW/caSqzu
 Vw9hE4iqfi+ntak59mO+DQu4gHd9YrBchSbvUyZQ/69E/nxljW1oJ8iPgZmWAskiRy/p
 LXRoADe5aybHEVdhF3x4ZFFuCVFGkrUMHgJVCAi0ZlfRnnX1UZbueNnwvqtoLiZK7gVu
 8VBA==
X-Gm-Message-State: AOAM5314hyfqiHzEXDPicYZ1HNsQYF9zF/IPNYgVIAwOEN02IK9YsQii
 q6Rt6B3gXqaJE65BJnnrdsuWTzyfc0vne4E5nJY=
X-Google-Smtp-Source: ABdhPJznE5dcKIU9VrnkXsFeMprm0XqyHsTgLohtXmpkMtz5B2MYVhhirsHkRvVLGQozIkN4tqZhQAODG+qVGVoG6hQ=
X-Received: by 2002:a25:afca:: with SMTP id d10mr4464367ybj.517.1617805731881; 
 Wed, 07 Apr 2021 07:28:51 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1617367533.git.alistair.francis@wdc.com>
 <169e1a3c65731c9ee5be4d0c394d53d0d8b2655d.1617367533.git.alistair.francis@wdc.com>
In-Reply-To: <169e1a3c65731c9ee5be4d0c394d53d0d8b2655d.1617367533.git.alistair.francis@wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 7 Apr 2021 22:28:40 +0800
Message-ID: <CAEUhbmWimBzPZswfOhNe4s7-68xEJbC6GmEoq6M73tgcES2mOg@mail.gmail.com>
Subject: Re: [PATCH v1 8/8] target/riscv: Add ePMP support for the Ibex CPU
To: Alistair Francis <alistair.francis@wdc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Alistair Francis <alistair23@gmail.com>,
 Ethan.Lee.QNL@gmail.com, weiying_hou@outlook.com, camiyoru@gmail.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b31;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb31.google.com
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
X-List-Received-Date: Wed, 07 Apr 2021 14:28:59 -0000

On Fri, Apr 2, 2021 at 8:50 PM Alistair Francis
<alistair.francis@wdc.com> wrote:
>
> The physical Ibex CPU has ePMP support and it's enabled for the
> OpenTitan machine so let's enable ePMP support for the Ibex CPU in QEMU.
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  target/riscv/cpu.c | 1 +
>  1 file changed, 1 insertion(+)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

