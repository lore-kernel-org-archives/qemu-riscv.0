Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3DC3C02180
	for <qemu-riscv@archiver.kernel.org>; Wed, 15 Jan 2025 08:37:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tXyu2-00041y-6N; Wed, 15 Jan 2025 03:37:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1tXyu0-00041D-5h
 for qemu-riscv@nongnu.org; Wed, 15 Jan 2025 03:37:28 -0500
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1tXyty-00073v-IH
 for qemu-riscv@nongnu.org; Wed, 15 Jan 2025 03:37:27 -0500
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-5d7e3f1fdafso13010577a12.0
 for <qemu-riscv@nongnu.org>; Wed, 15 Jan 2025 00:37:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1736930245; x=1737535045; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=+aoaNiirkzOLXpUm3RNwlkG8qmhF0ZJnIzXPXJrrsOk=;
 b=eNdORhMcYUHi/k1s3Ib4JdXEfz1bD8FLVraVlx1Vu3uWbINsI678BuswL9MjZ6b2s4
 tj/IJ701CGAdPlzvCIPFFehQp9cVvkiO7ZCro1n4dAZeKSHrjO7sWBKsbuzUeVNgafCj
 9+1fTBXtRQfUH8F4bnBmBJ/C+qkrakpJlEWEBL2rBu9RdEQCX46uM043EtAz53Bx6Gp6
 mDMgplLlc9Wmvq2vxeodwnPj4rwbFElFCJxvNnDBTdyalnBkzlbiRVWpkywMKtYYJFtO
 RjptToekXjow7baoS0/XdDKEObEkqWqx95dT0ZF8bdvSHK1kf2JmDFJyfxtQ4ZPA67di
 zq3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736930245; x=1737535045;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+aoaNiirkzOLXpUm3RNwlkG8qmhF0ZJnIzXPXJrrsOk=;
 b=Iq5CwGvjpwIqRwDXvjIOP/3j7aAlc9L9R5e57bWO7sBxgDvV2T6ev3nVE6v+5MgAjO
 mNRqaf9KlRI1/TnfdNLLOjUZmj7j3A7lUSlWT07IHhcBNAcdMkAlHvvgvybND9lWwzIm
 eB8gx8ogZOsM4HyKC1DmdkLpvVPfAHRwyz4DVlpXBdVjIJGtkXj7iKzQowBsIPKl8JiZ
 vYOrk0mbiwKaoyuFKXcO6zfNrpJczbfLMop+6hdu6LU+UWpdcdmWMcN0LZAbu/lFQz3j
 EOEUTuSLCXidezn2qLk8TcL0QGZiIGFfsLvV2KXZO6W+qL+JEP0dn0SQY34IU8sfbK0Q
 z8bw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUZ67DA/TSrCTotzKXsce7rHejuAhL+z3w1FLiog/QCeLhwNJCIMeGo/Lx8FvFR2JIuX3+qYNfn2lVD@nongnu.org
X-Gm-Message-State: AOJu0YzDKhgRnThYOjhkoLgOjZXZaXV1+r6PDTuDoBXQjx729gJNFGLx
 ztanfdXtchjuicNbl56srhNsSXulWb0vYcC2Z5F/uyLZc4oZvZ8m6K51IcTY+Vo=
X-Gm-Gg: ASbGncv+M4DO/I1QU+93osjZETKb0K65Z9h9RhfujOUWxoGf2D2GJ60UXyLERzcpJuW
 F1/1Kbe0mQ7RxxVwtGU3OkXNKjqSs+ghX4m+wm4iyCpjjYQC+glvLtvXISnIIPJwzSu5dPfZhqr
 fPuCL4UefdrIY93lf2iBf4GWAuAtyIjSXl2tBIBRtfbt6F0S75qAvwcbhQySRDfpvpwSjn8xOL5
 QIfS2GT1eyNTvhwxmU1FQQMSoyEoRCCS5TL090bL8BKzgIgL4GXkKgQAHUwBo6ztRPkLAdDx0jz
 sYir9WGnTWtFLe4c4G7SICb1O4j8dr2BL4qfXliq+A==
X-Google-Smtp-Source: AGHT+IHxVDYyKpYwtJ+1A1Bf7wGgyAP+9lfoTaWvf61tYJAzDK5MIkQnvyCIrrxGe1OBeEPQNqxHFQ==
X-Received: by 2002:a05:6402:3217:b0:5d0:d610:caa2 with SMTP id
 4fb4d7f45d1cf-5d972e4779dmr26007286a12.26.1736930244839; 
 Wed, 15 Jan 2025 00:37:24 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz.
 [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d9903c4598sm6958310a12.53.2025.01.15.00.37.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jan 2025 00:37:23 -0800 (PST)
Date: Wed, 15 Jan 2025 09:37:22 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com
Subject: Re: [PATCH v2 3/4] target/riscv: add RVA23U64 profile
Message-ID: <20250115-dc4eba2a304da3c590db099d@orel>
References: <20250114190001.1650942-1-dbarboza@ventanamicro.com>
 <20250114190001.1650942-4-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250114190001.1650942-4-dbarboza@ventanamicro.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=ajones@ventanamicro.com; helo=mail-ed1-x533.google.com
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

On Tue, Jan 14, 2025 at 04:00:00PM -0300, Daniel Henrique Barboza wrote:
> Add RVA23U64 as described in [1]. Add it as a child of RVA22U64 since
> all RVA22U64 mandatory extensions are also present in RVA23U64. What's
> left then is to list the mandatory extensions that are RVA23 only.
> 
> A new "rva23u64" CPU is also added.
> 
> [1] https://github.com/riscv/riscv-profiles/blob/main/src/rva23-profile.adoc
> 
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>  target/riscv/cpu-qom.h |  1 +
>  target/riscv/cpu.c     | 32 ++++++++++++++++++++++++++++++++
>  2 files changed, 33 insertions(+)
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

