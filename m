Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22DB0C47DDB
	for <qemu-riscv@archiver.kernel.org>; Tue, 23 Jan 2024 08:21:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rSC1C-0000eV-85; Tue, 23 Jan 2024 03:20:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1rSC1A-0000cg-NM
 for qemu-riscv@nongnu.org; Tue, 23 Jan 2024 03:20:24 -0500
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1rSC18-0000GW-FJ
 for qemu-riscv@nongnu.org; Tue, 23 Jan 2024 03:20:24 -0500
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-55c932f7fcbso45455a12.3
 for <qemu-riscv@nongnu.org>; Tue, 23 Jan 2024 00:20:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1705998020; x=1706602820; darn=nongnu.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=jUV2ETur/YHhD2L9r2syN08M+wLYBj7G/QeHONE9k4A=;
 b=Y+pGHeiiMv0c10XnaR55SM9C3UZZNClJTCWT3Udb6Uu7hww2y95Icj8XS56jCkSfOr
 IrgCj7AmJ7fUhUoRQqhu7X+6tTwcHAGtyz0Vb1qbOmMHvXj+VoZ4dylKPzan0BhFFlww
 La2GlotTjw0fMfo2hFxKE8ETp3M0ol9/UUkCVqFk6C1n9yUHEX6hiRogto9vlkIIC/8W
 un+T/ufwsf1kbqjjCldNvQ9KmfLLTQ3y/jzkOLHMX+5YQlfRigbPbvS8T4Ev7rIHQB40
 yo7DPd08/jsx7NcdMAi9CUF4lexkr5YrAEmvuBo3wU3SjrSHyK0w1eivUZ2yqbown05A
 8zKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705998020; x=1706602820;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jUV2ETur/YHhD2L9r2syN08M+wLYBj7G/QeHONE9k4A=;
 b=ZJx7uYLJexV/qielqvhjk8KUaR4hKKgDOQDz/6CihiK+UmImgRW3OZCwrkEqhthERk
 GUJRA1DpL97pTINXVL4EmWhTYbRyMS8uHUkcnpr+orm1Mf0MGsxlgJE3Nc9jCJPgpZI/
 zwgylGd7v0eOJG17zMv2NRvqSYy/KEWhUTzW9aRmB4OI7NU1vEacNEfPzfNjzqzER3/1
 pYTrwJ6FyPRBVD2mW2s2J7MJQL7+bHwxrD37brG+LVHu96/aEg/vnap7zy76La6fDEjU
 xv5Lx+eMKCcHZOs0Eb3AN1Z4GttX4ZYke7xxe9JS6dz+NOAjURpyNYatr2MyhA9vvxWi
 R/Pw==
X-Gm-Message-State: AOJu0YzydA2Q7EBbavFswfaWPsEiQHKhy6b/zLLZGIlAA5qeQWNIFZWg
 1AaUjJ/Hb+lotjaYL5au3vw8V3z9rpMjwfvcrI2DTjiwXtnXQEbH1faH2xPFLMM=
X-Google-Smtp-Source: AGHT+IHrnFo96kFqXrbmtDTaJ16lW2vZWFoc71DDaTGvlSuwCuKmyi9E4Xkwwz9HfBbRN5oWg8OMmg==
X-Received: by 2002:aa7:c982:0:b0:559:3583:bb6d with SMTP id
 c2-20020aa7c982000000b005593583bb6dmr667767edt.32.1705998020528; 
 Tue, 23 Jan 2024 00:20:20 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
 by smtp.gmail.com with ESMTPSA id
 ec32-20020a0564020d6000b0055c4c97b1f2sm1716628edb.91.2024.01.23.00.20.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jan 2024 00:20:20 -0800 (PST)
Date: Tue, 23 Jan 2024 09:20:18 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>, 
 Michael Rolnik <mrolnik@gmail.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>, 
 Laurent Vivier <lvivier@redhat.com>, kvm@vger.kernel.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>, 
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Laurent Vivier <laurent@vivier.eu>, 
 Yanan Wang <wangyanan55@huawei.com>, qemu-ppc@nongnu.org,
 Weiwei Li <liwei1518@gmail.com>, 
 qemu-s390x@nongnu.org, =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>, 
 Peter Maydell <peter.maydell@linaro.org>, Alexandre Iooss <erdnaxe@crans.org>, 
 John Snow <jsnow@redhat.com>, Mahmoud Mandour <ma.mandourr@gmail.com>, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Ilya Leoshkevich <iii@linux.ibm.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 David Woodhouse <dwmw2@infradead.org>, Cleber Rosa <crosa@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, 
 Bin Meng <bin.meng@windriver.com>, Nicholas Piggin <npiggin@gmail.com>, 
 Aurelien Jarno <aurelien@aurel32.net>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Thomas Huth <thuth@redhat.com>, 
 David Hildenbrand <david@redhat.com>, qemu-riscv@nongnu.org,
 qemu-arm@nongnu.org, 
 Paolo Bonzini <pbonzini@redhat.com>, Song Gao <gaosong@loongson.cn>, 
 Eduardo Habkost <eduardo@habkost.net>, Brian Cain <bcain@quicinc.com>,
 Paul Durrant <paul@xen.org>, Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: Re: [PATCH v3 01/21] hw/riscv: Use misa_mxl instead of misa_mxl_max
Message-ID: <20240123-b8d1c55688885bfc9125c42b@orel>
References: <20240122145610.413836-1-alex.bennee@linaro.org>
 <20240122145610.413836-2-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240122145610.413836-2-alex.bennee@linaro.org>
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=ajones@ventanamicro.com; helo=mail-ed1-x52c.google.com
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

On Mon, Jan 22, 2024 at 02:55:50PM +0000, Alex Bennée wrote:
> From: Akihiko Odaki <akihiko.odaki@daynix.com>
> 
> The effective MXL value matters when booting.

I'd prefer this commit message get some elaboration. riscv_is_32bit()
is used in a variety of contexts, some where it should be reporting
the max misa.mxl. However, when used for booting an S-mode kernel it
should indeed report the effective mxl. I think we're fine with the
change, though, because at init and on reset the effective mxl is set
to the max mxl, so, in those contexts, where riscv_is_32bit() should
be reporting the max, it does.

> 
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> Message-Id: <20240103173349.398526-23-alex.bennee@linaro.org>
> Message-Id: <20231213-riscv-v7-1-a760156a337f@daynix.com>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  hw/riscv/boot.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
> index 0ffca05189f..bc67c0bd189 100644
> --- a/hw/riscv/boot.c
> +++ b/hw/riscv/boot.c
> @@ -36,7 +36,7 @@
>  
>  bool riscv_is_32bit(RISCVHartArrayState *harts)
>  {
> -    return harts->harts[0].env.misa_mxl_max == MXL_RV32;
> +    return harts->harts[0].env.misa_mxl == MXL_RV32;
>  }

Assuming everyone agrees with what I've written above, then maybe we
should write something similar in a comment above this function.

Thanks,
drew

