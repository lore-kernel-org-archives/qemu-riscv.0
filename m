Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l5ELr-000635-9p
	for mharc-qemu-riscv@gnu.org; Thu, 28 Jan 2021 15:57:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1l5ELo-00062e-Si; Thu, 28 Jan 2021 15:57:13 -0500
Received: from mail-io1-xd2a.google.com ([2607:f8b0:4864:20::d2a]:47100)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1l5ELj-0008FM-Hq; Thu, 28 Jan 2021 15:57:10 -0500
Received: by mail-io1-xd2a.google.com with SMTP id u8so1958855ior.13;
 Thu, 28 Jan 2021 12:57:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ClwL21SYCczby0fzdeouhZvRnuLjLSW68RlEDZnH/Z4=;
 b=QOW2NCaAU8wwg+x3yUu2RWFy+kkMwitApJLbicr0bcf+p12tneweMlbv5QVjfCFyz5
 ztaq0pUO4GP/7JtmKX97BiNMN+mlk53fqha7u/5sqxShmAChfPs428Yqf92wU5gCQguD
 uoSpcY89kZnA2APN7Nu9azj50LWbbIM7O0L7dRJx4CYl3c+meDIEB23AKWonV8sn8lKP
 pKHRyGjiDx13T7ua49ZJrzYxRg/R9P4rriz2yFfQEaDVkradGY3Gcf+9McpPZAiW3H0M
 sOM1R8kUQtoLqEwMOQNYXZVR8ZaCLfn+es5/4aXPXlC2y8fmmRjrVRH1I0GdYW48O+zk
 NI4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ClwL21SYCczby0fzdeouhZvRnuLjLSW68RlEDZnH/Z4=;
 b=EUodjehTi+82vdJifQuqJk1Bgnn84nyJ1NqdLp2Sfqw+QizBo60NIQwcJP1EB6FjmP
 OKLWdjQy0Ntlr8xLh87vYVqU8+LgAwBCm/+KsnSk9+QY4CCkgAIiF0PTEaShHNTcBNuA
 cz34eHl9BuuamvKVv+vVidUyxWfKE+qMzvoq44DkpxRfBJoscNMxR6/hbh9dhyGUj0zh
 BcoKeBlT05H9+diJqnYC8YxVb8dxlQ/0b/XYtAYen2kUdXDxgX/YHiS2fkZmKwfXdfVf
 0V9Ayy25Pv5j651jq3QUZz1uwL/OQBJD/Pc1jZNJ2hn7bi4DspXuhzFBuky1YbHgaLtc
 zyYA==
X-Gm-Message-State: AOAM5300K9WafYZYuwsLfF/E7jBTDuc3KWGTumPoYPesia2Jpw8Hskvd
 Q8sZpxEyPBtMExUrq8gWxJuhPHmuFvVHnRzV93Q=
X-Google-Smtp-Source: ABdhPJxkuSP6oHmqNPzrRvgKAwOhZ1rMaNS64n9eMZql7jn4iqE/lP3EM+cjppH8YY/Cky4Ysv7q/RF2RsoVwfgxwRc=
X-Received: by 2002:a02:3b6c:: with SMTP id i44mr1035319jaf.91.1611867425548; 
 Thu, 28 Jan 2021 12:57:05 -0800 (PST)
MIME-Version: 1.0
References: <20210126060007.12904-1-bmeng.cn@gmail.com>
 <20210126060007.12904-2-bmeng.cn@gmail.com>
In-Reply-To: <20210126060007.12904-2-bmeng.cn@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 28 Jan 2021 12:56:39 -0800
Message-ID: <CAKmqyKN0=fqbsxEpsNJ7uJzG1YWnDH5EL+HFUTYZ0CDi9txdog@mail.gmail.com>
Subject: Re: [PATCH v3 1/9] hw/block: m25p80: Add ISSI SPI flash support
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Bin Meng <bin.meng@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2a;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2a.google.com
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
X-List-Received-Date: Thu, 28 Jan 2021 20:57:13 -0000

