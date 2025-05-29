Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C83EC54FB3
	for <qemu-riscv@archiver.kernel.org>; Thu, 29 May 2025 12:34:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uKcSZ-0007wI-0K; Thu, 29 May 2025 08:34:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1uKcSW-0007vp-EE
 for qemu-riscv@nongnu.org; Thu, 29 May 2025 08:34:08 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1uKcSR-0007Lz-PX
 for qemu-riscv@nongnu.org; Thu, 29 May 2025 08:34:08 -0400
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3a365a6804eso675386f8f.3
 for <qemu-riscv@nongnu.org>; Thu, 29 May 2025 05:34:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1748522042; x=1749126842; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=KTHEnM1J54Dl6LQIwonS9Jdday3vAeLkl1PwGeJ+V0Y=;
 b=ornBEyaLzfXfSvowhzBO/9D12/MUdEG7uMJ8X3BogtdzKIYevQTjtbGxt1b9m8zrpd
 l3RKAbCgjUcGC+nlPB35udsa2hpL2r+oEmF7psRg75/gASjcakRF+4/pKNkAG++6Ff8T
 YbO4RcsDqP4B3G66/OPVhNWjG8lAlZCdw7NwD5um0rkUddeO2d1UEzPdwCMLRm845otZ
 NCmWIhKKdSxFXrYkLjR8igPe/XJGwB3INVA9LGweUsherm/nL0hj84ibTiVheXFMvhBw
 r3QZljxfLeGgJta+XyDdw9zDeZuxxn0XCGug+GQxcmhQ5DZmgGkrV6SkItXEsGnIVzyS
 GRqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748522042; x=1749126842;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KTHEnM1J54Dl6LQIwonS9Jdday3vAeLkl1PwGeJ+V0Y=;
 b=ipHaM9+CzPuxFe9zM5X0q2jT074ie1hwnYM5/ZSEBjYNq7VypSRsMOgESGsULOE7em
 c1S8tDSvBcVJ+K+UtliEtFIe9lITbkZnuQd1NSuKZX94unLDzSi4KKNmMwWzy1uIR23f
 axm1lhMnT06B0RjUEsnnC0ce4dc13WjfzzkrtuJ9uQ2oGqPiNeOUd64kFMjbZqN9R7LD
 CqfohEaKfOdaWHa2xgNhktA/nK+lI+dsc3J9qWm3tNs5tDclVHEXvHlj/AX+F3da4rlr
 rTZhSLhgnpf1G+vpgpk4a4qPRR58JM02X+UBl7GCO6SOf5C6C5EshPgaOJgJIt95bFm5
 Awkw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU1JliR4wRp4Iz/pPc5cJjLZByIabMjmkluIbvvUiUQbfJybCHCKIo0Vy855mBttbwZZnk2YSPNwzaD@nongnu.org
X-Gm-Message-State: AOJu0YxiyOYZwi0EHOwQ1xOteSM0+UHwsxXGv2O+l5iGxBllDagR9De8
 euQgDF3OwBY7gAwBy1lsJCFvaTzrruFTioyPwglStc74IKomXNi9q/DlZNjjPhmfP/Q=
X-Gm-Gg: ASbGncv6Zc9DfbS5So07yzjJApwjqN0e0MbwKla2BaXHX4vF3tPQ4N7saupZ3EHJD11
 vY5PbSYI3nHzJTZxVon3GMkRhsMttZF2nX66BGA23s76dpR36O5uxG2ENm59Fld2lOtDqca9FhW
 HQqj9LRH188UQSI0LTk48HzdcWjG+bIwe7UUjkhSr8IJJK0vdx6HeYUv4NcTCalce9B2QhldJ+I
 HYszRHRhba+n7S+hHQ4/UZBB9gca0bnwkHeHPCEaq8171t1W43/QpaU+R6WmasJ5D6/Ih8GUThf
 y04a+nJa4OIR91yLCEx8TzCf1K6w1Nj8JSvvx+8=
X-Google-Smtp-Source: AGHT+IGeddTIzqZiIEn5+A9uHq+wLYoMWEVdrKszyVSTKRVVPpR7/uRja1a/h3xCWiBzanq7oNX1Og==
X-Received: by 2002:a05:6000:26c5:b0:3a4:ee40:715c with SMTP id
 ffacd0b85a97d-3a4f35b66f7mr1927746f8f.14.1748522041911; 
 Thu, 29 May 2025 05:34:01 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200::ce80])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-450cfbf495bsm19319155e9.4.2025.05.29.05.34.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 May 2025 05:34:00 -0700 (PDT)
Date: Thu, 29 May 2025 14:33:59 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@dabbelt.com
Subject: Re: [PATCH v3 4/4] hw/riscv/server_platform_ref.c: add riscv-iommu-sys
Message-ID: <20250529-1f1da845a0d0592562129697@orel>
References: <20250528200129.1548259-1-dbarboza@ventanamicro.com>
 <20250528200129.1548259-5-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250528200129.1548259-5-dbarboza@ventanamicro.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=ajones@ventanamicro.com; helo=mail-wr1-x42d.google.com
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

On Wed, May 28, 2025 at 05:01:29PM -0300, Daniel Henrique Barboza wrote:
> Add an always present IOMMU platform device for the rvsp-ref board.
> 
> The IRQs being used are similar to what the 'virt' board is using: IRQs
> 36 to 39, one IRQ for queue.
> 
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>  hw/riscv/Kconfig               |  1 +
>  hw/riscv/server_platform_ref.c | 78 ++++++++++++++++++++++++++++++++--
>  2 files changed, 75 insertions(+), 4 deletions(-)
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

