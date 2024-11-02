Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE380E677F5
	for <qemu-riscv@archiver.kernel.org>; Sat,  2 Nov 2024 13:09:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1t7DsZ-00018l-Gu; Sat, 02 Nov 2024 09:09:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1t7DsW-00018O-LG
 for qemu-riscv@nongnu.org; Sat, 02 Nov 2024 09:09:20 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1t7DsV-0005yI-09
 for qemu-riscv@nongnu.org; Sat, 02 Nov 2024 09:09:20 -0400
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a9a628b68a7so414168766b.2
 for <qemu-riscv@nongnu.org>; Sat, 02 Nov 2024 06:09:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1730552956; x=1731157756; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=p53Yqe0o4ovhrluxG+PhvPic7j9Nshrn+E2Pu8tBI60=;
 b=vNTMNYW1fejXWAq2JjI7A5XnlN29y2++8Yhd0VX7i1ENRNz+h213Wu7trVAflougu8
 a8YoWAHoQ/EG/T35v8qNmno5l3O8DqoyKX3NH0UxftRHuRVoXG5EwNNNPVdkoGW8utHd
 wLN5Ot+SMI3sUMr7/f+s0renVRrhYYrpuq/PPX8E7GiFm83lNsIzzuPMCOEmT/tLxgqS
 AFFNQy7i9fXVr51XhE0P8borsax/TxBktz5ohVc4WDwJuU8F6602s7/xWfYrnD9Ga894
 nPYShKdbkNCV7cgPcaqb7kzqQe0s1YYmj8dStP9BC/Hs3lnOjf3oEpowPxd+SU8HeKxN
 Zzmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730552956; x=1731157756;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=p53Yqe0o4ovhrluxG+PhvPic7j9Nshrn+E2Pu8tBI60=;
 b=LH5cGoSA5BMUYqIPSlCBNB7V+PDefhUUlBeAks6NgmshOMJXnZl9IhziU3/uFUBHJf
 Nd3IYlk6A10DFFpm4oAaPSJK0Q88ma1tz8HPHqiGdWK8z+TEI+FpZ/luIANEBrKLJZTr
 bdIQNASf+ip/pHzLyU1HDHpXEqQxLelSseOp6/Lej+9J+VsL32rCms1Z7Zod+V0kyQJq
 RHaVBlwgwa4P7uvvRlbXU3fZ7Od3uRohtz8CNw2dn8I08LC14tlvCxkTLI/BX8hCa/8C
 kYTvM81UiXGgDki2aKhJt8gQTQG9CmqX9IDUNu4hNCD9OMtmdMM6GIfcAKwIzqfCyfEb
 ECsA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUgdhCxkMMKFjqbOYlT8iL4bKpLmOxUSxjYBguAevh3g1Vg9FuGZdTZM+Q0rOQWTKiUuzC1rC+jbGKk@nongnu.org
X-Gm-Message-State: AOJu0Yx9+OQrzat4svkNGJCB88MJ0sqmm6fEF12djDoDyaDOc21VdR7J
 KqeyE6z28SGtKrjnFuXpKfp9Gy3rOhIOGJp1AuvszwqspszmRzZijPyR6MQvL8orNC8OmBx8VU/
 DrY6zRNEAKLbdMHP/nQO9EePB3fzqdyxHDbcUwA==
X-Google-Smtp-Source: AGHT+IEB2XZHLqeUnjWf1D7vEQIZgyVH+DewcyMbHcjEVRgGz7wJGl3gnfkTuN7y8jznPWD29HQhlHR+br4kPbIHBQk=
X-Received: by 2002:a17:907:3f9f:b0:a9a:55db:85de with SMTP id
 a640c23a62f3a-a9e6548f7acmr555947566b.9.1730552955647; Sat, 02 Nov 2024
 06:09:15 -0700 (PDT)
MIME-Version: 1.0
References: <20241101170833.1074954-1-pierrick.bouvier@linaro.org>
 <2e1af830-a90a-447f-ab47-1c3d49463134@ventanamicro.com>
 <CAFEAcA92CuvGUJQk5LFE1X3a8dH21ksE_QXETjVPnU3v1bVSzw@mail.gmail.com>
 <fd9ee34a-24e1-43fb-950b-aba585473085@ventanamicro.com>
 <CAFEAcA_SYAC_UsEs+xy7aZEHsA1bC0umnsAF5ZmtjmZKEVSA+Q@mail.gmail.com>
 <CAH2o1u4ZAkH-bWN8SRkNj8-n9i3NtJpodopUpQyE=pwO5mKkDw@mail.gmail.com>
 <e23a19e8-3755-4fc3-8789-eca2af97104f@ventanamicro.com>
In-Reply-To: <e23a19e8-3755-4fc3-8789-eca2af97104f@ventanamicro.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 2 Nov 2024 13:09:04 +0000
Message-ID: <CAFEAcA8DKvB_-r7h6O=Sazfjd=HfwRw1S1LsxEY--qAdfg86uQ@mail.gmail.com>
Subject: Re: [PATCH] hw/riscv: fix build error with clang
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: Tomasz Jeznach <tjeznach@rivosinc.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, 
 qemu-devel@nongnu.org, Cleber Rosa <crosa@redhat.com>, qemu-riscv@nongnu.org, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>, 
 Alistair Francis <alistair.francis@wdc.com>, John Snow <jsnow@redhat.com>, 
 Stefano Garzarella <sgarzare@redhat.com>, Thomas Huth <thuth@redhat.com>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Weiwei Li <liwei1518@gmail.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Konstantin Kostiuk <kkostiuk@redhat.com>, Bin Meng <bmeng.cn@gmail.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Alexandre Iooss <erdnaxe@crans.org>, 
 Michael Roth <michael.roth@amd.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On Fri, 1 Nov 2024 at 20:46, Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
> Pierrick, I copied the description of this function from the riscv-isa spec
> and put in a comment. This is how it would look like:
>
> $ git diff
> diff --git a/hw/riscv/riscv-iommu.c b/hw/riscv/riscv-iommu.c
> index feb650549a..969eb56c53 100644
> --- a/hw/riscv/riscv-iommu.c
> +++ b/hw/riscv/riscv-iommu.c
> @@ -183,8 +183,25 @@ static void riscv_iommu_pri(RISCVIOMMUState *s,
>       }
>   }
>
> -/* Portable implementation of pext_u64, bit-mask extraction. */
> -static uint64_t _pext_u64(uint64_t val, uint64_t ext)
> +/*
> + * Discards all bits from 'val' whose matching bits in the same
> + * positions in the mask 'ext' are zeros, and packs the remaining
> + * bits from 'val' contiguously at the least-significant end of the
> + * result, keeping the same bit order as 'val' and filling any
> + * other bits at the most-significant end of the result with zeros.
> + *
> + * For example, for the following 'val' and 'ext', the return 'ret'
> + * will be:
> + *
> + * val = a b c d e f g h
> + * ext = 1 0 1 0 0 1 1 0
> + * ret = 0 0 0 0 a c f g
> + *
> + * This function, taken from the riscv-iommu 1.0 spec, section 2.3.3
> + * "Process to translate addresses of MSIs", is similar to bit manip
> + * function PEXT (Parallel bits extract) from x86.
> + */
> +static uint64_t riscv_iommu_pext_u64(uint64_t val, uint64_t ext)


That looks great, thanks.

-- PMM

