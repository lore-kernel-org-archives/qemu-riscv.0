Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5E29E77188
	for <qemu-riscv@archiver.kernel.org>; Tue, 14 Jan 2025 15:31:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tXit0-00007a-QZ; Tue, 14 Jan 2025 10:31:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1tXisx-00006k-QL
 for qemu-riscv@nongnu.org; Tue, 14 Jan 2025 10:31:19 -0500
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1tXisw-0004G7-1C
 for qemu-riscv@nongnu.org; Tue, 14 Jan 2025 10:31:19 -0500
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-5d3dce16a3dso3402631a12.1
 for <qemu-riscv@nongnu.org>; Tue, 14 Jan 2025 07:31:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1736868676; x=1737473476; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=uhL7mGIbrcKZNeD4Q1ifO0CQvjfRdo9rCUzppgnLJDA=;
 b=A51YGUcuCLcN3HewpzqYGs6ao0nRfBHG6OtTR3kS/6HFcrWASNukKEovW3oRB+xvs/
 3T5kQgbMVNbimzpVM+bjAPTF78Ym0yiItUMF1g66yunXg7r1jG95bjTHmGX0InPZJokM
 ESY836Ma58gg2Sjo3ChMC3yByiX8c9Vit5+P6d/UQ6pw7EASNJdiVzTCHgHXq4u+Wvfg
 EkmYVjj6Ug5hqajx8zPLlSwRV99Z7CkD/syMjzlsjHwIr8uTvmwn13hCISnxDRZ/lazu
 na+19lfAvPBvhWClpP8Yvg0YFjYrmeTsk/MA+vcCvb6hX6wm+EhPWSTwO6kU1h0hZnVr
 FeZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736868676; x=1737473476;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uhL7mGIbrcKZNeD4Q1ifO0CQvjfRdo9rCUzppgnLJDA=;
 b=fjfoqqM4Or0nCRQyBGISkebKeR8d15Mo5ISSjKWLxRmre0k4ftlsKMDiPW2NCfGRNC
 2LLnwIvUyg++fRumrAkUnQkeoXfNDQ9zlrVfjLNwWb7OC4R7QfD+GbkgqAKlY7b0qx8W
 47a8Uwd0LoJvLTapRW5KNbfThy0n51HZnvvnzeHfnr8tO1e9iM5dA0iWuIa0Akze32d+
 FexLyRGvaVYD3oTNRzQhnSrfplw5980cc7TPLryLWm4TZr4gTaL/PTAHPq19Z8WOU6Xe
 2u9RFvIW7SU3Ux0ifN/uQklZuKxay6fLwtwSN5VGh1XSzukMymogYdBDSu6MF5TUmg2N
 asuA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX/cJek8/LLRDzFX41xkGMWUvtqs1u6ZYVUemOfU0q+ovoh6D9MooTrxwMJWQgqlMzreU+zaMAFIuU+@nongnu.org
X-Gm-Message-State: AOJu0YyWbQT5X4fbxDKAqfQjNqqXHHCzZC16Pbvcc9Za1B2TrpxhxdLQ
 9Poct3txuahPaYVtS3W9/tVLOLvv+Zsx1UjXZJgQrSFEg06sbh5kdV7aBi6scTY=
X-Gm-Gg: ASbGncvKE0TVnQ5k3xZwcvLjxluy3fMSsazgSAoDmFsV2NebtaQet8Biu4kqOLkSg+C
 lt93GEQQ20RVRHQxF1hEoyHgmEHEQdaqGd5jSn9Tb3V9PaKVw2GIz/btqI3LsquGqcHo1BaoEMF
 TWd0CU4iAxMhVuybu1SBilqkHb/xn1kAwKGfehgMOY+GUczaPUBgc9bZVbNC616KZKDJKoiDEEl
 LfwIoJjfxhOYTeUxut+OyaWwBmENF02zIYLzSfrmh31PYQzhrZtB4tPhgcXr81h7sx3kOireVFl
 bNjWSPixHvUuljZM/i5tWVwih9O97CjK9Wz7lXuhtw==
X-Google-Smtp-Source: AGHT+IHjWpHh759rp7u1IZYDH4J41Q840bNNWeHyuMRiB5YmRmX03usoFQsSyNZrMw/zXGdidHqrTQ==
X-Received: by 2002:a05:6402:27d2:b0:5d0:b61a:89c9 with SMTP id
 4fb4d7f45d1cf-5d98a24a3d1mr19337733a12.5.1736868676374; 
 Tue, 14 Jan 2025 07:31:16 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz.
 [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d9900c4326sm6173718a12.23.2025.01.14.07.31.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jan 2025 07:31:16 -0800 (PST)
Date: Tue, 14 Jan 2025 16:31:15 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Jason Chien <jason.chien@sifive.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bmeng.cn@gmail.com>, Weiwei Li <liwei1518@gmail.com>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Subject: Re: [PATCH 1/2] hw/riscv/riscv-iommu: Remove redundant variables
Message-ID: <20250114-6584ec19b35ef05b9e366faf@orel>
References: <20250114093647.4952-1-jason.chien@sifive.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250114093647.4952-1-jason.chien@sifive.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=ajones@ventanamicro.com; helo=mail-ed1-x530.google.com
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


s/redundant/unused/ <<<$SUBJECT
s/variables/struct members/ <<<$SUBJECT

Both this and the previous patch should get some sort of commit message
explaining how the unused and redundant elements where found.

On Tue, Jan 14, 2025 at 05:36:45PM +0800, Jason Chien wrote:
> Signed-off-by: Jason Chien <jason.chien@sifive.com>
> ---
>  hw/riscv/riscv-iommu.h | 5 -----
>  1 file changed, 5 deletions(-)
> 
> diff --git a/hw/riscv/riscv-iommu.h b/hw/riscv/riscv-iommu.h
> index 9424989df4..fa8a50fa24 100644
> --- a/hw/riscv/riscv-iommu.h
> +++ b/hw/riscv/riscv-iommu.h
> @@ -58,11 +58,6 @@ struct RISCVIOMMUState {
>      /* interrupt notifier */
>      void (*notify)(RISCVIOMMUState *iommu, unsigned vector);
>  
> -    /* IOMMU State Machine */
> -    QemuThread core_proc; /* Background processing thread */
> -    QemuCond core_cond;   /* Background processing wake up signal */
> -    unsigned core_exec;   /* Processing thread execution actions */
> -
>      /* IOMMU target address space */
>      AddressSpace *target_as;
>      MemoryRegion *target_mr;
> -- 
> 2.43.2
> 
>

Otherwise,

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

