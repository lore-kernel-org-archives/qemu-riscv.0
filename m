Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 230D3CAC598
	for <qemu-riscv@archiver.kernel.org>; Tue, 16 Sep 2025 12:06:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uyURJ-0006zm-9F; Tue, 16 Sep 2025 08:05:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1uyURE-0006z0-CD
 for qemu-riscv@nongnu.org; Tue, 16 Sep 2025 08:05:37 -0400
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1uyUR6-0006I0-Ut
 for qemu-riscv@nongnu.org; Tue, 16 Sep 2025 08:05:35 -0400
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-723ad237d1eso48847217b3.1
 for <qemu-riscv@nongnu.org>; Tue, 16 Sep 2025 05:05:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1758024323; x=1758629123; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=O1wTHEjKkT6gso74JJRkO0c9QRHBxGZBBewytwJK3co=;
 b=NjkHxhvbGugBiCsE0Q6FLAatBs/mBwd3m2O6kfBCQUCyOIpNzUTHIdcjeNV95elj1E
 GmjE5A6KNUtZjBQyVREO3ynDepRtztn9STdqHy7AWIkGuBopG5+SLWZg/5Pyp1R2v+hc
 Wf6uapPCxy7MmB/KP9E77e+swHhpZVfpCGhVzUtg1DfRl5RAk8R/Hh17C8prJdM1jVP3
 M6xLA6of7qNHYc0RkePuHuw86BEvBnXbAY0qCMq7HyfRK7NkeUSkO+zFcTDOPzEorCqt
 IhuwuazwRiO54PhLGF0cfMyr7FNS832YAEYq67h1RkiYOqNnfDdX4+Ht5vluh7FW+9TY
 TLtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758024324; x=1758629124;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=O1wTHEjKkT6gso74JJRkO0c9QRHBxGZBBewytwJK3co=;
 b=OFQ7jpp2yBe2Ki7SyzYZfEhNb5/kmYfSkmv/iA03TJDo6TZrFBJxBn7YGr4BfjRSEB
 CNkHEaPu/MwArFf0UkgpnlkL2AtW54O+tvCMiCRQihLtCST/63HHXFTg5VSwsIHlLgCR
 GJ9V6u1f8J+s6AtOIx2kjRqoiB2oJ7Xq8OMvrFRfLEiyUYJwk6xypQ/PLuZvcZ49MjBG
 k/WpcLVzlWr7aIOubjv5ewcxya6/PXjpdbDB8kwv4KB9t4vua71w67A+2lsj8s8WfXca
 BVdnLxlnCfc0FfwaYza7KqSfrUTr1OBdivufvucht3qoFsxnLsajTWLvNA3jr491XiYc
 c53g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVYtjBxx2NZBOpXVSXKrsJDvVnCM5dZbCrXNgZnxRfnQ+6q52BfS/EyNKa88qEfykKX7h7+Z7Lic6sA@nongnu.org
X-Gm-Message-State: AOJu0YyTTk0V9xs+NkLw2tPAaDn5llewToeBCubNRjm21eFjei3XR0H/
 7SVHC/UApudiGTDKoYylcDKe09GlbXeL398dOSxWxsbPNCg1PtoF10re2EKC4VHyzr8=
X-Gm-Gg: ASbGncu7qrWg+bdsdVDvHgi00OCqMxf2733R43ByOt/TbrfD0aeRhYtPNWppqp3Qudd
 HFd6XkfeSrDFcB4to1qp9zvtU+47UB72oyvzoEMgLfwhxQpkMr9lm5GuPfiGvc66eYrhShmwQqL
 f+Y9wmPdDDodrZLm2CkYBx7zrhq0MJL5pZ5Di5H2X3HuBTSheRKvnrNhric+u+W8i6jxB8h+GO4
 JdcjM2oPzK2GyMzIeJGuTZ+rvl0CgHdMrzbUCqChcz9d3mm7wt2qO53hKvO4XzJNO+V6bTvjVIB
 rFkmAjbLivP8gM4c3qde6VUm3DcfnIrqbks0l/Z/wOUSm6p81b0YCukcaj8qVFDniIqkgthiMo/
 QuqA9oQoDDzN85TEV/IdZZVUVCBU8hzzfFgWz8lqN8nJagtPu
