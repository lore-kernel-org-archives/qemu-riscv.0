Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lWaRR-0000UZ-0O
	for mharc-qemu-riscv@gnu.org; Wed, 14 Apr 2021 04:00:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lWaRP-0000RZ-Gb; Wed, 14 Apr 2021 04:00:03 -0400
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33]:36517)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lWaRN-0001ou-Pj; Wed, 14 Apr 2021 04:00:03 -0400
Received: by mail-yb1-xb33.google.com with SMTP id k73so14862905ybf.3;
 Wed, 14 Apr 2021 01:00:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Unn6huXki646aoG7W0XYff+8Zztnqn0TUpHZnzNCtXI=;
 b=SQ0bG0XhpAz/HGH+Gv4sCK4Jh4F71ZNX+wp/bDpRgCZMAlPY/wxTNsJ09ioUwwnJ9Y
 xfFLk0dcZg0UEAPTIXCLnUQrFhh7GOmgP0+bd4K+K7jgZQokoprhM9dI/wck40EiLNRU
 6Q/JU88meX/TOqomSdmYrrNzlzaCZNnGI7NXO6cIkWDJBhwfHlmxbto0+JNKSQeqJUjD
 K6BHp52SFmc/SbGB6rXqs58bAR1torC8CwtVomHDVSVRbvkvyE6EqIEfnqoStGaPnFV9
 8SZKVciwz/FZ2GZ0vhfnvO5F6Kd/ju1gDLCPlfQlH9oJCDkW/OpjAY65bpZUTqqZC8/X
 ylrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Unn6huXki646aoG7W0XYff+8Zztnqn0TUpHZnzNCtXI=;
 b=hdojArq3tpC46CQCX/j//GH7uxHOyAmkRRv9e4LESLlHPKRbaHWNDfgRs4dRLf0hU/
 NXe+L7HoiNRmTs0YNltowydVBD6jZ0J0aKlhSxo27Cqp0cI1zSw7TwMRj3xXIaNHpJ2s
 nxSytT/haNABlVbNfuPcTzbqg2KLj1U9j1gKIldQeiJIm/OYYK8yiloSgkh196g9HWSE
 XZ/Nji7NGEbNrokEfvYHoyyRx266/AtcAwRJVCVpnzYcMYsqx7QHzLl80VHp096ZIWgM
 SVcp0bGzjd5bdUX9g3a/maHCtL7j/FlXkuOYiODFJ/NwDWsL83qhbI2m/CRP1lsRmlN0
 JA7Q==
X-Gm-Message-State: AOAM533AFsziPf/YGEsZ8PecTXk44AbAOQmOliJu/7WZ0ONxpDcTs4DC
 pREcd/WZq0txU4myB1HDLLV3SBpWC3UtWYo8jcw=
X-Google-Smtp-Source: ABdhPJx9i+rH1If9fUz5P0yoeui00Iz/Ym/HFtkzJq6aXVap7NJOwVebjxvML0M4pHOAytVNY5TTZ70WnTJQPrRtMDs=
X-Received: by 2002:a25:bd03:: with SMTP id f3mr26327924ybk.152.1618387200306; 
 Wed, 14 Apr 2021 01:00:00 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1618356725.git.alistair.francis@wdc.com>
 <4d1cd51a6f6330b13af1be5cfd45f98d09b8b850.1618356725.git.alistair.francis@wdc.com>
In-Reply-To: <4d1cd51a6f6330b13af1be5cfd45f98d09b8b850.1618356725.git.alistair.francis@wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 14 Apr 2021 15:59:49 +0800
Message-ID: <CAEUhbmV8e7HbCQw1po5oJPkZR+yN2PxU6L6yRYi=niE3JJGpdg@mail.gmail.com>
Subject: Re: [PATCH v2 3/9] target/riscv: Remove the hardcoded HGATP_MODE macro
To: Alistair Francis <alistair.francis@wdc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Alistair Francis <alistair23@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b33;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb33.google.com
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
X-List-Received-Date: Wed, 14 Apr 2021 08:00:04 -0000

On Wed, Apr 14, 2021 at 7:34 AM Alistair Francis
<alistair.francis@wdc.com> wrote:
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/riscv/cpu_bits.h   | 11 -----------
>  target/riscv/cpu_helper.c | 24 +++++++++++++++---------
>  2 files changed, 15 insertions(+), 20 deletions(-)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

