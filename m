Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kwTBD-0006Ji-Gx
	for mharc-qemu-riscv@gnu.org; Mon, 04 Jan 2021 11:58:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frasse.iglesias@gmail.com>)
 id 1kwSHV-0003vv-01; Mon, 04 Jan 2021 11:00:29 -0500
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a]:40265)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frasse.iglesias@gmail.com>)
 id 1kwSHS-0005Xn-TA; Mon, 04 Jan 2021 11:00:28 -0500
Received: by mail-lf1-x12a.google.com with SMTP id m12so65460757lfo.7;
 Mon, 04 Jan 2021 08:00:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=7NHtbq/b4F3O2vUwQ2+EAzuTSWvTaUtcYqWOjaCNidg=;
 b=X3XZDNsrvf1Jxfz4IPWnnrb93QnAyO045zqLYwzKdXAUp4FPaE6eWIM/GqqedHfB/s
 I3BF3cpaP4YQ8S58Ak+wmHEdgRnuDdilQVVvTMeEddF3n8tig2OQkMo0mGy/REwQY6cV
 AONWQj05iZNBNFAsrf8JjifivkJssLv7dAeSKt0Ud5cow0Dnzpl8/+LGFYaiZTsudXVp
 RPRFdXtopNw7H3FILKDuDApGyofoCh4vRYpJf/yGV3bCBvnWqD+ysdgaqOVUGXnoNTdV
 Vxq3txpoZnohLr3OyGcO43tAmX+LqaL6gKztTtkWF1bXpkZXB6tVXorEkUOn5beFOOL6
 XR8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=7NHtbq/b4F3O2vUwQ2+EAzuTSWvTaUtcYqWOjaCNidg=;
 b=hxU4vweffq4/LEjmOuzuWaDEj6+xkMpN9u4TVeojKWrFbYoa7gnBmiFD4UjB7e4P1g
 WlnlqjoyB5UldPvGAVgaV7OTVAgThpWAzEEdvvzQkIwGDwUpC02ckkV5Qwyee6v3zYhl
 gCQ/FjafeW/q9y4SoBr0PpU3FeInd5NODFZHctJN2zFUvzQAEpDPYCst+dXaMTbq2aK2
 7t+fq05FwC5cA7kYgXEq1iCtdHtF4ZAHTbwJxtbc5A4Gv7xqBf5Hjv/DtVFeKaKEWCEt
 LDU5TBqaU3SEpmYGnSPB5gFE23cLkgdQDaMhVOaIMFkZgx9BVC6KghrWw9dqISuqNILB
 3JLA==
X-Gm-Message-State: AOAM533GR06/rWl/XT/5IBpKSdy7SijjjT1EA9Ppfs37DLYCXfpkSk4F
 S103NV7jpeLCJsTKXCCHtPM=
X-Google-Smtp-Source: ABdhPJzC1xIKXvJcL4gNBpuEigswXgAmIEnLu5iGDeZVs+q9KgSuY+j+jn4u/CrRV36IgQBDIgKGlA==
X-Received: by 2002:a2e:b5cb:: with SMTP id g11mr34326846ljn.502.1609776019215; 
 Mon, 04 Jan 2021 08:00:19 -0800 (PST)
Received: from fralle-msi (31-208-27-151.cust.bredband2.com. [31.208.27.151])
 by smtp.gmail.com with ESMTPSA id
 68sm8612142ljj.23.2021.01.04.08.00.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Jan 2021 08:00:18 -0800 (PST)
Date: Mon, 4 Jan 2021 17:00:16 +0100
From: Francisco Iglesias <frasse.iglesias@gmail.com>
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-block@nongnu.org,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Bin Meng <bin.meng@windriver.com>
Subject: Re: [PATCH 01/22] hw/block: m25p80: Add ISSI SPI flash support
Message-ID: <20210104160015.GA26719@fralle-msi>
References: <20201231113010.27108-1-bmeng.cn@gmail.com>
 <20201231113010.27108-2-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201231113010.27108-2-bmeng.cn@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Received-SPF: pass client-ip=2a00:1450:4864:20::12a;
 envelope-from=frasse.iglesias@gmail.com; helo=mail-lf1-x12a.google.com
