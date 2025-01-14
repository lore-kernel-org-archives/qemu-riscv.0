Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1483DC02183
	for <qemu-riscv@archiver.kernel.org>; Tue, 14 Jan 2025 15:28:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tXiq3-0007YU-QA; Tue, 14 Jan 2025 10:28:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1tXiq1-0007Xt-EO
 for qemu-riscv@nongnu.org; Tue, 14 Jan 2025 10:28:17 -0500
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1tXipz-0003aq-Ij
 for qemu-riscv@nongnu.org; Tue, 14 Jan 2025 10:28:16 -0500
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-aaef00ab172so897088766b.3
 for <qemu-riscv@nongnu.org>; Tue, 14 Jan 2025 07:28:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1736868494; x=1737473294; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=hTt1SkbW6w1cR4jr5NAjL59CkFA1v4Ig3bkZdeFFJ1U=;
 b=l4c3IJFXvSwoOip8/UV0o9dX1tjR/5Jg1qy+eyt3TrG5yraBPKT37hUjg8lLAqx2wv
 XkWcvgy7zemx/xtwaPlTWXxb1NqgQuLKowIZq4ZrAXllhjFpIVQ6DlTq9NDQEY8x3daq
 S1/tW3VsfgmmWXbyuF/YL8UBxw5nzvAaad9pD238Qlhl/R8JicZVMNK6fYThHgArgUC1
 oD5wAc+uQaEvR70OoHEdaYlAYzCiZX7ISDFX2m7BIgf/KRCWpRxYuyhtWlHqfB9VNOMV
 Iok10QmmNkkoQZ2FF+lntDcIQldNkrMqzA+TluJpBZnxE9HtoTL/dakg2DKGBo+Boi6X
 U/IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736868494; x=1737473294;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hTt1SkbW6w1cR4jr5NAjL59CkFA1v4Ig3bkZdeFFJ1U=;
 b=nPLai6OnZRgndZrmvla+ivxdbfxvu2d090utAReGahLN0hgqFj3M3e80UtE4FnHMb6
 Su/r7ob84odZg8VBc5NtfTZWWeCm4HPmM5HANkjAGoqUktFaFLzlaRKLJ9HBfovxKvZu
 BILgShILdxDuqcEcGfrE7LTP8zdQ/BK9+SgKlz+OAyVFdY/dsXzeq563i5VvsftUahsJ
 Pd60NA3l/JSyWeYbnGAyutTizRWbtBKod9dPDnNtlvQQTVLhLjJNpLOZlnewT245hyVr
 E6D9Xv3wa66GvCfjzTGlpW2ZExfLc9SYlyYedMufJLvTu70ofqTH6gThPVrK51ETOSia
 73XQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV+gRLFsy/z/dB55sHRJ/ce4G7qDzm7SplMSOG3jipWtK5BUaei1kMzF+XzJ86VW4Tc4RpG9gu48sEW@nongnu.org
X-Gm-Message-State: AOJu0Ywg6Gr8gg+tYIGpVeMT5++3xspjwBgr/LKSQWz0GDVEREUQZeJk
 mDxGt7byu5pnLEgu4lQUhFhyJMvQUaf2BJaM06TRZsvc2ArqHMzKjbdCN46QZnU=
X-Gm-Gg: ASbGncvTnZJlEyokV30B+jMT2IJ92q5cN/BtRCHVus27KNKjpgZIk18FLmrMEi8lkDV
 h9/+5pT1eaCUfx5qNa/fjE0aqmDkP7Av0VxoIL8X9s4HBrhEFGZ5b6OEUvkT6Uh8OmbE2FG5U7O
 xROXCielrix2VwbBN8bQQnVpzrKgixHuCVTZXndEq26CQ1HzTB4b34/cogTjTpo5QTYbh3H1Ar0
 3LOBclJoefSgweJGuCJNy6D7Y4xVOZvT+/yL3J0pCBMVnuohrfZDF7RaGV26bDCIyb+D6QB+W7V
 oy6zKGEbAJ+JtgtCrS8YX8A2A26OBiCxJHpprjf/Eg==
