Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kkAsZ-000795-E5
	for mharc-qemu-riscv@gnu.org; Tue, 01 Dec 2020 13:59:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kkAsY-00078v-3I; Tue, 01 Dec 2020 13:59:58 -0500
Received: from mail-il1-x142.google.com ([2607:f8b0:4864:20::142]:45096)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kkAsW-0008Be-KY; Tue, 01 Dec 2020 13:59:57 -0500
Received: by mail-il1-x142.google.com with SMTP id w8so2704205ilg.12;
 Tue, 01 Dec 2020 10:59:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0bGi9m/M4rZxFjJJOpypxeDjrPAVzqd4MtssdNi2ss8=;
 b=pfS+j64ucbUnAnG7nRMAhyIBYm5D9TK1ms5caty7HtvZVgMfbuhaKeY9pgQZWZDQVN
 dMFuGsF0lo1GilAG1Effqd6cmNMcNSh1Hy1BRnG37ifReh9pkzDNDGSn5381JKpxMJAf
 6YfU0GwwpinCq0v+hRzMJllIdXdAJs4hzPSTQ49P3gk8E0kk4+Q13H4GnHB6g/aj6CR+
 /iz7PKVG7+GUoO0T5cTJIrhx0tI8tQ1AuHzaLbQk9qvUbZeIeqJvscX4DPgZMdIlPB+E
 wCxjkXmGknW2JPaLNdxzdlOE1n7+9mqvVA7wwUJYcA1O7dK8JjLNDTsLMo0Mtkhswu8u
 IJbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0bGi9m/M4rZxFjJJOpypxeDjrPAVzqd4MtssdNi2ss8=;
 b=Rq73e7ImLSUX99jGs7C/SHKedywHHkwsV0MMYwOo39fFqIIuz6eaWckIjOpowYcS9x
 QSwpOAdLiwOQkV2ViO3KvOA//m83aIwS3fOsCuAtsPH011sfKGo5gnUj4CbADJz8KSbj
 4YPnPgomUACD0z9pnzpr0lEZshOqaugYy9NFKGXmYyVlkR4k5ZZaAOI5XHbMo5lrUQV/
 r/ElR68bZ/T47TsQ8h5m9Fpiee2g7gCZZTwYaENxMx0CsERl1cU66AlGdEma4artxqQL
 MQc5ibDNZdJAnqrTwYLvc57LEElxHvMkzlKVOmgKrafy5nRZi9bokULh+q0TnD1ccq1E
 xT6w==
X-Gm-Message-State: AOAM533L5p3mVm/mAZ+bzBW7raE/GT503kQckdeTM5/CGZEPVDEjVTZU
 5wWu/4Fx4TOTsanLaFxY9pqLkg/S88Rc82LPIC8=
X-Google-Smtp-Source: ABdhPJwGB4ATOYqzj41WJMjdgPClJvfw+CVDoBAdylRHUjekA9EBVp2t6lRW2jmH5XL/sVCdFvxXL2SPYvY40HpDzdU=
X-Received: by 2002:a92:5eda:: with SMTP id f87mr4209933ilg.131.1606849195144; 
 Tue, 01 Dec 2020 10:59:55 -0800 (PST)
MIME-Version: 1.0
References: <20201130012810.899-1-jiangyifei@huawei.com>
In-Reply-To: <20201130012810.899-1-jiangyifei@huawei.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 1 Dec 2020 10:47:37 -0800
Message-ID: <CAKmqyKOe2XnNMecs5x1xctGUHHGUdpAOrvxF_LQy6ZbObWDtjA@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: Fix the bug of HLVX/HLV/HSV
To: Yifei Jiang <jiangyifei@huawei.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Zhanghailiang <zhang.zhanghailiang@huawei.com>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, 
 "Zhangxiaofeng (F)" <victor.zhangxiaofeng@huawei.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>, yinyipeng <yinyipeng1@huawei.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, "Wubin (H)" <wu.wubin@huawei.com>, 
 "dengkai (A)" <dengkai1@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::142;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x142.google.com
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
X-List-Received-Date: Tue, 01 Dec 2020 18:59:58 -0000

On Sun, Nov 29, 2020 at 5:37 PM Yifei Jiang <jiangyifei@huawei.com> wrote:
>
> We found that the hypervisor virtual-machine load and store instructions,
> included HLVX/HLV/HSV, couldn't access guest userspace memory.
>
> In the riscv-privileged spec, HLVX/HLV/HSV is defined as follow:
> "As usual when V=1, two-stage address translation is applied, and
> the HS-level sstatus.SUM is ignored."
>
> But get_physical_address() doesn't ignore sstatus.SUM, when HLVX/HLV/HSV
> accesses guest userspace memory. So this patch fixes it.
>
> Signed-off-by: Yifei Jiang <jiangyifei@huawei.com>
> Signed-off-by: Yipeng Yin <yinyipeng1@huawei.com>

Thanks!

Applied to riscv-to-apply.next

Alistair

> ---
>  target/riscv/cpu_helper.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index a2787b1d48..7274f971a4 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -367,7 +367,8 @@ static int get_physical_address(CPURISCVState *env, hwaddr *physical,
>          vm = get_field(env->hgatp, HGATP_MODE);
>          widened = 2;
>      }
> -    sum = get_field(env->mstatus, MSTATUS_SUM);
> +    /* status.SUM will be ignored if execute on background */
> +    sum = get_field(env->mstatus, MSTATUS_SUM) || use_background;
>      switch (vm) {
>      case VM_1_10_SV32:
>        levels = 2; ptidxbits = 10; ptesize = 4; break;
> --
> 2.19.1
>
>

