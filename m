Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ixB81-0007sT-UQ
	for mharc-qemu-riscv@gnu.org; Thu, 30 Jan 2020 09:49:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43181)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmerdabbelt@google.com>) id 1ixB7y-0007qu-HI
 for qemu-riscv@nongnu.org; Thu, 30 Jan 2020 09:49:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmerdabbelt@google.com>) id 1ixB7x-000081-E7
 for qemu-riscv@nongnu.org; Thu, 30 Jan 2020 09:49:06 -0500
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:53437)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmerdabbelt@google.com>)
 id 1ixB7x-000053-3p
 for qemu-riscv@nongnu.org; Thu, 30 Jan 2020 09:49:05 -0500
Received: by mail-wm1-x341.google.com with SMTP id s10so4058157wmh.3
 for <qemu-riscv@nongnu.org>; Thu, 30 Jan 2020 06:49:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:subject:cc:to:in-reply-to:references:message-id
 :mime-version:content-transfer-encoding;
 bh=kMhzUeveepxyKpMH/W5N9hLcHtE1Kufs05P0GwzNzjg=;
 b=D4aDVhnU7rNI654tnzgAVsQyMAeC95Mp0Kbce4byIr7DJkB0LdABPR54CuMnni2xE8
 MuJTkLCr1kjLuwGraUWDhIB7Jd2pNRFQRmgkJtyJi9UCCyFO0L54kEliqx9ir1+HFG9b
 egGJqT0FjUZdAweMBbBd+fcCSjffXdaRi76f3RTobHAIcWJv6Kb94X7RT5Bwb+xDnDyf
 4d0q+Ss2eoj0T7cTfwnGAsF3udC2SB+ODDWRF3LBqq2L7XMVup1lJUR0IXPH9dIxJpem
 oJPBmD6cHXzRCr9YQmM01/v3Lwy9zj/Bs16EnRtUuk5v2fgLsGwziicWv95dHKKiCpB1
 vIdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:cc:to:in-reply-to:references
 :message-id:mime-version:content-transfer-encoding;
 bh=kMhzUeveepxyKpMH/W5N9hLcHtE1Kufs05P0GwzNzjg=;
 b=tyVQg/PUn26IC0r5J5XY0a/zNluq9/j92+N02EaDj4DCBum+d269f+Sn6bghnzH2C7
 sdt21j8mIOmVeko5ySoVNHsqAl0MDd9x/Me363EXhXPHlrUxcEeFYzFh527hwY7OR/Lb
 LZwp4SD5adxVuFCJJ7sU12HkcwfyNLKkuCJQoz8k+039oAM6ns/mPWCkU2G1iYM4CAS9
 WXew9fl0QuAgKrxpPfOD461YXhZnnLXgk9nD0hkukDSmgx5W+y5a6LBgNSOar9mYDeGv
 BRYRUtn+2MoARnb8n520eLjXbQvdXKxVA97rvDOz9cQmswfppewPNjiwf8vAOkxItsJX
 pOWQ==
X-Gm-Message-State: APjAAAWl7M4ilEquSnlnYGfdMa+t9lbIqQgvE/ilhp7i8273VpnY7uqn
 Bfb31j8R7FqnX3hMFx6e4z85kbfwYQE=
X-Google-Smtp-Source: APXvYqz3pbtbmnh3zLbqBhiOVAzAQ0es6y98s5yLzt0PtLvFq8OjVsIu+vAAlMcC/b3PQJAADjlVxQ==
X-Received: by 2002:a05:600c:146:: with SMTP id
 w6mr6429232wmm.180.1580395743781; 
 Thu, 30 Jan 2020 06:49:03 -0800 (PST)
Received: from localhost ([2a00:79e0:d:11:1da2:3fd4:a302:4fff])
 by smtp.gmail.com with ESMTPSA id s16sm7814666wrn.78.2020.01.30.06.49.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Jan 2020 06:49:03 -0800 (PST)
Date: Thu, 30 Jan 2020 06:49:03 -0800 (PST)
X-Google-Original-Date: Thu, 30 Jan 2020 14:48:47 GMT (+0000)
From: Palmer Dabbelt <palmerdabbelt@google.com>
X-Google-Original-From: Palmer Dabbelt <palmer@dabbelt.com>
Subject: Re: [PATCH v2 2/2] hw/riscv: Provide rdtime callback for TCG in CLINT
 emulation
CC: Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <Alistair.Francis@wdc.com>, sagark@eecs.berkeley.edu,
 Atish Patra <Atish.Patra@wdc.com>, 
 anup@brainfault.org, qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Anup Patel <Anup.Patel@wdc.com>
To: Anup Patel <Anup.Patel@wdc.com>
In-Reply-To: <20200122112952.94284-3-anup.patel@wdc.com>
References: <20200122112952.94284-3-anup.patel@wdc.com>
 <20200122112952.94284-1-anup.patel@wdc.com>
Message-ID: <mhng-89da94b9-64c1-43e7-ae24-5a21ffc6d695@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::341
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 30 Jan 2020 14:49:08 -0000

On Wed, 22 Jan 2020 11:30:36 GMT (+0000), Anup Patel wrote:
> This patch extends CLINT emulation to provide rdtime callback for
> TCG. This rdtime callback will be called wheneven TIME CSRs are
> read in privileged modes.
>
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  hw/riscv/sifive_clint.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/hw/riscv/sifive_clint.c b/hw/riscv/sifive_clint.c
> index e5a8f75cee..805503dc27 100644
> --- a/hw/riscv/sifive_clint.c
> +++ b/hw/riscv/sifive_clint.c
> @@ -236,6 +236,7 @@ DeviceState *sifive_clint_create(hwaddr addr, hwaddr size, uint32_t num_harts,
>          if (!env) {
>              continue;
>          }
> +        riscv_cpu_set_rdtime_fn(env, cpu_riscv_read_rtc);
>          env->timer = timer_new_ns(QEMU_CLOCK_VIRTUAL,
>                                    &sifive_clint_timer_cb, cpu);
>          env->timecmp = 0;
> -- 
> 2.17.1

Can you make this optional?  Ideally via a command-line argument, but at a
minimum as via the board configuration files.  As it stands this will enable
the direct rdtime implemnetation everywhere, and while that's sensible for the
virt board I'd prefer to avoid changing the behavior of the sifive_u board in
ways that differ from the hardware when that's easy.

