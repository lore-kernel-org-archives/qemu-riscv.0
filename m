Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pSFsd-0000cp-P9
	for mharc-qemu-riscv@gnu.org; Wed, 15 Feb 2023 06:23:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pSFsO-0000YD-9n; Wed, 15 Feb 2023 06:23:06 -0500
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pSFsK-0000iO-TK; Wed, 15 Feb 2023 06:23:02 -0500
Received: by mail-ej1-x634.google.com with SMTP id a3so13341154ejb.3;
 Wed, 15 Feb 2023 03:22:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ed80XoNAVnSqtKDt/QSybjFxYrH9cFAShJt71woma0A=;
 b=k81cpA5zFvdtuCCX15ZXr5TwXFeYTBA8tmE67meHglMIHucsYRSPwQS0MmlJOPAFfE
 rL0Rsjw/vgLrtZubWr0X1uq+G34W6zEHwLFwmwWO8yUApD2MxvfRVnh4edoV69clZCjZ
 S9Y18qY4dzQtt+tUN213rS2QsFUeFBjXHgdpUXQh2qZbVG5yVrP8jifi4grNI5dTAW3L
 ISo/Z6PjoH0+wjDOi8WPeu9T5wlXpnUhR+JM+ZAJ8BfvX5jzk3k56qP/gWrhkBwFt+R5
 AeEIp3c/W+3/bdn8cRw3azH6uH5JvG742rr+TG/2au309XK7fHX8XW/OIbrO2aE/kTkW
 d+eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ed80XoNAVnSqtKDt/QSybjFxYrH9cFAShJt71woma0A=;
 b=5ibkuUkTvetzgBP0XdpuBesIY3MaWw2dx7f1xH3EXGj6a5CLwBn8ZVh1qPe2Bv8k2e
 tH/LKeHSif91imtS5urF1ha/khVIW9BGpg8A1hrml8zM06xgxUrPdxNUOikf7qgzyt44
 u4nDCmEIEXFWDZCOPDSHh9/YMA1tgaQqMW4Fs6wkFbABinbPYXFvCqrylFB/IcBRzbc+
 ZQWkDF/2iDZSr23Un+oMJbLK9CSCXovxTffRmys1Yn+/ZP19glpD7+AUETvHv4lciVyu
 ljGgfF61oIpGYnOmL2GZir0xC55tg90vg+EqlB/CrlrZGvcpqhKDPN0Yi2GlZfKAYzDn
 CnlQ==
X-Gm-Message-State: AO0yUKXjOGmsjGcRZS0L5awVBVuw6ShyC3/gEtQQlqZZZito8kdRXyFk
 /11cxL1Re4dBVSIV03fRsy4OY7G7L3PjwSlD9og=
X-Google-Smtp-Source: AK7set/Fe2HoPFUQGm8672seyCxMN0yPhXM+4gxFRHKsoFrUE6kVTMerUAESTE5TAswRGcUm/oVoSpIBdjHynu2vnew=
X-Received: by 2002:a17:906:cc88:b0:878:4a24:1a5c with SMTP id
 oq8-20020a170906cc8800b008784a241a5cmr902536ejb.6.1676460177470; Wed, 15 Feb
 2023 03:22:57 -0800 (PST)
MIME-Version: 1.0
References: <20230214192356.319991-1-dbarboza@ventanamicro.com>
 <20230214192356.319991-8-dbarboza@ventanamicro.com>
In-Reply-To: <20230214192356.319991-8-dbarboza@ventanamicro.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 15 Feb 2023 19:22:46 +0800
Message-ID: <CAEUhbmUn04i2BccNB-o9Z-+tBu0aETTPtkCSGd1S0Q2+eqGXgA@mail.gmail.com>
Subject: Re: [PATCH v2 07/11] target/riscv: remove RISCV_FEATURE_EPMP
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ej1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Wed, 15 Feb 2023 11:23:08 -0000

On Wed, Feb 15, 2023 at 3:25 AM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> RISCV_FEATURE_EPMP is always set to the same value as the cpu->cfg.epmp
> flag. Use the flag directly.
>
> Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>  target/riscv/cpu.c | 10 +++-------
>  target/riscv/cpu.h |  1 -
>  target/riscv/csr.c |  2 +-
>  target/riscv/pmp.c |  4 ++--
>  4 files changed, 6 insertions(+), 11 deletions(-)
>

Reviewed-by: Bin Meng <bmeng@tinylab.org>

