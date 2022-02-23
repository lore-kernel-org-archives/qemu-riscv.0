Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nMlO0-0000Jy-R7
	for mharc-qemu-riscv@gnu.org; Wed, 23 Feb 2022 01:44:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1nMlNx-0000HO-BF
 for qemu-riscv@nongnu.org; Wed, 23 Feb 2022 01:44:26 -0500
Received: from [2a00:1450:4864:20::42c] (port=37689
 helo=mail-wr1-x42c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1nMlNv-00040E-6m
 for qemu-riscv@nongnu.org; Wed, 23 Feb 2022 01:44:24 -0500
Received: by mail-wr1-x42c.google.com with SMTP id d28so10158729wra.4
 for <qemu-riscv@nongnu.org>; Tue, 22 Feb 2022 22:44:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HpQ6Uq/fRTVdqVXz+QpJO36cY9eJmY/BvWw+xYmzHMs=;
 b=HOi57t2nu1a2RfYGlLua0iIw4Jjrn9HpR219LI7GLbNenhlSPsXpDRQKCYGMBIHrzq
 PPmRAYj211QMfWxke3Yw/641W06SAc0aqM6dwuenmFtfEv7UZS/B0fM+UginbXyW+YrQ
 BRiJAfhCp4Lp+UDARUjGhU9zrp5DiGMIUwemQ7DSIf4FiDiJfR9YcP1fhrF3pvQOFw2L
 Mo3u4/yRBmVzEC3Fbg1md4DIg/QVBdeuCblKh6b676FB+4qB0B3pxkttdxDUxQmsd8bb
 E102mLU4jzeoWe/gLZJuKTk1IPthKfyK7fDiMkG82DGTNqvx3gXUIPISkw2efzbTvj/V
 FwlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HpQ6Uq/fRTVdqVXz+QpJO36cY9eJmY/BvWw+xYmzHMs=;
 b=FzE8tpO/BnCI1qvfe5qmkSUZm9oJR1gV5FDJDruxgh2moQ46IKbIFC5AbW9iTlfjO3
 rKRikwquI98e/e6hQYGb7WCWaiSkeOtPLlekfrmhNEaPZCwzm3K6Qsouq9f9g3IqxWBG
 FcL7zJMiD03mpDVN3xC2wl5v3JYnkzO+QvHXMpl9oVQEkEBoovpXWTkyi7QXMSCv3HI3
 rz7ShgDOqJpmIeWbdFkLFFHI/GdwXb8tlLogIgbheglnTXMY4Jrys+AUkh22O+2bpB+k
 UCa89Sdtn8HWG473BaDkrwxwShcEsZ1DczB1y2f8WD77MC6rnCsPYNasf5pGGabLleCS
 N5YQ==
X-Gm-Message-State: AOAM532ugdnsM0IG2gUI4uCxmCr+8g3C1eGlFriby8WXYFt/pWpHwhzr
 W93RX+uqyO3N7Zr2PD4bIcLJx8xW0LcQ954ZLYgAlQ==
X-Google-Smtp-Source: ABdhPJz9KtJ5xNzftce4Bvy2YNTMON+d3essYwuoGw2X2XbCe8esYCcDIMpdlBp4vLmt/l/aiJwAbLxcizYJzWKn3dw=
X-Received: by 2002:a05:6000:11c5:b0:1ed:9e98:20b0 with SMTP id
 i5-20020a05600011c500b001ed9e9820b0mr2337563wrx.214.1645598658064; Tue, 22
 Feb 2022 22:44:18 -0800 (PST)
MIME-Version: 1.0
References: <20220222223830.2319856-1-atishp@rivosinc.com>
In-Reply-To: <20220222223830.2319856-1-atishp@rivosinc.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 23 Feb 2022 12:14:05 +0530
Message-ID: <CAAhSdy0rW-UGUaeTcMYLjLn-197stWbNiF8xAh9WusSzVhjXOw@mail.gmail.com>
Subject: Re: [PATCH v3] target/riscv: Add isa extenstion strings to the device
 tree
To: Atish Patra <atishp@rivosinc.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Heiko Stubner <heiko@sntech.de>, Bin Meng <bin.meng@windriver.com>, 
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42c
 (failed)
Received-SPF: none client-ip=2a00:1450:4864:20::42c;
 envelope-from=anup@brainfault.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-List-Received-Date: Wed, 23 Feb 2022 06:44:28 -0000

On Wed, Feb 23, 2022 at 4:09 AM Atish Patra <atishp@rivosinc.com> wrote:
>
> The Linux kernel parses the ISA extensions from "riscv,isa" DT
> property. It used to parse only the single letter base extensions
> until now. A generic ISA extension parsing framework was proposed[1]
> recently that can parse multi-letter ISA extensions as well.
>
> Generate the extended ISA string by appending  the available ISA extensions
> to the "riscv,isa" string if it is enabled so that kernel can process it.
>
> [1] https://lkml.org/lkml/2022/2/15/263
>
> Suggested-by: Heiko Stubner <heiko@sntech.de>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
> Changes from v2->v3:
> 1. Used g_strconcat to replace snprintf & a max isa string length as
> suggested by Anup.
> 2. I have not included the Tested-by Tag from Heiko because the
> implementation changed from v2 to v3.
>
> Changes from v1->v2:
> 1. Improved the code redability by using arrays instead of individual check
> ---
>  target/riscv/cpu.c | 29 +++++++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index b0a40b83e7a8..2c7ff6ef555a 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -34,6 +34,12 @@
>
>  /* RISC-V CPU definitions */
>
> +/* This includes the null terminated character '\0' */
> +struct isa_ext_data {
> +        const char *name;
> +        bool enabled;
> +};
> +
>  static const char riscv_exts[26] = "IEMAFDQCLBJTPVNSUHKORWXYZG";
>
>  const char * const riscv_int_regnames[] = {
> @@ -881,6 +887,28 @@ static void riscv_cpu_class_init(ObjectClass *c, void *data)
>      device_class_set_props(dc, riscv_cpu_properties);
>  }
>
> +static void riscv_isa_string_ext(RISCVCPU *cpu, char **isa_str, int max_str_len)
> +{
> +    char *old = *isa_str;
> +    char *new = *isa_str;
> +    int i;
> +    struct isa_ext_data isa_edata_arr[] = {
> +        { "svpbmt", cpu->cfg.ext_svpbmt   },
> +        { "svinval", cpu->cfg.ext_svinval },
> +        { "svnapot", cpu->cfg.ext_svnapot },
> +    };
> +
> +    for (i = 0; i < ARRAY_SIZE(isa_edata_arr); i++) {
> +        if (isa_edata_arr[i].enabled) {
> +            new = g_strconcat(old, "_", isa_edata_arr[i].name, NULL);
> +            g_free(old);
> +            old = new;
> +        }
> +    }
> +
> +    *isa_str = new;
> +}
> +
>  char *riscv_isa_string(RISCVCPU *cpu)
>  {
>      int i;
> @@ -893,6 +921,7 @@ char *riscv_isa_string(RISCVCPU *cpu)
>          }
>      }
>      *p = '\0';
> +    riscv_isa_string_ext(cpu, &isa_str, maxlen);
>      return isa_str;
>  }
>
> --
> 2.30.2
>
>