On Mon, Jan 25, 2021 at 10:01 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> From: Bin Meng <bin.meng@windriver.com>
>
> This adds the ISSI SPI flash support. The number of dummy cycles in
> fast read, fast read dual output and fast read quad output commands
> is currently using the default 8. Likewise, the same default value
> is used for fast read dual/quad I/O command. Per the datasheet [1],
> the number of dummy cycles is configurable, but this is not modeled
> at present.
>
> For flash whose size is larger than 16 MiB, the sequence of 3-byte
> address along with EXTADD bit in the bank address register (BAR) is
> not supported. We assume that guest software always uses op codes
> with 4-byte address sequence. Fortunately, this is the case for both
> U-Boot and Linux spi-nor drivers.
>
> QPI (Quad Peripheral Interface) that supports 2-cycle instruction
> has different default values for dummy cycles of fast read family
> commands, and is unsupported at the time being.
>
> [1] http://www.issi.com/WW/pdf/25LP-WP256.pdf
>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

>
> ---
>
> (no changes since v2)
>
> Changes in v2:
> - Mention QPI (Quad Peripheral Interface) mode is not supported
>
>  hw/block/m25p80.c | 44 +++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 43 insertions(+), 1 deletion(-)
>
> diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
> index b744a58d1c..217c130f56 100644
> --- a/hw/block/m25p80.c
> +++ b/hw/block/m25p80.c
> @@ -412,6 +412,7 @@ typedef enum {
>      MAN_NUMONYX,
>      MAN_WINBOND,
>      MAN_SST,
> +    MAN_ISSI,
>      MAN_GENERIC,
>  } Manufacturer;
>
> @@ -487,6 +488,8 @@ static inline Manufacturer get_man(Flash *s)
>          return MAN_MACRONIX;
>      case 0xBF:
>          return MAN_SST;
> +    case 0x9D:
> +        return MAN_ISSI;
>      default:
>          return MAN_GENERIC;
>      }
> @@ -706,6 +709,9 @@ static void complete_collecting_data(Flash *s)
>          case MAN_SPANSION:
>              s->quad_enable = !!(s->data[1] & 0x02);
>              break;
> +        case MAN_ISSI:
> +            s->quad_enable = extract32(s->data[0], 6, 1);
> +            break;
>          case MAN_MACRONIX:
>              s->quad_enable = extract32(s->data[0], 6, 1);
>              if (s->len > 1) {
> @@ -895,6 +901,19 @@ static void decode_fast_read_cmd(Flash *s)
>                                      SPANSION_DUMMY_CLK_LEN
>                                      );
>          break;
> +    case MAN_ISSI:
> +        /*
> +         * The Fast Read instruction code is followed by address bytes and
> +         * dummy cycles, transmitted via the SI line.
> +         *
> +         * The number of dummy cycles is configurable but this is currently
> +         * unmodeled, hence the default value 8 is used.
> +         *
> +         * QPI (Quad Peripheral Interface) mode has different default value
> +         * of dummy cycles, but this is unsupported at the time being.
> +         */
> +        s->needed_bytes += 1;
> +        break;
>      default:
>          break;
>      }
> @@ -934,6 +953,16 @@ static void decode_dio_read_cmd(Flash *s)
>              break;
>          }
>          break;
> +    case MAN_ISSI:
> +        /*
> +         * The Fast Read Dual I/O instruction code is followed by address bytes
> +         * and dummy cycles, transmitted via the IO1 and IO0 line.
> +         *
> +         * The number of dummy cycles is configurable but this is currently
> +         * unmodeled, hence the default value 4 is used.
> +         */
> +        s->needed_bytes += 1;
> +        break;
>      default:
>          break;
>      }
> @@ -974,6 +1003,19 @@ static void decode_qio_read_cmd(Flash *s)
>              break;
>          }
>          break;
> +    case MAN_ISSI:
> +        /*
> +         * The Fast Read Quad I/O instruction code is followed by address bytes
> +         * and dummy cycles, transmitted via the IO3, IO2, IO1 and IO0 line.
> +         *
> +         * The number of dummy cycles is configurable but this is currently
> +         * unmodeled, hence the default value 6 is used.
> +         *
> +         * QPI (Quad Peripheral Interface) mode has different default value
> +         * of dummy cycles, but this is unsupported at the time being.
> +         */
> +        s->needed_bytes += 3;
> +        break;
>      default:
>          break;
>      }
> @@ -1132,7 +1174,7 @@ static void decode_new_cmd(Flash *s, uint32_t value)
>
>      case RDSR:
>          s->data[0] = (!!s->write_enable) << 1;
> -        if (get_man(s) == MAN_MACRONIX) {
> +        if (get_man(s) == MAN_MACRONIX || get_man(s) == MAN_ISSI) {
>              s->data[0] |= (!!s->quad_enable) << 6;
>          }
>          if (get_man(s) == MAN_SST) {
> --
> 2.25.1
>
>

