Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nRTWl-0006cL-NU
	for mharc-qemu-riscv@gnu.org; Tue, 08 Mar 2022 01:41:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nRTWj-0006bw-2e; Tue, 08 Mar 2022 01:40:57 -0500
Received: from [2607:f8b0:4864:20::12f] (port=40744
 helo=mail-il1-x12f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nRTWg-0000HB-WD; Tue, 08 Mar 2022 01:40:56 -0500
Received: by mail-il1-x12f.google.com with SMTP id i1so13352260ila.7;
 Mon, 07 Mar 2022 22:40:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jQWWhlj97dz/Glr3McLXROqZ1E1eIQRXyILh7Hl+pMA=;
 b=V6TIuT15ZZVcrKUBnDXibhOWPEYzPhBsUu+rBFd+Mj9FKIdmbtwJryeJ5NH0BW64sh
 Sl+E7lr7/t4Fd95FbHX3yoL2JDkfrHwqLWkoDiYdtHWWxpa9E//zMgO5wG3xyDdTF/tu
 A/fRLYexWa66ApF0zxQfoxraCR/x473lgNSjRE0WZ7gXl77W3vCBJjAJ+ZnxMJIVn2w9
 NaosZ54OTTw6QZx/x6cIlh6PA640/okKKPrNF4Q04MqyNQUr1PkH5q27/SOEBktSHHyi
 VaEqyHAEb3oGW85D2KFjtwnZDx6OoFVkwpXGcAAayZtV3fWD4KvvPYOPO/e/Z4oHfrC5
 XIQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jQWWhlj97dz/Glr3McLXROqZ1E1eIQRXyILh7Hl+pMA=;
 b=KigEZsJ1Typp1oNeHz+p7slarnpx51E7A5WxHqG4KOej69qNToh9HqqrJOzaollLFs
 PoTnrCRb7pUjNmDSOuJzFtZ8YrucAVhe/4O7sAX+C3z3wxY8SFkB9YjXI8/8KuNz3Y+h
 2nyfYOPlzLqL17OJsatoDFmeUrp69mS45qvlseYClpcq+Iky07ozo+4slU5Fw3+r9vue
 iCPyBOdEV8XkB5f4ezsfGxhpNOt2qQ097R6tT++2meoyIUleZSz6gtu5Mm1i5bW0wt+l
 llK25d/dI0Lz+R4lnWkeKhiBLjPgp6jbvy/O7ujITmpvyQEoovu9wZdY0rclWIc1eV1v
 Vtwg==
X-Gm-Message-State: AOAM5315+sI0R+BT0lWm+QaGH8QEOBokE3934dsZ56Jx116VxDHs3aVF
 ZcNmCpTciasLrxAfP+UPzxAbQFoc5IKcSfmV64c=
X-Google-Smtp-Source: ABdhPJzwOHdJIU+BkLakpSmHkcVII7jdwwN+ThJ0+EWeylfAFTOjCHUabbtraY3YcJ6LGBPorGS2hqHXZNZlu45CekA=
X-Received: by 2002:a05:6e02:20ec:b0:2c6:158a:cb33 with SMTP id
 q12-20020a056e0220ec00b002c6158acb33mr14562146ilv.113.1646721652955; Mon, 07
 Mar 2022 22:40:52 -0800 (PST)
MIME-Version: 1.0
References: <35ea2e99-8049-9b72-b639-744afcdde726@redhat.com>
 <tencent_E4219E870165A978DB5BBE50BD53D33D2E06@qq.com>
In-Reply-To: <tencent_E4219E870165A978DB5BBE50BD53D33D2E06@qq.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 8 Mar 2022 16:40:26 +1000
Message-ID: <CAKmqyKOsH=wAm2TWswsP-CUW=YAQ=_gY0YFr_tT7AdfugViJfA@mail.gmail.com>
Subject: Re: [PATCH v2] tests: add (riscv virt) machine mapping to testenv
To: laokz <laokz@foxmail.com>
Cc: hreitz@redhat.com, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, Kevin Wolf <kwolf@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::12f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::12f;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x12f.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.659,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 08 Mar 2022 06:40:58 -0000

On Tue, Mar 8, 2022 at 2:34 PM laokz <laokz@foxmail.com> wrote:
>
> Some qemu-iotests(040 etc) use PCI disk to do test. Without the
> mapping, RISC-V flavor use spike as default machine which has no
> PCI bus, causing test failure.
>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/894
>
> Signed-off-by: Kai Zhang <laokz@foxmail.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
> Thanks for the detailed info. Corrected S-o-b tag.
>
>  tests/qemu-iotests/testenv.py | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/tests/qemu-iotests/testenv.py b/tests/qemu-iotests/testenv.py
> index 0f32897fe8..975f26a785 100644
> --- a/tests/qemu-iotests/testenv.py
> +++ b/tests/qemu-iotests/testenv.py
> @@ -238,6 +238,8 @@ def __init__(self, imgfmt: str, imgproto: str, aiomode: str,
>              ('aarch64', 'virt'),
>              ('avr', 'mega2560'),
>              ('m68k', 'virt'),
> +            ('riscv32', 'virt'),
> +            ('riscv64', 'virt'),
>              ('rx', 'gdbsim-r5f562n8'),
>              ('tricore', 'tricore_testboard')
>          )
> --
> 2.34.1
>
>

