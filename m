Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mxYeM-0001rs-SH
	for mharc-qemu-riscv@gnu.org; Wed, 15 Dec 2021 13:05:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@dabbelt.com>)
 id 1mxYeH-0001mH-PF
 for qemu-riscv@nongnu.org; Wed, 15 Dec 2021 13:05:08 -0500
Received: from [2607:f8b0:4864:20::536] (port=44938
 helo=mail-pg1-x536.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@dabbelt.com>)
 id 1mxYeF-0007y2-4G
 for qemu-riscv@nongnu.org; Wed, 15 Dec 2021 13:05:04 -0500
Received: by mail-pg1-x536.google.com with SMTP id m15so20752509pgu.11
 for <qemu-riscv@nongnu.org>; Wed, 15 Dec 2021 10:05:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=6kja0dZP9tL0RadBn02ozF30ert+UBet/AkjuZ9pgrU=;
 b=24hR7ty3KvfwkjSDCo9uhKhCV7Uo/OEeK+xruDrudAYAvR5i6dJY3IA1qqq6pb6Dvj
 dAZyb0qdthVhpeyAUISX7JCiLi7XzEW+kalfKjobq9/ISXqRGkRYqd4vzoBuh5BJ3pNU
 VWfbK6fEC8foXcZAT73hyUR2UwqcXtcATk4R6TYKChrxzwmdsMSGkDFQJfuoJsm2c290
 qHai8eI7J3HKIv8id9cN7dqfubarYM7fTDsIvUu7K7jOQh/Uwnd7aoruq6WFSRBvNMp/
 8NedtwClhhTfRPeQdD5TYwOpgo80h8wgA3pCulj6eobhML+8WoJ1wmBY/K88WxohAzro
 P8vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=6kja0dZP9tL0RadBn02ozF30ert+UBet/AkjuZ9pgrU=;
 b=ImdpC1Q5mYeHSKztwv01RIKeh3toNkisdVOV9vV3n5UTBBaKUd3e9JlaleQxGVZ5g1
 TP7IoQs936j1Tij+5SWg6CEwjHvTGYxPEizAe2UNGCjwroCCJTghRhK4+5BwpneuFDWI
 wO9GfcJWQah5Z58QuDFsXdd5GH1rcAr2s1JEEgCIp/Qqd3N7IP5y/QEPGkOxzni49/CY
 e4SyNkiUtaH56BI+pLUbOKstVTzU6M8n1ZyfIq5gxaLbreA61QSirLpc4HeBJlOWrd3m
 TcZspnocMdcUinI5ncg9mSGRfTNyJSn8F85F2cACKk7zD3MUfxq8Hr7PiQ7v+uA7OFDx
 2wfQ==
X-Gm-Message-State: AOAM530qsFFerFLprspx1+58ZFfg3rMRbXygVjh6SbuBAerOwEoY26d1
 CvCDc8eTMvUEHlDWBkkxZW/ybgp9sByEvg==
X-Google-Smtp-Source: ABdhPJzga0WqWY/lCyjWyLgr6MFK+YlhQW+ucNUnuEdQnl6guxHXkWIa27aIPVj+Av397HRmw7qPTA==
X-Received: by 2002:a63:1564:: with SMTP id 36mr8415058pgv.324.1639591499842; 
 Wed, 15 Dec 2021 10:04:59 -0800 (PST)
Received: from localhost ([12.163.77.120])
 by smtp.gmail.com with ESMTPSA id g19sm2872937pgi.10.2021.12.15.10.04.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Dec 2021 10:04:59 -0800 (PST)
Date: Wed, 15 Dec 2021 10:04:59 -0800 (PST)
X-Google-Original-Date: Wed, 15 Dec 2021 10:04:47 PST (-0800)
Subject: Re: [PATCH] riscv: Set 5.4 as minimum kernel version for riscv32
In-Reply-To: <20211215172608.1625941-1-raj.khem@gmail.com>
CC: qemu-riscv@nongnu.org, Khem Raj <raj.khem@gmail.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, bin.meng@windriver.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <mhng-65f14cf7-b8bd-4ee3-a4f8-5f288cab7c30@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::536
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=palmer@dabbelt.com; helo=mail-pg1-x536.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Wed, 15 Dec 2021 18:05:09 -0000

On Wed, 15 Dec 2021 09:26:08 PST (-0800), Khem Raj wrote:
> 5.4 is first stable API as far as rv32 is concerned see [1]
>
> [1] https://sourceware.org/git/?p=glibc.git;a=commit;h=7a55dd3fb6d2c307a002a16776be84310b9c8989
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Cc: Alistair Francis <alistair.francis@wdc.com>
> Cc: Bin Meng <bin.meng@windriver.com>
> ---
>  linux-user/riscv/target_syscall.h | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/linux-user/riscv/target_syscall.h b/linux-user/riscv/target_syscall.h
> index dc597c8972..9b13161324 100644
> --- a/linux-user/riscv/target_syscall.h
> +++ b/linux-user/riscv/target_syscall.h
> @@ -45,10 +45,11 @@ struct target_pt_regs {
>
>  #ifdef TARGET_RISCV32
>  #define UNAME_MACHINE "riscv32"
> +#define UNAME_MINIMUM_RELEASE "5.4.0"
>  #else
>  #define UNAME_MACHINE "riscv64"
> -#endif
>  #define UNAME_MINIMUM_RELEASE "4.15.0"
> +#endif
>
>  #define TARGET_MINSIGSTKSZ 2048
>  #define TARGET_MCL_CURRENT 1

Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>

Thanks!

