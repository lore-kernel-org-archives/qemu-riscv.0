Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l1uWx-0008Nk-44
	for mharc-qemu-riscv@gnu.org; Tue, 19 Jan 2021 12:11:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1l1uWp-0008Kg-4U; Tue, 19 Jan 2021 12:10:55 -0500
Received: from mail-io1-xd32.google.com ([2607:f8b0:4864:20::d32]:33985)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1l1uWn-0004wQ-5M; Tue, 19 Jan 2021 12:10:50 -0500
Received: by mail-io1-xd32.google.com with SMTP id u17so41109231iow.1;
 Tue, 19 Jan 2021 09:10:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oKBZeEAABl0KX90sbYSnPYn9dh0EVM1k/nQRAM1Nv6A=;
 b=Uh5bHN5w5z6jjlIpNHbdAMAGvIgW+J1VLexJyzvqO0owNrmSqVjEvMcZT3yVS4RwXU
 2z8VEu6G2ztzChc42Iyn1KPV5AKm7aXxnTG3HdawlSeaNAUhIGX3pleXjK75eXJAjaYv
 1rbBobhuIbfmEdtAPg6OWtkaquwgqgT1ML69HaVYKRIPOA+ogeCHsZzRTsOOsPhhTEPI
 v7U4OvtqzPcfTFp1lGPo0Ia3uploUXezPuVjInUC5ej88D5QIlB41QSCbmM9tl0LHFeE
 eKafKoTP+UAaKZ/lUEPduXsMp0N5wNXd5M59Kdhn05Lpi/Jn1asimAnKADoJAmiIaGD+
 a3Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oKBZeEAABl0KX90sbYSnPYn9dh0EVM1k/nQRAM1Nv6A=;
 b=YWZ2WYARJPkyWUBdv+XaquCoPuQkNEkJ58rWlgyA7V3arNCS1+ZLA5f54TPZ7u35NG
 nSMcPKAFXbT6oGVvpSlOgJsnZjCLkOCdpjzJDGFp0yEtAdHhyVGgDF4cE1owOSjbB//J
 Ye1QJSQTbSs1UBmQkADMI2N901p8oGZuDNh/cQ3uKuR96o34K612DuuLfyxe2ryFxxd4
 zxhklIuEeesgGAXCp8/IuhfqxzqidHTOdv3skzbkpe9EZ894YPHnRBO9qobgvv+uGEdL
 0njifjjoBUM3CYjVKUGBm202SBIRj1YmR7e0aDB+NTwATSzSrkdZhCpNNNMKtvWvQ8As
 dvPQ==
X-Gm-Message-State: AOAM530ol1u57+JE+XD71Ioj6ke3o6zVRQP763tlkKker11vqFBKO8ze
 cN7cS3yJjUGKdM4v08qXMOsC1nXvxyHUCXcKE+U=
X-Google-Smtp-Source: ABdhPJyMlFt+DDSRqSshUNHmoBwYrlfbe5nmeFkN2XeGbGOJg5N3izbeQBpvZIRj9AtdQhsLNe9GCh1aXbbnGEKO/z0=
X-Received: by 2002:a92:8455:: with SMTP id l82mr4267049ild.40.1611076247596; 
 Tue, 19 Jan 2021 09:10:47 -0800 (PST)
MIME-Version: 1.0
References: <1611026585-29971-1-git-send-email-bmeng.cn@gmail.com>
In-Reply-To: <1611026585-29971-1-git-send-email-bmeng.cn@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 19 Jan 2021 09:10:21 -0800
Message-ID: <CAKmqyKPCe_M4VvHpz+c=rmNW-591WreLF0jGcc4whypaE-bZOQ@mail.gmail.com>
Subject: Re: [PATCH] hw/misc: sifive_u_otp: Use error_report() when block
 operation fails
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, Green Wan <green.wan@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d32;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd32.google.com
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
X-List-Received-Date: Tue, 19 Jan 2021 17:10:57 -0000

On Mon, Jan 18, 2021 at 7:23 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> From: Bin Meng <bin.meng@windriver.com>
>
> At present when blk_pread() / blk_pwrite() fails, a guest error
> is logged, but this is not really a guest error. Change to use
> error_report() instead.
>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

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

