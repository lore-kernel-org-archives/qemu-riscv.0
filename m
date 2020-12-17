Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kpmr6-0004v6-3L
	for mharc-qemu-riscv@gnu.org; Thu, 17 Dec 2020 01:33:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kpmr3-0004ui-Ti; Thu, 17 Dec 2020 01:33:37 -0500
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36]:45558)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kpmr2-0003Wb-1O; Thu, 17 Dec 2020 01:33:37 -0500
Received: by mail-yb1-xb36.google.com with SMTP id k78so24853865ybf.12;
 Wed, 16 Dec 2020 22:33:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=f3HXvdtwO3Rz3T8qIkIRtlklB+IdDZqls5OxAjD9hgI=;
 b=ab56UwzTYCE6tM5NLM6PCCr47MLlwfmzo9LZEX+Gq0XY1sQijlzkULpAtRPvbWNAXg
 ctybGOJ0VGdg6Oh9LGPbgoI8d8ubKTixMSwMb2xl9rxnC4vsOx3rx7ftSySk2AhnIdHu
 VYjKTjl3R1ugC+USCTujQowoF1jSxBZHw8FcUbt/Sj+Seu0TkcaMmecE80dCTUhbB9aY
 cY9qXs64NkBgEyzeI8r3A9RUC/Ladh7eLRCNAFmBlPT+w7bzUIvXWaFGkIX2l1r0n43o
 1193lhnSResat5esHbSTMvgkLx78ZH0hnae0VqQJpZvBGbMZZNQSEpBVoCxcYhz5FHko
 1T/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=f3HXvdtwO3Rz3T8qIkIRtlklB+IdDZqls5OxAjD9hgI=;
 b=TauIOf1dAd2CTGYnvRTY0v/arjuF+CvAMdhTCbhghzBV1624qnTlWHMVbxxlXcp2Jf
 EuJkbFsEhdyr1yZeMKN+10M/Lg7ZyG0FJeVpYi6YyH5dmMOv1rn3CAI/ReGmRN6EhrBJ
 4uQ8O9ElL13dx5FaR62RpSFlPEMqFWaJmRTEAUnUQyibNC0Qnjrikqa52/cwCRELpBJq
 NM2vlCRkJSLdObdSbthXd6SiFik6y3D4Rxk2g+jA3yv8K2rDGJBLu93xRNcsov76DBfS
 vkGnVvk0maEUlYNvxjk3RthWmf6lguQnv9ABU48ncmyw3agI+Z6xeH9I4F5YDsFRhm/Y
 eemw==
X-Gm-Message-State: AOAM533YA7BhZUIPlMCsie3aa5mozR77Sj/uyc6+ZbHU9j6Hf7Txfuj0
 4FZroF81Z5alKwgZSmTgVtXKGle+HLOqYXC0ZiQ=
X-Google-Smtp-Source: ABdhPJy4rC97aPdLxtSL/cfyZUnGqrlkXAYRIUzfEMdQy6s0dTx1B8S+okP6ynNmygfReCRAhyUaUDHrof9JUHW0fks=
X-Received: by 2002:a25:690b:: with SMTP id e11mr53366779ybc.314.1608186813209; 
 Wed, 16 Dec 2020 22:33:33 -0800 (PST)
MIME-Version: 1.0
References: <cover.1608142916.git.alistair.francis@wdc.com>
 <40d6df4dd05302c566e419be3a1fef7799e57c2e.1608142916.git.alistair.francis@wdc.com>
In-Reply-To: <40d6df4dd05302c566e419be3a1fef7799e57c2e.1608142916.git.alistair.francis@wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 17 Dec 2020 14:33:22 +0800
Message-ID: <CAEUhbmUAwF2R-1-zVZtFTEfWAjSHCaa-UHWbZ5H_NkKGW=UsBQ@mail.gmail.com>
Subject: Re: [PATCH v4 08/16] hw/riscv: sifive_u: Remove compile time XLEN
 checks
To: Alistair Francis <alistair.francis@wdc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Alistair Francis <alistair23@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b36;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb36.google.com
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
X-List-Received-Date: Thu, 17 Dec 2020 06:33:38 -0000

On Thu, Dec 17, 2020 at 2:22 AM Alistair Francis
<alistair.francis@wdc.com> wrote:
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
> Acked-by: Palmer Dabbelt <palmerdabbelt@google.com>
> ---
>  hw/riscv/sifive_u.c | 55 ++++++++++++++++++++++++---------------------
>  1 file changed, 30 insertions(+), 25 deletions(-)
>

Tested with 64-bit sifive_u
Reviewed-by: Bin Meng <bin.meng@windriver.com>
Tested-by: Bin Meng <bin.meng@windriver.com>

32-bit is blocked by:
http://lists.infradead.org/pipermail/linux-riscv/2020-December/003927.html

Regards,
Bin

