Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l1waq-0006Px-0U
	for mharc-qemu-riscv@gnu.org; Tue, 19 Jan 2021 14:23:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1l1wak-0006No-5w; Tue, 19 Jan 2021 14:23:03 -0500
Received: from mail-io1-xd2d.google.com ([2607:f8b0:4864:20::d2d]:44971)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1l1wai-00087D-CF; Tue, 19 Jan 2021 14:23:01 -0500
Received: by mail-io1-xd2d.google.com with SMTP id h11so2069966ioh.11;
 Tue, 19 Jan 2021 11:22:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=v5ERVYyeGhwRCaCHSHL7jMgvJ8dP+i0DaQlPTFl+hTM=;
 b=iJDHzWoEepSh6liDvL7lYuk/NTmxWfrP5rJyfYP2vxmLIfB4/SWhVV5sF2DxQTdMBW
 kL+p+lGZlrLAk1paN6efw4NaVHp00wx05ZZUoEQi4UOjxuSkBXZSU2wRmveJcBcqtwRi
 pe3Wt/0b1SlXrGwXiv34tzaPVyGFnWzt2fiNyn8N3bN8SfV1HqE9un4cu77IadFJeNqT
 eWuHF2O4IfeqpfBw7UZX7ewSnBgI/uFduK+yN3wEeOesb1T9Imzk/Wi4+lg2TzhCDL+o
 t3eklpcdvm+96Z7ZBlmHVkufF74uPIW2mSQU4ltw2tH7MoZwgS02oaTW8IaHFpBRdEwf
 VkHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=v5ERVYyeGhwRCaCHSHL7jMgvJ8dP+i0DaQlPTFl+hTM=;
 b=Sd7xZrLl44AvGVgInOu2qPXOSX/BcVnOZmZ+7qHNeAGuTp0wp/qIPEPVogE9QwgYh8
 QPpgnb5sLosJac6CrJaKMpWlGssYuRaXV6ULX6DLHdTfRz4EBpIwBuqkcFfcfzKFD7OK
 XF9xIH+8nWsvcwBP4qZxBQUrJCVnlhf6zW5TnhBK3hDC0fX4Hua2g0Gihbk/j7CQUJWk
 kRwpJzG+tB2rR8xu7jLOTDBAundUZf191t6rdUrhLI0lrI2jXu2nodcyTlLOjODib6c1
 Qpq+dbkcwhpRuaBs2ABjBljPtjbaNbejPP3/NIVEWBdHH18aepeR1QQKsNmk0+VCOrbo
 E4qg==
X-Gm-Message-State: AOAM5338B5DPaeFJqBPZeZiCdfsg/f1YMDysp3SlfHsDLIxfOQmIWiLr
 +EbnGtdxlTAuVOzeGcQMk3gnpDtjv/gHCAPLlUI=
X-Google-Smtp-Source: ABdhPJzFkBoKHnnDw+4RWGLNVhXxTaYNnoBsoet2/0eJJRQvgkzq/ngq6aK/xLh4MLXgY6PzBQHNRYa6CHZQrJFdKJM=
X-Received: by 2002:a92:4b06:: with SMTP id m6mr2679196ilg.177.1611084178008; 
 Tue, 19 Jan 2021 11:22:58 -0800 (PST)
MIME-Version: 1.0
References: <20210112093950.17530-1-frank.chang@sifive.com>
 <20210112093950.17530-21-frank.chang@sifive.com>
In-Reply-To: <20210112093950.17530-21-frank.chang@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 19 Jan 2021 11:22:31 -0800
Message-ID: <CAKmqyKNw0B7L4_pXBQbp1FnvMEWPvAi9MHMk7GNLrcY+yX7k-w@mail.gmail.com>
Subject: Re: [PATCH v6 20/72] target/riscv: rvv-1.0: fix address index
 overflow bug of indexed load/store insns
To: Frank Chang <frank.chang@sifive.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2d;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2d.google.com
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
X-List-Received-Date: Tue, 19 Jan 2021 19:23:05 -0000

On Tue, Jan 12, 2021 at 1:57 AM <frank.chang@sifive.com> wrote:
>
> From: Frank Chang <frank.chang@sifive.com>
>
> Replace ETYPE from signed int to unsigned int to prevent index overflow
> issue, which would lead to wrong index address.
>
> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/vector_helper.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
> index 368259f75a0..9349a36b41b 100644
> --- a/target/riscv/vector_helper.c
> +++ b/target/riscv/vector_helper.c
> @@ -361,10 +361,10 @@ static target_ulong NAME(target_ulong base,            \
>      return (base + *((ETYPE *)vs2 + H(idx)));          \
>  }
>
> -GEN_VEXT_GET_INDEX_ADDR(idx_b, int8_t,  H1)
> -GEN_VEXT_GET_INDEX_ADDR(idx_h, int16_t, H2)
> -GEN_VEXT_GET_INDEX_ADDR(idx_w, int32_t, H4)
> -GEN_VEXT_GET_INDEX_ADDR(idx_d, int64_t, H8)
> +GEN_VEXT_GET_INDEX_ADDR(idx_b, uint8_t,  H1)
> +GEN_VEXT_GET_INDEX_ADDR(idx_h, uint16_t, H2)
> +GEN_VEXT_GET_INDEX_ADDR(idx_w, uint32_t, H4)
> +GEN_VEXT_GET_INDEX_ADDR(idx_d, uint64_t, H8)
>
>  static inline void
>  vext_ldst_index(void *vd, void *v0, target_ulong base,
> --
> 2.17.1
>
>

