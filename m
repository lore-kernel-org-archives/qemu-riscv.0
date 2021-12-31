Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n37HW-00068Z-9U
	for mharc-qemu-riscv@gnu.org; Thu, 30 Dec 2021 21:04:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1n37HU-00067r-Jx; Thu, 30 Dec 2021 21:04:32 -0500
Received: from [2607:f8b0:4864:20::b2b] (port=43939
 helo=mail-yb1-xb2b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1n37HS-0003pF-4p; Thu, 30 Dec 2021 21:04:32 -0500
Received: by mail-yb1-xb2b.google.com with SMTP id p15so26617672ybk.10;
 Thu, 30 Dec 2021 18:04:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nngEwWeuCRssM0AjgwwBlIEbRZVGPqsZVmDheUywhHw=;
 b=UvZbuh6gSiK5fm04E4EHGD2P+AKpyjn4Sqf3+D6+qNT100Bw490z/mqbygd+Nih3Lv
 uMkhp4lEvK7jwXIf4UD244gr68B8b2wJo9v7CWBzkwfXMisdIZcD1dmrn4uCfYA2WPdL
 8wlfm2GDpA549DmGvLGrQKNzfBW7PtMTnjUBFafX5VV/Rqyejh7ahRS3KUahE5CdFYt2
 Fy9zHYr3G+xxL50za0StPANuAAUewk5UIaNAFZ4sCIRVx7MUYqxN2ZIe+WGu6US5uq8i
 x0cXqWvmG5eTN6nB6/kSS8Pwhxe7EicIBJzydZA/boe22Qx7j3mNGlUvD2PMK3E/Aal6
 6a1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nngEwWeuCRssM0AjgwwBlIEbRZVGPqsZVmDheUywhHw=;
 b=bG1EWH4bKCQFqo/vzD3xonvSiZuXntJ7agX/bBYtF0xL/wFu+bchVuQBAUJ9Ujc6iB
 XjLmiTy7liQGdyxydnt36fBh0SwHT2FeocZ5i35g1YhIeQDK4iXjc5u1EUaQ9Bu3v5ST
 Nx9flDT13/6crs8cDfgvlB0fq+Y745k6xVMnLbY9gUbc85mCxG4xxsE/LqclL9OpkCjd
 qNc3b0aN5sxlUoS2XCViDrQ6jZ3haCGTG9zfk0kDWnlhJzZrMdBASqDJZ9vIHqFQgoWI
 dPUJTYrlvkTcADqC0VFAVSjrQ0sFp4j0yon9r3XBX1Mj3qaKLwCt/+OBWoYUxodFFaQJ
 1CGw==
X-Gm-Message-State: AOAM532OQ+cWdaDPMdt4OJcSxL3un03KhZXJecbsbGy62JIHo5NlO0Qa
 aHbnByiTC0YWOZGmmB5GV1ka40rJYc30kJEYRAI=
X-Google-Smtp-Source: ABdhPJwrgVxlH69vsIa2vRUHQz+pA0UFqs3SXxVe7iHSZv8ureLpqAvqXA4Ec2/N6QHFaLhlG3Xh0rEfnyIBC1oxDBk=
X-Received: by 2002:a25:3748:: with SMTP id e69mr36035718yba.378.1640916268238; 
 Thu, 30 Dec 2021 18:04:28 -0800 (PST)
MIME-Version: 1.0
References: <20211230143058.7352-1-liweiwei@iscas.ac.cn>
 <20211230143058.7352-2-liweiwei@iscas.ac.cn>
In-Reply-To: <20211230143058.7352-2-liweiwei@iscas.ac.cn>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 31 Dec 2021 10:04:17 +0800
Message-ID: <CAEUhbmWjnGxJ2DtrQkEVD+JAXgivPDAbwoSf+y4up6dDcvjNgQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/7] target/riscv: rvk: add cfg properties for zbk* and
 zk*
To: liweiwei <liweiwei@iscas.ac.cn>
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 wangjunqiang <wangjunqiang@iscas.ac.cn>, lazyparser@gmail.com, 
 luruibo2000@163.com, lustrew@foxmail.com
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b2b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2b;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2b.google.com
X-Spam_score_int: 6
X-Spam_score: 0.6
X-Spam_bar: /
X-Spam_report: (0.6 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Fri, 31 Dec 2021 02:04:32 -0000

On Thu, Dec 30, 2021 at 10:32 PM liweiwei <liweiwei@iscas.ac.cn> wrote:
>
> Signed-off-by: liweiwei <liweiwei@iscas.ac.cn>
> Signed-off-by: wangjunqiang <wangjunqiang@iscas.ac.cn>

nits: looks like the best practice of the name is:

Weiwei Li and Junqiang Wang

> Acked-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  target/riscv/cpu.c | 23 +++++++++++++++++++++++
>  target/riscv/cpu.h | 13 +++++++++++++
>  2 files changed, 36 insertions(+)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 6ef3314bce..961c5f4334 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -491,6 +491,29 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
>              cpu->cfg.ext_d = true;
>          }
>
> +        if (cpu->cfg.ext_zk) {
> +            cpu->cfg.ext_zkn = true;
> +            cpu->cfg.ext_zkr = true;
> +            cpu->cfg.ext_zkt = true;
> +        }
> +
> +        if (cpu->cfg.ext_zkn) {
> +            cpu->cfg.ext_zbkb = true;
> +            cpu->cfg.ext_zbkc = true;
> +            cpu->cfg.ext_zbkx = true;
> +            cpu->cfg.ext_zkne = true;
> +            cpu->cfg.ext_zknd = true;
> +            cpu->cfg.ext_zknh = true;
> +        }
> +
> +        if (cpu->cfg.ext_zks) {
> +            cpu->cfg.ext_zbkb = true;
> +            cpu->cfg.ext_zbkc = true;
> +            cpu->cfg.ext_zbkx = true;
> +            cpu->cfg.ext_zksed = true;
> +            cpu->cfg.ext_zksh = true;
> +        }
> +
>          /* Set the ISA extensions, checks should have happened above */
>          if (cpu->cfg.ext_i) {
>              ext |= RVI;
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index dc10f27093..edca7118ff 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -311,7 +311,20 @@ struct RISCVCPU {
>          bool ext_zba;
>          bool ext_zbb;
>          bool ext_zbc;
> +        bool ext_zbkb;
> +        bool ext_zbkc;
> +        bool ext_zbkx;
>          bool ext_zbs;
> +        bool ext_zk;
> +        bool ext_zkn;
> +        bool ext_zknd;
> +        bool ext_zkne;
> +        bool ext_zknh;
> +        bool ext_zkr;
> +        bool ext_zks;
> +        bool ext_zksed;
> +        bool ext_zksh;
> +        bool ext_zkt;
>          bool ext_counters;
>          bool ext_ifencei;
>          bool ext_icsr;
> --

Regards,
Bin