X-Google-Smtp-Source: AGHT+IFrvCaujikuxUoUvlAh5Kx1WCCojAdOmgX00IgmaxLrYw8+C6yCacc45u1Adpy8KGPaNAqpRA==
X-Received: by 2002:a05:6402:2105:b0:5d0:81f5:a398 with SMTP id
 4fb4d7f45d1cf-5d972e00056mr55599514a12.1.1736868489275; 
 Tue, 14 Jan 2025 07:28:09 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz.
 [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab2c90da0f0sm651816466b.52.2025.01.14.07.28.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jan 2025 07:28:08 -0800 (PST)
Date: Tue, 14 Jan 2025 16:28:08 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Jason Chien <jason.chien@sifive.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bmeng.cn@gmail.com>, Weiwei Li <liwei1518@gmail.com>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Subject: Re: [PATCH 2/2] hw/riscv/riscv-iommu-bits: Remove redundant
 definitions
Message-ID: <20250114-8b56e398bcbbf9863a72d968@orel>
References: <20250114093647.4952-1-jason.chien@sifive.com>
 <20250114093647.4952-2-jason.chien@sifive.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250114093647.4952-2-jason.chien@sifive.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=ajones@ventanamicro.com; helo=mail-ej1-x635.google.com
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

On Tue, Jan 14, 2025 at 05:36:46PM +0800, Jason Chien wrote:
> Signed-off-by: Jason Chien <jason.chien@sifive.com>
> ---
>  hw/riscv/riscv-iommu-bits.h | 22 ++++++----------------
>  1 file changed, 6 insertions(+), 16 deletions(-)
> 
> diff --git a/hw/riscv/riscv-iommu-bits.h b/hw/riscv/riscv-iommu-bits.h
> index 485f36b9c9..de599b80d6 100644
> --- a/hw/riscv/riscv-iommu-bits.h
> +++ b/hw/riscv/riscv-iommu-bits.h
> @@ -50,8 +50,14 @@ struct riscv_iommu_pq_record {
>  #define RISCV_IOMMU_PREQ_HDR_PRIV       BIT_ULL(33)
>  #define RISCV_IOMMU_PREQ_HDR_EXEC       BIT_ULL(34)
>  #define RISCV_IOMMU_PREQ_HDR_DID        GENMASK_ULL(63, 40)
> +
>  /* Payload fields */
> +#define RISCV_IOMMU_PREQ_PAYLOAD_R      BIT_ULL(0)
> +#define RISCV_IOMMU_PREQ_PAYLOAD_W      BIT_ULL(1)
> +#define RISCV_IOMMU_PREQ_PAYLOAD_L      BIT_ULL(2)
>  #define RISCV_IOMMU_PREQ_PAYLOAD_M      GENMASK_ULL(2, 0)
> +#define RISCV_IOMMU_PREQ_PRG_INDEX      GENMASK_ULL(11, 3)
> +#define RISCV_IOMMU_PREQ_UADDR          GENMASK_ULL(63, 12)
>  
>  /* Common field positions */
>  #define RISCV_IOMMU_PPN_FIELD           GENMASK_ULL(53, 10)
> @@ -382,22 +388,6 @@ enum riscv_iommu_fq_ttypes {
>      RISCV_IOMMU_FW_TTYPE_PCIE_MSG_REQ = 9,
>  };
>  
> -/* Header fields */
> -#define RISCV_IOMMU_PREQ_HDR_PID        GENMASK_ULL(31, 12)
> -#define RISCV_IOMMU_PREQ_HDR_PV         BIT_ULL(32)
> -#define RISCV_IOMMU_PREQ_HDR_PRIV       BIT_ULL(33)
> -#define RISCV_IOMMU_PREQ_HDR_EXEC       BIT_ULL(34)
> -#define RISCV_IOMMU_PREQ_HDR_DID        GENMASK_ULL(63, 40)
> -
> -/* Payload fields */
> -#define RISCV_IOMMU_PREQ_PAYLOAD_R      BIT_ULL(0)
> -#define RISCV_IOMMU_PREQ_PAYLOAD_W      BIT_ULL(1)
> -#define RISCV_IOMMU_PREQ_PAYLOAD_L      BIT_ULL(2)
> -#define RISCV_IOMMU_PREQ_PAYLOAD_M      GENMASK_ULL(2, 0)
> -#define RISCV_IOMMU_PREQ_PRG_INDEX      GENMASK_ULL(11, 3)
> -#define RISCV_IOMMU_PREQ_UADDR          GENMASK_ULL(63, 12)
> -
> -
>  /*
>   * struct riscv_iommu_msi_pte - MSI Page Table Entry
>   */
> -- 
> 2.43.2
> 
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

