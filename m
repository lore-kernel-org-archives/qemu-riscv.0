Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mxjhS-0000Si-4t
	for mharc-qemu-riscv@gnu.org; Thu, 16 Dec 2021 00:53:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1mxjhM-0000R1-1h
 for qemu-riscv@nongnu.org; Thu, 16 Dec 2021 00:53:00 -0500
Received: from [2a00:1450:4864:20::429] (port=43762
 helo=mail-wr1-x429.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1mxjhG-0000Le-0q
 for qemu-riscv@nongnu.org; Thu, 16 Dec 2021 00:52:59 -0500
Received: by mail-wr1-x429.google.com with SMTP id v11so41994372wrw.10
 for <qemu-riscv@nongnu.org>; Wed, 15 Dec 2021 21:52:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xC95yJ7UUM7RdK60Vqzw9JlQSm9Ehd59F5//i8iBgas=;
 b=UGfy7F5KDCgK7IPvxR1Slc2TMT+9ySP6u1aSHTkoAIH/rS7k5M2T/9sV2oDcw+G+2L
 6Skk6JbNAAMNt7eSqlnXbVFipCI0Wl14TneniQGOtgvao1HEgFvQ8QeH6XisNMeCFJ94
 KZolh3x/bhGw0gGVVVnPFJz3nwhGCDZR7WHblqPqSmXKigVoWaZngtgbh2FGUkdn0r+q
 pQv2l/CKxpFUV/5v8RvNAZBYY7Z4B572gUAML9kDb995YkKdSQNLmGbRKWqO30RG5Dqq
 9wgRc0F6yBnPkmbHGzM7+JjnBTyhj0Vvm1uVh5vLALFpztjlt5w76wKy+J35bAIOyuvK
 ralQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xC95yJ7UUM7RdK60Vqzw9JlQSm9Ehd59F5//i8iBgas=;
 b=Xo5UJiF46g6cdX0oZrX6XvOGVhbs+RCxW277u5Siv43JVIoc4ftoLHuvvqVvRW3yEN
 IJpV3T+s3diF0CGSH20mctvfN12oqTW9ZrdiA/xTRoWDdkZEe+ApsRleG9dL0OBD0ulg
 Dke3fOs4TnKyCSM8vv5BuTrok6aA/jAm8g64DH3GOMu2ZQhSJWxLgKssbdG0t2xbkc+/
 R+VFw3BPQXtHV8fXnu6ocQeKByNwtE2w+ylgx81cb2o1BDaPL4xX02xIsvVEii1P6p4E
 56EDObavIfLjHu01U/snyFXxTQX1rlTa9XK/+c8LfHXpLJIIxiZupZDjxevVEImmrX3+
 MB7A==
X-Gm-Message-State: AOAM5322Q8Q9dIVXwi66zvCfSOQcwH71t8GyKHZOvrLxqdLoy0Dxa8Ru
 5jUvK9GOL8DCrs9gLK36uNMjfedXjvUgk+t8k6+8Tw==
X-Google-Smtp-Source: ABdhPJzGX7kMnNe5GijlUUbmtqZKNEm1QO3jkS4ToxAAM0JeDGvN8Wan/zPr7pxZ6T3egVuGHxZQIK3KImhPMWnZOT4=
X-Received: by 2002:adf:f402:: with SMTP id g2mr5327454wro.313.1639633972534; 
 Wed, 15 Dec 2021 21:52:52 -0800 (PST)
MIME-Version: 1.0
References: <20211216045427.757779-1-alistair.francis@opensource.wdc.com>
 <20211216045427.757779-7-alistair.francis@opensource.wdc.com>
In-Reply-To: <20211216045427.757779-7-alistair.francis@opensource.wdc.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 16 Dec 2021 11:22:41 +0530
Message-ID: <CAAhSdy1AR+ZkZ1_TEaC_Haj3Kea0GbEfA2NHgZR3mo2-SEnqKQ@mail.gmail.com>
Subject: Re: [PATCH v2 6/9] target/riscv: Enable the Hypervisor extension by
 default
To: Alistair Francis <alistair.francis@opensource.wdc.com>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>, 
 Bin Meng <bin.meng@windriver.com>, Alistair Francis <alistair23@gmail.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::429
 (failed)
Received-SPF: none client-ip=2a00:1450:4864:20::429;
 envelope-from=anup@brainfault.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Thu, 16 Dec 2021 05:53:02 -0000

On Thu, Dec 16, 2021 at 10:29 AM Alistair Francis
<alistair.francis@opensource.wdc.com> wrote:
>
> From: Alistair Francis <alistair.francis@wdc.com>
>
> Let's enable the Hypervisor extension by default. This doesn't affect
> named CPUs (such as lowrisc-ibex or sifive-u54) but does enable the
> Hypervisor extensions by default for the virt machine.
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>

Looks good to me.

Reviewed-by: Anup Patel <anup.patel@wdc.com>

Regards,
Anup
> ---
>  target/riscv/cpu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 1edb2771b4..013a8760b5 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -626,7 +626,7 @@ static Property riscv_cpu_properties[] = {
>      DEFINE_PROP_BOOL("c", RISCVCPU, cfg.ext_c, true),
>      DEFINE_PROP_BOOL("s", RISCVCPU, cfg.ext_s, true),
>      DEFINE_PROP_BOOL("u", RISCVCPU, cfg.ext_u, true),
> -    DEFINE_PROP_BOOL("h", RISCVCPU, cfg.ext_h, false),
> +    DEFINE_PROP_BOOL("h", RISCVCPU, cfg.ext_h, true),
>      DEFINE_PROP_BOOL("Counters", RISCVCPU, cfg.ext_counters, true),
>      DEFINE_PROP_BOOL("Zifencei", RISCVCPU, cfg.ext_ifencei, true),
>      DEFINE_PROP_BOOL("Zicsr", RISCVCPU, cfg.ext_icsr, true),
> --
> 2.31.1
>
>