X-Google-Smtp-Source: AGHT+IHtZDFYnW9576p1OORnG63/UreHrM/Lyp/leLHi30vS0/ghj9j8E+HG/sfSlQBhbLE7kTgZjw==
X-Received: by 2002:a05:690c:6c91:b0:730:4c94:be14 with SMTP id
 00721157ae682-730631947a2mr141129137b3.18.1758024323495; 
 Tue, 16 Sep 2025 05:05:23 -0700 (PDT)
Received: from [192.168.68.110] ([179.225.245.173])
 by smtp.gmail.com with ESMTPSA id
 00721157ae682-72f791a35bcsm39034557b3.39.2025.09.16.05.05.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Sep 2025 05:05:22 -0700 (PDT)
Message-ID: <7c7a8917-0b98-48e0-90db-8bfd7b13a8cb@ventanamicro.com>
Date: Tue, 16 Sep 2025 09:05:18 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v4 1/3] target/riscv: Add Zvqdotq cfg property
To: Max Chou <max.chou@sifive.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li
 <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 richard.henderson@linaro.org
References: <20250908025117.1728895-1-max.chou@sifive.com>
 <20250908025117.1728895-2-max.chou@sifive.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Content-Language: en-US
In-Reply-To: <20250908025117.1728895-2-max.chou@sifive.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1136;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-yw1-x1136.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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



On 9/7/25 11:51 PM, Max Chou wrote:
> The Zvqdotq extension is the vector dot-product extension of RISC-V.
> 
> Signed-off-by: Max Chou <max.chou@sifive.com>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   target/riscv/cpu.c                | 1 +
>   target/riscv/cpu_cfg_fields.h.inc | 1 +
>   target/riscv/tcg/tcg-cpu.c        | 5 +++++
>   3 files changed, 7 insertions(+)
> 
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index d055ddf462..d0909f7beb 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -187,6 +187,7 @@ const RISCVIsaExtData isa_edata_arr[] = {
>       ISA_EXT_DATA_ENTRY(zvksg, PRIV_VERSION_1_12_0, ext_zvksg),
>       ISA_EXT_DATA_ENTRY(zvksh, PRIV_VERSION_1_12_0, ext_zvksh),
>       ISA_EXT_DATA_ENTRY(zvkt, PRIV_VERSION_1_12_0, ext_zvkt),
> +    ISA_EXT_DATA_ENTRY(zvqdotq, PRIV_VERSION_1_13_0, ext_zvqdotq),
>       ISA_EXT_DATA_ENTRY(zhinx, PRIV_VERSION_1_12_0, ext_zhinx),
>       ISA_EXT_DATA_ENTRY(zhinxmin, PRIV_VERSION_1_12_0, ext_zhinxmin),
>       ISA_EXT_DATA_ENTRY(sdtrig, PRIV_VERSION_1_12_0, debug),
> diff --git a/target/riscv/cpu_cfg_fields.h.inc b/target/riscv/cpu_cfg_fields.h.inc
> index e2d116f0df..5da59c22d6 100644
> --- a/target/riscv/cpu_cfg_fields.h.inc
> +++ b/target/riscv/cpu_cfg_fields.h.inc
> @@ -100,6 +100,7 @@ BOOL_FIELD(ext_zvfbfmin)
>   BOOL_FIELD(ext_zvfbfwma)
>   BOOL_FIELD(ext_zvfh)
>   BOOL_FIELD(ext_zvfhmin)
> +BOOL_FIELD(ext_zvqdotq)
>   BOOL_FIELD(ext_smaia)
>   BOOL_FIELD(ext_ssaia)
>   BOOL_FIELD(ext_smctr)
> diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
> index 78fb279184..7015370ab0 100644
> --- a/target/riscv/tcg/tcg-cpu.c
> +++ b/target/riscv/tcg/tcg-cpu.c
> @@ -767,6 +767,11 @@ void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
>           return;
>       }
>   
> +    if (cpu->cfg.ext_zvqdotq && !cpu->cfg.ext_zve32x) {
> +        error_setg(errp, "Zvqdotq extension requires V or Zve* extensions");
> +        return;
> +    }
> +
>       if ((cpu->cfg.ext_zvbc || cpu->cfg.ext_zvknhb) && !cpu->cfg.ext_zve64x) {
>           error_setg(
>               errp,


