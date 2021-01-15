Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l0Y6H-0000gW-8v
	for mharc-qemu-riscv@gnu.org; Fri, 15 Jan 2021 18:01:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1l0Y6A-0000ea-7H; Fri, 15 Jan 2021 18:01:43 -0500
Received: from mail-io1-xd36.google.com ([2607:f8b0:4864:20::d36]:33086)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1l0Y68-0001YF-4c; Fri, 15 Jan 2021 18:01:41 -0500
Received: by mail-io1-xd36.google.com with SMTP id w18so21348318iot.0;
 Fri, 15 Jan 2021 15:01:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JAqdL2ihXXEhBcimvABQG0OYAZOCeuubQD5JUmbXmQw=;
 b=ZTABjc1WdF1SxTsxX+P0BtSdkn135pcvhMEjQWhJ3uW+osEIDlLC7Q1ESanx5Nhsjb
 3EY5IrAbrXTLXo2W8b8+zB/ksV5zQhF++AKGK3I+7xKeS5BbxkP3uFIGS+4y8a+RrRAP
 ETfAL1uXn8aEGzclJ2ex6alHyFS8o4DFxyxi7fHfp2bMicmVr/ZwUjF+asD0lTXePLuX
 1pVukEpdeVFsoiCcHnTg6M4ZIKT/f7m32gWqxOY9WTWYa8GK+7yAUTacdAZbgSGpxWHq
 buW8Isz2LxlACszw0qPmAO/oHYhwBSndQ6howhbb/GW8ATpcc22SdA4sy6em/pbByme+
 Y5yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JAqdL2ihXXEhBcimvABQG0OYAZOCeuubQD5JUmbXmQw=;
 b=QBbXUWRM57iIDf06X3UTko/fJ9DnrX4nj056ymx0tZZAebfWInih7tlVqZNANaCL2M
 TeR+lS7tcjePyi5nYwR/J5tTH+rZzUR0GNeZPNcvd2OcppqMeXb108hU0HWtch/95BRE
 m6PnA7fmgRAS+ZqrvyU3+HFJsFg2rnAWfBac3GofwiKPkeX90T7w2XBDda9bcCmbWsbM
 9W3bKuuI0FzPDYsoq82iqQmDcZYrub4Z7qn/T0Z+UjsyPgz6iwwCoLT9zWfzc3/W2BuA
 oXNHwGgWUISMUwGAgx+71nWer9SdYpf0ZLWtSPcMm8oFc68ZYLWAMWBWU8gcfMiYLp0l
 fxHQ==
X-Gm-Message-State: AOAM532a0TnfxpiM3ds+xVicBFsY69f6jn+TCiiLcZW8eHp9dZ3L/BIr
 JES5AWzpqF89Y78d7TnyQx5FclJqlzkNZIvZBjc=
X-Google-Smtp-Source: ABdhPJyoU6zumRRzKQV+VeKahViHLfTmJekGObTzTjborQEiekDeuOl0Ywjv+yrcYl4eN6U5ANfR9EctNgmp3gbpqvU=
X-Received: by 2002:a5e:850b:: with SMTP id i11mr10129659ioj.42.1610751698628; 
 Fri, 15 Jan 2021 15:01:38 -0800 (PST)
MIME-Version: 1.0
References: <1a4df1b5638d73b64200add175be9d69013418d8.1608401453.git.alistair.francis@wdc.com>
In-Reply-To: <1a4df1b5638d73b64200add175be9d69013418d8.1608401453.git.alistair.francis@wdc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 15 Jan 2021 15:01:10 -0800
Message-ID: <CAKmqyKNN4xdXESgc730CJVKw3BB-QUJ5GVtQZZC9WesSAYWDng@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] linux-user/signal: Decode waitid si_code
To: Alistair Francis <alistair.francis@wdc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bmeng.cn@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d36;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd36.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Fri, 15 Jan 2021 23:01:44 -0000

On Sat, Dec 19, 2020 at 10:11 AM Alistair Francis
<alistair.francis@wdc.com> wrote:
>
> When mapping the host waitid status to the target status we previously
> just used decoding information in the status value. This doesn't follow
> what the waitid documentation describes, which instead suggests using
> the si_code value for the decoding. This results in the incorrect values
> seen when calling waitid. This is especially apparent on RV32 where all
> wait calls use waitid (see the bug case).
>
> This patch uses the si_code value to map the waitid status.
>
> Buglink: https://bugs.launchpad.net/qemu/+bug/1906193
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>

Ping!

Alistair

> ---
>  linux-user/signal.c | 26 ++++++++++++++++++++++++--
>  1 file changed, 24 insertions(+), 2 deletions(-)
>
> diff --git a/linux-user/signal.c b/linux-user/signal.c
> index 73de934c65..b6c9326521 100644
> --- a/linux-user/signal.c
> +++ b/linux-user/signal.c
> @@ -305,6 +305,7 @@ static inline void host_to_target_siginfo_noswap(target_siginfo_t *tinfo,
>      int sig = host_to_target_signal(info->si_signo);
>      int si_code = info->si_code;
>      int si_type;
> +    int status = info->si_status;
>      tinfo->si_signo = sig;
>      tinfo->si_errno = 0;
>      tinfo->si_code = info->si_code;
> @@ -349,8 +350,29 @@ static inline void host_to_target_siginfo_noswap(target_siginfo_t *tinfo,
>          case TARGET_SIGCHLD:
>              tinfo->_sifields._sigchld._pid = info->si_pid;
>              tinfo->_sifields._sigchld._uid = info->si_uid;
> -            tinfo->_sifields._sigchld._status
> -                = host_to_target_waitstatus(info->si_status);
> +
> +            /*
> +             * Map host to target signal numbers for the waitid family of
> +             * syscalls. This is similar to the functionality in
> +             * host_to_target_waitstatus() except we use the si_code to
> +             * determine the operation.
> +             */
> +            switch (info->si_code) {
> +            case CLD_KILLED:
> +            case CLD_DUMPED:
> +                tinfo->_sifields._sigchld._status =
> +                    host_to_target_signal(WTERMSIG(status)) |
> +                                          (status & ~0x7f);
> +                break;
> +            case CLD_STOPPED:
> +                tinfo->_sifields._sigchld._status =
> +                (host_to_target_signal(WSTOPSIG(status)) << 8) |
> +                    (status & 0xff);
> +                break;
> +            default:
> +                tinfo->_sifields._sigchld._status = status;
> +            }
> +
>              tinfo->_sifields._sigchld._utime = info->si_utime;
>              tinfo->_sifields._sigchld._stime = info->si_stime;
>              si_type = QEMU_SI_CHLD;
> --
> 2.29.2
>

