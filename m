Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1on7hN-00049n-08
	for mharc-qemu-riscv@gnu.org; Mon, 24 Oct 2022 20:21:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1on7hL-0003uX-2Y; Mon, 24 Oct 2022 20:21:39 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1on7hJ-0001ve-3a; Mon, 24 Oct 2022 20:21:38 -0400
Received: by mail-pj1-x102a.google.com with SMTP id b11so3248374pjp.2;
 Mon, 24 Oct 2022 17:21:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=maX1Oy5jJ7+la+t1zUdUWBT/4zFHft9He5LgyOV8Cdc=;
 b=NcnvdTe70T2hBnjoTuFJ8CcVPsbURpM1irljCu8u+TvZxmukSBxKi0YB0KiCUk+t9G
 OH2siRZLbBR5BY3/37DxFUnJGmwWAhBoosYtMl58xPxEsR1c65vhvAZzIolbErD5MSQJ
 VZSe2CqzQGkfp0JXtmKFINQOEpejwkYVzubgW41DmXAJOLARW3nT7zPHaMMpGYKQyEEy
 bG+rwglghl0yU8vOQtUg3DYyoiq7Z/qXePHWAlOd64XE6zGfsvZUDNTukyXGFTpxe469
 7/1JA3sAT4NI3LPefXq++F+Igx6CHDwkPMuOEFqfhYSVRSVyQndH2aBL/5odx9Djrr7A
 pkqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=maX1Oy5jJ7+la+t1zUdUWBT/4zFHft9He5LgyOV8Cdc=;
 b=6tguPeTO/WapBDnxumVQUWBxnwNRBefYT/3RBBp2/RTV6+Vxo73nkni/E8GQyUSpct
 VhfMhrveD+YwEW6Au8W6LaFXIZkc9QQN8BWHB61UsLofDL0y/fHqoviVua2MbbbX/nLq
 vVk1Z6Db2SG7pKBEq1ctqfS67AGpleWD9WbcURcpyif/Pp6oBMa4HBFKfAX9mniPPo6w
 5y4T0J2TAO/3YHqS66TflcU0kS3Dd+OgvUVZ3NgiUat1XejtxMG82/UUNqwaHkC+N1XO
 C59MuO6dxCL1cX1CA0jxy3cYo4N9j+CIyroeC006FiYJmzbPIr6YjusSOnCySWOgNKbM
 t/3Q==
X-Gm-Message-State: ACrzQf0l9VobKu696CJ5I+Ip25BzucE8bjGAaAhJzZ+ODbGeGYRefHjh
 gZyg8TgO8TaBijdcv1lpqM+0+SzJYucGG2gqH3U=
X-Google-Smtp-Source: AMsMyM6d4SL0dchraLWKKzMN72ZQ4vACAwOM9xgu/2knFhsDY8Pd3sNJZCjVZOsirB5+7Z3TiDAmUKWoumi+IVsarMs=
X-Received: by 2002:a17:903:32cd:b0:185:5421:a5d6 with SMTP id
 i13-20020a17090332cd00b001855421a5d6mr36206220plr.99.1666657294500; Mon, 24
 Oct 2022 17:21:34 -0700 (PDT)
MIME-Version: 1.0
References: <20221022095821.2441874-1-richard.henderson@linaro.org>
In-Reply-To: <20221022095821.2441874-1-richard.henderson@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 25 Oct 2022 10:21:08 +1000
Message-ID: <CAKmqyKN9+HoAKciyzZYR4ZT4BPmbQHK41pmDv0LbopNywWq+Gw@mail.gmail.com>
Subject: Re: [PATCH] tcg/riscv: Fix range matched by TCG_CT_CONST_M12
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, Alistair.Francis@wdc.com, qemu-riscv@nongnu.org, 
 palmer@dabbelt.com, LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=alistair23@gmail.com; helo=mail-pj1-x102a.google.com
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
X-List-Received-Date: Tue, 25 Oct 2022 00:21:39 -0000

On Sat, Oct 22, 2022 at 8:19 PM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> We were matching a signed 13-bit range, not a 12-bit range.
> Expand the commentary within the function and be explicit
> about all of the ranges.
>
> Reported-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  tcg/riscv/tcg-target.c.inc | 19 ++++++++++++++++---
>  1 file changed, 16 insertions(+), 3 deletions(-)
>
> diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
> index 1cdaf7b57b..2a84c57bec 100644
> --- a/tcg/riscv/tcg-target.c.inc
> +++ b/tcg/riscv/tcg-target.c.inc
> @@ -154,13 +154,26 @@ static bool tcg_target_const_match(int64_t val, TCGType type, int ct)
>      if ((ct & TCG_CT_CONST_ZERO) && val == 0) {
>          return 1;
>      }
> -    if ((ct & TCG_CT_CONST_S12) && val == sextreg(val, 0, 12)) {
> +    /*
> +     * Sign extended from 12 bits: [-0x800, 0x7ff].
> +     * Used for most arithmetic, as this is the isa field.
> +     */
> +    if ((ct & TCG_CT_CONST_S12) && val >= -0x800 && val <= 0x7ff) {
>          return 1;
>      }
> -    if ((ct & TCG_CT_CONST_N12) && -val == sextreg(-val, 0, 12)) {
> +    /*
> +     * Sign extended from 12 bits, negated: [-0x7ff, 0x800].
> +     * Used for subtraction, where a constant must be handled by ADDI.
> +     */
> +    if ((ct & TCG_CT_CONST_N12) && val >= -0x7ff && val <= 0x800) {
>          return 1;
>      }
> -    if ((ct & TCG_CT_CONST_M12) && val >= -0xfff && val <= 0xfff) {
> +    /*
> +     * Sign extended from 12 bits, +/- matching: [-0x7ff, 0x7ff].
> +     * Used by addsub2, which may need the negative operation,
> +     * and requires the modified constant to be representable.
> +     */
> +    if ((ct & TCG_CT_CONST_M12) && val >= -0x7ff && val <= 0x7ff) {
>          return 1;
>      }
>      return 0;
> --
> 2.34.1
>
>

