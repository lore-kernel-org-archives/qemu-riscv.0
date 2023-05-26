Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96FF7C77B7A
	for <qemu-riscv@archiver.kernel.org>; Fri, 26 May 2023 09:48:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q2U3g-00039r-Ow; Fri, 26 May 2023 05:48:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q2U3f-00039F-9D
 for qemu-riscv@nongnu.org; Fri, 26 May 2023 05:48:27 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q2U3d-0000Vb-NH
 for qemu-riscv@nongnu.org; Fri, 26 May 2023 05:48:27 -0400
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-30a4ebbda56so461082f8f.1
 for <qemu-riscv@nongnu.org>; Fri, 26 May 2023 02:48:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685094503; x=1687686503;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=jvnPyrUogBm/JtIQwNTHgNsIbdQ2uVO1jSkuke5wens=;
 b=ZTHs+ksVkiibSwEkR5ypytM+Xo7MKBuPfAqfVS+jEifcZtW7X1drS+P2LNEJPgFksu
 ATtADQOzLYBjQeUFeoC0ehY722o7m7X9wzcr/UvsWAMIk3ySjFEQUFU8xZ8/s03HcAsk
 1u3wTFGNc+8uKCbxRJfDJ2AYKa2JAuk6p2DZ/WCgmPpIQIPNEcVnzc23VGKSB0O+YCEm
 SX5FKuPQof7+ZET1q41RhCLaDRTu1tgzK1aukVVlOt/O5AQrQ28fkAHpHxQch7h6svFK
 rxEtlx07vT1Ra+AVzFniWUt1WI0pts4QZIwtQPsCVf9VoqmDPoayAsf/ATxME6Ins4DB
 qbOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685094503; x=1687686503;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jvnPyrUogBm/JtIQwNTHgNsIbdQ2uVO1jSkuke5wens=;
 b=DFw9LUwMTH3jrZLwCcGYp1r0/dsXV8h1IHL+wIAfrvvavCN/DXjpcxYOjCCZqJxjy3
 570UVGcWW81iH1QQUN4IRXCTGTl+cGgMb07F8uKsBqnLqX9NGMbYyFT+TFoUX93dB9P/
 6ofq0X1nn53x1ObohiebzPEYbw2rmg3+RVVlXkvN5jbk4Ddtb+ohCPJGA1gsChsbYhsh
 MKBfHDKOMvvGRBRbqZQCXqG1LB0ONtpWpWXaYhkJBHX+7z/tNSchoZMseu0GNzvJjI6i
 Xf5WojUSfS5il2EuyOspWREHSC1G16Y1tPsKjivrIhEYRy+DKuM1fjNLIM7i55yqFzN8
 GqJA==
X-Gm-Message-State: AC+VfDw59TunZs47z/OKY0ZB9zOmGg2BirEWzdnElN7KcM0KylN+d62O
 Mt6DPg797b6Gq1XPTo+YnH65NQ==
X-Google-Smtp-Source: ACHHUZ5KmGolLCIqpYmxm4q3q+YzHc4wMb2HCTBXlcFtRtULvTJuUTDDmXuhL5d1CdkKEGSpWIm+pQ==
X-Received: by 2002:a5d:4531:0:b0:309:3da5:be89 with SMTP id
 j17-20020a5d4531000000b003093da5be89mr821580wra.71.1685094503471; 
 Fri, 26 May 2023 02:48:23 -0700 (PDT)
Received: from [192.168.69.115] (vit94-h02-176-184-29-207.dsl.sta.abo.bbox.fr.
 [176.184.29.207]) by smtp.gmail.com with ESMTPSA id
 o3-20020a5d6843000000b003095a329e90sm4502463wrw.97.2023.05.26.02.48.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 May 2023 02:48:23 -0700 (PDT)
Message-ID: <6817fb90-fda2-6769-c993-a8307dd841b1@linaro.org>
Date: Fri, 26 May 2023 11:48:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.11.0
Subject: Re: [PATCH v4 3/3] docs/system: riscv: Add pflash usage details
Content-Language: en-US
To: Sunil V L <sunilvl@ventanamicro.com>, qemu-riscv@nongnu.org
Cc: qemu-devel@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Andrea Bolognani <abologna@redhat.com>
References: <20230525164803.17992-1-sunilvl@ventanamicro.com>
 <20230525164803.17992-4-sunilvl@ventanamicro.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230525164803.17992-4-sunilvl@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.091,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 25/5/23 18:48, Sunil V L wrote:
> pflash devices can be used in virt machine for different
> purposes like for ROM code or S-mode FW payload. Add a
> section in the documentation on how to use pflash devices
> for different purposes.
> 
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> ---
>   docs/system/riscv/virt.rst | 29 +++++++++++++++++++++++++++++
>   1 file changed, 29 insertions(+)
> 
> diff --git a/docs/system/riscv/virt.rst b/docs/system/riscv/virt.rst
> index 4b16e41d7f..c3e0b7a9c3 100644
> --- a/docs/system/riscv/virt.rst
> +++ b/docs/system/riscv/virt.rst
> @@ -53,6 +53,35 @@ with the default OpenSBI firmware image as the -bios. It also supports
>   the recommended RISC-V bootflow: U-Boot SPL (M-mode) loads OpenSBI fw_dynamic
>   firmware and U-Boot proper (S-mode), using the standard -bios functionality.
>   
> +Using flash devices
> +-------------------
> +
> +The first flash device (pflash0) can contain either ROM code
> +or S-mode payload firmware code. If the pflash0 contains the
> +ROM code, -bios should be set to none. If -bios is not set to
> +none, pflash0 is assumed to contain S-mode payload code.
> +
> +Firmware images used for pflash should be of size 32 MiB.
> +
> +To boot as ROM code:

If "ROM" ...

> +
> +.. code-block:: bash
> +
> +  $ qemu-system-riscv64 -bios none \
> +     -blockdev node-name=pflash0,driver=file,filename=<rom_code> \

... shouldn't we also enforce 'read-only=on,' ...

> +     -M virt,pflash0=pflash0 \
> +     ... other args ....
> +
> +To boot as read-only S-mode payload:
> +
> +.. code-block:: bash
> +
> +  $ qemu-system-riscv64 \
> +     -blockdev node-name=pflash0,driver=file,read-only=on,filename=<s-mode_fw_code> \

... like in S-mode?

> +     -blockdev node-name=pflash1,driver=file,filename=<s-mode_fw_vars> \
> +     -M virt,pflash0=pflash0,pflash1=pflash1 \
> +     ... other args ....
> +
>   Machine-specific options
>   ------------------------
>   


