Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81DEDC5B572
	for <qemu-riscv@archiver.kernel.org>; Sun, 16 Aug 2026 15:49:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wvd7H-0002aF-RS; Sun, 16 Aug 2026 11:49:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1wvd7D-0002Zu-S0
 for qemu-riscv@nongnu.org; Sun, 16 Aug 2026 11:49:39 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1wvd7B-0000Bd-Js
 for qemu-riscv@nongnu.org; Sun, 16 Aug 2026 11:49:39 -0400
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-2d58efc7356so1292175ad.1
 for <qemu-riscv@nongnu.org>; Sun, 16 Aug 2026 08:49:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1786895375; x=1787500175; darn=nongnu.org;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=3lc/YXYVyNQukkSpYFLMckwJnPwBfw9sW/bakKCVwuQ=;
 b=mFiDouEmYywLS0TjIpFmqZVU67jie45OlcsBWJrzdXzBGCYAiYLVROz0hJaz86ggXT
 tfbUe42EPQMoJnrR3bxyXnugm+y2/2Qx/4on6MHOefwmrXB92EkKbumSKP6fdmwDi9Fi
 w2eHBKO5bR8iKKB3qmdHW9s6pXhpLhA2/ri91eo3DoF0SGJvOew1maPP8X2rD1PN8vAi
 hiC/OORYqSqpjBjJ5nw9SQVRNnwmKMQzPbv63tVpbDyPN+lbp6m3dreKmWnk2MkK+IMc
 B2Sg3dsfW7L4vSWiPOnc6qKgk0zk/qA7SgeyKUsNpkllinCdNd3K1TMEcdL2q3xtfZxb
 e0gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786895375; x=1787500175;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=3lc/YXYVyNQukkSpYFLMckwJnPwBfw9sW/bakKCVwuQ=;
 b=i9zAkL9/kHZGqsPa99M67noKCxHY7XjWQ8WGSrZF0ePW7gNNdg5u34IkRgQoXDQxVU
 MLz6ams1i7UZpg6nSG/y3ZIygq1zP7QnyAA6GNhmm1S7h0prFCJfG8wkpY95zzpN0cYm
 RII9p3JjoROUhzBy3FM6mCcqUdH8jwZNjD1q73SVanRtRyjGjblvHIPBtZYNuv1IYIHF
 V7T4ixo+kVQtcZONClU8Fdmy+wb6FzevqG3ktD//+M9XSJfSMcvumnoBWV6NC3aRwV0W
 Ck500bkC5MPqygVG4tI3NnZs192xbX10LOsrc311Fi+aXwOCDzsNXuYFaEzTohms7U5n
 ddfg==
X-Forwarded-Encrypted: i=1;
 AHgh+RpRNmXJZN9T663vWaNx4cigNMVFOC0j9DdK5ELpuLYSlcbyUNNhh4gn2ya0ppgwt6qd/D1lXQnKPac8@nongnu.org
X-Gm-Message-State: AOJu0YxZ8R6++eYLs2JQnzaURCxzsG0zQZ4wzWMjdfslNmxMGASlKOhF
 WHwmLoTAIwFUcNQ7+SUXFLbYuVVVsmKSBB/5QpmbjDLo3iF3bpX7CkXWvYpsjf9aUMo=
X-Gm-Gg: AR+sD12+x91H/tk04yebZWaZDjjOLtiPGO2Pr5O0M1LZbhI5ORInGNNwbOS0ZW8/ob4
 /fLBZshYHseOyZS5i/3KnFuzO5EIwnmyzM8R4H/NFEVTQuUZdf8zCIGIqEVXh8shb+n+tbbdOhq
 EFe12RjWDfntE/5P/pfQ/o2tr00uW8AqtQRURPUAsyxuHpsSlp97u/aX0b1YQ4fx5lfbLfNHzbI
 9SVThjXtrJywemTliaZriedR17g0XI6yjFd5pCoLqY5cEEGQVkAIXNeCKDd8c/zPArJBV/bricI
 gfVDzFyXP7ZyxwcJE8o+lkPNbgcvKiKRP3lnVt4J53I9evdq04xKmjlpH1tu9uVQEe8ZM7tCKjo
 v07IAudSnqjZ8WtTOqz/aVLx/kIFI5pCDCMMpHB9BfOXLdTNYICqoA2dYa1qyl/XNpZPdzRdJAa
 2aw3KNecM1AtP+CoTLiYoaeDt+syCUVQFQRPVhO9AErUCmDo0XzVYb1P9I5h35qubKCW6mftetB
 l/UkkyK5Eu6Seo1BiODiZYGnzRPeBIWnLY=
X-Received: by 2002:a17:90b:17d2:b0:381:9028:5945 with SMTP id
 98e67ed59e1d1-3933e60c1damr19032544a91.14.1786895374683; 
 Sun, 16 Aug 2026 08:49:34 -0700 (PDT)
