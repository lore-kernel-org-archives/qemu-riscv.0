Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n6olq-0003OR-QE
	for mharc-qemu-riscv@gnu.org; Mon, 10 Jan 2022 02:07:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1n6oln-0003Ms-1N; Mon, 10 Jan 2022 02:07:07 -0500
Received: from [2607:f8b0:4864:20::131] (port=46789
 helo=mail-il1-x131.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1n6olk-0000dj-RB; Mon, 10 Jan 2022 02:07:06 -0500
Received: by mail-il1-x131.google.com with SMTP id e8so10483075ilm.13;
 Sun, 09 Jan 2022 23:07:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xWCsIeCQ96DK83ZyOKOYT+8jbe6iWy0GENTgWB34NNA=;
 b=Aamir/CUxK+ecpFlnXlqmaXRmGQRGg6/qmXxY1snlS9hIMMiI9trwovqoBm11i5Ec/
 klTKkMLfSzpFhHLfrnHTvUQfknXxnqzOWhrFFORJaQuZ7Z7HA0XCe0KASX6pDCKSvmst
 kwAyvDn/inKCdbF0MKn9L5vxNeiefusdVSpM+xJGZt/M9YUP58Xc+vWIBMvdHdySkdGk
 6f0ENYfid43T0zg4rTgfpYmNIG7UOAfyXJtXojI0pj6Kp/k1GkRu47g9y3tjPDV0TvDN
 i/VkUQ8PpIOF98KRtyr8ZYbzMk0lQm+SqgzQLqHUXqQE1Kx5iGmwZfdRBqPzzliLhfX7
 HcGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xWCsIeCQ96DK83ZyOKOYT+8jbe6iWy0GENTgWB34NNA=;
 b=7YI0FUv0MVcacbV3IVS4Z+pC/T4Ubx7Gx4FxfrSCvV9ifyf7EbF+9cTgxQq3syGRFE
 flWjKWzp9+HWR0iG886LcBxFIIj2Eb72IDcqa8rQIDo8DolmSkjtanJw4yjfE1T6UUq+
 iaVZISmt0Ez8rdqj8RjHKNT2uS5nqDdEVe4naJcl9ZJQyvSi3VaYIhV9ydbYUlcODNPF
 IW61x0QtO/7AnngJF/4v3JXCcx0YOVjJ0Wrd8wPAcUuirU/alWiPYa5eymg2pGRKApim
 9j/Nk8g48ywLVsHnH9xFwCspp/rfqXMhOEso04Wbh60D/RSk9WGFEYH1HtTaDbOE8pmh
 BZ4g==
X-Gm-Message-State: AOAM532dlhl5E92rBFIiCb0ZhdqUgibK9y/csyAiFwUHnJWPFptGJ32p
 lSsbBrAfzOXyiOXHB+lQddH4Vt2RGmbDdXnF2W0=
X-Google-Smtp-Source: ABdhPJz+A24XEy8NvcJbyyqA7mORRpH5Lyep6FAIzj/zUo3pO1ayKzoVl3hFcHJevJNBwzKr1H7YwMudnHEet23N+WY=
X-Received: by 2002:a05:6e02:1806:: with SMTP id
 a6mr32190262ilv.221.1641798423479; 
 Sun, 09 Jan 2022 23:07:03 -0800 (PST)
MIME-Version: 1.0
References: <20211230143058.7352-1-liweiwei@iscas.ac.cn>
 <20211230143058.7352-8-liweiwei@iscas.ac.cn>
In-Reply-To: <20211230143058.7352-8-liweiwei@iscas.ac.cn>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 10 Jan 2022 17:06:37 +1000
Message-ID: <CAKmqyKOQ081MRKveGu6LyAdcZYsPbv5NwWUiu8wptfkFuNCsLw@mail.gmail.com>
Subject: Re: [PATCH v3 7/7] target/riscv: rvk: expose zbk* and zk* properties
To: liweiwei <liweiwei@iscas.ac.cn>
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 wangjunqiang <wangjunqiang@iscas.ac.cn>, lazyparser@gmail.com, 
 luruibo2000@163.com, lustrew@foxmail.com
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::131
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::131;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x131.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Mon, 10 Jan 2022 07:07:09 -0000

On Fri, Dec 31, 2021 at 12:32 AM liweiwei <liweiwei@iscas.ac.cn> wrote:
>
> Signed-off-by: liweiwei <liweiwei@iscas.ac.cn>
> Signed-off-by: wangjunqiang <wangjunqiang@iscas.ac.cn>
> ---
>  target/riscv/cpu.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 961c5f4334..6575ec8cfa 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -668,6 +668,19 @@ static Property riscv_cpu_properties[] = {
>      DEFINE_PROP_BOOL("zbb", RISCVCPU, cfg.ext_zbb, true),
>      DEFINE_PROP_BOOL("zbc", RISCVCPU, cfg.ext_zbc, true),
>      DEFINE_PROP_BOOL("zbs", RISCVCPU, cfg.ext_zbs, true),
> +    DEFINE_PROP_BOOL("x-zbkb", RISCVCPU, cfg.ext_zbkb, false),
> +    DEFINE_PROP_BOOL("x-zbkc", RISCVCPU, cfg.ext_zbkc, false),
> +    DEFINE_PROP_BOOL("x-zbkx", RISCVCPU, cfg.ext_zbkx, false),
> +    DEFINE_PROP_BOOL("x-zk", RISCVCPU, cfg.ext_zk, false),
> +    DEFINE_PROP_BOOL("x-zkn", RISCVCPU, cfg.ext_zkn, false),
> +    DEFINE_PROP_BOOL("x-zknd", RISCVCPU, cfg.ext_zknd, false),
> +    DEFINE_PROP_BOOL("x-zkne", RISCVCPU, cfg.ext_zkne, false),
> +    DEFINE_PROP_BOOL("x-zknh", RISCVCPU, cfg.ext_zknh, false),
> +    DEFINE_PROP_BOOL("x-zkr", RISCVCPU, cfg.ext_zkr, false),
> +    DEFINE_PROP_BOOL("x-zks", RISCVCPU, cfg.ext_zks, false),
> +    DEFINE_PROP_BOOL("x-zksed", RISCVCPU, cfg.ext_zksed, false),
> +    DEFINE_PROP_BOOL("x-zksh", RISCVCPU, cfg.ext_zksh, false),
> +    DEFINE_PROP_BOOL("x-zkt", RISCVCPU, cfg.ext_zkt, false),

These are ratified specs, so these don't need to be marked as
experimental, you can drop the "x-".

Alistair

>      DEFINE_PROP_BOOL("x-h", RISCVCPU, cfg.ext_h, false),
>      DEFINE_PROP_BOOL("x-j", RISCVCPU, cfg.ext_j, false),
>      /* ePMP 0.9.3 */
> --
> 2.17.1
>
>

