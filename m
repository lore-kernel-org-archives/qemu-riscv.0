Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E0C7C04FFE
	for <qemu-riscv@archiver.kernel.org>; Mon, 20 May 2024 14:00:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1s93Yy-0007TG-FA; Mon, 20 May 2024 10:00:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1s93Yt-0007Pl-Sm
 for qemu-riscv@nongnu.org; Mon, 20 May 2024 10:00:25 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1s93Yr-0001Ga-O7
 for qemu-riscv@nongnu.org; Mon, 20 May 2024 10:00:23 -0400
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-351d309bbcfso1477222f8f.3
 for <qemu-riscv@nongnu.org>; Mon, 20 May 2024 07:00:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1716213617; x=1716818417; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=V/8nB0KE9iIsTN79NqvxoOEILL8ZAx+/Vn72nMsp2no=;
 b=hS8f2SJWA9CSpKK38e+dOTA2ksiHnryVSY5EnLGThsEue3qPd3u3kvqv43NRaZ+T8j
 27ExOygtbHTw+7FZGz136Lvp4RcGobFxWOXG0WYEJQMnSINwEytee4G4YJAbEjVrVazA
 IIzPl48wi6ZGKyh7IRdZEjwuGpA/DXvdGUla9071RnehS3jZVuCkR1meK6vUw6jS4zfM
 6WG9WIs3fZ0t77IV8f1mlxJkoAcoDVO/ntVMulbINka8LwNnjinIOASSFbYvH42iI1Qc
 cB5+kb/vEwcZ2xMHU2hcAfH7J++yBwGeUSTWqdwWVfG5eG/wgBpCkWmyelZGV83lF+on
 MolQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716213617; x=1716818417;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=V/8nB0KE9iIsTN79NqvxoOEILL8ZAx+/Vn72nMsp2no=;
 b=ob4TEsnHhr/gIDmlJYx+ZqZpa76StBr1i8+xGprWtQ80T28HF1vt9a/dsxvAYcXisf
 rfMF/FmRfw1SzChv6HBIthstoh7RGY1MMJcDSlcLDsu7C1DwQ0gEmRe4toRJIluzO3m2
 4CONsEto7/6WQ9DLkE0AHjaxdLiqt1UEFKwWM+JvaB2HMZfu3cK1FLac1/XppjDJS+US
 HFv48lsKplwmklicpPQ9Fph0LKWGsjKAmd4s+rF4MO8jU/vflWCJZ4RbNJScu7LWdIPE
 Uk687OPIhZTmG9VvaKAY+kUs/xBSFaTLaaLZ8EWliZ64rFA1/GgUK2MjjqOMS7HRrf3e
 PYXA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUmeg0xl4kaAGn2qJp6O3zvVoxpTo4sIyDCNzuCcEveMlQ5o4CcIqCnF0373i7dQKHbuMVGyz0S2CzEjTZyAwXyxscPusU=
X-Gm-Message-State: AOJu0YwKhpuodljMTcxi1CpVIwowKx3VQ2c85Zdst9MzJsin6EW/gSlg
 78m93+5pMvPykndQ9dpygS/Jx6NQJcXPH2P4xs1gUy1f/n1339d/P3m48bczFaM=
X-Google-Smtp-Source: AGHT+IFLpbWP3ka8QglB6EKizB2vIq+AC0qtpJO8/weU6wWqo26JMk+QNw2LiHAsuTorINsCnQr1HQ==
X-Received: by 2002:adf:fccf:0:b0:34d:3d05:cf3a with SMTP id
 ffacd0b85a97d-3504a6311a6mr19597458f8f.22.1716213617546; 
 Mon, 20 May 2024 07:00:17 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz.
 [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3502b896a5bsm29063380f8f.36.2024.05.20.07.00.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 May 2024 07:00:17 -0700 (PDT)
Date: Mon, 20 May 2024 16:00:16 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: "Wu, Fei2" <fei2.wu@intel.com>
Cc: pbonzini@redhat.com, palmer@dabbelt.com, alistair.francis@wdc.com, 
 bin.meng@windriver.com, liwei1518@gmail.com, dbarboza@ventanamicro.com, 
 zhiwei_liu@linux.alibaba.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org, 
 andrei.warkentin@intel.com, shaolin.xie@alibaba-inc.com, ved@rivosinc.com, 
 sunilvl@ventanamicro.com, haibo1.xu@intel.com, evan.chai@intel.com,
 yin.wang@intel.com, 
 tech-server-platform@lists.riscv.org, tech-server-soc@lists.riscv.org,
 atishp@rivosinc.com, conor@kernel.org, heinrich.schuchardt@canonical.com,
 marcin.juszkiewicz@linaro.org
Subject: Re: [RISC-V][tech-server-soc] [RFC v2 1/2] target/riscv: Add server
 platform reference cpu
Message-ID: <20240520-ecc94488050a20d80f9c790e@orel>
References: <20240312135222.3187945-1-fei2.wu@intel.com>
 <20240312135222.3187945-2-fei2.wu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240312135222.3187945-2-fei2.wu@intel.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=ajones@ventanamicro.com; helo=mail-wr1-x42d.google.com
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

On Tue, Mar 12, 2024 at 09:52:20PM GMT, Wu, Fei2 wrote:
> The harts requirements of RISC-V server platform [1] require RVA23 ISA
> profile support, plus Sv48, Svadu, H, Sscofmpf etc. This patch provides
> a virt CPU type (rvsp-ref) as compliant as possible.

We should add the RVA23 profile cpu type first, and then base a reference
cpu type on that. But, I guess we should version the reference type, since
we shouldn't expect the reference type to be bound to only RVA23 forever.

Thanks,
drew

