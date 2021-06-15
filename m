Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lsygI-0002dm-5F
	for mharc-qemu-riscv@gnu.org; Mon, 14 Jun 2021 22:19:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lsygG-0002dZ-Pb; Mon, 14 Jun 2021 22:19:56 -0400
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c]:46612)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lsygE-0006rX-4e; Mon, 14 Jun 2021 22:19:56 -0400
Received: by mail-yb1-xb2c.google.com with SMTP id h15so18190185ybm.13;
 Mon, 14 Jun 2021 19:19:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=O9uD6aWKXYltD+g34/3hmlccHRrUA5FZx/9w4qoju58=;
 b=cDySAgQjVJdwhEvP9SsxDcjJ4hVBIVwoiGGCgxLEd9xpMNQPEKPBUDtlAEcEqqEr/J
 tTHkMoMwWJlXl6dE1Y4QXPnuIttZNwnBW15UMOrGNdZo6AOYVsG0oQeXD89K1hpGp64o
 lTOAfeV4dKyHhLY03rwLHZHkLldWoJr3bbExnkGoH4vsWNmIiAUk5AdxkymLvx8zIDrj
 /CSvR0j/F9C60nN89ObY8Mp2wJZE5Zv1ptfRrxptbArUBqrYcKjdrqDPNatVenyiGpmC
 3QCDf3JaUyu8O+tZ5aSgmlbY0hK5B3yrPLSWfcFpHn6ZxfJUSXO6GO2lgHrMToO5cjoD
 z/Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=O9uD6aWKXYltD+g34/3hmlccHRrUA5FZx/9w4qoju58=;
 b=X8ZJzrzDpQ6gtQsRTnPr9dVjrg0rD/Hiv6lzfxmBNmfrDNepBU9Fig0VLwhvGPR4Ux
 Flu55eRiXCbj8joyqws2PsdFyZ1/pwAQeS8QspDyL4squFZnH1s2mRIvnw1Cf3h40qZt
 v+q1g3i4emjnQa36g4omyI30vkFoZh3pYNVJ6Jv+5oS6Z+8p7k+kjoqWNFMC/Zg8mJwK
 VGmxPtdGg8RW1LeaUvAJEnlTgepMx2RVBFdrn8qdfnmpNmoLeWL3B0Gjm3mrbqrQ0zbs
 XodRYOosKsgJxIUmFS25gZYCoFDvlMByG+TIR5kvWw451DGkayHL9L2N0/ltpG6PDpR6
 RPhw==
X-Gm-Message-State: AOAM533L4/Mcu28gUMkker+KCai4ULYqOswIVYtEhRQ8vYzOi/7n0Zt9
 ncrtNOrpW07y1iw1UrxXFItOxsywUa1WhpUNzSA=
X-Google-Smtp-Source: ABdhPJyV64OpUhZclVnVWcmt8JsFJrUlKSRFyekw5IJdsxPAVNzQICNOK+MxOQvhsCIo+1iQrcH1oB4j+VaDhN4b90o=
X-Received: by 2002:a25:b8c:: with SMTP id 134mr29314849ybl.332.1623723592453; 
 Mon, 14 Jun 2021 19:19:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210613141222.548357-1-lukas.juenger@greensocs.com>
 <20210613141222.548357-2-lukas.juenger@greensocs.com>
In-Reply-To: <20210613141222.548357-2-lukas.juenger@greensocs.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Tue, 15 Jun 2021 10:19:41 +0800
Message-ID: <CAEUhbmUXnrXM_-YhjJavG4rDxm1m28XSsQZyd27jeyrNgLELfw@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] hw/char: sifive_uart
To: =?UTF-8?Q?Lukas_J=C3=BCnger?= <lukas.juenger@greensocs.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bin.meng@windriver.com>, mark.burton@greensocs.com, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Alistair Francis <alistair.francis@wdc.com>, luc.michel@greensocs.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2c;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2c.google.com
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
X-List-Received-Date: Tue, 15 Jun 2021 02:19:57 -0000

On Sun, Jun 13, 2021 at 10:12 PM Lukas J=C3=BCnger
<lukas.juenger@greensocs.com> wrote:
>
> Make function names consistent
>
> Signed-off-by: Lukas J=C3=BCnger <lukas.juenger@greensocs.com>
> ---
>  hw/char/sifive_uart.c | 46 ++++++++++++++++++++++---------------------
>  1 file changed, 24 insertions(+), 22 deletions(-)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

