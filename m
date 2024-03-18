Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B51DC54E5D
	for <qemu-riscv@archiver.kernel.org>; Mon, 18 Mar 2024 05:25:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rm5UI-0002re-TU; Mon, 18 Mar 2024 01:24:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1rm5UH-0002qi-Ey
 for qemu-riscv@nongnu.org; Mon, 18 Mar 2024 01:24:41 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1rm5UE-0002TZ-Rx
 for qemu-riscv@nongnu.org; Mon, 18 Mar 2024 01:24:41 -0400
Received: by mail-pf1-x436.google.com with SMTP id
 d2e1a72fcca58-6e6b22af648so3612603b3a.0
 for <qemu-riscv@nongnu.org>; Sun, 17 Mar 2024 22:24:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1710739476; x=1711344276; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=gbmky9YQX20wzO2zy9DbboVLxpylBJOz7L0pS5TRiMo=;
 b=MoBs10Gc9cgbqIPAhz1O5+DNVFETYeG9Hqy3TCQH2Cp8xLbTAFDMWE5JH+M1hgRZFN
 cLFERKNXgfvVFCAiI43BXUjK/LumURT193muNpNhF3KTgIrnbtwe4VBBCivQq0jH1Pom
 YOBoHY724/aKHTS/BJkCIPQvjCFG2fvPwWpZkHFF9TmGoczz6Yb2iTMsXvQ6g19R31Y3
 gcZNPOKxFJc/8WYR71bEy7snMMplVcYDDY048wVrHL55i1BWtdP6X2aXwymmCvweNeqG
 eILEqGjZqXR74ELIvmvrnhjdmaroxZyZnOTgxpRO9BrFgCXVAnsbRd5bFzwO1jVMyMAN
 L0FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710739476; x=1711344276;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gbmky9YQX20wzO2zy9DbboVLxpylBJOz7L0pS5TRiMo=;
 b=ue2IWK79d2NhoZiYhXO+8g+HkNSUZdDl+uhGHbL6v/9uP5gFYQbicurLUPoy9CmpD6
 xNKbnA+F/AeXGxWgj1jXGZB/Nf1NIq6DzrIVvEsQw9qz8uDpNN/vs/BGvQiVjGRYs3uQ
 fq3UYwqOEi2PYrcRJMtbq0S2+p5Bmmxg30xG9XIa8ugL64X+579EYK1QZBGFc+rFFQK0
 V7behBcaBdg9KxKx7EbO3OYcBXxbsvNzltdREF+uYVEF2I8LIlvbWyzxnbsxs0diGv4l
 zbx0IkE3rWEGaBT7iHWVdN4vWl9uZgAeplzVj96KIc82xt+zqJaVQjSsJ0s2hcjHNsgP
 F+zA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVRWhIC8lNwaV49goveIT8clIe/SH5lNPOlCE53fUqwRzSLTE5SCfCoXM0A4gFOkWXb/JO4X0orl9oPSaUc1XXYMNGqiSQ=
X-Gm-Message-State: AOJu0YwOKv/8wlNv9pSHNBFU/8E2BNDDGRv6R/b0Ci8EHv7x+JhCO0fP
 1pL8tylJ4eVclWzdGTHXy+8m102FX5JUO+cWQGFXKDz85YVCJD6F0Pchcz1bkU0=
X-Google-Smtp-Source: AGHT+IEcFldjs18IlgvF5lTyJBNXclA9e8U4J/yjFp50K7DRwhPvJLUlaeC21rJowV1EVzIPehJm6Q==
X-Received: by 2002:a05:6a20:9f08:b0:1a3:4e27:c8d1 with SMTP id
 mk8-20020a056a209f0800b001a34e27c8d1mr11646112pzb.25.1710739476552; 
 Sun, 17 Mar 2024 22:24:36 -0700 (PDT)
Received: from sunil-laptop ([106.51.185.90]) by smtp.gmail.com with ESMTPSA id
 p17-20020a635b11000000b005dcbb855530sm6250879pgb.76.2024.03.17.22.24.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Mar 2024 22:24:35 -0700 (PDT)
Date: Mon, 18 Mar 2024 10:54:28 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Daniel P =?utf-8?B?LiBCZXJyYW5nw6k=?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Alistair Francis <alistair23@gmail.com>,
 Andrew Jones <ajones@ventanamicro.com>,
 Anup Patel <apatel@ventanamicro.com>, Haibo1 Xu <haibo1.xu@intel.com>
Subject: Re: [PATCH 01/12] roms/edk2-build.py: Add --module support
Message-ID: <ZffQDBsJ5Sou2Ixj@sunil-laptop>
References: <20240315130519.2378765-1-sunilvl@ventanamicro.com>
 <20240315130519.2378765-2-sunilvl@ventanamicro.com>
 <nvi45kbmhbzrlapysvpy7srgdzw62we5ijhxgrxpfp4m27ji67@6eftbkcku4fq>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <nvi45kbmhbzrlapysvpy7srgdzw62we5ijhxgrxpfp4m27ji67@6eftbkcku4fq>
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pf1-x436.google.com
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

On Fri, Mar 15, 2024 at 03:13:44PM +0100, Gerd Hoffmann wrote:
> On Fri, Mar 15, 2024 at 06:35:08PM +0530, Sunil V L wrote:
> > UefiTestToolsPkg which should use edk2-build.py needs --module parameter
> > support. Add this optional parameter handling.
> 
> I don't think this is needed.  By default everything listed in
> [Components] should be built, which is just that one module we
> have ;)
> 
Ahh yes. Makes sense. Let me remove this in next revision of the series.

Thanks!
Sunil

