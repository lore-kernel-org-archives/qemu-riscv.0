Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pSFsf-0000eu-5v
	for mharc-qemu-riscv@gnu.org; Wed, 15 Feb 2023 06:23:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pSFsN-0000YF-Sc; Wed, 15 Feb 2023 06:23:06 -0500
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pSFsK-0000iE-TV; Wed, 15 Feb 2023 06:23:02 -0500
Received: by mail-ed1-x52a.google.com with SMTP id eq11so21530389edb.6;
 Wed, 15 Feb 2023 03:22:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Q0IULD+r2Flzdil4rEhZswBrFS6z8WMfgxp4EtZKkww=;
 b=lKBKPuq33mEFJjT3IOWwEP+v5W7Bf73InnTvsD4yuPVt9M4XvLpYTs7EAn/ADc4o2W
 xLpuBJHkT4vmBTP/DqTruDo0RZX70axQn6d0vT+xApsjTmWl/COVnsr53g1b5vPs7RF2
 /dDW/Q0arz8k+Ab3jgoPM00aq+Yg5RUS0VUNpom7AJM/RADRiVkXq5cASpjF2g1Qolb8
 51O20gDqYev+94KrwrL5PxNChYUp35hK3trrRBjzHGJx4/U3zj3SNWhE9/hN1UnAWN24
 QbKla6P0VFg83BOeYHFGw/+FOu432Nd3CP+uDbEglu6gpitAl1XzgRqcaJt/tdZH1m0u
 IPPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Q0IULD+r2Flzdil4rEhZswBrFS6z8WMfgxp4EtZKkww=;
 b=YSslMk+Q61QIXxKT5VYhJXMFnuqElqISV94rXC+kzZs16Kx05aYlS+V9oGkFAcfIoy
 dGaMJNbmMh54oiZtnWP5BClCTa8kPZVX44Q9mzF3swpq0YQHY0fZLxjM2qfTUcIY/q7+
 J0HPoMoLE521bMufkHekIEfsDnFDMaZZtkd6Lc86hF2vT4ZKwjZdqi4wruPV9j4QWFWX
 D7WPi9pNBIbOq8eW3tTJtCpacMf+V+tPMwrEQaP8IarzYgODwfEzU/+FXz3uSn1/9Nwz
 pl3k27l5hD3U396DfGFS7JZEgSU0fny+Tv0Z9jbyvUjuj4mo414F/xN5so3bU138kzAl
 3KeQ==
X-Gm-Message-State: AO0yUKUKWm7BDLdkZ+/IolJUcQcSHLdsH8Ac1YgifQSIf8hBG8fl9CGG
 YbBzw4h8nInZdk3e1cTRmN759DF307KTY57NNpk=
X-Google-Smtp-Source: AK7set+CnaK3xBx+knzvsF0K3b67rZRUsJixmxwQQmro4tFjJTez1GWrUTgFLa9oC0+iZR/joWWfJpg6r3Zc27SYDYI=
X-Received: by 2002:a50:bb4e:0:b0:4ac:bb37:a501 with SMTP id
 y72-20020a50bb4e000000b004acbb37a501mr1240145ede.1.1676460174885; Wed, 15 Feb
 2023 03:22:54 -0800 (PST)
MIME-Version: 1.0
References: <20230214192356.319991-1-dbarboza@ventanamicro.com>
 <20230214192356.319991-7-dbarboza@ventanamicro.com>
In-Reply-To: <20230214192356.319991-7-dbarboza@ventanamicro.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 15 Feb 2023 19:22:43 +0800
Message-ID: <CAEUhbmVYti4rXryTxX1hZPTn-eJNZ42MngqgSNLVq4ssSimCkw@mail.gmail.com>
Subject: Re: [PATCH v2 06/11] target/riscv/cpu.c: error out if EPMP is enabled
 without PMP
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ed1-x52a.google.com
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

On Wed, Feb 15, 2023 at 3:24 AM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> Instead of silently ignoring the EPMP setting if there is no PMP
> available, error out informing the user that EPMP depends on PMP
> support:
>
> $ ./qemu-system-riscv64 -cpu rv64,pmp=false,x-epmp=true
> qemu-system-riscv64: Invalid configuration: EPMP requires PMP support
>
> This will force users to pick saner options in the QEMU command line.
>
> Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>  target/riscv/cpu.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>

Reviewed-by: Bin Meng <bmeng@tinylab.org>

