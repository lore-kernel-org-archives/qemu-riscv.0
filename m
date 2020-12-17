Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kpx25-0002QY-CP
	for mharc-qemu-riscv@gnu.org; Thu, 17 Dec 2020 12:25:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@dabbelt.com>)
 id 1kpx1y-0002O4-EJ
 for qemu-riscv@nongnu.org; Thu, 17 Dec 2020 12:25:36 -0500
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:38996)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@dabbelt.com>)
 id 1kpx1v-0007d6-C2
 for qemu-riscv@nongnu.org; Thu, 17 Dec 2020 12:25:34 -0500
Received: by mail-pj1-x102c.google.com with SMTP id hk16so4494823pjb.4
 for <qemu-riscv@nongnu.org>; Thu, 17 Dec 2020 09:25:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=E4FnEq0N6E9+/yf/onWrHYhBr5rr/hsxLviV2xg3oak=;
 b=Q0Wud+5fLdVDI5eZnB5KG6GGQDLj5SkapMCgzQEMPjvow6PHujLP2Do2j4LeLqZ66z
 HwjCqBBhPJcuyrEmrIMpUQBpM+IsP4XnRYzp8xsLPdhRr0r4CWr5CochBg/ZKBewMydl
 QgJNobaVwZQq7GS0d+la7GwQ0yiw3Qp+BaMfkBY2E/Z4hCseltlHE7AwHkCeRBi9t2Gh
 Cdh4F5fGFQAba9HR14neqwsQimCWd/C4SVJWhNzEHxQ3SqtRIsdrm504MTVwC+vUp0MB
 K8vZ9umTe41d2wrkk3B+OIYvDa1Yvetry+uvRwCseAAdDO1cNe8ESAsmHfj/bd9ENulN
 jxWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=E4FnEq0N6E9+/yf/onWrHYhBr5rr/hsxLviV2xg3oak=;
 b=hgB2fGX3fD+rNJMM93Gl5aj5S5aUPl06Dp/xM3gENnEi7Eb29K9aLqzZBJ4IvcQJu3
 r9Li+qXANRby2i5uqfwaFg8ZMW4ZpYIPNammkEvz8ruBSgM6Cqp+4bNCtN6Tj9Po6jjL
 bJvFjdl96hEi+zDh86KiKAgrOpWOK1lPgdPvNpswGOTxWdW7/NHbKmHFmFltOS5UBqmi
 rtsXMSjXmEx8uSOU8QLUCn4JcIOAlGEtztDzNY689rd+FQ5ZcWRk195PhKaTGizeAHI9
 DELrOxMgnVIt1INZ17Ts8YQjmO/yIjSR6y+jtl66nJz4IrcOLoiEX57mlbRldnU1xyC2
 S23g==
X-Gm-Message-State: AOAM532CutqPPZcYQGTZgjrpjIolY9C+WvkGwiNY8OBDt8wgneKYl9wE
 x3R5XLElq8dO7UcBi/UA/eOemQ==
X-Google-Smtp-Source: ABdhPJykDwJNWd/eHP7jwwGbKe2w6eZEdY0mNvQEL6UgbhvbAoM5c/bOoNznbJXwXF9j8qkxuXY9XA==
X-Received: by 2002:a17:902:9b97:b029:da:4299:2214 with SMTP id
 y23-20020a1709029b97b02900da42992214mr228501plp.37.1608225927493; 
 Thu, 17 Dec 2020 09:25:27 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id g17sm2514980pgg.78.2020.12.17.09.25.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Dec 2020 09:25:26 -0800 (PST)
Date: Thu, 17 Dec 2020 09:25:26 -0800 (PST)
X-Google-Original-Date: Thu, 17 Dec 2020 09:25:25 PST (-0800)
Subject: Re: [PATCH v4 16/16] hw/riscv: Use the CPU to determine if 32-bit
In-Reply-To: <7d2b4053-dbca-faf8-04b2-8da0aab70f29@linaro.org>
CC: bmeng.cn@gmail.com, Alistair Francis <Alistair.Francis@wdc.com>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org, alistair23@gmail.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: richard.henderson@linaro.org
Message-ID: <mhng-18cffb57-6f85-430d-aa0e-bf19e4698c9a@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=palmer@dabbelt.com; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
X-List-Received-Date: Thu, 17 Dec 2020 17:25:37 -0000

On Thu, 17 Dec 2020 05:58:11 PST (-0800), richard.henderson@linaro.org wrote:
> On 12/17/20 12:44 AM, Bin Meng wrote:
>> What happens if something like ARM big.LITTLE needs to be supported on RISC-V?
>
> I'd say it's the board's job to pass the boot heart.
> (Though even big.LITTLE doesn't mix 64 and 32-bit cores.)

I guess we can't stop people from building crazy things, but it does seem like
building a system that mixes up base ISAs is unlikely.  IDK if 32-bit
compatibility on 64-bit systems is ever going to be important enough to show up
on RISC-V, as 32-bit might be defunct in portable systems by the point real
RISC-V systems are availiable, but one could imagine systems where only a
subset of cores have 32-bit compatibility.  My guess is that they'd all boot
into 64-bit mode, though, so that sort of stuff won't be relevant until one
tries to get to 32-bit code.

Regardless of where that sort of thing goes, it seems reasonable to just ban
people from spinning up mixed machine XLEN systems in QEMU for the time being.
IIUC that's always been impossible (as it was a #define before), so it's not
like we're regressing on any functionality with that constraint.

Other hetergenous ISA/microarctucture stuff seems reasonable to support in
QEMU, but also not a high priority.  It doesn't seem that hard to write the
early boot stuff in a way such that it only depends on the base ISA -- that's
essentially how we're handling stuff like F/D in Linux, you just either probe
or handle the traps.  There's already some simple hetergenous stuff floating
around (like the non-MMU cores in the SiFive designs) and that all seems to
work fine so my guess is we have enough stuff there, but I'm sure there'll be
more work do to as more complicated designs start to show up (doubly so as
there's no specs for any of this).

