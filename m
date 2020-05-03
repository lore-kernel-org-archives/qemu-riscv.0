Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jV6Um-0002kc-Dt
	for mharc-qemu-riscv@gnu.org; Sun, 03 May 2020 00:44:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1jV6Uh-0002iC-DF
 for qemu-riscv@nongnu.org; Sun, 03 May 2020 00:44:47 -0400
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:39619)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1jV6Ug-0002Yf-Ip
 for qemu-riscv@nongnu.org; Sun, 03 May 2020 00:44:47 -0400
Received: by mail-wr1-x443.google.com with SMTP id l18so6087565wrn.6
 for <qemu-riscv@nongnu.org>; Sat, 02 May 2020 21:44:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5oeafdwpi27OG4NG2IUa3kDa3FFg+iOMNPG5+RbDK40=;
 b=qc9TM5LcJ3pMFBDPl8gugv+Hu82LjQqlKdOGTBxiHMBP57RcAr3UarMNf5ENGjsgUU
 T/TedmcdOazCAuermaRpzSJuj+McTDvAPLYzc+zOF8XDuWsukv7239qt0Uoo+qfu7WEc
 fgMcw7SiOSBhxiwYVezv7gus1weiqineEdJmkgnId0F422gkG7wEbdcIicogVF5/7cT6
 /mQpky9nxQ6e+4PpV3HtRsqDWddEGRUGFpq+joseDPbu3jSHG6jZQAEyUk7KdP+NuOaG
 s2uvjnttvanO3F8NlkLqYmNSZ5kYm+WrZwEyIH8M4ovrKYqr/JvsmJIzhMUURdRtfWVE
 Uj9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5oeafdwpi27OG4NG2IUa3kDa3FFg+iOMNPG5+RbDK40=;
 b=Pk1JTC1X8XB8JsLaGQt4QT6J6Oah+OLEWLa5rOPchiufLEQyXB3JjEbgjjJfObfSzJ
 t3Wm8ZxZmwQsNuzjzluFn+FAYc4T5qBX6sixZw/JkWMHbax0YA02VUKJEUutdSAfD5JV
 XSTV7UsQnvIEdYL1Zca+LFf2Nh83+PSNzGjCItGqwrEygVV/8jVekio27MJc3eGuXyHS
 mSPHITW+9xW40bijPUfzRneoxd6CA5BMYZCIwCkFucMNgDMsIJIACzHQ2e9dELaxH1Em
 s6/8FbVOOdSIm0lsUap+pyDi7nSXjTSj4txZMNenADgFCaepTjduIpNzFtLRR1zdwj9N
 a7oA==
X-Gm-Message-State: AGi0Pubrt48XVjA7wDlCxksf+uHw42aWB/4mC4CTXnIj5TafQFlxaLo3
 KyG3xa0ThAb4mZEIbXUlPQOL7fi5bnugsJR9r7VgiA==
X-Google-Smtp-Source: APiQypJ9miBbD2/jF0ixGhtuvEYYv2ENN4XCJeqAU6BOfOmHVKOy/3mR5EcqUnjf0+B9QclXvwf4gbChENNa0cpqWLk=
X-Received: by 2002:a5d:414f:: with SMTP id c15mr3345909wrq.61.1588481085075; 
 Sat, 02 May 2020 21:44:45 -0700 (PDT)
MIME-Version: 1.0
References: <1588348254-7241-1-git-send-email-bmeng.cn@gmail.com>
 <1588348254-7241-6-git-send-email-bmeng.cn@gmail.com>
In-Reply-To: <1588348254-7241-6-git-send-email-bmeng.cn@gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Sun, 3 May 2020 10:14:33 +0530
Message-ID: <CAAhSdy2uH-Dhj5wTWkxmqHHcXB0PGBDw-TXS4w0cdpf3K74A5Q@mail.gmail.com>
Subject: Re: [PATCH 5/5] riscv: Suppress the error report for QEMU testing
 with riscv_find_firmware()
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Palmer Dabbelt <palmerdabbelt@google.com>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 QEMU Developers <qemu-devel@nongnu.org>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>, Bin Meng <bin.meng@windriver.com>, 
 Anup Patel <Anup.Patel@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: none client-ip=2a00:1450:4864:20::443;
 envelope-from=anup@brainfault.org; helo=mail-wr1-x443.google.com
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
X-List-Received-Date: Sun, 03 May 2020 04:44:47 -0000

On Fri, May 1, 2020 at 9:25 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> From: Bin Meng <bin.meng@windriver.com>
>
> We only ship plain binary bios images in the QEMU source. With Spike
> machine that uses ELF images as the default bios, running QEMU test
> will complain hence let's suppress the error report for QEMU testing.
>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
>
> ---
>
>  hw/riscv/boot.c | 14 +++++++++++---
>  1 file changed, 11 insertions(+), 3 deletions(-)
>
> diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
> index b76b2f3..adb421b 100644
> --- a/hw/riscv/boot.c
> +++ b/hw/riscv/boot.c
> @@ -65,9 +65,17 @@ char *riscv_find_firmware(const char *firmware_filename)
>
>      filename = qemu_find_file(QEMU_FILE_TYPE_BIOS, firmware_filename);
>      if (filename == NULL) {
> -        error_report("Unable to load the RISC-V firmware \"%s\"",
> -                     firmware_filename);
> -        exit(1);
> +        if (!qtest_enabled()) {
> +            /*
> +             * We only ship plain binary bios images in the QEMU source.
> +             * With Spike machine that uses ELF images as the default bios,
> +             * running QEMU test will complain hence let's suppress the error
> +             * report for QEMU testing.
> +             */
> +            error_report("Unable to load the RISC-V firmware \"%s\"",
> +                         firmware_filename);
> +            exit(1);
> +        }
>      }
>
>      return filename;
> --
> 2.7.4
>
>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