X-Spam_score_int: -1020
X-Spam_score: -102.1
X-Spam_bar: ---------------------------------------------------
X-Spam_report: (-102.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_WELCOMELIST=-0.01,
 USER_IN_WHITELIST=-100 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 04 Jan 2021 11:58:01 -0500
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
X-List-Received-Date: Mon, 04 Jan 2021 16:00:30 -0000

Hi Bin,

On [2020 Dec 31] Thu 19:29:49, Bin Meng wrote:
> From: Bin Meng <bin.meng@windriver.com>
> 
> This adds the ISSI SPI flash support. The number of dummy cycles in
> fast read, fast read dual output and fast read quad output commands
> is currently using the default 8. Per the datasheet [1], the number
> of dummy cycles configurable, but this is not modeled.
> 
> For flash whose size is larger than 16 MiB, the sequence of 3-byte
> address along with EXTADD bit in the bank address register (BAR) is
> not supported. Currently we assume that guest software will alawys
> use op codes with 4-byte address sequence. Fortunately this is the
> case for both U-Boot and Linux.
> 
> [1] http://www.issi.com/WW/pdf/25LP-WP256.pdf
> 
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> ---
> 
>  hw/block/m25p80.c | 38 +++++++++++++++++++++++++++++++++++++-
>  1 file changed, 37 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
> index 844cabea21..8a62bc4bc4 100644
> --- a/hw/block/m25p80.c
> +++ b/hw/block/m25p80.c
> @@ -411,6 +411,7 @@ typedef enum {
>      MAN_NUMONYX,
>      MAN_WINBOND,
>      MAN_SST,
> +    MAN_ISSI,
>      MAN_GENERIC,
>  } Manufacturer;
>  
> @@ -486,6 +487,8 @@ static inline Manufacturer get_man(Flash *s)
>          return MAN_MACRONIX;
>      case 0xBF:
>          return MAN_SST;
> +    case 0x9D:
> +        return MAN_ISSI;
>      default:
>          return MAN_GENERIC;
>      }
> @@ -705,6 +708,9 @@ static void complete_collecting_data(Flash *s)
>          case MAN_SPANSION:
>              s->quad_enable = !!(s->data[1] & 0x02);
>              break;
> +        case MAN_ISSI:
> +            s->quad_enable = extract32(s->data[0], 6, 1);
> +            break;
>          case MAN_MACRONIX:
>              s->quad_enable = extract32(s->data[0], 6, 1);
>              if (s->len > 1) {
> @@ -897,6 +903,16 @@ static void decode_fast_read_cmd(Flash *s)
>                                      SPANSION_DUMMY_CLK_LEN
>                                      );
>          break;
> +    case MAN_ISSI:
> +        /*
> +         * The fast read instruction code is followed by address bytes and
> +         * dummy cycles, transmitted via the SI line.
> +         *
> +         * The number of dummy cycles are configurable but this is currently
> +         * unmodeled, hence the default value 8 is used.
> +         */
> +        s->needed_bytes += ((8 * 1) / 8);

According to how m25p80 models dummy clock cycles above
means that the command is being modeled with 1 dummy clock cycle (and below is
modeling the dio/qio commands with 1 and 3 dummy clock cycles). To model
the command with 8 dummy clock cycles you only add +8 above (+4 and +6
would be the values to add below). One can look into how one of the other
flashes model the commands for examples. This might also mean that the
controller will need a change and do the opposite what above calculation
does, and convert the dummy bytes into dummy clock cycles (when
transmitting on 1 line it generates 8 dummy clock cycles for each dummy
byte, when it uses 2 lines it generates 4 etc..).

Best regards,
Francisco Iglesias

> +        break;
>      default:
>          break;
>      }
> @@ -936,6 +952,16 @@ static void decode_dio_read_cmd(Flash *s)
>              break;
>          }
>          break;
> +    case MAN_ISSI:
> +        /*
> +         * The fast read dual I/O instruction code is followed by address bytes
> +         * and dummy cycles, transmitted via the IO1 and IO0 line.
> +         *
> +         * The number of dummy cycles are configurable but this is currently
> +         * unmodeled, hence the default value 4 is used.
> +         */
> +        s->needed_bytes += ((4 * 2) / 8);
> +        break;
>      default:
>          break;
>      }
> @@ -976,6 +1002,16 @@ static void decode_qio_read_cmd(Flash *s)
>              break;
>          }
>          break;
> +    case MAN_ISSI:
> +        /*
> +         * The fast read quad I/O instruction code is followed by address bytes
> +         * and dummy cycles, transmitted via the IO3, IO2, IO1 and IO0 line.
> +         *
> +         * The number of dummy cycles are configurable but this is currently
> +         * unmodeled, hence the default value 6 is used.
> +         */
> +        s->needed_bytes += ((6 * 4) / 8);
> +        break;
>      default:
>          break;
>      }
> @@ -1134,7 +1170,7 @@ static void decode_new_cmd(Flash *s, uint32_t value)
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

