Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hx5tr-0002js-RL
	for mharc-qemu-riscv@gnu.org; Mon, 12 Aug 2019 04:41:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33144)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hx5tp-0002jL-N2
 for qemu-riscv@nongnu.org; Mon, 12 Aug 2019 04:41:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hx5to-00022h-Iz
 for qemu-riscv@nongnu.org; Mon, 12 Aug 2019 04:41:53 -0400
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:35294)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hx5to-00022R-AD
 for qemu-riscv@nongnu.org; Mon, 12 Aug 2019 04:41:52 -0400
Received: by mail-ot1-x343.google.com with SMTP id g17so5087042otl.2
 for <qemu-riscv@nongnu.org>; Mon, 12 Aug 2019 01:41:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=y06vg75D8oXVgYOOQOwaINkYsIizY/RxyFIyjAmugSk=;
 b=ovu2qf6yRQn6xO/MsvaI/m5FRrmPOnFhTVh1AOtQ0fJRJQDEYdzlJvGcI5iy69LmXG
 NyXCVNMMbOac14ADMdValNdCCkceA5t1/vpOx2OtddjB02YxarGBaK/oqygVGKGe57Xn
 02G08M5OIPgcqsllioAMhbMRpXlNNK+SzmBqraGIMlw5XqvRqj9/bdyyNkWlmfXFUM70
 FvMOT9b3cJryb+MK2Kg8q55XBLZz4Vt+7oeHhKQYi7MZzjQ+DyKgtDlowI6gNeRIhpPi
 Qo9A0WV0+JyvIuRKe3rbwN9l9p9/5Xls+7mFxFfPNdmtmGosDubrJ6xycPtCT6fdhbfZ
 4dmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=y06vg75D8oXVgYOOQOwaINkYsIizY/RxyFIyjAmugSk=;
 b=j1lxFj64hSr11u0wmZUggTID+eZFS5fCcWAFeGlK+9iwGto4LqexePnaCnUaID9vFr
 opUCYwUkMxw6HdVOsFv72LmkmB/AYlJiAIcc5V6VaWdeDBOdGSW7TZtjh/47EVfujKKz
 9cSEoQS1IMdCLL1Nf60C+Y2fw1wALarzvp6XEz62U5L7Kby7iV3QSCq8svT8MV2femiY
 DgNr1O9xDRx3lSUsxkUBJN+BXDLdd7FPERTm20HZEpyhZJMfygUdEqPlThB/eMahc5Co
 oA4E/SEHDpcKv64jyLJ8TEZcUQJlMiOlalwu/lxewU13ysyCa7dSLm7g+n/X+3GXjkVt
 kfNA==
X-Gm-Message-State: APjAAAWlC5KcTgZVSRi9ss2Qonfvrf4kZxBXaHeb7yobPY6syWd8jIpi
 cZaM5D/tPOQKlVzRaxQgjsv2VcvHtbOSKQ8pGlimAA==
X-Google-Smtp-Source: APXvYqw6kvvf+WoKMYpt3d/uJBhoG1ZluIie3intfBw5xF65II5FHZ5ydcL24wyolf2AmHqmtJLisZyU03ZyovNeOnI=
X-Received: by 2002:a9d:6a0f:: with SMTP id g15mr29968830otn.135.1565599311566; 
 Mon, 12 Aug 2019 01:41:51 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1563302751.git.alistair.francis@wdc.com>
 <202a2df9cd8e3de2555295446ff1a144eef61eeb.1563302751.git.alistair.francis@wdc.com>
 <mvmwofizw6s.fsf_-_@suse.de>
In-Reply-To: <mvmwofizw6s.fsf_-_@suse.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 12 Aug 2019 09:41:40 +0100
Message-ID: <CAFEAcA_v_qJKVgX8dsxwnGpw1cR5bN_CHAhA=kGbQtXEsa0wSg@mail.gmail.com>
To: Andreas Schwab <schwab@suse.de>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 QEMU Developers <qemu-devel@nongnu.org>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>, Palmer Dabbelt <palmer@sifive.com>,
 Stefan Hajnoczi <stefanha@gmail.co>, Jeff Cody <codyprime@gmail.com>, 
 Anup Patel <anup@brainfault.org>, Stefan Hajnoczi <stefanha@redhat.com>, 
 Alistair Francis <alistair23@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Guenter Roeck <linux@roeck-us.ne>, Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::343
Subject: Re: [Qemu-riscv] [PATCH] roms/Makefile: fix command for
 opensbi64-sifive_u
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
X-List-Received-Date: Mon, 12 Aug 2019 08:41:54 -0000

On Mon, 12 Aug 2019 at 08:20, Andreas Schwab <schwab@suse.de> wrote:
>
> Copy the correct firmware file
>
> Signed-off-by: Andreas Schwab <schwab@suse.de>
> ---
>  roms/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/roms/Makefile b/roms/Makefile
> index dc70fb5aea..775c963f9d 100644
> --- a/roms/Makefile
> +++ b/roms/Makefile
> @@ -183,7 +183,7 @@ opensbi64-sifive_u:
>         $(MAKE) -C opensbi \
>                 CROSS_COMPILE=$(riscv64_cross_prefix) \
>                 PLATFORM="qemu/sifive_u"
> -       cp opensbi/build/platform/qemu/virt/firmware/fw_jump.bin ../pc-bios/opensbi-riscv64-sifive_u-fw_jump.bin
> +       cp opensbi/build/platform/qemu/sifive_u/firmware/fw_jump.bin ../pc-bios/opensbi-riscv64-sifive_u-fw_jump.bin
>
>  clean:
>         rm -rf seabios/.config seabios/out seabios/builds
> --

Hi Andreas; this looks it's the same issue fixed by this patch
from Bin Meng sent last week:
https://patchew.org/QEMU/1564812484-20385-1-git-send-email-bmeng.cn@gmail.com/

thanks
-- PMM

