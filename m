Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pSFsA-0000WG-Dk
	for mharc-qemu-riscv@gnu.org; Wed, 15 Feb 2023 06:22:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pSFs8-0000Vb-4d; Wed, 15 Feb 2023 06:22:48 -0500
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pSFs6-0000h6-Ki; Wed, 15 Feb 2023 06:22:47 -0500
Received: by mail-ej1-x636.google.com with SMTP id k16so15823357ejv.10;
 Wed, 15 Feb 2023 03:22:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Nw5udpKncW9A26EM/30St3i1sd2nB9iAJkzKPHscAQ4=;
 b=Xeqw/36lG3XvFoGhhtrlmK24MvtRfMa/yy/8Ewz+UC/nEFYcz5vB0FVdgdzHh6hNaO
 0ePar9/U2Ad67/rsOdeNvtJDJOnSHjKA/iu5qxgzrAiCoFEMSV/T7T3GI8sQwOKcKvnf
 LQodCl0Rm791gPQ6kjV0CocQTYXqcugyKnvXJy0GZAbAOOetosLKmpzQr8fJigVugSDA
 ivALgAB5959bedgD6mdeV/VBYqRUX6Gz7mcRAUaFYjARwHL2x6mFotP/6EoZnoNI4V06
 NGiTDFeGmbdhcjd8Aucr2U0kCJZbhqV4QHkiOxxnzgt/6T1e6CXTLq1okNAbdgl4UXD4
 wshQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Nw5udpKncW9A26EM/30St3i1sd2nB9iAJkzKPHscAQ4=;
 b=dN4pTzk6rTk4XrIHld3IuaIyLZrFCpU+xu1cnd6TRtKVk+JncQIWHjnGBL9qw55VNu
 SHkr47PxHxiFdD9KkWMZKiC2MbWb2P8V3FYJAWoX9bNLyQGoDeLh4+RJ7j5BFjri+n3C
 3ys+oDvTzi4RjlMH4g+O3T9woc8siV1Tvivv1uWXFl4mAdJJVGegVBZxKR+kLFusvA1X
 vePQHsNTPTkNDI237ggSJ2cy0I2D+ahDzDI6tycVpurGzGpgJ2C5j+mTiDxrGCnrLOkH
 o8thtef4ybwQ1pL16jK71pef9xxQskrVYBaDBCPLP6GAMAMP2aqc8Motb6RSHco0R/p9
 hHbg==
X-Gm-Message-State: AO0yUKXFKFmRflEbsEUOqqLCIY1fFdFpZLb7KJTI2ogOo4xakfI5ZBFh
 NpUWqxukrxxk3nkKpktXKZ4EjaroFX6ciVx6HxQ=
X-Google-Smtp-Source: AK7set/wLJBV6AIswlR0IMdEB/LJ824N3m6R/EoC8VXpSxzTLXiUifPCnWpJ6YYnkYAiwSgPNg747z+VNRRtlqrd0y4=
X-Received: by 2002:a17:906:dfd1:b0:8af:373f:4735 with SMTP id
 jt17-20020a170906dfd100b008af373f4735mr873398ejc.6.1676460164328; Wed, 15 Feb
 2023 03:22:44 -0800 (PST)
MIME-Version: 1.0
References: <20230214192356.319991-1-dbarboza@ventanamicro.com>
 <20230214192356.319991-2-dbarboza@ventanamicro.com>
In-Reply-To: <20230214192356.319991-2-dbarboza@ventanamicro.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 15 Feb 2023 19:22:32 +0800
Message-ID: <CAEUhbmXS2saB7K+jZUtBfS59kj1A2NsS-rSgkSvgZaeFv+R70w@mail.gmail.com>
Subject: Re: [PATCH v2 01/11] target/riscv: do not mask unsupported QEMU
 extensions in write_misa()
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ej1-x636.google.com
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
X-List-Received-Date: Wed, 15 Feb 2023 11:22:48 -0000

On Wed, Feb 15, 2023 at 3:26 AM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> The masking done using env->misa_ext_mask already filters any extension
> that QEMU doesn't support. If the hart supports the extension then QEMU
> supports it as well.
>
> If the masking done by env->misa_ext_mask is somehow letting unsupported
> QEMU extensions pass by, misa_ext_mask itself needs to be fixed instead.
>
> Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>  target/riscv/csr.c | 3 ---
>  1 file changed, 3 deletions(-)
>

Reviewed-by: Bin Meng <bmeng@tinylab.org>

