Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l1wUk-0002kN-Nh
	for mharc-qemu-riscv@gnu.org; Tue, 19 Jan 2021 14:16:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1l1wUi-0002hd-TK; Tue, 19 Jan 2021 14:16:48 -0500
Received: from mail-io1-xd31.google.com ([2607:f8b0:4864:20::d31]:42793)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1l1wUh-00079F-8v; Tue, 19 Jan 2021 14:16:48 -0500
Received: by mail-io1-xd31.google.com with SMTP id z22so15229708ioh.9;
 Tue, 19 Jan 2021 11:16:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ucciB0HleIJwsPx+xIPPym8h3bCgefva4R2zbb6VWiQ=;
 b=nAKFd7eA+/UrN61TvD32MhOHsdmwd2ZZJMuSZclWeanz89jP8rPPWIuaKedjkqrzjJ
 9TcwaNnjaWgFNqlCzQH2oGvjeTxAiyaNOIHQQBsNe4zuwUIfsmNWPtndVkDgkZnoGjHS
 iqNiwBrrvwSPhRdcBL3rzqi+XGfPtCepDA0MLBOnjbhQmKCgAprddWKEOV64N4+wV5fl
 5FumdSCQg/GMR1Cy8MpZ8EWT72DNEOa4UQmL9I13TBs8ux2hiDtUjv5fmAuQzufkLCDw
 m292o+9/YzvxDRySSmBJBRU/UaI9nONt/1dOf9Z6BU62aPB0g6FcLs45unlQFoKEqKsK
 2QyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ucciB0HleIJwsPx+xIPPym8h3bCgefva4R2zbb6VWiQ=;
 b=kv5TiHndgfYqgaCoHg938LBnPZveWrkKFkqt/sdnvcBXNZE0CutAd57xC1v14gmlb0
 r9E+caMINYGyRRtxQFKYXsI7QLRh+4GYBfTnwizig//xod8gwpQ2V7znAO5FPObpBGmR
 zHxSuXjNvh4Y3JmsJEJljEgksQbpwxdZG/S2qlaF8Ct/PCU3vZWKQxpU0cxpwI7foz0z
 82GFwB+wQzvfzD9762WIRtepM8Za/RO1dpwGteZyyxlpf1Izvs5Kqqiiy++Q7z2lNdxV
 HguSDebfBh07KUC1NSn9lP9A+fhOGPzdFli0QbxqDSJahkuh0tj/+mO8UkoYtiloC4hZ
 62EQ==
X-Gm-Message-State: AOAM530aF3U83SQdwD6fIENUlBtgVcqd26rMUsXW5VhzJNgweJdiu/XV
 NLes41FQKZKXPZEzFFvQXvM7Mx3yqJUdQW+ScNA=
X-Google-Smtp-Source: ABdhPJxzIvYca7jxOK8z8DRmucx9vkDfsCUMn9izwmUAA1YB8QM7c/TuGDlZDomnSAsp6V0aSCXhjBROcCpEob2OD18=
X-Received: by 2002:a92:4b06:: with SMTP id m6mr2657647ilg.177.1611083805809; 
 Tue, 19 Jan 2021 11:16:45 -0800 (PST)
MIME-Version: 1.0
References: <1611026585-29971-1-git-send-email-bmeng.cn@gmail.com>
In-Reply-To: <1611026585-29971-1-git-send-email-bmeng.cn@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 19 Jan 2021 11:16:19 -0800
Message-ID: <CAKmqyKP3b29wJGdE7qh7P4n7=PQ8OU4fFRYZSjP+Rv6nDB4FGA@mail.gmail.com>
Subject: Re: [PATCH] hw/misc: sifive_u_otp: Use error_report() when block
 operation fails
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, Green Wan <green.wan@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d31;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd31.google.com
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
X-List-Received-Date: Tue, 19 Jan 2021 19:16:49 -0000

On Mon, Jan 18, 2021 at 7:23 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> From: Bin Meng <bin.meng@windriver.com>
>
> At present when blk_pread() / blk_pwrite() fails, a guest error
> is logged, but this is not really a guest error. Change to use
> error_report() instead.
>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>

Thanks!

Applied to riscv-to-apply.next

Alistair

> ---
>
>  hw/misc/sifive_u_otp.c | 13 +++++--------
>  1 file changed, 5 insertions(+), 8 deletions(-)
>
> diff --git a/hw/misc/sifive_u_otp.c b/hw/misc/sifive_u_otp.c
> index f921c67..4d8f793 100644
> --- a/hw/misc/sifive_u_otp.c
> +++ b/hw/misc/sifive_u_otp.c
> @@ -23,6 +23,7 @@
>  #include "hw/qdev-properties.h"
>  #include "hw/qdev-properties-system.h"
>  #include "hw/sysbus.h"
> +#include "qemu/error-report.h"
>  #include "qemu/log.h"
>  #include "qemu/module.h"
>  #include "hw/misc/sifive_u_otp.h"
> @@ -65,8 +66,7 @@ static uint64_t sifive_u_otp_read(void *opaque, hwaddr addr, unsigned int size)
>
>                  if (blk_pread(s->blk, s->pa * SIFIVE_U_OTP_FUSE_WORD, &buf,
>                                SIFIVE_U_OTP_FUSE_WORD) < 0) {
> -                    qemu_log_mask(LOG_GUEST_ERROR,
> -                                  "read error index<%d>\n", s->pa);
> +                    error_report("read error index<%d>", s->pa);
>                      return 0xff;
>                  }
>
> @@ -169,8 +169,7 @@ static void sifive_u_otp_write(void *opaque, hwaddr addr,
>                  if (blk_pwrite(s->blk, s->pa * SIFIVE_U_OTP_FUSE_WORD,
>                                 &s->fuse[s->pa], SIFIVE_U_OTP_FUSE_WORD,
>                                 0) < 0) {
> -                    qemu_log_mask(LOG_GUEST_ERROR,
> -                                  "write error index<%d>\n", s->pa);
> +                    error_report("write error index<%d>", s->pa);
>                  }
>              }
>
> @@ -260,15 +259,13 @@ static void sifive_u_otp_reset(DeviceState *dev)
>          serial_data = s->serial;
>          if (blk_pwrite(s->blk, index * SIFIVE_U_OTP_FUSE_WORD,
>                         &serial_data, SIFIVE_U_OTP_FUSE_WORD, 0) < 0) {
> -            qemu_log_mask(LOG_GUEST_ERROR,
> -                          "write error index<%d>\n", index);
> +            error_report("write error index<%d>", index);
>          }
>
>          serial_data = ~(s->serial);
>          if (blk_pwrite(s->blk, (index + 1) * SIFIVE_U_OTP_FUSE_WORD,
>                         &serial_data, SIFIVE_U_OTP_FUSE_WORD, 0) < 0) {
> -            qemu_log_mask(LOG_GUEST_ERROR,
> -                          "write error index<%d>\n", index + 1);
> +            error_report("write error index<%d>", index + 1);
>          }
>      }
>
> --
> 2.7.4
>
>

