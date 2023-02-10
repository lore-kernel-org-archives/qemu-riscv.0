Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pQI9x-0001cO-87
	for mharc-qemu-riscv@gnu.org; Thu, 09 Feb 2023 20:25:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pQI9v-0001br-Fc; Thu, 09 Feb 2023 20:25:03 -0500
Received: from mail-vs1-xe35.google.com ([2607:f8b0:4864:20::e35])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pQI9t-0003qS-V0; Thu, 09 Feb 2023 20:25:03 -0500
Received: by mail-vs1-xe35.google.com with SMTP id g3so4113646vsr.10;
 Thu, 09 Feb 2023 17:24:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=+asVm7u65dXPQ36PhG8wEvnGhi/T3yC98Hy4eT60BXg=;
 b=XrRlhJYg54QhlzYoboi2C76u9uP1qUMe8CALWWviLctk0McLf7BTzKOqIFzkV082y+
 Z8gJTcwj/5SrTzMrV6AE+zpSueJJ79/A3GsWTybrG7tkYknhFbBtw7+tFuQ/F0SXymD1
 FoWmnVWXDPPm+XUymJ2+Fxo9QT44udv5wjQ5KYnJ4wFL7XThYZoYbzMRMIciIR6qmApo
 92W0nvvp6eT9y/sd+fcBKrpYOH76GalSNsBx2/0wanErH2PbV81/P2V/L+XWBb6b+eau
 iO3Ii5XPkqddgZPklGHxUgCwOMnqDD79Vqnt242QMsItcYrd8vSBEmz7WcSO389UgVTQ
 ub8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+asVm7u65dXPQ36PhG8wEvnGhi/T3yC98Hy4eT60BXg=;
 b=ml/kx0aCAxc8sSUNwzUTrEBuoYEqlQiPLea14+JYGfHHWkjCn50hEGtjf4AJfaJ0n0
 Xf2cByGN7xStndSh9Kma3wjSP4dx5YeL6VGEFADzpr8YL51wKg31WJ86JR3PCvbNzYp6
 Fh85EG279qWE9kvFmqbBypblUjZGBq4dXzDyJK2uXSGwCzd0Dlsn1j8b+jQgUoKBb0j6
 MUF/M4vnaIrDOAmIvKYO0/m/cuzC8LDzw6+ma0YJiBXz8yG+mc2tIDHJMOaUSRpFwzal
 pwDqMEh00DalOeesiRwStewoncd2xawzicpbeJ/Gzn9SmFtAPnxbuKaxb8xFqCYwUrKf
 JV0g==
X-Gm-Message-State: AO0yUKUf22sm8h1k1lK8efICuCnCyRFewz2g93KbqiBsFdRZUqOh64lh
 KRWQiDaC6Ay6A8B2gzNCISqxgzyAeTtJGpv0NGE=
X-Google-Smtp-Source: AK7set9/SLH62mB3LZ6uwssO2HgvVVhQLfDVbKEY0lSFrNFVLxtV0AnutiKTxXeNX8K5flMAX6wBftE0Gu+hiOttroA=
X-Received: by 2002:a67:a407:0:b0:3f0:89e1:7c80 with SMTP id
 n7-20020a67a407000000b003f089e17c80mr2494304vse.72.1675992298230; Thu, 09 Feb
 2023 17:24:58 -0800 (PST)
MIME-Version: 1.0
References: <20230209003308.738237-1-alistair.francis@opensource.wdc.com>
In-Reply-To: <20230209003308.738237-1-alistair.francis@opensource.wdc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 10 Feb 2023 11:24:19 +1000
Message-ID: <CAKmqyKMd4e_UQQNobcWKB0chi8ZETq8Dc=dZSYdJn=3n65wwFg@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Add some RISC-V reviewers
To: Alistair Francis <alistair.francis@opensource.wdc.com>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, bmeng.cn@gmail.com, 
 dbarboza@ventanamicro.com, alistair.francis@wdc.com, palmer@dabbelt.com, 
 zhiwei_liu@linux.alibaba.com, liweiwei@iscas.ac.cn
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e35;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe35.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Fri, 10 Feb 2023 01:25:03 -0000

On Thu, Feb 9, 2023 at 10:33 AM Alistair Francis
<alistair.francis@opensource.wdc.com> wrote:
>
> From: Alistair Francis <alistair.francis@wdc.com>
>
> This patch adds some active RISC-V members as reviewers to the
> MAINTAINERS file.
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>

Thanks!

Applied to riscv-to-apply.next

Alistair

> ---
>  MAINTAINERS | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 96e25f62ac..847bc7f131 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -287,6 +287,9 @@ RISC-V TCG CPUs
>  M: Palmer Dabbelt <palmer@dabbelt.com>
>  M: Alistair Francis <alistair.francis@wdc.com>
>  M: Bin Meng <bin.meng@windriver.com>
> +R: Weiwei Li <liweiwei@iscas.ac.cn>
> +R: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> +R: Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
>  L: qemu-riscv@nongnu.org
>  S: Supported
>  F: target/riscv/
> --
> 2.39.1
>

