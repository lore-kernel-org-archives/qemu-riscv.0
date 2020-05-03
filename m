Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jV6Tu-000261-6A
	for mharc-qemu-riscv@gnu.org; Sun, 03 May 2020 00:43:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1jV6Tr-00025E-T3
 for qemu-riscv@nongnu.org; Sun, 03 May 2020 00:43:55 -0400
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:38940)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1jV6Tq-0001H1-0I
 for qemu-riscv@nongnu.org; Sun, 03 May 2020 00:43:55 -0400
Received: by mail-wm1-x342.google.com with SMTP id y24so4925663wma.4
 for <qemu-riscv@nongnu.org>; Sat, 02 May 2020 21:43:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8g/hGzvlBm3Ink4tOyCpTbcpfTtcsIqfNael318WTmQ=;
 b=v+fTyClQR1ZvpqF5YAhgXTPDRmf3JrAdzQYjKMlXZq61ilVPM/DcI7nKwbal63qZe8
 HHlGInpdtJVT6svmhv+FmYkrkpLGB8qOSWXBsfsg+hS8wbg+MJn0s0F7yb+lS1kWPoie
 ZER6aVGr1il9Worr00ogi48yJdr19OTqaPrhYrMMefhsfRQTNoRYLZJ6fcZEYOxuJ9hk
 rPFaIImbfSA3qqDNFMImup4S6wi9jlx0D7MDvomghc0ojesplCAkD9B0TyYRrvHCzrxC
 +yFabnr5P2t5lBipcbJepBXQItQ3R97ebPWQsVC7Dm7jFdDtddT4NQGBa5T7AQ+PKOWC
 0Adw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8g/hGzvlBm3Ink4tOyCpTbcpfTtcsIqfNael318WTmQ=;
 b=fuxX1VpOkRKNy+DlKkiEDUfZTKnjxJ/jWK93MCc4iSs9Tpf4kYTcFVyZVEDFnBCepG
 8ITZjPRdwJHDY2N1Rc+uBiMfHI3vICg0Dv9lMWlBA2k4aIVIjmv6D0807hVMKNVLYBxt
 HwY7nqSq/++6YS2m7b7hBeueOeMQY3dWL8OsXrBHVsEwykxSeFkPp9l8i/dfzQVr2ssQ
 ATnWxFxBaARX6JCA0Ja3fQIqyLtNOTi//2med652AwMR9rKM83MHqHE+tiJbiTISSGaT
 CXL/6BT8FeBZB4imv7yt1/UdkQg7b9V18ej8izSZn2VXWcR5KJ7NSNrfkEeS1SgCEQnU
 Sorw==
X-Gm-Message-State: AGi0PuZY63p4Jrn3UHcyMESONlf0/uzAkE3tY4dOQSq/a4nTk0LppmKE
 VatmWCYCImYPlqYVnKe14PYkshXu1aGc8rMH18SL9g==
X-Google-Smtp-Source: APiQypKWejg2b7B7Jq1yHnzWzEPTyXMR3zhonF90pazMEGrUmeLlLR4ZpDwDfCoyt8ExQ84ytWalB688+iVYlE3nNj4=
X-Received: by 2002:a1c:bd54:: with SMTP id n81mr7325560wmf.141.1588481032645; 
 Sat, 02 May 2020 21:43:52 -0700 (PDT)
MIME-Version: 1.0
References: <1588348254-7241-1-git-send-email-bmeng.cn@gmail.com>
 <1588348254-7241-4-git-send-email-bmeng.cn@gmail.com>
In-Reply-To: <1588348254-7241-4-git-send-email-bmeng.cn@gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Sun, 3 May 2020 10:13:40 +0530
Message-ID: <CAAhSdy1Bap+6v6jfKCKCbeqKaUms0bXNrk-aFB1JAJCKa9v90g@mail.gmail.com>
Subject: Re: [PATCH 3/5] riscv: Use pre-built bios image of generic platform
 for virt & sifive_u
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Palmer Dabbelt <palmerdabbelt@google.com>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 QEMU Developers <qemu-devel@nongnu.org>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>, Bin Meng <bin.meng@windriver.com>, 
 Anup Patel <Anup.Patel@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: none client-ip=2a00:1450:4864:20::342;
 envelope-from=anup@brainfault.org; helo=mail-wm1-x342.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Sun, 03 May 2020 04:43:56 -0000

