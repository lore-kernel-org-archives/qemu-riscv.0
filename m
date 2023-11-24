Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C26DEC61DF4
	for <qemu-riscv@archiver.kernel.org>; Fri, 24 Nov 2023 09:27:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r6SST-0002nl-K9; Fri, 24 Nov 2023 04:26:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1r6SSQ-0002mu-3k
 for qemu-riscv@nongnu.org; Fri, 24 Nov 2023 04:26:42 -0500
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1r6SSO-0008DM-E7
 for qemu-riscv@nongnu.org; Fri, 24 Nov 2023 04:26:41 -0500
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2c8769edd9fso22390401fa.0
 for <qemu-riscv@nongnu.org>; Fri, 24 Nov 2023 01:26:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1700817998; x=1701422798; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=kZ0NtL7wv+0NH/xlPeT118QS8vRQnQvMegpNkUgNzWw=;
 b=hbvgipBM0fXy8iAWOx4hMhyvvWHT0d6iUBpypEpIztWSdzwe4vZW/2r+mHR4dUddyf
 SkFRrPEg7sw2XwfcA1FgmeuAk3w+WzIebFUD6+z0POYlSEicntj5NVwB8rW9+QZxdYRK
 1UH0pIEKuUPhnfpWze/Y1M1c1exxrUDtZHSvTNkrt9IJsWMp8Xg24rdPsLkZwA/h3PxA
 WoZdXyDH9rA7BpgPeGdAwi9ROMSfGRUda+OhKu+Ne6rlxiLAl0zF2cjICwnGnsEZUUlX
 BuY0q+C0BMRGJjC147/bawpiIFWhRiDABHuYZRQmhNGlA6oKQ9mtcmoMWqsBpf80NmjS
 OElQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700817998; x=1701422798;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kZ0NtL7wv+0NH/xlPeT118QS8vRQnQvMegpNkUgNzWw=;
 b=V8KDwZFbKhTRv1lwmrD3dqJPkff7nkLZst61iGnVVZxLSzLWki1JLKdOSd78sqRbWb
 T1s4sbtRbge4g9RyKminrYwEW9ikYDp+Oglhd+HKwXw1qolnquqpxOYyMTN17Sy9e3fP
 52qybipUUAE3vpH2KO7jEbRInhXXSTKwlfnMOYyefDj+N2NgeZ4vjmiXwcfoaJNp9bKf
 q7U+qNF9KRY/Wttyi7uJRFcrboZJ3TZve0/qZKuabbH2QcR+wDZS1BIGi2drzIHyxI2X
 VQdJBz4DH0/QGH6dkG++kKFbKHHgjlZy7f01QIu+t0p9Q8Wjnle2ie8A0vK/NxPQuMkJ
 D2Jw==
X-Gm-Message-State: AOJu0YxEiMqkg7XOCi1Uk+n2SdqaBq6iZIX6xUt5pUig/OIi0ZY9AYdl
 TcrXrAeAeTG28cgsHFAyBHr+2w==
X-Google-Smtp-Source: AGHT+IHCJBrhP1ffFhWKkiRBstmlXwbC1Mt1eTwbYPG5d2apjK2bv5pduOWUIu/IKCIZgbd2hxMGbA==
X-Received: by 2002:a2e:905a:0:b0:2c8:87bd:7bfd with SMTP id
 n26-20020a2e905a000000b002c887bd7bfdmr1429483ljg.0.1700817998235; 
 Fri, 24 Nov 2023 01:26:38 -0800 (PST)
Received: from localhost (cst-prg-91-180.cust.vodafone.cz. [46.135.91.180])
 by smtp.gmail.com with ESMTPSA id
 az15-20020a05600c600f00b0040b2b9bf321sm5229158wmb.9.2023.11.24.01.26.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Nov 2023 01:26:37 -0800 (PST)
Date: Fri, 24 Nov 2023 10:26:36 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com
Subject: Re: [PATCH for-9.0 v11 10/18] target/riscv/tcg: add user flag for
 profile support
Message-ID: <20231124-3f0e87fb0cb17d5c9d8663f6@orel>
References: <20231123185122.1100436-1-dbarboza@ventanamicro.com>
 <20231123185122.1100436-11-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231123185122.1100436-11-dbarboza@ventanamicro.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::229;
 envelope-from=ajones@ventanamicro.com; helo=mail-lj1-x229.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On Thu, Nov 23, 2023 at 03:51:14PM -0300, Daniel Henrique Barboza wrote:
> The TCG emulation implements all the extensions described in the
> RVA22U64 profile, both mandatory and optional. The mandatory extensions
> will be enabled via the profile flag. We'll leave the optional
> extensions to be enabled by hand.
> 
> Given that this is the first profile we're implementing in TCG we'll
> need some ground work first:
> 
> - all profiles declared in riscv_profiles[] will be exposed to users.
> TCG is the main accelerator we're considering when adding profile
> support in QEMU, so for now it's safe to assume that all profiles in
> riscv_profiles[] will be relevant to TCG;
> 
> - we'll not support user profile settings for vendor CPUs. The flags
> will still be exposed but users won't be able to change them;
> 
> - profile support, albeit available for all non-vendor CPUs, will be
> based on top of the new 'rv64i' CPU. Setting a profile to 'true' means
> enable all mandatory extensions of this profile, setting it to 'false'
> will disable all mandatory profile extensions of the CPU, which will
> obliterate preset defaults. This is not a problem for a bare CPU like
> rv64i but it can allow for silly scenarios when using other CPUs. E.g.
> an user can do "-cpu rv64,rva22u64=false" and have a bunch of default
> rv64 extensions disabled. The recommended way of using profiles is the
> rv64i CPU, but users are free to experiment.
> 
> For now we'll handle multi-letter extensions only. MISA extensions need
> additional steps that we'll take care later. At this point we can boot a
> Linux buildroot using rva22u64 using the following options:
> 
> -cpu rv64i,rva22u64=true,sv39=true,g=true,c=true,s=true
> 
> Note that being an usermode/application profile we still need to
> explicitly set 's=true' to enable Supervisor mode to boot Linux.
> 
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>  target/riscv/tcg/tcg-cpu.c | 80 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 80 insertions(+)
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

