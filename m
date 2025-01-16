Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F255C02183
	for <qemu-riscv@archiver.kernel.org>; Thu, 16 Jan 2025 13:49:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tYQFO-0001Nx-Ll; Thu, 16 Jan 2025 08:49:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vliaskovitis@suse.com>)
 id 1tYQ4s-0006AR-34
 for qemu-riscv@nongnu.org; Thu, 16 Jan 2025 08:38:30 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <vliaskovitis@suse.com>)
 id 1tYQ4p-0002Pm-QN
 for qemu-riscv@nongnu.org; Thu, 16 Jan 2025 08:38:29 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-436326dcb1cso5748395e9.0
 for <qemu-riscv@nongnu.org>; Thu, 16 Jan 2025 05:38:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1737034704; x=1737639504; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Q/mzHOquOT4qeJZ2Tem/iZOQqoRtMG7+aUtQRF2uBqQ=;
 b=MHXFzC33nQK2At7hnnGW0O9vQZNjmYXqp2K4uHnVrI7dbzQvpBe1mOZPPwSuAw7h1R
 rOEVTQ32POw7D4SX2lzW+2UwAl/MJ/nbBA/LlAJfC8ki6Z5IVIOT9Z92YbFhiNg+zPzu
 I892kqQJoddMuNUrM3Hl7D4tD3EcLBZkf9+d6UIz+pH4QxcNi2o6HazFJAh+pwpItuQi
 BSlO4f9XYWo3ly+Q8IcUdlW3ZGndvYd1i5soQgg8nFYmFPX0e2iYV/ofHb7meFw0t3yz
 0RH2JsdYlJFZS3MrUvNXzOapIC4G3sB69otGGa6Q24zqP6xNVePBz7A/l8aykVbnZHjt
 dtfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737034704; x=1737639504;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Q/mzHOquOT4qeJZ2Tem/iZOQqoRtMG7+aUtQRF2uBqQ=;
 b=JL4dMJHwoVHZkYoIMBhPdbRwPZPFrg1XiV63d3hd1OsB/gz/O1T6BaygOkRoCq4bkh
 Bt2cN6BmCfPUTf2VoCcubsSMBDad1YSM6f6JC5rSpAL6UolzANaU6f55pZF42b0yBZyR
 3ah1mRn634H3+VU/ouKpix3qt+bB6ABehKd7t2uC0rObCOD2qxuSwX0ws3TjuLY6sHbK
 MP8vYXIcqMjZKvgw0OHpLC140l24tgDERmjAl7/k/Jq8V3FKlRZIXfPOX9XpfZGxa/+c
 ghM/9b8OKkOwNMvfCRT+yL8pjIofI+gttD6aUJgtiUVpAT4G4leI4+9Gxp5lKHnA514W
 J86A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXYNak0WjRZy4H8y0LlACtDRgWIsjYYNH3gYROpSV3EdUIt19ao9IHnUiZAM5Hfvme5Aa7PBHNSTkkh@nongnu.org
X-Gm-Message-State: AOJu0Ywi9EU67pa5OMxamrtBUL1npkpOa0E3conhvT0E/ldS4WhDfFvw
 UFRpx+s4UQ26ZdJQpfr7VsWC9cfTiQQDjiEVTcnztucCM7v9vjHZj7u34MDIzp8=
X-Gm-Gg: ASbGncsp8p7MezJUu1lD1Asu/a8aY1AZGWLJ9YKn+Ova29QlOZyDmb+LA5OOy6mN0Ll
 IplNIZ1vvax6EkJf2+3YB9c2Hs45At5XM0Hr0542Q0vyDfcUUc9p+Ld5+4JJUwvYkUKaAMy2Nms
 G33nalY24UycsJlW5dSwFOgOhLsaVM4uajBkGyvjcwh/G0zNAhplLsjgpqFil/jUQgxO8oQbVKb
 i1K70mF3/LYqI5WfEVQtCYu0zrxduTQQK2XVug+0LiFHZYq/4Ez36E9XH33QNSEc7AaEqlfDnLH
 0KmvRzi9b0BVId/xN5A=
X-Google-Smtp-Source: AGHT+IHwEDK9ToO1pM6BE8j7wsb/JsjMl9BNsFAwcqLGz3bSz//nfvxTdE5iIA4YW++sRrM2Js1pkw==
X-Received: by 2002:a05:600c:4510:b0:431:54d9:da57 with SMTP id
 5b1f17b1804b1-436e26ffb2cmr333712005e9.30.1737034704398; 
 Thu, 16 Jan 2025 05:38:24 -0800 (PST)
Received: from linux-bfvj (ppp-2-86-138-70.home.otenet.gr. [2.86.138.70])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a8e4c1bebsm20590378f8f.95.2025.01.16.05.38.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jan 2025 05:38:24 -0800 (PST)
From: Vasilis Liaskovitis <vliaskovitis@suse.com>
X-Google-Original-From: Vasilis Liaskovitis <vasilis.liaskovitis@suse.com>
Date: Thu, 16 Jan 2025 14:38:21 +0100
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Vasilis Liaskovitis <vliaskovitis@suse.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, palmer@dabbelt.com, alistair.francis@wdc.com,
 jason.chien@sifive.com, zhiwei_liu@linux.alibaba.com,
 dbarboza@ventanamicro.com, bmeng.cn@gmail.com, liwei1518@gmail.com,
 philmd@linaro.org
Subject: Re: [RFC PATCH] hw/riscv/virt: Add serial alias in DTB
Message-ID: <Z4kLze26LZNqqiU3@linux-bfvj>
References: <20250116084629.19983-1-vliaskovitis@suse.com>
 <20250116-089f795c1302e6f2b4a6b8c0@orel>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250116-089f795c1302e6f2b4a6b8c0@orel>
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=vliaskovitis@suse.com; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 16 Jan 2025 08:49:21 -0500
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

On Thu, Jan 16, 2025 at 10:23:56AM +0100, Andrew Jones wrote:
> 
> s/Fixes/Resolves/ (see docs/devel/submitting-a-patch.rst)
> 
[..]
> >      qemu_fdt_setprop_string(ms->fdt, "/chosen", "stdout-path", name);
> > +    qemu_fdt_add_subnode(ms->fdt, "/aliases");
> 
> create_fdt_uart() is called at machine-done time, so we should create the
> /aliases node in create_fdt() in case we ever have other uses for it.

thanks for the review, I am sending a v2 with the changes.

- Vasilis

