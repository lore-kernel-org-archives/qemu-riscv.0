Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1on8n3-00066T-47
	for mharc-qemu-riscv@gnu.org; Mon, 24 Oct 2022 21:31:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1on8mm-0005zF-VE; Mon, 24 Oct 2022 21:31:35 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1on8mh-00057F-Jz; Mon, 24 Oct 2022 21:31:19 -0400
Received: by mail-pf1-x42d.google.com with SMTP id g16so5068845pfr.12;
 Mon, 24 Oct 2022 18:31:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=X0p5Lhp/Tyf4bCn01XKS87P7rnw9OYV9hJ0M5RywRhc=;
 b=Pmm28HgOQcxY1AC5XuaPSohFEX4k/ulPjImFNj5CgXKVzxxpQfN/veV9gWd5tRGRXt
 aT4WPtIYxWgJ7CjY122yxr581sbgOVIuSoShxEMOqxxpWYOLTecZ292pc9WF0iVqgdpo
 KHfv8KXIZVqYuWck+j5YvdqzuKIBJju0OyLBCZSGet/B+h6Eo0KV82+AZngeEJL9+vs9
 2Pr0BQBgMxFz78b05cJzNgCL83mDwkh6pPFNlw2OCRcLikr5RScUI7aHy62rI9NygWbC
 1wZHjNUEAqqh8JMHPu0jV149rf3D3HhqwcTDaBcuyi2N7GDTPmaPyGbZw7o17fw9jFvK
 Svkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=X0p5Lhp/Tyf4bCn01XKS87P7rnw9OYV9hJ0M5RywRhc=;
 b=l/4WCvmDKz8a8fzQ9fwfXdCN7QDEf+46/wkyZ3hJNZtlDrfbzIVlDTAke+6gDE6/8H
 bg1dI08c0dUyh3PP1wl8CO3PIF1dKLxrvYGQnzHvEudhP+krBfvnRlOVjn6m8meTSx47
 bw4gJ2SVMRywTvscWl0SWYUE9UTznChFB3SAZ7H14SNwVsnRkXc3U2Vq9wgTP594ox23
 6qOgSisnPcfOl4gzqj1XGpdUe/iSGYs/zsWKbkvGEh1OwzEytHarjp16U8ktMw9pP6Dk
 TbF/yd2fHS+8fyk2IvnaTn3hG5y2UMgbhBFr7IbLsT5UBjfWbR9I4c6p0A5jY07B1gml
 IKFw==
X-Gm-Message-State: ACrzQf1WhBnsk86Q9No/KpERaD2s4Vyhb1cFWIQKW2llzlmeGFzpFuOf
 jDW89etZka2MSroAka9/Fj3cMd3K8ZQiRk8dliU=
X-Google-Smtp-Source: AMsMyM6sIUfewicUPomXNGbbyQGiQIc8CZo4tkTptaE1Pi7fw26qXeTfEOPtEkMeXAEO7mJyXOHKHIhmaZf64XZnjk0=
X-Received: by 2002:a63:1a65:0:b0:460:d5db:8688 with SMTP id
 a37-20020a631a65000000b00460d5db8688mr30466788pgm.221.1666661473720; Mon, 24
 Oct 2022 18:31:13 -0700 (PDT)
MIME-Version: 1.0
References: <20221022095821.2441874-1-richard.henderson@linaro.org>
In-Reply-To: <20221022095821.2441874-1-richard.henderson@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 25 Oct 2022 11:30:47 +1000
Message-ID: <CAKmqyKO-GxXDn07T98jpYRd4+VbeAUd8jLq+-Our4z8_B1PuKw@mail.gmail.com>
Subject: Re: [PATCH] tcg/riscv: Fix range matched by TCG_CT_CONST_M12
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, Alistair.Francis@wdc.com, qemu-riscv@nongnu.org, 
 palmer@dabbelt.com, LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=alistair23@gmail.com; helo=mail-pf1-x42d.google.com
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
X-List-Received-Date: Tue, 25 Oct 2022 01:31:36 -0000

On Sat, Oct 22, 2022 at 8:19 PM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> We were matching a signed 13-bit range, not a 12-bit range.
> Expand the commentary within the function and be explicit
> about all of the ranges.
>
> Reported-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Thanks!

Applied to riscv-to-apply.next

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

