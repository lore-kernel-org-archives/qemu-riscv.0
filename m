Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1npjc8-0003jd-Nm
	for mharc-qemu-riscv@gnu.org; Sat, 14 May 2022 00:42:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1npjc7-0003j3-29
 for qemu-riscv@nongnu.org; Sat, 14 May 2022 00:42:47 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:38700)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1npjc1-0005HL-FP
 for qemu-riscv@nongnu.org; Sat, 14 May 2022 00:42:46 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 1-20020a05600c248100b00393fbf11a05so7899053wms.3
 for <qemu-riscv@nongnu.org>; Fri, 13 May 2022 21:42:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NGa8/lAVruqRrohx6drAhUywLz78+FcuUKt7Zac+oMk=;
 b=F+bi5uioQ6NBAXVZTOmxugE7cDf0OwPBZz1g7eeLZcGoEcK0VWl1a8ED3nxcP6styd
 mpXkznjLdFYaUBSXl2N6HH6tfpdtj4SBO1RtGFj5o7/8LGAyCJPijVmiltsgG1RE9Yh2
 LFR/d1IUbYugUbn6QrYZaxA4N6wqAXXl3sHqJRQRZ8IxYSVja9+9/ITmbeczsiFBwwtG
 KXzLIBLU6hhG2iXDU/RP+IpeQz2q8f8NDhqEbV0nCxKSUAUGoAyEkKoAjV3vPn4tyOny
 MIVxvGPAKe04FP0/BO3+80Nv1wPxXz4s1VAjKehbdEJlAR7k/JVqjuv0aOLam/bK6XoA
 qK+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NGa8/lAVruqRrohx6drAhUywLz78+FcuUKt7Zac+oMk=;
 b=IflQ+zFdJfgUXB2xwBo7VkfOfAIOXOnTMoZamNNL/97FYtGpLBYUxkc+1dt9Q5FUSx
 ulIzL91OhG5phO/pU9pl0/IyU/dyVJAdwVv7g2x1Q6GPuGBfqhKYcpYjcNtm8qj2i7id
 /PAwknbSb9o8xfqNIPUNcaDgzDbTEY4Yv9yL9WNMfqr6NCw3g3YMXObW+kTBbQQrKUKO
 ttYT4/rq/taaJZrqGj6LUHzeBipjX7Fydw+478WhAj2o4HkeFGMvXxhd2lgmj2X0TeZL
 aFR21+qRp7GGdTJEx+l8AZrz/xBayTylBBu/q0SCi06yPa6B5b3MiVU25cLM2fv3o9zo
 Z8TQ==
X-Gm-Message-State: AOAM53318exhITL9HEcgW2M1K3P5oFvLcK76jycYFHugRaynPMAJE5Xg
 UciOrMsc5pW/zj5QqMYDqK/M3RgWLi+Hl+SOZ+L/Yw==
X-Google-Smtp-Source: ABdhPJyYSqWSgsHWVnO0WFpF+Bgz/YLH/pg3TX49qJCNL7H+s16mPOHfV491YoowaIr4jZVLfaWm64knCBtWQyLHA1M=
X-Received: by 2002:a05:600c:5113:b0:394:800c:4c36 with SMTP id
 o19-20020a05600c511300b00394800c4c36mr7412564wms.93.1652503358874; Fri, 13
 May 2022 21:42:38 -0700 (PDT)
MIME-Version: 1.0
References: <20220513221458.1192933-1-atishp@rivosinc.com>
In-Reply-To: <20220513221458.1192933-1-atishp@rivosinc.com>
From: Anup Patel <anup@brainfault.org>
Date: Sat, 14 May 2022 10:12:27 +0530
Message-ID: <CAAhSdy1pJXrxgsCgUFnVZenSXLpcf8CPSS7x39nv1-StZLgRKA@mail.gmail.com>
Subject: Re: [PATCH] hw/intc: Pass correct hartid while updating mtimecmp
To: Atish Patra <atishp@rivosinc.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>, dylan@rivosinc.com,
 Bin Meng <bmeng.cn@gmail.com>, 
 Frank Chang <frank.chang@sifive.com>, Jim Shu <jim.shu@sifive.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: none client-ip=2a00:1450:4864:20::32a;
 envelope-from=anup@brainfault.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Sat, 14 May 2022 04:42:47 -0000

On Sat, May 14, 2022 at 3:45 AM Atish Patra <atishp@rivosinc.com> wrote:
>
> timecmp update function should be invoked with hartid for which
> timecmp is being updated. The following patch passes the incorrect
> hartid to the update function.
>
> Fixes: e2f01f3c2e13 ("hw/intc: Make RISC-V ACLINT mtime MMIO register writable")
>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  hw/intc/riscv_aclint.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/hw/intc/riscv_aclint.c b/hw/intc/riscv_aclint.c
> index 0412edc98257..e6bceceefdbc 100644
> --- a/hw/intc/riscv_aclint.c
> +++ b/hw/intc/riscv_aclint.c
> @@ -233,7 +233,8 @@ static void riscv_aclint_mtimer_write(void *opaque, hwaddr addr,
>                  continue;
>              }
>              riscv_aclint_mtimer_write_timecmp(mtimer, RISCV_CPU(cpu),
> -                                              i, env->timecmp);
> +                                              mtimer->hartid_base + i,
> +                                              env->timecmp);
>          }
>          return;
>      }
> --
> 2.25.1
>
>