On Fri, May 1, 2020 at 9:26 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> From: Bin Meng <bin.meng@windriver.com>
>
> Update virt and sifive_u machines to use the opensbi bios image
> built for the generic FDT platform.
>
> Remove the out-of-date no longer used bios images.
>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> ---
>
>  hw/riscv/sifive_u.c                          |   4 ++--
>  hw/riscv/virt.c                              |   4 ++--
>  pc-bios/opensbi-riscv32-generic-fw_jump.bin  | Bin 0 -> 58032 bytes
>  pc-bios/opensbi-riscv32-sifive_u-fw_jump.bin | Bin 49520 -> 0 bytes
>  pc-bios/opensbi-riscv32-virt-fw_jump.bin     | Bin 49504 -> 0 bytes
>  pc-bios/opensbi-riscv64-generic-fw_jump.bin  | Bin 0 -> 66680 bytes
>  pc-bios/opensbi-riscv64-sifive_u-fw_jump.bin | Bin 57936 -> 0 bytes
>  pc-bios/opensbi-riscv64-virt-fw_jump.bin     | Bin 57920 -> 0 bytes
>  8 files changed, 4 insertions(+), 4 deletions(-)
>  create mode 100644 pc-bios/opensbi-riscv32-generic-fw_jump.bin
>  delete mode 100644 pc-bios/opensbi-riscv32-sifive_u-fw_jump.bin
>  delete mode 100644 pc-bios/opensbi-riscv32-virt-fw_jump.bin
>  create mode 100644 pc-bios/opensbi-riscv64-generic-fw_jump.bin
>  delete mode 100644 pc-bios/opensbi-riscv64-sifive_u-fw_jump.bin
>  delete mode 100644 pc-bios/opensbi-riscv64-virt-fw_jump.bin
>
> diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
> index bed10fc..cf015cc 100644
> --- a/hw/riscv/sifive_u.c
> +++ b/hw/riscv/sifive_u.c
> @@ -58,9 +58,9 @@
>  #include <libfdt.h>
>
>  #if defined(TARGET_RISCV32)
> -# define BIOS_FILENAME "opensbi-riscv32-sifive_u-fw_jump.bin"
> +# define BIOS_FILENAME "opensbi-riscv32-generic-fw_jump.bin"
>  #else
> -# define BIOS_FILENAME "opensbi-riscv64-sifive_u-fw_jump.bin"
> +# define BIOS_FILENAME "opensbi-riscv64-generic-fw_jump.bin"
>  #endif
>
>  static const struct MemmapEntry {
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index daae3eb..0c00d93 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -46,9 +46,9 @@
>  #include <libfdt.h>
>
>  #if defined(TARGET_RISCV32)
> -# define BIOS_FILENAME "opensbi-riscv32-virt-fw_jump.bin"
> +# define BIOS_FILENAME "opensbi-riscv32-generic-fw_jump.bin"
>  #else
> -# define BIOS_FILENAME "opensbi-riscv64-virt-fw_jump.bin"
> +# define BIOS_FILENAME "opensbi-riscv64-generic-fw_jump.bin"
>  #endif
>
>  static const struct MemmapEntry {
> diff --git a/pc-bios/opensbi-riscv32-generic-fw_jump.bin b/pc-bios/opensbi-riscv32-generic-fw_jump.bin
> new file mode 100644
> index 0000000..dc39398
> Binary files /dev/null and b/pc-bios/opensbi-riscv32-generic-fw_jump.bin differ
> diff --git a/pc-bios/opensbi-riscv32-sifive_u-fw_jump.bin b/pc-bios/opensbi-riscv32-sifive_u-fw_jump.bin
> deleted file mode 100644
> index 3e0da54..0000000
> Binary files a/pc-bios/opensbi-riscv32-sifive_u-fw_jump.bin and /dev/null differ
> diff --git a/pc-bios/opensbi-riscv32-virt-fw_jump.bin b/pc-bios/opensbi-riscv32-virt-fw_jump.bin
> deleted file mode 100644
> index bc56ed6..0000000
> Binary files a/pc-bios/opensbi-riscv32-virt-fw_jump.bin and /dev/null differ
> diff --git a/pc-bios/opensbi-riscv64-generic-fw_jump.bin b/pc-bios/opensbi-riscv64-generic-fw_jump.bin
> new file mode 100644
> index 0000000..c8f209a
> Binary files /dev/null and b/pc-bios/opensbi-riscv64-generic-fw_jump.bin differ
> diff --git a/pc-bios/opensbi-riscv64-sifive_u-fw_jump.bin b/pc-bios/opensbi-riscv64-sifive_u-fw_jump.bin
> deleted file mode 100644
> index 1acee86..0000000
> Binary files a/pc-bios/opensbi-riscv64-sifive_u-fw_jump.bin and /dev/null differ
> diff --git a/pc-bios/opensbi-riscv64-virt-fw_jump.bin b/pc-bios/opensbi-riscv64-virt-fw_jump.bin
> deleted file mode 100644
> index c62f2b4..0000000
> Binary files a/pc-bios/opensbi-riscv64-virt-fw_jump.bin and /dev/null differ
> --
> 2.7.4
>
>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

