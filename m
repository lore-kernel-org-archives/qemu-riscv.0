Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pFU58-0003nB-5o
	for mharc-qemu-riscv@gnu.org; Wed, 11 Jan 2023 00:55:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pFU52-0003mO-4w; Wed, 11 Jan 2023 00:55:21 -0500
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pFU50-0004q8-Eq; Wed, 11 Jan 2023 00:55:19 -0500
Received: by mail-ej1-x633.google.com with SMTP id ss4so26936524ejb.11;
 Tue, 10 Jan 2023 21:55:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=oTsQvlLXDij0T2arwwsxKvmrZt8+Xx79D23KJCCsFJ4=;
 b=gdPIrXX5XeSfFuTuKbD7fWc7vfI3tVvDnblrJ25ktXPDJCy7zC9MzGpxyDm3ofgfM0
 RQnCFUWSczY3bOk+XyLky+yYmpK8stGnngs95cuR+AKxQl8WP2CYLG+wuOJ/qtmEZaNH
 inKqeNuG5qIQBJZcWMZoE6xe6qmzdrljXj5y9rBFi5+sipv6PNdHSN4+c30Op5fSIngj
 134/07Y4B0mlgbLaChKQ0v9D0rS19+9UCcsPIncOR4P49rvHEBYs/79Bg0ez4Ed/IWNS
 PMHh2SPHeL4UTiSv3iG90BuiDr4O4sNTdefFMUJ4no07ItGTFhh/B9zadA0QTJOVRdVD
 ZVLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oTsQvlLXDij0T2arwwsxKvmrZt8+Xx79D23KJCCsFJ4=;
 b=Uf9ZiwpHoxnwZMpsIVmC3OgbiLL1GifVfEXv3sJ4ARIZsEQH+vlv+3yaAgWuDfRmWQ
 IWFT/cM5WPvUfuXugfMfZUqQ4YKEkkQOmx3EndbPnLqD2D/X3Wy5pl5vKcWmASQFVSM1
 BKQ2AItoT/gthBtowngj1yEsf3Bk//an/Q9rArG31Pw6XmZ2tbyqw1tdUnBlSJrL7zN0
 3vXZaZ+jVtM9ww7qprDjYLTj8RMa4m6ad7Wmi7nf1WYZZ3P7O3zcUijawAA267xIlB4a
 TceSZinjI7Itnadd53woYH2+Isc+eTT/weZqwpLrdz7BBsw+yww+jpXWQUgtNtfVIptk
 tSNg==
X-Gm-Message-State: AFqh2koDnv12SbM91iH9MNbF7H6WwYZoIAqMHaz4UREP2BYoBbva6r7n
 mxASMM17u5GZy9n+2nvtgJxAeTSiwQNuTdpX4jY=
X-Google-Smtp-Source: AMrXdXstIgNzdQgI3/6hSZDBoyiJuQjlPg2Gg27UxT0LU9XRTyHWW6+xLQCfmjbnGC32tqDzo/9KK4G23EVRroTNvB0=
X-Received: by 2002:a17:906:5798:b0:7c0:dcb3:718b with SMTP id
 k24-20020a170906579800b007c0dcb3718bmr4319696ejq.711.1673416516021; Tue, 10
 Jan 2023 21:55:16 -0800 (PST)
MIME-Version: 1.0
References: <20230110201405.247785-1-dbarboza@ventanamicro.com>
 <20230110201405.247785-2-dbarboza@ventanamicro.com>
In-Reply-To: <20230110201405.247785-2-dbarboza@ventanamicro.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 11 Jan 2023 13:55:04 +0800
Message-ID: <CAEUhbmV6mPbtY=aQECUjj9b0bcQV4vYi1GxLc4xdzcX_Lo8Yww@mail.gmail.com>
Subject: Re: [PATCH 1/2] target/riscv/cpu: set cpu->cfg in register_cpu_props()
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 richard.henderson@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ej1-x633.google.com
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
X-List-Received-Date: Wed, 11 Jan 2023 05:55:22 -0000

On Wed, Jan 11, 2023 at 4:17 AM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> There is an informal contract between the cpu_init() functions and
> riscv_cpu_realize(): if cpu->env.misa_ext is zero, assume that the
> default settings were loaded via register_cpu_props() and do validations
> to set env.misa_ext.  If it's not zero, skip this whole process and
> assume that the board somehow did everything.
>
> At this moment, all SiFive CPUs are setting a non-zero misa_ext during
> their cpu_init() and skipping a good chunk of riscv_cpu_realize().
> This causes problems when the code being skipped in riscv_cpu_realize()
> contains fixes or assumptions that affects all CPUs, meaning that SiFive
> CPUs are missing out.
>
> To allow this code to not be skipped anymore, all the cpu->cfg.ext_* attributes
> needs to be set during cpu_init() time. At this moment this is being done in
> register_cpu_props(). The SiFive oards are setting their own extensions during

The SiFive boards

> cpu_init() though, meaning that they don't want all the defaults from
> register_cpu_props().
>
> Let's move the contract between *_cpu_init() and riscv_cpu_realize() to
> register_cpu_props(). Inside this function we'll check if cpu->env.misa_ext
> was set and, if that's the case, set all relevant cpu->cfg.ext_*
> attributes, and only that. Leave the 'misa_ext' = 0 case as is today,
> i.e. loading all the defaults from riscv_cpu_extensions[].
>
> register_cpu_props() can then be called by all the cpu_init() functions,
> including the SiFive ones. This will make all CPUs behave more in line
> with that riscv_cpu_realize() expects.

with what

>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>  target/riscv/cpu.c | 40 ++++++++++++++++++++++++++++++++++++++++
>  target/riscv/cpu.h |  4 ++++
>  2 files changed, 44 insertions(+)
>

Regards,
Bin

