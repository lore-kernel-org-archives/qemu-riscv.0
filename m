Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pQ341-0000L2-9F
	for mharc-qemu-riscv@gnu.org; Thu, 09 Feb 2023 04:17:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pQ340-0000Kj-AT; Thu, 09 Feb 2023 04:17:56 -0500
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pQ33y-00048V-PA; Thu, 09 Feb 2023 04:17:56 -0500
Received: by mail-ed1-x52c.google.com with SMTP id fi26so1543912edb.7;
 Thu, 09 Feb 2023 01:17:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=pJ6r7mYaI1UsAzfho69LwMW1jUtIjUtEm6l7ZwN22oU=;
 b=ENuxUsobW6ajaKJLWxrtOMXT+WNw47zjXrRmiC9pY75neVss+l/8GKGE7XVAgrJojS
 1LIGiDW6C8M4/Rbc9DJvc5dgV9okWXvvIkzM5EGuBruCtbjjop0pWVpuBfnn2kkKJxjP
 o7hQMXSh52PdsfbUCt+F+7ZE9lUtnLWfpDB9E0afJB9wt+dJXa6692bY/88RbM5pReoR
 HM8c1LgxDEK+OFVHOqtRxr/Ghh1qWQVCTgW5+XwXkdcolsc1TbpR8lySFIYT10l6pMbe
 V+a1wfInCwX3RttsNRA1zKaMjDgBWPs3iR//BGB+0cl048qnOXs8F5Xo5qEzQnHt8R22
 0I9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pJ6r7mYaI1UsAzfho69LwMW1jUtIjUtEm6l7ZwN22oU=;
 b=nl5PmNyRGX9o49l0CJQ/jWEsEZpUNeYmuU6aBBBkdqZiBQP//TwVcZTUMgMWyN+3CQ
 Uyg15EFx3cO595w60xO5oLS/v+cavwBTGUzlkcp7rDWNb2mg1+Ron0vQe8aNCidi+IAA
 pjNrEPvXtzT7xrWFiQAM0gE4f4Urkf6CDXHtF6t9JvrUaw+SBqEIJD8IXvE/Gje7zRNs
 PQqJobjm2a3pcrcF0dQTvDENvx0cBXKJXOVZ4avt7M9R62/FhV9FZt0Kff0i4kcIHclp
 68t6NUidfUGvEYnHj/eHtiVHgDDjwDU/Oj/vb8OxNKVZT7NiRXEHd4t/USRVqzC9W7pD
 zOGg==
X-Gm-Message-State: AO0yUKW/lzrVCemJIbdHWmNRB94pha7I7Iz1WX5RlmZjeZINBBKBrNDT
 y1N5EHDJoFJiPI84YA8H+HaNYTOhGiRUxL3ZkIs=
X-Google-Smtp-Source: AK7set9XvTEX2kEw7HOmWkhnm8KbUc015IAXutsglwMtLYb+RBVodZARFyhatuihWrEWbRUV81rBu8wPtUtE194n5t8=
X-Received: by 2002:a50:d0c3:0:b0:49c:b721:142c with SMTP id
 g3-20020a50d0c3000000b0049cb721142cmr1487918edf.1.1675934272503; Thu, 09 Feb
 2023 01:17:52 -0800 (PST)
MIME-Version: 1.0
References: <20230209003308.738237-1-alistair.francis@opensource.wdc.com>
In-Reply-To: <20230209003308.738237-1-alistair.francis@opensource.wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 9 Feb 2023 17:17:41 +0800
Message-ID: <CAEUhbmWQpX9184k6ht+v=o4xHUwO2A-7ys7Qb-0WPokjQB1ufw@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Add some RISC-V reviewers
To: Alistair Francis <alistair.francis@opensource.wdc.com>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, alistair23@gmail.com, 
 dbarboza@ventanamicro.com, alistair.francis@wdc.com, palmer@dabbelt.com, 
 zhiwei_liu@linux.alibaba.com, liweiwei@iscas.ac.cn
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ed1-x52c.google.com
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
X-List-Received-Date: Thu, 09 Feb 2023 09:17:56 -0000

On Thu, Feb 9, 2023 at 8:33 AM Alistair Francis
<alistair.francis@opensource.wdc.com> wrote:
>
> From: Alistair Francis <alistair.francis@wdc.com>
>
> This patch adds some active RISC-V members as reviewers to the
> MAINTAINERS file.
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  MAINTAINERS | 3 +++
>  1 file changed, 3 insertions(+)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

