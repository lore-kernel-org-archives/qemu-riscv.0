Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFB07C4345F
	for <qemu-riscv@archiver.kernel.org>; Mon, 15 Apr 2024 14:04:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rwMwB-0005b4-5U; Mon, 15 Apr 2024 10:04:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1rwMvx-0005Xg-CJ
 for qemu-riscv@nongnu.org; Mon, 15 Apr 2024 10:03:47 -0400
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1rwMvr-0000R2-CC
 for qemu-riscv@nongnu.org; Mon, 15 Apr 2024 10:03:44 -0400
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-518931f8d23so2221048e87.3
 for <qemu-riscv@nongnu.org>; Mon, 15 Apr 2024 07:03:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1713189817; x=1713794617; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=1csYPv+VRG5wFH/IR6CEqsuxRRE7tCA/BagjtQvdd0A=;
 b=EcVzeO0FEbgg5S31SEMDayu0LfoyRLt5TJHdpmU2TvjlMbkAt2tFvBREwDv5BttXrG
 Pxp5UpRDttAjvTaw5akcyhBcD2cZFdRRsTqr5WuFyAWqVOKcMmOxoFsbXo8xYG/BC5kV
 W70Dpdjs/y5uffLSP/gF1S+SP0O5RMDnghVQlvMs9hwOmfVJRrjFE8BWCvHjvAuPCA/v
 MIrbEhEs86rqWcqCpfTIhxQZb4hml48cqZqsOYOZQROoYM7rIkLWfdOSWa2FOAv/GHBc
 9byKk6sgO8waz4W1AGvbqWhJEC+xLj3C+AMqPQ6tTzj+NPr2Fyqje0hapJQzqvhbIY00
 MIxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713189817; x=1713794617;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1csYPv+VRG5wFH/IR6CEqsuxRRE7tCA/BagjtQvdd0A=;
 b=NAXGL2EcajA9wsFILgyLR3l8BHSmErx9j+uDWichb31BEPdmyM4k9/j/UYYNsZKVtm
 ELdBL7kPHAZNTe+WEE3XVto1fa0PzUjor2reYAjvK5tpgexQwyGfX+HGaxaa9wWvWD9+
 8FkBgtqALTwDybUhD6vrrvfygXmusNyIzIe823Eona7hwhgaK5otkyk3UPBj0iEwpV2J
 3f/5W78/KTSzQ8I+fNe6jFkwbk5WtkIymTsuT/ER3nh0Fu7MrqxMG4sQ5pIfvj4RjLwX
 pgR7pj+MWukbVQbRlMV5Y5XtsG2iM8fdJmYVDkP+hHpjvFNH9WgK5E0T+GMZqHlIeJga
 dnHQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVYGvpBCRh/m3kLXTCNWnUqNl0V9I17NbcFn4DWp847NCGjswJ0e3sHEXIfqxHnyTnPjr38IcUBKS8fcWiDN0X7b0XDlg4=
X-Gm-Message-State: AOJu0YxICdYpE4SNjgJNs8upFQpqkcr+slSWkXrFoeF3wdFZ0yDrk3tX
 VJeE6tr6ULLowQ/AVSEU75wL3RI5Ny8LUHUKzAEow42HlEzO9tatmgdOD8qrX6Q=
X-Google-Smtp-Source: AGHT+IGPXTufJ1Kniv29Wbef0JGZk2jrcJApiQTZhsrIojgGzvoLobJNiynYs1ln7F9nDDfUGbxy/A==
X-Received: by 2002:a19:7008:0:b0:515:9eaf:5c21 with SMTP id
 h8-20020a197008000000b005159eaf5c21mr6317229lfc.36.1713189817051; 
 Mon, 15 Apr 2024 07:03:37 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
 by smtp.gmail.com with ESMTPSA id
 e18-20020adffd12000000b00343826878e8sm12152510wrr.38.2024.04.15.07.03.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Apr 2024 07:03:36 -0700 (PDT)
Date: Mon, 15 Apr 2024 16:03:35 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Alexei Filippov <alexei.filippov@syntacore.com>
Cc: alistair.francis@wdc.com, apatel@ventanamicro.com, 
 bin.meng@windriver.com, dbarboza@ventanamicro.com, liwei1518@gmail.com, 
 palmer@dabbelt.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org, 
 zhiwei_liu@linux.alibaba.com
Subject: Re: [PATCH v4] target/riscv/kvm/kvm-cpu.c: kvm_riscv_handle_sbi()
 fail with vendor-specific SBI
Message-ID: <20240415-efb730a890cf540c7ae3798d@orel>
References: <20240326-672b9d2fa4066ec883a9f037@orel>
 <20240413112526.8748-1-alexei.filippov@syntacore.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240413112526.8748-1-alexei.filippov@syntacore.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::135;
 envelope-from=ajones@ventanamicro.com; helo=mail-lf1-x135.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SORTED_RECIPS=2.499, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On Sat, Apr 13, 2024 at 02:25:26PM +0300, Alexei Filippov wrote:
> kvm_riscv_handle_sbi() may return not supported return code to not trigger
> qemu abort with vendor-specific sbi.
> 
> Added SBI related return code's defines.
> 
> Signed-off-by: Alexei Filippov <alexei.filippov@syntacore.com>
> Fixes: 4eb47125 ("target/riscv: Handle KVM_EXIT_RISCV_SBI exit")
> ---
> 
> Changes since v3:
>         -Clear Reviewed-by tags
>  target/riscv/kvm/kvm-cpu.c         | 13 +++++--------
>  target/riscv/sbi_ecall_interface.h | 12 ++++++++++++
>  2 files changed, 17 insertions(+), 8 deletions(-)
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

