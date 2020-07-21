Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jxu1b-0008Ii-IQ
	for mharc-qemu-riscv@gnu.org; Tue, 21 Jul 2020 11:17:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1jxu1Z-0008Gg-MF; Tue, 21 Jul 2020 11:17:45 -0400
Received: from mail-il1-x143.google.com ([2607:f8b0:4864:20::143]:37497)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1jxu1Y-0004be-6Y; Tue, 21 Jul 2020 11:17:45 -0400
Received: by mail-il1-x143.google.com with SMTP id r12so16728908ilh.4;
 Tue, 21 Jul 2020 08:17:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MfWz9fPCOMiUVr2NfsD86HGp8a5prAi545lXtr1QfVY=;
 b=iFo0RCuJdoRqejre4ePjKtToHOHx60CH5aMynuwRZlE5USPjIjTJXCtOeSKQmy+HI/
 7B5GNczqEGg8T4+WngoS6h6TOzeAOxMEoXW7qGIJCY+No/dSF2zZONmW+jfqyBPlom2f
 JhOuVTwYsD0le+cp8sIiNhKTZq/4JVT2KHSiC5mTy6sDaUVVC/l9R4BYUqvod11vvjQ8
 +r/5A3adTuwafZmo2P7WmcwZU9vR/wqZ4HnbPvCnNhb+lkVyCW4+4PrHumpNJu+1sp0t
 ePRV2TiPD+Iy4MoXtO07W/sYryD27PfABlO1xXQDG3TK9joxr4GZXo6jfp2S6leuq0IP
 rbkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MfWz9fPCOMiUVr2NfsD86HGp8a5prAi545lXtr1QfVY=;
 b=V0tW9eURJB/ohM7VZzLEcXOOXrmdNWpcvtmw0YIsLzHs3xZhUycczmrzXhMeiJbieq
 EjRcchspkmPlkMCSIpL/hPJiNkrBPzZWG9XbBsun8oTR+atZgFG6vFzzRr8dwvHa+MMe
 SXXs39u9aJw1LrE8tYkBZbMBsLSdeo5LPXNg6VT8QZ20d5QWTUIN8r3lNv+99fchzYhs
 jE4AJmFdjA57vVK8cpI+pzb7eqswlCBFK4jz6rHDoO1giLlf/Kh9MDwMzSWeeqa6W4Ee
 DTyt+WaLLXcSFMTxJZQzcNx7+0LgrLbwreLCUKvPRCwcyvR99e/gM0bRnK9un/BGWtD3
 5Xkg==
X-Gm-Message-State: AOAM532cO0gWGz++2qgW0td+u3bvWMgUpFtrz+xRPrOkQ9HeV+kq7hEQ
 VfANSzcfxZgBse0XdzuxiSKa9I86cZqu3VgfWAk=
X-Google-Smtp-Source: ABdhPJzdA+tMauiHbKma/mPvIHDcIBBsREg3DpaWhhkv2EeS792Z5icxm6nPrNpQOtVW+exgyhz5j+lhR2eRk98xBo4=
X-Received: by 2002:a92:d186:: with SMTP id z6mr30543774ilz.227.1595344662227; 
 Tue, 21 Jul 2020 08:17:42 -0700 (PDT)
MIME-Version: 1.0
References: <20200721133742.2298-1-zhiwei_liu@c-sky.com>
In-Reply-To: <20200721133742.2298-1-zhiwei_liu@c-sky.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 21 Jul 2020 08:07:36 -0700
Message-ID: <CAKmqyKMPrwkxhXgfWqEofGUdKTJ3jAi7hQ7h6hEP-zFDN3Yt9w@mail.gmail.com>
Subject: Re: [PATCH 1/2] target/riscv: Quiet Coverity complains about vamo*
To: LIU Zhiwei <zhiwei_liu@c-sky.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::143;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x143.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
X-List-Received-Date: Tue, 21 Jul 2020 15:17:46 -0000

On Tue, Jul 21, 2020 at 6:38 AM LIU Zhiwei <zhiwei_liu@c-sky.com> wrote:
>
> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/insn_trans/trans_rvv.inc.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/target/riscv/insn_trans/trans_rvv.inc.c b/target/riscv/insn_trans/trans_rvv.inc.c
> index c0b7375927..7b4752b911 100644
> --- a/target/riscv/insn_trans/trans_rvv.inc.c
> +++ b/target/riscv/insn_trans/trans_rvv.inc.c
> @@ -733,6 +733,7 @@ static bool amo_op(DisasContext *s, arg_rwdvm *a, uint8_t seq)
>              g_assert_not_reached();
>  #endif
>          } else {
> +            assert(seq < ARRAY_SIZE(fnsw));
>              fn = fnsw[seq];
>          }
>      }
> --
> 2.23.0
>
>