Received: from sifive.com ([136.226.240.165]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-39531e31b8fsm1832531a91.3.2026.08.16.08.49.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Aug 2026 08:49:34 -0700 (PDT)
Date: Sun, 16 Aug 2026 23:49:31 +0800
From: Max Chou <max.chou@sifive.com>
To: Molly Chen <xiaoou@iscas.ac.cn>
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, liwei1518@gmail.com, 
 daniel.barboza@oss.qualcomm.com, zhiwei_liu@linux.alibaba.com,
 chao.liu.zevorn@gmail.com, 
 Chao Liu <chao.liu@processmission.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Subject: Re: [PATCH v2 02/18] target/riscv: Add packed SIMD helper framework
Message-ID: <aoHbEVwVvB9BMSpW@sifive.com>
References: <cover.1784280142.git.xiaoou@iscas.ac.cn>
 <e3775ec9235fa974e9a318edf1836cdaab197e27.1784280142.git.xiaoou@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <e3775ec9235fa974e9a318edf1836cdaab197e27.1784280142.git.xiaoou@iscas.ac.cn>
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=max.chou@sifive.com; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On 2026-07-17 10:06, Molly Chen wrote:
> Signed-off-by: Molly Chen <xiaoou@iscas.ac.cn>
> ---
>  target/riscv/tcg/meson.build    |    3 +-
>  target/riscv/tcg/psimd_helper.c | 1656 +++++++++++++++++++++++++++++++
>  2 files changed, 1658 insertions(+), 1 deletion(-)
>  create mode 100644 target/riscv/tcg/psimd_helper.c
> 
...
>  riscv_system_ss.add(files(
> diff --git a/target/riscv/tcg/psimd_helper.c b/target/riscv/tcg/psimd_helper.c
> new file mode 100644
> index 00000000000..2948bbb2a86
> --- /dev/null
> +++ b/target/riscv/tcg/psimd_helper.c
...
> +#define GEN_PSIMD_VAR_USHLR(NAME, RTYPE, ETYPE, WTYPE, EXTRACT, INSERT,   \
> +                            ELEMS, BITS, SAT_FN)                          \
> +RTYPE HELPER(NAME)(CPURISCVState *env, RTYPE rs1, RTYPE rs2)              \
> +{                                                                         \
> +    RTYPE rd = 0;                                                         \
> +    int elems = ELEMS(rd);                                                \
> +    int sat = 0;                                                          \
> +    int8_t shamt = (int8_t)(rs2 & 0xff);                                  \
> +                                                                          \
> +    for (int i = 0; i < elems; i++) {                                     \
> +        ETYPE e1 = (ETYPE)EXTRACT(rs1, i);                                \
> +        ETYPE res;                                                        \
> +                                                                          \
> +        if (shamt >= 0) {                                                 \
> +            WTYPE shifted = (shamt >= (BITS)) ?                           \
> +                            ((WTYPE)e1 << (BITS)) :                       \
> +                            ((WTYPE)e1 << shamt);                         \
> +            res = SAT_FN(shifted, &sat);                                  \
> +        } else {                                                          \
> +            int right = -shamt;                                           \
> +            if (right > (BITS)) {                                         \
> +                res = 0;                                                  \

Here may has an issue that a rounding right shift past the element
width does not degenerate to zero -- it saturates to the rounding of
the element's MSB.

According to the P ext isa spec:

  "The SSHLR instruction performs an unsigned variable shift of `rs1`
   using the signed shift amount in `rs2[7:0]`. Right shifts are
   rounded, and left shifts saturate to the signed 32-bit range."

    if sshamt < 0:
        // arithmetic right shift with rounding
        x  = zero_extend(64, s1) @ 0b0            // 65-bit
        y  = (sshamt <= -32) ? x[64:32]
                             : (x >> (0 - shamt)[4:0])[32:0]
        X[rd] = (y + 1)[32:1]

The operation Sail code shows that every right shift at or beyond
the element width collapses to the same x[64:32], which is the
element's MSB, and then still gets the (y + 1) >> 1 rounding.
PSSHLR.HS and PSSHLR.WS have the identical construct at the 16- and
32-bit boundaries.

Maybe we could fix it liked:

           } else {                                                          \
               int right = MIN(-shamt, (BITS));                              \
               WTYPE rounded = ((WTYPE)e1 >> (right - 1)) + 1;               \
               res = (ETYPE)(rounded >> 1);                                  \
           }                                                                 \


rnax

> +            } else {                                                      \
> +                WTYPE rounded = ((WTYPE)e1 >> (right - 1)) + 1;           \
> +                res = (ETYPE)(rounded >> 1);                              \
> +            }                                                             \
> +        }                                                                 \

